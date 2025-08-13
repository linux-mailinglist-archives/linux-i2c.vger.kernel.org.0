Return-Path: <linux-i2c+bounces-12282-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD8AB25276
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Aug 2025 19:51:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A843F1C22F7A
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Aug 2025 17:49:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1761F2BD003;
	Wed, 13 Aug 2025 17:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="OugurF7Y"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E0C29E0F0
	for <linux-i2c@vger.kernel.org>; Wed, 13 Aug 2025 17:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755107285; cv=none; b=GuTfDs03KI3PWNSXYrPFe0LOfinz9ukP935wBHzYNgmM4bmkJi3JNOK2i6GdrVO9L56XhXZXydiL6CbsSvKebuqyqugPR7K5vAWtBcSU9YCGMvKSa3bV79J+LZZaZx0KRNCmRrJuLgJi3Dxgu0mhWrV3B92eYSWmGteEnBN6VRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755107285; c=relaxed/simple;
	bh=ONd4Qs9MdmtR2emzr2R9EQwalmRVkxN82kEJbRPVoKc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=arokkNMRAoVAHgBe8yWDA37cSMiPgg9erspJ0K3s+hFzvn8h86NyFpWtbUs+n5nzogXqR+AGz2c3uk9xLqZz8p32+wcJow71+HmD+AZ/9DgShWAeWQORAj5zKV6JG0E7mROet9XqSpUM20/Ywk6N9OjgJcjgGyFt00OJGJjWX7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=OugurF7Y; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7e870636870so6410485a.2
        for <linux-i2c@vger.kernel.org>; Wed, 13 Aug 2025 10:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1755107283; x=1755712083; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bLNf+0ZsNl67A+boQNElFMCPPvbgNyj3cPEZ0b5ZYx0=;
        b=OugurF7YdxgVuLbSeOORqrrynyOEj3BkA+K42/cEQ8f+WyR6TedmNREFZ4Bsq4wuaS
         VQajmThFt9DIjOO9ABVbOjNSnS9uXoFEuB1+HxaE5YpHuO1A+takd27gpNvMVKam8X8m
         /WFYTTEXNhdh/Wne3HURyFQ21kxBI1UfPRb2BuXdK10hiDUnnPbd4uHgBkiVBvcL6iF1
         Ltb34x7qqdqcK5y4b97squ0CKWzNKnucTAwJ+IAE+7LYg0Y6+GflbOcHYNHTSN0C3jDq
         uEb14nsbbqNEn3gY8YQLn0JY5219jihJKrO7t4i/y7uJZqy/J7+XTTnMwEX4aQ5CcalY
         woYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755107283; x=1755712083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bLNf+0ZsNl67A+boQNElFMCPPvbgNyj3cPEZ0b5ZYx0=;
        b=N6nFt58RLz7kwuQI0sWeudrGiYsbwQKUpY5NsKdEtF7wny90VJMCBVogzrS1pdMFyP
         JqhLfijekiQD3pdGln4s/AkfacAacRAdoIA8X/QQNLNFBPc2OQCNA3OWbQzgm/Rnd8ME
         gau3HVDtFBDUv6vwTqbOnmFLKrboHUiSIdoaO+10ARobPsij7dshBJ/0hriblPb8Jtal
         XD7ECPaaq2Yci0iV4j3otAz4UyLF5j1Led0xfE1yvaEENLjfjTQofYLoWQA4R1VqM3td
         q4JxnThdesJ9Fkx3CK7Tr8q5Kbc3LAnCfL+HFAV6Wxu9sTxgEAXKkdkbUdvaQ/wiYPLi
         6sAw==
X-Forwarded-Encrypted: i=1; AJvYcCWZG3/YEckkrcl0YSov7LW3oq6k8AcmhZVCkM2D6p/12vv14R4qGlNZk+4wRCKGRSYTHCdAptjF6TQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3yXqBjUkYXj0Kiu7ybbjVvP4HKkOA018si+HMGtS/5BZ+P5F5
	IrndniiGDm8q2aZ4Jd1dYsP72ElnCf2hUY9B8eaFifzfuEPDkPkP+GnC7PSU9vgRjqA=
X-Gm-Gg: ASbGncuIe8+g9ba+OGZi+j+2A1YV2sSS1u6Cm4X8I8u1Y1nfHHXZDcAVPzqxCuiNQ6I
	yjLee4b4p1/eArUYaXLPWA6rX2hF1s9/EVspkBEIFOYP3Lqk9pqA/0qlxHnVy8QILxUPN8mEd/B
	Cp3jWvJIdQvN0mqoGkUqcOIBB1++LkgGEFelvAG1Lt0xplP3OrB0nJz4VBmMlZ5NhcQJxBJ+vR0
	eNNvBPFWV85e9cchsN/PdSbYkhuwx0SeEzpEW52Z7O3V9nwqa/uZyR3TgwRRhoyds0o03oHFdDe
	j6Z6r9HYq32jW3LAiNrFN6vmBWQX52FEc7BB8g0vIl17uXQ0TGbknrh/bklQ9EBk5Osfwx1vQPc
	Rcek9zuiCGciyO6keOJpSOSNQjwZjmv3b2gTXIhwjXA==
X-Google-Smtp-Source: AGHT+IG/snJ5W/RG0E/erOkIvUu/WH4PIM7qXx4xAitymXiD3NRL3HZn1ijMkWxa/MDJZoHs07TE8A==
X-Received: by 2002:a05:620a:270b:b0:7e6:9a4f:a299 with SMTP id af79cd13be357-7e87041fe25mr33631785a.16.1755107280240;
        Wed, 13 Aug 2025 10:48:00 -0700 (PDT)
Received: from fedora (d-zg2-251.globalnet.hr. [213.149.37.251])
        by smtp.googlemail.com with ESMTPSA id af79cd13be357-7e7fa87e7d0sm1627122385a.82.2025.08.13.10.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 10:47:59 -0700 (PDT)
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
Subject: [PATCH v9 7/9] i2c: at91: make it selectable for ARCH_MICROCHIP
Date: Wed, 13 Aug 2025 19:44:43 +0200
Message-ID: <20250813174720.540015-8-robert.marko@sartura.hr>
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

LAN969x uses the Atmel TWI I2C, so make it selectable for ARCH_MICROCHIP to
avoid needing to update depends in future if other Microchip SoC-s use it
as well.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v8:
* Use ARCH_MICROCHIP for depends as its now selected by both ARM and ARM64
Microchip SoC-s

 drivers/i2c/busses/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 070d014fdc5d..c0aea0920f61 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -414,7 +414,7 @@ config I2C_ASPEED
 
 config I2C_AT91
 	tristate "Atmel AT91 I2C Two-Wire interface (TWI)"
-	depends on ARCH_AT91 || COMPILE_TEST
+	depends on ARCH_MICROCHIP || COMPILE_TEST
 	help
 	  This supports the use of the I2C interface on Atmel AT91
 	  processors.
-- 
2.50.1


