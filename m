Return-Path: <linux-i2c+bounces-4531-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4797691E167
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Jul 2024 15:55:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5196C1C21960
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Jul 2024 13:55:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FFC11662F5;
	Mon,  1 Jul 2024 13:54:19 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C404515F322
	for <linux-i2c@vger.kernel.org>; Mon,  1 Jul 2024 13:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719842059; cv=none; b=hIQjEhKtIpUszHbtssB/z6Den/hMb4X1o6povmHOiflN9l8lZAxWLU/0KjZPCXrPQjbLzjn7SYjHpdzpnPhN5gWWXfdpaIWdMovuIOYr5HGARIgEHydYYPxRAtVu2aGjYIzX4kdSX1jbo3Oy52e2Nb4RiAegQHNa7fm0ydTWCD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719842059; c=relaxed/simple;
	bh=Z2drrYrm6GHYiOqKFnpoV6lcOtdXllZbXaThVmQb6J4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hk2N+iqwHz4u3Bw1Lb060mlI53eisuOO6fJEnwFuCl1VGqwzoJTizXE0yK0zDTDkvjdjx9rhCaQwBmAQKMIyKXKjNjElrwwaimKagofd9XoZOW87jebiaXYT1CnUzAvwgy4pGNn5ZPbohZ3ng2LYD5wFEsjb8toVL8jb1HfKpv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1sOHTX-0001LY-IF; Mon, 01 Jul 2024 15:53:47 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
Date: Mon, 01 Jul 2024 15:53:44 +0200
Subject: [PATCH 5/9] ARM: defconfig: convert to MTD_EEPROM_AT24
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240701-b4-v6-10-topic-usbc-tcpci-v1-5-3fd5f4a193cc@pengutronix.de>
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
 arch/arm/configs/aspeed_g4_defconfig   | 2 +-
 arch/arm/configs/aspeed_g5_defconfig   | 2 +-
 arch/arm/configs/at91_dt_defconfig     | 2 +-
 arch/arm/configs/axm55xx_defconfig     | 2 +-
 arch/arm/configs/davinci_all_defconfig | 2 +-
 arch/arm/configs/imx_v4_v5_defconfig   | 2 +-
 arch/arm/configs/imx_v6_v7_defconfig   | 2 +-
 arch/arm/configs/ixp4xx_defconfig      | 2 +-
 arch/arm/configs/keystone_defconfig    | 2 +-
 arch/arm/configs/lpc18xx_defconfig     | 2 +-
 arch/arm/configs/lpc32xx_defconfig     | 2 +-
 arch/arm/configs/multi_v5_defconfig    | 2 +-
 arch/arm/configs/multi_v7_defconfig    | 2 +-
 arch/arm/configs/mvebu_v5_defconfig    | 2 +-
 arch/arm/configs/mvebu_v7_defconfig    | 2 +-
 arch/arm/configs/mxs_defconfig         | 2 +-
 arch/arm/configs/omap2plus_defconfig   | 2 +-
 arch/arm/configs/pxa_defconfig         | 2 +-
 arch/arm/configs/s3c6400_defconfig     | 2 +-
 arch/arm/configs/sama5_defconfig       | 2 +-
 arch/arm/configs/sama7_defconfig       | 2 +-
 arch/arm/configs/shmobile_defconfig    | 2 +-
 arch/arm/configs/socfpga_defconfig     | 2 +-
 arch/arm/configs/tegra_defconfig       | 2 +-
 arch/arm/configs/wpcm450_defconfig     | 2 +-
 25 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/arch/arm/configs/aspeed_g4_defconfig b/arch/arm/configs/aspeed_g4_defconfig
index 28b724d59e7e..341f7ca4ff8c 100644
--- a/arch/arm/configs/aspeed_g4_defconfig
+++ b/arch/arm/configs/aspeed_g4_defconfig
@@ -68,7 +68,7 @@ CONFIG_MTD_UBI_FASTMAP=y
 CONFIG_MTD_UBI_BLOCK=y
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_NBD=y
-CONFIG_EEPROM_AT24=y
+CONFIG_MTD_EEPROM_AT24=y
 CONFIG_NETDEVICES=y
 CONFIG_NETCONSOLE=y
 # CONFIG_NET_VENDOR_ALACRITECH is not set
