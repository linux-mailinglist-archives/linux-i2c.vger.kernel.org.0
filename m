Return-Path: <linux-i2c+bounces-8787-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C53A9FDA1F
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Dec 2024 12:15:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A0F13A0415
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Dec 2024 11:15:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97D8A15855E;
	Sat, 28 Dec 2024 11:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W8tDTJ7d"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A496414A630;
	Sat, 28 Dec 2024 11:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735384523; cv=none; b=D2UGhv/crvObtIPQG+wRL5tLqXCp4YAPX/gTRCJcmuYNd7nV9/pd2Aj8JWxkFCrd6HMApXNIP+/Hc1pLyM98/FaQuWaxarCvcMT9MdLec0IZQ3mcJLS0IsWc9pXaXqjMgDue1aiZ2XneHfSHoJ3kpJUUbiqpWmuXkmsrlxFXUl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735384523; c=relaxed/simple;
	bh=AkGEjO5MqaJ6/WaiLUJEmWNdRQOYqjQBeJBH2t2NWYU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=An2Yj2rx/v1KtGMYR0RV+WVlJ7FQXAQNLUaDg6/GNkCgF5/OFIlKaY4Wmss4U2es3ZVBCO/c40L+dl0gKvvEhCZAMr7LidIo41zImtF06zlBqKyFJXgBS3G3DsgcqlPMwORQZKzMM5RAor+Tch4vdU/FTFjOkILOanKnT6fSkvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W8tDTJ7d; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4361c705434so57006925e9.3;
        Sat, 28 Dec 2024 03:15:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735384520; x=1735989320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AGkgSa0SQvLDucqBA9QZhIAOHAKfj9lHxmPDg4KGqrA=;
        b=W8tDTJ7diw2ngLEEm6LffpLv+gQ/T2clzm312wyuR26pAuFivXcMIjXx9sFsyq7kec
         OmFiaBDGEKXPn8Ia30q9YjWDJPwkvvksgF0xzK9htilHTKa0Ncsn6GUiRe3I17NcgLBG
         ja8fX7P4rz4mMpvZeLnuDltZmK0aWLQqNXC5ddimlmNRVGS4uiyMbPzRv4PfovjwsIft
         AVtZSRqgERlHERqiRX6k9FxB8U79FU1RUlbaQm+OhNyx12GIQ99E+ALxBQq33qKeHZGd
         yF/Yo4akD/W1i6Lf6bsjVglkYI9Hvuan19oNfTvrrYtXefew3ffy07iamwNnHRcv8WLI
         pv0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735384520; x=1735989320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AGkgSa0SQvLDucqBA9QZhIAOHAKfj9lHxmPDg4KGqrA=;
        b=rK8IaTQWFSRN29+wJ5rpde+qnicldHIjVQLkQhWT5DNIOKSW/s+L9qoOw+e2BQzNaD
         3rcHTS1qObAzbGMgpD5kBKP7P/58QiAIyjlQY2HS5O9+RR22eQy6wCR1Ip8RUIe9n3kJ
         d4KU0IFqyCZGsW8pHWJoSakEgqfL+M/aYZrR0g8M7hDqhZxO7UxGfd1oFjsH4r6MnNTO
         MEDUcHLYNyN3zoyHg067EteLUQdb1HjxiMtPImXXZnepE2DaYbcQ12W0AD6gFSyGHzNc
         ZoyWlicRAgI4c0dMUzg4u12OuJ0iWmkPMG/mXQR8Cn1ftMLjXR9o0ewrwsOd7s8RDhQY
         qZRA==
X-Forwarded-Encrypted: i=1; AJvYcCUhYxW9JE6RanSnTo4h3ttrZ8B63t20N2jXJ+GQicDPAcyS2HEX6uJryS7dswCNk2/VsKD+eDT6oq62Bk/9@vger.kernel.org, AJvYcCVKAVBy0RPS+HGJ1ux08ZgrRIFq3d7ZPitKdfoyCH1TbXtqyep0LwyuC+BXVGC9zDljq1NnJE5j8AdOsQM2PIgh7NE=@vger.kernel.org, AJvYcCW6y8wCyE8/3UOMqQnDKeW4bRbWEz5FarcJHjtQzDtzkM5kJPSe1V6FlBC7DFRtM4Sm78/SCPidgqQZ@vger.kernel.org
X-Gm-Message-State: AOJu0Ywlzgz68Jb9izxqGZfAifv224+BtA7A5Gw3MEA28EhequKN8oWs
	FSIXG6UIt2mjYXNSA+RKyYNToC4MzRuYlay6efmNqlqYo8ZBKnP3mefdOg==
X-Gm-Gg: ASbGncsaqHk2fjzljD3JWXCuL5ZD3+J6DpMJP4KjZJq7G2PnbUh9fS0LxlfV1xyGBI7
	eFAY3yAZ7Hq07Ld8ov1cttVE+zPr1VouFtwv3WtXb/ZyuWOGoyFmrtH1/d34J0pQgsms5bwLBOv
	O+mrb9Wrrs6Kj+pLAT6Zd4TZN8LM5DylzoVE8F9SXPG39UnhmMClhjjcSfWYJqFdhu4YktSZp37
	CT4lhS67MGKXWX0zQwYJzjjmj+xPvtldH8f9mDskWD7cuzrLX83IUZANa1mJtxUhAlaw0fehYWg
	FHv5L5Ztfvf/B3L9VPb39FXey96dzp6n
X-Google-Smtp-Source: AGHT+IGonq6ADsghjW9IBuZqhLVqoiM+c2VPos3/y2X87BVvkguYZeN1qm4TOAKkZwV2Z2DmbfJI8A==
X-Received: by 2002:a05:600c:3b23:b0:434:9499:9e87 with SMTP id 5b1f17b1804b1-43668b5e194mr216960055e9.25.1735384519730;
        Sat, 28 Dec 2024 03:15:19 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656af6c25sm326226075e9.8.2024.12.28.03.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Dec 2024 03:15:19 -0800 (PST)
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
Subject: [PATCH v3 2/2] i2c: exynos5: Add support for Exynos8895 SoC
Date: Sat, 28 Dec 2024 13:15:09 +0200
Message-ID: <20241228111509.896502-3-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241228111509.896502-1-ivo.ivanov.ivanov1@gmail.com>
References: <20241228111509.896502-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Exynos8895 functioning logic mostly follows I2C_TYPE_EXYNOS7, but timing
and temp calculations are slightly different according to the following
logic:

FPCLK / FI2C = (CLK_DIV + 1) * (TSCLK_L + TSCLK_H + 2) + 2 *
((FLT_CYCLE + 3) - (FLT_CYCLE + 3) % (CLK_DIV + 1))

temp := (FPCLK / FI2C) - (FLT_CYCLE + 3) * 2

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 drivers/i2c/busses/i2c-exynos5.c | 35 ++++++++++++++++++++++++++++----
 1 file changed, 31 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-exynos5.c b/drivers/i2c/busses/i2c-exynos5.c
index e33001508..6cdd957ea 100644
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
-	if (i2c->variant->hw != I2C_TYPE_EXYNOS7)
-		temp -= t_ftl_cycle;
+	if (i2c->variant->hw == I2C_TYPE_EXYNOS8895)
+		temp = clkin / op_clk - (t_ftl_cycle + 3) * 2;
+	else if (i2c->variant->hw == I2C_TYPE_EXYNOS7)
+		temp = clkin / op_clk - 8 - t_ftl_cycle;
+	else
+		temp = clkin / op_clk - 8 - (t_ftl_cycle * 2);
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


