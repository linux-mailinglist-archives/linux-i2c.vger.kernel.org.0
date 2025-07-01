Return-Path: <linux-i2c+bounces-11720-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E67AEF309
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Jul 2025 11:18:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EECE73A30E8
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Jul 2025 09:17:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D8A622259D;
	Tue,  1 Jul 2025 09:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BTDHMjgp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2D872637
	for <linux-i2c@vger.kernel.org>; Tue,  1 Jul 2025 09:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751361467; cv=none; b=tKyBMJfS4fkOGe+Rl89KRSdkcSCuVsuzACFKTvbkwiry3UAgGYckAwCyxyjZsMeRH4D197j2N8QQYGPiUZKqz4BOcf5URreWc2uh3qcwXpXSxhcdfioEbDkmaa07Qr3SfMULPxHSQR5abFYeCb813SNZ/GMhLm/CnVUn3kjJbuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751361467; c=relaxed/simple;
	bh=f/BwL7rYB+68mNVrmmOSj7BypAVLNOTDzQRqcc3LNJo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dmLbrm4UV3S0udTpnSp5cxoNF6nn6cEheFeP3QGvoECx0wIc9d548iXT+4TZSwx55K/RsqqMaILr1Du+2q8fR7BrFJwWtGsGF1pz1imChHxd4cI/vZeyraeN9ogwQFOoTdcbobLD0wBebXZFmtm0sTG9ATvQtXZV0nSiXGfopt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BTDHMjgp; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4538bc52a8dso35024165e9.2
        for <linux-i2c@vger.kernel.org>; Tue, 01 Jul 2025 02:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751361463; x=1751966263; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Em9bAwszir1f1YEN4EgHYbq8iFBSO/Mc6HTwblL3GvY=;
        b=BTDHMjgp8gX1VABMuCB14VQuIzCd0pIobvrNAx6XfHYMI+Nj8UJn10uyytLTwbXldZ
         7Kk6vwBRQKsrxpjSWFh30SouWFrOvA4EhBpPh6Wg+eYvZJLKyNO6HZnHUOJha4lKU/2c
         z1n0MzCkizLeag1b430jN4nhJFKBFvTPhuKooKRZIQnWTeVr/XnzcG71IWgDSuqucUQ4
         mnzi3g1zuq0USd5Oa7z05hT1+voT37jr7kpCoJHJ/1s8/sh4erbeuPrqakTTI8dtNoag
         QujdWMI2DmcPSvtXMP0zWZuGD9g6RkOU7rcHRyWwJ5oD2FjVD7SufF/vobX8QDFDduyr
         idYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751361463; x=1751966263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Em9bAwszir1f1YEN4EgHYbq8iFBSO/Mc6HTwblL3GvY=;
        b=UwEAoAh4WNvjHOmeMROpBqnqmu3XpNHvYqQQPpt91zpaxnZfom4Re9E2PX3AgJxBF6
         hPbFck04n4ndobOqTTkAAHvo9VQjeyjGE0hB9j21v2QTgwKuuZ5VqWDPSaLN5grAtQrp
         d3G8rieBeYW8cmQjKRfc3pDyeh1xeuyfAvsTNvFdKE7q8jPmYxz4wvw2GTs8G/85FpY3
         J1hpjPgSxG/3Dy2aAwM00hOwSfjyKiJa7Os0wB5AvFgDFdUkJeZXJSPtBispeQGl697q
         BzO5TIGKvTYwW8fGsBl3zZh6rLPjsrChhFwYUDudSCg8tj/E4l+9L5D7OrM5BvUZ2Df8
         BqHQ==
X-Gm-Message-State: AOJu0YwVuLL33QVQE55YcOugku204Y3NdvwZFmp542iYGD+Z4yBwhFDl
	WdUD+1RjGDIem66EeDzDDYTEMfladgK38HFMouS3yaORsTUA7oW0vtXAhp8gRg==
