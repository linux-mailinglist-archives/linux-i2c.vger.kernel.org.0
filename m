Return-Path: <linux-i2c+bounces-12277-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE9CB2525E
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Aug 2025 19:48:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3709A5A5F03
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Aug 2025 17:48:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0122D292B56;
	Wed, 13 Aug 2025 17:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="fw7/ZPTF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 469C328C5DB
	for <linux-i2c@vger.kernel.org>; Wed, 13 Aug 2025 17:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755107262; cv=none; b=Eyv+pI0f40P0yArNpL2tOx9DQcrRjArq0uXyBokhjQz1B8hbdZqNt3hFVigXE78r/AkUcdEKdBR5amHDIs51kEvNyNdIx+fP9s+Isp0jR08dJYuIVjeiseg4EaCj55nXI5z8SJfQWrG/jjqhUAz+PEEShCIF3ANNqzeolqvKeTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755107262; c=relaxed/simple;
	bh=RL3Rsz0aJlOWFxlh2UakRKpVFid+fQ5BHQzpFq6zABI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r04TUQSuM0zg0mKMF9gwS56tmF6fvfQobkMFVjSEpilcLEmdpOLWx5M+cUwPD4D98f34NRtUhcApqRSu2v1R7IyYFJKrg7sGmA4yRUV1rWdPGUQlNPi2MMS7GZ/QIizPl3V0ef5tzNlTBMszduVkAVb7aMHfcvoOR/F+dV9zMcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=fw7/ZPTF; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7e8704c52b3so7586185a.1
        for <linux-i2c@vger.kernel.org>; Wed, 13 Aug 2025 10:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1755107260; x=1755712060; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mtMzSO7UPmjR47X20+ZqBD1uhyLdG+1s/Zrtcgs7erg=;
        b=fw7/ZPTF6jxg1uaCEZj4Aq29AqS+wxQkqaLK6z57NRPX2Jkxw6qzH8icX8ROKctnTO
         YHRR50dsGuEO1nkXZhGbWBFX5XoDqZXabtWFi7m6eKgl6a43mz5J5yHsMPvA2sRUOU2S
         tXblc2C4heR+M9IKeVxDBaljPVUYF7x/NYNpNl3HSGQISa9Xd7rVTbbMuoiGZzkI06Wr
         TEf2I0eP2jZ9CiRgIp/hmYufKsv9v/HeWlfCW27vFuPD4objIAhvi3ZJJ+LZyQKgLusb
         P2GwwiX9qeu4ZjYZrwIDEnjNb0CTR12lJr9bA+kqTfY9YJNykzYZSSe+NZPf5CDU57k8
         ctRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755107260; x=1755712060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mtMzSO7UPmjR47X20+ZqBD1uhyLdG+1s/Zrtcgs7erg=;
        b=a4iu1iILPIcx7Qzq9zuY69UjW/Wqe3Uy2ACkcmktQrZZl4OtL7Y4CZCW/yMQQcvGkq
         Abh4F/pKneBxjK36TV2ViexQaSMhDzpUZDlx0FmsrHB3AmtfTulCjMLkOROQ6GCGSs/s
         HewQfxF4f8r4n8H2yLVTyAkTbKpaePDL9mTd08r+9/9tX1I093k1qYvSE6lcUW0D/M5s
         4M6npEdo27Kh1szkIIZj/RNaf4jM+LwD8G8W4yoiehU6jBTdcrUAyzhypNob/ZHRTc9/
         2RpdUkYpAEVOJAjbiEA6v/rzlN/BgzzY259bdCEmaVZ8AubNoaub0a5ux6w5fqzbjnEt
         kvtw==
X-Forwarded-Encrypted: i=1; AJvYcCUF+85k7mPEIeh//gnaV2PHmJK1+AihFUKFM8R/MqAftfH6fEpmPuKHkgT5xaYd/Y4Tn71JxH0QBcU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyklHKJqJBXqpeQpegGpY7Smw5UfupnO5GZjZ4taWUlWrtj02hH
	1k8Ib4w07mvKRjk5GkQd1tojndP/sSGmeHk+7crB/dVvWasxnCiVuKshVQXwBekUGUQ=
X-Gm-Gg: ASbGncsoHxqKO3z3Ne+JW9pYBdxuSGXT1xpS8bRm+Rwj4QvMN42VdeLYDll7ZkLwrcL
	9Lz4jzA6h3n2oixBjjLbyTuxiH60Yq2BrS1hClbwzLYUB/GII4WlMm5uSDlpcYbWZYmLS7BDU+d
	IQBvKG3vQ0pQHk++W3PallLdtyfZ2EbphXS0e3MdBKxSK+3keq1ziTn3loZpO2Im1mI8WUC72zA
	1Rd/TWIarnIjlZku79CQBqnNlODRAyWADLgNDLXA+TCeqacfPmAFnnNAlE4r7Yc876S/yF3d8bL
	tHE9XaauImPDUvVg16dU6jnisJ6Fe/m5NIh5AGwTf3tM5kwnRt/I4/q94xU1Ao6V5XkSixDcC/g
	u1MAZklZSr/bj4CnFkvhNYTzSKR2wrwKjuyjzPpdXoVS8+Bek3Ve0
X-Google-Smtp-Source: AGHT+IEOA4KVOCs5eFfidLnPllBwbdP8If2rCIZC+fPOPK1dPvbgpwik/9+siLqevJw3jKgUeh5nYA==
X-Received: by 2002:a05:620a:bc3:b0:7e3:60cf:c037 with SMTP id af79cd13be357-7e870593e0amr23464085a.34.1755107260046;
        Wed, 13 Aug 2025 10:47:40 -0700 (PDT)
Received: from fedora (d-zg2-251.globalnet.hr. [213.149.37.251])
        by smtp.googlemail.com with ESMTPSA id af79cd13be357-7e7fa87e7d0sm1627122385a.82.2025.08.13.10.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 10:47:39 -0700 (PDT)
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
Subject: [PATCH v9 2/9] ARM: at91: select ARCH_MICROCHIP
Date: Wed, 13 Aug 2025 19:44:38 +0200
Message-ID: <20250813174720.540015-3-robert.marko@sartura.hr>
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

Like with the ARM64 Microchip platforms, lets add a generic ARCH_MICROCHIP
symbol and select it so that drivers that are reused for multiple product
generation or lines, can just depend on it instead of adding each SoC
symbol as their dependencies.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 arch/arm/mach-at91/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/mach-at91/Kconfig b/arch/arm/mach-at91/Kconfig
index 04bd91c72521..c5ef27e3cd8f 100644
--- a/arch/arm/mach-at91/Kconfig
+++ b/arch/arm/mach-at91/Kconfig
@@ -1,4 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
+config ARCH_MICROCHIP
+	bool
+
 menuconfig ARCH_AT91
 	bool "AT91/Microchip SoCs"
 	depends on (CPU_LITTLE_ENDIAN && (ARCH_MULTI_V4T || ARCH_MULTI_V5)) || \
@@ -8,6 +11,7 @@ menuconfig ARCH_AT91
 	select GPIOLIB
 	select PINCTRL
 	select SOC_BUS
+	select ARCH_MICROCHIP
 
 if ARCH_AT91
 config SOC_SAMV7
-- 
2.50.1


