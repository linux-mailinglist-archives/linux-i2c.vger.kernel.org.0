Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 86C30135D11
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jan 2020 16:44:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732576AbgAIPom (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Jan 2020 10:44:42 -0500
Received: from mga02.intel.com ([134.134.136.20]:3757 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732548AbgAIPol (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 9 Jan 2020 10:44:41 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 Jan 2020 07:44:41 -0800
X-IronPort-AV: E=Sophos;i="5.69,414,1571727600"; 
   d="scan'208";a="227826443"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 Jan 2020 07:44:38 -0800
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id 2F22220F4E;
        Thu,  9 Jan 2020 17:44:33 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1ipa01-00055H-HW; Thu, 09 Jan 2020 17:45:29 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rajmohan.mani@intel.com, Tomasz Figa <tfiga@chromium.org>
Subject: [PATCH v3 5/5] at24: Support probing while off
Date:   Thu,  9 Jan 2020 17:45:29 +0200
Message-Id: <20200109154529.19484-6-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200109154529.19484-1-sakari.ailus@linux.intel.com>
References: <20200109154529.19484-1-sakari.ailus@linux.intel.com>
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
index 0681d5fdd538a..41ac65d1e5d41 100644
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
+	low_power = acpi_dev_low_power_state_probe(&client->dev);
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
+	low_power = acpi_dev_low_power_state_probe(&client->dev);
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

