Return-Path: <linux-i2c+bounces-11779-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E40AF616F
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Jul 2025 20:39:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B8BAA7A4EA8
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Jul 2025 18:37:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C1792F50BA;
	Wed,  2 Jul 2025 18:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="rd1RwZ+5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A31221F10
	for <linux-i2c@vger.kernel.org>; Wed,  2 Jul 2025 18:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751481555; cv=none; b=bI0hu05AdfsxRkVvlP+4cIb4fex639kbVKT8EOHo0IFM+CvYmdAS7QPtU27KTQnvFno/ppzFZTCC8Do86ZZeacyfFd8ZshM3W4kAtSeULAx3hJkUMjdrzrN1HOw5z5a0gYT35usQohm2A4CDBuD/EN9GibWfJX2tAhM5K1+TLko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751481555; c=relaxed/simple;
	bh=xCRs4dzrc6WcXYmCwUPWRARDoPNR6pE48wQDzbnDrFU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GQKrlaRH3RXtwlJ7qhhqazKgQzX9ijo3BXkSGcQr9bcGfHPjHVOgvl0SEM8pt2PHVpIC57TrLLoEhDl5GroSizyf7T5YA6y4U0vIz6L9AbIR1xZHKnOrn009tvTbZUxBx+3h1IITXjfwmsqQOAWcwKVKK8g7A1bRWa2+Cib81Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=rd1RwZ+5; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-23c703c471dso2289015ad.0
        for <linux-i2c@vger.kernel.org>; Wed, 02 Jul 2025 11:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1751481552; x=1752086352; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H0vokW/WVWIh/diYEqZYuuuvilgnskYyUw0dTfGNSpI=;
        b=rd1RwZ+5nubdEQxYyJFun87C00oSIIPar2SyPLa2/vR41WjfK5wDB9i1LDVOJDpgqF
         8mK9mxPgO5iLW9e81d87+vOykBOkJSpy5k4/eqbi8L6WlqU3ZpVUQToBsGfcbuVW53MR
         6m+g6CF3ijwp+YW7yc1A472ZsLTMAurLhw4fXlbLyrn3ZMKvAjlS3awXzBr9Y8qy+ys1
         J3mb8zyJv/tEcP1rp75BdLzpVC/urUFC6R2Wlgey/2IHxk2sarL33GYm5w55fyyzQbqO
         y2JPdIcPnxWB5UOYSMmDP0WDSsezjeOveo7nWLAxA1wJJ5JzuxQ81IQjOhix55O32dz6
         MXNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751481552; x=1752086352;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H0vokW/WVWIh/diYEqZYuuuvilgnskYyUw0dTfGNSpI=;
        b=nTVETGyW3N+G8/5lT4DqkeqeYsIXqt/xLVLrh+WJUNN9ECSgppjMq+0nHvy01xgaKy
         ySJZvhu2HJ0MB85vpTToQF6Pt+GEXGPBbsp2nNNzEH0e7Hv34JZ7AMznXSuHLYvsxZ2J
         GFmnmCPHdOtjTnn4sOQgoMVnFVtCLinnVlTy3Ec3Mu131TfgsOvLTMAdu1ze2XR+rPpj
         gqyzIKEW3H5DRTMQFwW7o6pMSlp+lKpWvKVMs4U0GvQ3L8UyskO7UKf3Z/VzbM8gFCX8
         KvmtveIaEXOIJD7Vp8ut9Tq0PJ5pYXVAyNzFrCPGTBthzhQmTgHdK8Ytt69jYNA1Zqhp
         UbdA==
X-Forwarded-Encrypted: i=1; AJvYcCVUDVAKaL1RXk2tCa7CkEcSp7/fwzMP0rnMgAOlWI+UTGa5XC3nRdEXT/1VL2/yX81h7gbVfIl9Me0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9af/Z2WXbDll8g+Z0mlPY9d+O52lRQ7ALBeeBxxECI+p/Wxhv
	Y9jihx6CKfo/z/H48fIRb16OBgfCNsBkS+DX45PogIRqkV1fhSXup6ZeL0xrHwsCq16dfdcty74
	fBiVPfyk=
