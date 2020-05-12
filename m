Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2E6D1CF6EB
	for <lists+linux-i2c@lfdr.de>; Tue, 12 May 2020 16:20:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729637AbgELOUy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 12 May 2020 10:20:54 -0400
Received: from www.zeus03.de ([194.117.254.33]:50402 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728283AbgELOUy (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 12 May 2020 10:20:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=SUW592aQjUu5mvOWXaIPmT4Rsvj
        cLfSMDNaFH/XnRYc=; b=1ViZdRno5W0mQOXabJTIHgbeFL+Edq5CZh8svbXOYxy
        Sb1UaFrrKK1paFQD1SuHttouVMKPDQ4veHF9lp641aLs/Gz2ufMeHMaCNaj4RaXo
        Z3iXB9/dfOQTzNNsWjSsNj1OpxChqlJGmPRQu6hDaowaQsFl3JdfhhjTuRRZ9+CE
        =
Received: (qmail 2970656 invoked from network); 12 May 2020 16:20:52 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 May 2020 16:20:52 +0200
X-UD-Smtp-Session: l3s3148p1@AiW7K3Sl5MUgAwDPXw2aAE67cgFBY+HL
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Patrick Williams <patrick@stwcx.xyz>
Subject: [PATCH] i2c: slave-eeprom: add support for 24c512 EEPROMs
Date:   Tue, 12 May 2020 16:20:46 +0200
Message-Id: <20200512142046.26454-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

I don't plan to support every EEPROM type, but the 24c512 ones need a
tiny code update, so let's have that upstream.

Reported-by: Patrick Williams <patrick@stwcx.xyz>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Tested on a Renesas Lager board (R-Car H2).

 drivers/i2c/i2c-slave-eeprom.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/i2c-slave-eeprom.c b/drivers/i2c/i2c-slave-eeprom.c
index f868dfc362a6..787fdb7f332f 100644
--- a/drivers/i2c/i2c-slave-eeprom.c
+++ b/drivers/i2c/i2c-slave-eeprom.c
@@ -41,7 +41,7 @@ struct eeprom_data {
 #define I2C_SLAVE_BYTELEN GENMASK(15, 0)
 #define I2C_SLAVE_FLAG_ADDR16 BIT(16)
 #define I2C_SLAVE_FLAG_RO BIT(17)
-#define I2C_SLAVE_DEVICE_MAGIC(_len, _flags) ((_flags) | (_len))
+#define I2C_SLAVE_DEVICE_MAGIC(_len, _flags) ((_flags) | ((_len) - 1))
 
 static int i2c_slave_eeprom_slave_cb(struct i2c_client *client,
 				     enum i2c_slave_event event, u8 *val)
@@ -145,7 +145,7 @@ static int i2c_slave_eeprom_probe(struct i2c_client *client, const struct i2c_de
 {
 	struct eeprom_data *eeprom;
 	int ret;
-	unsigned int size = FIELD_GET(I2C_SLAVE_BYTELEN, id->driver_data);
+	unsigned int size = FIELD_GET(I2C_SLAVE_BYTELEN, id->driver_data) + 1;
 	unsigned int flag_addr16 = FIELD_GET(I2C_SLAVE_FLAG_ADDR16, id->driver_data);
 
 	eeprom = devm_kzalloc(&client->dev, sizeof(struct eeprom_data) + size, GFP_KERNEL);
@@ -200,6 +200,8 @@ static const struct i2c_device_id i2c_slave_eeprom_id[] = {
 	{ "slave-24c32ro", I2C_SLAVE_DEVICE_MAGIC(32768 / 8, I2C_SLAVE_FLAG_ADDR16 | I2C_SLAVE_FLAG_RO) },
 	{ "slave-24c64", I2C_SLAVE_DEVICE_MAGIC(65536 / 8, I2C_SLAVE_FLAG_ADDR16) },
 	{ "slave-24c64ro", I2C_SLAVE_DEVICE_MAGIC(65536 / 8, I2C_SLAVE_FLAG_ADDR16 | I2C_SLAVE_FLAG_RO) },
+	{ "slave-24c512", I2C_SLAVE_DEVICE_MAGIC(524288 / 8, I2C_SLAVE_FLAG_ADDR16) },
+	{ "slave-24c512ro", I2C_SLAVE_DEVICE_MAGIC(524288 / 8, I2C_SLAVE_FLAG_ADDR16 | I2C_SLAVE_FLAG_RO) },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, i2c_slave_eeprom_id);
-- 
2.20.1

