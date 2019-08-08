Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10B22865FE
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Aug 2019 17:36:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404027AbfHHPgM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Aug 2019 11:36:12 -0400
Received: from sauhun.de ([88.99.104.3]:56462 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733193AbfHHPgI (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 8 Aug 2019 11:36:08 -0400
Received: from localhost (p5486CA1C.dip0.t-ipconnect.de [84.134.202.28])
        by pokefinder.org (Postfix) with ESMTPSA id 4691B3E43C1;
        Thu,  8 Aug 2019 17:36:06 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH RFT 2/3] hwmon: w83792d: convert to use devm_i2c_new_dummy_device
Date:   Thu,  8 Aug 2019 17:35:57 +0200
Message-Id: <20190808153558.2362-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190808153558.2362-1-wsa+renesas@sang-engineering.com>
References: <20190808153558.2362-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

And simplify the error handling.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/hwmon/w83792d.c | 32 +++++++++-----------------------
 1 file changed, 9 insertions(+), 23 deletions(-)

diff --git a/drivers/hwmon/w83792d.c b/drivers/hwmon/w83792d.c
index da8a6d62aa23..7fc8a1160c8f 100644
--- a/drivers/hwmon/w83792d.c
+++ b/drivers/hwmon/w83792d.c
@@ -924,7 +924,7 @@ store_sf2_level(struct device *dev, struct device_attribute *attr,
 static int
 w83792d_detect_subclients(struct i2c_client *new_client)
 {
-	int i, id, err;
+	int i, id;
 	int address = new_client->addr;
 	u8 val;
 	struct i2c_adapter *adapter = new_client->adapter;
@@ -938,8 +938,7 @@ w83792d_detect_subclients(struct i2c_client *new_client)
 				dev_err(&new_client->dev,
 					"invalid subclient address %d; must be 0x48-0x4f\n",
 					force_subclients[i]);
-				err = -ENODEV;
-				goto ERROR_SC_0;
+				return -ENODEV;
 			}
 		}
 		w83792d_write_value(new_client, W83792D_REG_I2C_SUBADDR,
@@ -949,28 +948,21 @@ w83792d_detect_subclients(struct i2c_client *new_client)
 
 	val = w83792d_read_value(new_client, W83792D_REG_I2C_SUBADDR);
 	if (!(val & 0x08))
-		data->lm75[0] = i2c_new_dummy(adapter, 0x48 + (val & 0x7));
+		data->lm75[0] = devm_i2c_new_dummy_device(&new_client->dev, adapter,
+							  0x48 + (val & 0x7));
 	if (!(val & 0x80)) {
-		if ((data->lm75[0] != NULL) &&
+		if (!IS_ERR(data->lm75[0]) &&
 			((val & 0x7) == ((val >> 4) & 0x7))) {
 			dev_err(&new_client->dev,
 				"duplicate addresses 0x%x, use force_subclient\n",
 				data->lm75[0]->addr);
-			err = -ENODEV;
-			goto ERROR_SC_1;
+			return -ENODEV;
 		}
-		data->lm75[1] = i2c_new_dummy(adapter,
-					      0x48 + ((val >> 4) & 0x7));
+		data->lm75[1] = devm_i2c_new_dummy_device(&new_client->dev, adapter,
+							  0x48 + ((val >> 4) & 0x7));
 	}
 
 	return 0;
-
-/* Undo inits in case of errors */
-
-ERROR_SC_1:
-	i2c_unregister_device(data->lm75[0]);
-ERROR_SC_0:
-	return err;
 }
 
 static SENSOR_DEVICE_ATTR(in0_input, S_IRUGO, show_in, NULL, 0);
@@ -1396,7 +1388,7 @@ w83792d_probe(struct i2c_client *client, const struct i2c_device_id *id)
 	/* Register sysfs hooks */
 	err = sysfs_create_group(&dev->kobj, &w83792d_group);
 	if (err)
-		goto exit_i2c_unregister;
+		return err;
 
 	/*
 	 * Read GPIO enable register to check if pins for fan 4,5 are used as
@@ -1441,9 +1433,6 @@ w83792d_probe(struct i2c_client *client, const struct i2c_device_id *id)
 	sysfs_remove_group(&dev->kobj, &w83792d_group);
 	for (i = 0; i < ARRAY_SIZE(w83792d_group_fan); i++)
 		sysfs_remove_group(&dev->kobj, &w83792d_group_fan[i]);
-exit_i2c_unregister:
-	i2c_unregister_device(data->lm75[0]);
-	i2c_unregister_device(data->lm75[1]);
 	return err;
 }
 
@@ -1459,9 +1448,6 @@ w83792d_remove(struct i2c_client *client)
 		sysfs_remove_group(&client->dev.kobj,
 				   &w83792d_group_fan[i]);
 
-	i2c_unregister_device(data->lm75[0]);
-	i2c_unregister_device(data->lm75[1]);
-
 	return 0;
 }
 
-- 
2.20.1

