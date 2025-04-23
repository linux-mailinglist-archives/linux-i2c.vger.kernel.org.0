Return-Path: <linux-i2c+bounces-10581-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 045D3A9847D
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Apr 2025 10:58:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 194DC1B635B8
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Apr 2025 08:58:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A452422F77E;
	Wed, 23 Apr 2025 08:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="qcSGcrQM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07821DF991
	for <linux-i2c@vger.kernel.org>; Wed, 23 Apr 2025 08:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745398558; cv=none; b=nEGxw4tPLZ6OrUvUyA8e/DYGm8xkBUqAyr6KLkiJeu7E5ESrwTWZq1qs7U6pQP8SshCuX+LnlU5MXRDNL0QDHP2anAZk7DHEo26WYLinILAV3/65Rz+3/muYpu5hJbQqi10qHZWrGlsM7qlFN5S/8DspIQbvOLW8PYCUUeHzYY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745398558; c=relaxed/simple;
	bh=IpkDgplwnpCnmf4TZWsszBJ6O9YeA9J/UngYhMFFKwI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DEl6iTznb2wf/BEH4yd7NJAiKPKBeCweLwhqFtk1GCVecpAdUujA8/b84Yer76XdaK+34hb4GSbLZyecvgbumTpzCgofb0nYLzSFNdMrNZh0xSOrDKU37T5tTv5+BJjz492jpgCitaFZ2o9nT0i5PkbwjiAgeC4ehchslglT2Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=qcSGcrQM; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so5268375e9.1
        for <linux-i2c@vger.kernel.org>; Wed, 23 Apr 2025 01:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745398553; x=1746003353; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xujYyKOLUtbIFtoGOYN4dvZkp51sWP9BMyF/9rfhfB0=;
        b=qcSGcrQMh18Mx4145cYMqd/1snbM1UEDoTxljRxypOApiN6oRkkYR8EKt3Fg6R5pQi
         x700h6xa9MqJEzajCr5sRD/Lg909wr6kJrcZU96P2LCdC9beWjVu6hOFlOifoFEGn1uf
         /kVR6p0U5RXenA8B3Ve/w8/Sk/MYRloYBGP/vJMxApaL+QunNX9/4DvX3LFDhlahCdZC
         /jvsbcYi1owsOYAImEaieReHWqFNiwd1K2x0HPUHFyHRCkoayEd2bvxOTG4PCw6uULvD
         6tavErs+ziV3IjYHQV1zWs8sFss8hBw5lTyAF9uloKsO+JQE/Vk4R+Uc0+0tC+we01AK
         FL7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745398553; x=1746003353;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xujYyKOLUtbIFtoGOYN4dvZkp51sWP9BMyF/9rfhfB0=;
        b=GmMWaS1q1joQ1O8aYBbe3QC3WS+wDCagTCGsSmcOmLRVzWJUdQvoYfDMr7vpDVeU3Z
         v05IXFQvsHHK0p1fvBe5TEeF9pR1UdgtuwrUQ5SlDFB2E8a5SIR38xV43j7Bo8cg94Uw
         lXpoVOMFsikBI9DVDDOHcwra7LhEy3bCXSnefoUQ+HmDDjSKCiBA/9WaN0i20QsjHc63
         o1qhXhGygnZeD53qvB+7MfTWt1dmcxAFi4z9Pvz1NYNiUdqMBabD6SJrvyCW2PGaMotm
         8YuarM5tcfPCBy8FNJ4RIBvu012WmueBKETo5MIC6f+xxeyZBawTkxajyPgbhhnEFKYq
         u0Bg==
X-Forwarded-Encrypted: i=1; AJvYcCWq2gi7rJpTB6bmFsbsVd2vsXDXACNpaFmKmJTL4gG5bIrhKepiNATZ4uAJIiBIsDQchauaVN+EOGY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzcp1fE6DDcTtx4M9hPJ6RDAbVDa+yrwRyLCbP4JWq2KQ3C3Pw6
	Zs3ZcMEVnJG+j+EhbE/0Ks7X7Sr/Zb+8vxkOuD5GuKQ6EcAusWAWGtAFkvod39w=
X-Gm-Gg: ASbGncuY6BOVt6pZikI1QIXbzutkhNiOq3updl6LIygkGRGP241HQ5m2beLGOJS6R7Q
	TxqSXCqlmVi36vLbkvPgMD766hou20VTRoojZTPpxndGVupLKn3y3Rjoj6H1R7nVLUuQS35MFUG
	VjfsbXuPOXsthNfdf975C9PkzY2jEsOalBHns5VX2XGTkThZFGib94n65skxmUVZCyPxbGWfbK/
	0vc5UN8h4WV5SItc96eWykecZPRlFT1MwJT8t+DV14LZvNV27nLVZNTQtvP0/qBPAsuZudzMsGy
	R+iktYKBAeSXf62XoVTPV9nxlSRSDjqFyoEewCxLuroH
X-Google-Smtp-Source: AGHT+IH5O0o2mxC9oUy2yMKuDfMRopZF/pet7Y3HVnOv2ue1C+p/vz/hM7WvcmmLgF5cF1LDMRJLzA==
X-Received: by 2002:a05:600c:3b23:b0:43d:186d:a4bf with SMTP id 5b1f17b1804b1-44091d2e039mr12818225e9.0.1745398552941;
        Wed, 23 Apr 2025 01:55:52 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:74b0:71bd:6dda:dcc1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-44092d3654dsm17731685e9.28.2025.04.23.01.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 01:55:52 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 23 Apr 2025 10:55:43 +0200
