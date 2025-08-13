Return-Path: <linux-i2c+bounces-12283-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9A2B2528A
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Aug 2025 19:53:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7F3CC9A0426
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Aug 2025 17:49:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AC50292B24;
	Wed, 13 Aug 2025 17:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="VdcbPEJa"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 534772BCF4A
	for <linux-i2c@vger.kernel.org>; Wed, 13 Aug 2025 17:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755107286; cv=none; b=dbsfU4iKVL0SE1AmKWM7dFXUQ+DbRobupeKOjbZk50Lo4JtSSihkZuCGHlF3rVAjeYJpn5YsTDJ8Xi27DGHLQckaZjfdQnf/5JARXbgTAIBfxo/rR3YMwKmLpyxGhME8d8Gxx+syTF0nb/4io8AeR/iDfAr4+hc6DsqR07pEIKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755107286; c=relaxed/simple;
	bh=T33t/nZb8rPEuHbl7ykIT2YVRu2WYufkasb9fh7PUw4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FJl7S8Q6+6TgJOjOkBcmDVhT079AIJ3CmeF4ZJAvpNqE6Cjy9EBc01LcNLnh8d/A3m8TnlDCX6IU/noyiMRbyoRgw5MbBnZxbKv6NZAEopCHiqr6t58BVLgnCCHwBR1w12Ppf0VjM2t96EkN/fsHtgxeoCThsjy7M/55HdDjXcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=VdcbPEJa; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7e87050b077so8389885a.1
        for <linux-i2c@vger.kernel.org>; Wed, 13 Aug 2025 10:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1755107284; x=1755712084; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gfHoKyNgBhJf0xtcpDC78WNK1W92/OSNj7SkF7mLTxc=;
        b=VdcbPEJauo/T2vUPi79ylKREd5NVjpunxvRkOPfG4xs48gLBiyNTBiGGZF11PAL0UI
         SrjG4Bduqx+4rElejMfUEDBTa7VQRxDgPuNgEMtGJqEEqhFcQ8wQBdotbRonRNTKf4A/
         5NVsnaEGLgI5xfbq/z7og2qegyAFhHJsU382V9XNkeZxlQDDtks7lSl2lpPQs3kNTXTt
         nMmCaGHShUvXDdyMc5YZKPj0gKiErmDQE1fyBdZSoRP2cjVgE9FlhVnn3WyQqtgZNL5U
         e3H2rRufU0gv+OIRBJXQtClufiBWdYWe//Bf6NvcuQShqISVmHFyoOdHyR8vb3YuMjHJ
         3FQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755107284; x=1755712084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gfHoKyNgBhJf0xtcpDC78WNK1W92/OSNj7SkF7mLTxc=;
        b=E/rDx1vWxvQKx5MrX0P5oeLWwT2spvbeNLzFcIjPJSii7Pu2ubSEkRHsr2314LotBy
         +I967e0c/bnxfCnonxrBXLwxy+h8o4vsRxabduGSK183JDUcPzfHEnywIzmtoPzOLnqZ
         DLEf26uAcgKOeEZRhEBZGr4cOYc3u4JGs9Jajm98UNxFRMDl8JYTNF0aYK/JJwWDTaT5
         vt2/xt8Yl8SAacoSnoPb3NNMv2401WnhF0kYZK+odrqu96Vm3XI4LalzzA7GlJYmlgPD
         1S9a5Hu/MX7opgHgYEiSAJKmYOCnOjLur8yUS/skeTwZ+KGzEtbG4fn5dKTiXRTR34QS
         sQMw==
X-Forwarded-Encrypted: i=1; AJvYcCVtxPqwwALz+99K8BVcq4NPDCFf+ZRFJeKP7JI2MRzI85F62RDOXNMiyKFBec6EL8svhIU5QIC2rnM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZjXtTz7aiKUJFqQE81DUJIguyvhRVN4XJolF2pWoKqPnnUDGd
	fmBNWaaFxoeJp2qaoK9cGW9DlIOnfVLkvJGaHPVmA6W1h+MaHIcU7rTg2BexUmYxX2s=
X-Gm-Gg: ASbGncs+0Z6fqR6A8ikYF2RqixambNkVe4QDzeXKkItHr7WUe/hVrubZNRXLjrconEb
	ISr+zd5WRPh5uk/f4m0GL9xOGTeh7nLoIEeRtaJzu0F7mlUWuN8BRtHCYpCLnpwKzeFesR4h7z9
	McZd/4hK3jz5dHOTpfo1DXN8DUOtsM9Bj0ZUE59wVRv2K/E2a9GMU/c++oM1hJG7UM8EQt/mR2d
	A//b6pG0zJN5Fdu4xwOV99Q3c2qA3jdGLRvFtVjmAK/PId1784zUnvGewqQkZ1cLCHLtSLoLllN
	56vz4NbBREvHO4SwsGhG1uidAHnjp+Vj4AM/otul+Flb0HPNLvUMIQ7aqHfVjPQgEQ4CS6hn5LT
	wGXGXLWTBzk7mADOluMN2Sue3Uw0qA1vf4buGKmzmnA==
X-Google-Smtp-Source: AGHT+IHk3Ep3PYhhUjUrzxiC9a3/t8LEKcJKp9X+LDRevsQvizEm3+mPb4XnpdaTjxQtoytK8PcKqg==
X-Received: by 2002:a05:620a:1791:b0:7e7:fdd2:cc58 with SMTP id af79cd13be357-7e870473db6mr37537485a.15.1755107284284;
        Wed, 13 Aug 2025 10:48:04 -0700 (PDT)
Received: from fedora (d-zg2-251.globalnet.hr. [213.149.37.251])
        by smtp.googlemail.com with ESMTPSA id af79cd13be357-7e7fa87e7d0sm1627122385a.82.2025.08.13.10.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 10:48:03 -0700 (PDT)
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
Subject: [PATCH v9 8/9] char: hw_random: atmel: make it selectable for ARCH_MICROCHIP
Date: Wed, 13 Aug 2025 19:44:44 +0200
Message-ID: <20250813174720.540015-9-robert.marko@sartura.hr>
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

LAN969x uses the Atmel HWRNG, so make it selectable for ARCH_MICROCHIP to
avoid needing to update depends in future if other Microchip SoC-s use it
as well.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v8:
* Use ARCH_MICROCHIP for depends as its now selected by both ARM and ARM64
Microchip SoC-s

 drivers/char/hw_random/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/char/hw_random/Kconfig b/drivers/char/hw_random/Kconfig
index c85827843447..e316cbc5baa9 100644
--- a/drivers/char/hw_random/Kconfig
+++ b/drivers/char/hw_random/Kconfig
@@ -77,7 +77,7 @@ config HW_RANDOM_AIROHA
 
 config HW_RANDOM_ATMEL
 	tristate "Atmel Random Number Generator support"
-	depends on (ARCH_AT91 || COMPILE_TEST)
+	depends on (ARCH_MICROCHIP || COMPILE_TEST)
 	default HW_RANDOM
 	help
 	  This driver provides kernel-side support for the Random Number
-- 
2.50.1


