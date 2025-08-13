Return-Path: <linux-i2c+bounces-12278-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E68B25256
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Aug 2025 19:48:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E12034E4A4C
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Aug 2025 17:48:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB45C299952;
	Wed, 13 Aug 2025 17:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="QZAmmWeL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9FF287277
	for <linux-i2c@vger.kernel.org>; Wed, 13 Aug 2025 17:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755107266; cv=none; b=YuGQUo110QdYMcFDUbCPahQlOPirq+r3WuzowJz/6Z7G4IKhojN38yILKSgh41Ai3igWRZ3BmhpDRktk4LA3LeK3o/Ygh5/AC3JANJSYJ1XrcBWj0lnH/bZmihyHls0luRg3VpfNnoZTKkDsET6CQ7urFkq5Uo+tDs4Y+IpNBWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755107266; c=relaxed/simple;
	bh=gPMtN6w+Ex6/DTpmDnipaDUce4Mx3+FsbyqPZQrCYoI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tv9G9GoUOvIEuTQsWpsRp8Jxi/gJ4YD6NSpyKBIYR1TnpM8f0VfUvjIpvgyC+u5yZoEkd3ac2JNvDHUOJIwDrpsMMhO4Ig3R3j18kx/LW+otg0NLrPRMLQBgTKg3DAStYHEhRtd9xZu1dcrPte0yYt3zy9b8WXGVOIPbnH1i/CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=QZAmmWeL; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7e870621163so5185585a.2
        for <linux-i2c@vger.kernel.org>; Wed, 13 Aug 2025 10:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1755107264; x=1755712064; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BOqtWGRnguTuSIsC5EGTanl0XgtE1XRc/qnGhyYka2w=;
        b=QZAmmWeLRLMQhIuqHu/KvJDEJNjLk1Uhjp9KNU6Rv48HTqXR9Gi19PZdaAXnUSCUnd
         7nFtowisJIqJ/XLwX4ozYgLg/AS3OvJFFct8eTAPJIBvcy+kLgSwSKARMITt1GuRzOsE
         9gMEfS8p0PbnGIBvapoZMPO4IeDf2iDCvNs3zZ0G9FxVvIbL/EnE2JMCwMZhgcDqUNli
         VkepSqY5ARwJS9Ev9IbMI62wlC8Wd29ao7jcFAkulBHCA3cIoxRrDEwe8dAG72wh5KTX
         VpTkmOjUfXsoaYHn0xGWTVTe+k/HfAuyikK1SqdX0xgq0Ts/Ss/a3V0ikJpyzN6QTyMt
         W6iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755107264; x=1755712064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BOqtWGRnguTuSIsC5EGTanl0XgtE1XRc/qnGhyYka2w=;
        b=hqd2I/MpNnBhEADSa5W58G64MUzHtLwmPTU3+AT3u6s5acQaofch2YznCostIBPq94
         LC7x8198l+foOla20l+6mSxSNRtXkryfGaXdn44fxH41RUTBEJjpI0piuuAygo7PYRp5
         7ThkYeegNvC8sKair0QVFRIxZ9a1qatKmjRpxK6g2VXHbXqazvXz6bRH44MZ2IHha8WD
         Zmz9Wq59IxCBp421E1e2Laqbt4Q0oxoKKNRdrtc0D9NY475dwZfIPHQMvEH2+NU+5UW1
         bXs+DaWkvxJE34m5vccotJMeS4qHoM4HnV+vq5FMFAYcWGy0bm9KvjgrXorB27rUxPf/
         Jb+g==
X-Forwarded-Encrypted: i=1; AJvYcCXglPRkbSuBRCD0L7/9HBrsKudBa12XUpUcg5VKjNFuVxwQKzgHhjzJKs06es27y6ILY1mIoRNxVVU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjEEWw0eOENCeDFOyznDA7gBSGcEOT5BOg5qLqkc7HwXqxOHvI
	Ju3O3JFfM4tg6mSTOtZgp4igqKwvG8yEYBeuYC9ymu9PfWMpBjmZmIPnR8mySY/kU5E=
X-Gm-Gg: ASbGncsKBj7P2+zQdO5/wJ0BqLShOJDFK5mPK3bz/T5gmZha1Mi+5jijgYTGAOnuTp5
	kbmu01tYRaD9fQWzT188AJUJr0vcJdL8ERnc+xEe0ZoinuwJjlxjglT0uqcbumznAH9sJAxj/Pg
	CUtOjwJN0uHBKqgnZ3t2SfquIiTmbPc/8xxm9je+TrC5bUNOHNmb5zVDgWOKMOAmm959KOYu7OW
	vtY1A4oxOM+MOHNbGvanoqK+VODmsB7/Z7WQdnXRfUzgkVY2msDOyP3VLFpy5guyEutbVq19oCY
	XP30rluPHrIYLAgYGvo+GtKAIu5VfPiLL115Ph18daY31B3Ky0vm4AZcd1tyAkA9YLFJg7X+K2G
	jfSltsHpC56sVhGhiNMlCwyfYE/ndc/m2Q8mOU3V/cw==
X-Google-Smtp-Source: AGHT+IHM8gqvwU0dp99AsCx2aJSW6E+YiETEDgm//P8elY9qJZZswfVzec82j6i0ynh7rzsSjnHxBQ==
X-Received: by 2002:a05:620a:31a:b0:7e8:20cc:64a2 with SMTP id af79cd13be357-7e87035636bmr30883285a.26.1755107264026;
        Wed, 13 Aug 2025 10:47:44 -0700 (PDT)
Received: from fedora (d-zg2-251.globalnet.hr. [213.149.37.251])
        by smtp.googlemail.com with ESMTPSA id af79cd13be357-7e7fa87e7d0sm1627122385a.82.2025.08.13.10.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 10:47:43 -0700 (PDT)
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
	andi.shyti@kernel.org,
	lee@kernel.org,
	broonie@kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	arnd@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org,
	o.rempel@pengutronix.de,
	daniel.machon@microchip.com
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v9 3/9] arm64: lan969x: Add support for Microchip LAN969x SoC
Date: Wed, 13 Aug 2025 19:44:39 +0200
Message-ID: <20250813174720.540015-4-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250813174720.540015-1-robert.marko@sartura.hr>
References: <20250813174720.540015-1-robert.marko@sartura.hr>
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
Changes in v9:
* Select ARCH_MICROCHIP when ARCH_LAN969X is selected as its now hidden

Changes in v8:
* Place LAN969x under ARCH_MICROCHIP as suggested by Arnd and drop review
tags due to this

 arch/arm64/Kconfig.platforms | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index bfea380100a6..31bddd1a17de 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -177,6 +177,21 @@ menu "Microchip SoC support"
 config ARCH_MICROCHIP
 	bool
 
+config ARCH_LAN969X
+	bool "Microchip LAN969X SoC family"
+	select PINCTRL
+	select DW_APB_TIMER_OF
+	select ARCH_MICROCHIP
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
2.50.1