diff --git a/arch/arm/configs/aspeed_g5_defconfig b/arch/arm/configs/aspeed_g5_defconfig
index 61cee1e7ebea..9c180658341f 100644
--- a/arch/arm/configs/aspeed_g5_defconfig
+++ b/arch/arm/configs/aspeed_g5_defconfig
@@ -82,7 +82,7 @@ CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_NBD=y
 CONFIG_SMPRO_ERRMON=y
 CONFIG_SMPRO_MISC=y
-CONFIG_EEPROM_AT24=y
+CONFIG_MTD_EEPROM_AT24=y
 CONFIG_EEPROM_AT25=y
 CONFIG_SCSI=y
 CONFIG_BLK_DEV_SD=y
diff --git a/arch/arm/configs/at91_dt_defconfig b/arch/arm/configs/at91_dt_defconfig
index 1d53aec4c836..fb40790fc730 100644
--- a/arch/arm/configs/at91_dt_defconfig
+++ b/arch/arm/configs/at91_dt_defconfig
@@ -60,7 +60,7 @@ CONFIG_BLK_DEV_RAM=y
 CONFIG_BLK_DEV_RAM_COUNT=4
 CONFIG_BLK_DEV_RAM_SIZE=8192
 CONFIG_ATMEL_SSC=y
-CONFIG_EEPROM_AT24=m
+CONFIG_MTD_EEPROM_AT24=m
 CONFIG_SCSI=y
 CONFIG_BLK_DEV_SD=y
 # CONFIG_BLK_DEV_BSG is not set
diff --git a/arch/arm/configs/axm55xx_defconfig b/arch/arm/configs/axm55xx_defconfig
index 516689dc6cf1..473404f468f9 100644
--- a/arch/arm/configs/axm55xx_defconfig
+++ b/arch/arm/configs/axm55xx_defconfig
@@ -89,7 +89,7 @@ CONFIG_MTD_M25P80=y
 CONFIG_PROC_DEVICETREE=y
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_RAM=y
-CONFIG_EEPROM_AT24=y
+CONFIG_MTD_EEPROM_AT24=y
 CONFIG_EEPROM_AT25=y
 CONFIG_BLK_DEV_SD=y
 CONFIG_CHR_DEV_SG=y
diff --git a/arch/arm/configs/davinci_all_defconfig b/arch/arm/configs/davinci_all_defconfig
index 3474e475373a..46701916c82d 100644
--- a/arch/arm/configs/davinci_all_defconfig
+++ b/arch/arm/configs/davinci_all_defconfig
@@ -73,7 +73,7 @@ CONFIG_BLK_DEV_LOOP=m
 CONFIG_BLK_DEV_RAM=y
 CONFIG_BLK_DEV_RAM_COUNT=1
 CONFIG_BLK_DEV_RAM_SIZE=32768
-CONFIG_EEPROM_AT24=y
+CONFIG_MTD_EEPROM_AT24=y
 CONFIG_BLK_DEV_SD=m
 CONFIG_ATA=m
 CONFIG_AHCI_DA850=m
diff --git a/arch/arm/configs/imx_v4_v5_defconfig b/arch/arm/configs/imx_v4_v5_defconfig
index 875c8cdbada7..685e685baa21 100644
--- a/arch/arm/configs/imx_v4_v5_defconfig
+++ b/arch/arm/configs/imx_v4_v5_defconfig
@@ -51,7 +51,7 @@ CONFIG_MTD_PHYSMAP=y
 CONFIG_MTD_RAW_NAND=y
 CONFIG_MTD_NAND_MXC=y
 CONFIG_MTD_UBI=y
-CONFIG_EEPROM_AT24=y
+CONFIG_MTD_EEPROM_AT24=y
 CONFIG_EEPROM_AT25=y
 CONFIG_BLK_DEV_SD=y
 # CONFIG_BLK_DEV_BSG is not set
diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/imx_v6_v7_defconfig
index cf2480dce285..03d71abf587e 100644
--- a/arch/arm/configs/imx_v6_v7_defconfig
+++ b/arch/arm/configs/imx_v6_v7_defconfig
@@ -104,7 +104,7 @@ CONFIG_MTD_UBI_BLOCK=y
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_RAM=y
 CONFIG_BLK_DEV_RAM_SIZE=65536
-CONFIG_EEPROM_AT24=y
+CONFIG_MTD_EEPROM_AT24=y
 CONFIG_EEPROM_AT25=y
 # CONFIG_SCSI_PROC_FS is not set
 CONFIG_BLK_DEV_SD=y
