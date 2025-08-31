Return-Path: <linux-i2c+bounces-12532-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 36855B3D1FA
	for <lists+linux-i2c@lfdr.de>; Sun, 31 Aug 2025 12:07:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 79F08189EAE9
	for <lists+linux-i2c@lfdr.de>; Sun, 31 Aug 2025 10:08:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13F6D2652A6;
	Sun, 31 Aug 2025 10:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TXjHFo1H"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7A825F97D;
	Sun, 31 Aug 2025 10:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756634733; cv=none; b=IwxCPNI+3DpjlMVQmWBud7LQ5HedfQ+UMoSrrz39l2+9KsAuimlupCc72Y6B6TUV5cc7eUQXn/IPPRVt+wDESXMZQay723wA1HLaMWxwdUnrPou1VVpiQ2/dkyYv5bX+5EUH+mMjVn5RzlCHB2bzks1pH0P1q1Ez5BZJ7ADgl5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756634733; c=relaxed/simple;
	bh=Vzjm7joS6TNhuBvIAFP80rG1TH5jXTY6DxX9TbFyJh4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PwbqiOJVFP6iGt/pVOmBtY8Vr5alHyU2nWdUquXMlZmF1VVQImWJ5Mq/sD1xPmAO8XtQ1y9Hk5YJCMPOjCTA48JYSnNN6/ybNtsgDe4bG068PvqIbLk3KG5KnWEZ66UCqvX92XX9tbx3k77x/GgMVmUchLajmKfIUD/xHWrXPlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TXjHFo1H; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45b89147cfbso4263815e9.3;
        Sun, 31 Aug 2025 03:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756634730; x=1757239530; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GzcOO2e4Ry0i+kLlkzZN4mufx+GKN499/UHIR5vQ3tk=;
        b=TXjHFo1HCYZhLNh+gSKW9diT7miTkltC3DAY9VB47oLCh1qFZGtLRwhmveXhuYWP8q
         Ce0k43VrmlNvM5pozCUjWsHLngaersBvXDHZTmKiNWDTui49oq0YkxlUogzoL25GT2Zk
         7RYaP/Cz6uJupm5V063JwN+NlkSePBxb1VqjckLT9iHL+CdEjRgpmgr5K9QOM+Xbms3E
         EUdXRGEPHeDG7PKu+lwFmA2xNhmYeAP97hO0JqEH9NBiB91V2iJY19YQhpEKiUFgZV38
         6+OUYT1P3+ePw654Oo5BSUd0muhwdeO3spNK4ZB1cgWnttdrOjp/BlGDx6O/kroTcriQ
         Qiig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756634730; x=1757239530;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GzcOO2e4Ry0i+kLlkzZN4mufx+GKN499/UHIR5vQ3tk=;
        b=C8TnCOov5noICOprq6s6fm42XNfLWqES3MrxHXuzHUGY6VxUx4iHnLM1nHgCUcUzir
         9ELZl10tsmKGniIOOtzlCKZYx8K+GC76EtOPS7etPxKXI2GIoO7RXqb8nEGyCcHCch36
         9vNEmt4iGIYWp+WXCKbHLGpY4a1K9CtdLi8rIlfTugt0qH+SxGYd/qbhkvHOpQAIvw7F
         nGG8mHQEJgCPkMmQA1hc7RHb3oVunJTEy4Y3yljCfOXDkg3qQO0Jd+w6Vjb59xDhBcrR
         CndjzC88PT7XEhPF4wOIoRRVPA/dilT8J7MXRoOq1tWJPhG6OVoRrM5qkyZPp6K53a8J
         wMGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgMY84WaDa74ed/HUGZLL6J4SnA0mXVFhLQflKrQIA8yKVH+kQIloj8HcFm3hIrVoDDV/366p/mS1P@vger.kernel.org, AJvYcCWC7Tnl9UbcxIoeDnnv9BA3Q1WZQZujWuSmkP9eSNLIBFgt2b/GtD7Cgvh1jbFBs26FdGbKtAn5g1fRURBD@vger.kernel.org
X-Gm-Message-State: AOJu0YwlHmlWkP3UKzTEQ1OYScDiWMfQU8RDtvf69tSocLdXRTu0SgkT
	GfsXTmcebCwMl33aRD8Qlg/9m1rG43ZhvhKOIhzIE3XL8VAM7wDOYXO3
X-Gm-Gg: ASbGncsif9fvLUbgOYHWSjEemaR6SDMKX6ftrrCrgtJ8YjI1gFHw3Qx310TKQTtXHLK
	rc0GPIxPIP7BS2x/wfcVJwZ6GqFA8xz01Kr7JcLVQJMdEtgDhobVLOZwnUlpcfLHG2FYpKRa1CD
	88i9/Kcy9t7KORGo+kOkiPYjOpcmH/0SgpzGkwV9aQ2tjKxlh5D2QOXP2ediee2mdCv45ENE885
	a9xZaTicLiXW1KMFpY5g2wlpBkcK0cDDio0uhP3lQLXiqjVT9kSqRDqapLmZhXCJKvKrWQE6gJ9
	Cjoo9JemH6ZUwq8JLNbAoICexfGzPvHc8Jeoir2lvDhjpB3zZ4B41Zymkew0uNlgQ1C2ke0jHNU
	FFhOO6fiyRkHwpWXoUN34kgW9FSLP7ahZHSTXv/X85NwQZd3kLtRPGIMPhHJhLKI=
