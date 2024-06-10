Return-Path: <linux-i2c+bounces-3950-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D4790244D
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jun 2024 16:42:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EF49A1C22129
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jun 2024 14:42:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EB2E1422B6;
	Mon, 10 Jun 2024 14:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PU2gOiS1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6354C13F450;
	Mon, 10 Jun 2024 14:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718030479; cv=none; b=IFJp9Gg0KyIIo/taACYFJhdMRnk+IWRmQaWb4pZ1e/UjmaeTkaNBha4Nc5UKdT21pDB8ohvqbOuyHaxUxWEtYZIjMh/iBjH55/xPKy0d42VJyXyyLfnRuj0e723axLlvleWFJtuw/heApm3SFOd1JoydvZ/zUGnflIDh93gpx8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718030479; c=relaxed/simple;
	bh=shikEARW8XTIQRtRy1i1PIfoqQb7U5jybyeOLhdBtvk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oyBxFDsBD6PzvcFWwAq4Yh8KIyplL7ohWUNppUw4JKKvNRL0hZQgUb4j2Dq0JJx7jlGVEOA/VhowQhaJKlXnqSFp2AgGJTs0oBX8ql9RaredCxZfakkJ6CkePIdQ2/ACOa37njCVYP4Nm4iyYavk86QP/XpIBAIEW6n7LM2/Chw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PU2gOiS1; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2c1ab9e17f6so3899686a91.1;
        Mon, 10 Jun 2024 07:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718030476; x=1718635276; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vSu3eodO6ltFeaNZljPFVoyOWCNP3NwVHj1cKcH7eTE=;
        b=PU2gOiS17c6AcG8cdbuA5VWJLH/TfidUv1Wvs3fkzuEdLkexHWcqZJ5ShH/b/Z0spY
         XcvY3YzEDS/j7Zokq9WngDBrLZA9qAItqPmP1t3FD5opzczPzqaeLwmRww27MLFqGwtP
         rxJjCcWHz8tNmjzNJ2l51nyibt5OsP59PeznwYsf7GMuDiLJXSXCA49dC7JvR3LCYIho
         KqHU+C9cHHI4jE2oMckHECOtuepouCp8uKB/sLYQ2u9/bZ4deFMg9gAy4BdDa0WXOUNy
         eGUMZ2htPZ744GdA7A69h9rA2XYk5Nrj45u4rYfhExk/X2AWAg/4MT4NnEJYOmIGF1Ta
         ELaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718030476; x=1718635276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vSu3eodO6ltFeaNZljPFVoyOWCNP3NwVHj1cKcH7eTE=;
        b=osWEmsveHoHaSLRFNZqufN+f/BP6OaESuO3Id4cTPnbnxGMdxd0pk15vVEVTmU2z3l
         +1IZyGKKpE5XuteSqRNZRYX6+fJL/SKbLcwKj0U6IeH/SlrEmXU4QtE1iTkYB+demOiD
         9WTSDUtvO8ozaRzkVT7fQVznfdWuII4sys7dq+A42jXIIxERBzGkXZ4uxd0IPr90zsOm
         ngHc5hGN+Qq/tkg6R7NS6DHrnzFcsCD71UXeUwI2968E9IeGmaowsIbzLfhoJw58gOy/
         b0Thv7UXvvohPgGc1OupzJt3AaoFVcv8D8jh0hSjzIhFI6tihT4ZNHwhgFqUpv7J47u7
         SrYw==
X-Forwarded-Encrypted: i=1; AJvYcCUf2xLkEL/O3K9+0BVantQgFgOvcjblFsefgnnGb/zgJDieLGYk2M18KXJZZBBpua1CqV1jpdNyNLrBWUrJcywSkHtikphxupaobnUH6C7yRFelLHbLUJjHDssTUf4LyRegC+XBE02UhA==
X-Gm-Message-State: AOJu0Yw6F5V0HO9rjlEOfb5DYpSGc0a9Pu0C70Z+CA/BRWLpUpwPfJp8
	l94Zj8loSC6WCtUnKLcVTVKnouBtEIGPF3A7ipvVlIETc+tUXoBDmz1e3w==
