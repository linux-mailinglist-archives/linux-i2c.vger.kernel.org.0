Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27CE877C2D0
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Aug 2023 23:54:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233052AbjHNVxn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Aug 2023 17:53:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233054AbjHNVxN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Aug 2023 17:53:13 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33A35E77;
        Mon, 14 Aug 2023 14:53:03 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1bb84194bf3so29415075ad.3;
        Mon, 14 Aug 2023 14:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692049982; x=1692654782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0QmZQPGtJPE55mi80G8Q09KHrGIMEsU19IuSGHDLtYc=;
        b=EZAQidJ00yQ6WEvkdfTtNaL6XoQjiwuctJKMwYJFSWfPAHTfa5GjQH0jFnxjrTbeNo
         CZho1ZXs6gvnlkURHru3r4flI7ZNq/XZz36VO8vQduLWJUG6UXXaQfIMk1cZg3yEXSiw
         HXlRErnW6MpdGKdueRGMuXg+LJkZbWUp2mg8QX8s5Crek+bz8kUXLa1DZ5BzRyrwVtpp
         4Ko9Xq02Nrdu7ZC28vmXibRBqNX/4NyyvTCs/Xq2UQk1So9YhxbnRYtE4kMPx3aZpdAV
         SlzlPRK23hMGq5zUkb2owhh1QwHJFI8xsw1OxCnFqeHX7CtORj6ncNAvR7Lj3zpCH1g1
         rRWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692049982; x=1692654782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0QmZQPGtJPE55mi80G8Q09KHrGIMEsU19IuSGHDLtYc=;
        b=JU/t1DOl+kdFhNkqsDF4/PGZXqffY6inofvuZPnJmL7x40wJbORv0tTV092QrqXGjo
         K/m992DZgfkGO0qrIdJiTnMx/uIppio2wSkYLdY5xKMQxd/yLom9Ye0HfSYmBLLRiP86
         0fy41qXsJoujPrZfnU7izBTP0f9CLKeZyBAjHudcw0CkcpFL0oMCtOMfJ3aXNmV49hCc
         kbSDwGhEyPMYWN4EysJA44hDBu0sF8zCeICFcZQz7qww1ALzrZeXCvjfvh6hIXQMiVfw
         0Uzkb91bUro0YX+nu6TMKh7pbNmNHqWHix7b1Jp0yuKCwKD66gwMGGW1/5GsgdOt4vXg
         JbfQ==
X-Gm-Message-State: AOJu0Yzu1UaRIov6pi2raL0OWLdZDbw2rBRIPW3L6Ceh/AgN02gvBAAy
        BceSibs4yoEGEpQyTxHN3zwc6BWdlE4=
X-Google-Smtp-Source: AGHT+IHs1Crk98fAQ/oKvEsFi6Q+6CAA+GEzaVUQE27FCAmez5YTrZsNUhPSxMeg1Q1+nNv9Ast+tQ==
X-Received: by 2002:a17:902:ecc1:b0:1bd:f7d7:3bd0 with SMTP id a1-20020a170902ecc100b001bdf7d73bd0mr716639plh.5.1692049982482;
        Mon, 14 Aug 2023 14:53:02 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:9d:2:6c34:7c96:4b56:4eca])
        by smtp.gmail.com with ESMTPSA id ij13-20020a170902ab4d00b001b02bd00c61sm10056065plb.237.2023.08.14.14.53.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 14:53:02 -0700 (PDT)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Michael Hennerich <michael.hennerich@analog.com>,
        Peter Rosin <peda@axentia.se>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH RFC 4/4] i2c: slave-eeprom: convert to using a pointer in i2c_device_id
Date:   Mon, 14 Aug 2023 14:52:52 -0700
Message-ID: <20230814-i2c-id-rework-v1-4-3e5bc71c49ee@gmail.com>
X-Mailer: git-send-email 2.41.0.694.ge786442a9b-goog
In-Reply-To: <20230814-i2c-id-rework-v1-0-3e5bc71c49ee@gmail.com>
References: <20230814-i2c-id-rework-v1-0-3e5bc71c49ee@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.13-dev-099c9
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Switch the driver to use newly added "data" pointer in i2c_device_id and
introduce struct eeprom_chip to describe chip's characteristics instead
of cramming it all into an unisigned long and then decipher.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/i2c/i2c-slave-eeprom.c | 99 ++++++++++++++++++++++++++++--------------
 1 file changed, 66 insertions(+), 33 deletions(-)

