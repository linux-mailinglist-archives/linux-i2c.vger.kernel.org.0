Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63F0D865F6
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Aug 2019 17:36:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733295AbfHHPgI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Aug 2019 11:36:08 -0400
Received: from sauhun.de ([88.99.104.3]:56446 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733143AbfHHPgI (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 8 Aug 2019 11:36:08 -0400
Received: from localhost (p5486CA1C.dip0.t-ipconnect.de [84.134.202.28])
        by pokefinder.org (Postfix) with ESMTPSA id A10753E60C6;
        Thu,  8 Aug 2019 17:36:05 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Marc Hulsman <m.hulsman@tudelft.nl>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH RFT 1/3] hwmon: w83791d: convert to use devm_i2c_new_dummy_device
Date:   Thu,  8 Aug 2019 17:35:56 +0200
Message-Id: <20190808153558.2362-2-wsa+renesas@sang-engineering.com>
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
 drivers/hwmon/w83791d.c | 32 +++++++++-----------------------
 1 file changed, 9 insertions(+), 23 deletions(-)

diff --git a/drivers/hwmon/w83791d.c b/drivers/hwmon/w83791d.c
index 050ad4201691..aad8d4da5802 100644
--- a/drivers/hwmon/w83791d.c
+++ b/drivers/hwmon/w83791d.c
@@ -1260,7 +1260,7 @@ static int w83791d_detect_subclients(struct i2c_client *client)
 	struct i2c_adapter *adapter = client->adapter;
 	struct w83791d_data *data = i2c_get_clientdata(client);
 	int address = client->addr;
-	int i, id, err;
+	int i, id;
 	u8 val;
 
 	id = i2c_adapter_id(adapter);
@@ -1272,8 +1272,7 @@ static int w83791d_detect_subclients(struct i2c_client *client)
 					"invalid subclient "
 					"address %d; must be 0x48-0x4f\n",
 					force_subclients[i]);
-				err = -ENODEV;
-				goto error_sc_0;
+				return -ENODEV;
 			}
 		}
 		w83791d_write(client, W83791D_REG_I2C_SUBADDR,
@@ -1283,29 +1282,22 @@ static int w83791d_detect_subclients(struct i2c_client *client)
 
 	val = w83791d_read(client, W83791D_REG_I2C_SUBADDR);
 	if (!(val & 0x08))
-		data->lm75[0] = i2c_new_dummy(adapter, 0x48 + (val & 0x7));
+		data->lm75[0] = devm_i2c_new_dummy_device(&client->dev, adapter,
+							  0x48 + (val & 0x7));
 	if (!(val & 0x80)) {
-		if ((data->lm75[0] != NULL) &&
+		if (!IS_ERR(data->lm75[0]) &&
 				((val & 0x7) == ((val >> 4) & 0x7))) {
 			dev_err(&client->dev,
 				"duplicate addresses 0x%x, "
 				"use force_subclient\n",
 				data->lm75[0]->addr);
-			err = -ENODEV;
-			goto error_sc_1;
+			return -ENODEV;
 		}
-		data->lm75[1] = i2c_new_dummy(adapter,
-					      0x48 + ((val >> 4) & 0x7));
+		data->lm75[1] = devm_i2c_new_dummy_device(&client->dev, adapter,
+							  0x48 + ((val >> 4) & 0x7));
 	}
 
 	return 0;
-
-/* Undo inits in case of errors */
-
-error_sc_1:
-	i2c_unregister_device(data->lm75[0]);
-error_sc_0:
-	return err;
 }
 
 
@@ -1394,7 +1386,7 @@ static int w83791d_probe(struct i2c_client *client,
 	/* Register sysfs hooks */
 	err = sysfs_create_group(&client->dev.kobj, &w83791d_group);
 	if (err)
-		goto error3;
+		return err;
 
 	/* Check if pins of fan/pwm 4-5 are in use as GPIO */
 	has_fanpwm45 = w83791d_read(client, W83791D_REG_GPIO) & 0x10;
@@ -1419,9 +1411,6 @@ static int w83791d_probe(struct i2c_client *client,
 		sysfs_remove_group(&client->dev.kobj, &w83791d_group_fanpwm45);
 error4:
 	sysfs_remove_group(&client->dev.kobj, &w83791d_group);
-error3:
-	i2c_unregister_device(data->lm75[0]);
-	i2c_unregister_device(data->lm75[1]);
 	return err;
 }
 
@@ -1432,9 +1421,6 @@ static int w83791d_remove(struct i2c_client *client)
 	hwmon_device_unregister(data->hwmon_dev);
 	sysfs_remove_group(&client->dev.kobj, &w83791d_group);
 
-	i2c_unregister_device(data->lm75[0]);
-	i2c_unregister_device(data->lm75[1]);
-
 	return 0;
 }
 
-- 
2.20.1

