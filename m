Return-Path: <linux-i2c+bounces-8684-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE679FA154
	for <lists+linux-i2c@lfdr.de>; Sat, 21 Dec 2024 16:21:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3FD4C1889666
	for <lists+linux-i2c@lfdr.de>; Sat, 21 Dec 2024 15:20:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EDFA1FCF79;
	Sat, 21 Dec 2024 15:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nb7XKhzN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB941FCCEB;
	Sat, 21 Dec 2024 15:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734794411; cv=none; b=fXMy1RUUQeNKjWml/ck4eBDFJCj1Q1/185UlLagg4JiWPR6tWI/wY9X1MEVXJyy2Rb24yzLfnRkpwSNI6oj14FP/zskEPX00lWlrxUytj+242p4PgpE/4aCjziaW2/3aP2mZuCGImpeRxgzn0eBuE1ACRzy9nyqSW8VVlIbSinU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734794411; c=relaxed/simple;
	bh=nbAtE5fCXm3zYwLKsyi5qBnZjW38aXP2Scmw3SWaD80=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GbqDdfyQ35bqiIV27Ndv0wMh8tB2cO3eVjicQLDUyf1sZ2Q4OHfBqnqkudkcpSlHf2PMTxySU6bAdElW32BUQ7IJjM7kaMiXxVeA0/qv/HG7QciCee/R83yk+XRivj/lOE4rjZRCH630xtCM+HA3YzDokRiEGOVl/FjAqcn8BEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nb7XKhzN; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4367239aa86so8284105e9.3;
        Sat, 21 Dec 2024 07:20:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734794407; x=1735399207; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tVxSWTXl5UIYBnL/G0S8NcTIdBJTYT5G0e8feEw+iHw=;
        b=Nb7XKhzNd7kPyQkXYOj4PiDeT1TTdWGxjDssMyvuDxZiUN0B2AnaqUZx6xhVAEJXb7
         bqEK6djyx13oVlSArpsdtXjc8ZOb+qVohzHSrXxapT41yvsU6rZ28Q85VxMZ+02exgDo
         pCEcA11MLT87MA6wB14jK+315FvHWKic38Xig0B1QmXdC1G7I3DfA/MOGqYAwG8N2SHX
         Ish+s5dAmDJIRnnRjj+p2twxcVa3Qr5BFAejY6Iqijz6zIb+IuT2Itwc84BQB1EQYMDR
         7hSzk0nX9wDwW5lfw2juLo3JjCcNsdjKz2OdBL0ukQWMcAGdZ9A5mGtvZYs+owQnbZea
         WfSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734794407; x=1735399207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tVxSWTXl5UIYBnL/G0S8NcTIdBJTYT5G0e8feEw+iHw=;
        b=g1vgldZJ5bdt9s8zcNXBZN9TKQxCzcbKWY6TgX7mF3foCRhXrFCQNEvoRMCCtb7Kvg
         Wkmbbky1JL2BWzja7UTkqQsrxkU5jV3fyrN/YVfXE2iDRQpiA+qG8REDaPcsXbqiwauZ
         p1PgOwzh2qRYdgFHYnfZpiTJOZAkf9A0la0ymKQHIdE4bplMEBW0ppkHerCFr+c5yIMd
         gc8BY33cxMGjlRoQo7Qf44fuNgW0LzZkObx6OzU3/OGoSjEgJDm1JJo3HRKr/sKx9fT3
         jvCDrhyezq21FGv8JLGXL6Gj12RabJ7e5V/SSk/dZZjtSYoo5+hD5Zq9R7TfTki1PUqA
         Fy6Q==
X-Forwarded-Encrypted: i=1; AJvYcCV3UmBvYrKNvGz+gc/mpUgfYl7PhltS3f0LmY+2zjwn/TTmgEDQ3QlG5ulRrYYgUjfxeocdp13MXf0SE0fV@vger.kernel.org, AJvYcCVF38pwQltF5sgQc+vDe7OSGnoX3ssHxNKJt+4SdtMas4F5lTE0Dl3SseV67PEyd9bfM7x9ZSX7TrmYjVz99fUaqpk=@vger.kernel.org, AJvYcCWg74DbIBG+emUFWy+A0ZPyJjEd52a2l/W9tObRrvVYCiITSbGTdZ9gyGNn4JV6vJeGViM0lcQ32j7L@vger.kernel.org
X-Gm-Message-State: AOJu0YwfHLygzFVDCzTIqWkemcUu1mtwLfG3XCTxGYOVyIJjNh1h1cbV
	67qUteO0qpNKa2t7RCnmD0JAY9e8xi6bow6LdDKEdJiH6dQnrrao
X-Gm-Gg: ASbGncvEEYQLOQOsJ+uQYw7rOPte48GHkOj1rt+Y4PfIMGWcjRnZVT/mQ/jTCJYHqNr
	TerClAmMKnB76zZJ+hqhgMgpgeRDiSriDn1fkh39Y8jnX82Uvaxii3qH6ebakaktxxVnAjxqQAt
	p/itoFZiRGwCXJiviA6dfLJD8zh3whxPDMJGvSDsJe3PbfVqxo7FKP1WvoX5bvwZyK20M2f4imy
	nVHnXmmHSXOJNY2trWDckqCrUcMaKcFSn53V1zQ72G5PiCAQQUbDwgaSwt7xtYD9BQHPmgFChOZ
	oyI/u3hbX/z37nykjuXm11QNGiCGkrCJ
