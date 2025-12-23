Return-Path: <linux-i2c+bounces-14743-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7F0CDA767
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 21:19:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D2A9E30198FC
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 20:19:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3429434CFD3;
	Tue, 23 Dec 2025 20:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="sp/p1grd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1AB7158DA3
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 20:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766521182; cv=none; b=lRZ8nGKfCcHIWmsvN6GrE9Omw9nOgnjf4DH603wiMXz2EdqNV5pxZKFaZamaSROYY0isFTr0FQZcWtJ8NgZCvDjV95ZoXTLTWOW5bTSjLFgBh0EV8HuKdUV/szNZdo3xnwP/7iXk6+FO6C6MNT7r0O9mI9mgc0zMoFR/CfX8wKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766521182; c=relaxed/simple;
	bh=dIzeT2bAtbNpWCzGPjuV3B4HClIyvUup/5uZSPzsL1M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NhFAqnV5v6soTNpkapUozP6kY0Nzj50jqFVX5TkTXzS8sJXHW7QyExlMVkVx4YrWJK+nWH79tm3mwQR4jHnIzLxSTVkuTc4FT/DXD9iT0jLhZ5CzEIzPMnW+F9H+zAm+AwAGHJ+efSqxygYsehqoxx9SHa85MZQIsuj3Y8BLCbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=sp/p1grd; arc=none smtp.client-ip=209.85.210.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-pf1-f195.google.com with SMTP id d2e1a72fcca58-7b8bbf16b71so5323413b3a.2
        for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 12:19:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1766521179; x=1767125979; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g1vfXs4RxjLrMI0+CYv1SSuI1FXB9RtpNik5CYzHMIg=;
        b=sp/p1grd5lkwv7sdu7MGJVw2B0P0H5QVE8/lQhc+Z2UZNVOBBoNa5ucm40go5i/fj9
         3bRj50JzDaFFJsr8MI2FZzYTHMYcmCqt9nTPUe/PVXN/Ps5bwDnjgwZbERarBuwr46lB
         OuKPXCXNsGCklL60xZHfTLjhhnEY5kVGOl2EbzI7+pE0JMk7XTcTMKO3iF8NqtWdSiPq
         CtXHKt9XfTwL4LnbC9WBGzL1k8xf/LnpbWEJ8S0okPTAwOoUaB65017hanldfEULAnHn
         jvXLRNVzVHerjoc6u2P31IfxpTha4cFgFpF8CMffs77aGOMk+4Me/DGg/qiGyEx6ff9o
         EWtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766521179; x=1767125979;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g1vfXs4RxjLrMI0+CYv1SSuI1FXB9RtpNik5CYzHMIg=;
        b=R8I+WiBSa20nbdv3Zfd9NxJZAV20WAxthIQx4xybdkiG9Wv6+H/VtDqfH7K4adNttg
         qQ48JxdrikI2/YVnjliUtv1L6c5XyNMvGMSJJUKgYdxa9AHa6yR9aDD6APxS4hYEUo0x
         SwISPYxb7UlcyiPYev5L62Jhh59ZC3A6IDkU5tNQXEo8KH/+WajHdbkDdbK0hHtrXEg8
         x4y+aX0Uvbqa2CbKxxsHe7vcObLQ5ilTYCbEIqICI1hYY2+muqEYcYM2YJai6pRgzvMS
         mR6NTNIGvcPL7vgUTBlDwl55LFi9zFTSIADO9TgJVvki++SbHeMFtP+7x+Lv3KE4b8U1
         siCA==
X-Forwarded-Encrypted: i=1; AJvYcCWX6UFQG5/nIKEa+YHr3Lbx4PzkC5Dp8ra7TiH6iKEvzVJIOZNBfPGQZZPlJKNnPJhY7eNs5f/c9wA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxaYE78A2I8ei58OxcigyL8a2a7pbhXE0r/MQ6W4gPC/uqq+lC0
	HcPivfHzerjDQ8WrQ7rd5988PYaFEG+zSH5wD7UAcNCEky/vNZyf93sRFsGitNRy63U=
X-Gm-Gg: AY/fxX76PX0wMoRP1w0iIxmCDC2fSpJHMRWbudx4eV+EnKtoaL8UCDQTm8a22uTco4/
	5ivv+GMOpyVfszwYov8JXbs3ZSmKm0DNKxXJMGyp8Mu00I2Twet9E7sAGWQCnJTbcFWTe0GoVog
	dtoNhPrsyqwVLAONzE2wmHVTZMkGGbwueWIwX985Uue4hWFz9B1D7907snqw1H8bTijtVKD2B/X
	f+oFfPoWmdTuauVzi6/AYm2P8AQL953ICFYhJO4illbFZwV5ZT/TTA7putMGJIbjkDVV5N9Y+lZ
	UMg4ra1JAPjL9a9MDL25ZtQHQJv3GuKUZW1fcmol/GStGFLAXneg0dpOrc6GKhyE534HipoQh6L
	TGp/6FjX6lvJUSjTyMkCZ8BNB5XKPvworpLqS5ZiJA3Etu7aI72G59jSTJ1QWXgWcpkuhKASv8F
	R845Mzx12YnA/zyXdw/D0of91UUVArch7FywICYP0bCseehEy1Pjlk9phqP544iAaxCAMG2yeai
	jSXEi5x
