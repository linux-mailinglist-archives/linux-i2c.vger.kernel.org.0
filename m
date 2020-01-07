Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C2BE5132115
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jan 2020 09:13:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727084AbgAGINP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Jan 2020 03:13:15 -0500
Received: from mail.kernel.org ([198.145.29.99]:56086 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725987AbgAGINO (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 7 Jan 2020 03:13:14 -0500
Received: from PC-kkoz.proceq.com (unknown [213.160.61.66])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 37EA9207E0;
        Tue,  7 Jan 2020 08:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578384793;
        bh=sNltMChixzyWwX3zupZT4Ts/ZN+2imHrBMUIskkEt8Y=;
        h=From:To:Cc:Subject:Date:From;
        b=sbQghMZJtOnTiCISsQ4ebIteWahMfX3lOe6FuGwMTD4fNuZvCGsgxYclnNG+YeXzV
         4sVT29y9L7RbTBMtr3bh2zxlicV/poosjyGHDYO0lnwPmyomnugskZlQ/QwM67gztX
         BTUusm0ai48vMPi44u/1g8GyHpKpLfPkKWb9HTEY=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Wolfram Sang <wsa@the-dreams.de>, Jean Delvare <jdelvare@suse.de>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Greg KH <greg@kroah.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2 1/2] i2c: Enable compile testing for some of drivers
Date:   Tue,  7 Jan 2020 09:12:58 +0100
Message-Id: <1578384779-15487-1-git-send-email-krzk@kernel.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Some of the I2C bus drivers can be compile tested to increase build
coverage.  This requires also:
1. Adding dependencies on COMMON_CLK for BCM2835 and Meson I2C
   controllers,
2. Adding 'if' conditional to 'default y' so they will not get enabled
   by default on all other architectures,
3. Limiting few compile test options to supported architectures (which
   provide the readsX()/writesX() primitives).

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v1:
1. Address Geert's comments (split depends, comment on weird
   architecture selection).
