Return-Path: <linux-i2c+bounces-179-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 133EB7EC74A
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Nov 2023 16:31:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 367AF1C2096E
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Nov 2023 15:31:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AC1435F16;
	Wed, 15 Nov 2023 15:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TY2SlDEN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 986BD156F8
	for <linux-i2c@vger.kernel.org>; Wed, 15 Nov 2023 15:30:54 +0000 (UTC)
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCA0F1A3
	for <linux-i2c@vger.kernel.org>; Wed, 15 Nov 2023 07:30:52 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-545ed16b137so9863056a12.1
        for <linux-i2c@vger.kernel.org>; Wed, 15 Nov 2023 07:30:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700062251; x=1700667051; darn=vger.kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dRjPAiOXNmKtocV9QgFkbqwl7B68Xxf10fIZksHsFQI=;
        b=TY2SlDEN0fyZv5VRcrQeljD0eDSD+KJglz60JiJTsa/oT7JXy8KE494kJgSD1poPaz
         2LuCWxQJ9CEtGdgJs1ON04O9y7maoJc6x1LSONtG3uvpG55rWDX64RLzfbbkfn0ngDRS
         6qYlY8ptcvtv/vR0gU6KuS74xVLBFPGeUNYuhM7N90ePZ2+e0QgP0BtVrN0UXomINx7N
         fndGnfpKMLWBSen5q5uTACbaxxCGSocze7eF0KLAugxdvY8XBxFVTwNbqdfhBG4IJtki
         rDgDyhKUvaVm86+yXyUDJPLuIXu2Fj8Mp0puHS1kxmNe9nGfLwlKlOWpqiLU//yt2yGL
         Kbuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700062251; x=1700667051;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dRjPAiOXNmKtocV9QgFkbqwl7B68Xxf10fIZksHsFQI=;
        b=Hl898bvgbGY055KHh9j0HPoCrQl1mw4SAeocyhQr3P6zszmbBbXuMWieeDlzj9qFoj
         SBTdbpSprhbw4RTJ8n2Q/R0NkTqreakdftZ4ijPlI3MTYAL829hBpAjMEW16ztuz2LnV
         EqCg+/tg5VBkDisKcBGaJn2fkp2byVzt55b5zyFlx9+Hs2BOmKaJ4r2rcdUyrscJ7z/z
         /nhYB7oStBoJYEy/h4wRpmGnPSl+1P3ulqcwqMnKh+8Nx+gA2Jap4/TZ3O5zgAWQBVc2
         Hbf16s1Rh7M9HMrBSKm2RBUbjvGqeM8tZLV2xKujUbPr1HOabNRq4twVEWPpk1pP1Fw/
         Zz8Q==
X-Gm-Message-State: AOJu0Yzacl0tily/IHPIRrXP4XJj9lKsv2lLb85Jw7pZhyTxG4HMFXsW
	O/cPNHEciQhgVJ7ED1d+6I5KNh/tW5I=
X-Google-Smtp-Source: AGHT+IGUznwxRfi7baOhhzxBgIQ+aOMphUmcEXllgQ3iqRqcy40I8ut1J7L4NMFKkTBojfqK82xpIQ==
X-Received: by 2002:a05:6402:208:b0:53d:a6e3:3fd with SMTP id t8-20020a056402020800b0053da6e303fdmr10721841edv.2.1700062250948;
        Wed, 15 Nov 2023 07:30:50 -0800 (PST)
Received: from ?IPV6:2a01:c23:c03b:7100:5444:6587:8982:6a4d? (dynamic-2a01-0c23-c03b-7100-5444-6587-8982-6a4d.c23.pool.telefonica.de. [2a01:c23:c03b:7100:5444:6587:8982:6a4d])
        by smtp.googlemail.com with ESMTPSA id s18-20020a508d12000000b00536031525e5sm6762753eds.91.2023.11.15.07.30.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Nov 2023 07:30:50 -0800 (PST)
Message-ID: <ab18528d-e0be-49f6-8ea3-1f4e73fa353a@gmail.com>
Date: Wed, 15 Nov 2023 16:30:49 +0100
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
Subject: [PATCH] eeprom: ee1004: Add support for multiple i2c busses
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
 drivers/misc/eeprom/ee1004.c | 101 ++++++++++++++++++++++++-----------
 1 file changed, 69 insertions(+), 32 deletions(-)

diff --git a/drivers/misc/eeprom/ee1004.c b/drivers/misc/eeprom/ee1004.c
index a1acd7713..e154caf5a 100644
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
@@ -54,11 +59,30 @@ MODULE_DEVICE_TABLE(i2c, ee1004_ids);
 
 /*-------------------------------------------------------------------------*/
 
