Return-Path: <linux-i2c+bounces-12275-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FFE0B25277
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Aug 2025 19:51:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 904EA3AC144
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Aug 2025 17:47:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85E9C1F428F;
	Wed, 13 Aug 2025 17:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="DGEZO60c"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5D463CB
	for <linux-i2c@vger.kernel.org>; Wed, 13 Aug 2025 17:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755107254; cv=none; b=dugsEetS8rKwbwNqXcipYeROsTeM3XEfCZwY/GvmEPAS3pQcUFGxGFKi2q5QJ1gc6ZHOHa0ajzzpoh4HGv8NMWuJnUR6WFoVZQCP7OZRjetMBcCZtFwWA8nqLhW1nKAWVzLaXQoh7ccZ/e1b3actVvRmPF4RCeSj3001G8+0C9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755107254; c=relaxed/simple;
	bh=uW7fKb8DACG3fG/pvNEYkjNw8PF/bwmqPTIzgomZ1Ro=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ElHlvGuZCP0aXEynIQj8H52i6IQLzftqZ187tvtvxFZ4qtbKI+h/3fOCQcTkNDrVP4FLGm91QdUsvhaF9xD/g6REYo9sPaczImAc86JyZgelWFbDCS+O0Hf4DpySlUQGMstfuEY+Mt8la2A1nwc0Ddj2hrGWrGyNdxvGto/Vy2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=DGEZO60c; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7e8702fd3b2so8413885a.0
        for <linux-i2c@vger.kernel.org>; Wed, 13 Aug 2025 10:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1755107252; x=1755712052; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SBsfJFWg1o3SQZ+JkXCo0QRsi2YIFRfM5g31219RL4A=;
        b=DGEZO60c72VqZbdWB6I6y8y6lTjSfLZwsJnsYRYEV7fl+Gsr/ZBU7br/TQFk/w9X6v
         +iBWwlYtk7rF0GTbQkXqAEDrSgQkxXKHwBW5qh4ROpWzsmUeko8U51uNGXeIkLtD6+XC
         fgFJAz4uLS9ehXPuOiJNgP75dkuJWubS+9CKgM48wjARSOhokFybSNGiR0z+KaDR8r3c
         /U69fjPjm5xcVN3gvnc6PrthD6P3dUTmyBbbYO2FJCxvsN4dHD1K7iuHfRuR+qVV8zsE
         G1IW+SZY4tC3RVqJIxyownzDP+iskyC7nKFz24m1I+u9NX3N5NymSqAfSL6qVVH26Lyi
         E09g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755107252; x=1755712052;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SBsfJFWg1o3SQZ+JkXCo0QRsi2YIFRfM5g31219RL4A=;
        b=lbN/ETesXC87YRKWz7l804LLifpq+nCfQWyYerUTCjqWc9sI/adECCOE0OCb3EiWqr
         yY+efRSpt92I/GSSJ74mkri/Z7wfCN3RRG6CQnoN/wiR6a2i5aCuoG5S6QZ3ZKyhk9dv
         8wgbdyQkAHxdczrfmioyAuZTFyzrlcIThXAOxa8LI2GAb+TFo4oebwXfLlF0HW2yqFQt
         I2x6DAYvIyHAz1K8ZsO+VT2oTnH/ID/Za7hy2t8cgflX0tMzuKjdwao6lgswKncuT7s9
         ecF7/yfVzBdR5XK7VkcC2jCMdVwAl43TdbZyfPtjKg7WhfwtlBF3LruJyLWwRdioVmca
         9jbg==
X-Forwarded-Encrypted: i=1; AJvYcCUqEFbGoMXxuyR1H8b8ZVjXxY0aA+O9xYyHwrTmiKkuhG5NMehQlePiqPrXJHxSK7tYGASj9wxvIXk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1qHAItOEHV3Ef/jE+pUmZVKJ71r/W8fL/bLGgB2nJSURoXni/
	VJ/51SlzPLG5WBhsjqRAk33FkruesOfvwbWRtpqalxm2/5ulywb2Q25NMomXmkEaAas=
X-Gm-Gg: ASbGncsOncAOijKlrxsJZKNwEsLpGSdC8+TetHetYG4MRwIOmElEXwRNEL9RVJGieKm
	OlNjPbTfA4ejHi4MS+DBjnttpDwlz/dujS5AXub++2BW2gecy0VF/BxKJ2ZhIdN9iYNG75CNHNO
	v02nZ1bIwLet5if+D4upg0sqdKY3kuZkUW8ErLtefQY54WDqhJzJwsczMh1cIAFUwQVBYt8seKB
	N0qnDEEQRjKnSV0wmFNRcXYRGeqd9xJ5iGCG6R2GfY+Z1brVcsLMZ6GoOQ6th6I+935dEpJ8q8p
	RqAk+u574rZhxjO/bXiiiFrZlg/+IN/GJ8QJIRLAQYund9UJ17vmXccrF/FkxMqGRe9q4ljpKTW
	lPK13Jk9n1X2/bzoJXly0F+lvjofX/iOVniqWmVqigQ==
X-Google-Smtp-Source: AGHT+IEB/95DXkKwomIf9ip6/yfm146L3qIifjKU7bl9DaOBgZQZz5rMpVm/bhHv87pLjMhka3uuqw==
X-Received: by 2002:a05:620a:a102:b0:7e8:434f:ffa7 with SMTP id af79cd13be357-7e8704761a0mr24882585a.52.1755107251577;
        Wed, 13 Aug 2025 10:47:31 -0700 (PDT)
Received: from fedora (d-zg2-251.globalnet.hr. [213.149.37.251])
        by smtp.googlemail.com with ESMTPSA id af79cd13be357-7e7fa87e7d0sm1627122385a.82.2025.08.13.10.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 10:47:31 -0700 (PDT)
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
Subject: [PATCH v9 0/9] arm64: lan969x: Add support for Microchip LAN969x SoC
Date: Wed, 13 Aug 2025 19:44:36 +0200
Message-ID: <20250813174720.540015-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.50.1
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
Changes in v9:
* Make ARCH_MICROCHIP hidden symbol that is selected by SparX-5 and LAN969x
directly, this avoids breaking existing configs with ARCH_SPARX5

Changes in v8:
* Move to using ARCH_MICROCHIP as suggested by Arnd
* Dropped any review tags due to changes

Robert Marko (9):
  arm64: Add config for Microchip SoC platforms
  ARM: at91: select ARCH_MICROCHIP
  arm64: lan969x: Add support for Microchip LAN969x SoC
  mfd: at91-usart: Make it selectable for ARCH_MICROCHIP
  tty: serial: atmel: make it selectable for ARCH_MICROCHIP
  spi: atmel: make it selectable for ARCH_MICROCHIP
  i2c: at91: make it selectable for ARCH_MICROCHIP
  char: hw_random: atmel: make it selectable for ARCH_MICROCHIP
  crypto: atmel-aes: make it selectable for ARCH_MICROCHIP

 arch/arm/mach-at91/Kconfig     |  4 +++
 arch/arm64/Kconfig.platforms   | 51 ++++++++++++++++++++++++----------
 drivers/char/hw_random/Kconfig |  2 +-
 drivers/crypto/Kconfig         |  2 +-
 drivers/i2c/busses/Kconfig     |  2 +-
 drivers/mfd/Kconfig            |  2 +-
 drivers/spi/Kconfig            |  2 +-
 drivers/tty/serial/Kconfig     |  2 +-
 8 files changed, 47 insertions(+), 20 deletions(-)

-- 
2.50.1