diff --git a/arch/arm/configs/ixp4xx_defconfig b/arch/arm/configs/ixp4xx_defconfig
index 3cb995b9616a..af36c0a7c8ae 100644
--- a/arch/arm/configs/ixp4xx_defconfig
+++ b/arch/arm/configs/ixp4xx_defconfig
@@ -98,7 +98,7 @@ CONFIG_MTD_RAW_NAND=m
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_RAM=y
 CONFIG_BLK_DEV_RAM_SIZE=8192
-CONFIG_EEPROM_AT24=y
+CONFIG_MTD_EEPROM_AT24=y
 # CONFIG_EEPROM_LEGACY is not set
 # CONFIG_SCSI_PROC_FS is not set
 CONFIG_BLK_DEV_SD=y
diff --git a/arch/arm/configs/keystone_defconfig b/arch/arm/configs/keystone_defconfig
index c1291ca290b2..c8ea405f11ab 100644
--- a/arch/arm/configs/keystone_defconfig
+++ b/arch/arm/configs/keystone_defconfig
@@ -124,7 +124,7 @@ CONFIG_MTD_SPI_NOR=y
 CONFIG_MTD_UBI=y
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_SRAM=y
-CONFIG_EEPROM_AT24=y
+CONFIG_MTD_EEPROM_AT24=y
 CONFIG_SCSI=y
 CONFIG_BLK_DEV_SD=y
 CONFIG_NETDEVICES=y
diff --git a/arch/arm/configs/lpc18xx_defconfig b/arch/arm/configs/lpc18xx_defconfig
index f55c231e0870..da6a41364a0d 100644
--- a/arch/arm/configs/lpc18xx_defconfig
+++ b/arch/arm/configs/lpc18xx_defconfig
@@ -53,7 +53,7 @@ CONFIG_MTD_SPI_NOR=y
 CONFIG_SPI_NXP_SPIFI=y
 CONFIG_BLK_DEV_RAM=y
 CONFIG_SRAM=y
-CONFIG_EEPROM_AT24=y
+CONFIG_MTD_EEPROM_AT24=y
 CONFIG_SCSI=y
 CONFIG_BLK_DEV_SD=y
 # CONFIG_BLK_DEV_BSG is not set
diff --git a/arch/arm/configs/lpc32xx_defconfig b/arch/arm/configs/lpc32xx_defconfig
index 98e267213b21..fdaa3cc28886 100644
--- a/arch/arm/configs/lpc32xx_defconfig
+++ b/arch/arm/configs/lpc32xx_defconfig
@@ -50,7 +50,7 @@ CONFIG_BLK_DEV_RAM=y
 CONFIG_BLK_DEV_RAM_COUNT=1
 CONFIG_BLK_DEV_RAM_SIZE=16384
 CONFIG_SRAM=y
-CONFIG_EEPROM_AT24=y
+CONFIG_MTD_EEPROM_AT24=y
 CONFIG_EEPROM_AT25=y
 CONFIG_SCSI=y
 CONFIG_BLK_DEV_SD=y
diff --git a/arch/arm/configs/multi_v5_defconfig b/arch/arm/configs/multi_v5_defconfig
index 3f4ddcf49ec7..82d720538f11 100644
--- a/arch/arm/configs/multi_v5_defconfig
+++ b/arch/arm/configs/multi_v5_defconfig
@@ -86,7 +86,7 @@ CONFIG_MTD_UBI=y
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_VIRTIO_BLK=y
 CONFIG_ATMEL_SSC=m
-CONFIG_EEPROM_AT24=y
+CONFIG_MTD_EEPROM_AT24=y
 # CONFIG_SCSI_PROC_FS is not set
 CONFIG_BLK_DEV_SD=y
 CONFIG_BLK_DEV_SR=m
diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 86bf057ac366..c8e77d34ac10 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -231,7 +231,7 @@ CONFIG_QCOM_FASTRPC=m
 CONFIG_APDS9802ALS=y
 CONFIG_ISL29003=y
 CONFIG_PCI_ENDPOINT_TEST=m
-CONFIG_EEPROM_AT24=y
+CONFIG_MTD_EEPROM_AT24=y
 CONFIG_BLK_DEV_SD=y
 CONFIG_BLK_DEV_SR=y
 CONFIG_ATA=y
