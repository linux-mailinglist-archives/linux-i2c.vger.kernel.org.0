Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0593EA7F65
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2019 11:30:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725840AbfIDJaH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 4 Sep 2019 05:30:07 -0400
Received: from bastet.se.axis.com ([195.60.68.11]:34152 "EHLO
        bastet.se.axis.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729093AbfIDJaG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 4 Sep 2019 05:30:06 -0400
Received: from localhost (localhost [127.0.0.1])
        by bastet.se.axis.com (Postfix) with ESMTP id 4EB9B183EF;
        Wed,  4 Sep 2019 11:30:04 +0200 (CEST)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
        by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new, port 10024)
        with LMTP id 4An1dBi-dRBw; Wed,  4 Sep 2019 11:29:55 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
        by bastet.se.axis.com (Postfix) with ESMTPS id E4C2A183FC;
        Wed,  4 Sep 2019 11:29:54 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id A834D1E07E;
        Wed,  4 Sep 2019 11:29:54 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 9CB8D1E079;
        Wed,  4 Sep 2019 11:29:54 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
        by boulder03.se.axis.com (Postfix) with ESMTP;
        Wed,  4 Sep 2019 11:29:54 +0200 (CEST)
Received: from lnxbjornar3.se.axis.com (lnxbjornar3.se.axis.com [10.88.24.4])
        by thoth.se.axis.com (Postfix) with ESMTP id 9089E2899;
        Wed,  4 Sep 2019 11:29:54 +0200 (CEST)
Received: by lnxbjornar3.se.axis.com (Postfix, from userid 9651)
        id 8EC15C44DB; Wed,  4 Sep 2019 11:29:54 +0200 (CEST)
From:   =?UTF-8?q?Bj=C3=B6rn=20Ard=C3=B6?= <bjorn.ardo@axis.com>
To:     wsa@the-dreams.de
Cc:     linux-i2c@vger.kernel.org,
        =?UTF-8?q?Bj=C3=B6rn=20Ard=C3=B6?= <bjornar@axis.com>
Subject: [PATCH v2] i2c-eeprom_slave: Add support for more eeprom models
Date:   Wed,  4 Sep 2019 11:29:53 +0200
Message-Id: <1567589393-19752-1-git-send-email-bjorn.ardo@axis.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add a 32 and a 64 kbit memory. These needs 16 bit address
so added support for that as well.

Changelog v2:
* Updated variable names
* Changed idx_write_cnt to u8

Signed-off-by: Björn Ardö <bjorn.ardo@axis.com>
---
 drivers/i2c/i2c-slave-eeprom.c | 36 +++++++++++++++++++++++++-----------
 1 file changed, 25 insertions(+), 11 deletions(-)

diff --git a/drivers/i2c/i2c-slave-eeprom.c b/drivers/i2c/i2c-slave-eeprom.c
index be65d38..773afaa 100644
--- a/drivers/i2c/i2c-slave-eeprom.c
+++ b/drivers/i2c/i2c-slave-eeprom.c
@@ -11,6 +11,7 @@
  * pointer, yet implementation is deferred until the need actually arises.
  */
 
+#include <linux/bitfield.h>
 #include <linux/i2c.h>
 #include <linux/init.h>
 #include <linux/module.h>
@@ -21,12 +22,18 @@
 
 struct eeprom_data {
 	struct bin_attribute bin;
-	bool first_write;
 	spinlock_t buffer_lock;
-	u8 buffer_idx;
+	u16 buffer_idx;
+	u16 address_mask;
+	u8 num_address_bytes;
+	u8 idx_write_cnt;
 	u8 buffer[];
 };
 
+#define I2C_SLAVE_BYTELEN GENMASK(15, 0)
+#define I2C_SLAVE_FLAG_ADDR16 BIT(16)
+#define I2C_SLAVE_DEVICE_MAGIC(_len, _flags) ((_flags) | (_len))
+
 static int i2c_slave_eeprom_slave_cb(struct i2c_client *client,
 				     enum i2c_slave_event event, u8 *val)
 {
@@ -34,12 +41,14 @@ static int i2c_slave_eeprom_slave_cb(struct i2c_client *client,
 
 	switch (event) {
 	case I2C_SLAVE_WRITE_RECEIVED:
-		if (eeprom->first_write) {
-			eeprom->buffer_idx = *val;
-			eeprom->first_write = false;
+		if (eeprom->idx_write_cnt < eeprom->num_address_bytes) {
+			if (eeprom->idx_write_cnt == 0)
+				eeprom->buffer_idx = 0;
+			eeprom->buffer_idx = *val | (eeprom->buffer_idx << 8);
+			eeprom->idx_write_cnt++;
 		} else {
 			spin_lock(&eeprom->buffer_lock);
-			eeprom->buffer[eeprom->buffer_idx++] = *val;
+			eeprom->buffer[eeprom->buffer_idx++ & eeprom->address_mask] = *val;
 			spin_unlock(&eeprom->buffer_lock);
 		}
 		break;
@@ -50,7 +59,7 @@ static int i2c_slave_eeprom_slave_cb(struct i2c_client *client,
 		/* fallthrough */
 	case I2C_SLAVE_READ_REQUESTED:
 		spin_lock(&eeprom->buffer_lock);
-		*val = eeprom->buffer[eeprom->buffer_idx];
+		*val = eeprom->buffer[eeprom->buffer_idx & eeprom->address_mask];
 		spin_unlock(&eeprom->buffer_lock);
 		/*
 		 * Do not increment buffer_idx here, because we don't know if
@@ -61,7 +70,7 @@ static int i2c_slave_eeprom_slave_cb(struct i2c_client *client,
 
 	case I2C_SLAVE_STOP:
 	case I2C_SLAVE_WRITE_REQUESTED:
-		eeprom->first_write = true;
+		eeprom->idx_write_cnt = 0;
 		break;
 
 	default:
@@ -105,13 +114,16 @@ static int i2c_slave_eeprom_probe(struct i2c_client *client, const struct i2c_de
 {
 	struct eeprom_data *eeprom;
 	int ret;
-	unsigned size = id->driver_data;
+	unsigned int size = FIELD_GET(I2C_SLAVE_BYTELEN, id->driver_data);
+	unsigned int flag_addr16 = FIELD_GET(I2C_SLAVE_FLAG_ADDR16, id->driver_data);
 
 	eeprom = devm_kzalloc(&client->dev, sizeof(struct eeprom_data) + size, GFP_KERNEL);
 	if (!eeprom)
 		return -ENOMEM;
 
-	eeprom->first_write = true;
+	eeprom->idx_write_cnt = 0;
+	eeprom->num_address_bytes = flag_addr16 ? 2 : 1;
+	eeprom->address_mask = size - 1;
 	spin_lock_init(&eeprom->buffer_lock);
 	i2c_set_clientdata(client, eeprom);
 
@@ -146,7 +158,9 @@ static int i2c_slave_eeprom_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id i2c_slave_eeprom_id[] = {
-	{ "slave-24c02", 2048 / 8 },
+	{ "slave-24c02", I2C_SLAVE_DEVICE_MAGIC(2048 / 8,  0) },
+	{ "slave-24c32", I2C_SLAVE_DEVICE_MAGIC(32768 / 8, I2C_SLAVE_FLAG_ADDR16) },
+	{ "slave-24c64", I2C_SLAVE_DEVICE_MAGIC(65536 / 8, I2C_SLAVE_FLAG_ADDR16) },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, i2c_slave_eeprom_id);
-- 
2.1.4

