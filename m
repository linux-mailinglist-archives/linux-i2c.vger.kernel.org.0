Return-Path: <linux-i2c+bounces-4189-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9085991236B
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 13:26:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 10E7A1F25D66
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 11:26:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAE3D17A92C;
	Fri, 21 Jun 2024 11:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="JslEfuNu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9A01791EF
	for <linux-i2c@vger.kernel.org>; Fri, 21 Jun 2024 11:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718969018; cv=none; b=Lm/8EWKbBkAUeiinMUqGVFgmZAmE/7kvzpgPikZsqucs0WtYuY+E1yGcUa7npBq1jS1I4vI7nyeMM/NyA7XbunTsrLEXf7MVqBz1Lxv17zpX5W3G7aM/kNC7aUGmvV3Q0jhBzEFaU+6AZrxymciisWhTFalPaY3zyGrwNF+nSFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718969018; c=relaxed/simple;
	bh=ij3uV6J3X/K1ZAOcphoXyGB9f+JD3XmCdAzZi2OaBxA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=teXI6JGppNq+RVt7QT2WBcvtaxqNhQDc2YRtldk2ts3TqbKKzDSzTDakC/EjrE7aEYT71hYFGAhMSXwFDpogf2bf2/2aHrNfk5LJkE1TCFvWYCsLTRwbA82SJ9M6P0DAgKesjfkb0B62ZE3f2hwotQGg/z8S4mLacuWS2UDxaJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=JslEfuNu; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a6e43dad8ecso322699866b.1
        for <linux-i2c@vger.kernel.org>; Fri, 21 Jun 2024 04:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1718969015; x=1719573815; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mzooG8q3y54I5nVFOpy/sRgqo30+e1A/eDOSMBNJffw=;
        b=JslEfuNua7tF8zrwb/sqVIAntRhFQXlEvBShMqzz5q/DJ2E5w8H+OZ+y26Q5Gra7s1
         fV9PriJ4sI88xVH3eG917b28ZYDDctSqQZqcASvuJ9DWe5MRmOgHB2MuOqowqJf0/0zV
         8XNhi/qvIyOj52nhQACcHFtNYKz59YC9NJ4a8W6lO+IeW1jjZtuXVlVauCP7f40hGvAp
         yT+SOg1z0RovIpjn76fA5yITGL+s293r5AEWXqzhYx3oy9lGkZPQtxSVZDWzWHBtgNHg
         cC1B2OJKclDRXzJHU0Z6JKhUtLsXNepG/Vyq+Y+XTIruTz0LmHd5yPZhOFlEf10a4Rsc
         mvlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718969015; x=1719573815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mzooG8q3y54I5nVFOpy/sRgqo30+e1A/eDOSMBNJffw=;
        b=drTy/N1+B9uZAD6BgkP9UPchGtOCkLZ4kp6INrBN8+BZAmAEUCprFj9n3pu70aBdZI
         dXhDZxt9hgQ55lNpIyAdsARj6V9yrq7f570Pl49wzi4RujiXuCvqojr2KnR/m+yzpUia
         +OERGJHAMXV1avwOWpwTD4K52ETck2Mc8K9DkHZUl7nR32RBRbIBrrxryhY2xqxS+K5p
         Fx/gFZNCyZAM9eBExtwe1jzXlOuaz4iASVYNBVW/5FBl+RCv2UCeLmu6+FkgWKJFoZsF
         ogrNAQmE8d7qcTnNPn8JSMzdlaWaCXHt6Xs/1MQlNZOi/7b+FDwVsdZ5uM2huVsU2kam
         rIug==
X-Forwarded-Encrypted: i=1; AJvYcCUL4n2uCOE9lHvx3WTK/mc2W0jm0rsIuVu8q8/RjifcPRNrpqvxDA7BfnsZ/Zijut7riD/xWwiFQIYPOgT/1rUivF6zQ80dZnP4
X-Gm-Message-State: AOJu0Ywbr/vZCWhCOYymyyakXYMsTOTqH5Duuahu6aX8hgVvussPTNad
	aR211g2PhPfaTf+p6y8jcXHIweJ32R/fFKl8WvYeVJLMaknT/SW9CMb6t1m2thQ=
