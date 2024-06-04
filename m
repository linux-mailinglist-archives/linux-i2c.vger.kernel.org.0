Return-Path: <linux-i2c+bounces-3770-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2168E8FA900
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Jun 2024 06:03:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 535BB1C22DC6
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Jun 2024 04:03:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9E1013F451;
	Tue,  4 Jun 2024 04:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h/jlojjw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5FF66FC3;
	Tue,  4 Jun 2024 04:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717473770; cv=none; b=r8aLbVe/nfS4IKGMcFED61C8VVhIiedlqlfO7zn2rUvJ9kw7LnFsUIrvzyy6rlmeXFeTd4TjzoeyGyPgj74v3KPHc6MZCRZnmvdmL2xtuKoRhrcW+yj1slvA8iy2rf9A2WuY+BqHNvDyhwyFAF48As9zdxxSIHiO0gCeMJExIRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717473770; c=relaxed/simple;
	bh=cp3gGy8jbO+HJQqpO4g80sJliJPUU3iU/RUAiBc0jls=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=F/5O7G9qh7GQ+dT9cXiOaDoyKYQNmAEihTLU9+sxeUTtTGNiUwf96wVKg1Mot9Oyt7Me8ADm6K7Ywn0Su817en8xukUG4YK0ngJ82uIVNAg7wsG6KFVOGMvzn34qfuz2LdjUc48ccKIlElAxiyH1EJq//Lc7tYHkNX0kc9/vWKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h/jlojjw; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-6c5a6151ff8so487267a12.2;
        Mon, 03 Jun 2024 21:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717473768; x=1718078568; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a/xaXRuI41H0cRVm8fsZxtdix0uP1OIzLni7sxwaT4Q=;
        b=h/jlojjwgtoaW5t8vxTsjaTjHrKFOCmLCX+yLOEh21KAYaa76ZCS29IvQS+mYdhhH1
         fFdKmRr4l5Hi8Kg/AmSWyOPyNLmCLapa3vo3A+/qz0VhIngqY1saWJ+4L+9PoOaHH+Tr
         Se1VkF4i4cJsArcNWm+bxXr824a5i9424EMLkeiZvd61JC5B9N8/TqcdUku6r0ucoBZ3
         Hbagm3EMY5gjadeQzAdQktIdzp1eEJpzhuLTGdhsw/PnJQtJNUeF2nqY72PswvZuYopT
         P0p39gos1VQ3sogfeYQEjSz7EHjdHsFbgmLnBnVKZxPUsaif6lfl+RbmCb8WBK56SoDN
         xWtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717473768; x=1718078568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a/xaXRuI41H0cRVm8fsZxtdix0uP1OIzLni7sxwaT4Q=;
        b=r9D5TgmFjC40kQkG1CJpQ/+1YNk5zCwPKNxqw3nb5NPScKwBpVwRzpFqtttwFNXn29
         ZIAgcGrwtamze3Wm73mVfNX7E86d6WZIXUKS+VWci8qK9rKWPYqhMiIKtEawNguKk8Pj
         Arf/mGCooYAcn+36o57zTzHyQSwRnOYacsLO+L+IX/DE5xzSe4162qcToHCShIIkxwHR
         HMK5XseJBh5KCeEULc3zfL6CPTKRDn6GQpseyEqHkspYOpDnC/0vu62QNEHB6/75J0rR
         umf5rex3sYQdB/9GehxO43wSB4y02Dgt/DxdlST8OIV0MgK3h7csF8YdEN+qoNAsCIYT
         YBtg==
X-Forwarded-Encrypted: i=1; AJvYcCUFSP5u/I6vuPGVKzlNNTU1N2RomY5ANQirgydS+HlD8f1pWRP1NxZ3KbJoQ/LgDa3Ho2iiuNQl/ujdF6Yl3uu/nmnJHnszX4n6kboUxzBiuVXn/DivL4k/47mQozqbesjlcSJ5ORvZzA==
X-Gm-Message-State: AOJu0YxqpQnh4AL1O+HuHHEp3acVztKhipQAPVR/sBk7CGgUw4BlsUa1
	C/5NSK4z8t6trYuTEXMMVrKS7Cj9ilZqft8y8Zjg+tlRRhRK+EVcVcQQfA==
