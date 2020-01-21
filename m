Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41FE1143E44
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Jan 2020 14:42:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729162AbgAUNlv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 Jan 2020 08:41:51 -0500
Received: from mga17.intel.com ([192.55.52.151]:4186 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729140AbgAUNlt (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 21 Jan 2020 08:41:49 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 21 Jan 2020 05:41:49 -0800
X-IronPort-AV: E=Sophos;i="5.70,346,1574150400"; 
   d="scan'208";a="399667390"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 21 Jan 2020 05:41:45 -0800
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id 6AE5F20AF3;
        Tue, 21 Jan 2020 15:41:39 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1ittn3-0005K2-Tk; Tue, 21 Jan 2020 15:41:57 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-acpi@vger.kernel.org, Bingbu Cao <bingbu.cao@intel.com>,
        linux-media@vger.kernel.org,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Hyungwoo Yang <hyungwoo.yang@intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rajmohan.mani@intel.com, Tomasz Figa <tfiga@chromium.org>
Subject: [PATCH v4 5/6] at24: Support probing while off
Date:   Tue, 21 Jan 2020 15:41:56 +0200
Message-Id: <20200121134157.20396-6-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200121134157.20396-1-sakari.ailus@linux.intel.com>
References: <20200121134157.20396-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

In certain use cases (where the chip is part of a camera module, and the
camera module is wired together with a camera privacy LED), powering on
the device during probe is undesirable. Add support for the at24 to
execute probe while being powered off. For this to happen, a hint in form
of a device property is required from the firmware.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/misc/eeprom/at24.c | 31 +++++++++++++++++++++----------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
index 0681d5fdd538a..5fc1162b67618 100644
--- a/drivers/misc/eeprom/at24.c
+++ b/drivers/misc/eeprom/at24.c
@@ -564,6 +564,7 @@ static int at24_probe(struct i2c_client *client)
 	bool i2c_fn_i2c, i2c_fn_block;
 	unsigned int i, num_addresses;
 	struct at24_data *at24;
+	bool low_power;
 	struct regmap *regmap;
 	bool writable;
 	u8 test_byte;
@@ -701,19 +702,24 @@ static int at24_probe(struct i2c_client *client)
 
 	i2c_set_clientdata(client, at24);
 
-	/* enable runtime pm */
-	pm_runtime_set_active(dev);
+	low_power = acpi_dev_state_low_power(&client->dev);
+	if (!low_power)
+		pm_runtime_set_active(dev);
+
 	pm_runtime_enable(dev);
 
 	/*
-	 * Perform a one-byte test read to verify that the
-	 * chip is functional.
+	 * Perform a one-byte test read to verify that the chip is functional,
+	 * unless powering on the device is to be avoided during probe (i.e.
+	 * it's powered off right now).
 	 */
-	err = at24_read(at24, 0, &test_byte, 1);
-	pm_runtime_idle(dev);
-	if (err) {
-		pm_runtime_disable(dev);
-		return -ENODEV;
+	if (!low_power) {
+		err = at24_read(at24, 0, &test_byte, 1);
+		pm_runtime_idle(dev);
+		if (err) {
+			pm_runtime_disable(dev);
+			return -ENODEV;
+		}
 	}
 
 	if (writable)
@@ -728,8 +734,12 @@ static int at24_probe(struct i2c_client *client)
 
 static int at24_remove(struct i2c_client *client)
 {
+	bool low_power;
+
 	pm_runtime_disable(&client->dev);
-	pm_runtime_set_suspended(&client->dev);
+	low_power = acpi_dev_state_low_power(&client->dev);
+	if (!low_power)
+		pm_runtime_set_suspended(&client->dev);
 
 	return 0;
 }
@@ -743,6 +753,7 @@ static struct i2c_driver at24_driver = {
 	.probe_new = at24_probe,
 	.remove = at24_remove,
 	.id_table = at24_ids,
+	.probe_low_power = true,
 };
 
 static int __init at24_init(void)
-- 
2.20.1