diff --git a/arch/arm/configs/mvebu_v5_defconfig b/arch/arm/configs/mvebu_v5_defconfig
index 2467afd32146..13039167401c 100644
--- a/arch/arm/configs/mvebu_v5_defconfig
+++ b/arch/arm/configs/mvebu_v5_defconfig
@@ -68,7 +68,7 @@ CONFIG_MTD_RAW_NAND=y
 CONFIG_MTD_NAND_ORION=y
 CONFIG_MTD_SPI_NOR=y
 CONFIG_BLK_DEV_LOOP=y
-CONFIG_EEPROM_AT24=y
+CONFIG_MTD_EEPROM_AT24=y
 # CONFIG_SCSI_PROC_FS is not set
 CONFIG_BLK_DEV_SD=y
 CONFIG_BLK_DEV_SR=m
diff --git a/arch/arm/configs/mvebu_v7_defconfig b/arch/arm/configs/mvebu_v7_defconfig
index 2d2a4dc8f379..81fa4514457c 100644
--- a/arch/arm/configs/mvebu_v7_defconfig
+++ b/arch/arm/configs/mvebu_v7_defconfig
@@ -52,7 +52,7 @@ CONFIG_MTD_RAW_NAND=y
 CONFIG_MTD_NAND_MARVELL=y
 CONFIG_MTD_SPI_NOR=y
 CONFIG_MTD_UBI=y
-CONFIG_EEPROM_AT24=y
+CONFIG_MTD_EEPROM_AT24=y
 CONFIG_BLK_DEV_SD=y
 CONFIG_ATA=y
 CONFIG_SATA_AHCI=y
diff --git a/arch/arm/configs/mxs_defconfig b/arch/arm/configs/mxs_defconfig
index 43bc1255a5db..6a71f5fc6a23 100644
--- a/arch/arm/configs/mxs_defconfig
+++ b/arch/arm/configs/mxs_defconfig
@@ -52,7 +52,7 @@ CONFIG_MTD_NAND_GPMI_NAND=y
 CONFIG_MTD_SPI_NOR=y
 CONFIG_MTD_UBI=y
 # CONFIG_BLK_DEV is not set
-CONFIG_EEPROM_AT24=y
+CONFIG_MTD_EEPROM_AT24=y
 CONFIG_SCSI=y
 CONFIG_BLK_DEV_SD=y
 CONFIG_NETDEVICES=y
diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
index 3a166c2f02bd..84e2ebcec41a 100644
--- a/arch/arm/configs/omap2plus_defconfig
+++ b/arch/arm/configs/omap2plus_defconfig
@@ -294,7 +294,7 @@ CONFIG_BLK_DEV_RAM_SIZE=16384
 CONFIG_SENSORS_TSL2550=m
 CONFIG_SRAM=y
 CONFIG_PCI_ENDPOINT_TEST=m
-CONFIG_EEPROM_AT24=m
+CONFIG_MTD_EEPROM_AT24=m
 CONFIG_EEPROM_AT25=m
 CONFIG_BLK_DEV_SD=y
 # CONFIG_BLK_DEV_BSG is not set
diff --git a/arch/arm/configs/pxa_defconfig b/arch/arm/configs/pxa_defconfig
index f2ca5c9131b5..a5361194977a 100644
--- a/arch/arm/configs/pxa_defconfig
+++ b/arch/arm/configs/pxa_defconfig
@@ -155,7 +155,7 @@ CONFIG_AD525X_DPOT_I2C=m
 CONFIG_ICS932S401=m
 CONFIG_APDS9802ALS=m
 CONFIG_ISL29003=m
-CONFIG_EEPROM_AT24=m
+CONFIG_MTD_EEPROM_AT24=m
 CONFIG_SENSORS_LIS3_SPI=m
 CONFIG_SCSI=y
 CONFIG_BLK_DEV_SD=m
diff --git a/arch/arm/configs/s3c6400_defconfig b/arch/arm/configs/s3c6400_defconfig
index a37e6ac40825..3d36bcc337fc 100644
--- a/arch/arm/configs/s3c6400_defconfig
+++ b/arch/arm/configs/s3c6400_defconfig
@@ -14,7 +14,7 @@ CONFIG_MTD_RAW_NAND=y
 CONFIG_MTD_NAND_S3C2410=y
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_RAM=y
-CONFIG_EEPROM_AT24=y
+CONFIG_MTD_EEPROM_AT24=y
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_SAMSUNG=y
 CONFIG_SERIAL_SAMSUNG_CONSOLE=y
