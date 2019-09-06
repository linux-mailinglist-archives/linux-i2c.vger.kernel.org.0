Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2BE14ABA44
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2019 16:06:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729932AbfIFOGR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 6 Sep 2019 10:06:17 -0400
Received: from bastet.se.axis.com ([195.60.68.11]:58297 "EHLO
        bastet.se.axis.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730753AbfIFOGQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 6 Sep 2019 10:06:16 -0400
Received: from localhost (localhost [127.0.0.1])
        by bastet.se.axis.com (Postfix) with ESMTP id 018C718136;
        Fri,  6 Sep 2019 16:06:14 +0200 (CEST)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
        by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new, port 10024)
        with LMTP id DTb89vPd-mku; Fri,  6 Sep 2019 16:06:10 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
        by bastet.se.axis.com (Postfix) with ESMTPS id DEDCC18523;
        Fri,  6 Sep 2019 16:06:10 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id C4B361A062;
        Fri,  6 Sep 2019 16:06:10 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id B8AD51A060;
        Fri,  6 Sep 2019 16:06:10 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
        by boulder02.se.axis.com (Postfix) with ESMTP;
        Fri,  6 Sep 2019 16:06:10 +0200 (CEST)
Received: from lnxbjornar3.se.axis.com (lnxbjornar3.se.axis.com [10.88.24.4])
        by seth.se.axis.com (Postfix) with ESMTP id ABFBC2A1D;
        Fri,  6 Sep 2019 16:06:10 +0200 (CEST)
Received: by lnxbjornar3.se.axis.com (Postfix, from userid 9651)
        id AA3BDC433C; Fri,  6 Sep 2019 16:06:10 +0200 (CEST)
From:   =?UTF-8?q?Bj=C3=B6rn=20Ard=C3=B6?= <bjorn.ardo@axis.com>
To:     wsa@the-dreams.de
Cc:     linux-i2c@vger.kernel.org,
        =?UTF-8?q?Bj=C3=B6rn=20Ard=C3=B6?= <bjornar@axis.com>
Subject: [PATCH v3] i2c: slave-eeprom: Add read only mode
Date:   Fri,  6 Sep 2019 16:06:09 +0200
Message-Id: <1567778769-25485-1-git-send-email-bjorn.ardo@axis.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add read-only versions of all EEPROMs. These versions are read-only
on the i2c side, but can be written from the sysfs side.

Signed-off-by: Björn Ardö <bjorn.ardo@axis.com>
---
 drivers/i2c/i2c-slave-eeprom.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/i2c-slave-eeprom.c b/drivers/i2c/i2c-slave-eeprom.c
index 92ff999..db9763c 100644
--- a/drivers/i2c/i2c-slave-eeprom.c
+++ b/drivers/i2c/i2c-slave-eeprom.c
@@ -33,11 +33,13 @@ struct eeprom_data {
 	u16 address_mask;
 	u8 num_address_bytes;
 	u8 idx_write_cnt;
+	bool read_only;
 	u8 buffer[];
 };
 
 #define I2C_SLAVE_BYTELEN GENMASK(15, 0)
 #define I2C_SLAVE_FLAG_ADDR16 BIT(16)
+#define I2C_SLAVE_FLAG_RO BIT(17)
 #define I2C_SLAVE_DEVICE_MAGIC(_len, _flags) ((_flags) | (_len))
 
 static int i2c_slave_eeprom_slave_cb(struct i2c_client *client,
@@ -53,9 +55,11 @@ static int i2c_slave_eeprom_slave_cb(struct i2c_client *client,
 			eeprom->buffer_idx = *val | (eeprom->buffer_idx << 8);
 			eeprom->idx_write_cnt++;
 		} else {
-			spin_lock(&eeprom->buffer_lock);
-			eeprom->buffer[eeprom->buffer_idx++ & eeprom->address_mask] = *val;
-			spin_unlock(&eeprom->buffer_lock);
+			if (!eeprom->read_only) {
+				spin_lock(&eeprom->buffer_lock);
+				eeprom->buffer[eeprom->buffer_idx++ & eeprom->address_mask] = *val;
+				spin_unlock(&eeprom->buffer_lock);
+			}
 		}
 		break;
 
@@ -130,6 +134,7 @@ static int i2c_slave_eeprom_probe(struct i2c_client *client, const struct i2c_de
 	eeprom->idx_write_cnt = 0;
 	eeprom->num_address_bytes = flag_addr16 ? 2 : 1;
 	eeprom->address_mask = size - 1;
+	eeprom->read_only = FIELD_GET(I2C_SLAVE_FLAG_RO, id->driver_data);
 	spin_lock_init(&eeprom->buffer_lock);
 	i2c_set_clientdata(client, eeprom);
 
@@ -165,8 +170,11 @@ static int i2c_slave_eeprom_remove(struct i2c_client *client)
 
 static const struct i2c_device_id i2c_slave_eeprom_id[] = {
 	{ "slave-24c02", I2C_SLAVE_DEVICE_MAGIC(2048 / 8,  0) },
+	{ "slave-24c02ro", I2C_SLAVE_DEVICE_MAGIC(2048 / 8,  I2C_SLAVE_FLAG_RO) },
 	{ "slave-24c32", I2C_SLAVE_DEVICE_MAGIC(32768 / 8, I2C_SLAVE_FLAG_ADDR16) },
+	{ "slave-24c32ro", I2C_SLAVE_DEVICE_MAGIC(32768 / 8, I2C_SLAVE_FLAG_ADDR16 | I2C_SLAVE_FLAG_RO) },
 	{ "slave-24c64", I2C_SLAVE_DEVICE_MAGIC(65536 / 8, I2C_SLAVE_FLAG_ADDR16) },
+	{ "slave-24c64ro", I2C_SLAVE_DEVICE_MAGIC(65536 / 8, I2C_SLAVE_FLAG_ADDR16 | I2C_SLAVE_FLAG_RO) },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, i2c_slave_eeprom_id);
-- 
2.1.4