X-Gm-Gg: ASbGncs+DaxhAy5ZPLUaVMgbZ9trvdrkeYvqQ+ymMduFKAnVicI7tl9yPqhTpB1KMoA
	k90QOeYUeDTDldPTD7VB+deSkTJvhNp6AhIix1zMxsbeSrEaGxJ7+FnTNDKQP8xOrCjCWXNKyQu
	cloVPRYEGJalCYZXdvGmBoBk43IUUSrVd1d79rsh2As2y1Br8wBZSkni7Qzp6gQYFQKY6s4AjIb
	NqSS1aczT/jksMsRCTkLGvgGxidIxS50cG2Pc90ijxowm8oIWkN8W2AESHXmbdJ/SvEZC+ukkp2
	plus6IpWf2uezvaxQC9JfjtaekUsDxho/s2nq+/1zkDvJtHZnLR3m5OeDtw43cWzN0Up0lg0HjG
	ZbsmkGXrJCxtpmCg4j8cJpa4=
X-Google-Smtp-Source: AGHT+IGquOgZW20g+Jug5sdpx4963ZXWIcFE/S5pAht3IG0Kq6KeWcjOPzHMuBzGwiWByDwygshOwQ==
X-Received: by 2002:a17:903:1105:b0:235:f059:17de with SMTP id d9443c01a7336-23c793f0bc4mr7420165ad.15.1751481552430;
        Wed, 02 Jul 2025 11:39:12 -0700 (PDT)
Received: from fedora (cpe-94-253-164-144.zg.cable.xnet.hr. [94.253.164.144])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-23acb2f39bdsm143034195ad.80.2025.07.02.11.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 11:39:11 -0700 (PDT)
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
Subject: [PATCH v8 00/10] arm64: lan969x: Add support for Microchip LAN969x SoC
Date: Wed,  2 Jul 2025 20:35:58 +0200
Message-ID: <20250702183856.1727275-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds basic support for Microchip LAN969x SoC.

It introduces the SoC ARCH symbol itself under the ARCH_MICROCHIP symbol
which allows to avoid the need to change dependencies of the drivers that
are shared for Microchip SoC-s in the future.

DTS and further driver will be added in follow-up series.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v8:
* Move to using ARCH_MICROCHIP as suggested by Arnd
* Dropped any review tags due to changes

Robert Marko (10):
  arm64: Add config for Microchip SoC platforms
  ARM: at91: select ARCH_MICROCHIP
  arm64: lan969x: Add support for Microchip LAN969x SoC
  mfd: at91-usart: Make it selectable for ARCH_MICROCHIP
  tty: serial: atmel: make it selectable for ARCH_MICROCHIP
  spi: atmel: make it selectable for ARCH_MICROCHIP
  i2c: at91: make it selectable for ARCH_MICROCHIP
  dma: xdmac: make it selectable for ARCH_MICROCHIP
  char: hw_random: atmel: make it selectable for ARCH_MICROCHIP
  crypto: atmel-aes: make it selectable for ARCH_MICROCHIP

 arch/arm/mach-at91/Kconfig     |  4 +++
 arch/arm64/Kconfig.platforms   | 49 ++++++++++++++++++++++++----------
 drivers/char/hw_random/Kconfig |  2 +-
 drivers/crypto/Kconfig         |  2 +-
 drivers/dma/Kconfig            |  2 +-
 drivers/i2c/busses/Kconfig     |  2 +-
 drivers/mfd/Kconfig            |  2 +-
 drivers/spi/Kconfig            |  2 +-
 drivers/tty/serial/Kconfig     |  2 +-
 9 files changed, 46 insertions(+), 21 deletions(-)

-- 
2.50.0


