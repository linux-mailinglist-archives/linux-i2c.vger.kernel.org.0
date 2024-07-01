Return-Path: <linux-i2c+bounces-4528-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 80ECD91E15F
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Jul 2024 15:54:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 36AFD1F249A2
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Jul 2024 13:54:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19E1B15ECFF;
	Mon,  1 Jul 2024 13:54:15 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68CE115ECE4
	for <linux-i2c@vger.kernel.org>; Mon,  1 Jul 2024 13:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719842054; cv=none; b=YtILxQuzyKeNsOUWTopnRLh8l8kz8xeflYzW/4eMMN/SMxMCaV683qXNzoK5lhsE7/2HZnucTnUsKZdRMXA/u/hrQuzqMrBXMnlkrdid5eNceAMCiv8o49zqNgKrpEsAKp7JGQX+6k4SbbuImolYq2tuB1mI+gmnOWNNxgZtKIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719842054; c=relaxed/simple;
	bh=TdcrekuqxkdGfFue0q5KkkRmhv3vqXpjDTGgiciypM8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fMk0IUZl8QXeugbO3xGTnhnDBSVMrx7jU5GFL1wUstUACnuJ6ucQsgC7sSOwHJ9IPGuDycFzVpQxi7ALUQmC6eBa3b2pOZ5zLAfhtTnOFTGvfF/LxDCLDvwmecdQnqGTohd5EP1o9IWRFrjkgmNspeJGcMPoLiJPdj95rlj1Uxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1sOHTW-0001LY-Vb; Mon, 01 Jul 2024 15:53:46 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH 0/9] AT24 EEPROM MTD Support
Date: Mon, 01 Jul 2024 15:53:39 +0200
Message-Id: <20240701-b4-v6-10-topic-usbc-tcpci-v1-0-3fd5f4a193cc@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOO0gmYC/x3MQQqEMAxG4atI1hNIpTjoVcTF9DeO2WhpVQTx7
 haX3+K9i7Im00xddVHSw7KtS4H7VIT5t/yVbSymWmovX3EcPB8NO+FtjQbecwBviDCGD2gDoI1
 4Kn1MOtn5vvvhvh826v1ZawAAAA==
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

This series adds the intial support to handle EEPROMs via the MTD layer
as well. This allow the user-space to have separate paritions since
EEPROMs can become quite large nowadays.

With this patchset applied EEPROMs can be accessed via:
  - legacy 'eeprom' device
  - nvmem device
  - mtd device(s)

The patchset targets only the AT24 (I2C) EEPROMs since I have no access
to AT25 (SPI) EEPROMs nor to one of the other misc/eeprom/* devices.

Note: I'm not familiar with Kconfig symbol migration so I don't know if
the last patch is required at the moment. Please be notified that the
list of recipients is quite large due to the defconfig changes.

Regards,
  Marco

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
Marco Felsch (9):
      mtd: core: add nvmem_write support
      mtd: add mtd_is_master helper
      mtd: add support to handle EEPROM devices
      mtd: devices: add AT24 eeprom support
      ARM: defconfig: convert to MTD_EEPROM_AT24
      powerpc: convert to MTD_EEPROM_AT24
      MIPS: configs: convert to MTD_EEPROM_AT24
      LoongArch: convert to MTD_EEPROM_AT24
      eeprom: at24: remove deprecated Kconfig symbol

 MAINTAINERS                                 |   2 +-
 arch/arm/configs/aspeed_g4_defconfig        |   2 +-
 arch/arm/configs/aspeed_g5_defconfig        |   2 +-
 arch/arm/configs/at91_dt_defconfig          |   2 +-
 arch/arm/configs/axm55xx_defconfig          |   2 +-
 arch/arm/configs/davinci_all_defconfig      |   2 +-
 arch/arm/configs/imx_v4_v5_defconfig        |   2 +-
 arch/arm/configs/imx_v6_v7_defconfig        |   2 +-
 arch/arm/configs/ixp4xx_defconfig           |   2 +-
 arch/arm/configs/keystone_defconfig         |   2 +-
 arch/arm/configs/lpc18xx_defconfig          |   2 +-
 arch/arm/configs/lpc32xx_defconfig          |   2 +-
 arch/arm/configs/multi_v5_defconfig         |   2 +-
 arch/arm/configs/multi_v7_defconfig         |   2 +-
 arch/arm/configs/mvebu_v5_defconfig         |   2 +-
 arch/arm/configs/mvebu_v7_defconfig         |   2 +-
 arch/arm/configs/mxs_defconfig              |   2 +-
 arch/arm/configs/omap2plus_defconfig        |   2 +-
 arch/arm/configs/pxa_defconfig              |   2 +-
 arch/arm/configs/s3c6400_defconfig          |   2 +-
 arch/arm/configs/sama5_defconfig            |   2 +-
 arch/arm/configs/sama7_defconfig            |   2 +-
 arch/arm/configs/shmobile_defconfig         |   2 +-
 arch/arm/configs/socfpga_defconfig          |   2 +-
 arch/arm/configs/tegra_defconfig            |   2 +-
 arch/arm/configs/wpcm450_defconfig          |   2 +-
 arch/loongarch/configs/loongson3_defconfig  |   2 +-
 arch/mips/configs/cavium_octeon_defconfig   |   2 +-
 arch/mips/configs/db1xxx_defconfig          |   2 +-
 arch/powerpc/configs/44x/warp_defconfig     |   2 +-
 arch/powerpc/configs/mpc512x_defconfig      |   2 +-
 arch/powerpc/configs/mpc5200_defconfig      |   2 +-
 arch/powerpc/configs/ppc6xx_defconfig       |   2 +-
 arch/powerpc/configs/skiroot_defconfig      |   2 +-
 drivers/misc/eeprom/Kconfig                 |  31 -------
 drivers/misc/eeprom/Makefile                |   1 -
 drivers/mtd/devices/Kconfig                 |  31 +++++++
 drivers/mtd/devices/Makefile                |   1 +
 drivers/{misc/eeprom => mtd/devices}/at24.c | 122 +++++++++++++++-------------
 drivers/mtd/mtdcore.c                       |  49 ++++++++++-
 include/linux/mtd/mtd.h                     |   5 ++
 include/uapi/mtd/mtd-abi.h                  |   2 +
 42 files changed, 187 insertions(+), 123 deletions(-)
---
base-commit: 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0
change-id: 20240701-b4-v6-10-topic-usbc-tcpci-c4bc9bcce604

Best regards,
-- 
Marco Felsch <m.felsch@pengutronix.de>


