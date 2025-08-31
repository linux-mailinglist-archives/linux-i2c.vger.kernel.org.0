Return-Path: <linux-i2c+bounces-12524-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4CAB3D1E2
	for <lists+linux-i2c@lfdr.de>; Sun, 31 Aug 2025 12:06:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 147693B790A
	for <lists+linux-i2c@lfdr.de>; Sun, 31 Aug 2025 10:06:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B517A25785C;
	Sun, 31 Aug 2025 10:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BHua9oCL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D2825487A;
	Sun, 31 Aug 2025 10:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756634726; cv=none; b=MHIEMS5cX/EVX1ZmtkpNtjBZqKPkNk3Wd5MZFABMVYyNWOEKfb0UF4isNY8ZZ1MfhaH73mxXO82CcL6Ll9beNPsbNayfWIcdtlfdHrJ78QrP0IFv8rdrSKYCRf4B+1Cgr3RnYU8/0lCq9j83NXrkguoxwTu8ggNlUA/BBTOqiFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756634726; c=relaxed/simple;
	bh=e1QmY1QLK1yolowpwxNvclifAJinhERgzj4RMDddsB8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bTfR5ZlJ6BtMo5RthH3Aqc2uxLegLTkB/ej3Y2IIDFaxcqeVGlxoReXKCtQtnJaeOyCE8qm4h+ZyGa1KOjptiut39HfMCCvz+Fao3FxEH04EzSEeydHcn6WK30kwPbJrjOeGA6AytcqvxFCIS0yOsMFI6MUHcE/RiJqfRh3tjXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BHua9oCL; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3b9edf4cf6cso2706379f8f.3;
        Sun, 31 Aug 2025 03:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756634723; x=1757239523; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=od1k1bZUO2AlNGRYR4IfvamUlDJTyLsYC0w2AJXA07Q=;
        b=BHua9oCL+scS36jzdDKg3u7GFtXn0j9jKR85klhr6XCQaVYoikCbQ/3hOaWmurnUiR
         2EugoA5KdfE4DozGavx3LRbXyPT1uXAg+8xNd/6nWaZES0gpfseTV6cCF/JEK9kznhHF
         Fb7h94+m1Es/AfSrVIJW836tC92ZwWiNrRMbk+BZDDx+wRg2RILcvnH62U4iX2375QO1
         tlu1mvaH1G8gSyAPmvAZ0vSFyoQ06Z5BW1ZW5rKLuKTQkumYhkzCULjTYQwo7jp1FPzK
         On4Pv600FjSGMuJkppcyW3YwhOW4dsGTrvr5OcAnpfv8isSIhPvHFybvWn6k+G9nFzs1
         yGLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756634723; x=1757239523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=od1k1bZUO2AlNGRYR4IfvamUlDJTyLsYC0w2AJXA07Q=;
        b=OPwBh6ANYjoh12KhR2XC1UD+80oomjVcaQ8CC5FDfB2bp1GK2cqBsn+SpSjKgeJi7X
         tXY5y4Vu5u7OYITzY6O4NLCeC6x0Bw2nW+FG7GlUj8IgAXsnJjmQ3RmuzeZjm5Y6EnVK
         8nX1pe7lNe6RBid1JQH2NaJML6Wbe2HS+XwcE2Qm63ZCzlc+4FP+qzPnHluPltUQJWno
         aII2M88D4dcDRG3oe06bd5mrkRzDLL/3vD+mzKrAnZkxzTL2KXK6zDE6iZ7qmjEU7iTd
         j6AcpTzqct1kb8sQ/Hbbs4sZj+H3qk/6rAHyLyFBfboJOUELu98tR0TNshyL275uTsOk
         40ig==
X-Forwarded-Encrypted: i=1; AJvYcCVwsMLA8EHlDoaFW2y91Fpv1sgvJGAX7INSvNbsN9SS3mDxuFBYRxHf8ePTT8b689jCitT5rW4+9i/b@vger.kernel.org, AJvYcCVzdnl2V5hmffFKSeViRRfATwhtlEpqP9THeKxLlqRBs1mlZ/7YLkYRzEaArKOEWRzHS+f0vuoX3eBHhnqD@vger.kernel.org
X-Gm-Message-State: AOJu0YwnZMxxsT/zYCYX+D4jLTpPmOENlI0uJqK7zEFqx5pwofcgK/YR
	ooVCQJ6P92Ed7l84IBQCEx9tPqLkmMrBNy7EGInWpYGBDiFrkrrxDOih
X-Gm-Gg: ASbGncvJuPr3XCQpOgNL21igWNjvj6gxfYL8OjoKxa7wckm4+vgN2WGFMAFrFoQccer
	3iXFhBeD9aFSj31dhAtpZa9W9UzI6EA6Eq+SsOyeT1hhDT5hDTAYAjb/pD1PsK5PFpgS4mPkVVP
	DgTDjgcuX/PEmOAiEL8Xht0Br56S3qMxMIQBV/N0mvK3hO/4C4SdULI6POI/kyg2nik8wpTKm5q
	78ygcXnEky9DeEbBJa3vZXEAznyirqYYF/mqf+DiU8NjHbVvVqn05+mY6RXEj8uurClF/RyAtfJ
	UTA1STCloJCAdKjk04BCKCAm9Vir5nUoyhoDwiI/2HdSRNK4jUeCpak+vdbQPTTFfNQvtT/VOPs
	yCo4jDbYn9HxHNuEW78VE+YTCZLPO9R3vUcBHD6cT8IZ9163KoxtY6Mrw9tAfxco=
X-Google-Smtp-Source: AGHT+IFqErpUlbrUHsMeO79dLfwRP1lG8w0jDbgd1dqPjOZJ0HMl/RAKe54yOMHQpDt57ObPosLFVg==
X-Received: by 2002:a05:6000:250a:b0:3ca:d8b9:a4b4 with SMTP id ffacd0b85a97d-3d1de5b06c5mr2845182f8f.35.1756634722453;
        Sun, 31 Aug 2025 03:05:22 -0700 (PDT)
Received: from builder.. (39-10-142-46.pool.kielnet.net. [46.142.10.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e68c83asm117505565e9.20.2025.08.31.03.05.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 03:05:21 -0700 (PDT)
From: Jonas Jelonek <jelonek.jonas@gmail.com>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Markus Stockhausen <markus.stockhausen@gmx.de>,
	Sven Eckelmann <sven@narfation.org>,
	Harshal Gohel <hg@simonwunderlich.de>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jonas Jelonek <jelonek.jonas@gmail.com>
Subject: [PATCH v7 04/12] i2c: rtl9300: use regmap fields and API for registers
Date: Sun, 31 Aug 2025 10:04:49 +0000
Message-ID: <20250831100457.3114-5-jelonek.jonas@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250831100457.3114-1-jelonek.jonas@gmail.com>
References: <20250831100457.3114-1-jelonek.jonas@gmail.com>
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


