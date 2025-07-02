Return-Path: <linux-i2c+bounces-11785-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E48FCAF6198
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Jul 2025 20:41:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 33BE57A5F6F
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Jul 2025 18:40:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 749AC2F5C5F;
	Wed,  2 Jul 2025 18:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="JRtB1/SY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37FC2F5C41
	for <linux-i2c@vger.kernel.org>; Wed,  2 Jul 2025 18:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751481595; cv=none; b=uMrk7acPuc3gN5hgkDfTzBB/8HCZ41xqDIVrJP8cNjpKUIcy65uG6UDgthNAMG6UntwZD0ehzmAL+ULDXMnL6lcOGtCpmOrgEx6lJRJzWEI6H4xGrHApr25amCjhfUfqzGV/J6/NkGK6sM5d3uAJ2xWyeRiFxq0Cjp8s5OSUUPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751481595; c=relaxed/simple;
	bh=rinGzCLeOfqarD788sUVMkKSqTzDgpo4gBTdpk6MIfQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IFs+QMfQoIpu5lpfiCgLa1xJhwEcrXlanBGeS1WK8IW2fddeU84n+0Axo0N/JpF+ZO9pPu38z+DVUe3XfEhPa4A3t1k3vEUsOKmRowDS7bp7fzgFhWZMvyyhyNQP9+wJuBmZ10r2iLEL6t4gbgSdrxbe5PZb/e18W5MRb9KHBd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=JRtB1/SY; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-235e1d710d8so86137855ad.1
        for <linux-i2c@vger.kernel.org>; Wed, 02 Jul 2025 11:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1751481593; x=1752086393; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wD4QPHjT8G71M31CBThmdXAv4qoEcXYUM9xHzhJ3pQ0=;
        b=JRtB1/SYcPo8MTrJm9+PmWnAeU9vpMp/x8E3mYRWcDV5R+sME73FQJ5TBC4cCtRqhg
         qDcLMDUtSFGhMop+rWxwZXCC71uzODb0Nmxn7soE2Lgqq5GSpgH5gWlu+mQDS0cKSl9k
         yy3iBTSPV0d4mCU+JqhUxaxpEi3YAZSSwDNye27MEdjeo4W6pfTcjnObPJ0gbKLyreqs
         4C854uoNSrSebbfC9SfaS+7zawAQT4x1/uNRYBqRl71JxA3fhft71cyWzEYx1rTxxvCj
         EWPAbPgFc2YfbFpi+qbR9syslWZn+7+pjddzViUk0E3Ur53949DJlA9Us40B2WnF8E3R
         9huw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751481593; x=1752086393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wD4QPHjT8G71M31CBThmdXAv4qoEcXYUM9xHzhJ3pQ0=;
        b=opp5Qk1K4BGrfoflwEK8GHjsJ3Dm9cz3Oc4pNnvmzRWYZAMGvMgWBiVdUfZjjcNecl
         bVgdR6UDlLamQRcVQbyIkYXy1NxDIHGZH1dp3MzLFRPxk1vUbtX5ipEnYcoaLVpMWnc8
         BKRcLFLCpi9G2FQ/8Iu8uEiA4T8W+Y1WAka+7XFvhS4xoW9Y1wQYml1Oyagrbye25rjj
         LZxHPdvwka0dONu8WccuVPwX4DJ5AaVUJJuqJvThRkwwUmuwZ2RN9rMvENU6eSD8wVF/
         E6CNiVDNW/vI8tB1DgtXH8+9l8nlXaFN1kakiwyfINCKg5qNYWvheueq8i72hf4T2e+b
         eUXA==
X-Forwarded-Encrypted: i=1; AJvYcCWg2C9JsXy0ZVLF6TmR6D5HUU0gy4kSPVydpFWHwQ14M8tPfR+2+jRO3yjF8oldxa6sQVR5SS+m+4I=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQwtwU5TXR1LTpMJxyiwygq92qM2KzfFN4JhcXKcsmdsqJvBDp
	Jdez5U1dKzhcXItO2CFj7BaxWk4CvrQOdFQPpHGZgYx7Ybg8UDexp6wAnxWZUP4841I=
X-Gm-Gg: ASbGncshzgJspN6bb/TVBD/4Vngo71xCaPs7zpUYoibKtjIwmKznAOaLlgfBxnS5H8U
	PdJp1web4dLGh7eayLPUjaS0X1cEEfuGZTSPXF+CWwI9f0wLhKAWYRTCoggtVefZNDzuq935lfZ
	YMOjSA9nqhPLUNacodieq/P5BguKnJVBMpKj3PakNmAwqoJK0NVv/C3JM2LNlWApnaE3NJI+UI/
	SabFI+RdtRcVJXjIHXtKqFIfpjEi/xIB6XFBz/fJ+QzTk+GpwqvQlKUcv0d+nUn6y3ynpZbAYv2
	wbSawzKnevEuSqi7rhWFVj1C+w/iehOO1GLRvWP4Lf3dgaF+xUU8B3AEMh6SmihH0RGIaIEuIJP
	gMFxJFC78JYhI/47kHNQ7HkU=
X-Google-Smtp-Source: AGHT+IGAQ7JmlYBOBzbIQlby/TAkB16aHlqrj6A7a2pC4QxXfKmUKta4phGLGtsgT8ahWX5lEnwzqA==
X-Received: by 2002:a17:902:dace:b0:234:c549:da14 with SMTP id d9443c01a7336-23c6e592183mr58648255ad.29.1751481593085;
        Wed, 02 Jul 2025 11:39:53 -0700 (PDT)
Received: from fedora (cpe-94-253-164-144.zg.cable.xnet.hr. [94.253.164.144])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-23acb2f39bdsm143034195ad.80.2025.07.02.11.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 11:39:52 -0700 (PDT)
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
Subject: [PATCH v8 06/10] spi: atmel: make it selectable for ARCH_MICROCHIP
Date: Wed,  2 Jul 2025 20:36:04 +0200
Message-ID: <20250702183856.1727275-7-robert.marko@sartura.hr>
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

LAN969x uses the Atmel SPI, so make it selectable for ARCH_MICROCHIP to
avoid needing to update depends in future if other Microchip SoC-s use it
as well.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v8:
* Use ARCH_MICROCHIP for depends as its now selected by both ARM and ARM64
Microchip SoC-s

 drivers/spi/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
index f2d2295a5501..a7ca7cd9648f 100644
--- a/drivers/spi/Kconfig
+++ b/drivers/spi/Kconfig
@@ -145,7 +145,7 @@ config SPI_ASPEED_SMC
 
 config SPI_ATMEL
 	tristate "Atmel SPI Controller"
-	depends on ARCH_AT91 || COMPILE_TEST
+	depends on ARCH_MICROCHIP || COMPILE_TEST
 	depends on OF
 	help
 	  This selects a driver for the Atmel SPI Controller, present on
-- 
2.50.0