---
 drivers/i2c/busses/Kconfig | 66 +++++++++++++++++++++++++---------------------
 1 file changed, 36 insertions(+), 30 deletions(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 6a0aa76859f3..132e6f374cd7 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -367,7 +367,8 @@ comment "I2C system bus drivers (mostly embedded / system-on-chip)"
 
 config I2C_ALTERA
 	tristate "Altera Soft IP I2C"
-	depends on (ARCH_SOCFPGA || NIOS2) && OF
+	depends on ARCH_SOCFPGA || NIOS2 || COMPILE_TEST
+	depends on OF
 	help
 	  If you say yes to this option, support will be included for the
 	  Altera Soft IP I2C interfaces on SoCFPGA and Nios2 architectures.
@@ -387,7 +388,7 @@ config I2C_ASPEED
 
 config I2C_AT91
 	tristate "Atmel AT91 I2C Two-Wire interface (TWI)"
-	depends on ARCH_AT91
+	depends on ARCH_AT91 || COMPILE_TEST
 	help
 	  This supports the use of the I2C interface on Atmel AT91
 	  processors.
@@ -440,7 +441,8 @@ config I2C_AXXIA
 
 config I2C_BCM2835
 	tristate "Broadcom BCM2835 I2C controller"
-	depends on ARCH_BCM2835 || ARCH_BRCMSTB
+	depends on ARCH_BCM2835 || ARCH_BRCMSTB || COMPILE_TEST
+	depends on COMMON_CLK
 	help
 	  If you say yes to this option, support will be included for the
 	  BCM2835 I2C controller.
@@ -463,8 +465,8 @@ config I2C_BCM_IPROC
 
 config I2C_BCM_KONA
 	tristate "BCM Kona I2C adapter"
-	depends on ARCH_BCM_MOBILE
-	default y
+	depends on ARCH_BCM_MOBILE || COMPILE_TEST
+	default y if ARCH_BCM_MOBILE
 	help
 	  If you say yes to this option, support will be included for the
 	  I2C interface on the Broadcom Kona family of processors.
@@ -511,7 +513,7 @@ config I2C_CPM
 
 config I2C_DAVINCI
 	tristate "DaVinci I2C driver"
-	depends on ARCH_DAVINCI || ARCH_KEYSTONE
+	depends on ARCH_DAVINCI || ARCH_KEYSTONE || COMPILE_TEST
 	help
 	  Support for TI DaVinci I2C controller driver.
 
@@ -572,7 +574,7 @@ config I2C_DESIGNWARE_BAYTRAIL
 
 config I2C_DIGICOLOR
 	tristate "Conexant Digicolor I2C driver"
-	depends on ARCH_DIGICOLOR
+	depends on ARCH_DIGICOLOR || COMPILE_TEST
 	help
 	  Support for Conexant Digicolor SoCs (CX92755) I2C controller driver.
 
@@ -611,8 +613,9 @@ config I2C_EMEV2
 
 config I2C_EXYNOS5
 	tristate "Exynos5 high-speed I2C driver"
-	depends on ARCH_EXYNOS && OF
-	default y
+	depends on OF
+	depends on ARCH_EXYNOS || COMPILE_TEST
+	default y if ARCH_EXYNOS
 	help
 	  High-speed I2C controller on Exynos5 based Samsung SoCs.
 
@@ -634,7 +637,7 @@ config I2C_GPIO_FAULT_INJECTOR
 
 config I2C_HIGHLANDER
 	tristate "Highlander FPGA SMBus interface"
-	depends on SH_HIGHLANDER
+	depends on SH_HIGHLANDER || COMPILE_TEST
 	help
 	  If you say yes to this option, support will be included for
 	  the SMBus interface located in the FPGA on various Highlander
@@ -686,7 +689,7 @@ config I2C_IMX_LPI2C
 
 config I2C_IOP3XX
 	tristate "Intel IOPx3xx and IXP4xx on-chip I2C interface"
-	depends on ARCH_IOP32X || ARCH_IXP4XX
+	depends on ARCH_IOP32X || ARCH_IXP4XX || COMPILE_TEST
 	help
 	  Say Y here if you want to use the IIC bus controller on
 	  the Intel IOPx3xx I/O Processors or IXP4xx Network Processors.
@@ -726,6 +729,7 @@ config I2C_LPC2K
 config I2C_MESON
 	tristate "Amlogic Meson I2C controller"
 	depends on ARCH_MESON || COMPILE_TEST
+	depends on COMMON_CLK
 	help
 	  If you say yes to this option, support will be included for the
 	  I2C interface on the Amlogic Meson family of SoCs.
@@ -759,7 +763,7 @@ config I2C_MT7621
 
 config I2C_MV64XXX
 	tristate "Marvell mv64xxx I2C Controller"
-	depends on MV64X60 || PLAT_ORION || ARCH_SUNXI || ARCH_MVEBU
+	depends on MV64X60 || PLAT_ORION || ARCH_SUNXI || ARCH_MVEBU || COMPILE_TEST
 	help
 	  If you say yes to this option, support will be included for the
 	  built-in I2C interface on the Marvell 64xxx line of host bridges.
@@ -770,7 +774,7 @@ config I2C_MV64XXX
 
 config I2C_MXS
 	tristate "Freescale i.MX28 I2C interface"
-	depends on SOC_IMX28
+	depends on SOC_IMX28 || COMPILE_TEST
 	select STMP_DEVICE
 	help
 	  Say Y here if you want to use the I2C bus controller on
@@ -799,7 +803,7 @@ config I2C_OCORES
 
 config I2C_OMAP
 	tristate "OMAP I2C adapter"
-	depends on ARCH_OMAP || ARCH_K3
+	depends on ARCH_OMAP || ARCH_K3 || COMPILE_TEST
 	default y if MACH_OMAP_H3 || MACH_OMAP_OSK
 	help
 	  If you say yes to this option, support will be included for the
@@ -833,7 +837,7 @@ config I2C_PCA_PLATFORM
 
 config I2C_PMCMSP
 	tristate "PMC MSP I2C TWI Controller"
-	depends on PMC_MSP
+	depends on PMC_MSP || COMPILE_TEST
 	help
 	  This driver supports the PMC TWI controller on MSP devices.
 
@@ -842,7 +846,7 @@ config I2C_PMCMSP
 
 config I2C_PNX
 	tristate "I2C bus support for Philips PNX and NXP LPC targets"
-	depends on ARCH_LPC32XX
+	depends on ARCH_LPC32XX || COMPILE_TEST
 	help
 	  This driver supports the Philips IP3204 I2C IP block master and/or
 	  slave controller
@@ -863,7 +867,7 @@ config I2C_PUV3
 
 config I2C_PXA
 	tristate "Intel PXA2XX I2C adapter"
-	depends on ARCH_PXA || ARCH_MMP || ARCH_MVEBU || (X86_32 && PCI && OF)
+	depends on ARCH_PXA || ARCH_MMP || ARCH_MVEBU || (X86_32 && PCI && OF) || COMPILE_TEST
 	help
 	  If you have devices in the PXA I2C bus, say yes to this option.
 	  This driver can also be built as a module.  If so, the module
@@ -933,7 +937,7 @@ config HAVE_S3C2410_I2C
 
 config I2C_S3C2410
 	tristate "S3C2410 I2C Driver"
-	depends on HAVE_S3C2410_I2C
+	depends on HAVE_S3C2410_I2C || COMPILE_TEST
 	help
 	  Say Y here to include support for I2C controller in the
 	  Samsung SoCs.
@@ -971,7 +975,7 @@ config I2C_SIMTEC
 
 config I2C_SIRF
 	tristate "CSR SiRFprimaII I2C interface"
-	depends on ARCH_SIRF
+	depends on ARCH_SIRF || COMPILE_TEST
 	help
 	  If you say yes to this option, support will be included for the
 	  CSR SiRFprimaII I2C interface.
@@ -981,14 +985,14 @@ config I2C_SIRF
 
 config I2C_SPRD
 	tristate "Spreadtrum I2C interface"
-	depends on I2C=y && ARCH_SPRD
+	depends on I2C=y && (ARCH_SPRD || COMPILE_TEST)
 	help
 	  If you say yes to this option, support will be included for the
 	  Spreadtrum I2C interface.
 
 config I2C_ST
 	tristate "STMicroelectronics SSC I2C support"
-	depends on ARCH_STI
+	depends on ARCH_STI || COMPILE_TEST
 	help
 	  Enable this option to add support for STMicroelectronics SoCs
 	  hardware SSC (Synchronous Serial Controller) as an I2C controller.
@@ -1019,7 +1023,7 @@ config I2C_STM32F7
 
 config I2C_STU300
 	tristate "ST Microelectronics DDC I2C interface"
-	depends on MACH_U300
+	depends on MACH_U300 || COMPILE_TEST
 	default y if MACH_U300
 	help
 	  If you say yes to this option, support will be included for the
@@ -1055,15 +1059,16 @@ config I2C_SYNQUACER
 
 config I2C_TEGRA
 	tristate "NVIDIA Tegra internal I2C controller"
-	depends on ARCH_TEGRA
+	depends on ARCH_TEGRA || (COMPILE_TEST && (ARC || ARM || ARM64 || M68K || RISCV || SUPERH || SPARC))
+	# COMPILE_TEST needs architectures with readsX()/writesX() primitives
 	help
 	  If you say yes to this option, support will be included for the
 	  I2C controller embedded in NVIDIA Tegra SOCs
 
 config I2C_TEGRA_BPMP
 	tristate "NVIDIA Tegra BPMP I2C controller"
-	depends on TEGRA_BPMP
-	default y
+	depends on TEGRA_BPMP || COMPILE_TEST
+	default y if TEGRA_BPMP
 	help
 	  If you say yes to this option, support will be included for the I2C
 	  controller embedded in NVIDIA Tegra SoCs accessed via the BPMP.
@@ -1101,7 +1106,7 @@ config I2C_VERSATILE
 
 config I2C_WMT
 	tristate "Wondermedia WM8xxx SoC I2C bus support"
-	depends on ARCH_VT8500
+	depends on ARCH_VT8500 || COMPILE_TEST
 	help
 	  Say yes if you want to support the I2C bus on Wondermedia 8xxx-series
 	  SoCs.
@@ -1142,7 +1147,7 @@ config I2C_XILINX
 
 config I2C_XLR
 	tristate "Netlogic XLR and Sigma Designs I2C support"
-	depends on CPU_XLR || ARCH_TANGO
+	depends on CPU_XLR || ARCH_TANGO || COMPILE_TEST
 	help
 	  This driver enables support for the on-chip I2C interface of
 	  the Netlogic XLR/XLS MIPS processors and Sigma Designs SOCs.
@@ -1328,7 +1333,7 @@ config I2C_ICY
 
 config I2C_MLXCPLD
 	tristate "Mellanox I2C driver"
-	depends on X86_64
+	depends on X86_64 || COMPILE_TEST
 	help
 	  This exposes the Mellanox platform I2C busses to the linux I2C layer
 	  for X86 based systems.
@@ -1403,8 +1408,9 @@ config I2C_OPAL
 
 config I2C_ZX2967
 	tristate "ZTE ZX2967 I2C support"
-	depends on ARCH_ZX
-	default y
+	depends on ARCH_ZX || (COMPILE_TEST && (ARC || ARM || ARM64 || M68K || RISCV || SUPERH || SPARC))
+	# COMPILE_TEST needs architectures with readsX()/writesX() primitives
+	default y if ARCH_ZX
 	help
 	  Selecting this option will add ZX2967 I2C driver.
 	  This driver can also be built as a module. If so, the module will be
-- 
2.7.4