X-Google-Smtp-Source: AGHT+IGqPWvezuj9P6fxKhUmtxw8Lk+RScjVt0blWadPgwssBVjvY8Emlkeseq3P6fG8BVjwL0YkaA==
X-Received: by 2002:a17:90b:b0f:b0:2c2:d250:2813 with SMTP id 98e67ed59e1d1-2c2d2502b82mr6455469a91.1.1718030475968;
        Mon, 10 Jun 2024 07:41:15 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c28066d573sm10648230a91.17.2024.06.10.07.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 07:41:15 -0700 (PDT)
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
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v5 4/6] hwmon: (spd5118) Add support for reading SPD data
Date: Mon, 10 Jun 2024 07:41:01 -0700
Message-Id: <20240610144103.1970359-5-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240610144103.1970359-1-linux@roeck-us.net>
References: <20240610144103.1970359-1-linux@roeck-us.net>
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

Tested-by: Armin Wolf <W_Armin@gmx.de>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v5: Added Tested-by: tag
    Dropped stray double empty line    

v4: Use NVMEM_DEVID_NONE instead of NVMEM_DEVID_AUTO
    Ignore nvmem registration failure if nvmem support is disabled

v3: New patch

 Documentation/hwmon/spd5118.rst |   8 ++
 drivers/hwmon/spd5118.c         | 146 +++++++++++++++++++++++++++++++-
 2 files changed, 150 insertions(+), 4 deletions(-)

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
index d55c073ff5fd..de6cf07f3007 100644
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
@@ -53,12 +55,30 @@ static const unsigned short normal_i2c[] = {
 
 #define SPD5118_TS_DISABLE		BIT(0)	/* temperature sensor disable */
 
+#define SPD5118_LEGACY_MODE_ADDR	BIT(3)
+#define SPD5118_LEGACY_PAGE_MASK	GENMASK(2, 0)
+#define SPD5118_LEGACY_MODE_MASK	(SPD5118_LEGACY_MODE_ADDR | SPD5118_LEGACY_PAGE_MASK)
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
@@ -360,9 +380,111 @@ static const struct hwmon_chip_info spd5118_chip_info = {
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
@@ -396,7 +518,7 @@ static bool spd5118_volatile_reg(struct device *dev, unsigned int reg)
 static const struct regmap_config spd5118_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
-	.max_register = SPD5118_REG_TEMP_STATUS,
+	.max_register = 0xff,
 	.writeable_reg = spd5118_writeable_reg,
 	.volatile_reg = spd5118_volatile_reg,
 	.cache_type = REGCACHE_MAPLE,
@@ -406,10 +528,15 @@ static int spd5118_probe(struct i2c_client *client)
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
@@ -433,7 +560,16 @@ static int spd5118_probe(struct i2c_client *client)
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
@@ -454,7 +590,8 @@ static int spd5118_probe(struct i2c_client *client)
 
 static int spd5118_suspend(struct device *dev)
 {
-	struct regmap *regmap = dev_get_drvdata(dev);
+	struct spd5118_data *data = dev_get_drvdata(dev);
+	struct regmap *regmap = data->regmap;
 	u32 regval;
 	int err;
 
@@ -479,7 +616,8 @@ static int spd5118_suspend(struct device *dev)
 
 static int spd5118_resume(struct device *dev)
 {
-	struct regmap *regmap = dev_get_drvdata(dev);
+	struct spd5118_data *data = dev_get_drvdata(dev);
+	struct regmap *regmap = data->regmap;
 
 	regcache_cache_only(regmap, false);
 	return regcache_sync(regmap);
-- 
2.39.2


