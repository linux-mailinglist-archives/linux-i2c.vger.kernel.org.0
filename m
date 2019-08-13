Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A3578AF25
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Aug 2019 08:05:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725815AbfHMGE6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Aug 2019 02:04:58 -0400
Received: from bastet.se.axis.com ([195.60.68.11]:42022 "EHLO
        bastet.se.axis.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725909AbfHMGEy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Aug 2019 02:04:54 -0400
X-Greylist: delayed 578 seconds by postgrey-1.27 at vger.kernel.org; Tue, 13 Aug 2019 02:04:52 EDT
Received: from localhost (localhost [127.0.0.1])
        by bastet.se.axis.com (Postfix) with ESMTP id 5A4DF183CC;
        Tue, 13 Aug 2019 07:55:13 +0200 (CEST)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
        by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new, port 10024)
        with LMTP id EoGWEMVzUmkG; Tue, 13 Aug 2019 07:55:12 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
        by bastet.se.axis.com (Postfix) with ESMTPS id 55CA618348;
        Tue, 13 Aug 2019 07:55:12 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 3330E1A0EF;
        Tue, 13 Aug 2019 07:55:12 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 2805A1A0EE;
        Tue, 13 Aug 2019 07:55:12 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
        by boulder02.se.axis.com (Postfix) with ESMTP;
        Tue, 13 Aug 2019 07:55:12 +0200 (CEST)
Received: from lnxbjornar3.se.axis.com (lnxbjornar3.se.axis.com [10.88.24.4])
        by seth.se.axis.com (Postfix) with ESMTP id 1C468BE;
        Tue, 13 Aug 2019 07:55:12 +0200 (CEST)
Received: by lnxbjornar3.se.axis.com (Postfix, from userid 9651)
        id 141F3C6E98; Tue, 13 Aug 2019 07:55:12 +0200 (CEST)
From:   =?UTF-8?q?Bj=C3=B6rn=20Ard=C3=B6?= <bjorn.ardo@axis.com>
To:     wsa@the-dreams.de
Cc:     linux-i2c@vger.kernel.org,
        =?UTF-8?q?Bj=C3=B6rn=20Ard=C3=B6?= <bjornar@axis.com>
Subject: [PATCH] i2c-eeprom_slave: Add support for more eeprom models
Date:   Tue, 13 Aug 2019 07:55:08 +0200
Message-Id: <1565675708-15434-1-git-send-email-bjorn.ardo@axis.com>
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

Signed-off-by: Björn Ardö <bjorn.ardo@axis.com>
---
 drivers/i2c/i2c-slave-eeprom.c | 36 +++++++++++++++++++++++++-----------
 1 file changed, 25 insertions(+), 11 deletions(-)

diff --git a/drivers/i2c/i2c-slave-eeprom.c b/drivers/i2c/i2c-slave-eeprom.c
index be65d38..35bff28 100644
--- a/drivers/i2c/i2c-slave-eeprom.c
+++ b/drivers/i2c/i2c-slave-eeprom.c
@@ -18,15 +18,22 @@
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <linux/sysfs.h>
+#include <linux/bitfield.h>
 
 struct eeprom_data {
 	struct bin_attribute bin;
-	bool first_write;
+	int write_nbr;
 	spinlock_t buffer_lock;
-	u8 buffer_idx;
+	u16 buffer_idx;
+	u16 address_mask;
+	u8 address_bytes;
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
+		if (eeprom->write_nbr < eeprom->address_bytes) {
+			if (eeprom->write_nbr == 0)
+				eeprom->buffer_idx = 0;
+			eeprom->buffer_idx = *val | (eeprom->buffer_idx << 8);
+			eeprom->write_nbr++;
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
+		eeprom->write_nbr = 0;
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
+	eeprom->write_nbr = 0;
+	eeprom->address_bytes = flag_addr16 ? 2 : 1;
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