X-Google-Smtp-Source: AGHT+IGlGxv7FMPWXU1mq1C+qo0WZXeJY4oV0Qo4ZYYvf0BrFDYx+1/DPENJzXqHjmukDxE4Y0PLYg==
X-Received: by 2002:a17:907:c205:b0:a6e:f53c:8da0 with SMTP id a640c23a62f3a-a6fa40d43c0mr648572866b.8.1718969014938;
        Fri, 21 Jun 2024 04:23:34 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6fd0838345sm64498466b.99.2024.06.21.04.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 04:23:34 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: chris.brandt@renesas.com,
	andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	wsa+renesas@sang-engineering.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 09/12] i2c: riic: Add support for fast mode plus
Date: Fri, 21 Jun 2024 14:23:00 +0300
Message-Id: <20240621112303.1607621-10-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240621112303.1607621-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240621112303.1607621-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Fast mode plus is available on most of the IP variants that RIIC driver
is working with. The exception is (according to HW manuals of the SoCs
where this IP is available) the Renesas RZ/A1H. Along with it,
according to the RZ/G3S HW manual, chapter 47.5.15 I2C Bus Interface Access
Timing, note 7, Tfmin cannot meet the specification in fast-mode plus for
the RIIC ch2 and ch3.

Due to these limitations:
- the struct riic_of_data::fast_mode_plus was introduced to address the
  Renesas RZ/A1H use case
- the renesas,riic-no-fast-mode-plus was introduced to address the Renesas
  RZ/G3S limitation.

Fast mode plus was tested on RZ/G3S, RZ/G2{L,UL,LC}, RZ/Five by
instantiating the RIIC frequency to 1MHz and issuing i2c reads on the
fast mode plus capable devices (and the i2c clock frequency was checked on
RZ/G3S).

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/i2c/busses/i2c-riic.c | 36 +++++++++++++++++++++++++++++++----
 1 file changed, 32 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
index 46070f323810..d246143a1037 100644
--- a/drivers/i2c/busses/i2c-riic.c
+++ b/drivers/i2c/busses/i2c-riic.c
@@ -63,6 +63,8 @@
 #define ICMR3_ACKWP	0x10
 #define ICMR3_ACKBT	0x08
 
+#define ICFER_FMPE	0x80
+
 #define ICIER_TIE	0x80
 #define ICIER_TEIE	0x40
 #define ICIER_RIE	0x20
