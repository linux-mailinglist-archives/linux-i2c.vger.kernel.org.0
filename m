Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59C9E432277
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Oct 2021 17:17:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232631AbhJRPTJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 Oct 2021 11:19:09 -0400
Received: from mga02.intel.com ([134.134.136.20]:64674 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232303AbhJRPTI (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 18 Oct 2021 11:19:08 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10141"; a="215435697"
X-IronPort-AV: E=Sophos;i="5.85,382,1624345200"; 
   d="scan'208";a="215435697"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2021 08:14:57 -0700
X-IronPort-AV: E=Sophos;i="5.85,382,1624345200"; 
   d="scan'208";a="566102855"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2021 08:14:53 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id BB78920840;
        Mon, 18 Oct 2021 15:17:33 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1mcRa5-0001fh-PB; Mon, 18 Oct 2021 15:17:29 +0300
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
Subject: [PATCH 6/6] at24: Support probing while in non-zero ACPI D state
Date:   Mon, 18 Oct 2021 15:17:29 +0300
Message-Id: <20211018121729.6357-7-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211018121729.6357-1-sakari.ailus@linux.intel.com>
References: <20211018121729.6357-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

In certain use cases (where the chip is part of a camera module, and the
camera module is wired together with a camera privacy LED), powering on
the device during probe is undesirable. Add support for the at24 to
execute probe while being in ACPI D state other than 0 (which means fully
powered on).

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Tomasz Figa <tfiga@chromium.org>
Acked-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/misc/eeprom/at24.c | 45 +++++++++++++++++++++++---------------
 1 file changed, 27 insertions(+), 18 deletions(-)

diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
index 305ffad131a29..49ab656e8a96e 100644
--- a/drivers/misc/eeprom/at24.c
+++ b/drivers/misc/eeprom/at24.c
@@ -595,6 +595,7 @@ static int at24_probe(struct i2c_client *client)
 	bool i2c_fn_i2c, i2c_fn_block;
 	unsigned int i, num_addresses;
 	struct at24_data *at24;
+	bool full_power;
 	struct regmap *regmap;
 	bool writable;
 	u8 test_byte;
@@ -747,14 +748,16 @@ static int at24_probe(struct i2c_client *client)
 
 	i2c_set_clientdata(client, at24);
 
-	err = regulator_enable(at24->vcc_reg);
-	if (err) {
-		dev_err(dev, "Failed to enable vcc regulator\n");
-		return err;
-	}
+	full_power = acpi_dev_state_d0(&client->dev);
+	if (full_power) {
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
@@ -766,15 +769,18 @@ static int at24_probe(struct i2c_client *client)
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
-		if (!pm_runtime_status_suspended(dev))
-			regulator_disable(at24->vcc_reg);
-		return -ENODEV;
+	if (full_power) {
+		err = at24_read(at24, 0, &test_byte, 1);
+		if (err) {
+			pm_runtime_disable(dev);
+			if (!pm_runtime_status_suspended(dev))
+				regulator_disable(at24->vcc_reg);
+			return -ENODEV;
+		}
 	}
 
 	pm_runtime_idle(dev);
@@ -794,9 +800,11 @@ static int at24_remove(struct i2c_client *client)
 	struct at24_data *at24 = i2c_get_clientdata(client);
 
 	pm_runtime_disable(&client->dev);
-	if (!pm_runtime_status_suspended(&client->dev))
-		regulator_disable(at24->vcc_reg);
-	pm_runtime_set_suspended(&client->dev);
+	if (acpi_dev_state_d0(&client->dev)) {
+		if (!pm_runtime_status_suspended(&client->dev))
+			regulator_disable(at24->vcc_reg);
+		pm_runtime_set_suspended(&client->dev);
+	}
 
 	return 0;
 }
@@ -833,6 +841,7 @@ static struct i2c_driver at24_driver = {
 	.probe_new = at24_probe,
 	.remove = at24_remove,
 	.id_table = at24_ids,
+	.flags = I2C_DRV_ACPI_WAIVE_D0_PROBE,
 };
 
 static int __init at24_init(void)
-- 
2.30.2

