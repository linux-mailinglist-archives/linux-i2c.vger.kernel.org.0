Return-Path: <linux-i2c+bounces-11919-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C70C3B02CAA
	for <lists+linux-i2c@lfdr.de>; Sat, 12 Jul 2025 21:43:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C6E81189E69F
	for <lists+linux-i2c@lfdr.de>; Sat, 12 Jul 2025 19:43:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F27F275B12;
	Sat, 12 Jul 2025 19:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jh/zDfmi"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672AA19CD01;
	Sat, 12 Jul 2025 19:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752349405; cv=none; b=J6Id8us9jY6mHQQ5UstMVdcHPC8IY76dmqa/1mGxH3CuPXgH5vp5dGH70BGfSpvtW7+lzd0zVXpPfHuzzOi5jrYzPxO1/TRGYR7V9Z+IjghwMRnA55AqNJfif2zmBhTNKnzyYFGHutR7lkj1u5S2/R9co9IcFOjJH37gff12SQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752349405; c=relaxed/simple;
	bh=z37mv2X2bUS0Tz2w3iKUJu/SwFC4Kyls31sqrdSniGc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AGnxJakMk5SGjwwFehfFJfS5b9ZxjUJaB5a15aI9AdSh0NejtIqzBV4loT+t0YKQWLLmso0tdLZpjDTL0id6W0DS9qf0SquQG+O0c+KccVbqGvnYhcEwHFjiXvfR8vEJlbANlWEKU0R2NYIEY4dxunFq4AMUbutlTRLLeMJZOB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jh/zDfmi; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4530921461aso20115215e9.0;
        Sat, 12 Jul 2025 12:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752349402; x=1752954202; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d2vzXymIy4Lof81UiknjsyL3LH+faW/x4IFso4f7g3w=;
        b=jh/zDfmiJrKYHZcmJy52lX0aNbrJUTkVhmu5ocK2mPCRz5220mREvnrjVyl2zmxZM8
         MkKDDUQlKzuaRNfmJgCHEArKPx5cXtlC0sIm+CEwLXwhINqGZMjCYb5OwE6Kje6eVeSi
         ra3Go1Tmu5jvX6/cNfTOeEqekl/qGLQ7F67FomKkpC0h5ZGxjNG7w87et+Xd4OXE6VnB
         w1g6xO4uhG4U4MMjNiLYq7mDwkmUqtKEKgGr16iXvrNnNqOyjRZHir9bWDaYtz+HUUMP
         85sYcQxCmgZnvI0Y9ddJTUXjSXKdubBsnqFHI5v9IExgyRGhjSxL8OB7MV/Vdn6FYmDN
         jkbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752349402; x=1752954202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d2vzXymIy4Lof81UiknjsyL3LH+faW/x4IFso4f7g3w=;
        b=TcrwL8rsb2hRrQBcbWMHICyi0kdiDyncEt1Bf3TQkIbrK4R46Ysp57G3JERZnzih0s
         ezxD6d7vjaPaQzwBoD+uN+Plufpr14ShAj8/SH4XqUTwKEazr5fBEZy5SKNkg54HC3Vo
         MughtNc73iEbCMLTiRZu2CFC5EtPZnwrb5aeht6yxc6KIApzsYhHRg16shDw7iY4Ung1
         WZ67jsYufhl+sAeQfbm7JsrsNBULE8DALoI0/sNxIf59bB3nj1/fCzxT72F8ph/+GtWH
         rp0Olh/Yl6pYWfA0PkhDWkHrPxICcp9TV67nfvvgiTvs9d7+Rv6B5la7ukrGzKf8ELWg
         5OxA==
X-Forwarded-Encrypted: i=1; AJvYcCUnPOjnzOZlEgQr06PqNClSFKV6dZcG9iQcitd4a5BUShvjZ6OmF+O06vl+fZxYciTEmID7DJw6wnlSY28n@vger.kernel.org, AJvYcCXyi5kAyN46Vl3V0Ctpvzyh+XN0JDt8o59YyignqE80Vs+C572yRlAYjchf+IphZ7igq2/Vq6EJEc/8@vger.kernel.org
X-Gm-Message-State: AOJu0Yy372V45ylB2NQuhHYtkz90sAji3Z9UiQrO5fekiOk4RKR5cWaB
	LMGgJoJ29WGnmnsRfr15sXZ9DsfAiFMpxdX6EljlJVBuClFMuCHizcOXlx5LXA==
X-Gm-Gg: ASbGncv7cQrdhuimzsFs9K8/86M+hhQ/V8elqwwBgYoZvHc94t6UQnyaXJ5cZKAkVB2
	TeMkpfCNy/Dee3Iv0UxkgZSHGwmDvE2fVk/WR2B0Mo8HEhU+zXf01nJIgewtYMx5PsEHbch6jXq
	djE5cceHSWRe+mdItSCNDNVD3LJarcR9K5fe8C0RzvlPo+jthGdi9zHNumYeotaBi9llfqZKuj6
	UgdGkBNgQKadgFSn4hY1SMXBc8mh9gMVqkMcnrLaAApntGlmoPdNxZCh6gZnmB6qD9X5DVpzgZ3
	hl3k1jnkAI03xW4rfNLNug5AbAvIYRBGNLNLTN7qhinHLR+TzG4LOJGTae6/hz5BwR3iKzaJll1
	b2oMQDJS35B6cbzLYyfkmEF08lq4rmmZN9ASQFVRNwHpC6AGZw4kk
