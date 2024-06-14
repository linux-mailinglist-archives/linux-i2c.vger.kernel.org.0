Return-Path: <linux-i2c+bounces-4038-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 260DF9092A5
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Jun 2024 20:59:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A116A1F225D0
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Jun 2024 18:59:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E3BE1A0B04;
	Fri, 14 Jun 2024 18:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VSKw9hQO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857C082D6D;
	Fri, 14 Jun 2024 18:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718391573; cv=none; b=DUWUExqKOSgnWvFI2QSwFJfqxO14zfdISS6SDMTfKJLNocae2XKyS16eSRDYo4/igvW2LJLaNe3BAZasuSjHG0JzN1rARfxE1QQtleS+RI4tTb0gFGkEnipsFj2jDcBpd2pcrIiBE0OwkrHMO1a0koCvWf3f957FyDlEwdluuHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718391573; c=relaxed/simple;
	bh=izinKD8qxZhmLsNG5ZHOywhsTSiCXkzhmdMCXLd6pOw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FUMgbpJ3FQXhWRJjPk0JxSvWBQTifH4L2tcwtjKoHmoeBirmksLUOnSaz2lTTWiqh5M5LkF4oreMIA6mkW6O0fwH+kHpeKJES+WzOp60lI33pr2GNIC6/UVeEUlbRcq2uLMVxPfU/VkQS7HhVYZQw2K3kILm2P8m3OMWTEdSPNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VSKw9hQO; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7024d571d8eso1970038b3a.0;
        Fri, 14 Jun 2024 11:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718391570; x=1718996370; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=FOb3CsA47zkA831K5pVYY7AgWfK/9r6iX+g6uL1ZPAU=;
        b=VSKw9hQOzgjz4fWIg0+BZqiEXX5DOsNLTdT32lPcSej4mh4xeW2IJuaKvh96CG1zBV
         DAXwXz7mzyuL3Ty5CtdmNHdMMW9WkptRODnp1GGHcQ1d8/RltRsQIUubQweR/wD+9G4m
         fMaEa+C03FOAEdWZlndJkqmjYldKqzJziXYF3uiAFRncElAfr+n8AgJtDq0fqM2/hm2V
         dF4Wp1I9O9cTcWBhrgJnG6NgwyjrnMbYtZko+Gl0J/3pOkkR7YmfttBoxzFEhXZJVyg5
         iHXN3ipbaXsfcQfzmi9t/GYmNve4oXUCQJ33GK53AfLdglCuGWU3Mcngb/6rLNJ0lVWd
         6euQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718391570; x=1718996370;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FOb3CsA47zkA831K5pVYY7AgWfK/9r6iX+g6uL1ZPAU=;
        b=igu6A99o0oRusnqkHaIVWHua2pq4ssaWPIkWlVmI1lglaothm15edoZChM/TtNXOGO
         B0IYhxpIPpchWSkZwYurRmiVlHcTOYFQiHB/RNVyzeV699hOzaH81bqqC4NSVySANktx
         D4KZ+9PP8B1n0dCxNCFaSmHHXfyoVBsgqKtHCjlDDz4QI1/bVLlPmTSQoDQuoZcs0Dks
         KhHCXg7SVGGSZoVeC5kNcyJloBA7NsH/45LD2yHX1yBFGrPPoHgzlD31GTR6yPL/Yy2q
         DNHLqhN2EPmgHn7TNVRGJUi+98v5+XY0ZRImXZMmiZnLcdl2DaCQouONvr4l6OPesSf3
         Vjiw==
X-Forwarded-Encrypted: i=1; AJvYcCVVJmXVg4bMy8PskK9JuHkFaEo0OsWRIXwxPkBjszV2di83QAAfNvdFGHnzheMGkWEBgx1UIp+B9N34vSh+tJjNMcNDJ6IfUIFtGE0nMvGcs1h8nfLTjFaJ70r/+VFokBBmo38gu9EMdA==
X-Gm-Message-State: AOJu0YxVs+BSM9e2ol5g7RL3aq+aSrAGg1ADemhpzU6anoMDwS2kvSFn
	HxUC1mFKhHXy36I0FuoI9epJq4Mgqz3w5BEBB+C+/O3pKiwAK3PoY9KVwg==
