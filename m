Return-Path: <linux-i2c+bounces-13232-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B7819BA5D5A
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Sep 2025 12:20:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 42DF92A18C4
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Sep 2025 10:20:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAEF72DC334;
	Sat, 27 Sep 2025 10:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BDXLUEoH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7804C2DAFC7
	for <linux-i2c@vger.kernel.org>; Sat, 27 Sep 2025 10:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758968396; cv=none; b=JgkOcvmL/g5eyPjnW6vo1eEqOCIPiooD/OAc4iqAY2nE0biupTN7p5brnHTz5LNZGDBYNRqmwxiXq7z8dfHYEQFw+P2qQWtVDXGsFOCXA1nJqIEvNhr2Vhx/2/D+FQKKCHoQx1bUtkStzCWnSwBXKF7bfP0Z2tXNZ3N66f6ojYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758968396; c=relaxed/simple;
	bh=e1QmY1QLK1yolowpwxNvclifAJinhERgzj4RMDddsB8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hZyFq1eOCq5GwqvEfxdBhY7Xunc1nf57GLBDF3VsZ0IMQbbuhZwU2YFQFydG498fgHJ5XmuPiAIdJnEyr/fIgmgM4rY1iAyLaCeMann2NpLXkThWkj2FoFRonRzuH/4IGjqL0RXWrcx2EOL2qIjVgqnEq6zysm+wx9IetXRnCfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BDXLUEoH; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-46e42deffa8so14063405e9.0
        for <linux-i2c@vger.kernel.org>; Sat, 27 Sep 2025 03:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758968393; x=1759573193; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=od1k1bZUO2AlNGRYR4IfvamUlDJTyLsYC0w2AJXA07Q=;
        b=BDXLUEoHgppZXzCDhmuG/dVLmN0pnM3Opz2ojDb4DfJSFid93qO1AdiMNRMvqPuvGe
         cEY8dtEVyr/I6HKAb61xPqprc8twMAaSg9Xbnz+bSrdKF8dv+j41ZWk0lKRI1EV9BtrU
         iEoY2GnuVo6ECpVzONFYG8VRvWtRX6C3snEjWibTlsv40a+m66TAxlwQOjKcAvJkdtJp
         CXsOkAi5SXqKkfxayrJB2A++oYvN1DwgeYDjBi64BMHziQ4Pi8yE38GHB2FVke/Qchnv
         edirVmA7zaH4KUNPQsiS2NubTng4uYyha2cJCbkzcfDhcdIvs4DQSUlNPyyTx1ES3shg
         AWyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758968393; x=1759573193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=od1k1bZUO2AlNGRYR4IfvamUlDJTyLsYC0w2AJXA07Q=;
        b=PncQ6Zqs4oyVVdH/q0JoOD+4ZMIH0O7Ro0jwSKCkXTjozRTpdaz+6+8zqnYSj9Ds6l
         Jp5L2l17kCpbX98H2RhD/6l2cf2IBID0Rr06Exkgg5CAwNrsWjzyVbulCjiwksygOmfo
         zbJlptjt9+FkPV4PlHUuflS3JhlIT7TfNkLFxC4q+jVY6/NNFt+CLcVJtoC5jLsHLmM6
         rNbuGD2m0gw0MciUXEVP67NGc1GYlrDct/+NGr5jZOePjiCvS5nyRWry0TJ8qRhV5Y3z
         mVIhMeCRRc8tzDOlugP5R/PmeLo6wXv+qVa9g+AWjz5QGygIFEqVDvfUf83dRibUJLc1
         Wdsw==
X-Gm-Message-State: AOJu0Ywar2tj5ndce3BFa4J30OiV4QvAZn/wvk0k7FjubjfTyh22bCqr
	dtFRznjTLM9tHIFO3D21kmiP8HxSCuyplAg4oT2wF0EWuQqbqJwBPFBL
