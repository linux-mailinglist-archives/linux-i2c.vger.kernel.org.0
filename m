Return-Path: <linux-i2c+bounces-12404-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 581DEB32F93
	for <lists+linux-i2c@lfdr.de>; Sun, 24 Aug 2025 13:37:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ABAFE3A0F7A
	for <lists+linux-i2c@lfdr.de>; Sun, 24 Aug 2025 11:36:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 453D32DECDD;
	Sun, 24 Aug 2025 11:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RhgocfcN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A31F2DC323;
	Sun, 24 Aug 2025 11:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756035283; cv=none; b=WmvtpQMFMyCmQMr5DPp8woEGE3/I6XJHYkyvDqsSpYfAPlkhe7E5df2SXVFwZnboF6K3YhWGXdlp086fnpwl6yrwnsePY3ZuRTuiXg/+XZxvA0SWe4knk83t0KO2iOVyewdv8/BG7PhYB6OCt4Q252qnwzsXBuNS9Bte0Yuj0uE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756035283; c=relaxed/simple;
	bh=rYt+5v4JKAVOvoFrXaCbKV1dx0vqKLh9quGN7Zpvpds=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JxORpeDtsXdr/Bb5vA6rkDob3KsF3tYDd7wP+kt34Bz8rQ3dPQQ4TP1821UJ2l4En61JQj6GyLax4HHRPo5/OdTyeuTdJCsbQ+aRhayERbh8/WyqrSGUk2CQULSSfgwuij1dn7oDkaiH9JAjpV22c579+aJ4tX3/V1RgOJeS5BQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RhgocfcN; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45a1b0c52f3so20856705e9.3;
        Sun, 24 Aug 2025 04:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756035279; x=1756640079; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SHkzCq9DN7sYrDIATw+wjp17EZ99G0DGqT+M6L9S7RA=;
        b=RhgocfcNIIerzSXEBmdUnSDO4QcSKJGyENjZTzuigcNZZCwxAIWSLvUh3jEUYpFofi
         ZQGOt65QBhyKS0hgE5if1oBnluZGMHILzXWN3vcfH2PoroI75CVEn6IWDW3hv6OJ44qc
         3WzkL111Hp2b+pzjyXqZNvxoIb+YfhMSe//UnoRv1LL+BpT72xANfRWwvshS7ZJ3zUeI
         a3fH3XDPY1OmITG64oJIFw3cAk3Sx9ceB+khQoaekqP7k/yiKyoNI30pVcGQ3TqDWPgZ
         NNWzspq3DmJzcnw3hIYod3mFImCF04uz8onVO4J0u+bQK1ztVlgGpP5GXxh72LntO9r1
         pEXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756035279; x=1756640079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SHkzCq9DN7sYrDIATw+wjp17EZ99G0DGqT+M6L9S7RA=;
        b=k+ZrP5W4Vpel+CbS05mg2jMRG7Qp+jC7dn1igf92lGS7rO6zrobdSRs2GkCsMCtrZ0
         v+SanUQjZz/k1/yRU3eYKi9AdRAxydFdxgcdxjcomROphGfSiLbETsjqyNrNwBrDy8Rr
         xgyorG6RH2L/yhM01jpdYx/G0nlvid3l/xoCIroGXgFy73qkZnI/kBeiqDs62E7F25N9
         4srELOHaiP8nWsgzSUb/4Qwhm+QaENivkpB4LiuJVI42BfjpWz5idN7dfI8LLK2t3odA
         Inz7AXuu4FUpTQEu9kCcFvqitPRBKrxRM/2IDYXTzbK0VSR3XIvPnOsa+9/wDjkrjaQJ
         QovA==
X-Forwarded-Encrypted: i=1; AJvYcCVC7z9S++6y6Vqe+1aA8OMSC1YSVrqoE3j5aI30toAmBBhq6zWNib471OM6ylxzmc/JQwgl1Dtb7wiG@vger.kernel.org, AJvYcCWaWfuJ1LslCSNnvpX4DFGtQl+LPVwJerpHKyz38dB+8fkZV5sLCPeVo3EiChu3N8qg99+iWf1OqpG9wZ6e@vger.kernel.org
X-Gm-Message-State: AOJu0YzmlNUJdJZTexyu35QR9Pq5Sh4T5b0MY5t+jzwqFo30N4wyYbow
	NgX99BlxmXth4p0Xc9/Q4M9NzIkKhWN34LjuntCoURQZmUO6RgLweszJ
X-Gm-Gg: ASbGncv7YMgQFZzmwQcX94Aj6iHo92qiRteRiGy5N0/7jxmdgSFzPI3UhRRb05w7vwg
	k0NfUk3rGVoAar19ha6/Ui+Nl0d75jGzMzbLOUBhSzkvGickgiGU0S9KQqJ1UxaPsEqp/3pujlC
	rXJytblvyC3M/YwMYvDkNsExo3h0GuufX2GmVrrTpYgpkDsD7zen/y4V/fwZBXjttNVP/jlUQJr
	8ZAXDSoIo9c8BBasabpcOCEG5CkJOjvYQp1Ew3Ndo+ZiKZFal+F0vMvZEVR1jGnfe6IZ2tAD6iq
	j8DPCNfUbsCX0m7cehmUIci2ywExWATqdUxACl+G3IPEd6gAppmCfT4litQ1FjlCU3L8ZyZGTQb
	Och5YGuKLta48uPAEEp4ZtqhGyC1wzYnyQa/IxAjMmtRTgaO4/0LNrvU=
X-Google-Smtp-Source: AGHT+IHd3WYvmpAnK6KyEJW5hiLenrDoYsRmb9nyKjOSmYlM2xjglBj9Y7AKDfWf7/M/6dGgNukjHQ==
X-Received: by 2002:a05:600c:8b35:b0:458:bfe1:4a8a with SMTP id 5b1f17b1804b1-45b5179f915mr54220485e9.14.1756035279187;
        Sun, 24 Aug 2025 04:34:39 -0700 (PDT)
Received: from builder.. (197-10-142-46.pool.kielnet.net. [46.142.10.197])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b5757453fsm66470895e9.14.2025.08.24.04.34.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Aug 2025 04:34:38 -0700 (PDT)
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
Subject: [PATCH v6 12/12] i2c: rtl9300: add support for RTL9310 I2C controller
Date: Sun, 24 Aug 2025 11:33:48 +0000
Message-ID: <20250824113348.263475-13-jelonek.jonas@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250824113348.263475-1-jelonek.jonas@gmail.com>
References: <20250824113348.263475-1-jelonek.jonas@gmail.com>
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


