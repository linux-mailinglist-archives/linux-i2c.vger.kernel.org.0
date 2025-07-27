Return-Path: <linux-i2c+bounces-12048-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 938DFB12F64
	for <lists+linux-i2c@lfdr.de>; Sun, 27 Jul 2025 13:48:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 058B67AA1C6
	for <lists+linux-i2c@lfdr.de>; Sun, 27 Jul 2025 11:47:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 432CC217701;
	Sun, 27 Jul 2025 11:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jA/MpsQE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448EF20E715;
	Sun, 27 Jul 2025 11:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753616891; cv=none; b=pRnMAs/nWJ2WDWJApNBe1LktK/o4BhCS3iuKq34q3UDVu6kBAw/kWa8I9++Ry9Y7hRA758wD3D4ToK0ro9SozXt6YHEj0CCbdT03fUs7aA0hkHX9rpZbuN0/qi6PVLOvsAjgVdBwUKPnooPQ4mc5MLMuv3IDA4XN3n36HIF9jm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753616891; c=relaxed/simple;
	bh=MlD857l8cHKkEZPO+iHg5hCM+5U6Q+uE27YySfa9ceI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c5MUYAAogqSXO6rXPXMDBDRVKnjxKcKjFF9Ggh4p7lWko70eeIqy3j7J+omrlM9sqWvHGkJ0MzuUEPtSfh041Hukmbl7DDc/iEuBnRiBlyy8s1U1mYJSX6yVNEUqFliJeHCkWR246ax4vW26Ea/zlmUlaHeJ9oGfXZf8+N49cVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jA/MpsQE; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a50956e5d3so2365935f8f.1;
        Sun, 27 Jul 2025 04:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753616888; x=1754221688; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=93QiYY9UXUVXVwv33Amwr6dmZ/i/JabCetPl6frAVnI=;
        b=jA/MpsQEwh4I9z5+3nuOwKjWW6RQAAQuGjA+x81+3sUyUHM0+99V6e2fGrbAcQ0eeF
         bQj0TFxgAnt/nhmRk0ou2cLdRTUHKjvQDlpnmi7234W22co/x/oEbNLyGrkvYTBgk1UG
         k7ZljhPlSziB5wOm5Pc1gAadvhrd/6pR29d7FbepqSCTLW+/HaU/DLOeo/jU0bJACk7Q
         u+TMW6uGzDRbyBBu4lkI2rVSc/hO81Ka6HyLU2GqpBP71XaVQ4rxZJhQPxOvc24bsM3Q
         VvpH+y/T1IUpVOlH2G5ca5dY4qplRXN4ueDy5JKGhTotoQEnVoMiKZUR3+RPocAzrqG/
         3qNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753616888; x=1754221688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=93QiYY9UXUVXVwv33Amwr6dmZ/i/JabCetPl6frAVnI=;
        b=T2Uh9seY3/E4tQrKq0iHqfqGS5h8sLfuQCWClc++Tk+3RKicSkl7zniswAHiOV/KGv
         Z7ZtTamZmkFs3hcOuskd1f6V/kpUIf/99a0ml2h++brVZyMpShEbtJJcasMtTVNZTi7r
         M+XWmNcHhX77gLj7RckchMeNiZ25H7cOgwogjZ12+wLyci8f56v/Ewngi0+qnhS8KiE1
         Px/EwDL3UxoSVFHgUymQWQk/vC3jEboyAhyC7Wdp3nzG2DATe1Zu6Mg2myE4fch3jMeN
         Sjl4naT6WYHffn1uMpVw0cJujTAPME0n4lZ0L5lvxFm8c74amZRVby8nDk7YnNxGrXCP
         VuhA==
X-Forwarded-Encrypted: i=1; AJvYcCUaPb42ZNUbqbiUq46G4w8H/bTax59vQan/K/VJN0lSVmvoYp+4VjVGPgPYxiSh7HGYxGJAenRegnMEGhT+@vger.kernel.org, AJvYcCUzOzKimNd0sTCGNfvDysa8Upy5bsEoRhz0kT2vWi+2XrwnkBI+h0Jm9ncqpbnU1haPKqGwwVscTVgT@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8L3kk6p8vI3n/BoEDqXQTB3rvSHuA804BrZAvHu2Fmv2M//Zk
	TnYBJY0ZlW62nCsYOTelX/bP0MnK8Gr8kRhtacsZGa9c36sRxFFggl42G5ZjcA==