@@ -80,6 +82,7 @@ enum riic_reg_list {
 	RIIC_ICCR2,
 	RIIC_ICMR1,
 	RIIC_ICMR3,
+	RIIC_ICFER,
 	RIIC_ICSER,
 	RIIC_ICIER,
 	RIIC_ICSR2,
@@ -92,6 +95,7 @@ enum riic_reg_list {
 
 struct riic_of_data {
 	const u8 *regs;
+	bool fast_mode_plus;
 };
 
 struct riic_dev {
@@ -107,6 +111,7 @@ struct riic_dev {
 	struct clk *clk;
 	struct reset_control *rstc;
 	struct i2c_timings i2c_t;
+	bool fast_mode_plus;
 };
 
 struct riic_irq_desc {
@@ -316,10 +321,11 @@ static int riic_init_hw(struct riic_dev *riic)
 	struct i2c_timings *t = &riic->i2c_t;
 	struct device *dev = riic->adapter.dev.parent;
 
-	if (t->bus_freq_hz > I2C_MAX_FAST_MODE_FREQ) {
-		dev_err(dev,
-			"unsupported bus speed (%dHz). %d max\n",
-			t->bus_freq_hz, I2C_MAX_FAST_MODE_FREQ);
+	if ((!riic->fast_mode_plus && t->bus_freq_hz > I2C_MAX_FAST_MODE_FREQ) ||
+	    (riic->fast_mode_plus && t->bus_freq_hz > I2C_MAX_FAST_MODE_PLUS_FREQ)) {
+		dev_err(dev, "unsupported bus speed (%dHz). %d max\n", t->bus_freq_hz,
+			riic->fast_mode_plus ? I2C_MAX_FAST_MODE_PLUS_FREQ :
+			I2C_MAX_FAST_MODE_FREQ);
 		return -EINVAL;
 	}
 
@@ -407,6 +413,9 @@ static int riic_init_hw(struct riic_dev *riic)
 	riic_writeb(riic, 0, RIIC_ICSER);
 	riic_writeb(riic, ICMR3_ACKWP | ICMR3_RDRFS, RIIC_ICMR3);
 
+	if (riic->fast_mode_plus && t->bus_freq_hz == I2C_MAX_FAST_MODE_PLUS_FREQ)
+		riic_clear_set_bit(riic, 0, ICFER_FMPE, RIIC_ICFER);
+
 	riic_clear_set_bit(riic, ICCR1_IICRST, 0, RIIC_ICCR1);
 
 	pm_runtime_mark_last_busy(dev);
@@ -487,6 +496,14 @@ static int riic_i2c_probe(struct platform_device *pdev)
 	init_completion(&riic->msg_done);
 
 	i2c_parse_fw_timings(dev, &riic->i2c_t, true);
+	if (riic->info->fast_mode_plus) {
+		/*
+		 * On the same SoC it may happen to have IP variants that support
+		 * fast mode plus as well as IP variants that doesn't support it.
+		 */
+		riic->fast_mode_plus = !of_property_read_bool(dev->of_node,
+							      "renesas,riic-no-fast-mode-plus");
+	}
 
 	pm_runtime_set_autosuspend_delay(dev, 0);
 	pm_runtime_use_autosuspend(dev);
@@ -535,6 +552,7 @@ static const u8 riic_rz_a_regs[RIIC_REG_END] = {
 	[RIIC_ICCR2] = 0x04,
 	[RIIC_ICMR1] = 0x08,
 	[RIIC_ICMR3] = 0x10,
+	[RIIC_ICFER] = 0x14,
 	[RIIC_ICSER] = 0x18,
 	[RIIC_ICIER] = 0x1c,
 	[RIIC_ICSR2] = 0x24,
@@ -548,11 +566,17 @@ static const struct riic_of_data riic_rz_a_info = {
 	.regs = riic_rz_a_regs,
 };
 
+static const struct riic_of_data riic_rz_g2_info = {
+	.regs = riic_rz_a_regs,
+	.fast_mode_plus = true,
+};
+
 static const u8 riic_rz_v2h_regs[RIIC_REG_END] = {
 	[RIIC_ICCR1] = 0x00,
 	[RIIC_ICCR2] = 0x01,
 	[RIIC_ICMR1] = 0x02,
 	[RIIC_ICMR3] = 0x04,
+	[RIIC_ICFER] = 0x05,
 	[RIIC_ICSER] = 0x06,
 	[RIIC_ICIER] = 0x07,
 	[RIIC_ICSR2] = 0x09,
@@ -564,6 +588,7 @@ static const u8 riic_rz_v2h_regs[RIIC_REG_END] = {
 
 static const struct riic_of_data riic_rz_v2h_info = {
 	.regs = riic_rz_v2h_regs,
+	.fast_mode_plus = true,
 };
 
 static int riic_i2c_suspend(struct device *dev)
@@ -610,6 +635,9 @@ static const struct dev_pm_ops riic_i2c_pm_ops = {
 
 static const struct of_device_id riic_i2c_dt_ids[] = {
 	{ .compatible = "renesas,riic-rz", .data = &riic_rz_a_info },
+	{ .compatible = "renesas,riic-r9a07g043", .data =  &riic_rz_g2_info, },
+	{ .compatible = "renesas,riic-r9a07g044", .data =  &riic_rz_g2_info, },
+	{ .compatible = "renesas,riic-r9a07g054", .data =  &riic_rz_g2_info, },
 	{ .compatible = "renesas,riic-r9a09g057", .data = &riic_rz_v2h_info },
 	{ /* Sentinel */ },
 };
-- 
2.39.2