Subject: [PATCH 5/6] hid: mcp2200: use new line value setter callbacks
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-gpiochip-set-rv-hid-v1-5-2e6762b582f6@linaro.org>
References: <20250423-gpiochip-set-rv-hid-v1-0-2e6762b582f6@linaro.org>
In-Reply-To: <20250423-gpiochip-set-rv-hid-v1-0-2e6762b582f6@linaro.org>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rishi Gupta <gupt21@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2393;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=Xe8t0cpiuXJK24uNCrjJrCuXqwBBlo0SGHtnD96+ABQ=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoCKsS6nROAKUfKKPoUE9uts+jWoWMp4vrsAXyn
 W4jFsTpftGJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAirEgAKCRARpy6gFHHX
 ckaeEACGpatmiJ9qt1T6hsGmMRqs2sFqWxlzRfU+OQx9iR4FdQC32TPbMOtJJRAuxCFMk0H7+0E
 AhxxwbdSJ0NlDOwGDXWV5Q3hESoDwQT1O2BkWq+X2PS7ZTL2DPQlvrMAswo0ELOahpCI82k29Ck
 KhfhUftY2CaInq2Gq+fBlQjltAFKAx5otmFMoBQTJs7bMKfJrhXUn4okq3/UuSlgxKM4GLsh8vD
 f+GXt37rNtuKUh/lQajSBsFAZbDMRGFM7LKZITTB0UvNsD2A5vpi79R/Qnxcoq0gEHALMFzE3nv
 NqSOsTDaD9aEM5V0aEvXTntCgXf8vr72Qskq9HlxFwwbzHTSMFTy1RyksLsbzEeTs4Kq5+Hrtkr
 sW+kSabg60nzvxTccwAg285BW60P0x7A6XTja0lWLx9nLf6vPVqlgyAy9wXwtc56qPIMTzLvPtv
 Eua936FnGDq6DY9/JAkTkYbNXRMZuI0p1/oMVOxdyzM2qtRxRJy7qARGA7PA9FsCbJ/fyp2wUii
 fwCIzA9KQ1RsdXHom4hBMTvA/CxSb5SEMss3nrfP9XvjNLpoz+j6oxYYY/bQMV7bFiNH2LOeJwW
 xuE63LhVXASlR8thZZyawKE+qcA29IyschYh7EW3aE2V06r1M5vqggDuMBN+XYTujbNE80JNDNR
 awhhR5u+RCPd83Q==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/hid/hid-mcp2200.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/hid/hid-mcp2200.c b/drivers/hid/hid-mcp2200.c
index bf57f7f6caa0..e6ea0a2140eb 100644
--- a/drivers/hid/hid-mcp2200.c
+++ b/drivers/hid/hid-mcp2200.c
@@ -127,8 +127,8 @@ static int mcp_cmd_read_all(struct mcp2200 *mcp)
 	return mcp->status;
 }
 
-static void mcp_set_multiple(struct gpio_chip *gc, unsigned long *mask,
-			     unsigned long *bits)
+static int mcp_set_multiple(struct gpio_chip *gc, unsigned long *mask,
+			    unsigned long *bits)
 {
 	struct mcp2200 *mcp = gpiochip_get_data(gc);
 	u8 value;
@@ -150,16 +150,20 @@ static void mcp_set_multiple(struct gpio_chip *gc, unsigned long *mask,
 
 	if (status == sizeof(struct mcp_set_clear_outputs))
 		mcp->gpio_val = value;
+	else
+		status = -EIO;
 
 	mutex_unlock(&mcp->lock);
+
+	return status;
 }
 
-static void mcp_set(struct gpio_chip *gc, unsigned int gpio_nr, int value)
+static int mcp_set(struct gpio_chip *gc, unsigned int gpio_nr, int value)
 {
 	unsigned long mask = 1 << gpio_nr;
 	unsigned long bmap_value = value << gpio_nr;
 
-	mcp_set_multiple(gc, &mask, &bmap_value);
+	return mcp_set_multiple(gc, &mask, &bmap_value);
 }
 
 static int mcp_get_multiple(struct gpio_chip *gc, unsigned long *mask,
@@ -263,9 +267,10 @@ static int mcp_direction_output(struct gpio_chip *gc, unsigned int gpio_nr,
 	bmap_value = value << gpio_nr;
 
 	ret = mcp_set_direction(gc, gpio_nr, MCP2200_DIR_OUT);
-	if (!ret)
-		mcp_set_multiple(gc, &mask, &bmap_value);
-	return ret;
+	if (ret)
+		return ret;
+
+	return mcp_set_multiple(gc, &mask, &bmap_value);
 }
 
 static const struct gpio_chip template_chip = {
@@ -274,8 +279,8 @@ static const struct gpio_chip template_chip = {
 	.get_direction		= mcp_get_direction,
 	.direction_input	= mcp_direction_input,
 	.direction_output	= mcp_direction_output,
-	.set			= mcp_set,
-	.set_multiple		= mcp_set_multiple,
+	.set_rv			= mcp_set,
+	.set_multiple_rv	= mcp_set_multiple,
 	.get			= mcp_get,
 	.get_multiple		= mcp_get_multiple,
 	.base			= -1,

-- 
2.45.2


