Return-Path: <linux-i2c+bounces-13240-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BD311BA5DA2
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Sep 2025 12:21:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9481B2A0475
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Sep 2025 10:21:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F9512DFA4A;
	Sat, 27 Sep 2025 10:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C8Lg86cr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DCD02DEA93
	for <linux-i2c@vger.kernel.org>; Sat, 27 Sep 2025 10:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758968403; cv=none; b=PBz60oTLe7+3GEaXkHO5xBJ7RQIxouMOjeMg2AYN+qGsSJSoOA76qkAowMiKyurhKHcX59TNDfV4A8h9Jp7CAENkvnFIKHvYckDTByVQ0GltPcsSZ4tkkGv8YEBVPn+sFa1q5QLdCyB68jdt8viCsqeYxjJJLetqpHG/3DchRns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758968403; c=relaxed/simple;
	bh=Zluq7HloLfLQBFo3Tg6KXCaz/jydY9sbOSlGs2FWraQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E0hlh9OY0qp03q2py++noW9F8XTcmps0A1kAbnRdnKJJ107dMKeIDh5H1GIaCUMyZ3w//BF5svlR3VAJIrXVhpoXQ4O5aXIwFVb1wd7XWxKk6UfRS0aRt1+8FTyb/FiLVSNW5iOATtmyB0RfVHhg7YJNMMWwRlRwGfp/sc5Svtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C8Lg86cr; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-46e414f90ceso12896025e9.0
        for <linux-i2c@vger.kernel.org>; Sat, 27 Sep 2025 03:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758968399; x=1759573199; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OiRuXA5cFSB3WTl30jlWEwLCI0MV2cwTejEF+1ySiq0=;
        b=C8Lg86crPokWvYPuuLCKDm/p7b8kjRkEO5IF4R96SzVVSEmKTv/24c5BMUDPVkq7NK
         Ar6BkQnQueY+v8+jjVKNsocTYlk5JpWwMQ2Pjxs/dR6SH7FkydJ09HEwyBleEKlkfTrI
         bTwajcHNHOXxm2BeefPUUxeEm68Y3MTe+KM2/8/egMVxxZ+hz8niZmqHFDQcinQCTzwl
         PuaYUKUBRu3P+yNift5Rh6SvRoiwPfQt8Hn4IMyIzOz8R1uLtZOZvDoyck1soGcQCr2E
         9SY7egx10hDQ1zQ59s9xP1YM2EvH0FU+22xCa+tHcBNpnypzFXNAgJm0ltvWERsuQbe/
         9+1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758968399; x=1759573199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OiRuXA5cFSB3WTl30jlWEwLCI0MV2cwTejEF+1ySiq0=;
        b=qCcU4nD7UMUFEDLa/6WvcKEuSFkchmUCM7OL9/bHKZbi52WYKmROuGpzhwuNwMaH/h
         J3NorUt0/vhkkuznQNtAWnxXOQBLR9hgo5K02ToclfPcwsTPheieYetpjTOVXIR03tgG
         pUQarHb3U1X5Y0yMlpXSZNZ9Gdt7mc1HBMr1lgysMAe0g3xvCnmxrtRqMSRq0v20P2Kp
         EO0SUx9MaZgSl3h8bxI3PUnDnCP/xtzzJYuqfsSAYKMWX7UCba9SnBR1lkrFJ+bBxlXv
         BHFsD7sSVME6S2tOfbdF18PBhDLjP7dvkXNGS4Iq2p6yTlsXTcqcCZd94DYrlDfg8Dms
         5QoQ==
X-Gm-Message-State: AOJu0YywGdZd+TAgchPN05y5uLBUcWm9dMdux/PUwU7G/9+Rgff+AY50
	ANh6pkKj2fJ2IpNVHOYQ3l2uzhuaIJaHh6UzoEkVX2xxYQsVy9iWOEh8
X-Gm-Gg: ASbGnctpk84zVQuZREmncXHDZ/hPHO3dUBLRqJdlt2G4N48kFxw5sEhtNMVAcCUwILZ
	00Rc2Ze6W/COoi5SM+I5yoDtvsivibz0lKHC8/Fhxljz+v5yBL9rTI+zJf98c1UpY6BhSDON3kS
	UX/m53XMl9gOlCslhgW78GBgqwXu39/w8cyBNBD0bCQtqSYFchN6uiXjt4egvW+B4i247Lmpea8
	g9P1ElvUjb9SjRmn19in0erE4wzuFR6smiFsTHjABZuvgh28wzHW0M6U/3nzhLmI32o42SyJJFC
	VbMnlrPw8VgsZm+0qG37Jor+pD3wjtR+oN3c0GNWWdRrLotMkqzcwytyQzhuUW5+Vr7iMBD+h2i
	zZfZHrSSCFX0dYX0YlFnA/nemjBHPyof8Mnhv
X-Google-Smtp-Source: AGHT+IGgMN3T1X3hnUqeVwF68LTx312CsE8ahdhgtBGmMZG2KR2xgSdUgBVfMeKbjYPSYaobiWJQsw==
X-Received: by 2002:a05:6000:615:b0:3f1:2d30:cb5c with SMTP id ffacd0b85a97d-40e451f8c69mr9666361f8f.23.1758968399161;
        Sat, 27 Sep 2025 03:19:59 -0700 (PDT)
Received: from builder.. ([2001:9e8:f11a:4416:be24:11ff:fe30:5d85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e32c31df7sm53416435e9.4.2025.09.27.03.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Sep 2025 03:19:58 -0700 (PDT)
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
Subject: [PATCH v8 9/9] i2c: rtl9300: add support for RTL9310 I2C controller
Date: Sat, 27 Sep 2025 10:19:31 +0000
Message-ID: <20250927101931.71575-10-jelonek.jonas@gmail.com>
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
 drivers/i2c/busses/i2c-rtl9300.c | 47 ++++++++++++++++++++++++++++++--
 1 file changed, 44 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rtl9300.c b/drivers/i2c/busses/i2c-rtl9300.c
index c67463228604..4723e48cfe18 100644
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
 
@@ -361,7 +374,7 @@ static int rtl9300_i2c_probe(struct platform_device *pdev)
 	struct fwnode_handle *child;
 	struct rtl9300_i2c_drv_data *drv_data;
 	struct reg_field fields[F_NUM_FIELDS];
-	u32 clock_freq, sda_num;
+	u32 clock_freq, scl_num, sda_num;
 	int ret, i = 0;
 
 	i2c = devm_kzalloc(dev, sizeof(*i2c), GFP_KERNEL);
@@ -379,6 +392,11 @@ static int rtl9300_i2c_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ret = device_property_read_u32(dev, "realtek,scl", &scl_num);
+	if (ret || scl_num != 1)
+		scl_num = 0;
+	i2c->scl_num = (u8)scl_num;
+
 	platform_set_drvdata(pdev, i2c);
 
 	drv_data = (struct rtl9300_i2c_drv_data *)device_get_match_data(i2c->dev);
@@ -474,12 +492,35 @@ static const struct rtl9300_i2c_drv_data rtl9300_i2c_drv_data = {
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


