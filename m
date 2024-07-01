Return-Path: <linux-i2c+bounces-4523-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A4D91E15A
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Jul 2024 15:54:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C69F3286625
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Jul 2024 13:54:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3734215EFBA;
	Mon,  1 Jul 2024 13:54:14 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C8D15ECE1
	for <linux-i2c@vger.kernel.org>; Mon,  1 Jul 2024 13:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719842054; cv=none; b=FWpV1Ld3jkkZZSH0uqpGBGpGO5p6O4YSCQK3Y2GUOOt+lU/+yf7MiK2ua2qR8E98p25GgyM6Tn9alE2Qhe4LaEuMdjUtNHdvfGcuics9ELGfMbIOwOFNnStMpg8k5b6FmXdT65CESLT+9RLbN+yNrQdyTJJ4I3KR2etA73UUlIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719842054; c=relaxed/simple;
	bh=d1VqLgtNJ7N5InaRsqu3AvJq0Y06PnoD+deMUi+gLeY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kNdeviRc8VHbPMCvCkhMs0/APtTc94qXAD6yOKF2slA21l9nEKP4owp9DcEuMxcUwtHw58ULnMAt+mpWxkd9n1dEjc5xS8iEzFNxkrVt07YbZuxWST45LswwR5sT3xkCHM4sAJlkdf2G9zeOJGcLT+IMBlbtMMOtc5MK80HkoKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1sOHTX-0001LY-UP; Mon, 01 Jul 2024 15:53:47 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
Date: Mon, 01 Jul 2024 15:53:47 +0200
Subject: [PATCH 8/9] LoongArch: convert to MTD_EEPROM_AT24
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240701-b4-v6-10-topic-usbc-tcpci-v1-8-3fd5f4a193cc@pengutronix.de>
References: <20240701-b4-v6-10-topic-usbc-tcpci-v1-0-3fd5f4a193cc@pengutronix.de>
In-Reply-To: <20240701-b4-v6-10-topic-usbc-tcpci-v1-0-3fd5f4a193cc@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Russell King <linux@armlinux.org.uk>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, 
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Tony Lindgren <tony@atomide.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, imx@lists.linux.dev, 
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-tegra@vger.kernel.org, openbmc@lists.ozlabs.org, 
 linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org, 
 loongarch@lists.linux.dev, Marco Felsch <m.felsch@pengutronix.de>
X-Mailer: b4 0.15-dev
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: m.felsch@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org

The EEPROM_AT24 Kconfig symbol is marked as deprecated. Make use of the
new Kconfig symbol to select the I2C EEPROM driver support.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 arch/loongarch/configs/loongson3_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/loongarch/configs/loongson3_defconfig b/arch/loongarch/configs/loongson3_defconfig
index b4252c357c8e..31daff75a01a 100644
--- a/arch/loongarch/configs/loongson3_defconfig
+++ b/arch/loongarch/configs/loongson3_defconfig
@@ -433,7 +433,7 @@ CONFIG_NVME_TARGET_LOOP=m
 CONFIG_NVME_TARGET_RDMA=m
 CONFIG_NVME_TARGET_FC=m
 CONFIG_NVME_TARGET_TCP=m
-CONFIG_EEPROM_AT24=m
+CONFIG_MTD_EEPROM_AT24=m
 CONFIG_BLK_DEV_SD=y
 CONFIG_BLK_DEV_SR=y
 CONFIG_CHR_DEV_SG=y

-- 
2.39.2