X-Gm-Gg: ASbGncsSgkOtPVHktgu/fokrWX7VZAic6cSpe4oLSCu13x9cFIpErNKvtEL/IMd/jac
	8mEeCDgGd+9bWlS3IfQfRdejDJqcURe26l0v8/FEilff0PnU4Qo2x7VEwxeHKsQKO1ZTgriZ/Im
	+jaBGgjA7rPbZvv/IKCtTyUuqH5vu/yQxczfmrJrivPbpISX6Zm05V3IudZecPpKRxcRIRFlphA
	6zE5ORBUiP+nwVFuPLqAh3HDGoahrf3b5sFX902fEe+72m9OrSxap4Sm6hnNZYiLxvKOyOQAJUQ
	QpmTHVyHM4weHiKl6uhmamnGiE06Wwwefmxt9IA+HBnTqVUaKIYFOPOah5OSUSRoeoddB+6YY8Y
	tbyqMbmUFwSA1MlQAEMMheZS0OA==
X-Google-Smtp-Source: AGHT+IFx0loLSGADa5zYBOANkYEuu39yK6GPJPG1h6g5b/JDPys1GsX9gkcBWGmOZwYgfYSVTP59XQ==
X-Received: by 2002:a05:600c:3493:b0:45f:27f7:e1 with SMTP id 5b1f17b1804b1-46e32a04d9amr107773915e9.25.1758968392459;
        Sat, 27 Sep 2025 03:19:52 -0700 (PDT)