-static int ee1004_get_current_page(void)
+static int ee1004_get_bus_data_idx(struct i2c_adapter *adap)
+{
+	int i;
+
+	for (i = 0; i < EE1004_MAX_BUSSES; i++)
+		if (ee1004_bus_data[i].adap == adap)
+			return i;
+
+	/* If not existent yet, create new entry */
+	for (i = 0; i < EE1004_MAX_BUSSES; i++)
+		if (!ee1004_bus_data[i].adap) {
+			ee1004_bus_data[i].adap = adap;
+			return i;
+		}
+
+	return -ENOSPC;
+}
+
+static int ee1004_get_current_page(int bus_data_idx)
 {
+	struct ee1004_bus_data *bd = ee1004_bus_data + bus_data_idx;
 	int err;
 
-	err = i2c_smbus_read_byte(ee1004_set_page[0]);
+	err = i2c_smbus_read_byte(bd->set_page[0]);
 	if (err == -ENXIO) {
 		/* Nack means page 1 is selected */
 		return 1;
@@ -72,28 +96,30 @@ static int ee1004_get_current_page(void)
 	return 0;
 }
 
-static int ee1004_set_current_page(struct device *dev, int page)
+static int ee1004_set_current_page(struct i2c_client *client, int page)
 {
+	int bd_idx = ee1004_get_bus_data_idx(client->adapter);
+	struct ee1004_bus_data *bd = ee1004_bus_data + bd_idx;
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
+	if (ret == -ENXIO && ee1004_get_current_page(bd_idx) == page)
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
@@ -106,7 +132,7 @@ static ssize_t ee1004_eeprom_read(struct i2c_client *client, char *buf,
 	page = offset >> EE1004_PAGE_SHIFT;
 	offset &= (1 << EE1004_PAGE_SHIFT) - 1;
 
-	status = ee1004_set_current_page(&client->dev, page);
+	status = ee1004_set_current_page(client, page);
 	if (status)
 		return status;
 
@@ -158,18 +184,21 @@ static struct bin_attribute *ee1004_attrs[] = {
 
 BIN_ATTRIBUTE_GROUPS(ee1004);
 
-static void ee1004_cleanup(int idx)
+static void ee1004_cleanup(int idx, int bus_data_idx)
 {
-	if (--ee1004_dev_count == 0)
-		while (--idx >= 0) {
-			i2c_unregister_device(ee1004_set_page[idx]);
-			ee1004_set_page[idx] = NULL;
-		}
+	struct ee1004_bus_data *bd = ee1004_bus_data + bus_data_idx;
+
+	if (--bd->dev_count == 0) {
+		while (--idx >= 0)
+			i2c_unregister_device(bd->set_page[idx]);
+		memset(bd, 0, sizeof(struct ee1004_bus_data));
+	}
 }
 
 static int ee1004_probe(struct i2c_client *client)
 {
-	int err, cnr = 0;
+	struct ee1004_bus_data *bd;
+	int err, bd_idx, cnr = 0;
 
 	/* Make sure we can operate on this adapter */
 	if (!i2c_check_functionality(client->adapter,
@@ -178,9 +207,19 @@ static int ee1004_probe(struct i2c_client *client)
 				     I2C_FUNC_SMBUS_BYTE | I2C_FUNC_SMBUS_READ_BYTE_DATA))
 		return -EPFNOSUPPORT;
 
-	/* Use 2 dummy devices for page select command */
 	mutex_lock(&ee1004_bus_lock);
-	if (++ee1004_dev_count == 1) {
+
+	bd_idx = ee1004_get_bus_data_idx(client->adapter);
+	if (bd_idx < 0) {
+		mutex_unlock(&ee1004_bus_lock);
+		return dev_err_probe(&client->dev, bd_idx,
+				     "Only %d busses supported", EE1004_MAX_BUSSES);
+	}
+
+	bd = ee1004_bus_data + bd_idx;
+
+	if (++bd->dev_count == 1) {
+		/* Use 2 dummy devices for page select command */
 		for (cnr = 0; cnr < EE1004_NUM_PAGES; cnr++) {
 			struct i2c_client *cl;
 
@@ -189,20 +228,15 @@ static int ee1004_probe(struct i2c_client *client)
 				err = PTR_ERR(cl);
 				goto err_clients;
 			}
-			ee1004_set_page[cnr] = cl;
+			bd->set_page[cnr] = cl;
 		}
 
 		/* Remember current page to avoid unneeded page select */
-		err = ee1004_get_current_page();
+		err = ee1004_get_current_page(bd_idx);
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
 
@@ -213,7 +247,7 @@ static int ee1004_probe(struct i2c_client *client)
 	return 0;
 
  err_clients:
-	ee1004_cleanup(cnr);
+	ee1004_cleanup(cnr, bd_idx);
 	mutex_unlock(&ee1004_bus_lock);
 
 	return err;
@@ -221,9 +255,12 @@ static int ee1004_probe(struct i2c_client *client)
 
 static void ee1004_remove(struct i2c_client *client)
 {
+	int bd_idx;
+
 	/* Remove page select clients if this is the last device */
 	mutex_lock(&ee1004_bus_lock);
-	ee1004_cleanup(EE1004_NUM_PAGES);
+	bd_idx = ee1004_get_bus_data_idx(client->adapter);
+	ee1004_cleanup(EE1004_NUM_PAGES, bd_idx);
 	mutex_unlock(&ee1004_bus_lock);
 }
 
-- 
2.42.1