X-Gm-Gg: ASbGncsTH2A24a7NSEY3V41f8R0D06kn5W7AOq917QbfBeoLRWuygpEHROBE4BBAIbw
	juoub2pi0bnvYOVoX5jY/8FCmoneElOPylsD4zEkHxSWQ6eHg61TDxG4dpirPQcVSBcooATmuHp
	W+5umEfreZqZI/rL8pP0v1MzRU+cAVjBH/9PbXt/PAINdvW9s9qFaFOiuTF4q/+Jx7XH0HfoSdp
	4jN4xrrdxWdndbhgLVaCC0RQLY3m+5tK9jCEpF0R+7svy5FCqDn3/QYugxQOm9qaE+6IerQDzNF
	VBbA5ck35skJ46kqSrn21npyXBkOof0JzQfqFmJi96nAqgVW+VGjOt3KAyhjuYDI4EpjyN+kGA9
	DL1Kdc8lju/iZUyN0T94km/FS9tdKiUpQcfPdjlM4w/Q69oPELp5ZEok=
X-Google-Smtp-Source: AGHT+IH9bsOVNKPAvPqKZPT/BnGZYcmS7mTS/6BcPKImJDxWE9os61fX61M+yypFmqN9bTklFatPSg==
X-Received: by 2002:a05:6000:25c8:b0:3a6:d2ae:1503 with SMTP id ffacd0b85a97d-3b776645228mr6381718f8f.34.1753616887439;
        Sun, 27 Jul 2025 04:48:07 -0700 (PDT)
Received: from builder.. (190-11-142-46.pool.kielnet.net. [46.142.11.190])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b778eb284fsm5621555f8f.12.2025.07.27.04.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 04:48:07 -0700 (PDT)
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
Subject: [PATCH v3 3/3] i2c: add RTL9310 support to RTL9300 I2C controller driver
Date: Sun, 27 Jul 2025 11:48:00 +0000
Message-ID: <20250727114800.3046-4-jelonek.jonas@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250727114800.3046-1-jelonek.jonas@gmail.com>
References: <20250727114800.3046-1-jelonek.jonas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the internal I2C controllers of RTL9310 series based
SoCs to the driver for RTL9300. Add register definitions, chip-specific
functions and compatible strings for known RTL9310-based SoCs RTL9311,
RTL9312 and RTL9313.

Make use of a new device tree property 'realtek,mst-id' which needs to
be specified in case both or only the second master is used. This is
required due how the register layout changed in contrast to RTL9300,
which has SCL selection in a global register instead of a
master-specific one.

Signed-off-by: Jonas Jelonek <jelonek.jonas@gmail.com>
---
 drivers/i2c/busses/i2c-rtl9300.c | 43 +++++++++++++++++++++++++++++++-
 1 file changed, 42 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-rtl9300.c b/drivers/i2c/busses/i2c-rtl9300.c
index f8e81102ee74..9bd8a62a2ba0 100644
--- a/drivers/i2c/busses/i2c-rtl9300.c
+++ b/drivers/i2c/busses/i2c-rtl9300.c
@@ -59,6 +59,7 @@ struct rtl9300_i2c_drv_data {
 };
 
 #define RTL9300_I2C_MUX_NCHAN	8
