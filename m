Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9DA746087A
	for <lists+linux-i2c@lfdr.de>; Sun, 28 Nov 2021 19:17:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232072AbhK1SUS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 28 Nov 2021 13:20:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344994AbhK1SSS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 28 Nov 2021 13:18:18 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0A23C061574
        for <linux-i2c@vger.kernel.org>; Sun, 28 Nov 2021 10:15:01 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id i12so12780347wmq.4
        for <linux-i2c@vger.kernel.org>; Sun, 28 Nov 2021 10:15:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to:cc:from
         :subject:content-transfer-encoding;
        bh=eNcZlAO4nxvxb5SZz8UIysTBe/2VPACzuAv+dpHMtmM=;
        b=mpGAwgpOaMJ8vsFqfO6qz1YM+j/jWcfpVw93IxrGtZaLGjpTvgNXgOzv01Xv6Z//J9
         0vQfsQuK/bxx1X1/NUmo8bkq8adrngvB6XRw5YLYkdMiLMeMSAzelChyz7Ire+3Wx9VD
         oOwhlxnwflwAgdiynaC+pVhXkQ52M0PTy/Y+VK4dtphYa/+7uHxIliAjYedyHFekNuAJ
         aqjbTgu2ZbswHrImk7jxTUGgYGUI+p0uOnyxxocFBnAj4Q8NxL4LBsTReZjuK2sUoK5W
         8Qu6VJJ1H3sb1jW7xBRJC22HAtn5vhHA8ugiprQb+dPKEe60h4yi6Yss7MwGFCvoE/CF
         UTeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:cc:from:subject:content-transfer-encoding;
        bh=eNcZlAO4nxvxb5SZz8UIysTBe/2VPACzuAv+dpHMtmM=;
        b=03PVapNEZPYUknQHm/+FAO/He+zKG/cdIgaNpIpyecoLCoSkdHsijD1XCvQTYnC1iU
         X5Wp4ak8ZXjnSboAwraMkz+onUZV/3okcLzT/f3+mNrMCzspHdcwt/9C+EQpAJe8BTBk
         gLvQb0/Y4j9nIF4+Icp2phkBqDnhmfvTaVUEWknc9bU/fDcC8Xbp/gO7NH/BKGpOv6GK
         mHk/eYNmws/COYQFrp8RnAKNHs+wXVe0eHaPXX4efjnyd4NBGPnBzhPprSqJjIF9anVH
         xvi1WixA21rrhd1hN5bF8T9bbE8QPn1KcrJb/ojSNQ/HUZSiE6ls5wXzgoVpCNh/aVWx
         mvEA==
X-Gm-Message-State: AOAM533eXG9BlI20BKoFqL8+nBMrVCrp6T3VrS9WZAH7Zh3apOAzDV/w
        j9c2YMqigP2qyDnewGJM6nA=
X-Google-Smtp-Source: ABdhPJweEZmq/tMuugtfPlkRdG61dJY5vKxO0YvIFJ/yLtJ3dIEk6OE7rF2M6UjqvQK//+gTNt5OUA==
X-Received: by 2002:a05:600c:3489:: with SMTP id a9mr31171444wmq.53.1638123300153;
        Sun, 28 Nov 2021 10:15:00 -0800 (PST)
Received: from ?IPV6:2003:ea:8f1a:f00:f5fa:c180:5ee3:5045? (p200300ea8f1a0f00f5fac1805ee35045.dip0.t-ipconnect.de. [2003:ea:8f1a:f00:f5fa:c180:5ee3:5045])
        by smtp.googlemail.com with ESMTPSA id z15sm11318904wrr.65.2021.11.28.10.14.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Nov 2021 10:14:59 -0800 (PST)
Message-ID: <d94eb710-70e8-ae76-f58d-bed80b9d61d6@gmail.com>
Date:   Sun, 28 Nov 2021 19:14:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-US
To:     Bartosz Golaszewski <brgl@bgdev.pl>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
From:   Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] eeprom: at24: remove struct at24_client
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

We use member client only to get a reference to the associated struct
device, via &client->dev. However we can get the same reference from
the associated regmap, via regmap_get_device(regmap).
Therefore struct at24_client can be removed and replaced with a regmap
pointer.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/misc/eeprom/at24.c | 53 +++++++++++++-------------------------
 1 file changed, 18 insertions(+), 35 deletions(-)

diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
index 49ab656e8..4d91c71c4 100644
--- a/drivers/misc/eeprom/at24.c
+++ b/drivers/misc/eeprom/at24.c
@@ -68,11 +68,6 @@
  * which won't work on pure SMBus systems.
  */
 
-struct at24_client {
-	struct i2c_client *client;
-	struct regmap *regmap;
-};
-
 struct at24_data {
 	/*
 	 * Lock protects against activities from other Linux tasks,
@@ -94,9 +89,9 @@ struct at24_data {
 
 	/*
 	 * Some chips tie up multiple I2C addresses; dummy devices reserve
-	 * them for us, and we'll use them with SMBus calls.
+	 * them for us.
 	 */
-	struct at24_client client[];
+	struct regmap *client_regmaps[];
 };
 
 /*
@@ -275,8 +270,8 @@ MODULE_DEVICE_TABLE(acpi, at24_acpi_ids);
  * set the byte address; on a multi-master board, another master
  * may have changed the chip's "current" address pointer.
  */
