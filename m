Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F6C4AA686
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2019 16:52:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389931AbfIEOww (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Sep 2019 10:52:52 -0400
Received: from bastet.se.axis.com ([195.60.68.11]:50151 "EHLO
        bastet.se.axis.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388941AbfIEOww (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 5 Sep 2019 10:52:52 -0400
Received: from localhost (localhost [127.0.0.1])
        by bastet.se.axis.com (Postfix) with ESMTP id E795A184C5;
        Thu,  5 Sep 2019 16:52:48 +0200 (CEST)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
        by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new, port 10024)
        with LMTP id rx4KZ88phibV; Thu,  5 Sep 2019 16:52:48 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
        by bastet.se.axis.com (Postfix) with ESMTPS id 1DE80184A3;
        Thu,  5 Sep 2019 16:52:48 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 0744F1E076;
        Thu,  5 Sep 2019 16:52:48 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id EFE701E068;
        Thu,  5 Sep 2019 16:52:47 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
        by boulder03.se.axis.com (Postfix) with ESMTP;
        Thu,  5 Sep 2019 16:52:47 +0200 (CEST)
Received: from lnxbjornar3.se.axis.com (lnxbjornar3.se.axis.com [10.88.24.4])
        by thoth.se.axis.com (Postfix) with ESMTP id E3B5C2A94;
        Thu,  5 Sep 2019 16:52:47 +0200 (CEST)
Received: by lnxbjornar3.se.axis.com (Postfix, from userid 9651)
        id E20B6C470F; Thu,  5 Sep 2019 16:52:47 +0200 (CEST)
From:   =?UTF-8?q?Bj=C3=B6rn=20Ard=C3=B6?= <bjorn.ardo@axis.com>
To:     wsa@the-dreams.de
Cc:     linux-i2c@vger.kernel.org,
        =?UTF-8?q?Bj=C3=B6rn=20Ard=C3=B6?= <bjornar@axis.com>
Subject: [PATCH] i2c-eeprom_slave: Add read only mode
Date:   Thu,  5 Sep 2019 16:52:44 +0200
Message-Id: <1567695164-20464-1-git-send-email-bjorn.ardo@axis.com>
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
 drivers/i2c/i2c-slave-eeprom.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/i2c/i2c-slave-eeprom.c b/drivers/i2c/i2c-slave-eeprom.c
index 92ff999..3ae45a1 100644
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
@@ -53,6 +55,8 @@ static int i2c_slave_eeprom_slave_cb(struct i2c_client *client,
 			eeprom->buffer_idx = *val | (eeprom->buffer_idx << 8);
 			eeprom->idx_write_cnt++;
 		} else {
+			if (eeprom->read_only)
+				return 0;
 			spin_lock(&eeprom->buffer_lock);
 			eeprom->buffer[eeprom->buffer_idx++ & eeprom->address_mask] = *val;
 			spin_unlock(&eeprom->buffer_lock);
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
+	{ "slave-24c02", I2C_SLAVE_DEVICE_MAGIC(2048 / 8,  I2C_SLAVE_FLAG_RO) },
 	{ "slave-24c32", I2C_SLAVE_DEVICE_MAGIC(32768 / 8, I2C_SLAVE_FLAG_ADDR16) },
+	{ "slave-24c32ro", I2C_SLAVE_DEVICE_MAGIC(32768 / 8, I2C_SLAVE_FLAG_ADDR16 | I2C_SLAVE_FLAG_RO) },
 	{ "slave-24c64", I2C_SLAVE_DEVICE_MAGIC(65536 / 8, I2C_SLAVE_FLAG_ADDR16) },
+	{ "slave-24c64ro", I2C_SLAVE_DEVICE_MAGIC(65536 / 8, I2C_SLAVE_FLAG_ADDR16 | I2C_SLAVE_FLAG_RO) },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, i2c_slave_eeprom_id);
-- 
2.1.4

