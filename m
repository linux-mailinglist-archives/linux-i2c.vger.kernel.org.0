Return-Path: <linux-i2c+bounces-194-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0360F7EE2E2
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Nov 2023 15:32:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 79D0C1F27137
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Nov 2023 14:32:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 700F3328B7;
	Thu, 16 Nov 2023 14:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nlPwjDx0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BAB319E
	for <linux-i2c@vger.kernel.org>; Thu, 16 Nov 2023 06:32:02 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-9f2a53704aaso116511166b.3
        for <linux-i2c@vger.kernel.org>; Thu, 16 Nov 2023 06:32:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700145121; x=1700749921; darn=vger.kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U9FtedVpGJCPk1aWVjpwBP0HtAUeY4SgDhXcfS+cP4k=;
        b=nlPwjDx0aBkAK36TcBgT+h36rjBftacc6hBGWOXa5AE7LaZYadih2r6qyrSETh049X
         mIfnWyA0i2TeV3JJNAI3p3UmacFjPD1jApP1y69MXi9QOsPDo9mxdkHAIzN0uEAElUVx
         F/Prx+y9dWoPp4SFQPzaNUbJ8Y5/rJOkFFKsdweYm0qAheKwOnUQBQTDxgYeBk8MV7P4
         IQG1CB7olY8XbBuaLi92FuXEPvaXmohBeppzsz4OV5qfBE0zOz/5RzodvdGO6pMSsxVY
         T5tFVPOL/IxnAYoXCp8wtY9aKVbPUlkduME74zzoINdiOM4KgBeOiSx5TI7XZdgVTrgj
         KJiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700145121; x=1700749921;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U9FtedVpGJCPk1aWVjpwBP0HtAUeY4SgDhXcfS+cP4k=;
        b=Lx5wiTYKNAOyNnfdNFw7aFWWZ1kH94Ku4aKRMWec1jnYLUfjyhsGiZqzVsvbnT4Uwh
         Dta+NbOan7r1Rzyosxvw2q2Op5JjBQiMIAHWIyIOe1zlEdJ6vpedaZiJdMlOjNFYl8AU
         x/UXAY+SQ1rhKXcVSF2Zd/H9u6fQUcTtiESSWBIJWqE7e4DaNLgdgg4SR/Ks1dp33e4h
         S9n3IR4hou9ud4dCZF2F1dTb7gCyIulBEJpVKIwVBi0sRrx+MNfaDx9RqfjzcR3+5+S7
         NkST9WADYjUlE5gC8+IhEFD/U5tvOTN0IsmuoTqC9eNBiEfaFX6o67LbGC9Xc6HmHufS
         e83g==
X-Gm-Message-State: AOJu0Yx+BXUUdVmZPS2UddkYaFmM3DPobYWyQLu7jZ/3fs/L+gEYy9x7
	RTGzysD56a5DbFP3pALcjhQZROq45oY=
X-Google-Smtp-Source: AGHT+IGIgwkX7lw/rhyAvS0aZzw/hgQJRLoxaIQFmfzR4mxgbODXh96ZInjffgH6m7Aujr1HytxKMQ==
X-Received: by 2002:a17:906:d96d:b0:9e6:59d5:7ad6 with SMTP id rp13-20020a170906d96d00b009e659d57ad6mr12070123ejb.23.1700145120552;
        Thu, 16 Nov 2023 06:32:00 -0800 (PST)
Received: from ?IPV6:2a01:c22:77a7:1500:6165:f4a3:e866:218b? (dynamic-2a01-0c22-77a7-1500-6165-f4a3-e866-218b.c22.pool.telefonica.de. [2a01:c22:77a7:1500:6165:f4a3:e866:218b])
        by smtp.googlemail.com with ESMTPSA id a26-20020a17090640da00b009e651700b92sm8480123ejk.124.2023.11.16.06.31.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Nov 2023 06:32:00 -0800 (PST)
Message-ID: <f1a216a8-e77c-49f2-8838-561349b30ab8@gmail.com>
Date: Thu, 16 Nov 2023 15:31:59 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Jean Delvare <jdelvare@suse.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v2] eeprom: ee1004: Add support for multiple i2c busses
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

There are systems with more than 8 memory slots where the i2c bus for
SPD is multiplexed. i2c_register_spd() isn't used yet on such systems,
but it's planned. So we need to extend ee1004 accordingly.
With this extension a maximum of 8 i2c busses is supported.

