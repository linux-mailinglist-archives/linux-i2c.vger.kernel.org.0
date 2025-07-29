Return-Path: <linux-i2c+bounces-12061-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 45240B1496F
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Jul 2025 09:52:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 686C418A0AD2
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Jul 2025 07:52:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E218126C3A7;
	Tue, 29 Jul 2025 07:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jIeFyIHu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF3626AAB7;
	Tue, 29 Jul 2025 07:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753775530; cv=none; b=ag7oeHqOkveETgmUPNtawIPHvWZb8qCrzVSFDk42MshcTZ4wODVCBRrrjkliWlaMtxoE3hktDosvlx6nTVq4daPERYzX8el2bMWFOoTYkF5/4G1+BbXKfHCYQvcWpMRtD3Ppog5hMuo8WPg8cHhWan7v9CTT8KbXlXv1wWNd9bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753775530; c=relaxed/simple;
	bh=1AhWhZ7b82KFxNWxJVH7n8LMUDA9JsBs3lhcEMp0rHU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nlYjvMBhpmkMma88cXzBZnfFoiS3LiuOkOJ18MUMRfgaiudxuIpc7FH6j91Y37UKtu7uo18bYbsad+yqFoP2MJaphPF/JJ9lt1hxwRq/w3+KL2pJNSvSFW0ndrzFts5pFtuBQyQD28T75TlGNz3EYqYSzlRKJTPUEaZIyLJNGsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jIeFyIHu; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4563a57f947so2425285e9.1;
        Tue, 29 Jul 2025 00:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753775527; x=1754380327; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q8ObS1jEHEwBwhFYkTsgNO2oODJSrs5thv2nwkSYyyM=;
        b=jIeFyIHumMeoFqeUOzsM56Febdv6wyK+gSjBpZlyhPzizcCHwpuzbYNGm3zKEEH4TH
         wuVepxMgxDyBdSSpK9fu3UTPYdRFVH4gQPw41VLmAcm1Rfr/hM5+EnuL4wNGRcTppZSs
         1eLLJ0IrehVOTIPzgjvHAo/h5Q3SDkWvYKBrj/K4bcvNh15F7PC0j4jG3EPHcvZ/YSes
         pBC67fL9nbsUUVdBkqcHdFjdu5e+rPlzYBxRWtNyY2n2QbaIHw2yivtv9Ah/JbvaNa7V
         OW8tx3ZzFuVw6M9qQRCPiHs96VBVh62T5QR+qJbT8gpfs6APLs1WjELsyPacZu9BXsUg
         p73A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753775527; x=1754380327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q8ObS1jEHEwBwhFYkTsgNO2oODJSrs5thv2nwkSYyyM=;
        b=MyvEcjAoJVbKSLmIy4Ag22IzUdZiQZmU9xrrIjwQRCoVehUihBAWioT2IT+f3Ym0aa
         R5AbBW26coniEdJZKyN3yx5pKSNCcGBUHC0WEkf+U6XAbcCkU4tf80rwIYgA5dnsNmiZ
         ho71i4+ugFPhWcZMU2u3TGjBK+TG+WvHvp8eabBvlPVKpvPW2467efiv6FeTWeYMd859
         T1JfeE+dfr+gyjLmQoaF7VYddFbyNHIGF7jML90EkTbp4QMh1oZEBR2ZMrJipsZ6Jkjy
         WGQ2cpKmec16G5I8vfZQAZ2JiEyfGEOH3VIABoBBv+QsgDp3tgIg7FOXd8Lddm2TLw2u
         eK2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWatht91fwN/XZ+sUMrsYj6dQMBFsu8OjArxlLYoAtT7Kf/KPPfGGI84wS18WZnP7qJnAqoJmpJCbLf@vger.kernel.org, AJvYcCXxO7tH3WSpvnUX0JejMsIKi+8zuqCYXVoKZlQtbXJsWqLiA2E6hUFQCYLbDrKU+RxsBVWRLTVeWDvjoxjy@vger.kernel.org
X-Gm-Message-State: AOJu0YzZQG2ObHmVdrKtZoSgTjKHEcy2B92opRBgAinWKofA08HvvLns
	/c9GtLciFMKaNCtqOPX+Nzb2okwa5dztBh0LobyyJbaciSJ9tXvlIJQU7Ew8xQ==
X-Gm-Gg: ASbGncs+OcGzSBAwEJwcRQNyvvv4I+z8N6HNh5pAv/Zg6pVFzCso6IkyB8pL5WN2eR1
	fA3+WWnmnacu0toxbi+7ZIPoZHrHajF9XP8ntKTe02LKwuiJmpnY5gpeZy5H1JKa2Mb49lSJCoh
	/0uy6HRdHQT0ds/1omXhDQe8A430sDLqq40KHn8XWfMW1Kd3D6DZcKUurHarD41NZOhuvRFPYDN
	0FHHRTDPdJY37n00H19lOdKvN54FUkO8e8TtcwNJnYT61D8U9d7vdLgmA83rxxu/451jMRGO9K7
	O4OylL3BSH0T31gLq4DiNoxmInnSVOPfWVXPPYnFmjNmYt3IEQN9LupvocchGfuVnPUj2dIZY/G
	rXlPLba6XloaCEP6SI4qmBahO8KxMfExLqGHfywdGaZ3/Rk+P1Q==
X-Google-Smtp-Source: AGHT+IHYrDL7sKMg7AoKW6w51rfK67+RKAQSmgUcKvVsbf8IV+QCGk2W0ubaPncJ4K2HeiNKOvrtpA==
X-Received: by 2002:a05:600c:4694:b0:456:ed3:a488 with SMTP id 5b1f17b1804b1-4588df569d4mr11444005e9.1.1753775527104;
        Tue, 29 Jul 2025 00:52:07 -0700 (PDT)
Received: from builder.. (53-8-142-46.pool.kielnet.net. [46.142.8.53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b778f047afsm11046706f8f.39.2025.07.29.00.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 00:52:06 -0700 (PDT)
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
Subject: [PATCH v4 3/3] i2c: add RTL9310 support to RTL9300 I2C controller driver
Date: Tue, 29 Jul 2025 07:51:45 +0000
Message-ID: <20250729075145.2972-4-jelonek.jonas@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250729075145.2972-1-jelonek.jonas@gmail.com>
References: <20250729075145.2972-1-jelonek.jonas@gmail.com>
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
index 1717a9fce082..00659fd47266 100644
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