X-Gm-Gg: ASbGncs3n9TPLzEKveSPmM39BvMjvGeDw5NwiMMA8V8R7idYXQcfLdLwRf+3xdghUo0
	3YN59i0zXYDjh3aD/Skci0eMygvXDdq3FRteDgebOV37WV2oMEZip5qhcjZFsYIhZTdpt0bhxNR
	/EJyGbabqRGj8x+7f6RrbWJ96QDDayf/RCve/lhKF88A61C80sL/JuOAiojO2GhYtQEqpWVoYB3
	wwabsfHBhOfPWBIEDv2if1KzQxlEl+I9TEzrAroKRN5yEv8Cv2cboWcHOj1ZLpvd1WyU3JXqeAg
	nfg98X7lT39C4hebAO1EF1pphztHmNBfime0GuRQiWTyJwQScTmsS2jb3Ai9dfd1IrjYxiepJsc
	ecm8gqqKET7LvBZYXI+bC4oZf6zU=
X-Google-Smtp-Source: AGHT+IHUaMd3hVYA5Ua7IHUoUzyWFtK/vknjjmD9x801+PFXXi7qr0pAZ8ZiB0+ItbTOc6leAzQFBw==
X-Received: by 2002:a05:6000:2d05:b0:3a6:d403:6e75 with SMTP id ffacd0b85a97d-3a8fdb2ac05mr9345992f8f.4.1751361463006;
        Tue, 01 Jul 2025 02:17:43 -0700 (PDT)
Received: from builder.. (253-8-142-46.pool.kielnet.net. [46.142.8.253])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e5979dsm12624379f8f.75.2025.07.01.02.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 02:17:42 -0700 (PDT)
From: Jonas Jelonek <jelonek.jonas@gmail.com>
To: linux-i2c@vger.kernel.org
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Markus Stockhausen <markus.stockhausen@gmx.de>,
	Jonas Jelonek <jelonek.jonas@gmail.com>
Subject: [PATCH 2/3] i2c: add RTL9310 support to RTL9300 I2C controller driver
Date: Tue,  1 Jul 2025 09:17:36 +0000
Message-ID: <20250701091737.3430-3-jelonek.jonas@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250701091737.3430-1-jelonek.jonas@gmail.com>
References: <20250701091737.3430-1-jelonek.jonas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds support for the internal I2C controllers of RTL9310 series
based chip to the driver for RTL9300. Adds driver data with register
definitions, a chip-specific function and a generic compatible string
for the whole RTL9310 series because as of now there are no differences
between the different variants (RTL9311, RTL9312, RTL9313).

Also adds a new device tree property 'scl-num' which needs to be
specified in case both or only the second master is used. This is
required due to the register layout in contrast to RTL9300 which has
SCL selection in a global register instead of a master-specific one.

Signed-off-by: Jonas Jelonek <jelonek.jonas@gmail.com>
---
 drivers/i2c/busses/i2c-rtl9300.c | 39 +++++++++++++++++++++++++++++++-
 1 file changed, 38 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-rtl9300.c b/drivers/i2c/busses/i2c-rtl9300.c
index f8e81102ee74..fae6eb39adfd 100644
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
@@ -366,6 +378,10 @@ static int rtl9300_i2c_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ret = device_property_read_u8(dev, "scl-num", &i2c->scl_num);
+	if (ret || (i2c->scl_num != 0 && i2c->scl_num != 1))
+		i2c->scl_num = 0;
+
 	platform_set_drvdata(pdev, i2c);
 
 	drv_data = (struct rtl9300_i2c_drv_data *)device_get_match_data(i2c->dev);
@@ -457,12 +473,33 @@ static const struct rtl9300_i2c_drv_data rtl9300_i2c_drv_data = {
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
+
 
 static const struct of_device_id i2c_rtl9300_dt_ids[] = {
 	{ .compatible = "realtek,rtl9301-i2c", .data = (void *) &rtl9300_i2c_drv_data },
 	{ .compatible = "realtek,rtl9302b-i2c", .data = (void *) &rtl9300_i2c_drv_data },
 	{ .compatible = "realtek,rtl9302c-i2c", .data = (void *) &rtl9300_i2c_drv_data },
 	{ .compatible = "realtek,rtl9303-i2c", .data = (void *) &rtl9300_i2c_drv_data },
+	{ .compatible = "realtek,rtl9310-i2c", .data = (void *) &rtl9310_i2c_drv_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, i2c_rtl9300_dt_ids);
-- 
2.48.1