I don't have such a system for testing, therefore I just verified
that the driver still works on a system with a single i2c bus.

For the sake of simplicity the extension uses the existing global
mutex to protect access on all busses. This could be improved,
but we support 8 busses only, and SPD data is small and rarely
accessed, so it shouldn't be a problem.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v2:
- simplify code by using i2c_set/get_clientdata
---
 drivers/misc/eeprom/ee1004.c | 94 ++++++++++++++++++++++++------------
 1 file changed, 63 insertions(+), 31 deletions(-)

diff --git a/drivers/misc/eeprom/ee1004.c b/drivers/misc/eeprom/ee1004.c
index a1acd7713..fd12ce06a 100644
--- a/drivers/misc/eeprom/ee1004.c
+++ b/drivers/misc/eeprom/ee1004.c
@@ -31,6 +31,7 @@
  * over performance.
  */
 
+#define EE1004_MAX_BUSSES		8
 #define EE1004_ADDR_SET_PAGE		0x36
 #define EE1004_NUM_PAGES		2
 #define EE1004_PAGE_SIZE		256
@@ -42,9 +43,13 @@
  * from page selection to end of read.
  */
 static DEFINE_MUTEX(ee1004_bus_lock);
-static struct i2c_client *ee1004_set_page[EE1004_NUM_PAGES];
-static unsigned int ee1004_dev_count;
-static int ee1004_current_page;
+
+static struct ee1004_bus_data {
+	struct i2c_adapter *adap;
+	struct i2c_client *set_page[EE1004_NUM_PAGES];
+	unsigned int dev_count;
+	int current_page;
+} ee1004_bus_data[EE1004_MAX_BUSSES];
 
 static const struct i2c_device_id ee1004_ids[] = {
 	{ "ee1004", 0 },
@@ -54,11 +59,29 @@ MODULE_DEVICE_TABLE(i2c, ee1004_ids);
 
 /*-------------------------------------------------------------------------*/
 
-static int ee1004_get_current_page(void)
+static struct ee1004_bus_data *ee1004_get_bus_data(struct i2c_adapter *adap)
+{
+	int i;
+
+	for (i = 0; i < EE1004_MAX_BUSSES; i++)
+		if (ee1004_bus_data[i].adap == adap)
+			return ee1004_bus_data + i;
+
+	/* If not existent yet, create new entry */
+	for (i = 0; i < EE1004_MAX_BUSSES; i++)
+		if (!ee1004_bus_data[i].adap) {
+			ee1004_bus_data[i].adap = adap;
+			return ee1004_bus_data + i;
+		}
+
+	return NULL;
+}
+
+static int ee1004_get_current_page(struct ee1004_bus_data *bd)
 {
 	int err;
 
-	err = i2c_smbus_read_byte(ee1004_set_page[0]);
+	err = i2c_smbus_read_byte(bd->set_page[0]);
 	if (err == -ENXIO) {
 		/* Nack means page 1 is selected */
 		return 1;
@@ -72,28 +95,29 @@ static int ee1004_get_current_page(void)
 	return 0;
 }
 
-static int ee1004_set_current_page(struct device *dev, int page)
+static int ee1004_set_current_page(struct i2c_client *client, int page)
 {
+	struct ee1004_bus_data *bd = i2c_get_clientdata(client);
 	int ret;
 
-	if (page == ee1004_current_page)
+	if (page == bd->current_page)
 		return 0;
 
 	/* Data is ignored */
-	ret = i2c_smbus_write_byte(ee1004_set_page[page], 0x00);
+	ret = i2c_smbus_write_byte(bd->set_page[page], 0x00);
 	/*
 	 * Don't give up just yet. Some memory modules will select the page
 	 * but not ack the command. Check which page is selected now.
 	 */
-	if (ret == -ENXIO && ee1004_get_current_page() == page)
+	if (ret == -ENXIO && ee1004_get_current_page(bd) == page)
 		ret = 0;
 	if (ret < 0) {
-		dev_err(dev, "Failed to select page %d (%d)\n", page, ret);
+		dev_err(&client->dev, "Failed to select page %d (%d)\n", page, ret);
 		return ret;
 	}
 
-	dev_dbg(dev, "Selected page %d\n", page);
-	ee1004_current_page = page;
+	dev_dbg(&client->dev, "Selected page %d\n", page);
+	bd->current_page = page;
 
 	return 0;
 }
@@ -106,7 +130,7 @@ static ssize_t ee1004_eeprom_read(struct i2c_client *client, char *buf,
 	page = offset >> EE1004_PAGE_SHIFT;
 	offset &= (1 << EE1004_PAGE_SHIFT) - 1;
 
-	status = ee1004_set_current_page(&client->dev, page);
+	status = ee1004_set_current_page(client, page);
 	if (status)
 		return status;
 
@@ -158,17 +182,18 @@ static struct bin_attribute *ee1004_attrs[] = {
 
 BIN_ATTRIBUTE_GROUPS(ee1004);
 
-static void ee1004_cleanup(int idx)
+static void ee1004_cleanup(int idx, struct ee1004_bus_data *bd)
 {
-	if (--ee1004_dev_count == 0)
-		while (--idx >= 0) {
-			i2c_unregister_device(ee1004_set_page[idx]);
-			ee1004_set_page[idx] = NULL;
-		}
+	if (--bd->dev_count == 0) {
+		while (--idx >= 0)
+			i2c_unregister_device(bd->set_page[idx]);
+		memset(bd, 0, sizeof(struct ee1004_bus_data));
+	}
 }
 
 static int ee1004_probe(struct i2c_client *client)
 {
+	struct ee1004_bus_data *bd;
 	int err, cnr = 0;
 
 	/* Make sure we can operate on this adapter */
@@ -178,9 +203,19 @@ static int ee1004_probe(struct i2c_client *client)
 				     I2C_FUNC_SMBUS_BYTE | I2C_FUNC_SMBUS_READ_BYTE_DATA))
 		return -EPFNOSUPPORT;
 
-	/* Use 2 dummy devices for page select command */
 	mutex_lock(&ee1004_bus_lock);
-	if (++ee1004_dev_count == 1) {
+
+	bd = ee1004_get_bus_data(client->adapter);
+	if (!bd) {
+		mutex_unlock(&ee1004_bus_lock);
+		return dev_err_probe(&client->dev, -ENOSPC,
+				     "Only %d busses supported", EE1004_MAX_BUSSES);
+	}
+
+	i2c_set_clientdata(client, bd);
+
+	if (++bd->dev_count == 1) {
+		/* Use 2 dummy devices for page select command */
 		for (cnr = 0; cnr < EE1004_NUM_PAGES; cnr++) {
 			struct i2c_client *cl;
 
@@ -189,20 +224,15 @@ static int ee1004_probe(struct i2c_client *client)
 				err = PTR_ERR(cl);
 				goto err_clients;
 			}
-			ee1004_set_page[cnr] = cl;
+			bd->set_page[cnr] = cl;
 		}
 
 		/* Remember current page to avoid unneeded page select */
-		err = ee1004_get_current_page();
+		err = ee1004_get_current_page(bd);
 		if (err < 0)
 			goto err_clients;
 		dev_dbg(&client->dev, "Currently selected page: %d\n", err);
-		ee1004_current_page = err;
-	} else if (client->adapter != ee1004_set_page[0]->adapter) {
-		dev_err(&client->dev,
-			"Driver only supports devices on a single I2C bus\n");
-		err = -EOPNOTSUPP;
-		goto err_clients;
+		bd->current_page = err;
 	}
 	mutex_unlock(&ee1004_bus_lock);
 
@@ -213,7 +243,7 @@ static int ee1004_probe(struct i2c_client *client)
 	return 0;
 
  err_clients:
-	ee1004_cleanup(cnr);
+	ee1004_cleanup(cnr, bd);
 	mutex_unlock(&ee1004_bus_lock);
 
 	return err;
@@ -221,9 +251,11 @@ static int ee1004_probe(struct i2c_client *client)
 
 static void ee1004_remove(struct i2c_client *client)
 {
+	struct ee1004_bus_data *bd = i2c_get_clientdata(client);
+
 	/* Remove page select clients if this is the last device */
 	mutex_lock(&ee1004_bus_lock);
-	ee1004_cleanup(EE1004_NUM_PAGES);
+	ee1004_cleanup(EE1004_NUM_PAGES, bd);
 	mutex_unlock(&ee1004_bus_lock);
 }
 
-- 
2.42.1



