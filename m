Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2E70310BE7
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Feb 2021 14:37:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230226AbhBENei (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 5 Feb 2021 08:34:38 -0500
Received: from mga09.intel.com ([134.134.136.24]:26783 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229986AbhBENcR (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 5 Feb 2021 08:32:17 -0500
IronPort-SDR: G9HSbYOHf+zjsiFuHRdL+Ci5DUgBv9+0ButCcvbE8HE3aOrG2gLQRT1BUQMSiBCGNFFXUkC8KV
 mITvep/RDx2g==
X-IronPort-AV: E=McAfee;i="6000,8403,9885"; a="181578728"
X-IronPort-AV: E=Sophos;i="5.81,154,1610438400"; 
   d="scan'208";a="181578728"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2021 05:25:01 -0800
IronPort-SDR: SVoxw9OfMZrC1wXygP9As+pPtInJSF7e03U1YzeFhiToz+fW9LiChSsdA7BMCqI6HNA7EralAs
 YfvjIXRMh0qg==
X-IronPort-AV: E=Sophos;i="5.81,154,1610438400"; 
   d="scan'208";a="357959766"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2021 05:24:58 -0800
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id B1680216F2;
        Fri,  5 Feb 2021 15:24:51 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1l816f-0005GX-G0; Fri, 05 Feb 2021 15:25:05 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rajmohan.mani@intel.com, Tomasz Figa <tfiga@chromium.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Hyungwoo Yang <hyungwoo.yang@intel.com>,
        linux-media@vger.kernel.org
Subject: [PATCH v10 7/7] at24: Support probing while off
Date:   Fri,  5 Feb 2021 15:25:05 +0200
Message-Id: <20210205132505.20173-8-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210205132505.20173-1-sakari.ailus@linux.intel.com>
References: <20210205132505.20173-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

In certain use cases (where the chip is part of a camera module, and the
camera module is wired together with a camera privacy LED), powering on
the device during probe is undesirable. Add support for the at24 to
execute probe while being powered off. For this to happen, a hint in form
of a device property is required from the firmware.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Tomasz Figa <tfiga@chromium.org>
---
 drivers/misc/eeprom/at24.c | 43 +++++++++++++++++++++++---------------
 1 file changed, 26 insertions(+), 17 deletions(-)

diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
index 926408b41270c..69a5e4023d9e1 100644
--- a/drivers/misc/eeprom/at24.c
+++ b/drivers/misc/eeprom/at24.c
@@ -595,6 +595,7 @@ static int at24_probe(struct i2c_client *client)
 	bool i2c_fn_i2c, i2c_fn_block;
 	unsigned int i, num_addresses;
 	struct at24_data *at24;
+	bool off_during_probe;
 	struct regmap *regmap;
 	bool writable;
 	u8 test_byte;
@@ -750,14 +751,16 @@ static int at24_probe(struct i2c_client *client)
 
 	i2c_set_clientdata(client, at24);
 
-	err = regulator_enable(at24->vcc_reg);
-	if (err) {
-		dev_err(dev, "Failed to enable vcc regulator\n");
-		return err;
-	}
+	off_during_probe = acpi_dev_state_low_power(&client->dev);
+	if (!off_during_probe) {
+		err = regulator_enable(at24->vcc_reg);
+		if (err) {
+			dev_err(dev, "Failed to enable vcc regulator\n");
+			return err;
+		}
 
-	/* enable runtime pm */
-	pm_runtime_set_active(dev);
+		pm_runtime_set_active(dev);
+	}
 	pm_runtime_enable(dev);
 
 	at24->nvmem = devm_nvmem_register(dev, &nvmem_config);
@@ -768,14 +771,17 @@ static int at24_probe(struct i2c_client *client)
 	}
 
 	/*
-	 * Perform a one-byte test read to verify that the
-	 * chip is functional.
+	 * Perform a one-byte test read to verify that the chip is functional,
+	 * unless powering on the device is to be avoided during probe (i.e.
+	 * it's powered off right now).
 	 */
-	err = at24_read(at24, 0, &test_byte, 1);
-	if (err) {
-		pm_runtime_disable(dev);
-		regulator_disable(at24->vcc_reg);
-		return -ENODEV;
+	if (!off_during_probe) {
+		err = at24_read(at24, 0, &test_byte, 1);
+		if (err) {
+			pm_runtime_disable(dev);
+			regulator_disable(at24->vcc_reg);
+			return -ENODEV;
+		}
 	}
 
 	pm_runtime_idle(dev);
@@ -795,9 +801,11 @@ static int at24_remove(struct i2c_client *client)
 	struct at24_data *at24 = i2c_get_clientdata(client);
 
 	pm_runtime_disable(&client->dev);
-	if (!pm_runtime_status_suspended(&client->dev))
-		regulator_disable(at24->vcc_reg);
-	pm_runtime_set_suspended(&client->dev);
+	if (!acpi_dev_state_low_power(&client->dev)) {
+		if (!pm_runtime_status_suspended(&client->dev))
+			regulator_disable(at24->vcc_reg);
+		pm_runtime_set_suspended(&client->dev);
+	}
 
 	return 0;
 }
@@ -834,6 +842,7 @@ static struct i2c_driver at24_driver = {
 	.probe_new = at24_probe,
 	.remove = at24_remove,
 	.id_table = at24_ids,
+	.flags = I2C_DRV_FL_ALLOW_LOW_POWER_PROBE,
 };
 
 static int __init at24_init(void)
-- 
2.20.1