X-Google-Smtp-Source: AGHT+IEJwU9AojupZhWELDo34Lrcz7p46td1ywJEQMsWI5PAGByLqo0GspLHUDthMDyoXAtQviJzUg==
X-Received: by 2002:a05:6a20:394b:b0:1b7:f59d:fd12 with SMTP id adf61e73a8af0-1bae8263edfmr4482871637.55.1718391569788;
        Fri, 14 Jun 2024 11:59:29 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c4c466bf5fsm4288469a91.35.2024.06.14.11.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 11:59:28 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	=?UTF-8?q?Ren=C3=A9=20Rebe?= <rene@exactcode.de>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Armin Wolf <W_Armin@gmx.de>,
	Stephen Horvath <s.horvath@outlook.com.au>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Guenter Roeck <linux@roeck-us.net>,
	Sasha Kozachuk <skozachuk@google.com>,
	John Hamrick <johnham@google.com>
Subject: [RFT PATCH] hwmon: (spd5118) Add support for Renesas/ITD SPD5118 hub controllers
Date: Fri, 14 Jun 2024 11:59:24 -0700
Message-Id: <20240614185924.604672-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SPD5118 specification says, in its documentation of the page bits
in the MR11 register:

"
This register only applies to non-volatile memory (1024) Bytes) access of
SPD5 Hub device.
For volatile memory access, this register must be programmed to '000'.
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
"

Renesas/ITD SPD5118 hub controllers take this literally and disable access
to volatile memory if the page selected in MR11 is != 0. Since the BIOS or
ROMMON will access the non-volatile memory and likely select a page != 0,
this means that the driver will not instantiate since it can not identify
the chip. Even if the driver instantiates, access to volatile registers
is blocked after a nvram read operation which selects a page other than 0.

To solve the problem, add initialization code to select page 0 during
probe. Before doing that, use basic validation to ensure that this is
really a SPD5118 device and not some random EEPROM. Explicitly select
page 0 when accessing the volatile register space, and protect volatile
register access against nvmem access using the device mutex.

Cc: Sasha Kozachuk <skozachuk@google.com>
Cc: John Hamrick <johnham@google.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
This patch depends on the spd5118 patch series submitted earlier.

RFT: I was only able to test this patch with DDR5 using the Montage
Technology SPD5118 hub controller. It needs testing with the Renesas
hub controller, and could use some additional testing with other DIMMs.

 drivers/hwmon/spd5118.c | 164 +++++++++++++++++++++++++++++-----------
 1 file changed, 119 insertions(+), 45 deletions(-)

diff --git a/drivers/hwmon/spd5118.c b/drivers/hwmon/spd5118.c
index ac94a6779360..96052ef4256b 100644
--- a/drivers/hwmon/spd5118.c
+++ b/drivers/hwmon/spd5118.c
@@ -74,7 +74,7 @@ static const unsigned short normal_i2c[] = {
 
 struct spd5118_data {
 	struct regmap *regmap;
-	struct mutex nvmem_lock;
+	struct mutex access_lock;
 };
 
 /* hwmon */
@@ -92,6 +92,29 @@ static u16 spd5118_temp_to_reg(long temp)
 	return (DIV_ROUND_CLOSEST(temp, SPD5118_TEMP_UNIT) & 0x7ff) << 2;
 }
 