Received: from builder.. ([2001:9e8:f11a:4416:be24:11ff:fe30:5d85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e32c31df7sm53416435e9.4.2025.09.27.03.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Sep 2025 03:19:52 -0700 (PDT)
From: Jonas Jelonek <jelonek.jonas@gmail.com>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Markus Stockhausen <markus.stockhausen@gmx.de>,
	Sven Eckelmann <sven@narfation.org>,
	Harshal Gohel <hg@simonwunderlich.de>,
	Jonas Jelonek <jelonek.jonas@gmail.com>
Subject: [PATCH v8 1/9] i2c: rtl9300: use regmap fields and API for registers
Date: Sat, 27 Sep 2025 10:19:23 +0000
Message-ID: <20250927101931.71575-2-jelonek.jonas@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250927101931.71575-1-jelonek.jonas@gmail.com>
References: <20250927101931.71575-1-jelonek.jonas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adapt the RTL9300 I2C controller driver to use more of the regmap
API, especially make use of reg_field and regmap_field instead of macros
to represent registers. Most register operations are performed through
regmap_field_* API then.

Handle SCL selection using separate chip-specific functions since this
is already known to differ between the Realtek SoC families in such a
way that this cannot be properly handled using just a different
reg_field.

This makes it easier to add support for newer generations or to handle
differences between specific revisions within a series. Just by
defining a separate driver data structure with the corresponding
register field definitions and linking it to a new compatible.

Signed-off-by: Jonas Jelonek <jelonek.jonas@gmail.com>
Tested-by: Sven Eckelmann <sven@narfation.org>
Reviewed-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
Tested-by: Chris Packham <chris.packham@alliedtelesis.co.nz> # On RTL9302C based board
Tested-by: Markus Stockhausen <markus.stockhausen@gmx.de>
---
 drivers/i2c/busses/i2c-rtl9300.c | 192 ++++++++++++++++++++-----------
 1 file changed, 124 insertions(+), 68 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rtl9300.c b/drivers/i2c/busses/i2c-rtl9300.c
index 9e6232075137..8483bab72146 100644
--- a/drivers/i2c/busses/i2c-rtl9300.c
+++ b/drivers/i2c/busses/i2c-rtl9300.c
@@ -23,97 +23,117 @@ struct rtl9300_i2c_chan {
 	u8 sda_pin;
 };
 
+enum rtl9300_i2c_reg_scope {
+	REG_SCOPE_GLOBAL,
+	REG_SCOPE_MASTER,
+};
+
+struct rtl9300_i2c_reg_field {
+	struct reg_field field;
+	enum rtl9300_i2c_reg_scope scope;
+};
+
+enum rtl9300_i2c_reg_fields {
+	F_DATA_WIDTH = 0,
+	F_DEV_ADDR,
+	F_I2C_FAIL,
+	F_I2C_TRIG,
+	F_MEM_ADDR,
+	F_MEM_ADDR_WIDTH,
+	F_RD_MODE,
+	F_RWOP,
+	F_SCL_FREQ,
+	F_SCL_SEL,
+	F_SDA_OUT_SEL,
+	F_SDA_SEL,
+
+	/* keep last */
+	F_NUM_FIELDS
+};
+
+struct rtl9300_i2c_drv_data {
+	struct rtl9300_i2c_reg_field field_desc[F_NUM_FIELDS];
+	int (*select_scl)(struct rtl9300_i2c *i2c, u8 scl);
+	u32 data_reg;
+	u8 max_nchan;
+};
+
 #define RTL9300_I2C_MUX_NCHAN	8
 
 struct rtl9300_i2c {
 	struct regmap *regmap;
 	struct device *dev;
 	struct rtl9300_i2c_chan chans[RTL9300_I2C_MUX_NCHAN];
+	struct regmap_field *fields[F_NUM_FIELDS];
 	u32 reg_base;
+	u32 data_reg;
 	u8 sda_pin;
 	struct mutex lock;
 };
 
 #define RTL9300_I2C_MST_CTRL1				0x0
-#define  RTL9300_I2C_MST_CTRL1_MEM_ADDR_OFS		8
-#define  RTL9300_I2C_MST_CTRL1_MEM_ADDR_MASK		GENMASK(31, 8)
-#define  RTL9300_I2C_MST_CTRL1_SDA_OUT_SEL_OFS		4
-#define  RTL9300_I2C_MST_CTRL1_SDA_OUT_SEL_MASK		GENMASK(6, 4)
-#define  RTL9300_I2C_MST_CTRL1_GPIO_SCL_SEL		BIT(3)
-#define  RTL9300_I2C_MST_CTRL1_RWOP			BIT(2)
-#define  RTL9300_I2C_MST_CTRL1_I2C_FAIL			BIT(1)
-#define  RTL9300_I2C_MST_CTRL1_I2C_TRIG			BIT(0)
 #define RTL9300_I2C_MST_CTRL2				0x4
-#define  RTL9300_I2C_MST_CTRL2_RD_MODE			BIT(15)
-#define  RTL9300_I2C_MST_CTRL2_DEV_ADDR_OFS		8
-#define  RTL9300_I2C_MST_CTRL2_DEV_ADDR_MASK		GENMASK(14, 8)
-#define  RTL9300_I2C_MST_CTRL2_DATA_WIDTH_OFS		4
-#define  RTL9300_I2C_MST_CTRL2_DATA_WIDTH_MASK		GENMASK(7, 4)
-#define  RTL9300_I2C_MST_CTRL2_MEM_ADDR_WIDTH_OFS	2
-#define  RTL9300_I2C_MST_CTRL2_MEM_ADDR_WIDTH_MASK	GENMASK(3, 2)
-#define  RTL9300_I2C_MST_CTRL2_SCL_FREQ_OFS		0
-#define  RTL9300_I2C_MST_CTRL2_SCL_FREQ_MASK		GENMASK(1, 0)
 #define RTL9300_I2C_MST_DATA_WORD0			0x8
 #define RTL9300_I2C_MST_DATA_WORD1			0xc
 #define RTL9300_I2C_MST_DATA_WORD2			0x10
 #define RTL9300_I2C_MST_DATA_WORD3			0x14
-
 #define RTL9300_I2C_MST_GLB_CTRL			0x384
 
 static int rtl9300_i2c_reg_addr_set(struct rtl9300_i2c *i2c, u32 reg, u16 len)
 {
-	u32 val, mask;
 	int ret;
 
-	val = len << RTL9300_I2C_MST_CTRL2_MEM_ADDR_WIDTH_OFS;
-	mask = RTL9300_I2C_MST_CTRL2_MEM_ADDR_WIDTH_MASK;
-
-	ret = regmap_update_bits(i2c->regmap, i2c->reg_base + RTL9300_I2C_MST_CTRL2, mask, val);
+	ret = regmap_field_write(i2c->fields[F_MEM_ADDR_WIDTH], len);
 	if (ret)
 		return ret;
 
-	val = reg << RTL9300_I2C_MST_CTRL1_MEM_ADDR_OFS;
-	mask = RTL9300_I2C_MST_CTRL1_MEM_ADDR_MASK;
+	return regmap_field_write(i2c->fields[F_MEM_ADDR], reg);
+}
 
-	return regmap_update_bits(i2c->regmap, i2c->reg_base + RTL9300_I2C_MST_CTRL1, mask, val);
+static int rtl9300_i2c_select_scl(struct rtl9300_i2c *i2c, u8 scl)
+{
+	return regmap_field_write(i2c->fields[F_SCL_SEL], 1);
 }
 
 static int rtl9300_i2c_config_io(struct rtl9300_i2c *i2c, u8 sda_pin)
 {
+	struct rtl9300_i2c_drv_data *drv_data;
 	int ret;
-	u32 val, mask;
 
-	ret = regmap_update_bits(i2c->regmap, RTL9300_I2C_MST_GLB_CTRL, BIT(sda_pin), BIT(sda_pin));
+	drv_data = (struct rtl9300_i2c_drv_data *)device_get_match_data(i2c->dev);
+
+	ret = regmap_field_update_bits(i2c->fields[F_SDA_SEL], BIT(sda_pin), BIT(sda_pin));
 	if (ret)
 		return ret;
 
-	val = (sda_pin << RTL9300_I2C_MST_CTRL1_SDA_OUT_SEL_OFS) |
-		RTL9300_I2C_MST_CTRL1_GPIO_SCL_SEL;
-	mask = RTL9300_I2C_MST_CTRL1_SDA_OUT_SEL_MASK | RTL9300_I2C_MST_CTRL1_GPIO_SCL_SEL;
+	ret = regmap_field_write(i2c->fields[F_SDA_OUT_SEL], sda_pin);
+	if (ret)
+		return ret;
 
-	return regmap_update_bits(i2c->regmap, i2c->reg_base + RTL9300_I2C_MST_CTRL1, mask, val);
+	return drv_data->select_scl(i2c, 0);
 }
 
 static int rtl9300_i2c_config_xfer(struct rtl9300_i2c *i2c, struct rtl9300_i2c_chan *chan,
 				   u16 addr, u16 len)
 {
-	u32 val, mask;
+	int ret;
 
 	if (len < 1 || len > 16)
 		return -EINVAL;
 
-	val = chan->bus_freq << RTL9300_I2C_MST_CTRL2_SCL_FREQ_OFS;
-	mask = RTL9300_I2C_MST_CTRL2_SCL_FREQ_MASK;
-
-	val |= addr << RTL9300_I2C_MST_CTRL2_DEV_ADDR_OFS;
-	mask |= RTL9300_I2C_MST_CTRL2_DEV_ADDR_MASK;
+	ret = regmap_field_write(i2c->fields[F_SCL_FREQ], chan->bus_freq);
+	if (ret)
+		return ret;
 
-	val |= ((len - 1) & 0xf) << RTL9300_I2C_MST_CTRL2_DATA_WIDTH_OFS;
-	mask |= RTL9300_I2C_MST_CTRL2_DATA_WIDTH_MASK;
+	ret = regmap_field_write(i2c->fields[F_DEV_ADDR], addr);
+	if (ret)
+		return ret;
 
-	mask |= RTL9300_I2C_MST_CTRL2_RD_MODE;
+	ret = regmap_field_write(i2c->fields[F_DATA_WIDTH], (len - 1) & 0xf);
+	if (ret)
+		return ret;
 
-	return regmap_update_bits(i2c->regmap, i2c->reg_base + RTL9300_I2C_MST_CTRL2, mask, val);
+	return regmap_field_write(i2c->fields[F_RD_MODE], 0);
 }
 
 static int rtl9300_i2c_read(struct rtl9300_i2c *i2c, u8 *buf, int len)
@@ -124,8 +144,7 @@ static int rtl9300_i2c_read(struct rtl9300_i2c *i2c, u8 *buf, int len)
 	if (len > 16)
 		return -EIO;
 
-	ret = regmap_bulk_read(i2c->regmap, i2c->reg_base + RTL9300_I2C_MST_DATA_WORD0,
-			       vals, ARRAY_SIZE(vals));
+	ret = regmap_bulk_read(i2c->regmap, i2c->data_reg, vals, ARRAY_SIZE(vals));
 	if (ret)
 		return ret;
 
@@ -152,52 +171,49 @@ static int rtl9300_i2c_write(struct rtl9300_i2c *i2c, u8 *buf, int len)
 		vals[reg] |= buf[i] << shift;
 	}
 
-	return regmap_bulk_write(i2c->regmap, i2c->reg_base + RTL9300_I2C_MST_DATA_WORD0,
-				vals, ARRAY_SIZE(vals));
+	return regmap_bulk_write(i2c->regmap, i2c->data_reg, vals, ARRAY_SIZE(vals));
 }
 
 static int rtl9300_i2c_writel(struct rtl9300_i2c *i2c, u32 data)
 {
-	return regmap_write(i2c->regmap, i2c->reg_base + RTL9300_I2C_MST_DATA_WORD0, data);
+	return regmap_write(i2c->regmap, i2c->data_reg, data);
 }
 
 static int rtl9300_i2c_execute_xfer(struct rtl9300_i2c *i2c, char read_write,
 				    int size, union i2c_smbus_data *data, int len)
 {
-	u32 val, mask;
+	u32 val;
 	int ret;
 
-	val = read_write == I2C_SMBUS_WRITE ? RTL9300_I2C_MST_CTRL1_RWOP : 0;
-	mask = RTL9300_I2C_MST_CTRL1_RWOP;
-
-	val |= RTL9300_I2C_MST_CTRL1_I2C_TRIG;
-	mask |= RTL9300_I2C_MST_CTRL1_I2C_TRIG;
+	ret = regmap_field_write(i2c->fields[F_RWOP], read_write == I2C_SMBUS_WRITE);
+	if (ret)
+		return ret;
 
-	ret = regmap_update_bits(i2c->regmap, i2c->reg_base + RTL9300_I2C_MST_CTRL1, mask, val);
+	ret = regmap_field_write(i2c->fields[F_I2C_TRIG], 1);
 	if (ret)
 		return ret;
 
-	ret = regmap_read_poll_timeout(i2c->regmap, i2c->reg_base + RTL9300_I2C_MST_CTRL1,
-				       val, !(val & RTL9300_I2C_MST_CTRL1_I2C_TRIG), 100, 100000);
+	ret = regmap_field_read_poll_timeout(i2c->fields[F_I2C_TRIG], val, !val, 100, 100000);
 	if (ret)
 		return ret;
 
-	if (val & RTL9300_I2C_MST_CTRL1_I2C_FAIL)
+	ret = regmap_field_read(i2c->fields[F_I2C_FAIL], &val);
+	if (ret)
+		return ret;
+	if (val)
 		return -EIO;
 
 	if (read_write == I2C_SMBUS_READ) {
 		switch (size) {
 		case I2C_SMBUS_BYTE:
 		case I2C_SMBUS_BYTE_DATA:
-			ret = regmap_read(i2c->regmap,
-					  i2c->reg_base + RTL9300_I2C_MST_DATA_WORD0, &val);
+			ret = regmap_read(i2c->regmap, i2c->data_reg, &val);
 			if (ret)
 				return ret;
 			data->byte = val & 0xff;
 			break;
 		case I2C_SMBUS_WORD_DATA:
-			ret = regmap_read(i2c->regmap,
-					  i2c->reg_base + RTL9300_I2C_MST_DATA_WORD0, &val);
+			ret = regmap_read(i2c->regmap, i2c->data_reg, &val);
 			if (ret)
 				return ret;
 			data->word = val & 0xffff;
@@ -355,9 +371,11 @@ static int rtl9300_i2c_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct rtl9300_i2c *i2c;
+	struct fwnode_handle *child;
+	struct rtl9300_i2c_drv_data *drv_data;
+	struct reg_field fields[F_NUM_FIELDS];
 	u32 clock_freq, sda_pin;
 	int ret, i = 0;
-	struct fwnode_handle *child;
 
 	i2c = devm_kzalloc(dev, sizeof(*i2c), GFP_KERNEL);
 	if (!i2c)
@@ -376,9 +394,22 @@ static int rtl9300_i2c_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, i2c);
 
-	if (device_get_child_node_count(dev) > RTL9300_I2C_MUX_NCHAN)
+	drv_data = (struct rtl9300_i2c_drv_data *)device_get_match_data(i2c->dev);
+	if (device_get_child_node_count(dev) > drv_data->max_nchan)
 		return dev_err_probe(dev, -EINVAL, "Too many channels\n");
 
+	i2c->data_reg = i2c->reg_base + drv_data->data_reg;
+	for (i = 0; i < F_NUM_FIELDS; i++) {
+		fields[i] = drv_data->field_desc[i].field;
+		if (drv_data->field_desc[i].scope == REG_SCOPE_MASTER)
+			fields[i].reg += i2c->reg_base;
+	}
+	ret = devm_regmap_field_bulk_alloc(dev, i2c->regmap, i2c->fields,
+					   fields, F_NUM_FIELDS);
+	if (ret)
+		return ret;
+
+	i = 0;
 	device_for_each_child_node(dev, child) {
 		struct rtl9300_i2c_chan *chan = &i2c->chans[i];
 		struct i2c_adapter *adap = &chan->adap;
@@ -395,7 +426,6 @@ static int rtl9300_i2c_probe(struct platform_device *pdev)
 		case I2C_MAX_STANDARD_MODE_FREQ:
 			chan->bus_freq = RTL9300_I2C_STD_FREQ;
 			break;
-
 		case I2C_MAX_FAST_MODE_FREQ:
 			chan->bus_freq = RTL9300_I2C_FAST_FREQ;
 			break;
@@ -427,11 +457,37 @@ static int rtl9300_i2c_probe(struct platform_device *pdev)
 	return 0;
 }
 
+#define GLB_REG_FIELD(reg, msb, lsb)    \
+	{ .field = REG_FIELD(reg, msb, lsb), .scope = REG_SCOPE_GLOBAL }
+#define MST_REG_FIELD(reg, msb, lsb)    \
+	{ .field = REG_FIELD(reg, msb, lsb), .scope = REG_SCOPE_MASTER }
+
+static const struct rtl9300_i2c_drv_data rtl9300_i2c_drv_data = {
+	.field_desc = {
+		[F_MEM_ADDR]		= MST_REG_FIELD(RTL9300_I2C_MST_CTRL1, 8, 31),
+		[F_SDA_OUT_SEL]		= MST_REG_FIELD(RTL9300_I2C_MST_CTRL1, 4, 6),
+		[F_SCL_SEL]		= MST_REG_FIELD(RTL9300_I2C_MST_CTRL1, 3, 3),
+		[F_RWOP]		= MST_REG_FIELD(RTL9300_I2C_MST_CTRL1, 2, 2),
+		[F_I2C_FAIL]		= MST_REG_FIELD(RTL9300_I2C_MST_CTRL1, 1, 1),
+		[F_I2C_TRIG]		= MST_REG_FIELD(RTL9300_I2C_MST_CTRL1, 0, 0),
+		[F_RD_MODE]		= MST_REG_FIELD(RTL9300_I2C_MST_CTRL2, 15, 15),
+		[F_DEV_ADDR]		= MST_REG_FIELD(RTL9300_I2C_MST_CTRL2, 8, 14),
+		[F_DATA_WIDTH]		= MST_REG_FIELD(RTL9300_I2C_MST_CTRL2, 4, 7),
+		[F_MEM_ADDR_WIDTH]	= MST_REG_FIELD(RTL9300_I2C_MST_CTRL2, 2, 3),
+		[F_SCL_FREQ]		= MST_REG_FIELD(RTL9300_I2C_MST_CTRL2, 0, 1),
+		[F_SDA_SEL]		= GLB_REG_FIELD(RTL9300_I2C_MST_GLB_CTRL, 0, 7),
+	},
+	.select_scl = rtl9300_i2c_select_scl,
+	.data_reg = RTL9300_I2C_MST_DATA_WORD0,
+	.max_nchan = RTL9300_I2C_MUX_NCHAN,
+};
+
+
 static const struct of_device_id i2c_rtl9300_dt_ids[] = {
-	{ .compatible = "realtek,rtl9301-i2c" },
-	{ .compatible = "realtek,rtl9302b-i2c" },
-	{ .compatible = "realtek,rtl9302c-i2c" },
-	{ .compatible = "realtek,rtl9303-i2c" },
+	{ .compatible = "realtek,rtl9301-i2c", .data = (void *) &rtl9300_i2c_drv_data },
+	{ .compatible = "realtek,rtl9302b-i2c", .data = (void *) &rtl9300_i2c_drv_data },
+	{ .compatible = "realtek,rtl9302c-i2c", .data = (void *) &rtl9300_i2c_drv_data },
+	{ .compatible = "realtek,rtl9303-i2c", .data = (void *) &rtl9300_i2c_drv_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, i2c_rtl9300_dt_ids);
-- 
2.48.1