diff --git a/arch/arm/configs/sama5_defconfig b/arch/arm/configs/sama5_defconfig
index 9096a99b5abd..f92783f9515e 100644
--- a/arch/arm/configs/sama5_defconfig
+++ b/arch/arm/configs/sama5_defconfig
@@ -64,7 +64,7 @@ CONFIG_BLK_DEV_RAM=y
 CONFIG_BLK_DEV_RAM_COUNT=4
 CONFIG_BLK_DEV_RAM_SIZE=8192
 CONFIG_ATMEL_SSC=y
-CONFIG_EEPROM_AT24=y
+CONFIG_MTD_EEPROM_AT24=y
 CONFIG_SCSI=y
 CONFIG_BLK_DEV_SD=y
 # CONFIG_BLK_DEV_BSG is not set
diff --git a/arch/arm/configs/sama7_defconfig b/arch/arm/configs/sama7_defconfig
index 7fa5d251ced2..8998b9cb1fd1 100644
--- a/arch/arm/configs/sama7_defconfig
+++ b/arch/arm/configs/sama7_defconfig
@@ -95,7 +95,7 @@ CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_RAM=y
 CONFIG_BLK_DEV_RAM_COUNT=1
 CONFIG_BLK_DEV_RAM_SIZE=8192
-CONFIG_EEPROM_AT24=y
+CONFIG_MTD_EEPROM_AT24=y
 CONFIG_SCSI=y
 CONFIG_BLK_DEV_SD=y
 # CONFIG_BLK_DEV_BSG is not set
diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobile_defconfig
index 56925adfe842..4a8360d7ae60 100644
--- a/arch/arm/configs/shmobile_defconfig
+++ b/arch/arm/configs/shmobile_defconfig
@@ -46,7 +46,7 @@ CONFIG_MTD_CFI_INTELEXT=y
 CONFIG_MTD_PHYSMAP=y
 CONFIG_MTD_PHYSMAP_OF=y
 CONFIG_MTD_SPI_NOR=y
-CONFIG_EEPROM_AT24=y
+CONFIG_MTD_EEPROM_AT24=y
 CONFIG_BLK_DEV_SD=y
 CONFIG_ATA=y
 CONFIG_SATA_RCAR=y
diff --git a/arch/arm/configs/socfpga_defconfig b/arch/arm/configs/socfpga_defconfig
index e82c3866b810..3c847568fffa 100644
--- a/arch/arm/configs/socfpga_defconfig
+++ b/arch/arm/configs/socfpga_defconfig
@@ -53,7 +53,7 @@ CONFIG_BLK_DEV_RAM_COUNT=2
 CONFIG_BLK_DEV_RAM_SIZE=8192
 CONFIG_BLK_DEV_NVME=m
 CONFIG_SRAM=y
-CONFIG_EEPROM_AT24=y
+CONFIG_MTD_EEPROM_AT24=y
 CONFIG_SCSI=y
 # CONFIG_SCSI_PROC_FS is not set
 CONFIG_BLK_DEV_SD=y
diff --git a/arch/arm/configs/tegra_defconfig b/arch/arm/configs/tegra_defconfig
index d2a094ad360c..c6eab1768591 100644
--- a/arch/arm/configs/tegra_defconfig
+++ b/arch/arm/configs/tegra_defconfig
@@ -85,7 +85,7 @@ CONFIG_AD525X_DPOT_I2C=y
 CONFIG_ICS932S401=y
 CONFIG_APDS9802ALS=y
 CONFIG_ISL29003=y
-CONFIG_EEPROM_AT24=y
+CONFIG_MTD_EEPROM_AT24=y
 CONFIG_BLK_DEV_SD=y
 CONFIG_BLK_DEV_SR=y
 # CONFIG_BLK_DEV_BSG is not set
diff --git a/arch/arm/configs/wpcm450_defconfig b/arch/arm/configs/wpcm450_defconfig
index 45483deab034..c72257276067 100644
--- a/arch/arm/configs/wpcm450_defconfig
+++ b/arch/arm/configs/wpcm450_defconfig
@@ -50,7 +50,7 @@ CONFIG_MTD_UBI_FASTMAP=y
 CONFIG_MTD_UBI_BLOCK=y
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_SRAM=y
-CONFIG_EEPROM_AT24=y
+CONFIG_MTD_EEPROM_AT24=y
 CONFIG_SCSI=y
 # CONFIG_SCSI_PROC_FS is not set
 # CONFIG_SCSI_LOWLEVEL is not set

-- 
2.39.2