-static struct at24_client *at24_translate_offset(struct at24_data *at24,
-						 unsigned int *offset)
+static struct regmap *at24_translate_offset(struct at24_data *at24,
+					    unsigned int *offset)
 {
 	unsigned int i;
 
@@ -288,12 +283,12 @@ static struct at24_client *at24_translate_offset(struct at24_data *at24,
 		*offset &= 0xff;
 	}
 
-	return &at24->client[i];
+	return at24->client_regmaps[i];
 }
 
 static struct device *at24_base_client_dev(struct at24_data *at24)
 {
-	return &at24->client[0].client->dev;
+	return regmap_get_device(at24->client_regmaps[0]);
 }
 
 static size_t at24_adjust_read_count(struct at24_data *at24,
@@ -324,14 +319,10 @@ static ssize_t at24_regmap_read(struct at24_data *at24, char *buf,
 				unsigned int offset, size_t count)
 {
 	unsigned long timeout, read_time;
-	struct at24_client *at24_client;
-	struct i2c_client *client;
 	struct regmap *regmap;
 	int ret;
 
-	at24_client = at24_translate_offset(at24, &offset);
-	regmap = at24_client->regmap;
-	client = at24_client->client;
+	regmap = at24_translate_offset(at24, &offset);
 	count = at24_adjust_read_count(at24, offset, count);
 
 	/* adjust offset for mac and serial read ops */
@@ -346,7 +337,7 @@ static ssize_t at24_regmap_read(struct at24_data *at24, char *buf,
 		read_time = jiffies;
 
 		ret = regmap_bulk_read(regmap, offset, buf, count);
-		dev_dbg(&client->dev, "read %zu@%d --> %d (%ld)\n",
+		dev_dbg(regmap_get_device(regmap), "read %zu@%d --> %d (%ld)\n",
 			count, offset, ret, jiffies);
 		if (!ret)
 			return count;
@@ -387,14 +378,10 @@ static ssize_t at24_regmap_write(struct at24_data *at24, const char *buf,
 				 unsigned int offset, size_t count)
 {
 	unsigned long timeout, write_time;
-	struct at24_client *at24_client;
-	struct i2c_client *client;
 	struct regmap *regmap;
 	int ret;
 
-	at24_client = at24_translate_offset(at24, &offset);
-	regmap = at24_client->regmap;
-	client = at24_client->client;
+	regmap = at24_translate_offset(at24, &offset);
 	count = at24_adjust_write_count(at24, offset, count);
 	timeout = jiffies + msecs_to_jiffies(at24_write_timeout);
 
@@ -406,7 +393,7 @@ static ssize_t at24_regmap_write(struct at24_data *at24, const char *buf,
 		write_time = jiffies;
 
 		ret = regmap_bulk_write(regmap, offset, buf, count);
-		dev_dbg(&client->dev, "write %zu@%d --> %d (%ld)\n",
+		dev_dbg(regmap_get_device(regmap), "write %zu@%d --> %d (%ld)\n",
 			count, offset, ret, jiffies);
 		if (!ret)
 			return count;
@@ -538,16 +525,14 @@ static const struct at24_chip_data *at24_get_chip_data(struct device *dev)
 }
 
 static int at24_make_dummy_client(struct at24_data *at24, unsigned int index,
+				  struct i2c_client *base_client,
 				  struct regmap_config *regmap_config)
 {
-	struct i2c_client *base_client, *dummy_client;
+	struct i2c_client *dummy_client;
 	struct regmap *regmap;
-	struct device *dev;
-
-	base_client = at24->client[0].client;
-	dev = &base_client->dev;
 
-	dummy_client = devm_i2c_new_dummy_device(dev, base_client->adapter,
+	dummy_client = devm_i2c_new_dummy_device(&base_client->dev,
+						 base_client->adapter,
 						 base_client->addr + index);
 	if (IS_ERR(dummy_client))
 		return PTR_ERR(dummy_client);
@@ -556,8 +541,7 @@ static int at24_make_dummy_client(struct at24_data *at24, unsigned int index,
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
-	at24->client[index].client = dummy_client;
-	at24->client[index].regmap = regmap;
+	at24->client_regmaps[index] = regmap;
 
 	return 0;
 }
@@ -680,7 +664,7 @@ static int at24_probe(struct i2c_client *client)
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
-	at24 = devm_kzalloc(dev, struct_size(at24, client, num_addresses),
+	at24 = devm_kzalloc(dev, struct_size(at24, client_regmaps, num_addresses),
 			    GFP_KERNEL);
 	if (!at24)
 		return -ENOMEM;
@@ -692,8 +676,7 @@ static int at24_probe(struct i2c_client *client)
 	at24->read_post = cdata->read_post;
 	at24->num_addresses = num_addresses;
 	at24->offset_adj = at24_get_offset_adj(flags, byte_len);
-	at24->client[0].client = client;
-	at24->client[0].regmap = regmap;
+	at24->client_regmaps[0] = regmap;
 
 	at24->vcc_reg = devm_regulator_get(dev, "vcc");
 	if (IS_ERR(at24->vcc_reg))
@@ -709,7 +692,7 @@ static int at24_probe(struct i2c_client *client)
 
 	/* use dummy devices for multiple-address chips */
 	for (i = 1; i < num_addresses; i++) {
-		err = at24_make_dummy_client(at24, i, &regmap_config);
+		err = at24_make_dummy_client(at24, i, client, &regmap_config);
 		if (err)
 			return err;
 	}
-- 
2.34.0

