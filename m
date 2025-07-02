Return-Path: <linux-i2c+bounces-11782-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 211C4AF6183
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Jul 2025 20:40:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 687E15223BC
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Jul 2025 18:40:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0353E309A74;
	Wed,  2 Jul 2025 18:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="Iz6hrVm7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A4431550C
	for <linux-i2c@vger.kernel.org>; Wed,  2 Jul 2025 18:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751481574; cv=none; b=hf4S8TnnpkXCuSjhi5LQyLRe3VqEVP3kUX//cpqkec34bmU93ANdlpaMa7JMR244rlxg3jhKqYww3MFNrnCOZHmKJ4hr3wwPipoexIOzAu6IVSQinzMh5VjaJ7JBYW33Y1C6QPafBaTaRoCzvGSgJAG+GBdW/k9UffVzWJBBJO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751481574; c=relaxed/simple;
	bh=AC1ZGqepD8ba3vU9mbjs5GP1sS+hEoxO5U/tJ71XQ34=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HTXay82ITlycqvh0ObAkaRO7dfGKJ0uantG+4HRyXD4CqfO7zvbdz2V8W0/BHFJIdqP5l5repVw1ZauamcwnjcmzAwTmZA2ksKef5moKkHTgKbO3zyWpA10Ss5h57hSieWKK1O3pQz4YELXA2+sP0n60SlLH3LJVTQi0M9PfuJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=Iz6hrVm7; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-74ad4533ac5so212808b3a.0
        for <linux-i2c@vger.kernel.org>; Wed, 02 Jul 2025 11:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1751481573; x=1752086373; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hvUZO7FvlWPW+SQ9YyArMTwQthW4Z2c8jZOVUNIjFN4=;
        b=Iz6hrVm7SFHDkNjapMU+73vWNMofHdkdJj/sac4I0iSABrshZYejXx7utVEKFAKh4i
         z9h+1ruz8HXmfCjyar+wP3Hbdaterm2s6cj/2cTU243YooXcUaHKKXA0ZoAGizfdTkgB
         ZFPwykC038hJhLRviJjhCHyZ1xqpOO7x76jDdNrNX4mSf1JMhc/x0iQ7xQm2b3MqOR5x
         Bftp4lE6DX0BP9ouVdYAU4WuAxnQuQxFN8AyAjl/jDLPGrXzUji4rPhajPWPa/Bo/3/l
         MEPXOxuPkkZbUbFm6f2AOUyOLyO+k+dktFZoVeCw1NfS7qTJ/+LgEGjIVtT/dhWFC+t5
         gbfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751481573; x=1752086373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hvUZO7FvlWPW+SQ9YyArMTwQthW4Z2c8jZOVUNIjFN4=;
        b=QMPrwJfPUPXhsOcanOhqdrA8hRUuLCvU20Bk/RPH8fqgMTgDQyb2cqkRtcBnkxpwYx
         GFYXd/J9ZzrsT3oeQFC0e2xjJRpaAtSlURlvhaXXKu97vmvk1O9NSzs8Am4z7THySrna
         /8UebvjZlPS9dLEYkVsZLToiSzyROcQM0BG0Ww1O2PDcacqmk7ZVeNhvziF+N+FLKDq/
         4e4HH11AqjlaplDRNN2Q6clDMDWztZm/PPqjHPq5FuAIhCg4qspzu5m+0UYlpppHdcxq
         xUY8int4pjACtlVt0r5Afu32dayvcOt7mLBL217XtwGolWR4FhHNxpMfhQru98qOLv9C
         7mug==
X-Forwarded-Encrypted: i=1; AJvYcCVC84gvSi1XFAD2aOd91/ubG4a9gjYH7z2tiqA7QrjvY10Y0uAkWDc9S8nr+FC7bPsNCohNS5I8y6o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSRwvaZnqNDbLL5/7BDxCmm5gpHb60bZDG1IeZVJOJI3tpj/zL
	1lSuNPTUOvGd4Wj6CwloTetMBECAvb2E94wsHgdPiNgEeCnvJ+pmTaEHLLPIqwJMSYs=
X-Gm-Gg: ASbGncvSu5ee4ANv0Zu+iskf7DcEOLc1/sUQcoPLO/Wb0MECE9Gd4QpiCBjEtrjfdBS
	dgsDu9yOBcJNkw/KBbWSHyHmCyoWosYXiOKZmttJO5hoBAqVgCQzkLJvzPEaiTvcXQ9v4B1sfDB
	UALilVq9+o0c8Jv2XDiyfmWnnkv4m530UwycBoWFGGxZu79Drlhul2DWhNNgqQvh5VfHblZZMZK
	gDCcqtPJ9/N8lpUkOOoL3tqCG0n9NfiiIXWVfeYQQ2T+V87vYgQ6jdIsNZ/4PtYOIbqP+3Zg9iW
	6++61ztJK4dbdayplzdZAe463DH7xCJuJczVIRzW3yj1D2mF4BxFkPr0L7Fia9xB9s7jdSZ2JR6
	8SGwDEiflKrdHHq4qJTqAVbY=
X-Google-Smtp-Source: AGHT+IHgAEOa6mf+31gGe4dh9PyI8zLR+UZCgE3uY8g7x79OUwcJ315/76XmuML+S/JTyWRQqdR46Q==
X-Received: by 2002:a17:902:f68b:b0:234:adce:3eb8 with SMTP id d9443c01a7336-23c793c0f84mr9871445ad.12.1751481572766;
        Wed, 02 Jul 2025 11:39:32 -0700 (PDT)
Received: from fedora (cpe-94-253-164-144.zg.cable.xnet.hr. [94.253.164.144])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-23acb2f39bdsm143034195ad.80.2025.07.02.11.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 11:39:32 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: linux@armlinux.org.uk,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	catalin.marinas@arm.com,
	will@kernel.org,
	olivia@selenic.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	vkoul@kernel.org,
	andi.shyti@kernel.org,
	lee@kernel.org,
	broonie@kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	arnd@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org,
	o.rempel@pengutronix.de,
	daniel.machon@microchip.com
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v8 03/10] arm64: lan969x: Add support for Microchip LAN969x SoC
Date: Wed,  2 Jul 2025 20:36:01 +0200
Message-ID: <20250702183856.1727275-4-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250702183856.1727275-1-robert.marko@sartura.hr>
References: <20250702183856.1727275-1-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds support for the Microchip LAN969x ARMv8-based SoC switch family.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v8:
* Place LAN969x under ARCH_MICROCHIP as suggested by Arnd and drop review
tags due to this

 arch/arm64/Kconfig.platforms | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index f2d5d7af89bf..083e9815259c 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -165,6 +165,20 @@ menuconfig ARCH_MICROCHIP
 
 if ARCH_MICROCHIP
 
+config ARCH_LAN969X
+	bool "Microchip LAN969X SoC family"
+	select PINCTRL
+	select DW_APB_TIMER_OF
+	help
+	  This enables support for the Microchip LAN969X ARMv8-based
+	  SoC family of TSN-capable gigabit switches.
+
+	  The LAN969X Ethernet switch family provides a rich set of
+	  switching features such as advanced TCAM-based VLAN and QoS
+	  processing enabling delivery of differentiated services, and
+	  security through TCAM-based frame processing using versatile
+	  content aware processor (VCAP).
+
 config ARCH_SPARX5
 	bool "Microchip Sparx5 SoC family"
 	select PINCTRL
-- 
2.50.0