X-Google-Smtp-Source: AGHT+IFBD/cApG8HQpujj3LWHIsNhhHzLUkJ3ts9jMF+J08udJTyquiiidHsKiTmUgLATrpyM1TN8g==
X-Received: by 2002:a05:600c:1c03:b0:45b:88ed:959b with SMTP id 5b1f17b1804b1-45b88ed9ca9mr16800685e9.29.1756634729947;
        Sun, 31 Aug 2025 03:05:29 -0700 (PDT)
Received: from builder.. (39-10-142-46.pool.kielnet.net. [46.142.10.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e68c83asm117505565e9.20.2025.08.31.03.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 03:05:29 -0700 (PDT)
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
Subject: [PATCH v7 12/12] i2c: rtl9300: add support for RTL9310 I2C controller
Date: Sun, 31 Aug 2025 10:04:57 +0000
Message-ID: <20250831100457.3114-13-jelonek.jonas@gmail.com>
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

Add support for the internal I2C controllers of RTL9310 series based
SoCs to the driver for RTL9300. Add register definitions, chip-specific
functions and compatible strings for known RTL9310-based SoCs RTL9311,
RTL9312 and RTL9313.

Make use of a new device tree property 'realtek,scl' which needs to be
specified in case both or only the second master is used. This is
required due how the register layout changed in contrast to RTL9300,
which has SCL selection in a global register instead of a
master-specific one.

Signed-off-by: Jonas Jelonek <jelonek.jonas@gmail.com>
Tested-by: Sven Eckelmann <sven@narfation.org>
Reviewed-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
Tested-by: Markus Stockhausen <markus.stockhausen@gmx.de>
---
 drivers/i2c/busses/i2c-rtl9300.c | 44 ++++++++++++++++++++++++++++++--
 1 file changed, 42 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rtl9300.c b/drivers/i2c/busses/i2c-rtl9300.c
index c67463228604..bfceca24ad7d 100644
--- a/drivers/i2c/busses/i2c-rtl9300.c
+++ b/drivers/i2c/busses/i2c-rtl9300.c
@@ -60,14 +60,16 @@ struct rtl9300_i2c_drv_data {
 };
 
 #define RTL9300_I2C_MUX_NCHAN	8
+#define RTL9310_I2C_MUX_NCHAN	12
 
 struct rtl9300_i2c {
 	struct regmap *regmap;
 	struct device *dev;
-	struct rtl9300_i2c_chan chans[RTL9300_I2C_MUX_NCHAN];
+	struct rtl9300_i2c_chan chans[RTL9310_I2C_MUX_NCHAN];
 	struct regmap_field *fields[F_NUM_FIELDS];
 	u32 reg_base;
 	u32 data_reg;
+	u8 scl_num;
 	u8 sda_num;
 	struct mutex lock;
 };
@@ -98,6 +100,12 @@ struct rtl9300_i2c_xfer {
 #define RTL9300_I2C_MST_DATA_WORD3			0x14
 #define RTL9300_I2C_MST_GLB_CTRL			0x384
 
+#define RTL9310_I2C_MST_IF_CTRL				0x1004
+#define RTL9310_I2C_MST_IF_SEL				0x1008
+#define RTL9310_I2C_MST_CTRL				0x0
+#define RTL9310_I2C_MST_MEMADDR_CTRL			0x4
+#define RTL9310_I2C_MST_DATA_CTRL			0x8
+
 static int rtl9300_i2c_reg_addr_set(struct rtl9300_i2c *i2c, u32 reg, u16 len)
 {
 	int ret;
@@ -114,6 +122,11 @@ static int rtl9300_i2c_select_scl(struct rtl9300_i2c *i2c, u8 scl)
 	return regmap_field_write(i2c->fields[F_SCL_SEL], 1);
 }
 
+static int rtl9310_i2c_select_scl(struct rtl9300_i2c *i2c, u8 scl)
+{
+	return regmap_field_update_bits(i2c->fields[F_SCL_SEL], BIT(scl), BIT(scl));
+}
+
 static int rtl9300_i2c_config_chan(struct rtl9300_i2c *i2c, struct rtl9300_i2c_chan *chan)
 {
 	struct rtl9300_i2c_drv_data *drv_data;
@@ -127,7 +140,7 @@ static int rtl9300_i2c_config_chan(struct rtl9300_i2c *i2c, struct rtl9300_i2c_c
 		return ret;
 
 	drv_data = (struct rtl9300_i2c_drv_data *)device_get_match_data(i2c->dev);
-	ret = drv_data->select_scl(i2c, 0);
+	ret = drv_data->select_scl(i2c, i2c->scl_num);
 	if (ret)
 		return ret;
 
@@ -379,6 +392,10 @@ static int rtl9300_i2c_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ret = device_property_read_u8(dev, "realtek,scl", &i2c->scl_num);
+	if (ret || i2c->scl_num != 1)
+		i2c->scl_num = 0;
+
 	platform_set_drvdata(pdev, i2c);
 
 	drv_data = (struct rtl9300_i2c_drv_data *)device_get_match_data(i2c->dev);
@@ -474,12 +491,35 @@ static const struct rtl9300_i2c_drv_data rtl9300_i2c_drv_data = {
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