X-Google-Smtp-Source: AGHT+IE5qXOBWSWNqyzCkjzpE8V70US/ND8x/7GUnPhxXSM1tDrnAvyCxOSiDrC0Vaka+0nhUB01Dg==
X-Received: by 2002:a05:600c:444b:b0:456:fc1:c26d with SMTP id 5b1f17b1804b1-4560fc1c572mr12253465e9.2.1752349401289;
        Sat, 12 Jul 2025 12:43:21 -0700 (PDT)
Received: from builder.. (246-9-142-46.pool.kielnet.net. [46.142.9.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454d5032e9esm123422335e9.3.2025.07.12.12.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Jul 2025 12:43:21 -0700 (PDT)
From: Jonas Jelonek <jelonek.jonas@gmail.com>
To: linux-i2c@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Markus Stockhausen <markus.stockhausen@gmx.de>,
	Jonas Jelonek <jelonek.jonas@gmail.com>
Subject: [PATCH v2 1/3] i2c: rework RTL9300 I2C controller driver
Date: Sat, 12 Jul 2025 19:42:53 +0000
Message-ID: <20250712194255.7022-2-jelonek.jonas@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250712194255.7022-1-jelonek.jonas@gmail.com>
References: <20250712194255.7022-1-jelonek.jonas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rework the RTL9300 I2C controller driver to use more of the regmap
API, especially make use of reg_field and regmap_field to represent
registers instead of macros. Most register operations are performed
through regmap_field_* API then.

Handle SCL selection using separate chip-specific functions since this
is already known to differ between the Realtek SoC families in such a
way that this cannot be properly handled using just a different
reg_field.

These changes make it a lot easier to add support for newer generations
or to handle differences between specific revisions within a series.
Support can be added by defining a separate driver data structure with
the corresponding register field definitions and linking it to a new
compatible string.

Reviewed-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
Tested-by: Chris Packham <chris.packham@alliedtelesis.co.nz> # On RTL9302c
Signed-off-by: Jonas Jelonek <jelonek.jonas@gmail.com>
---
 drivers/i2c/busses/i2c-rtl9300.c | 190 ++++++++++++++++++++-----------
 1 file changed, 124 insertions(+), 66 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rtl9300.c b/drivers/i2c/busses/i2c-rtl9300.c
index e064e8a4a1f0..f8e81102ee74 100644
--- a/drivers/i2c/busses/i2c-rtl9300.c
+++ b/drivers/i2c/busses/i2c-rtl9300.c
@@ -23,94 +23,115 @@ struct rtl9300_i2c_chan {
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
 
+
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
-
-	val = chan->bus_freq << RTL9300_I2C_MST_CTRL2_SCL_FREQ_OFS;
-	mask = RTL9300_I2C_MST_CTRL2_SCL_FREQ_MASK;
+	int ret;
 
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
@@ -121,8 +142,7 @@ static int rtl9300_i2c_read(struct rtl9300_i2c *i2c, u8 *buf, int len)
 	if (len > 16)
 		return -EIO;
 
-	ret = regmap_bulk_read(i2c->regmap, i2c->reg_base + RTL9300_I2C_MST_DATA_WORD0,
-			       vals, ARRAY_SIZE(vals));
+	ret = regmap_bulk_read(i2c->regmap, i2c->data_reg, vals, ARRAY_SIZE(vals));
 	if (ret)
 		return ret;
 
@@ -149,49 +169,46 @@ static int rtl9300_i2c_write(struct rtl9300_i2c *i2c, u8 *buf, int len)
 		vals[i/4] |= buf[i];
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
-				       val, !(val & RTL9300_I2C_MST_CTRL1_I2C_TRIG), 100, 2000);
+	regmap_field_read_poll_timeout(i2c->fields[F_I2C_TRIG], val, !val, 100, 2000);
 	if (ret)
 		return ret;
 
-	if (val & RTL9300_I2C_MST_CTRL1_I2C_FAIL)
+	ret = regmap_field_read(i2c->fields[F_I2C_FAIL], &val);
+	if (ret)
+		return ret;
+	if (val)
 		return -EIO;
 
 	if (read_write == I2C_SMBUS_READ) {
 		if (size == I2C_SMBUS_BYTE || size == I2C_SMBUS_BYTE_DATA) {
-			ret = regmap_read(i2c->regmap,
-					  i2c->reg_base + RTL9300_I2C_MST_DATA_WORD0, &val);
+			ret = regmap_read(i2c->regmap, i2c->data_reg, &val);
 			if (ret)
 				return ret;
 			data->byte = val & 0xff;
 		} else if (size == I2C_SMBUS_WORD_DATA) {
-			ret = regmap_read(i2c->regmap,
-					  i2c->reg_base + RTL9300_I2C_MST_DATA_WORD0, &val);
+			ret = regmap_read(i2c->regmap, i2c->data_reg, &val);
 			if (ret)
 				return ret;
 			data->word = val & 0xffff;
@@ -331,6 +348,8 @@ static int rtl9300_i2c_probe(struct platform_device *pdev)
 	u32 clock_freq, sda_pin;
 	int ret, i = 0;
 	struct fwnode_handle *child;
+	struct rtl9300_i2c_drv_data *drv_data;
+	struct reg_field fields[F_NUM_FIELDS];
 
 	i2c = devm_kzalloc(dev, sizeof(*i2c), GFP_KERNEL);
 	if (!i2c)
@@ -349,9 +368,22 @@ static int rtl9300_i2c_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, i2c);
 
-	if (device_get_child_node_count(dev) >= RTL9300_I2C_MUX_NCHAN)
+	drv_data = (struct rtl9300_i2c_drv_data *)device_get_match_data(i2c->dev);
+	if (device_get_child_node_count(dev) >= drv_data->max_nchan)
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
@@ -400,11 +432,37 @@ static int rtl9300_i2c_probe(struct platform_device *pdev)
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