+static int spd5118_set_page(struct regmap *regmap, int page)
+{
+	unsigned int old_page;
+	int err;
+
+	err = regmap_read(regmap, SPD5118_REG_I2C_LEGACY_MODE, &old_page);
+	if (err)
+		return err;
+
+	if (page != (old_page & SPD5118_LEGACY_MODE_MASK)) {
+		/* Update page and explicitly select 1-byte addressing */
+		err = regmap_update_bits(regmap, SPD5118_REG_I2C_LEGACY_MODE,
+					 SPD5118_LEGACY_MODE_MASK, page);
+		if (err)
+			return err;
+
+		/* Selected new NVMEM page, drop cached data */
+		regcache_drop_region(regmap, SPD5118_EEPROM_BASE, 0xff);
+	}
+
+	return 0;
+}
+
 static int spd5118_read_temp(struct regmap *regmap, u32 attr, long *val)
 {
 	int reg, err;
@@ -174,28 +197,44 @@ static int spd5118_read_enable(struct regmap *regmap, long *val)
 static int spd5118_read(struct device *dev, enum hwmon_sensor_types type,
 			u32 attr, int channel, long *val)
 {
-	struct regmap *regmap = dev_get_drvdata(dev);
+	struct spd5118_data *data = dev_get_drvdata(dev);
+	struct regmap *regmap = data->regmap;
+	int err;
 
 	if (type != hwmon_temp)
 		return -EOPNOTSUPP;
 
+	mutex_lock(&data->access_lock);
+
+	err = spd5118_set_page(regmap, 0);
+	if (err)
+		goto unlock;
+
 	switch (attr) {
 	case hwmon_temp_input:
 	case hwmon_temp_max:
 	case hwmon_temp_min:
 	case hwmon_temp_crit:
 	case hwmon_temp_lcrit:
-		return spd5118_read_temp(regmap, attr, val);
+		err = spd5118_read_temp(regmap, attr, val);
+		break;
 	case hwmon_temp_max_alarm:
 	case hwmon_temp_min_alarm:
 	case hwmon_temp_crit_alarm:
 	case hwmon_temp_lcrit_alarm:
-		return spd5118_read_alarm(regmap, attr, val);
+		err = spd5118_read_alarm(regmap, attr, val);
+		break;
 	case hwmon_temp_enable:
-		return spd5118_read_enable(regmap, val);
+		err = spd5118_read_enable(regmap, val);
+		break;
 	default:
-		return -EOPNOTSUPP;
+		err = -EOPNOTSUPP;
+		break;
 	}
+
+unlock:
+	mutex_unlock(&data->access_lock);
+	return err;
 }
 
 static int spd5118_write_temp(struct regmap *regmap, u32 attr, long val)
@@ -256,14 +295,28 @@ static int spd5118_temp_write(struct regmap *regmap, u32 attr, long val)
 static int spd5118_write(struct device *dev, enum hwmon_sensor_types type,
 			 u32 attr, int channel, long val)
 {
-	struct regmap *regmap = dev_get_drvdata(dev);
+	struct spd5118_data *data = dev_get_drvdata(dev);
+	struct regmap *regmap = data->regmap;
+	int err;
+
+	mutex_lock(&data->access_lock);
+
+	err = spd5118_set_page(regmap, 0);
+	if (err)
+		goto unlock;
 
 	switch (type) {
 	case hwmon_temp:
-		return spd5118_temp_write(regmap, attr, val);
+		err = spd5118_temp_write(regmap, attr, val);
+		break;
 	default:
-		return -EOPNOTSUPP;
+		err = -EOPNOTSUPP;
+		break;
 	}
+
+unlock:
+	mutex_unlock(&data->access_lock);
+	return err;
 }
 
 static umode_t spd5118_is_visible(const void *_data, enum hwmon_sensor_types type,
@@ -382,35 +435,12 @@ static const struct hwmon_chip_info spd5118_chip_info = {
 
 /* nvmem */
 
-static int spd5118_nvmem_set_page(struct regmap *regmap, int page)
-{
-	unsigned int old_page;
-	int err;
-
-	err = regmap_read(regmap, SPD5118_REG_I2C_LEGACY_MODE, &old_page);
-	if (err)
-		return err;
-
-	if (page != (old_page & SPD5118_LEGACY_MODE_MASK)) {
-		/* Update page and explicitly select 1-byte addressing */
-		err = regmap_update_bits(regmap, SPD5118_REG_I2C_LEGACY_MODE,
-					 SPD5118_LEGACY_MODE_MASK, page);
-		if (err)
-			return err;
-
-		/* Selected new NVMEM page, drop cached data */
-		regcache_drop_region(regmap, SPD5118_EEPROM_BASE, 0xff);
-	}
-
-	return 0;
-}
-
 static ssize_t spd5118_nvmem_read_page(struct regmap *regmap, char *buf,
 				       unsigned int offset, size_t count)
 {
 	int err;
 
-	err = spd5118_nvmem_set_page(regmap, offset >> SPD5118_PAGE_SHIFT);
+	err = spd5118_set_page(regmap, offset >> SPD5118_PAGE_SHIFT);
 	if (err)
 		return err;
 
@@ -439,19 +469,19 @@ static int spd5118_nvmem_read(void *priv, unsigned int off, void *val, size_t co
 	if (off + count > SPD5118_EEPROM_SIZE)
 		return -EINVAL;
 
-	mutex_lock(&data->nvmem_lock);
+	mutex_lock(&data->access_lock);
 
 	while (count) {
 		ret = spd5118_nvmem_read_page(data->regmap, buf, off, count);
 		if (ret < 0) {
-			mutex_unlock(&data->nvmem_lock);
+			mutex_unlock(&data->access_lock);
 			return ret;
 		}
 		buf += ret;
 		off += ret;
 		count -= ret;
 	}
-	mutex_unlock(&data->nvmem_lock);
+	mutex_unlock(&data->access_lock);
 	return 0;
 }
 
@@ -524,15 +554,65 @@ static const struct regmap_config spd5118_regmap_config = {
 	.cache_type = REGCACHE_MAPLE,
 };
 
+static int spd5118_init(struct i2c_client *client)
+{
+	struct i2c_adapter *adapter = client->adapter;
+	int err, regval, mode;
+
+	if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_BYTE_DATA |
+				     I2C_FUNC_SMBUS_WORD_DATA))
+		return -ENODEV;
+
+	regval = i2c_smbus_read_word_swapped(client, SPD5118_REG_TYPE);
+	if (regval < 0 || (regval && regval != 0x5118))
+		return -ENODEV;
+
+	/*
+	 * If the type register returns 0, it is possible that the chip has a
+	 * non-zero page selected and takes the specification literally, i.e.
+	 * disables access to volatile registers besides the page register if
+	 * the page is not 0. Try to identify such chips.
+	 */
+	if (!regval) {
+		mode = i2c_smbus_read_byte_data(client, SPD5118_REG_I2C_LEGACY_MODE);
+		if (mode < 0 || (mode & 0xf0) || !(mode & 0x07))
+			return -ENODEV;
+
+		err = i2c_smbus_write_byte_data(client, SPD5118_REG_I2C_LEGACY_MODE, 0);
+		if (err)
+			return -ENODEV;
+
+		regval = i2c_smbus_read_word_swapped(client, SPD5118_REG_TYPE);
+		if (regval != 0x5118) {
+			i2c_smbus_write_byte_data(client, SPD5118_REG_I2C_LEGACY_MODE, mode);
+			return -ENODEV;
+		}
+	}
+
+	regval = i2c_smbus_read_byte_data(client, SPD5118_REG_CAPABILITY);
+	if (regval < 0)
+		return -ENODEV;
+
+	if (!(regval & SPD5118_CAP_TS_SUPPORT))
+		return -ENODEV;
+
+	/* We are reasonably sure that this is really a SPD5118 hub controller */
+	return 0;
+}
+
 static int spd5118_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
-	unsigned int regval, revision, vendor, bank;
+	unsigned int revision, vendor, bank;
 	struct spd5118_data *data;
 	struct device *hwmon_dev;
 	struct regmap *regmap;
 	int err;
 
+	err = spd5118_init(client);
+	if (err)
+		return err;
+
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
@@ -541,12 +621,6 @@ static int spd5118_probe(struct i2c_client *client)
 	if (IS_ERR(regmap))
 		return dev_err_probe(dev, PTR_ERR(regmap), "regmap init failed\n");
 
-	err = regmap_read(regmap, SPD5118_REG_CAPABILITY, &regval);
-	if (err)
-		return err;
-	if (!(regval & SPD5118_CAP_TS_SUPPORT))
-		return -ENODEV;
-
 	err = regmap_read(regmap, SPD5118_REG_REVISION, &revision);
 	if (err)
 		return err;
@@ -561,7 +635,7 @@ static int spd5118_probe(struct i2c_client *client)
 		return -ENODEV;
 
 	data->regmap = regmap;
-	mutex_init(&data->nvmem_lock);
+	mutex_init(&data->access_lock);
 	dev_set_drvdata(dev, data);
 
 	err = spd5118_nvmem_init(dev, data);
@@ -572,7 +646,7 @@ static int spd5118_probe(struct i2c_client *client)
 	}
 
 	hwmon_dev = devm_hwmon_device_register_with_info(dev, "spd5118",
-							 regmap, &spd5118_chip_info,
+							 data, &spd5118_chip_info,
 							 NULL);
 	if (IS_ERR(hwmon_dev))
 		return PTR_ERR(hwmon_dev);
-- 
2.39.2


