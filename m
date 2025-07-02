Return-Path: <linux-i2c+bounces-11783-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C240AF6189
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Jul 2025 20:40:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A3C852448A
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Jul 2025 18:40:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D3B12BE64F;
	Wed,  2 Jul 2025 18:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="lNxRuD3y"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52FC52BE644
	for <linux-i2c@vger.kernel.org>; Wed,  2 Jul 2025 18:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751481581; cv=none; b=IVL8wue412Acrh/FoV5srgZLw6Yv9zW3wNdWpqu+0hywO39Mqu0h2vVnRW+1rkEzynUt53eOviwsUpXkPjRmD1WPGa3Vxk6DRUnR3eIw02ai12Ygmz2qm2nqh6qYcyisoaCz/jFqJwk80M99O4i30eo4EoqP514DMnoJHWqmKVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751481581; c=relaxed/simple;
	bh=oaGmzUZUXJWd6raW4UkBJCtJB/M94OwXRkxkbmWDquM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o9PEP7k+uQzx4o6Wj93cKPGi3q54Y2sMdqd0cylGDD933Z2f+vS4NJYw661rDErrHorDuyrIyvtarQEuFdgmVIV8rPC1TUN1V38Geo33JIEba09q9O7EcpIKPuvoxck5E1ArBsSAao0HzsoYRdQFL3r8+PPtfwPCf2/CJUNPtFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=lNxRuD3y; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-234d3261631so52183845ad.1
        for <linux-i2c@vger.kernel.org>; Wed, 02 Jul 2025 11:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1751481579; x=1752086379; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iKtbK/2WRQ+wXXbB4rZi2px+YsVtXfxGP3mE8Odmzx4=;
        b=lNxRuD3yBHUYnLAht+u0unHI3QeT9wuRbR6j22Z8+QsYiDExKq3z+lSq5Sacv9xjj0
         M5G46it8COb7NHT+BFekYkiDIHKl8tcROIpLQsM94Mxn8fQw/TLrBAq+Bk3oISHBke/r
         Yjmm0pbmdND0bIZietxF7HbBc/JxpuaUQRQhGE17lnhXMpnVTtXt6dl7w8QZoXjE0Dnu
         FmAOGCGf7A8nGM7qP1G0NU6d7Fimf8yF+7cGj8WML10aVvtWsjvzAAFkvl1DQnLClmkP
         ApL/n7WMvqOuRgBCTaAQmpYUgHGfGRBf6lAszdtVSK5X7x3OZUdRCiGXvg6gwkQefyoT
         x3Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751481579; x=1752086379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iKtbK/2WRQ+wXXbB4rZi2px+YsVtXfxGP3mE8Odmzx4=;
        b=GQk6AKWe50bDWScRPqnfrhqfZCi6GPtKcpXwWOvs9/84XAD0gNoA+SE7KP/dElAajE
         aZ0IBkroJGydSvS/jKgKfHUb+wbsfK3vt9oSOh4DeLHGjU52mwcn3p/uqy4JLmAqrCcr
         p1AW21u+Rl6anOmCBB3oBb8Gw32uj1/reg0c057/PXAL1Wzg0bxKWY7CSzLJQ3pw1ZJY
         yvFJxbhjmWbk0NmcmlhZ+lyVGHWo5AAfj+9Ld16VIl3U+JDZP64qZBxmphRbXhSmWUkg
         Oc6RPeUdOGgvEu7fRVhDce4EVuyUPNWawYGcvyMmrmZO2xKvC7+n3S7IkH9/SROsSwx2
         dxjQ==
X-Forwarded-Encrypted: i=1; AJvYcCX70wURrcE3eg5VTpbb65mNoiv8fd9RhwMNMy7r2aqr4VBEHTxoH6tHMc6nSVYEoDHsdKEtX+I3i0c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7jEnPThaZbggGHNeP2YQhvb60guGFk6w6L7dbtlMkXyHdo//2
	ELKD834qQx1mODsIiDojk7vbEoimmrHChf5U6PMsw+b6Bigaz3zVcHtdk5Ds+cEdLxo=
X-Gm-Gg: ASbGncuNWDk/ECY9/klSwud4s0tpHjqZTPCisH5TnukK60f+U5oaAafbGWazmU6znXK
	IGc0+qC9XEfbYWq5w6W1IptU9L3KdTCB3tkrmHcuz8UhyNxVKYq+DgvyQtEup03SRO3rPHnS6DY
	hEJHcYhkOmC2oLG+fGWu96SjUZ0jwN/CHicyYTKPLlO443z3BuH7s4FavThRvVHBLQ8CVPWm1pr
	SQVeGQGhnZCdVJ77XzvQjbfYAiub4meBBEmI0sxPCQ7wPooK6hCiKhLkScOyAI1i6a/ToKyvgUN
	QaJTBYk67sdDUF+soG95+u5PH0NnqAVmlJBmTTDFLK/qEiu0isWtQHwxQokQDwBV2lGGws4JVyg
	D+953NJOxrN2Ln1NFqt432zIGoMIhAtEBNQ==
X-Google-Smtp-Source: AGHT+IFMiw5zVlKSlo142PqqKAhtgqF1TVkOxw4N8sD11BQn40MJ5BTx7e9G7Jb+TWyMfU9vkgJvWA==
X-Received: by 2002:a17:902:e5c1:b0:235:91a:31 with SMTP id d9443c01a7336-23c796a1c47mr5430865ad.8.1751481579607;
        Wed, 02 Jul 2025 11:39:39 -0700 (PDT)
Received: from fedora (cpe-94-253-164-144.zg.cable.xnet.hr. [94.253.164.144])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-23acb2f39bdsm143034195ad.80.2025.07.02.11.39.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 11:39:39 -0700 (PDT)
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
Subject: [PATCH v8 04/10] mfd: at91-usart: Make it selectable for ARCH_MICROCHIP
Date: Wed,  2 Jul 2025 20:36:02 +0200
Message-ID: <20250702183856.1727275-5-robert.marko@sartura.hr>
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

LAN969x uses the Atmel USART, so make it selectable for ARCH_MICROCHIP to
avoid needing to update depends in future if other Microchip SoC-s use it
as well.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 drivers/mfd/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 6fb3768e3d71..0ea3a97bb93d 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -138,7 +138,7 @@ config MFD_AAT2870_CORE
 config MFD_AT91_USART
 	tristate "AT91 USART Driver"
 	select MFD_CORE
-	depends on ARCH_AT91 || ARCH_LAN969X || COMPILE_TEST
+	depends on ARCH_MICROCHIP || COMPILE_TEST
 	help
 	  Select this to get support for AT91 USART IP. This is a wrapper
 	  over at91-usart-serial driver and usart-spi-driver. Only one function
-- 
2.50.0