X-Google-Smtp-Source: AGHT+IFHu08PYRN6jEQnolZOFmTs5J85KJFSA1Kh6G/URpnfRtUbR/dKyK+cRFq8LA+pJ3vZBZJ8UA==
X-Received: by 2002:a05:6a21:1f20:b0:1b0:14ee:3b1b with SMTP id adf61e73a8af0-1b26f23d544mr9878532637.38.1717473767800;
        Mon, 03 Jun 2024 21:02:47 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6574f6353sm48929415ad.260.2024.06.03.21.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 21:02:47 -0700 (PDT)
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
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v4 4/6] hwmon: (spd5118) Add support for reading SPD data
Date: Mon,  3 Jun 2024 21:02:35 -0700
Message-Id: <20240604040237.1064024-5-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240604040237.1064024-1-linux@roeck-us.net>
References: <20240604040237.1064024-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for reading SPD NVMEM data from SPD5118 (Jedec JESD300)
compliant memory modules. NVMEM write operation is not supported.

NVMEM support is optional. If CONFIG_NVMEM is disabled, the driver will
still instantiate but not provide NVMEM attribute files.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v4: Use NVMEM_DEVID_NONE instead of NVMEM_DEVID_AUTO
    Ignore nvmem registration failure if nvmem support is disabled

v3: New patch

 Documentation/hwmon/spd5118.rst |   8 ++
 drivers/hwmon/spd5118.c         | 147 +++++++++++++++++++++++++++++++-
 2 files changed, 151 insertions(+), 4 deletions(-)

diff --git a/Documentation/hwmon/spd5118.rst b/Documentation/hwmon/spd5118.rst
index a15d75aa2066..ef7338f46575 100644
--- a/Documentation/hwmon/spd5118.rst
+++ b/Documentation/hwmon/spd5118.rst
@@ -53,3 +53,11 @@ temp1_crit_alarm	Temperature critical alarm
 
 Alarm attributes are sticky until read and will be cleared afterwards
 unless the alarm condition still applies.
+
+
+SPD (Serial Presence Detect) support
+------------------------------------
+
+The driver also supports reading the SPD NVRAM on SPD5118 compatible chips.
+SPD data is available from the 'eeprom' binary attribute file attached to the
+chip's I2C device.
diff --git a/drivers/hwmon/spd5118.c b/drivers/hwmon/spd5118.c
index d55c073ff5fd..5cb5e52c0a38 100644
--- a/drivers/hwmon/spd5118.c
+++ b/drivers/hwmon/spd5118.c
@@ -20,6 +20,8 @@
 #include <linux/i2c.h>
 #include <linux/hwmon.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/nvmem-provider.h>
 #include <linux/pm.h>
 #include <linux/regmap.h>
 #include <linux/units.h>