X-Google-Smtp-Source: AGHT+IElu2DeQr7IoImhfsWaHg06ftf4nZ3LUQN+WUZ/izPfinsCvzTpfHsJa/ze8aScZK07T0eUkA==
X-Received: by 2002:a05:6a20:918d:b0:35d:d477:a801 with SMTP id adf61e73a8af0-376a7eed254mr14238755637.13.1766521179192;
        Tue, 23 Dec 2025 12:19:39 -0800 (PST)
Received: from fedora (dh207-15-53.xnet.hr. [88.207.15.53])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c1e7cbfa619sm12567549a12.36.2025.12.23.12.19.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 12:19:38 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	vkoul@kernel.org,
	andi.shyti@kernel.org,
	lee@kernel.org,
	andrew+netdev@lunn.ch,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linusw@kernel.org,
	Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com,
	olivia@selenic.com,
	radu_nicolae.pirea@upb.ro,
	richard.genoud@bootlin.com,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	broonie@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	lars.povlsen@microchip.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v3 00/15] Add support for Microchip LAN969x
Date: Tue, 23 Dec 2025 21:16:11 +0100
Message-ID: <20251223201921.1332786-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for the Microchip LAN969x switch SoC family.

Series is a bit long since after discussions in previous versions, it was
recommended[1][2] to add SoC specific compatibles for device nodes so it
includes the required bindings updates.

[1] https://lore.kernel.org/all/20251203-splendor-cubbyhole-eda2d6982b46@spud/
[2] https://lore.kernel.org/all/173412c8-c2fb-4c38-8de7-5b1c2eebdbf9@microchip.com/
[3] https://lore.kernel.org/all/20251203-duly-leotard-86b83bd840c6@spud/

Signed-off-by: Robert Marko <robert.marko@sartura.hr>

Changes in v3:
* Pick Acked-by from Conor
* Drop HWMON binding as it was picked into hwmon already
* Document EV23X71A into AT91 binding
* Drop SparX-5 and AT91 bindings merge
* Apply remark from Conor on DMA binding regarding merging cases

Changes in v2:
* Change LAN969x wildcards to LAN9691 in patches
* Split SoC DTSI and evaluation board patches
* Add the suggested binding changes required for SoC specific compatibles
* Merge SparX-5 and AT91 bindings as suggested[3]

Robert Marko (15):
  include: dt-bindings: add LAN969x clock bindings
  dt-bindings: usb: Add Microchip LAN969x support
  dt-bindings: mfd: atmel,sama5d2-flexcom: add microchip,lan9691-flexcom
  dt-bindings: serial: atmel,at91-usart: add microchip,lan9691-usart
  dt-bindings: spi: at91: add microchip,lan9691-spi
  dt-bindings: i2c: atmel,at91sam: add microchip,lan9691-i2c
  dt-bindings: rng: atmel,at91-trng: add microchip,lan9691-trng
  dt-bindings: crypto: atmel,at91sam9g46-aes: add microchip,lan9691-aes
  dt-bindings: crypto: atmel,at91sam9g46-sha: add microchip,lan9691-sha
  dt-bindings: dma: atmel: add microchip,lan9691-dma
  dt-bindings: net: mscc-miim: add microchip,lan9691-miim
  dt-bindings: pinctrl: pinctrl-microchip-sgpio: add LAN969x
  arm64: dts: microchip: add LAN969x support
  dt-bindings: arm: AT91: document EV23X71A board
  arm64: dts: microchip: add EV23X71A board

 .../devicetree/bindings/arm/atmel-at91.yaml   |   6 +
 .../crypto/atmel,at91sam9g46-aes.yaml         |   1 +
 .../crypto/atmel,at91sam9g46-sha.yaml         |   1 +
 .../bindings/dma/atmel,sama5d4-dma.yaml       |   4 +-
 .../bindings/i2c/atmel,at91sam-i2c.yaml       |   1 +
 .../bindings/mfd/atmel,sama5d2-flexcom.yaml   |   1 +
 .../devicetree/bindings/net/mscc,miim.yaml    |  11 +-
 .../pinctrl/microchip,sparx5-sgpio.yaml       |  20 +-
 .../bindings/rng/atmel,at91-trng.yaml         |   1 +
 .../bindings/serial/atmel,at91-usart.yaml     |   1 +
 .../bindings/spi/atmel,at91rm9200-spi.yaml    |   1 +
 .../bindings/usb/microchip,lan9691-dwc3.yaml  |  68 ++
 arch/arm64/boot/dts/microchip/Makefile        |   1 +
 arch/arm64/boot/dts/microchip/lan9691.dtsi    | 487 +++++++++++
 .../boot/dts/microchip/lan9696-ev23x71a.dts   | 757 ++++++++++++++++++
 include/dt-bindings/clock/microchip,lan9691.h |  24 +
 16 files changed, 1376 insertions(+), 9 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/microchip,lan9691-dwc3.yaml
 create mode 100644 arch/arm64/boot/dts/microchip/lan9691.dtsi
 create mode 100644 arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts
 create mode 100644 include/dt-bindings/clock/microchip,lan9691.h

-- 
2.52.0