diff --git a/drivers/i2c/i2c-slave-eeprom.c b/drivers/i2c/i2c-slave-eeprom.c
index 5946c0d0aef9..1d2340da5a70 100644
--- a/drivers/i2c/i2c-slave-eeprom.c
+++ b/drivers/i2c/i2c-slave-eeprom.c
@@ -16,32 +16,29 @@
  * EEPROMs, though. We currently use the 8 bit as a valid address.
  */
 
-#include <linux/bitfield.h>
 #include <linux/firmware.h>
 #include <linux/i2c.h>
 #include <linux/init.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <linux/sysfs.h>
 
+struct eeprom_chip {
+	u16 address_mask;
+	u8 num_address_bytes;
+	bool read_only;
+};
+
 struct eeprom_data {
+	const struct eeprom_chip *chip;
 	struct bin_attribute bin;
 	spinlock_t buffer_lock;
 	u16 buffer_idx;
-	u16 address_mask;
-	u8 num_address_bytes;
 	u8 idx_write_cnt;
-	bool read_only;
 	u8 buffer[];
 };
 
-#define I2C_SLAVE_BYTELEN GENMASK(15, 0)
-#define I2C_SLAVE_FLAG_ADDR16 BIT(16)
-#define I2C_SLAVE_FLAG_RO BIT(17)
-#define I2C_SLAVE_DEVICE_MAGIC(_len, _flags) ((_flags) | ((_len) - 1))
-
 static int i2c_slave_eeprom_slave_cb(struct i2c_client *client,
 				     enum i2c_slave_event event, u8 *val)
 {
@@ -49,17 +46,15 @@ static int i2c_slave_eeprom_slave_cb(struct i2c_client *client,
 
 	switch (event) {
 	case I2C_SLAVE_WRITE_RECEIVED:
-		if (eeprom->idx_write_cnt < eeprom->num_address_bytes) {
+		if (eeprom->idx_write_cnt < eeprom->chip->num_address_bytes) {
 			if (eeprom->idx_write_cnt == 0)
 				eeprom->buffer_idx = 0;
 			eeprom->buffer_idx = *val | (eeprom->buffer_idx << 8);
 			eeprom->idx_write_cnt++;
-		} else {
-			if (!eeprom->read_only) {
-				spin_lock(&eeprom->buffer_lock);
-				eeprom->buffer[eeprom->buffer_idx++ & eeprom->address_mask] = *val;
-				spin_unlock(&eeprom->buffer_lock);
-			}
+		} else if (!eeprom->chip->read_only) {
+			spin_lock(&eeprom->buffer_lock);
+			eeprom->buffer[eeprom->buffer_idx++ & eeprom->chip->address_mask] = *val;
+			spin_unlock(&eeprom->buffer_lock);
 		}
 		break;
 
@@ -69,7 +64,7 @@ static int i2c_slave_eeprom_slave_cb(struct i2c_client *client,
 		fallthrough;
 	case I2C_SLAVE_READ_REQUESTED:
 		spin_lock(&eeprom->buffer_lock);
-		*val = eeprom->buffer[eeprom->buffer_idx & eeprom->address_mask];
+		*val = eeprom->buffer[eeprom->buffer_idx & eeprom->chip->address_mask];
 		spin_unlock(&eeprom->buffer_lock);
 		/*
 		 * Do not increment buffer_idx here, because we don't know if
@@ -142,19 +137,25 @@ static int i2c_slave_init_eeprom_data(struct eeprom_data *eeprom, struct i2c_cli
 
 static int i2c_slave_eeprom_probe(struct i2c_client *client)
 {
-	const struct i2c_device_id *id = i2c_client_get_device_id(client);
+	const struct i2c_device_id *id;
+	const struct eeprom_chip *chip;
 	struct eeprom_data *eeprom;
 	int ret;
-	unsigned int size = FIELD_GET(I2C_SLAVE_BYTELEN, id->driver_data) + 1;
-	unsigned int flag_addr16 = FIELD_GET(I2C_SLAVE_FLAG_ADDR16, id->driver_data);
+	unsigned int size;
+
+	id = i2c_client_get_device_id(client);
+	if (!id)
+		return -EINVAL;
+
+	chip = id->data;
+	size = chip->address_mask + 1;
 
-	eeprom = devm_kzalloc(&client->dev, sizeof(struct eeprom_data) + size, GFP_KERNEL);
+	eeprom = devm_kzalloc(&client->dev, struct_size(eeprom, buffer, size),
+			      GFP_KERNEL);
 	if (!eeprom)
 		return -ENOMEM;
 
-	eeprom->num_address_bytes = flag_addr16 ? 2 : 1;
-	eeprom->address_mask = size - 1;
-	eeprom->read_only = FIELD_GET(I2C_SLAVE_FLAG_RO, id->driver_data);
+	eeprom->chip = chip;
 	spin_lock_init(&eeprom->buffer_lock);
 	i2c_set_clientdata(client, eeprom);
 
@@ -190,15 +191,47 @@ static void i2c_slave_eeprom_remove(struct i2c_client *client)
 	sysfs_remove_bin_file(&client->dev.kobj, &eeprom->bin);
 }
 
+static const struct eeprom_chip chip_24c02 = {
+	.address_mask = 2048 / 8 - 1, .num_address_bytes = 1,
+};
+
+static const struct eeprom_chip chip_24c02ro = {
+	.address_mask = 2048 / 8 - 1, .num_address_bytes = 1, .read_only = true,
+};
+
+static const struct eeprom_chip chip_24c32 = {
+	.address_mask = 32768 / 8 - 1, .num_address_bytes = 2,
+};
+
+static const struct eeprom_chip chip_24c32ro = {
+	.address_mask = 32768 / 8 - 1, .num_address_bytes = 2, .read_only = true,
+};
+
+static const struct eeprom_chip chip_24c64 = {
+	.address_mask = 65536 / 8 - 1, .num_address_bytes = 2,
+};
+
+static const struct eeprom_chip chip_24c64ro = {
+	.address_mask = 65536 / 8 - 1, .num_address_bytes = 2, .read_only = true,
+};
+
+static const struct eeprom_chip chip_24c512 = {
+	.address_mask = 524288 / 8 - 1, .num_address_bytes = 2,
+};
+
+static const struct eeprom_chip chip_24c512ro = {
+	.address_mask = 524288 / 8 - 1, .num_address_bytes = 2, .read_only = true,
+};
+
 static const struct i2c_device_id i2c_slave_eeprom_id[] = {
-	{ "slave-24c02", I2C_SLAVE_DEVICE_MAGIC(2048 / 8,  0) },
-	{ "slave-24c02ro", I2C_SLAVE_DEVICE_MAGIC(2048 / 8,  I2C_SLAVE_FLAG_RO) },
-	{ "slave-24c32", I2C_SLAVE_DEVICE_MAGIC(32768 / 8, I2C_SLAVE_FLAG_ADDR16) },
-	{ "slave-24c32ro", I2C_SLAVE_DEVICE_MAGIC(32768 / 8, I2C_SLAVE_FLAG_ADDR16 | I2C_SLAVE_FLAG_RO) },
-	{ "slave-24c64", I2C_SLAVE_DEVICE_MAGIC(65536 / 8, I2C_SLAVE_FLAG_ADDR16) },
-	{ "slave-24c64ro", I2C_SLAVE_DEVICE_MAGIC(65536 / 8, I2C_SLAVE_FLAG_ADDR16 | I2C_SLAVE_FLAG_RO) },
-	{ "slave-24c512", I2C_SLAVE_DEVICE_MAGIC(524288 / 8, I2C_SLAVE_FLAG_ADDR16) },
-	{ "slave-24c512ro", I2C_SLAVE_DEVICE_MAGIC(524288 / 8, I2C_SLAVE_FLAG_ADDR16 | I2C_SLAVE_FLAG_RO) },
+	{ "slave-24c02",	.data = &chip_24c02 },
+	{ "slave-24c02ro",	.data = &chip_24c02ro },
+	{ "slave-24c32",	.data = &chip_24c32 },
+	{ "slave-24c32ro",	.data = &chip_24c32ro },
+	{ "slave-24c64",	.data = &chip_24c64 },
+	{ "slave-24c64ro",	.data = &chip_24c64ro },
+	{ "slave-24c512",	.data = &chip_24c512 },
+	{ "slave-24c512ro",	.data = &chip_24c512ro },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, i2c_slave_eeprom_id);

-- 
2.41.0.694.ge786442a9b-goog