X-Google-Smtp-Source: AGHT+IEJc3gycBif+Ud/uhe0S2l+nbHHM3pQ0iNSMQUHkFYUO0h+l+iqpE18cSyQPOqhAA7Ey7zSUw==
X-Received: by 2002:a05:6000:4024:b0:385:f349:fffb with SMTP id ffacd0b85a97d-38a223f5d8cmr5927073f8f.45.1734794406720;
        Sat, 21 Dec 2024 07:20:06 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c89e126sm6629046f8f.65.2024.12.21.07.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Dec 2024 07:20:06 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] i2c: exynos5: Add support for Exynos8895 SoC
Date: Sat, 21 Dec 2024 17:19:37 +0200
Message-ID: <20241221151937.1659139-3-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241221151937.1659139-1-ivo.ivanov.ivanov1@gmail.com>
References: <20241221151937.1659139-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Exynos8895 functioning logic mostly follows I2C_TYPE_EXYNOS7, but timing
and temp calculations are slightly changed according to the following
logic:

FPCLK / FI2C = (CLK_DIV + 1) * (TSCLK_L + TSCLK_H + 2) + 2 *
((FLT_CYCLE + 3) - (FLT_CYCLE + 3) % (CLK_DIV + 1))

temp := (FPCLK / FI2C) - (FLT_CYCLE + 3) * 2

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 drivers/i2c/busses/i2c-exynos5.c | 31 +++++++++++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-exynos5.c b/drivers/i2c/busses/i2c-exynos5.c
index e33001508..8d8ee42ba 100644
--- a/drivers/i2c/busses/i2c-exynos5.c
+++ b/drivers/i2c/busses/i2c-exynos5.c
@@ -168,6 +168,7 @@ enum i2c_type_exynos {
 	I2C_TYPE_EXYNOS5,
 	I2C_TYPE_EXYNOS7,
 	I2C_TYPE_EXYNOSAUTOV9,
+	I2C_TYPE_EXYNOS8895,
 };
 
 struct exynos5_i2c {
@@ -240,6 +241,11 @@ static const struct exynos_hsi2c_variant exynosautov9_hsi2c_data = {
 	.hw		= I2C_TYPE_EXYNOSAUTOV9,
 };
 
+static const struct exynos_hsi2c_variant exynos8895_hsi2c_data = {
+	.fifo_depth	= 64,
+	.hw		= I2C_TYPE_EXYNOS8895,
+};
+
 static const struct of_device_id exynos5_i2c_match[] = {
 	{
 		.compatible = "samsung,exynos5-hsi2c",
@@ -256,6 +262,9 @@ static const struct of_device_id exynos5_i2c_match[] = {
 	}, {
 		.compatible = "samsung,exynosautov9-hsi2c",
 		.data = &exynosautov9_hsi2c_data
+	}, {
+		.compatible = "samsung,exynos8895-hsi2c",
+		.data = &exynos8895_hsi2c_data
 	}, {},
 };
 MODULE_DEVICE_TABLE(of, exynos5_i2c_match);
@@ -331,6 +340,14 @@ static int exynos5_i2c_set_timing(struct exynos5_i2c *i2c, bool hs_timings)
 	 * clk_cycle := TSCLK_L + TSCLK_H
 	 * temp := (CLK_DIV + 1) * (clk_cycle + 2)
 	 *
+	 * In case of HSI2C controllers in Exynos8895
+	 * FPCLK / FI2C =
+	 * (CLK_DIV + 1) * (TSCLK_L + TSCLK_H + 2) +
+	 * 2 * ((FLT_CYCLE + 3) - (FLT_CYCLE + 3) % (CLK_DIV + 1))
+	 *
+	 * clk_cycle := TSCLK_L + TSCLK_H
+	 * temp := (FPCLK / FI2C) - (FLT_CYCLE + 3) * 2
+	 *
 	 * Constraints: 4 <= temp, 0 <= CLK_DIV < 256, 2 <= clk_cycle <= 510
 	 *
 	 * To split SCL clock into low, high periods appropriately, one
@@ -352,11 +369,19 @@ static int exynos5_i2c_set_timing(struct exynos5_i2c *i2c, bool hs_timings)
 	 *
 	 */
 	t_ftl_cycle = (readl(i2c->regs + HSI2C_CONF) >> 16) & 0x7;
-	temp = clkin / op_clk - 8 - t_ftl_cycle;
+	if (i2c->variant->hw == I2C_TYPE_EXYNOS8895)
+		temp = clkin / op_clk - (t_ftl_cycle + 3) * 2;
+	else
+		temp = clkin / op_clk - 8 - t_ftl_cycle;
 	if (i2c->variant->hw != I2C_TYPE_EXYNOS7)
 		temp -= t_ftl_cycle;
 	div = temp / 512;
-	clk_cycle = temp / (div + 1) - 2;
+
+	if (i2c->variant->hw == I2C_TYPE_EXYNOS8895)
+		clk_cycle = (temp + ((t_ftl_cycle + 3) % (div + 1)) * 2) /
+			    (div + 1) - 2;
+	else
+		clk_cycle = temp / (div + 1) - 2;
 	if (temp < 4 || div >= 256 || clk_cycle < 2) {
 		dev_err(i2c->dev, "%s clock set-up failed\n",
 			hs_timings ? "HS" : "FS");
@@ -491,6 +516,8 @@ static irqreturn_t exynos5_i2c_irq(int irqno, void *dev_id)
 	switch (i2c->variant->hw) {
 	case I2C_TYPE_EXYNOSAUTOV9:
 		fallthrough;
+	case I2C_TYPE_EXYNOS8895:
+		fallthrough;
 	case I2C_TYPE_EXYNOS7:
 		if (int_status & HSI2C_INT_TRANS_DONE) {
 			i2c->trans_done = 1;
-- 
2.43.0


