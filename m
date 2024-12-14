Return-Path: <linux-i2c+bounces-8507-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C77E99F211F
	for <lists+linux-i2c@lfdr.de>; Sat, 14 Dec 2024 23:05:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 36353188746A
	for <lists+linux-i2c@lfdr.de>; Sat, 14 Dec 2024 22:05:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A58381B6D17;
	Sat, 14 Dec 2024 22:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZArsBbGD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC2AE1B412C;
	Sat, 14 Dec 2024 22:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734213897; cv=none; b=m8hMnIytm1rfG4+FEJmw6FdYPTFkyPva3dS6praYpsmiluTNHSgpMCkwjASfBXvvZUs7xpwW+hD9CJtlmH0GJXpXGh0LcUbd+FqO/x05AsB5tJFzhBXYuZhqvXQ++HOA+/Gc0ZRZ9NQAp+xZvNPh1+M69sJuj+YbMhQDDE5bH5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734213897; c=relaxed/simple;
	bh=nbAtE5fCXm3zYwLKsyi5qBnZjW38aXP2Scmw3SWaD80=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qx/HYZYOOFumOdt0l7eudI3AR1Q5yzL6hfdm2AdAhj7LeMOort89WJBIxhGqnBwSgUMUmGKVSTEWnYAAFkSljkstmHqt+fepxe2wDzhXznMRUP1/73mz7V4b9vX0BNsLUmH3cfVFfpxO709ep8OaxROMwGK/JyQwLYSecj0WAfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZArsBbGD; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4363ae65100so3473335e9.0;
        Sat, 14 Dec 2024 14:04:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734213894; x=1734818694; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tVxSWTXl5UIYBnL/G0S8NcTIdBJTYT5G0e8feEw+iHw=;
        b=ZArsBbGD7sUK//wWdqhIjgPzyUFAGl5e4opU/WGNamn0m1EBuelLPzNegDMR2r5fXx
         yLqOem1VL9QtkSqaX8o8kKf4PxRi8mSLm/WUTTLXpo+Uz3i2cLcd6gIMTzlGaTHlfFwO
         ed3FvfPaprTVwFe7/m8ENJ3jkBuu8p3j/tTcisBzs3ZOzmAcFrG1Q+vBgcGs5YOsY+53
         k6LsH33hOcPMj32GV78cNMRb3rNyqHYs3N/dr2EfNtjKTkxxGwZYgTGXry13S0XKCMaU
         Y9kDAaEGVnq3KhxUhImEAWqG4PhnOjCy7U+7Py3LyxwQpZoAVtakHkTVZyvVUn/0YuhC
         y0Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734213894; x=1734818694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tVxSWTXl5UIYBnL/G0S8NcTIdBJTYT5G0e8feEw+iHw=;
        b=TH0IRe+FHr+LKU8Z4hsQJxfWu9lvlC4ixEYzozMYsWvpKqlCF/EEfbnICRh3zso7Fm
         Ashv8BdUz050Fhmvq1OboRz6Xbiz8xlB+beE3w+eM1pmyuXVNNV1xWwNzWvZe3hHaYvo
         MbklMjOK6irdpJKEQhH2vwPLK7PrjzOSJHsku+5BDxHxqGzmr4l2z7KF27gWAYk9xhxY
         kvPMfpLZUQjGUZ33tcWtKJQGwqAXwOFztCuj+NKrmcn78QghD8scatSgK6qQMkUZ/1aY
         qWgVTytMmr5M3faZbsR2GdtZFLHeJjg21OXK7WxjtaIbEf0PBxYRvnCCTpsdIoW2kf8Z
         GGXg==
X-Forwarded-Encrypted: i=1; AJvYcCUSFsOUBOUFvYsu7xex3EuQtR2j8fOUI4mT56+2WtTTaMfzmcRbwxcFTDzsxyTC6VC7WJJapqfStd3UaavR@vger.kernel.org, AJvYcCVmB5LfIykcE7nTHO9msVNhKdQVlKAby1js7mbvTp4h9j99mvfu+p36fMxc0b2bfmiDAulp1kHOLGWLCobOfR+9i6Y=@vger.kernel.org, AJvYcCWE6Wsx/4b6t6SC456PvALXGb2/vWCD/Kh/YoKNaGxE3L+HzO495Smy6GI61/OeZxevR7+kcqeKqdiX@vger.kernel.org
X-Gm-Message-State: AOJu0YwUhO4KvqimvTht0FVg2AUD7OF6RWU/2UqXRoDcefpJrwYDPUVA
	wntl+Tm52SIuWzyV9qNdOh03stMNqWJiiDkhixDoHTvyEhRQ5oYo
X-Gm-Gg: ASbGncvD4cE4yhUZd7nAL+aPqy7Wu7LO+k9js2iDRL+0NKgteGYM43TDKeLTYG5rH6A
	JqAVxM4xOVCHZkPkdfIpbGFMPH/PnCCokba8qNw6wqUMF0sPpxLd8xPR2FukG7fAxzHWiSDXq5u
	3ZAlFPSSiABsmBt7yA0vHK2COPfBm2A4Cuc6bHqGipiJyFcljc+ZLTPva5p65xZNhVb5LEYm2ce
	9GeNadFOYDj9o7CfiET+fMWYyeP2xUL1YkswSgbDtBBZcpBsjTsqOgMC0g2XtEbgMyy2I/kxehT
	A0FYVn0CvlJEG/LPy3GcpY7l3wvBqvlj
X-Google-Smtp-Source: AGHT+IEJf/jNx97cvTTMZFhhseIjKNYBkj9n/qe14LMzuQtZhbLL0XfC66ydjc5C+zTjGUfOFA4Xbg==
X-Received: by 2002:a05:600c:1da4:b0:434:f753:6012 with SMTP id 5b1f17b1804b1-4362aa509abmr72449325e9.17.1734213893779;
        Sat, 14 Dec 2024 14:04:53 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4361ec75410sm104456185e9.1.2024.12.14.14.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Dec 2024 14:04:53 -0800 (PST)
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
Subject: [PATCH v1 2/2] i2c: exynos5: Add support for Exynos8895 SoC
Date: Sun, 15 Dec 2024 00:04:19 +0200
Message-ID: <20241214220419.723100-3-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241214220419.723100-1-ivo.ivanov.ivanov1@gmail.com>
References: <20241214220419.723100-1-ivo.ivanov.ivanov1@gmail.com>
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