+#define RTL9310_I2C_MUX_NCHAN	12
 
 struct rtl9300_i2c {
 	struct regmap *regmap;
@@ -67,6 +68,7 @@ struct rtl9300_i2c {
 	struct regmap_field *fields[F_NUM_FIELDS];
 	u32 reg_base;
 	u32 data_reg;
+	u8 scl_num;
 	u8 sda_pin;
 	struct mutex lock;
 };
@@ -79,6 +81,11 @@ struct rtl9300_i2c {
 #define RTL9300_I2C_MST_DATA_WORD3			0x14
 #define RTL9300_I2C_MST_GLB_CTRL			0x384
 
+#define RTL9310_I2C_MST_IF_CTRL				0x1004
+#define	RTL9310_I2C_MST_IF_SEL				0x1008
+#define	RTL9310_I2C_MST_CTRL				0x0
+#define	RTL9310_I2C_MST_MEMADDR_CTRL			0x4
+#define RTL9310_I2C_MST_DATA_CTRL			0x8
 
 static int rtl9300_i2c_reg_addr_set(struct rtl9300_i2c *i2c, u32 reg, u16 len)
 {
@@ -96,6 +103,11 @@ static int rtl9300_i2c_select_scl(struct rtl9300_i2c *i2c, u8 scl)
 	return regmap_field_write(i2c->fields[F_SCL_SEL], 1);
 }
 
+static int rtl9310_i2c_select_scl(struct rtl9300_i2c *i2c, u8 scl)
+{
+	return regmap_field_update_bits(i2c->fields[F_SCL_SEL], BIT(scl), BIT(scl));
+}
+
 static int rtl9300_i2c_config_io(struct rtl9300_i2c *i2c, u8 sda_pin)
 {
 	struct rtl9300_i2c_drv_data *drv_data;
@@ -111,7 +123,7 @@ static int rtl9300_i2c_config_io(struct rtl9300_i2c *i2c, u8 sda_pin)
 	if (ret)
 		return ret;
 
-	return drv_data->select_scl(i2c, 0);
+	return drv_data->select_scl(i2c, i2c->scl_num);
 }
 
 static int rtl9300_i2c_config_xfer(struct rtl9300_i2c *i2c, struct rtl9300_i2c_chan *chan,
@@ -346,6 +358,7 @@ static int rtl9300_i2c_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct rtl9300_i2c *i2c;
 	u32 clock_freq, sda_pin;
+	u8 mst_id;
 	int ret, i = 0;
 	struct fwnode_handle *child;
 	struct rtl9300_i2c_drv_data *drv_data;
@@ -366,6 +379,11 @@ static int rtl9300_i2c_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ret = device_property_read_u8(dev, "realtek,mst-id", &mst_id);
+	if (ret || mst_id != 2)
+		mst_id = 1;
+	i2c->scl_num = mst_id - 1;
+
 	platform_set_drvdata(pdev, i2c);
 
 	drv_data = (struct rtl9300_i2c_drv_data *)device_get_match_data(i2c->dev);
@@ -457,12 +475,35 @@ static const struct rtl9300_i2c_drv_data rtl9300_i2c_drv_data = {
 	.max_nchan = RTL9300_I2C_MUX_NCHAN,
 };
 
+static const struct rtl9300_i2c_drv_data rtl9310_i2c_drv_data = {
+	.field_desc = {
+		[F_SCL_SEL]		= GLB_REG_FIELD(RTL9310_I2C_MST_IF_SEL, 12, 13),
+		[F_SDA_SEL]		= GLB_REG_FIELD(RTL9310_I2C_MST_IF_SEL, 0, 11),
+		[F_SCL_FREQ]		= MST_REG_FIELD(RTL9310_I2C_MST_CTRL, 30, 31),
+		[F_DEV_ADDR]		= MST_REG_FIELD(RTL9310_I2C_MST_CTRL, 11, 17),
+		[F_SDA_OUT_SEL]		= MST_REG_FIELD(RTL9310_I2C_MST_CTRL, 18, 21),
+		[F_MEM_ADDR_WIDTH]	= MST_REG_FIELD(RTL9310_I2C_MST_CTRL, 9, 10),
+		[F_DATA_WIDTH]		= MST_REG_FIELD(RTL9310_I2C_MST_CTRL, 5, 8),
+		[F_RD_MODE]		= MST_REG_FIELD(RTL9310_I2C_MST_CTRL, 4, 4),
+		[F_RWOP]		= MST_REG_FIELD(RTL9310_I2C_MST_CTRL, 2, 2),
+		[F_I2C_FAIL]		= MST_REG_FIELD(RTL9310_I2C_MST_CTRL, 1, 1),
+		[F_I2C_TRIG]		= MST_REG_FIELD(RTL9310_I2C_MST_CTRL, 0, 0),
+		[F_MEM_ADDR]		= MST_REG_FIELD(RTL9310_I2C_MST_MEMADDR_CTRL, 0, 23),
+	},
+	.select_scl = rtl9310_i2c_select_scl,
+	.data_reg = RTL9310_I2C_MST_DATA_CTRL,
+	.max_nchan = RTL9310_I2C_MUX_NCHAN,
+};
 
 static const struct of_device_id i2c_rtl9300_dt_ids[] = {
 	{ .compatible = "realtek,rtl9301-i2c", .data = (void *) &rtl9300_i2c_drv_data },
 	{ .compatible = "realtek,rtl9302b-i2c", .data = (void *) &rtl9300_i2c_drv_data },
 	{ .compatible = "realtek,rtl9302c-i2c", .data = (void *) &rtl9300_i2c_drv_data },
 	{ .compatible = "realtek,rtl9303-i2c", .data = (void *) &rtl9300_i2c_drv_data },
+	{ .compatible = "realtek,rtl9310-i2c", .data = (void *) &rtl9310_i2c_drv_data },
+	{ .compatible = "realtek,rtl9311-i2c", .data = (void *) &rtl9310_i2c_drv_data },
+	{ .compatible = "realtek,rtl9312-i2c", .data = (void *) &rtl9310_i2c_drv_data },
+	{ .compatible = "realtek,rtl9313-i2c", .data = (void *) &rtl9310_i2c_drv_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, i2c_rtl9300_dt_ids);
-- 
2.48.1


