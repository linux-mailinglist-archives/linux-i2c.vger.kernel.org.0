Return-Path: <linux-i2c+bounces-12192-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 798BBB1F718
	for <lists+linux-i2c@lfdr.de>; Sun, 10 Aug 2025 00:09:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 385DC3BAACB
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Aug 2025 22:09:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C4A22C3770;
	Sat,  9 Aug 2025 22:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QGt1tGNI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B11327F01E;
	Sat,  9 Aug 2025 22:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754777254; cv=none; b=mRcE2oXPXLjoPQBSAHSCTUgVDEibsfJC9GF81TE/rxtrx+VZI6AWR4OmOOGc6XL5l1UAoMIVf+MSnF5vSrQ9l4NVSnmyX+V+tCEREGUWSyNwkSOz/fIUdBjkMFH+QC0mkyjfozrBtKbcIXLv19hU0NRG4+aHFBS3wzCpscf6hC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754777254; c=relaxed/simple;
	bh=6HxnUXJK8O1U1WuNfcv5GH2nLItJooeBfor6X3/mvbk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aNLFrbmsH+msWnY3mRZzePJEiG1vq9skAWsNC/esQFLxFvgUZldewoN68v0QKFqWYWltQKRBL4H8Nc4l+ecvTXxqVyt4SoN86rO3obTTKSRGp98df2L4xTn1ysPK54GtawaeA/AF3mk2xUUsX64lOkq13z/htxSujOjYFtavinw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QGt1tGNI; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-459fdc391c6so5901765e9.3;
        Sat, 09 Aug 2025 15:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754777251; x=1755382051; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wWpjHs7ykbW0YIc/oCOnMZ+8cCSXnOchuMfyTyVJRVE=;
        b=QGt1tGNI3dkclSEkLk1gMcT0t9U0EVrenQhu9GV0CagM2ihTtPnek+uI+sKBlk0DCh
         hOER/WUe4rqMRnOae65RYYvP9zeE1jqhR4fLEstf2wPkYHmn/2/Uks8FKquzH+y68Rb5
         kreBJdA21w7RDinXapj5+wuO3lwgczVCuPwhtnEb0susQDESCUuybfttH0vzOq4k910Z
         XxWSsrQdVaNRSuBJSBttvnwRKLxsFw29fXNbmDbg9ssBJ0gXIkrmqNABJJtT5RpAEhll
         kOq7hKhJoRDqIuz/PFKBdkbo++XYfNLWCOfl0udeWjgGkO1VqWiBz+cXTeTuYYcDfQ5s
         DT8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754777251; x=1755382051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wWpjHs7ykbW0YIc/oCOnMZ+8cCSXnOchuMfyTyVJRVE=;
        b=FkRshj2fB+jvxCtj645m1MPQUXF6BGTpcB2SGU508OgB2yyjF8FERUu/mtjsCPvmDN
         kbqLAsYhZyrvuLMRPQMLZjZnHpfiyQRcAFlnYVy6EBJedzCDSWX82J78jPnDq52cpWu6
         lyUf8b4gLqLalteJwLKx2e+hJNnGlmy9tnXYexi7og1PTCSAG3GsTqmg9+6IJY79NhOI
         /yagWNMbBFRpUDFvMit+OGxEvR7ITi4uA+A9bbr8oyNCZUmRTm73PzmzJQmYtcHKoOin
         v9fRDC9aPLdyYmeTx4pZa0AB/c37WpHW28dJ84d/mfCyhWtmA3vSYeQ8+FvC+2SNCK1i
         DSsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlak5cfvC4kX7ckJCcGdydhXTJFQ6CTGMaItqcDF3S3lA6V6RxvYM3D5CJ20+fMvXNir1uOnK8Qua8qG8B@vger.kernel.org, AJvYcCWNPzs9lElVgRq3EGY8or1qEedzgrxqFBuAW/mG/cmreoD56QC/sst/x1MPMJrBqABnViNbPGipq29N@vger.kernel.org
X-Gm-Message-State: AOJu0YzvLp7S24rlrBJ3q8tYoWQadqr3ZJBN2FWSmqY++bm7OSLSGnn8
	zdEHG+YQrqg6/fMjWqsTa0U20uTwdIUJ9kyTCsmIqBkrcQ5MOxrCvi86
