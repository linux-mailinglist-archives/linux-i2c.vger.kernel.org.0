Return-Path: <linux-i2c+bounces-11786-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F79BAF619E
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Jul 2025 20:41:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC1E33B8AE0
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Jul 2025 18:41:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E88B2F6F8D;
	Wed,  2 Jul 2025 18:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="WgWn0EPl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B6E7315522
	for <linux-i2c@vger.kernel.org>; Wed,  2 Jul 2025 18:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751481602; cv=none; b=KpyjFma9zdRQLjNtDZ0nnugQnxAjSFCaY0k1ha4S2EhC2VwBf5j3TZr3dHnMlmklv5LatHWxOY0aV0531LBqZg1byzjilarh4csnlMgdZ7AYQPOmQaBQVZlbo+FYegqCZcpgcGu9yjv4XanK1Td6IW1H3syp2mDOYht2cQ9unxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751481602; c=relaxed/simple;
	bh=ufOVlqAt3uI1zr6bmRH+USzQKY4G3SQiQndGTVQ2HBI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qmHOnLCsALy8tPpN/9/JOh0rzEEpQc2DyWkE5AS4ZimpTH+zbjB/3qF2otFdIfnZPEUzg6VYMznquWQa/BvHz+28nM09+gl5k6D5uIIL1jsbnB27QKWiZdnEvi8mCcVVJGUWrY3wEdSV0NPcVse34iYjtqMZm87ItBW6+BbZby8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=WgWn0EPl; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-23636167b30so45081485ad.1
        for <linux-i2c@vger.kernel.org>; Wed, 02 Jul 2025 11:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1751481600; x=1752086400; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7JBF3cwldevDNRr7SqXWBuHyX5mq5fUVy8++B9pNBuc=;
        b=WgWn0EPl4z9gSviEI9KEWNs4eztRqIE0YqYE8ajxkBtXvP3Wf0dGq6hnqL2G95//LY
         cpis32hI+BvVHFzMxWYvFqxhCvm90IA8ceAUBEEStj8fr0Qhoh5E2owuvpCeulrgCmAS
         zwsRsqtxi2kOVnTXmZgN53Tvei9GjOh6QYSOTjOK5pUOYU2jLGZujsXZBio26anN4Bhr
         1GwyzQwQ0vymmFyzaOD6AFnYJjpPd5iTduf6u68XBY8J1c8HJM55khjJ1ysW+AgV6bCk
         Jq9QFyMIeyC8mDdL2TgAzuq7Jb948wUtdxvyxN838xnWYYVx82Ru1LT4jHiJsYd1q0AZ
         zAiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751481600; x=1752086400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7JBF3cwldevDNRr7SqXWBuHyX5mq5fUVy8++B9pNBuc=;
        b=JsSg5YSOMaAarSC1cNWtE3PssG4XFT+EzHgfnX41C30n6MEXguhnE8HqE8GNWI3KGe
         OWir76ebnxssimFXba5rDFcRJ84JpSRZfPYzSwS1BynqGVNGFAR1Fh9m7X5bya/1j+X3
         ad+JldEuP75trghrE5ojYz88JSpJsFIJv7XzJRAuqYsVPtcyPwUDyni7WgeQDRfsZAi/
         3VTkGwt7kk+f+4neAJwbxFpDchbQSELUW93SbFRMKfc0yhuRFcQl8WOvW3/xy0ElEHWy
         oBBa2NY0jpXsY7UllTdZ2M/3v0NUqKLmIIGVRjgrep3ZeVjVxxAIJ4SufeOHO1kk117E
         2j7g==
X-Forwarded-Encrypted: i=1; AJvYcCUGHKEagIanOhwFpeX/cF+KRkTnQMQ/IFoGnSFoHN7zvJvGIZadFn6QmK1eYR3xHwaqG8mxAo1o+fk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx92bMSWn/m3NcSWBbhJ/FzOYVtZnfj+NKreoSUy8Tg9i/XPOY
	hMdQ8PCuni1Bq63JC3+cGnry9EiFsQOG697jWLNlsBZsElb3EFLQgQJTVOLUKnVZMJ8=
X-Gm-Gg: ASbGncvqAmamCSTSvHmBWO1Rdf9UFtsDkKs9gTrCPPP7NesRZOkWZeJ7t3Kt5nXnv+P
	b2BqGFlqYkNCHW6VlFprFjBDsQ+6qYzmmkAytLaYBgkwDPBJ25EAi81kTJGtZoa26sqZqY5BFBc
	2R3JcDSXBqIXlR+EtafrL9dU70MfybFykOpfvqKckIS/d0ONpiIShbr18Trs+iuY4cf9kPWSPLw
	BRv5GqL1KA6TeITOZLojMFiwRG3NDpHtdvkQUi2ttNlGUyXDmwNHJPV8Y1siPVwfKcVj7IK5HrH
	BiLuQrbBMeZ9on+rWanIcgVsreQhrcSTGzBgnAChBZtPuU1gIJ89dAtbV7+3kHcEZRqmXlTNXIk
	f02IJgWIWadMREJJDJj/fmGdRcN6hPu0cow==
X-Google-Smtp-Source: AGHT+IHb5I71nz8YJIIhY789TZ8DXVSueuTS+Cp9Lta7fg4qamQr3ZvWLBc2y6VdIoWci5wbIzzqcQ==
X-Received: by 2002:a17:903:3204:b0:235:c9a7:d5fb with SMTP id d9443c01a7336-23c7965da40mr5474425ad.16.1751481599876;
        Wed, 02 Jul 2025 11:39:59 -0700 (PDT)
Received: from fedora (cpe-94-253-164-144.zg.cable.xnet.hr. [94.253.164.144])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-23acb2f39bdsm143034195ad.80.2025.07.02.11.39.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 11:39:59 -0700 (PDT)
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
Subject: [PATCH v8 07/10] i2c: at91: make it selectable for ARCH_MICROCHIP
Date: Wed,  2 Jul 2025 20:36:05 +0200
Message-ID: <20250702183856.1727275-8-robert.marko@sartura.hr>
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
index 0a4ecccd1851..0101529c80a9 100644
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
2.50.0