@@ -53,12 +55,31 @@ static const unsigned short normal_i2c[] = {
 
 #define SPD5118_TS_DISABLE		BIT(0)	/* temperature sensor disable */
 
+#define SPD5118_LEGACY_MODE_ADDR	BIT(3)
+#define SPD5118_LEGACY_PAGE_MASK	GENMASK(2, 0)
+#define SPD5118_LEGACY_MODE_MASK	(SPD5118_LEGACY_MODE_ADDR | SPD5118_LEGACY_PAGE_MASK)
+
+
+#define SPD5118_NUM_PAGES		8
+#define SPD5118_PAGE_SIZE		128
+#define SPD5118_PAGE_SHIFT		7
+#define SPD5118_PAGE_MASK		GENMASK(6, 0)
+#define SPD5118_EEPROM_BASE		0x80
+#define SPD5118_EEPROM_SIZE		(SPD5118_PAGE_SIZE * SPD5118_NUM_PAGES)
+
 /* Temperature unit in millicelsius */
 #define SPD5118_TEMP_UNIT		(MILLIDEGREE_PER_DEGREE / 4)
 /* Representable temperature range in millicelsius */
 #define SPD5118_TEMP_RANGE_MIN		-256000
 #define SPD5118_TEMP_RANGE_MAX		255750
 
+struct spd5118_data {
+	struct regmap *regmap;
+	struct mutex nvmem_lock;
+};
+
+/* hwmon */
+
 static int spd5118_temp_from_reg(u16 reg)
 {
 	int temp = sign_extend32(reg >> 2, 10);
@@ -360,9 +381,111 @@ static const struct hwmon_chip_info spd5118_chip_info = {
 	.info = spd5118_info,
 };
 
+/* nvmem */
+
+static int spd5118_nvmem_set_page(struct regmap *regmap, int page)
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
+static ssize_t spd5118_nvmem_read_page(struct regmap *regmap, char *buf,
+				       unsigned int offset, size_t count)
+{
+	int err;
+
+	err = spd5118_nvmem_set_page(regmap, offset >> SPD5118_PAGE_SHIFT);
+	if (err)
+		return err;
+
+	offset &= SPD5118_PAGE_MASK;
+
+	/* Can't cross page boundaries */
+	if (offset + count > SPD5118_PAGE_SIZE)
+		count = SPD5118_PAGE_SIZE - offset;
+
+	err = regmap_bulk_read(regmap, SPD5118_EEPROM_BASE + offset, buf, count);
+	if (err)
+		return err;
+
+	return count;
+}
+
+static int spd5118_nvmem_read(void *priv, unsigned int off, void *val, size_t count)
+{
+	struct spd5118_data *data = priv;
+	char *buf = val;
+	int ret;
+
+	if (unlikely(!count))
+		return count;
+
+	if (off + count > SPD5118_EEPROM_SIZE)
+		return -EINVAL;
+
+	mutex_lock(&data->nvmem_lock);
+
+	while (count) {
+		ret = spd5118_nvmem_read_page(data->regmap, buf, off, count);
+		if (ret < 0) {
+			mutex_unlock(&data->nvmem_lock);
+			return ret;
+		}
+		buf += ret;
+		off += ret;
+		count -= ret;
+	}
+	mutex_unlock(&data->nvmem_lock);
+	return 0;
+}
+
+static int spd5118_nvmem_init(struct device *dev, struct spd5118_data *data)
+{
+	struct nvmem_config nvmem_config = {
+		.type = NVMEM_TYPE_EEPROM,
+		.name = dev_name(dev),
+		.id = NVMEM_DEVID_NONE,
+		.dev = dev,
+		.base_dev = dev,
+		.read_only = true,
+		.root_only = false,
+		.owner = THIS_MODULE,
+		.compat = true,
+		.reg_read = spd5118_nvmem_read,
+		.priv = data,
+		.stride = 1,
+		.word_size = 1,
+		.size = SPD5118_EEPROM_SIZE,
+	};
+	struct nvmem_device *nvmem;
+
+	nvmem = devm_nvmem_register(dev, &nvmem_config);
+	return PTR_ERR_OR_ZERO(nvmem);
+}
+
+/* regmap */
+
 static bool spd5118_writeable_reg(struct device *dev, unsigned int reg)
 {
 	switch (reg) {
+	case SPD5118_REG_I2C_LEGACY_MODE:
 	case SPD5118_REG_TEMP_CLR:
 	case SPD5118_REG_TEMP_CONFIG:
 	case SPD5118_REG_TEMP_MAX:
@@ -396,7 +519,7 @@ static bool spd5118_volatile_reg(struct device *dev, unsigned int reg)
 static const struct regmap_config spd5118_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
-	.max_register = SPD5118_REG_TEMP_STATUS,
+	.max_register = 0xff,
 	.writeable_reg = spd5118_writeable_reg,
 	.volatile_reg = spd5118_volatile_reg,
 	.cache_type = REGCACHE_MAPLE,
@@ -406,10 +529,15 @@ static int spd5118_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
 	unsigned int regval, revision, vendor, bank;
+	struct spd5118_data *data;
 	struct device *hwmon_dev;
 	struct regmap *regmap;
 	int err;
 
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
 	regmap = devm_regmap_init_i2c(client, &spd5118_regmap_config);
 	if (IS_ERR(regmap))
 		return dev_err_probe(dev, PTR_ERR(regmap), "regmap init failed\n");
@@ -433,7 +561,16 @@ static int spd5118_probe(struct i2c_client *client)
 	if (!spd5118_vendor_valid(bank, vendor))
 		return -ENODEV;
 
-	dev_set_drvdata(dev, regmap);
+	data->regmap = regmap;
+	mutex_init(&data->nvmem_lock);
+	dev_set_drvdata(dev, data);
+
+	err = spd5118_nvmem_init(dev, data);
+	/* Ignore if NVMEM support is disabled */
+	if (err && err != -EOPNOTSUPP) {
+		dev_err_probe(dev, err, "failed to register nvmem\n");
+		return err;
+	}
 
 	hwmon_dev = devm_hwmon_device_register_with_info(dev, "spd5118",
 							 regmap, &spd5118_chip_info,
@@ -454,7 +591,8 @@ static int spd5118_probe(struct i2c_client *client)
 
 static int spd5118_suspend(struct device *dev)
 {
-	struct regmap *regmap = dev_get_drvdata(dev);
+	struct spd5118_data *data = dev_get_drvdata(dev);
+	struct regmap *regmap = data->regmap;
 	u32 regval;
 	int err;
 
@@ -479,7 +617,8 @@ static int spd5118_suspend(struct device *dev)
 
 static int spd5118_resume(struct device *dev)
 {
-	struct regmap *regmap = dev_get_drvdata(dev);
+	struct spd5118_data *data = dev_get_drvdata(dev);
+	struct regmap *regmap = data->regmap;
 
 	regcache_cache_only(regmap, false);
 	return regcache_sync(regmap);
-- 
2.39.2