X-Gm-Gg: ASbGncuS6nS7kGVm2njKLnZ6LxU9efFbnMvlosqPfY6Hq5EvSMR5IEeGNbFUYvsAqm8
	fTy+sxELp8/wLR97VJkdA/nHDqsR0hzKvlesF7g8ox7V2y+63An3yHbBZE8Bqmn+/WZrEW+QTP4
	ZfWLzSTGVOFsqvNJ2jCFL5I2et+FDsGDyTxPvZm5OeR8pCseagXEez/37RBrmCcbL/xHU5uIVZI
	Cm/KiGgJqc5hcECz3U+7v1GFUYa+1DszwlC5DeZDD0EJQxwOV1ClVrCA/4msbmEBIyhjgg5xkr3
	v+j++fjS9sGtbylfUp97DsB1w+B7i37+lBM91IT1XvzUHhqWoogxnukFc3yTV93CGC+wUivFwWq
	0hzPa3nZ+jdYBcMYsNOVB9EtlXR/2xaJ+9XdW1H0gwFkAyphXx8uf
X-Google-Smtp-Source: AGHT+IECIrrSwA3ODnkDgN8SWUlKitBgEfY1pKD6EAJxqBqQI5YNPbwu0mmG9XMqjjIvJFnC4WIoMw==
X-Received: by 2002:a05:600c:3508:b0:459:df48:3b19 with SMTP id 5b1f17b1804b1-459f4f9b87dmr72849915e9.18.1754777251156;
        Sat, 09 Aug 2025 15:07:31 -0700 (PDT)
Received: from builder.. (188-9-142-46.pool.kielnet.net. [46.142.9.188])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459c58ed0ecsm145592185e9.4.2025.08.09.15.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Aug 2025 15:07:30 -0700 (PDT)
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
	Jonas Jelonek <jelonek.jonas@gmail.com>
Subject: [PATCH v5 11/11] i2c: rtl9300: add support for RTL9310 I2C controller
Date: Sat,  9 Aug 2025 22:07:12 +0000
Message-ID: <20250809220713.1038947-12-jelonek.jonas@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250809220713.1038947-1-jelonek.jonas@gmail.com>
References: <20250809220713.1038947-1-jelonek.jonas@gmail.com>
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
---
 drivers/i2c/busses/i2c-rtl9300.c | 44 ++++++++++++++++++++++++++++++--
 1 file changed, 42 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rtl9300.c b/drivers/i2c/busses/i2c-rtl9300.c
index 73eb35052077..2261a08e07a6 100644
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
@@ -96,6 +98,12 @@ struct rtl9300_i2c_xfer {
 #define RTL9300_I2C_MST_DATA_WORD3			0x14
 #define RTL9300_I2C_MST_GLB_CTRL			0x384
 
+#define RTL9310_I2C_MST_IF_CTRL				0x1004
+#define	RTL9310_I2C_MST_IF_SEL				0x1008
+#define	RTL9310_I2C_MST_CTRL				0x0
+#define	RTL9310_I2C_MST_MEMADDR_CTRL			0x4
+#define RTL9310_I2C_MST_DATA_CTRL			0x8
+
 static int rtl9300_i2c_reg_addr_set(struct rtl9300_i2c *i2c, u32 reg, u16 len)
 {
 	int ret;
@@ -112,6 +120,11 @@ static int rtl9300_i2c_select_scl(struct rtl9300_i2c *i2c, u8 scl)
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
@@ -125,7 +138,7 @@ static int rtl9300_i2c_config_chan(struct rtl9300_i2c *i2c, struct rtl9300_i2c_c
 		return ret;
 
 	drv_data = (struct rtl9300_i2c_drv_data *)device_get_match_data(i2c->dev);
-	ret = drv_data->select_scl(i2c, 0);
+	ret = drv_data->select_scl(i2c, i2c->scl_num);
 	if (ret)
 		return ret;
 
@@ -383,6 +396,10 @@ static int rtl9300_i2c_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ret = device_property_read_u8(dev, "realtek,scl", &i2c->scl_num);
+	if (ret || i2c->scl_num != 1)
+		i2c->scl_num = 0;
+
 	platform_set_drvdata(pdev, i2c);
 
 	drv_data = (struct rtl9300_i2c_drv_data *)device_get_match_data(i2c->dev);
@@ -478,12 +495,35 @@ static const struct rtl9300_i2c_drv_data rtl9300_i2c_drv_data = {
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


