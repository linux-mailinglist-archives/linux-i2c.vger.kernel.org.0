Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 774B9604B1A
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Oct 2022 17:21:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231835AbiJSPVF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 Oct 2022 11:21:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231964AbiJSPUl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 19 Oct 2022 11:20:41 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FDDA43E7E;
        Wed, 19 Oct 2022 08:14:28 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 0105BB824BC;
        Wed, 19 Oct 2022 15:13:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7435C433D7;
        Wed, 19 Oct 2022 15:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666192396;
        bh=cjxPuXIUh06Ba3GXCFfVn99lEclLPcRfw+NxBEe4Kg0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hcqsxINcYzTT3DkcHDdYLB3QHhzbGuZGKInydfT12xgHvQHRd+WIXuP/R+G72JcGv
         8UsKYmj1ahxyJmVtwy5znbGtIhatHTgimQ0bKYqVvLf5nT+uoyLG5DlBiSi6wqg8aK
         HQ7odPwMV3m+iM8lqW+mtYrxkBcwzKfb/bfSHmu4Qr5I1og+Bapxwt6ZVQkX/G2KoZ
         cGkayXvERL+uxCqkHHjG+BVfiodRgnUnAFLCeVdM3ykW5bKp/Z3iYkiKGbHS5rD5Fm
         UwAx1OMTozZCpDzK8nNraeh4avjKSnvrpt1R9KBMir1uZtRg/J1vsfUk/yGd0yCJYi
         JEBd8KCEwHd2w==
From:   Arnd Bergmann <arnd@kernel.org>
To:     linux-arm-kernel@lists.infradead.org
Cc:     linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Dan Williams <dan.j.williams@intel.com>,
        Lennert Buytenhek <kernel@wantstofly.org>,
        Martin Michlmayr <tbm@cyrius.com>, linux-i2c@vger.kernel.org
Subject: [PATCH 09/17] ARM: iop32x: remove the platform
Date:   Wed, 19 Oct 2022 17:03:31 +0200
Message-Id: <20221019150410.3851944-9-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20221019150410.3851944-1-arnd@kernel.org>
References: <20221019144119.3848027-1-arnd@kernel.org>
 <20221019150410.3851944-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

This was marked as unused in 5.19 and can now be removed

Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Lennert Buytenhek <kernel@wantstofly.org>
Cc: Martin Michlmayr <tbm@cyrius.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 MAINTAINERS                        |  30 ---
 arch/arm/Kconfig                   |   4 +-
 arch/arm/Kconfig.debug             |   6 +-
 arch/arm/Makefile                  |   1 -
 arch/arm/configs/iop32x_defconfig  | 126 ---------
 arch/arm/kernel/entry-common.S     |  15 --
 arch/arm/mach-iop32x/Kconfig       |  54 ----
 arch/arm/mach-iop32x/Makefile      |  20 --
 arch/arm/mach-iop32x/adma.c        | 163 ------------
 arch/arm/mach-iop32x/cp6.c         |  48 ----
 arch/arm/mach-iop32x/em7210.c      | 232 -----------------
 arch/arm/mach-iop32x/glantank.c    | 214 ---------------
 arch/arm/mach-iop32x/glantank.h    |  12 -
 arch/arm/mach-iop32x/gpio-iop32x.h |  11 -
 arch/arm/mach-iop32x/hardware.h    |  38 ---
 arch/arm/mach-iop32x/i2c.c         |  92 -------
 arch/arm/mach-iop32x/iop3xx.h      | 326 -----------------------
 arch/arm/mach-iop32x/iq31244.c     | 333 ------------------------
 arch/arm/mach-iop32x/iq31244.h     |  16 --
 arch/arm/mach-iop32x/iq80321.c     | 192 --------------
 arch/arm/mach-iop32x/iq80321.h     |  16 --
 arch/arm/mach-iop32x/irq.c         |  95 -------
 arch/arm/mach-iop32x/irqs.h        |  48 ----
 arch/arm/mach-iop32x/n2100.c       | 367 --------------------------
 arch/arm/mach-iop32x/n2100.h       |  18 --
 arch/arm/mach-iop32x/pci.c         | 404 -----------------------------
 arch/arm/mach-iop32x/pmu.c         |  29 ---
 arch/arm/mach-iop32x/restart.c     |  17 --
 arch/arm/mach-iop32x/setup.c       |  31 ---
 arch/arm/mach-iop32x/time.c        | 179 -------------
 drivers/i2c/busses/Kconfig         |   6 +-
 31 files changed, 6 insertions(+), 3137 deletions(-)
 delete mode 100644 arch/arm/configs/iop32x_defconfig
 delete mode 100644 arch/arm/mach-iop32x/Kconfig
 delete mode 100644 arch/arm/mach-iop32x/Makefile
 delete mode 100644 arch/arm/mach-iop32x/adma.c
 delete mode 100644 arch/arm/mach-iop32x/cp6.c
 delete mode 100644 arch/arm/mach-iop32x/em7210.c
 delete mode 100644 arch/arm/mach-iop32x/glantank.c
 delete mode 100644 arch/arm/mach-iop32x/glantank.h
 delete mode 100644 arch/arm/mach-iop32x/gpio-iop32x.h
 delete mode 100644 arch/arm/mach-iop32x/hardware.h
 delete mode 100644 arch/arm/mach-iop32x/i2c.c
 delete mode 100644 arch/arm/mach-iop32x/iop3xx.h
 delete mode 100644 arch/arm/mach-iop32x/iq31244.c
 delete mode 100644 arch/arm/mach-iop32x/iq31244.h
 delete mode 100644 arch/arm/mach-iop32x/iq80321.c
 delete mode 100644 arch/arm/mach-iop32x/iq80321.h
 delete mode 100644 arch/arm/mach-iop32x/irq.c
 delete mode 100644 arch/arm/mach-iop32x/irqs.h
 delete mode 100644 arch/arm/mach-iop32x/n2100.c
 delete mode 100644 arch/arm/mach-iop32x/n2100.h
 delete mode 100644 arch/arm/mach-iop32x/pci.c
 delete mode 100644 arch/arm/mach-iop32x/pmu.c
 delete mode 100644 arch/arm/mach-iop32x/restart.c
 delete mode 100644 arch/arm/mach-iop32x/setup.c
 delete mode 100644 arch/arm/mach-iop32x/time.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 89f72dba8e64..da1ff468e27d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2215,21 +2215,6 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	arch/arm/mach-pxa/colibri-pxa270-income.c
 
-ARM/INTEL IOP32X ARM ARCHITECTURE
-M:	Lennert Buytenhek <kernel@wantstofly.org>
-L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-S:	Maintained
-
-ARM/INTEL IQ81342EX MACHINE SUPPORT
-M:	Lennert Buytenhek <kernel@wantstofly.org>
-L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-S:	Maintained
-
-ARM/INTEL IXDP2850 MACHINE SUPPORT
-M:	Lennert Buytenhek <kernel@wantstofly.org>
-L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-S:	Maintained
-
 ARM/INTEL IXP4XX ARM ARCHITECTURE
 M:	Linus Walleij <linusw@kernel.org>
 M:	Imre Kaloz <kaloz@openwrt.org>
@@ -2635,11 +2620,6 @@ F:	include/dt-bindings/*/qcom*
 F:	include/linux/*/qcom*
 F:	include/linux/soc/qcom/
 
-ARM/RADISYS ENP2611 MACHINE SUPPORT
-M:	Lennert Buytenhek <kernel@wantstofly.org>
-L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-S:	Maintained
-
 ARM/RDA MICRO ARCHITECTURE
 M:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
@@ -2971,11 +2951,6 @@ F:	arch/arm64/boot/dts/ti/Makefile
 F:	arch/arm64/boot/dts/ti/k3-*
 F:	include/dt-bindings/pinctrl/k3.h
 
-ARM/THECUS N2100 MACHINE SUPPORT
-M:	Lennert Buytenhek <kernel@wantstofly.org>
-L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-S:	Maintained
-
 ARM/TOSA MACHINE SUPPORT
 M:	Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
 M:	Dirk Opfer <dirk@opfer-online.de>
@@ -10307,11 +10282,6 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git
 F:	drivers/iommu/intel/
 F:	include/linux/intel-svm.h
 
-INTEL IOP-ADMA DMA DRIVER
-R:	Dan Williams <dan.j.williams@intel.com>
-S:	Odd fixes
-F:	drivers/dma/iop-adma.c
-
 INTEL IPU3 CSI-2 CIO2 DRIVER
 M:	Yong Zhi <yong.zhi@intel.com>
 M:	Sakari Ailus <sakari.ailus@linux.intel.com>
diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index e58dab0303e6..698d88343e8e 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -280,7 +280,7 @@ config PHYS_OFFSET
 	default 0x00000000 if ARCH_FOOTBRIDGE
 	default 0x10000000 if ARCH_OMAP1 || ARCH_RPC
 	default 0x30000000 if ARCH_S3C24XX
-	default 0xa0000000 if ARCH_IOP32X || ARCH_PXA
+	default 0xa0000000 if ARCH_PXA
 	default 0xc0000000 if ARCH_EP93XX || ARCH_SA1100
 	default 0
 	help
@@ -455,8 +455,6 @@ source "arch/arm/mach-hpe/Kconfig"
 
 source "arch/arm/mach-imx/Kconfig"
 
-source "arch/arm/mach-iop32x/Kconfig"
-
 source "arch/arm/mach-ixp4xx/Kconfig"
 
 source "arch/arm/mach-keystone/Kconfig"
diff --git a/arch/arm/Kconfig.debug b/arch/arm/Kconfig.debug
index 3b11e1d04625..320c93fabb21 100644
--- a/arch/arm/Kconfig.debug
+++ b/arch/arm/Kconfig.debug
@@ -1610,7 +1610,7 @@ config DEBUG_UART_PL01X
 
 # Compatibility options for 8250
 config DEBUG_UART_8250
-	def_bool ARCH_IOP32X || ARCH_IXP4XX || ARCH_RPC
+	def_bool ARCH_IXP4XX || ARCH_RPC
 
 config DEBUG_UART_PHYS
 	hex "Physical base address of debug UART"
@@ -1720,7 +1720,6 @@ config DEBUG_UART_PHYS
 	default 0xfcb00000 if DEBUG_HI3620_UART
 	default 0xfd883000 if DEBUG_ALPINE_UART0
 	default 0xfe531000 if DEBUG_STIH41X_SBC_ASC1
-	default 0xfe800000 if ARCH_IOP32X
 	default 0xfed32000 if DEBUG_STIH41X_ASC2
 	default 0xff690000 if DEBUG_RK32_UART2
 	default 0xffc02000 if DEBUG_SOCFPGA_UART0
@@ -1825,7 +1824,6 @@ config DEBUG_UART_VIRT
 	default 0xfe018000 if DEBUG_MMP_UART3
 	default 0xfe100000 if DEBUG_IMX23_UART || DEBUG_IMX28_UART
 	default 0xfe300000 if DEBUG_BCM_KONA_UART
-	default 0xfe800000 if ARCH_IOP32X
 	default 0xfeb00000 if DEBUG_HI3620_UART || DEBUG_HIX5HD2_UART
 	default 0xfeb24000 if DEBUG_RK3X_UART0
 	default 0xfeb26000 if DEBUG_RK3X_UART1
@@ -1867,7 +1865,7 @@ config DEBUG_UART_VIRT
 config DEBUG_UART_8250_SHIFT
 	int "Register offset shift for the 8250 debug UART"
 	depends on DEBUG_LL_UART_8250 || DEBUG_UART_8250
-	default 0 if DEBUG_FOOTBRIDGE_COM1 || ARCH_IOP32X || DEBUG_BCM_5301X || \
+	default 0 if DEBUG_FOOTBRIDGE_COM1 || DEBUG_BCM_5301X || \
 		DEBUG_BCM_HR2 || DEBUG_OMAP7XXUART1 || DEBUG_OMAP7XXUART2 || \
 		DEBUG_OMAP7XXUART3
 	default 3 if DEBUG_MSTARV7_PMUART
diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index beda22911feb..1a62035d1207 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -179,7 +179,6 @@ machine-$(CONFIG_ARCH_GEMINI)		+= gemini
 machine-$(CONFIG_ARCH_HIGHBANK)		+= highbank
 machine-$(CONFIG_ARCH_HISI)		+= hisi
 machine-$(CONFIG_ARCH_HPE)		+= hpe
-machine-$(CONFIG_ARCH_IOP32X)		+= iop32x
 machine-$(CONFIG_ARCH_IXP4XX)		+= ixp4xx
 machine-$(CONFIG_ARCH_KEYSTONE)		+= keystone
 machine-$(CONFIG_ARCH_LPC18XX)		+= lpc18xx
diff --git a/arch/arm/configs/iop32x_defconfig b/arch/arm/configs/iop32x_defconfig
deleted file mode 100644
index 19e30e790d35..000000000000
--- a/arch/arm/configs/iop32x_defconfig
+++ /dev/null
@@ -1,126 +0,0 @@
-CONFIG_SYSVIPC=y
-CONFIG_BSD_PROCESS_ACCT=y
-CONFIG_LOG_BUF_SHIFT=14
-CONFIG_BLK_DEV_INITRD=y
-CONFIG_KALLSYMS_ALL=y
-# CONFIG_ARCH_MULTI_V7 is not set
-CONFIG_ARCH_IOP32X=y
-CONFIG_MACH_GLANTANK=y
-CONFIG_ARCH_IQ80321=y
-CONFIG_ARCH_IQ31244=y
-CONFIG_MACH_N2100=y
-CONFIG_UNUSED_BOARD_FILES=y
-CONFIG_CMDLINE="console=ttyS0,115200 root=/dev/nfs ip=bootp cachepolicy=writealloc"
-CONFIG_FPE_NWFPE=y
-CONFIG_MODULES=y
-CONFIG_MODULE_UNLOAD=y
-CONFIG_PARTITION_ADVANCED=y
-CONFIG_SLAB=y
-CONFIG_NET=y
-CONFIG_PACKET=y
-CONFIG_UNIX=y
-CONFIG_INET=y
-CONFIG_IP_MULTICAST=y
-CONFIG_IP_PNP=y
-CONFIG_IP_PNP_BOOTP=y
-CONFIG_IPV6=y
-# CONFIG_INET6_XFRM_MODE_TRANSPORT is not set
-# CONFIG_INET6_XFRM_MODE_TUNNEL is not set
-# CONFIG_INET6_XFRM_MODE_BEET is not set
-# CONFIG_IPV6_SIT is not set
-CONFIG_MTD=y
-CONFIG_MTD_REDBOOT_PARTS=y
-CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED=y
-CONFIG_MTD_REDBOOT_PARTS_READONLY=y
-CONFIG_MTD_BLOCK=y
-CONFIG_MTD_CFI=y
-CONFIG_MTD_CFI_INTELEXT=y
-CONFIG_MTD_PHYSMAP=y
-CONFIG_BLK_DEV_LOOP=y
-CONFIG_BLK_DEV_NBD=y
-CONFIG_BLK_DEV_RAM=y
-CONFIG_BLK_DEV_RAM_SIZE=8192
-CONFIG_BLK_DEV_SD=y
-CONFIG_CHR_DEV_SG=y
-# CONFIG_BLK_DEV_BSG is not set
-CONFIG_ATA=y
-CONFIG_SATA_SIL=y
-CONFIG_SATA_VITESSE=y
-CONFIG_MD=y
-CONFIG_BLK_DEV_MD=y
-CONFIG_MD_RAID0=y
-CONFIG_MD_RAID1=y
-CONFIG_MD_RAID10=y
-CONFIG_MD_RAID456=y
-CONFIG_BLK_DEV_DM=y
-CONFIG_NETDEVICES=y
-CONFIG_NET_ETHERNET=y
-CONFIG_NET_PCI=y
-CONFIG_E100=y
-CONFIG_E1000=y
-CONFIG_R8169=y
-# CONFIG_INPUT_MOUSEDEV_PSAUX is not set
-# CONFIG_INPUT_KEYBOARD is not set
-# CONFIG_INPUT_MOUSE is not set
-# CONFIG_SERIO is not set
-CONFIG_SERIAL_8250=y
-CONFIG_SERIAL_8250_CONSOLE=y
-CONFIG_HW_RANDOM=y
-CONFIG_I2C=y
-CONFIG_I2C_CHARDEV=y
-CONFIG_I2C_IOP3XX=y
-# CONFIG_VGA_CONSOLE is not set
-# CONFIG_USB_HID is not set
-CONFIG_USB=y
-CONFIG_USB_MON=y
-CONFIG_USB_EHCI_HCD=y
-CONFIG_USB_EHCI_ROOT_HUB_TT=y
-CONFIG_USB_EHCI_TT_NEWSCHED=y
-CONFIG_USB_UHCI_HCD=y
-CONFIG_USB_STORAGE=y
-CONFIG_RTC_CLASS=y
-CONFIG_RTC_DRV_RS5C372=y
-CONFIG_DMADEVICES=y
-CONFIG_INTEL_IOP_ADMA=y
-CONFIG_NET_DMA=y
-CONFIG_EXT2_FS=y
-CONFIG_EXT3_FS=y
-CONFIG_TMPFS=y
-CONFIG_ECRYPT_FS=y
-CONFIG_JFFS2_FS=y
-CONFIG_CRAMFS=y
-CONFIG_NFS_FS=y
-CONFIG_NFS_V3=y
-CONFIG_ROOT_NFS=y
-CONFIG_NFSD=y
-CONFIG_KEYS=y
-CONFIG_CRYPTO_NULL=y
-CONFIG_CRYPTO_LRW=y
-CONFIG_CRYPTO_PCBC=m
-CONFIG_CRYPTO_HMAC=y
-CONFIG_CRYPTO_XCBC=y
-CONFIG_CRYPTO_MD4=y
-CONFIG_CRYPTO_MICHAEL_MIC=y
-CONFIG_CRYPTO_SHA1=y
-CONFIG_CRYPTO_SHA256=y
-CONFIG_CRYPTO_SHA512=y
-CONFIG_CRYPTO_TGR192=y
-CONFIG_CRYPTO_WP512=y
-CONFIG_CRYPTO_AES=y
-CONFIG_CRYPTO_ANUBIS=y
-CONFIG_CRYPTO_ARC4=y
-CONFIG_CRYPTO_BLOWFISH=y
-CONFIG_CRYPTO_CAST5=y
-CONFIG_CRYPTO_CAST6=y
-CONFIG_CRYPTO_DES=y
-CONFIG_CRYPTO_KHAZAD=y
-CONFIG_CRYPTO_SERPENT=y
-CONFIG_CRYPTO_TEA=y
-CONFIG_CRYPTO_TWOFISH=y
-CONFIG_CRYPTO_DEFLATE=y
-CONFIG_LIBCRC32C=y
-CONFIG_DEBUG_KERNEL=y
-CONFIG_MAGIC_SYSRQ=y
-CONFIG_DEBUG_USER=y
-CONFIG_DEBUG_LL=y
-CONFIG_DEBUG_LL_UART_8250=y
diff --git a/arch/arm/kernel/entry-common.S b/arch/arm/kernel/entry-common.S
index 405a607b754f..03d4c5578c5c 100644
--- a/arch/arm/kernel/entry-common.S
+++ b/arch/arm/kernel/entry-common.S
@@ -16,15 +16,6 @@
 
 	.equ	NR_syscalls, __NR_syscalls
 
-	.macro  arch_ret_to_user, tmp
-#ifdef CONFIG_ARCH_IOP32X
-	mrc	p15, 0, \tmp, c15, c1, 0
-	tst	\tmp, #(1 << 6)
-	bicne	\tmp, \tmp, #(1 << 6)
-	mcrne	p15, 0, \tmp, c15, c1, 0	@ Disable cp6 access
-#endif
-	.endm
-
 #include "entry-header.S"
 
 saved_psr	.req	r8
@@ -55,10 +46,6 @@ __ret_fast_syscall:
 	movs	r1, r1, lsl #16
 	bne	fast_work_pending
 
-
-	/* perform architecture specific actions before user return */
-	arch_ret_to_user r1
-
 	restore_user_regs fast = 1, offset = S_OFF
  UNWIND(.fnend		)
 ENDPROC(ret_fast_syscall)
@@ -129,8 +116,6 @@ ENTRY(ret_to_user_from_irq)
 no_work_pending:
 	asm_trace_hardirqs_on save = 0
 
-	/* perform architecture specific actions before user return */
-	arch_ret_to_user r1
 	ct_user_enter save = 0
 
 	restore_user_regs fast = 0, offset = 0
diff --git a/arch/arm/mach-iop32x/Kconfig b/arch/arm/mach-iop32x/Kconfig
deleted file mode 100644
index 761fbb04faa1..000000000000
--- a/arch/arm/mach-iop32x/Kconfig
+++ /dev/null
@@ -1,54 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-menuconfig ARCH_IOP32X
-	bool "IOP32x-based platforms"
-	depends on ARCH_MULTI_V5
-	depends on CPU_LITTLE_ENDIAN
-	depends on ATAGS && UNUSED_BOARD_FILES
-	select CPU_XSCALE
-	select GPIO_IOP
-	select GPIOLIB
-	select FORCE_PCI
-	help
-	  Support for Intel's 80219 and IOP32X (XScale) family of
-	  processors.
-
-if ARCH_IOP32X
-
-config MACH_EP80219
-	bool
-
-config MACH_GLANTANK
-	bool "Enable support for the IO-Data GLAN Tank"
-	help
-	  Say Y here if you want to run your kernel on the GLAN Tank
-	  NAS appliance or machines from IO-Data's HDL-Gxxx, HDL-GWxxx
-	  and HDL-GZxxx series.
-
-config ARCH_IQ80321
-	bool "Enable support for IQ80321"
-	help
-	  Say Y here if you want to run your kernel on the Intel IQ80321
-	  evaluation kit for the IOP321 processor.
-
-config ARCH_IQ31244
-	bool "Enable support for EP80219/IQ31244"
-	select MACH_EP80219
-	help
-	  Say Y here if you want to run your kernel on the Intel EP80219
-	  evaluation kit for the Intel 80219 processor (a IOP321 variant)
-	  or the IQ31244 evaluation kit for the IOP321 processor.
-
-config MACH_N2100
-	bool "Enable support for the Thecus n2100"
-	help
-	  Say Y here if you want to run your kernel on the Thecus n2100
-	  NAS appliance.
-
-config MACH_EM7210
-	bool "Enable support for the Lanner EM7210"
-	help
-	  Say Y here if you want to run your kernel on the Lanner EM7210
-	  board. Say also Y here if you have a SS4000e Baxter Creek NAS
-	  appliance."
-
-endif
diff --git a/arch/arm/mach-iop32x/Makefile b/arch/arm/mach-iop32x/Makefile
deleted file mode 100644
index c8018ef5c6a9..000000000000
--- a/arch/arm/mach-iop32x/Makefile
+++ /dev/null
@@ -1,20 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-#
-# Makefile for the linux kernel.
-#
-
-obj-$(CONFIG_ARCH_IOP32X) += irq.o
-obj-$(CONFIG_ARCH_IOP32X) += i2c.o
-obj-$(CONFIG_ARCH_IOP32X) += pci.o
-obj-$(CONFIG_ARCH_IOP32X) += setup.o
-obj-$(CONFIG_ARCH_IOP32X) += time.o
-obj-$(CONFIG_ARCH_IOP32X) += cp6.o
-obj-$(CONFIG_ARCH_IOP32X) += adma.o
-obj-$(CONFIG_ARCH_IOP32X) += pmu.o
-obj-$(CONFIG_ARCH_IOP32X) += restart.o
-
-obj-$(CONFIG_MACH_GLANTANK) += glantank.o
-obj-$(CONFIG_ARCH_IQ80321) += iq80321.o
-obj-$(CONFIG_ARCH_IQ31244) += iq31244.o
-obj-$(CONFIG_MACH_N2100) += n2100.o
-obj-$(CONFIG_MACH_EM7210) += em7210.o
diff --git a/arch/arm/mach-iop32x/adma.c b/arch/arm/mach-iop32x/adma.c
deleted file mode 100644
index 764bcbff98df..000000000000
--- a/arch/arm/mach-iop32x/adma.c
+++ /dev/null
@@ -1,163 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * platform device definitions for the iop3xx dma/xor engines
- * Copyright © 2006, Intel Corporation.
- */
-#include <linux/platform_device.h>
-#include <linux/dma-mapping.h>
-#include <linux/platform_data/dma-iop32x.h>
-
-#include "iop3xx.h"
-#include "irqs.h"
-
-#define IRQ_DMA0_EOT IRQ_IOP32X_DMA0_EOT
-#define IRQ_DMA0_EOC IRQ_IOP32X_DMA0_EOC
-#define IRQ_DMA0_ERR IRQ_IOP32X_DMA0_ERR
-
-#define IRQ_DMA1_EOT IRQ_IOP32X_DMA1_EOT
-#define IRQ_DMA1_EOC IRQ_IOP32X_DMA1_EOC
-#define IRQ_DMA1_ERR IRQ_IOP32X_DMA1_ERR
-
-#define IRQ_AA_EOT IRQ_IOP32X_AA_EOT
-#define IRQ_AA_EOC IRQ_IOP32X_AA_EOC
-#define IRQ_AA_ERR IRQ_IOP32X_AA_ERR
-
-/* AAU and DMA Channels */
-static struct resource iop3xx_dma_0_resources[] = {
-	[0] = {
-		.start = IOP3XX_DMA_PHYS_BASE(0),
-		.end = IOP3XX_DMA_UPPER_PA(0),
-		.flags = IORESOURCE_MEM,
-	},
-	[1] = {
-		.start = IRQ_DMA0_EOT,
-		.end = IRQ_DMA0_EOT,
-		.flags = IORESOURCE_IRQ
-	},
-	[2] = {
-		.start = IRQ_DMA0_EOC,
-		.end = IRQ_DMA0_EOC,
-		.flags = IORESOURCE_IRQ
-	},
-	[3] = {
-		.start = IRQ_DMA0_ERR,
-		.end = IRQ_DMA0_ERR,
-		.flags = IORESOURCE_IRQ
-	}
-};
-
-static struct resource iop3xx_dma_1_resources[] = {
-	[0] = {
-		.start = IOP3XX_DMA_PHYS_BASE(1),
-		.end = IOP3XX_DMA_UPPER_PA(1),
-		.flags = IORESOURCE_MEM,
-	},
-	[1] = {
-		.start = IRQ_DMA1_EOT,
-		.end = IRQ_DMA1_EOT,
-		.flags = IORESOURCE_IRQ
-	},
-	[2] = {
-		.start = IRQ_DMA1_EOC,
-		.end = IRQ_DMA1_EOC,
-		.flags = IORESOURCE_IRQ
-	},
-	[3] = {
-		.start = IRQ_DMA1_ERR,
-		.end = IRQ_DMA1_ERR,
-		.flags = IORESOURCE_IRQ
-	}
-};
-
-
-static struct resource iop3xx_aau_resources[] = {
-	[0] = {
-		.start = IOP3XX_AAU_PHYS_BASE,
-		.end = IOP3XX_AAU_UPPER_PA,
-		.flags = IORESOURCE_MEM,
-	},
-	[1] = {
-		.start = IRQ_AA_EOT,
-		.end = IRQ_AA_EOT,
-		.flags = IORESOURCE_IRQ
-	},
-	[2] = {
-		.start = IRQ_AA_EOC,
-		.end = IRQ_AA_EOC,
-		.flags = IORESOURCE_IRQ
-	},
-	[3] = {
-		.start = IRQ_AA_ERR,
-		.end = IRQ_AA_ERR,
-		.flags = IORESOURCE_IRQ
-	}
-};
-
-static u64 iop3xx_adma_dmamask = DMA_BIT_MASK(32);
-
-static struct iop_adma_platform_data iop3xx_dma_0_data = {
-	.hw_id = DMA0_ID,
-	.pool_size = PAGE_SIZE,
-};
-
-static struct iop_adma_platform_data iop3xx_dma_1_data = {
-	.hw_id = DMA1_ID,
-	.pool_size = PAGE_SIZE,
-};
-
-static struct iop_adma_platform_data iop3xx_aau_data = {
-	.hw_id = AAU_ID,
-	.pool_size = 3 * PAGE_SIZE,
-};
-
-struct platform_device iop3xx_dma_0_channel = {
-	.name = "iop-adma",
-	.id = 0,
-	.num_resources = 4,
-	.resource = iop3xx_dma_0_resources,
-	.dev = {
-		.dma_mask = &iop3xx_adma_dmamask,
-		.coherent_dma_mask = DMA_BIT_MASK(32),
-		.platform_data = (void *) &iop3xx_dma_0_data,
-	},
-};
-
-struct platform_device iop3xx_dma_1_channel = {
-	.name = "iop-adma",
-	.id = 1,
-	.num_resources = 4,
-	.resource = iop3xx_dma_1_resources,
-	.dev = {
-		.dma_mask = &iop3xx_adma_dmamask,
-		.coherent_dma_mask = DMA_BIT_MASK(32),
-		.platform_data = (void *) &iop3xx_dma_1_data,
-	},
-};
-
-struct platform_device iop3xx_aau_channel = {
-	.name = "iop-adma",
-	.id = 2,
-	.num_resources = 4,
-	.resource = iop3xx_aau_resources,
-	.dev = {
-		.dma_mask = &iop3xx_adma_dmamask,
-		.coherent_dma_mask = DMA_BIT_MASK(32),
-		.platform_data = (void *) &iop3xx_aau_data,
-	},
-};
-
-static int __init iop3xx_adma_cap_init(void)
-{
-	dma_cap_set(DMA_MEMCPY, iop3xx_dma_0_data.cap_mask);
-	dma_cap_set(DMA_INTERRUPT, iop3xx_dma_0_data.cap_mask);
-
-	dma_cap_set(DMA_MEMCPY, iop3xx_dma_1_data.cap_mask);
-	dma_cap_set(DMA_INTERRUPT, iop3xx_dma_1_data.cap_mask);
-
-	dma_cap_set(DMA_XOR, iop3xx_aau_data.cap_mask);
-	dma_cap_set(DMA_INTERRUPT, iop3xx_aau_data.cap_mask);
-
-	return 0;
-}
-
-arch_initcall(iop3xx_adma_cap_init);
diff --git a/arch/arm/mach-iop32x/cp6.c b/arch/arm/mach-iop32x/cp6.c
deleted file mode 100644
index 7135a0ac9949..000000000000
--- a/arch/arm/mach-iop32x/cp6.c
+++ /dev/null
@@ -1,48 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * IOP Coprocessor-6 access handler
- * Copyright (c) 2006, Intel Corporation.
- */
-#include <linux/init.h>
-#include <asm/traps.h>
-#include <asm/ptrace.h>
-
-#include "iop3xx.h"
-
-void iop_enable_cp6(void)
-{
-	u32 temp;
-
-        /* enable cp6 access */
-        asm volatile (
-		"mrc	p15, 0, %0, c15, c1, 0\n\t"
-		"orr	%0, %0, #(1 << 6)\n\t"
-		"mcr	p15, 0, %0, c15, c1, 0\n\t"
-		"mrc	p15, 0, %0, c15, c1, 0\n\t"
-		"mov	%0, %0\n\t"
-		"sub	pc, pc, #4  @ cp_wait\n\t"
-		: "=r"(temp));
-}
-
-static int cp6_trap(struct pt_regs *regs, unsigned int instr)
-{
-	iop_enable_cp6();
-
-	return 0;
-}
-
-/* permit kernel space cp6 access
- * deny user space cp6 access
- */
-static struct undef_hook cp6_hook = {
-	.instr_mask     = 0x0f000ff0,
-	.instr_val      = 0x0e000610,
-	.cpsr_mask      = MODE_MASK,
-	.cpsr_val       = SVC_MODE,
-	.fn             = cp6_trap,
-};
-
-void __init iop_init_cp6_handler(void)
-{
-	register_undef_hook(&cp6_hook);
-}
diff --git a/arch/arm/mach-iop32x/em7210.c b/arch/arm/mach-iop32x/em7210.c
deleted file mode 100644
index ac130aba5a6e..000000000000
--- a/arch/arm/mach-iop32x/em7210.c
+++ /dev/null
@@ -1,232 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * arch/arm/mach-iop32x/em7210.c
- *
- * Board support code for the Lanner EM7210 platforms.
- *
- * Based on arch/arm/mach-iop32x/iq31244.c file.
- *
- * Copyright (C) 2007 Arnaud Patard <arnaud.patard@rtp-net.org>
- */
-
-#include <linux/mm.h>
-#include <linux/init.h>
-#include <linux/kernel.h>
-#include <linux/pci.h>
-#include <linux/pm.h>
-#include <linux/serial_core.h>
-#include <linux/serial_8250.h>
-#include <linux/mtd/physmap.h>
-#include <linux/platform_device.h>
-#include <linux/i2c.h>
-#include <linux/gpio.h>
-#include <linux/gpio/machine.h>
-#include <linux/io.h>
-#include <linux/irq.h>
-#include <asm/mach/arch.h>
-#include <asm/mach/map.h>
-#include <asm/mach/pci.h>
-#include <asm/mach/time.h>
-#include <asm/mach-types.h>
-
-#include "hardware.h"
-#include "gpio-iop32x.h"
-#include "irqs.h"
-
-static void __init em7210_timer_init(void)
-{
-	/* http://www.kwaak.net/fotos/fotos-nas/slide_24.html */
-	/* 33.333 MHz crystal.                                */
-	iop_init_time(200000000);
-}
-
-/*
- * EM7210 RTC
- */
-static struct i2c_board_info __initdata em7210_i2c_devices[] = {
-	{
-		I2C_BOARD_INFO("rs5c372a", 0x32),
-	},
-};
-
-/*
- * EM7210 I/O
- */
-static struct map_desc em7210_io_desc[] __initdata = {
-	{	/* on-board devices */
-		.virtual	= IQ31244_UART,
-		.pfn		= __phys_to_pfn(IQ31244_UART),
-		.length		= 0x00100000,
-		.type		= MT_DEVICE,
-	},
-};
-
-void __init em7210_map_io(void)
-{
-	iop3xx_map_io();
-	iotable_init(em7210_io_desc, ARRAY_SIZE(em7210_io_desc));
-}
-
-
-/*
- * EM7210 PCI
- */
-#define INTA	IRQ_IOP32X_XINT0
-#define INTB	IRQ_IOP32X_XINT1
-#define INTC	IRQ_IOP32X_XINT2
-#define INTD	IRQ_IOP32X_XINT3
-
-static int __init
-em7210_pci_map_irq(const struct pci_dev *dev, u8 slot, u8 pin)
-{
-	static int pci_irq_table[][4] = {
-		/*
-		 * PCI IDSEL/INTPIN->INTLINE
-		 * A       B       C       D
-		 */
-		{INTB, INTB, INTB, INTB}, /* console / uart */
-		{INTA, INTA, INTA, INTA}, /* 1st 82541      */
-		{INTD, INTD, INTD, INTD}, /* 2nd 82541      */
-		{INTC, INTC, INTC, INTC}, /* GD31244        */
-		{INTD, INTA, INTA, INTA}, /* mini-PCI       */
-		{INTD, INTC, INTA, INTA}, /* NEC USB        */
-	};
-
-	if (pin < 1 || pin > 4)
-		return -1;
-
-	return pci_irq_table[slot % 6][pin - 1];
-}
-
-static struct hw_pci em7210_pci __initdata = {
-	.nr_controllers = 1,
-	.ops		= &iop3xx_ops,
-	.setup		= iop3xx_pci_setup,
-	.preinit	= iop3xx_pci_preinit,
-	.map_irq	= em7210_pci_map_irq,
-};
-
-static int __init em7210_pci_init(void)
-{
-	if (machine_is_em7210())
-		pci_common_init(&em7210_pci);
-
-	return 0;
-}
-
-subsys_initcall(em7210_pci_init);
-
-
-/*
- * EM7210 Flash
- */
-static struct physmap_flash_data em7210_flash_data = {
-	.width		= 2,
-};
-
-static struct resource em7210_flash_resource = {
-	.start		= 0xf0000000,
-	.end		= 0xf1ffffff,
-	.flags		= IORESOURCE_MEM,
-};
-
-static struct platform_device em7210_flash_device = {
-	.name		= "physmap-flash",
-	.id		= 0,
-	.dev		= {
-		.platform_data	= &em7210_flash_data,
-	},
-	.num_resources	= 1,
-	.resource	= &em7210_flash_resource,
-};
-
-
-/*
- * EM7210 UART
- * The physical address of the serial port is 0xfe800000,
- * so it can be used for physical and virtual address.
- */
-static struct plat_serial8250_port em7210_serial_port[] = {
-	{
-		.mapbase	= IQ31244_UART,
-		.membase	= (char *)IQ31244_UART,
-		.irq		= IRQ_IOP32X_XINT1,
-		.flags		= UPF_SKIP_TEST,
-		.iotype		= UPIO_MEM,
-		.regshift	= 0,
-		.uartclk	= 1843200,
-	},
-	{ },
-};
-
-static struct resource em7210_uart_resource = {
-	.start		= IQ31244_UART,
-	.end		= IQ31244_UART + 7,
-	.flags		= IORESOURCE_MEM,
-};
-
-static struct platform_device em7210_serial_device = {
-	.name		= "serial8250",
-	.id		= PLAT8250_DEV_PLATFORM,
-	.dev		= {
-		.platform_data		= em7210_serial_port,
-	},
-	.num_resources	= 1,
-	.resource	= &em7210_uart_resource,
-};
-
-#define EM7210_HARDWARE_POWER 0
-
-void em7210_power_off(void)
-{
-	int ret;
-
-	ret = gpio_direction_output(EM7210_HARDWARE_POWER, 1);
-	if (ret)
-		pr_crit("could not drive power off GPIO high\n");
-}
-
-static int __init em7210_request_gpios(void)
-{
-	int ret;
-
-	if (!machine_is_em7210())
-		return 0;
-
-	ret = gpio_request(EM7210_HARDWARE_POWER, "power");
-	if (ret) {
-		pr_err("could not request power off GPIO\n");
-		return 0;
-	}
-
-	pm_power_off = em7210_power_off;
-
-	return 0;
-}
-device_initcall(em7210_request_gpios);
-
-static void __init em7210_init_machine(void)
-{
-	register_iop32x_gpio();
-	platform_device_register(&em7210_serial_device);
-	gpiod_add_lookup_table(&iop3xx_i2c0_gpio_lookup);
-	gpiod_add_lookup_table(&iop3xx_i2c1_gpio_lookup);
-	platform_device_register(&iop3xx_i2c0_device);
-	platform_device_register(&iop3xx_i2c1_device);
-	platform_device_register(&em7210_flash_device);
-	platform_device_register(&iop3xx_dma_0_channel);
-	platform_device_register(&iop3xx_dma_1_channel);
-
-	i2c_register_board_info(0, em7210_i2c_devices,
-		ARRAY_SIZE(em7210_i2c_devices));
-}
-
-MACHINE_START(EM7210, "Lanner EM7210")
-	.atag_offset	= 0x100,
-	.nr_irqs	= IOP32X_NR_IRQS,
-	.map_io		= em7210_map_io,
-	.init_irq	= iop32x_init_irq,
-	.init_time	= em7210_timer_init,
-	.init_machine	= em7210_init_machine,
-	.restart	= iop3xx_restart,
-MACHINE_END
diff --git a/arch/arm/mach-iop32x/glantank.c b/arch/arm/mach-iop32x/glantank.c
deleted file mode 100644
index cd6e7da2ea10..000000000000
--- a/arch/arm/mach-iop32x/glantank.c
+++ /dev/null
@@ -1,214 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * arch/arm/mach-iop32x/glantank.c
- *
- * Board support code for the GLAN Tank.
- *
- * Copyright (C) 2006, 2007 Martin Michlmayr <tbm@cyrius.com>
- * Copyright (C) 2006 Lennert Buytenhek <buytenh@wantstofly.org>
- */
-
-#include <linux/mm.h>
-#include <linux/init.h>
-#include <linux/f75375s.h>
-#include <linux/kernel.h>
-#include <linux/pci.h>
-#include <linux/pm.h>
-#include <linux/string.h>
-#include <linux/serial_core.h>
-#include <linux/serial_8250.h>
-#include <linux/mtd/physmap.h>
-#include <linux/i2c.h>
-#include <linux/platform_device.h>
-#include <linux/io.h>
-#include <linux/gpio/machine.h>
-#include <asm/irq.h>
-#include <asm/mach/arch.h>
-#include <asm/mach/map.h>
-#include <asm/mach/pci.h>
-#include <asm/mach/time.h>
-#include <asm/mach-types.h>
-#include <asm/page.h>
-
-#include "hardware.h"
-#include "gpio-iop32x.h"
-#include "irqs.h"
-
-/*
- * GLAN Tank timer tick configuration.
- */
-static void __init glantank_timer_init(void)
-{
-	/* 33.333 MHz crystal.  */
-	iop_init_time(200000000);
-}
-
-
-/*
- * GLAN Tank I/O.
- */
-static struct map_desc glantank_io_desc[] __initdata = {
-	{	/* on-board devices */
-		.virtual	= GLANTANK_UART,
-		.pfn		= __phys_to_pfn(GLANTANK_UART),
-		.length		= 0x00100000,
-		.type		= MT_DEVICE
-	},
-};
-
-void __init glantank_map_io(void)
-{
-	iop3xx_map_io();
-	iotable_init(glantank_io_desc, ARRAY_SIZE(glantank_io_desc));
-}
-
-
-/*
- * GLAN Tank PCI.
- */
-#define INTA	IRQ_IOP32X_XINT0
-#define INTB	IRQ_IOP32X_XINT1
-#define INTC	IRQ_IOP32X_XINT2
-#define INTD	IRQ_IOP32X_XINT3
-
-static int __init
-glantank_pci_map_irq(const struct pci_dev *dev, u8 slot, u8 pin)
-{
-	static int pci_irq_table[][4] = {
-		/*
-		 * PCI IDSEL/INTPIN->INTLINE
-		 * A       B       C       D
-		 */
-		{INTD, INTD, INTD, INTD}, /* UART (8250) */
-		{INTA, INTA, INTA, INTA}, /* Ethernet (E1000) */
-		{INTB, INTB, INTB, INTB}, /* IDE (AEC6280R) */
-		{INTC, INTC, INTC, INTC}, /* USB (NEC) */
-	};
-
-	BUG_ON(pin < 1 || pin > 4);
-
-	return pci_irq_table[slot % 4][pin - 1];
-}
-
-static struct hw_pci glantank_pci __initdata = {
-	.nr_controllers = 1,
-	.ops		= &iop3xx_ops,
-	.setup		= iop3xx_pci_setup,
-	.preinit	= iop3xx_pci_preinit,
-	.map_irq	= glantank_pci_map_irq,
-};
-
-static int __init glantank_pci_init(void)
-{
-	if (machine_is_glantank())
-		pci_common_init(&glantank_pci);
-
-	return 0;
-}
-
-subsys_initcall(glantank_pci_init);
-
-
-/*
- * GLAN Tank machine initialization.
- */
-static struct physmap_flash_data glantank_flash_data = {
-	.width		= 2,
-};
-
-static struct resource glantank_flash_resource = {
-	.start		= 0xf0000000,
-	.end		= 0xf007ffff,
-	.flags		= IORESOURCE_MEM,
-};
-
-static struct platform_device glantank_flash_device = {
-	.name		= "physmap-flash",
-	.id		= 0,
-	.dev		= {
-		.platform_data	= &glantank_flash_data,
-	},
-	.num_resources	= 1,
-	.resource	= &glantank_flash_resource,
-};
-
-static struct plat_serial8250_port glantank_serial_port[] = {
-	{
-		.mapbase	= GLANTANK_UART,
-		.membase	= (char *)GLANTANK_UART,
-		.irq		= IRQ_IOP32X_XINT3,
-		.flags		= UPF_SKIP_TEST,
-		.iotype		= UPIO_MEM,
-		.regshift	= 0,
-		.uartclk	= 1843200,
-	},
-	{ },
-};
-
-static struct resource glantank_uart_resource = {
-	.start		= GLANTANK_UART,
-	.end		= GLANTANK_UART + 7,
-	.flags		= IORESOURCE_MEM,
-};
-
-static struct platform_device glantank_serial_device = {
-	.name		= "serial8250",
-	.id		= PLAT8250_DEV_PLATFORM,
-	.dev		= {
-		.platform_data		= glantank_serial_port,
-	},
-	.num_resources	= 1,
-	.resource	= &glantank_uart_resource,
-};
-
-static struct f75375s_platform_data glantank_f75375s = {
-	.pwm		= { 255, 255 },
-	.pwm_enable	= { 0, 0 },
-};
-
-static struct i2c_board_info __initdata glantank_i2c_devices[] = {
-	{
-		I2C_BOARD_INFO("rs5c372a", 0x32),
-	},
-	{
-		I2C_BOARD_INFO("f75375", 0x2e),
-		.platform_data = &glantank_f75375s,
-	},
-};
-
-static void glantank_power_off(void)
-{
-	__raw_writeb(0x01, IOMEM(0xfe8d0004));
-
-	while (1)
-		;
-}
-
-static void __init glantank_init_machine(void)
-{
-	register_iop32x_gpio();
-	gpiod_add_lookup_table(&iop3xx_i2c0_gpio_lookup);
-	gpiod_add_lookup_table(&iop3xx_i2c1_gpio_lookup);
-	platform_device_register(&iop3xx_i2c0_device);
-	platform_device_register(&iop3xx_i2c1_device);
-	platform_device_register(&glantank_flash_device);
-	platform_device_register(&glantank_serial_device);
-	platform_device_register(&iop3xx_dma_0_channel);
-	platform_device_register(&iop3xx_dma_1_channel);
-
-	i2c_register_board_info(0, glantank_i2c_devices,
-		ARRAY_SIZE(glantank_i2c_devices));
-
-	pm_power_off = glantank_power_off;
-}
-
-MACHINE_START(GLANTANK, "GLAN Tank")
-	/* Maintainer: Lennert Buytenhek <buytenh@wantstofly.org> */
-	.atag_offset	= 0x100,
-	.nr_irqs	= IOP32X_NR_IRQS,
-	.map_io		= glantank_map_io,
-	.init_irq	= iop32x_init_irq,
-	.init_time	= glantank_timer_init,
-	.init_machine	= glantank_init_machine,
-	.restart	= iop3xx_restart,
-MACHINE_END
diff --git a/arch/arm/mach-iop32x/glantank.h b/arch/arm/mach-iop32x/glantank.h
deleted file mode 100644
index f38e86b82c3d..000000000000
--- a/arch/arm/mach-iop32x/glantank.h
+++ /dev/null
@@ -1,12 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * IO-Data GLAN Tank board registers
- */
-
-#ifndef __GLANTANK_H
-#define __GLANTANK_H
-
-#define GLANTANK_UART		0xfe800000	/* UART */
-
-
-#endif
diff --git a/arch/arm/mach-iop32x/gpio-iop32x.h b/arch/arm/mach-iop32x/gpio-iop32x.h
deleted file mode 100644
index 20af87e4c5e8..000000000000
--- a/arch/arm/mach-iop32x/gpio-iop32x.h
+++ /dev/null
@@ -1,11 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-static struct resource iop32x_gpio_res[] = {
-	DEFINE_RES_MEM((IOP3XX_PERIPHERAL_PHYS_BASE + 0x07c4), 0x10),
-};
-
-static inline void register_iop32x_gpio(void)
-{
-	platform_device_register_simple("gpio-iop", 0,
-					iop32x_gpio_res,
-					ARRAY_SIZE(iop32x_gpio_res));
-}
diff --git a/arch/arm/mach-iop32x/hardware.h b/arch/arm/mach-iop32x/hardware.h
deleted file mode 100644
index 43ab4fb8f9b0..000000000000
--- a/arch/arm/mach-iop32x/hardware.h
+++ /dev/null
@@ -1,38 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __HARDWARE_H
-#define __HARDWARE_H
-
-#include <asm/types.h>
-
-/*
- * Note about PCI IO space mappings
- *
- * To make IO space accesses efficient, we store virtual addresses in
- * the IO resources.
- *
- * The PCI IO space is located at virtual 0xfe000000 from physical
- * 0x90000000. The PCI BARs must be programmed with physical addresses,
- * but when we read them, we convert them to virtual addresses. See
- * arch/arm/plat-iop/pci.c.
- */
-
-#ifndef __ASSEMBLY__
-void iop32x_init_irq(void);
-#endif
-
-
-/*
- * Generic chipset bits
- */
-#include "iop3xx.h"
-
-/*
- * Board specific bits
- */
-#include "glantank.h"
-#include "iq80321.h"
-#include "iq31244.h"
-#include "n2100.h"
-
-
-#endif
diff --git a/arch/arm/mach-iop32x/i2c.c b/arch/arm/mach-iop32x/i2c.c
deleted file mode 100644
index e422286af469..000000000000
--- a/arch/arm/mach-iop32x/i2c.c
+++ /dev/null
@@ -1,92 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * arch/arm/plat-iop/i2c.c
- *
- * Author: Nicolas Pitre <nico@cam.org>
- * Copyright (C) 2001 MontaVista Software, Inc.
- * Copyright (C) 2004 Intel Corporation.
- */
-
-#include <linux/mm.h>
-#include <linux/init.h>
-#include <linux/major.h>
-#include <linux/fs.h>
-#include <linux/platform_device.h>
-#include <linux/serial.h>
-#include <linux/tty.h>
-#include <linux/serial_core.h>
-#include <linux/io.h>
-#include <linux/gpio/machine.h>
-#include <asm/page.h>
-#include <asm/mach/map.h>
-#include <asm/setup.h>
-#include <asm/memory.h>
-#include <asm/mach/arch.h>
-
-#include "hardware.h"
-#include "iop3xx.h"
-#include "irqs.h"
-
-/*
- * Each of the I2C busses have corresponding GPIO lines, and the driver
- * need to access these directly to drive the bus low at times.
- */
-
-struct gpiod_lookup_table iop3xx_i2c0_gpio_lookup = {
-	.dev_id = "IOP3xx-I2C.0",
-	.table = {
-		GPIO_LOOKUP("gpio-iop", 7, "scl", GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP("gpio-iop", 6, "sda", GPIO_ACTIVE_HIGH),
-		{ }
-	},
-};
-
-struct gpiod_lookup_table iop3xx_i2c1_gpio_lookup = {
-	.dev_id = "IOP3xx-I2C.1",
-	.table = {
-		GPIO_LOOKUP("gpio-iop", 5, "scl", GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP("gpio-iop", 4, "sda", GPIO_ACTIVE_HIGH),
-		{ }
-	},
-};
-
-static struct resource iop3xx_i2c0_resources[] = {
-	[0] = {
-		.start	= 0xfffff680,
-		.end	= 0xfffff697,
-		.flags	= IORESOURCE_MEM,
-	},
-	[1] = {
-		.start	= IRQ_IOP32X_I2C_0,
-		.end	= IRQ_IOP32X_I2C_0,
-		.flags	= IORESOURCE_IRQ,
-	},
-};
-
-struct platform_device iop3xx_i2c0_device = {
-	.name		= "IOP3xx-I2C",
-	.id		= 0,
-	.num_resources	= 2,
-	.resource	= iop3xx_i2c0_resources,
-};
-
-
-static struct resource iop3xx_i2c1_resources[] = {
-	[0] = {
-		.start	= 0xfffff6a0,
-		.end	= 0xfffff6b7,
-		.flags	= IORESOURCE_MEM,
-	},
-	[1] = {
-		.start	= IRQ_IOP32X_I2C_1,
-		.end	= IRQ_IOP32X_I2C_1,
-		.flags	= IORESOURCE_IRQ,
-	}
-};
-
-struct platform_device iop3xx_i2c1_device = {
-	.name		= "IOP3xx-I2C",
-	.id		= 1,
-	.num_resources	= 2,
-	.resource	= iop3xx_i2c1_resources,
-};
diff --git a/arch/arm/mach-iop32x/iop3xx.h b/arch/arm/mach-iop32x/iop3xx.h
deleted file mode 100644
index a6ec7ebadb35..000000000000
--- a/arch/arm/mach-iop32x/iop3xx.h
+++ /dev/null
@@ -1,326 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Intel IOP32X and IOP33X register definitions
- *
- * Author: Rory Bolt <rorybolt@pacbell.net>
- * Copyright (C) 2002 Rory Bolt
- * Copyright (C) 2004 Intel Corp.
- */
-
-#ifndef __IOP3XX_H
-#define __IOP3XX_H
-
-/*
- * Peripherals that are shared between the iop32x and iop33x but
- * located at different addresses.
- */
-#define IOP3XX_TIMER_REG(reg)	(IOP3XX_PERIPHERAL_VIRT_BASE + 0x07e0 + (reg))
-
-#include "iop3xx.h"
-
-/* ATU Parameters
- * set up a 1:1 bus to physical ram relationship
- * w/ physical ram on top of pci in the memory map
- */
-#define IOP32X_MAX_RAM_SIZE            0x40000000UL
-#define IOP3XX_MAX_RAM_SIZE            IOP32X_MAX_RAM_SIZE
-#define IOP3XX_PCI_LOWER_MEM_BA        0x80000000
-
-/*
- * IOP3XX GPIO handling
- */
-#define IOP3XX_GPIO_LINE(x)	(x)
-
-#ifndef __ASSEMBLY__
-extern int init_atu;
-extern int iop3xx_get_init_atu(void);
-#endif
-
-
-/*
- * IOP3XX processor registers
- */
-#define IOP3XX_PERIPHERAL_PHYS_BASE	0xffffe000
-#define IOP3XX_PERIPHERAL_VIRT_BASE	0xfedfe000
-#define IOP3XX_PERIPHERAL_SIZE		0x00002000
-#define IOP3XX_PERIPHERAL_UPPER_PA (IOP3XX_PERIPHERAL_PHYS_BASE +\
-					IOP3XX_PERIPHERAL_SIZE - 1)
-#define IOP3XX_PERIPHERAL_UPPER_VA (IOP3XX_PERIPHERAL_VIRT_BASE +\
-					IOP3XX_PERIPHERAL_SIZE - 1)
-#define IOP3XX_PMMR_PHYS_TO_VIRT(addr) (u32) ((u32) (addr) -\
-					(IOP3XX_PERIPHERAL_PHYS_BASE\
-					- IOP3XX_PERIPHERAL_VIRT_BASE))
-#define IOP3XX_REG_ADDR(reg)		(IOP3XX_PERIPHERAL_VIRT_BASE + (reg))
-
-/* Address Translation Unit  */
-#define IOP3XX_ATUVID		(volatile u16 *)IOP3XX_REG_ADDR(0x0100)
-#define IOP3XX_ATUDID		(volatile u16 *)IOP3XX_REG_ADDR(0x0102)
-#define IOP3XX_ATUCMD		(volatile u16 *)IOP3XX_REG_ADDR(0x0104)
-#define IOP3XX_ATUSR		(volatile u16 *)IOP3XX_REG_ADDR(0x0106)
-#define IOP3XX_ATURID		(volatile u8  *)IOP3XX_REG_ADDR(0x0108)
-#define IOP3XX_ATUCCR		(volatile u32 *)IOP3XX_REG_ADDR(0x0109)
-#define IOP3XX_ATUCLSR		(volatile u8  *)IOP3XX_REG_ADDR(0x010c)
-#define IOP3XX_ATULT		(volatile u8  *)IOP3XX_REG_ADDR(0x010d)
-#define IOP3XX_ATUHTR		(volatile u8  *)IOP3XX_REG_ADDR(0x010e)
-#define IOP3XX_ATUBIST		(volatile u8  *)IOP3XX_REG_ADDR(0x010f)
-#define IOP3XX_IABAR0		(volatile u32 *)IOP3XX_REG_ADDR(0x0110)
-#define IOP3XX_IAUBAR0		(volatile u32 *)IOP3XX_REG_ADDR(0x0114)
-#define IOP3XX_IABAR1		(volatile u32 *)IOP3XX_REG_ADDR(0x0118)
-#define IOP3XX_IAUBAR1		(volatile u32 *)IOP3XX_REG_ADDR(0x011c)
-#define IOP3XX_IABAR2		(volatile u32 *)IOP3XX_REG_ADDR(0x0120)
-#define IOP3XX_IAUBAR2		(volatile u32 *)IOP3XX_REG_ADDR(0x0124)
-#define IOP3XX_ASVIR		(volatile u16 *)IOP3XX_REG_ADDR(0x012c)
-#define IOP3XX_ASIR		(volatile u16 *)IOP3XX_REG_ADDR(0x012e)
-#define IOP3XX_ERBAR		(volatile u32 *)IOP3XX_REG_ADDR(0x0130)
-#define IOP3XX_ATUILR		(volatile u8  *)IOP3XX_REG_ADDR(0x013c)
-#define IOP3XX_ATUIPR		(volatile u8  *)IOP3XX_REG_ADDR(0x013d)
-#define IOP3XX_ATUMGNT		(volatile u8  *)IOP3XX_REG_ADDR(0x013e)
-#define IOP3XX_ATUMLAT		(volatile u8  *)IOP3XX_REG_ADDR(0x013f)
-#define IOP3XX_IALR0		(volatile u32 *)IOP3XX_REG_ADDR(0x0140)
-#define IOP3XX_IATVR0		(volatile u32 *)IOP3XX_REG_ADDR(0x0144)
-#define IOP3XX_ERLR		(volatile u32 *)IOP3XX_REG_ADDR(0x0148)
-#define IOP3XX_ERTVR		(volatile u32 *)IOP3XX_REG_ADDR(0x014c)
-#define IOP3XX_IALR1		(volatile u32 *)IOP3XX_REG_ADDR(0x0150)
-#define IOP3XX_IALR2		(volatile u32 *)IOP3XX_REG_ADDR(0x0154)
-#define IOP3XX_IATVR2		(volatile u32 *)IOP3XX_REG_ADDR(0x0158)
-#define IOP3XX_OIOWTVR		(volatile u32 *)IOP3XX_REG_ADDR(0x015c)
-#define IOP3XX_OMWTVR0		(volatile u32 *)IOP3XX_REG_ADDR(0x0160)
-#define IOP3XX_OUMWTVR0		(volatile u32 *)IOP3XX_REG_ADDR(0x0164)
-#define IOP3XX_OMWTVR1		(volatile u32 *)IOP3XX_REG_ADDR(0x0168)
-#define IOP3XX_OUMWTVR1		(volatile u32 *)IOP3XX_REG_ADDR(0x016c)
-#define IOP3XX_OUDWTVR		(volatile u32 *)IOP3XX_REG_ADDR(0x0178)
-#define IOP3XX_ATUCR		(volatile u32 *)IOP3XX_REG_ADDR(0x0180)
-#define IOP3XX_PCSR		(volatile u32 *)IOP3XX_REG_ADDR(0x0184)
-#define IOP3XX_ATUISR		(volatile u32 *)IOP3XX_REG_ADDR(0x0188)
-#define IOP3XX_ATUIMR		(volatile u32 *)IOP3XX_REG_ADDR(0x018c)
-#define IOP3XX_IABAR3		(volatile u32 *)IOP3XX_REG_ADDR(0x0190)
-#define IOP3XX_IAUBAR3		(volatile u32 *)IOP3XX_REG_ADDR(0x0194)
-#define IOP3XX_IALR3		(volatile u32 *)IOP3XX_REG_ADDR(0x0198)
-#define IOP3XX_IATVR3		(volatile u32 *)IOP3XX_REG_ADDR(0x019c)
-#define IOP3XX_OCCAR		(volatile u32 *)IOP3XX_REG_ADDR(0x01a4)
-#define IOP3XX_OCCDR		(volatile u32 *)IOP3XX_REG_ADDR(0x01ac)
-#define IOP3XX_PDSCR		(volatile u32 *)IOP3XX_REG_ADDR(0x01bc)
-#define IOP3XX_PMCAPID		(volatile u8  *)IOP3XX_REG_ADDR(0x01c0)
-#define IOP3XX_PMNEXT		(volatile u8  *)IOP3XX_REG_ADDR(0x01c1)
-#define IOP3XX_APMCR		(volatile u16 *)IOP3XX_REG_ADDR(0x01c2)
-#define IOP3XX_APMCSR		(volatile u16 *)IOP3XX_REG_ADDR(0x01c4)
-#define IOP3XX_PCIXCAPID	(volatile u8  *)IOP3XX_REG_ADDR(0x01e0)
-#define IOP3XX_PCIXNEXT		(volatile u8  *)IOP3XX_REG_ADDR(0x01e1)
-#define IOP3XX_PCIXCMD		(volatile u16 *)IOP3XX_REG_ADDR(0x01e2)
-#define IOP3XX_PCIXSR		(volatile u32 *)IOP3XX_REG_ADDR(0x01e4)
-#define IOP3XX_PCIIRSR		(volatile u32 *)IOP3XX_REG_ADDR(0x01ec)
-#define IOP3XX_PCSR_OUT_Q_BUSY (1 << 15)
-#define IOP3XX_PCSR_IN_Q_BUSY	(1 << 14)
-#define IOP3XX_ATUCR_OUT_EN	(1 << 1)
-
-#define IOP3XX_INIT_ATU_DEFAULT 0
-#define IOP3XX_INIT_ATU_DISABLE -1
-#define IOP3XX_INIT_ATU_ENABLE	 1
-
-/* Messaging Unit  */
-#define IOP3XX_IMR0		(volatile u32 *)IOP3XX_REG_ADDR(0x0310)
-#define IOP3XX_IMR1		(volatile u32 *)IOP3XX_REG_ADDR(0x0314)
-#define IOP3XX_OMR0		(volatile u32 *)IOP3XX_REG_ADDR(0x0318)
-#define IOP3XX_OMR1		(volatile u32 *)IOP3XX_REG_ADDR(0x031c)
-#define IOP3XX_IDR		(volatile u32 *)IOP3XX_REG_ADDR(0x0320)
-#define IOP3XX_IISR		(volatile u32 *)IOP3XX_REG_ADDR(0x0324)
-#define IOP3XX_IIMR		(volatile u32 *)IOP3XX_REG_ADDR(0x0328)
-#define IOP3XX_ODR		(volatile u32 *)IOP3XX_REG_ADDR(0x032c)
-#define IOP3XX_OISR		(volatile u32 *)IOP3XX_REG_ADDR(0x0330)
-#define IOP3XX_OIMR		(volatile u32 *)IOP3XX_REG_ADDR(0x0334)
-#define IOP3XX_MUCR		(volatile u32 *)IOP3XX_REG_ADDR(0x0350)
-#define IOP3XX_QBAR		(volatile u32 *)IOP3XX_REG_ADDR(0x0354)
-#define IOP3XX_IFHPR		(volatile u32 *)IOP3XX_REG_ADDR(0x0360)
-#define IOP3XX_IFTPR		(volatile u32 *)IOP3XX_REG_ADDR(0x0364)
-#define IOP3XX_IPHPR		(volatile u32 *)IOP3XX_REG_ADDR(0x0368)
-#define IOP3XX_IPTPR		(volatile u32 *)IOP3XX_REG_ADDR(0x036c)
-#define IOP3XX_OFHPR		(volatile u32 *)IOP3XX_REG_ADDR(0x0370)
-#define IOP3XX_OFTPR		(volatile u32 *)IOP3XX_REG_ADDR(0x0374)
-#define IOP3XX_OPHPR		(volatile u32 *)IOP3XX_REG_ADDR(0x0378)
-#define IOP3XX_OPTPR		(volatile u32 *)IOP3XX_REG_ADDR(0x037c)
-#define IOP3XX_IAR		(volatile u32 *)IOP3XX_REG_ADDR(0x0380)
-
-/* DMA Controller  */
-#define IOP3XX_DMA_PHYS_BASE(chan) (IOP3XX_PERIPHERAL_PHYS_BASE + \
-					(0x400 + (chan << 6)))
-#define IOP3XX_DMA_UPPER_PA(chan)  (IOP3XX_DMA_PHYS_BASE(chan) + 0x27)
-
-/* Peripheral bus interface  */
-#define IOP3XX_PBCR		(volatile u32 *)IOP3XX_REG_ADDR(0x0680)
-#define IOP3XX_PBISR		(volatile u32 *)IOP3XX_REG_ADDR(0x0684)
-#define IOP3XX_PBBAR0		(volatile u32 *)IOP3XX_REG_ADDR(0x0688)
-#define IOP3XX_PBLR0		(volatile u32 *)IOP3XX_REG_ADDR(0x068c)
-#define IOP3XX_PBBAR1		(volatile u32 *)IOP3XX_REG_ADDR(0x0690)
-#define IOP3XX_PBLR1		(volatile u32 *)IOP3XX_REG_ADDR(0x0694)
-#define IOP3XX_PBBAR2		(volatile u32 *)IOP3XX_REG_ADDR(0x0698)
-#define IOP3XX_PBLR2		(volatile u32 *)IOP3XX_REG_ADDR(0x069c)
-#define IOP3XX_PBBAR3		(volatile u32 *)IOP3XX_REG_ADDR(0x06a0)
-#define IOP3XX_PBLR3		(volatile u32 *)IOP3XX_REG_ADDR(0x06a4)
-#define IOP3XX_PBBAR4		(volatile u32 *)IOP3XX_REG_ADDR(0x06a8)
-#define IOP3XX_PBLR4		(volatile u32 *)IOP3XX_REG_ADDR(0x06ac)
-#define IOP3XX_PBBAR5		(volatile u32 *)IOP3XX_REG_ADDR(0x06b0)
-#define IOP3XX_PBLR5		(volatile u32 *)IOP3XX_REG_ADDR(0x06b4)
-#define IOP3XX_PMBR0		(volatile u32 *)IOP3XX_REG_ADDR(0x06c0)
-#define IOP3XX_PMBR1		(volatile u32 *)IOP3XX_REG_ADDR(0x06e0)
-#define IOP3XX_PMBR2		(volatile u32 *)IOP3XX_REG_ADDR(0x06e4)
-
-/* Peripheral performance monitoring unit  */
-#define IOP3XX_GTMR		(volatile u32 *)IOP3XX_REG_ADDR(0x0700)
-#define IOP3XX_ESR		(volatile u32 *)IOP3XX_REG_ADDR(0x0704)
-#define IOP3XX_EMISR		(volatile u32 *)IOP3XX_REG_ADDR(0x0708)
-#define IOP3XX_GTSR		(volatile u32 *)IOP3XX_REG_ADDR(0x0710)
-/* PERCR0 DOESN'T EXIST - index from 1! */
-#define IOP3XX_PERCR0		(volatile u32 *)IOP3XX_REG_ADDR(0x0710)
-
-/* Timers  */
-#define IOP3XX_TU_TMR0		(volatile u32 *)IOP3XX_TIMER_REG(0x0000)
-#define IOP3XX_TU_TMR1		(volatile u32 *)IOP3XX_TIMER_REG(0x0004)
-#define IOP3XX_TU_TCR0		(volatile u32 *)IOP3XX_TIMER_REG(0x0008)
-#define IOP3XX_TU_TCR1		(volatile u32 *)IOP3XX_TIMER_REG(0x000c)
-#define IOP3XX_TU_TRR0		(volatile u32 *)IOP3XX_TIMER_REG(0x0010)
-#define IOP3XX_TU_TRR1		(volatile u32 *)IOP3XX_TIMER_REG(0x0014)
-#define IOP3XX_TU_TISR		(volatile u32 *)IOP3XX_TIMER_REG(0x0018)
-#define IOP3XX_TU_WDTCR		(volatile u32 *)IOP3XX_TIMER_REG(0x001c)
-#define IOP_TMR_EN	    0x02
-#define IOP_TMR_RELOAD	    0x04
-#define IOP_TMR_PRIVILEGED 0x08
-#define IOP_TMR_RATIO_1_1  0x00
-
-/* Watchdog timer definitions */
-#define IOP_WDTCR_EN_ARM        0x1e1e1e1e
-#define IOP_WDTCR_EN            0xe1e1e1e1
-/* iop3xx does not support stopping the watchdog, so we just re-arm */
-#define IOP_WDTCR_DIS_ARM	(IOP_WDTCR_EN_ARM)
-#define IOP_WDTCR_DIS		(IOP_WDTCR_EN)
-
-/* Application accelerator unit  */
-#define IOP3XX_AAU_PHYS_BASE (IOP3XX_PERIPHERAL_PHYS_BASE + 0x800)
-#define IOP3XX_AAU_UPPER_PA (IOP3XX_AAU_PHYS_BASE + 0xa7)
-
-/* I2C bus interface unit  */
-#define IOP3XX_ICR0		(volatile u32 *)IOP3XX_REG_ADDR(0x1680)
-#define IOP3XX_ISR0		(volatile u32 *)IOP3XX_REG_ADDR(0x1684)
-#define IOP3XX_ISAR0		(volatile u32 *)IOP3XX_REG_ADDR(0x1688)
-#define IOP3XX_IDBR0		(volatile u32 *)IOP3XX_REG_ADDR(0x168c)
-#define IOP3XX_IBMR0		(volatile u32 *)IOP3XX_REG_ADDR(0x1694)
-#define IOP3XX_ICR1		(volatile u32 *)IOP3XX_REG_ADDR(0x16a0)
-#define IOP3XX_ISR1		(volatile u32 *)IOP3XX_REG_ADDR(0x16a4)
-#define IOP3XX_ISAR1		(volatile u32 *)IOP3XX_REG_ADDR(0x16a8)
-#define IOP3XX_IDBR1		(volatile u32 *)IOP3XX_REG_ADDR(0x16ac)
-#define IOP3XX_IBMR1		(volatile u32 *)IOP3XX_REG_ADDR(0x16b4)
-
-
-/*
- * IOP3XX I/O and Mem space regions for PCI autoconfiguration
- */
-#define IOP3XX_PCI_LOWER_MEM_PA	0x80000000
-#define IOP3XX_PCI_MEM_WINDOW_SIZE	0x08000000
-
-#define IOP3XX_PCI_LOWER_IO_PA		0x90000000
-#define IOP3XX_PCI_LOWER_IO_BA		0x00000000
-
-#ifndef __ASSEMBLY__
-
-#include <linux/types.h>
-#include <linux/reboot.h>
-
-void iop3xx_map_io(void);
-void iop_enable_cp6(void);
-void iop_init_cp6_handler(void);
-void iop_init_time(unsigned long tickrate);
-void iop3xx_restart(enum reboot_mode, const char *);
-
-static inline u32 read_tmr0(void)
-{
-	u32 val;
-	asm volatile("mrc p6, 0, %0, c0, c1, 0" : "=r" (val));
-	return val;
-}
-
-static inline void write_tmr0(u32 val)
-{
-	asm volatile("mcr p6, 0, %0, c0, c1, 0" : : "r" (val));
-}
-
-static inline void write_tmr1(u32 val)
-{
-	asm volatile("mcr p6, 0, %0, c1, c1, 0" : : "r" (val));
-}
-
-static inline u32 read_tcr0(void)
-{
-	u32 val;
-	asm volatile("mrc p6, 0, %0, c2, c1, 0" : "=r" (val));
-	return val;
-}
-
-static inline void write_tcr0(u32 val)
-{
-	asm volatile("mcr p6, 0, %0, c2, c1, 0" : : "r" (val));
-}
-
-static inline u32 read_tcr1(void)
-{
-	u32 val;
-	asm volatile("mrc p6, 0, %0, c3, c1, 0" : "=r" (val));
-	return val;
-}
-
-static inline void write_tcr1(u32 val)
-{
-	asm volatile("mcr p6, 0, %0, c3, c1, 0" : : "r" (val));
-}
-
-static inline void write_trr0(u32 val)
-{
-	asm volatile("mcr p6, 0, %0, c4, c1, 0" : : "r" (val));
-}
-
-static inline void write_trr1(u32 val)
-{
-	asm volatile("mcr p6, 0, %0, c5, c1, 0" : : "r" (val));
-}
-
-static inline void write_tisr(u32 val)
-{
-	asm volatile("mcr p6, 0, %0, c6, c1, 0" : : "r" (val));
-}
-
-static inline u32 read_wdtcr(void)
-{
-	u32 val;
-	asm volatile("mrc p6, 0, %0, c7, c1, 0":"=r" (val));
-	return val;
-}
-static inline void write_wdtcr(u32 val)
-{
-	asm volatile("mcr p6, 0, %0, c7, c1, 0"::"r" (val));
-}
-
-extern unsigned long get_iop_tick_rate(void);
-
-/* only iop13xx has these registers, we define these to present a
- * common register interface for the iop_wdt driver.
- */
-#define IOP_RCSR_WDT	(0)
-static inline u32 read_rcsr(void)
-{
-	return 0;
-}
-static inline void write_wdtsr(u32 val)
-{
-	do { } while (0);
-}
-
-extern struct platform_device iop3xx_dma_0_channel;
-extern struct platform_device iop3xx_dma_1_channel;
-extern struct platform_device iop3xx_aau_channel;
-extern struct platform_device iop3xx_i2c0_device;
-extern struct platform_device iop3xx_i2c1_device;
-extern struct gpiod_lookup_table iop3xx_i2c0_gpio_lookup;
-extern struct gpiod_lookup_table iop3xx_i2c1_gpio_lookup;
-
-#endif
-
-
-#endif
diff --git a/arch/arm/mach-iop32x/iq31244.c b/arch/arm/mach-iop32x/iq31244.c
deleted file mode 100644
index 8b4c29d17265..000000000000
--- a/arch/arm/mach-iop32x/iq31244.c
+++ /dev/null
@@ -1,333 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * arch/arm/mach-iop32x/iq31244.c
- *
- * Board support code for the Intel EP80219 and IQ31244 platforms.
- *
- * Author: Rory Bolt <rorybolt@pacbell.net>
- * Copyright (C) 2002 Rory Bolt
- * Copyright 2003 (c) MontaVista, Software, Inc.
- * Copyright (C) 2004 Intel Corp.
- */
-
-#include <linux/mm.h>
-#include <linux/init.h>
-#include <linux/delay.h>
-#include <linux/kernel.h>
-#include <linux/pci.h>
-#include <linux/pm.h>
-#include <linux/string.h>
-#include <linux/serial_core.h>
-#include <linux/serial_8250.h>
-#include <linux/mtd/physmap.h>
-#include <linux/platform_device.h>
-#include <linux/io.h>
-#include <linux/gpio/machine.h>
-#include <asm/cputype.h>
-#include <asm/irq.h>
-#include <asm/mach/arch.h>
-#include <asm/mach/map.h>
-#include <asm/mach/pci.h>
-#include <asm/mach/time.h>
-#include <asm/mach-types.h>
-#include <asm/page.h>
-
-#include "hardware.h"
-#include "irqs.h"
-#include "gpio-iop32x.h"
-
-/*
- * Until March of 2007 iq31244 platforms and ep80219 platforms shared the
- * same machine id, and the processor type was used to select board type.
- * However this assumption breaks for an iq80219 board which is an iop219
- * processor on an iq31244 board.  The force_ep80219 flag has been added
- * for old boot loaders using the iq31244 machine id for an ep80219 platform.
- */
-static int force_ep80219;
-
-static int is_80219(void)
-{
-	return !!((read_cpuid_id() & 0xffffffe0) == 0x69052e20);
-}
-
-static int is_ep80219(void)
-{
-	if (machine_is_ep80219() || force_ep80219)
-		return 1;
-	else
-		return 0;
-}
-
-
-/*
- * EP80219/IQ31244 timer tick configuration.
- */
-static void __init iq31244_timer_init(void)
-{
-	if (is_ep80219()) {
-		/* 33.333 MHz crystal.  */
-		iop_init_time(200000000);
-	} else {
-		/* 33.000 MHz crystal.  */
-		iop_init_time(198000000);
-	}
-}
-
-
-/*
- * IQ31244 I/O.
- */
-static struct map_desc iq31244_io_desc[] __initdata = {
-	{	/* on-board devices */
-		.virtual	= IQ31244_UART,
-		.pfn		= __phys_to_pfn(IQ31244_UART),
-		.length		= 0x00100000,
-		.type		= MT_DEVICE,
-	},
-};
-
-void __init iq31244_map_io(void)
-{
-	iop3xx_map_io();
-	iotable_init(iq31244_io_desc, ARRAY_SIZE(iq31244_io_desc));
-}
-
-
-/*
- * EP80219/IQ31244 PCI.
- */
-static int __init
-ep80219_pci_map_irq(const struct pci_dev *dev, u8 slot, u8 pin)
-{
-	int irq;
-
-	if (slot == 0) {
-		/* CFlash */
-		irq = IRQ_IOP32X_XINT1;
-	} else if (slot == 1) {
-		/* 82551 Pro 100 */
-		irq = IRQ_IOP32X_XINT0;
-	} else if (slot == 2) {
-		/* PCI-X Slot */
-		irq = IRQ_IOP32X_XINT3;
-	} else if (slot == 3) {
-		/* SATA */
-		irq = IRQ_IOP32X_XINT2;
-	} else {
-		printk(KERN_ERR "ep80219_pci_map_irq() called for unknown "
-			"device PCI:%d:%d:%d\n", dev->bus->number,
-			PCI_SLOT(dev->devfn), PCI_FUNC(dev->devfn));
-		irq = -1;
-	}
-
-	return irq;
-}
-
-static struct hw_pci ep80219_pci __initdata = {
-	.nr_controllers = 1,
-	.ops		= &iop3xx_ops,
-	.setup		= iop3xx_pci_setup,
-	.preinit	= iop3xx_pci_preinit,
-	.map_irq	= ep80219_pci_map_irq,
-};
-
-static int __init
-iq31244_pci_map_irq(const struct pci_dev *dev, u8 slot, u8 pin)
-{
-	int irq;
-
-	if (slot == 0) {
-		/* CFlash */
-		irq = IRQ_IOP32X_XINT1;
-	} else if (slot == 1) {
-		/* SATA */
-		irq = IRQ_IOP32X_XINT2;
-	} else if (slot == 2) {
-		/* PCI-X Slot */
-		irq = IRQ_IOP32X_XINT3;
-	} else if (slot == 3) {
-		/* 82546 GigE */
-		irq = IRQ_IOP32X_XINT0;
-	} else {
-		printk(KERN_ERR "iq31244_pci_map_irq called for unknown "
-			"device PCI:%d:%d:%d\n", dev->bus->number,
-			PCI_SLOT(dev->devfn), PCI_FUNC(dev->devfn));
-		irq = -1;
-	}
-
-	return irq;
-}
-
-static struct hw_pci iq31244_pci __initdata = {
-	.nr_controllers = 1,
-	.ops		= &iop3xx_ops,
-	.setup		= iop3xx_pci_setup,
-	.preinit	= iop3xx_pci_preinit,
-	.map_irq	= iq31244_pci_map_irq,
-};
-
-static int __init iq31244_pci_init(void)
-{
-	if (is_ep80219())
-		pci_common_init(&ep80219_pci);
-	else if (machine_is_iq31244()) {
-		if (is_80219()) {
-			printk("note: iq31244 board type has been selected\n");
-			printk("note: to select ep80219 operation:\n");
-			printk("\t1/ specify \"force_ep80219\" on the kernel"
-				" command line\n");
-			printk("\t2/ update boot loader to pass"
-				" the ep80219 id: %d\n", MACH_TYPE_EP80219);
-		}
-		pci_common_init(&iq31244_pci);
-	}
-
-	return 0;
-}
-
-subsys_initcall(iq31244_pci_init);
-
-
-/*
- * IQ31244 machine initialisation.
- */
-static struct physmap_flash_data iq31244_flash_data = {
-	.width		= 2,
-};
-
-static struct resource iq31244_flash_resource = {
-	.start		= 0xf0000000,
-	.end		= 0xf07fffff,
-	.flags		= IORESOURCE_MEM,
-};
-
-static struct platform_device iq31244_flash_device = {
-	.name		= "physmap-flash",
-	.id		= 0,
-	.dev		= {
-		.platform_data	= &iq31244_flash_data,
-	},
-	.num_resources	= 1,
-	.resource	= &iq31244_flash_resource,
-};
-
-static struct plat_serial8250_port iq31244_serial_port[] = {
-	{
-		.mapbase	= IQ31244_UART,
-		.membase	= (char *)IQ31244_UART,
-		.irq		= IRQ_IOP32X_XINT1,
-		.flags		= UPF_SKIP_TEST,
-		.iotype		= UPIO_MEM,
-		.regshift	= 0,
-		.uartclk	= 1843200,
-	},
-	{ },
-};
-
-static struct resource iq31244_uart_resource = {
-	.start		= IQ31244_UART,
-	.end		= IQ31244_UART + 7,
-	.flags		= IORESOURCE_MEM,
-};
-
-static struct platform_device iq31244_serial_device = {
-	.name		= "serial8250",
-	.id		= PLAT8250_DEV_PLATFORM,
-	.dev		= {
-		.platform_data		= iq31244_serial_port,
-	},
-	.num_resources	= 1,
-	.resource	= &iq31244_uart_resource,
-};
-
-/*
- * This function will send a SHUTDOWN_COMPLETE message to the PIC
- * controller over I2C.  We are not using the i2c subsystem since
- * we are going to power off and it may be removed
- */
-void ep80219_power_off(void)
-{
-	/*
-	 * Send the Address byte w/ the start condition
-	 */
-	*IOP3XX_IDBR1 = 0x60;
-	*IOP3XX_ICR1 = 0xE9;
-	mdelay(1);
-
-	/*
-	 * Send the START_MSG byte w/ no start or stop condition
-	 */
-	*IOP3XX_IDBR1 = 0x0F;
-	*IOP3XX_ICR1 = 0xE8;
-	mdelay(1);
-
-	/*
-	 * Send the SHUTDOWN_COMPLETE Message ID byte w/ no start or
-	 * stop condition
-	 */
-	*IOP3XX_IDBR1 = 0x03;
-	*IOP3XX_ICR1 = 0xE8;
-	mdelay(1);
-
-	/*
-	 * Send an ignored byte w/ stop condition
-	 */
-	*IOP3XX_IDBR1 = 0x00;
-	*IOP3XX_ICR1 = 0xEA;
-
-	while (1)
-		;
-}
-
-static void __init iq31244_init_machine(void)
-{
-	register_iop32x_gpio();
-	gpiod_add_lookup_table(&iop3xx_i2c0_gpio_lookup);
-	gpiod_add_lookup_table(&iop3xx_i2c1_gpio_lookup);
-	platform_device_register(&iop3xx_i2c0_device);
-	platform_device_register(&iop3xx_i2c1_device);
-	platform_device_register(&iq31244_flash_device);
-	platform_device_register(&iq31244_serial_device);
-	platform_device_register(&iop3xx_dma_0_channel);
-	platform_device_register(&iop3xx_dma_1_channel);
-
-	if (is_ep80219())
-		pm_power_off = ep80219_power_off;
-
-	if (!is_80219())
-		platform_device_register(&iop3xx_aau_channel);
-}
-
-static int __init force_ep80219_setup(char *str)
-{
-	force_ep80219 = 1;
-	return 1;
-}
-
-__setup("force_ep80219", force_ep80219_setup);
-
-MACHINE_START(IQ31244, "Intel IQ31244")
-	/* Maintainer: Intel Corp. */
-	.atag_offset	= 0x100,
-	.map_io		= iq31244_map_io,
-	.init_irq	= iop32x_init_irq,
-	.init_time	= iq31244_timer_init,
-	.init_machine	= iq31244_init_machine,
-	.restart	= iop3xx_restart,
-MACHINE_END
-
-/* There should have been an ep80219 machine identifier from the beginning.
- * Boot roms older than March 2007 do not know the ep80219 machine id.  Pass
- * "force_ep80219" on the kernel command line, otherwise iq31244 operation
- * will be selected.
- */
-MACHINE_START(EP80219, "Intel EP80219")
-	/* Maintainer: Intel Corp. */
-	.atag_offset	= 0x100,
-	.nr_irqs	= IOP32X_NR_IRQS,
-	.map_io		= iq31244_map_io,
-	.init_irq	= iop32x_init_irq,
-	.init_time	= iq31244_timer_init,
-	.init_machine	= iq31244_init_machine,
-	.restart	= iop3xx_restart,
-MACHINE_END
diff --git a/arch/arm/mach-iop32x/iq31244.h b/arch/arm/mach-iop32x/iq31244.h
deleted file mode 100644
index a7ac691e48d3..000000000000
--- a/arch/arm/mach-iop32x/iq31244.h
+++ /dev/null
@@ -1,16 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Intel IQ31244 evaluation board registers
- */
-
-#ifndef __IQ31244_H
-#define __IQ31244_H
-
-#define IQ31244_UART		0xfe800000	/* UART #1 */
-#define IQ31244_7SEG_1		0xfe840000	/* 7-Segment MSB */
-#define IQ31244_7SEG_0		0xfe850000	/* 7-Segment LSB (WO) */
-#define IQ31244_ROTARY_SW	0xfe8d0000	/* Rotary Switch */
-#define IQ31244_BATT_STAT	0xfe8f0000	/* Battery Status */
-
-
-#endif
diff --git a/arch/arm/mach-iop32x/iq80321.c b/arch/arm/mach-iop32x/iq80321.c
deleted file mode 100644
index d9780c4660cb..000000000000
--- a/arch/arm/mach-iop32x/iq80321.c
+++ /dev/null
@@ -1,192 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * arch/arm/mach-iop32x/iq80321.c
- *
- * Board support code for the Intel IQ80321 platform.
- *
- * Author: Rory Bolt <rorybolt@pacbell.net>
- * Copyright (C) 2002 Rory Bolt
- * Copyright (C) 2004 Intel Corp.
- */
-
-#include <linux/mm.h>
-#include <linux/init.h>
-#include <linux/kernel.h>
-#include <linux/pci.h>
-#include <linux/string.h>
-#include <linux/serial_core.h>
-#include <linux/serial_8250.h>
-#include <linux/mtd/physmap.h>
-#include <linux/platform_device.h>
-#include <linux/io.h>
-#include <linux/gpio/machine.h>
-#include <asm/irq.h>
-#include <asm/mach/arch.h>
-#include <asm/mach/map.h>
-#include <asm/mach/pci.h>
-#include <asm/mach/time.h>
-#include <asm/mach-types.h>
-#include <asm/page.h>
-
-#include "hardware.h"
-#include "irqs.h"
-#include "gpio-iop32x.h"
-
-/*
- * IQ80321 timer tick configuration.
- */
-static void __init iq80321_timer_init(void)
-{
-	/* 33.333 MHz crystal.  */
-	iop_init_time(200000000);
-}
-
-
-/*
- * IQ80321 I/O.
- */
-static struct map_desc iq80321_io_desc[] __initdata = {
- 	{	/* on-board devices */
-		.virtual	= IQ80321_UART,
-		.pfn		= __phys_to_pfn(IQ80321_UART),
-		.length		= 0x00100000,
-		.type		= MT_DEVICE,
-	},
-};
-
-void __init iq80321_map_io(void)
-{
-	iop3xx_map_io();
-	iotable_init(iq80321_io_desc, ARRAY_SIZE(iq80321_io_desc));
-}
-
-
-/*
- * IQ80321 PCI.
- */
-static int __init
-iq80321_pci_map_irq(const struct pci_dev *dev, u8 slot, u8 pin)
-{
-	int irq;
-
-	if ((slot == 2 || slot == 6) && pin == 1) {
-		/* PCI-X Slot INTA */
-		irq = IRQ_IOP32X_XINT2;
-	} else if ((slot == 2 || slot == 6) && pin == 2) {
-		/* PCI-X Slot INTA */
-		irq = IRQ_IOP32X_XINT3;
-	} else if ((slot == 2 || slot == 6) && pin == 3) {
-		/* PCI-X Slot INTA */
-		irq = IRQ_IOP32X_XINT0;
-	} else if ((slot == 2 || slot == 6) && pin == 4) {
-		/* PCI-X Slot INTA */
-		irq = IRQ_IOP32X_XINT1;
-	} else if (slot == 4 || slot == 8) {
-		/* Gig-E */
-		irq = IRQ_IOP32X_XINT0;
-	} else {
-		printk(KERN_ERR "iq80321_pci_map_irq() called for unknown "
-			"device PCI:%d:%d:%d\n", dev->bus->number,
-			PCI_SLOT(dev->devfn), PCI_FUNC(dev->devfn));
-		irq = -1;
-	}
-
-	return irq;
-}
-
-static struct hw_pci iq80321_pci __initdata = {
-	.nr_controllers = 1,
-	.ops		= &iop3xx_ops,
-	.setup		= iop3xx_pci_setup,
-	.preinit	= iop3xx_pci_preinit_cond,
-	.map_irq	= iq80321_pci_map_irq,
-};
-
-static int __init iq80321_pci_init(void)
-{
-	if ((iop3xx_get_init_atu() == IOP3XX_INIT_ATU_ENABLE) &&
-		machine_is_iq80321())
-		pci_common_init(&iq80321_pci);
-
-	return 0;
-}
-
-subsys_initcall(iq80321_pci_init);
-
-
-/*
- * IQ80321 machine initialisation.
- */
-static struct physmap_flash_data iq80321_flash_data = {
-	.width		= 1,
-};
-
-static struct resource iq80321_flash_resource = {
-	.start		= 0xf0000000,
-	.end		= 0xf07fffff,
-	.flags		= IORESOURCE_MEM,
-};
-
-static struct platform_device iq80321_flash_device = {
-	.name		= "physmap-flash",
-	.id		= 0,
-	.dev		= {
-		.platform_data	= &iq80321_flash_data,
-	},
-	.num_resources	= 1,
-	.resource	= &iq80321_flash_resource,
-};
-
-static struct plat_serial8250_port iq80321_serial_port[] = {
-	{
-		.mapbase	= IQ80321_UART,
-		.membase	= (char *)IQ80321_UART,
-		.irq		= IRQ_IOP32X_XINT1,
-		.flags		= UPF_SKIP_TEST,
-		.iotype		= UPIO_MEM,
-		.regshift	= 0,
-		.uartclk	= 1843200,
-	},
-	{ },
-};
-
-static struct resource iq80321_uart_resource = {
-	.start		= IQ80321_UART,
-	.end		= IQ80321_UART + 7,
-	.flags		= IORESOURCE_MEM,
-};
-
-static struct platform_device iq80321_serial_device = {
-	.name		= "serial8250",
-	.id		= PLAT8250_DEV_PLATFORM,
-	.dev		= {
-		.platform_data		= iq80321_serial_port,
-	},
-	.num_resources	= 1,
-	.resource	= &iq80321_uart_resource,
-};
-
-static void __init iq80321_init_machine(void)
-{
-	register_iop32x_gpio();
-	gpiod_add_lookup_table(&iop3xx_i2c0_gpio_lookup);
-	gpiod_add_lookup_table(&iop3xx_i2c1_gpio_lookup);
-	platform_device_register(&iop3xx_i2c0_device);
-	platform_device_register(&iop3xx_i2c1_device);
-	platform_device_register(&iq80321_flash_device);
-	platform_device_register(&iq80321_serial_device);
-	platform_device_register(&iop3xx_dma_0_channel);
-	platform_device_register(&iop3xx_dma_1_channel);
-	platform_device_register(&iop3xx_aau_channel);
-}
-
-MACHINE_START(IQ80321, "Intel IQ80321")
-	/* Maintainer: Intel Corp. */
-	.atag_offset	= 0x100,
-	.nr_irqs	= IOP32X_NR_IRQS,
-	.map_io		= iq80321_map_io,
-	.init_irq	= iop32x_init_irq,
-	.init_time	= iq80321_timer_init,
-	.init_machine	= iq80321_init_machine,
-	.restart	= iop3xx_restart,
-MACHINE_END
diff --git a/arch/arm/mach-iop32x/iq80321.h b/arch/arm/mach-iop32x/iq80321.h
deleted file mode 100644
index 3a5d10626ea6..000000000000
--- a/arch/arm/mach-iop32x/iq80321.h
+++ /dev/null
@@ -1,16 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Intel IQ80321 evaluation board registers
- */
-
-#ifndef __IQ80321_H
-#define __IQ80321_H
-
-#define IQ80321_UART		0xfe800000	/* UART #1 */
-#define IQ80321_7SEG_1		0xfe840000	/* 7-Segment MSB */
-#define IQ80321_7SEG_0		0xfe850000	/* 7-Segment LSB (WO) */
-#define IQ80321_ROTARY_SW	0xfe8d0000	/* Rotary Switch */
-#define IQ80321_BATT_STAT	0xfe8f0000	/* Battery Status */
-
-
-#endif
diff --git a/arch/arm/mach-iop32x/irq.c b/arch/arm/mach-iop32x/irq.c
deleted file mode 100644
index 6dca7e97d81f..000000000000
--- a/arch/arm/mach-iop32x/irq.c
+++ /dev/null
@@ -1,95 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * arch/arm/mach-iop32x/irq.c
- *
- * Generic IOP32X IRQ handling functionality
- *
- * Author: Rory Bolt <rorybolt@pacbell.net>
- * Copyright (C) 2002 Rory Bolt
- */
-
-#include <linux/init.h>
-#include <linux/interrupt.h>
-#include <linux/list.h>
-#include <asm/mach/irq.h>
-#include <asm/irq.h>
-#include <asm/mach-types.h>
-
-#include "hardware.h"
-
-static u32 iop32x_mask;
-
-static void intctl_write(u32 val)
-{
-	asm volatile("mcr p6, 0, %0, c0, c0, 0" : : "r" (val));
-}
-
-static void intstr_write(u32 val)
-{
-	asm volatile("mcr p6, 0, %0, c4, c0, 0" : : "r" (val));
-}
-
-static u32 iintsrc_read(void)
-{
-	int irq;
-
-	asm volatile("mrc p6, 0, %0, c8, c0, 0" : "=r" (irq));
-
-	return irq;
-}
-
-static void
-iop32x_irq_mask(struct irq_data *d)
-{
-	iop32x_mask &= ~(1 << (d->irq - 1));
-	intctl_write(iop32x_mask);
-}
-
-static void
-iop32x_irq_unmask(struct irq_data *d)
-{
-	iop32x_mask |= 1 << (d->irq - 1);
-	intctl_write(iop32x_mask);
-}
-
-struct irq_chip ext_chip = {
-	.name		= "IOP32x",
-	.irq_ack	= iop32x_irq_mask,
-	.irq_mask	= iop32x_irq_mask,
-	.irq_unmask	= iop32x_irq_unmask,
-};
-
-static void iop_handle_irq(struct pt_regs *regs)
-{
-	u32 mask;
-
-	iop_enable_cp6();
-
-	do {
-		mask = iintsrc_read();
-		if (mask)
-			generic_handle_irq(fls(mask));
-	} while (mask);
-}
-
-void __init iop32x_init_irq(void)
-{
-	int i;
-
-	iop_init_cp6_handler();
-	set_handle_irq(iop_handle_irq);
-
-	intctl_write(0);
-	intstr_write(0);
-	if (machine_is_glantank() ||
-	    machine_is_iq80321() ||
-	    machine_is_iq31244() ||
-	    machine_is_n2100() ||
-	    machine_is_em7210())
-		*IOP3XX_PCIIRSR = 0x0f;
-
-	for (i = 1; i < NR_IRQS; i++) {
-		irq_set_chip_and_handler(i, &ext_chip, handle_level_irq);
-		irq_clear_status_flags(i, IRQ_NOREQUEST | IRQ_NOPROBE);
-	}
-}
diff --git a/arch/arm/mach-iop32x/irqs.h b/arch/arm/mach-iop32x/irqs.h
deleted file mode 100644
index e9fc88e09189..000000000000
--- a/arch/arm/mach-iop32x/irqs.h
+++ /dev/null
@@ -1,48 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Author:	Rory Bolt <rorybolt@pacbell.net>
- * Copyright:	(C) 2002 Rory Bolt
- */
-
-#ifndef __IOP32X_IRQS_H
-#define __IOP32X_IRQS_H
-
-/* Interrupts in Linux start at 1, hardware starts at 0 */
-
-#define IOP_IRQ(x) ((x) + 1)
-
-/*
- * IOP80321 chipset interrupts
- */
-#define IRQ_IOP32X_DMA0_EOT	IOP_IRQ(0)
-#define IRQ_IOP32X_DMA0_EOC	IOP_IRQ(1)
-#define IRQ_IOP32X_DMA1_EOT	IOP_IRQ(2)
-#define IRQ_IOP32X_DMA1_EOC	IOP_IRQ(3)
-#define IRQ_IOP32X_AA_EOT	IOP_IRQ(6)
-#define IRQ_IOP32X_AA_EOC	IOP_IRQ(7)
-#define IRQ_IOP32X_CORE_PMON	IOP_IRQ(8)
-#define IRQ_IOP32X_TIMER0	IOP_IRQ(9)
-#define IRQ_IOP32X_TIMER1	IOP_IRQ(10)
-#define IRQ_IOP32X_I2C_0	IOP_IRQ(11)
-#define IRQ_IOP32X_I2C_1	IOP_IRQ(12)
-#define IRQ_IOP32X_MESSAGING	IOP_IRQ(13)
-#define IRQ_IOP32X_ATU_BIST	IOP_IRQ(14)
-#define IRQ_IOP32X_PERFMON	IOP_IRQ(15)
-#define IRQ_IOP32X_CORE_PMU	IOP_IRQ(16)
-#define IRQ_IOP32X_BIU_ERR	IOP_IRQ(17)
-#define IRQ_IOP32X_ATU_ERR	IOP_IRQ(18)
-#define IRQ_IOP32X_MCU_ERR	IOP_IRQ(19)
-#define IRQ_IOP32X_DMA0_ERR	IOP_IRQ(20)
-#define IRQ_IOP32X_DMA1_ERR	IOP_IRQ(21)
-#define IRQ_IOP32X_AA_ERR	IOP_IRQ(23)
-#define IRQ_IOP32X_MSG_ERR	IOP_IRQ(24)
-#define IRQ_IOP32X_SSP		IOP_IRQ(25)
-#define IRQ_IOP32X_XINT0	IOP_IRQ(27)
-#define IRQ_IOP32X_XINT1	IOP_IRQ(28)
-#define IRQ_IOP32X_XINT2	IOP_IRQ(29)
-#define IRQ_IOP32X_XINT3	IOP_IRQ(30)
-#define IRQ_IOP32X_HPI		IOP_IRQ(31)
-
-#define IOP32X_NR_IRQS		(IRQ_IOP32X_HPI + 1)
-
-#endif
diff --git a/arch/arm/mach-iop32x/n2100.c b/arch/arm/mach-iop32x/n2100.c
deleted file mode 100644
index bb1e2e11bf35..000000000000
--- a/arch/arm/mach-iop32x/n2100.c
+++ /dev/null
@@ -1,367 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * arch/arm/mach-iop32x/n2100.c
- *
- * Board support code for the Thecus N2100 platform.
- *
- * Author: Rory Bolt <rorybolt@pacbell.net>
- * Copyright (C) 2002 Rory Bolt
- * Copyright 2003 (c) MontaVista, Software, Inc.
- * Copyright (C) 2004 Intel Corp.
- */
-
-#include <linux/mm.h>
-#include <linux/init.h>
-#include <linux/f75375s.h>
-#include <linux/leds-pca9532.h>
-#include <linux/delay.h>
-#include <linux/kernel.h>
-#include <linux/pci.h>
-#include <linux/pm.h>
-#include <linux/string.h>
-#include <linux/serial_core.h>
-#include <linux/serial_8250.h>
-#include <linux/mtd/physmap.h>
-#include <linux/i2c.h>
-#include <linux/platform_device.h>
-#include <linux/reboot.h>
-#include <linux/io.h>
-#include <linux/gpio.h>
-#include <linux/gpio/machine.h>
-#include <asm/irq.h>
-#include <asm/mach/arch.h>
-#include <asm/mach/map.h>
-#include <asm/mach/pci.h>
-#include <asm/mach/time.h>
-#include <asm/mach-types.h>
-#include <asm/page.h>
-
-#include "hardware.h"
-#include "irqs.h"
-#include "gpio-iop32x.h"
-
-/*
- * N2100 timer tick configuration.
- */
-static void __init n2100_timer_init(void)
-{
-	/* 33.000 MHz crystal.  */
-	iop_init_time(198000000);
-}
-
-
-/*
- * N2100 I/O.
- */
-static struct map_desc n2100_io_desc[] __initdata = {
-	{	/* on-board devices */
-		.virtual	= N2100_UART,
-		.pfn		= __phys_to_pfn(N2100_UART),
-		.length		= 0x00100000,
-		.type		= MT_DEVICE
-	},
-};
-
-void __init n2100_map_io(void)
-{
-	iop3xx_map_io();
-	iotable_init(n2100_io_desc, ARRAY_SIZE(n2100_io_desc));
-}
-
-
-/*
- * N2100 PCI.
- */
-static int n2100_pci_map_irq(const struct pci_dev *dev, u8 slot, u8 pin)
-{
-	int irq;
-
-	if (PCI_SLOT(dev->devfn) == 1) {
-		/* RTL8110SB #1 */
-		irq = IRQ_IOP32X_XINT0;
-	} else if (PCI_SLOT(dev->devfn) == 2) {
-		/* RTL8110SB #2 */
-		irq = IRQ_IOP32X_XINT3;
-	} else if (PCI_SLOT(dev->devfn) == 3) {
-		/* Sil3512 */
-		irq = IRQ_IOP32X_XINT2;
-	} else if (PCI_SLOT(dev->devfn) == 4 && pin == 1) {
-		/* VT6212 INTA */
-		irq = IRQ_IOP32X_XINT1;
-	} else if (PCI_SLOT(dev->devfn) == 4 && pin == 2) {
-		/* VT6212 INTB */
-		irq = IRQ_IOP32X_XINT0;
-	} else if (PCI_SLOT(dev->devfn) == 4 && pin == 3) {
-		/* VT6212 INTC */
-		irq = IRQ_IOP32X_XINT2;
-	} else if (PCI_SLOT(dev->devfn) == 5) {
-		/* Mini-PCI slot */
-		irq = IRQ_IOP32X_XINT3;
-	} else {
-		printk(KERN_ERR "n2100_pci_map_irq() called for unknown "
-			"device PCI:%d:%d:%d\n", dev->bus->number,
-			PCI_SLOT(dev->devfn), PCI_FUNC(dev->devfn));
-		irq = -1;
-	}
-
-	return irq;
-}
-
-static struct hw_pci n2100_pci __initdata = {
-	.nr_controllers = 1,
-	.ops		= &iop3xx_ops,
-	.setup		= iop3xx_pci_setup,
-	.preinit	= iop3xx_pci_preinit,
-	.map_irq	= n2100_pci_map_irq,
-};
-
-/*
- * Both r8169 chips on the n2100 exhibit PCI parity problems.  Turn
- * off parity reporting for both ports so we don't get error interrupts
- * for them.
- */
-static void n2100_fixup_r8169(struct pci_dev *dev)
-{
-	if (dev->bus->number == 0 &&
-	    (dev->devfn == PCI_DEVFN(1, 0) ||
-	     dev->devfn == PCI_DEVFN(2, 0)))
-		pci_disable_parity(dev);
-}
-DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_REALTEK, PCI_ANY_ID, n2100_fixup_r8169);
-
-static int __init n2100_pci_init(void)
-{
-	if (machine_is_n2100())
-		pci_common_init(&n2100_pci);
-
-	return 0;
-}
-
-subsys_initcall(n2100_pci_init);
-
-
-/*
- * N2100 machine initialisation.
- */
-static struct physmap_flash_data n2100_flash_data = {
-	.width		= 2,
-};
-
-static struct resource n2100_flash_resource = {
-	.start		= 0xf0000000,
-	.end		= 0xf0ffffff,
-	.flags		= IORESOURCE_MEM,
-};
-
-static struct platform_device n2100_flash_device = {
-	.name		= "physmap-flash",
-	.id		= 0,
-	.dev		= {
-		.platform_data	= &n2100_flash_data,
-	},
-	.num_resources	= 1,
-	.resource	= &n2100_flash_resource,
-};
-
-
-static struct plat_serial8250_port n2100_serial_port[] = {
-	{
-		.mapbase	= N2100_UART,
-		.membase	= (char *)N2100_UART,
-		.irq		= 0,
-		.flags		= UPF_SKIP_TEST | UPF_AUTO_IRQ | UPF_SHARE_IRQ,
-		.iotype		= UPIO_MEM,
-		.regshift	= 0,
-		.uartclk	= 1843200,
-	},
-	{ },
-};
-
-static struct resource n2100_uart_resource = {
-	.start		= N2100_UART,
-	.end		= N2100_UART + 7,
-	.flags		= IORESOURCE_MEM,
-};
-
-static struct platform_device n2100_serial_device = {
-	.name		= "serial8250",
-	.id		= PLAT8250_DEV_PLATFORM,
-	.dev		= {
-		.platform_data		= n2100_serial_port,
-	},
-	.num_resources	= 1,
-	.resource	= &n2100_uart_resource,
-};
-
-static struct f75375s_platform_data n2100_f75375s = {
-	.pwm		= { 255, 255 },
-	.pwm_enable = { 0, 0 },
-};
-
-static struct pca9532_platform_data n2100_leds = {
-	.leds = {
-	{	.name = "n2100:red:satafail0",
-		.state = PCA9532_OFF,
-		.type = PCA9532_TYPE_LED,
-	},
-	{	.name = "n2100:red:satafail1",
-		.state = PCA9532_OFF,
-		.type = PCA9532_TYPE_LED,
-	},
-	{	.name = "n2100:blue:usb",
-		.state = PCA9532_OFF,
-		.type = PCA9532_TYPE_LED,
-	},
-	{ 	.type = PCA9532_TYPE_NONE },
-
-	{ 	.type = PCA9532_TYPE_NONE },
-	{ 	.type = PCA9532_TYPE_NONE },
-	{ 	.type = PCA9532_TYPE_NONE },
-	{	.name = "n2100:red:usb",
-		.state = PCA9532_OFF,
-		.type = PCA9532_TYPE_LED,
-	},
-
-	{	.type = PCA9532_TYPE_NONE }, /* power OFF gpio */
-	{	.type = PCA9532_TYPE_NONE }, /* reset gpio */
-	{	.type = PCA9532_TYPE_NONE },
-	{	.type = PCA9532_TYPE_NONE },
-
-	{	.type = PCA9532_TYPE_NONE },
-	{	.name = "n2100:orange:system",
-		.state = PCA9532_OFF,
-		.type = PCA9532_TYPE_LED,
-	},
-	{	.name = "n2100:red:system",
-		.state = PCA9532_OFF,
-		.type = PCA9532_TYPE_LED,
-	},
-	{	.name = "N2100 beeper"  ,
-		.state =  PCA9532_OFF,
-		.type = PCA9532_TYPE_N2100_BEEP,
-	},
-	},
-	.psc = { 0, 0 },
-	.pwm = { 0, 0 },
-};
-
-static struct i2c_board_info __initdata n2100_i2c_devices[] = {
-	{
-		I2C_BOARD_INFO("rs5c372b", 0x32),
-	},
-	{
-		I2C_BOARD_INFO("f75375", 0x2e),
-		.platform_data = &n2100_f75375s,
-	},
-	{
-		I2C_BOARD_INFO("pca9532", 0x60),
-		.platform_data = &n2100_leds,
-	},
-};
-
-/*
- * Pull PCA9532 GPIO #8 low to power off the machine.
- */
-static void n2100_power_off(void)
-{
-	local_irq_disable();
-
-	/* Start condition, I2C address of PCA9532, write transaction.  */
-	*IOP3XX_IDBR0 = 0xc0;
-	*IOP3XX_ICR0 = 0xe9;
-	mdelay(1);
-
-	/* Write address 0x08.  */
-	*IOP3XX_IDBR0 = 0x08;
-	*IOP3XX_ICR0 = 0xe8;
-	mdelay(1);
-
-	/* Write data 0x01, stop condition.  */
-	*IOP3XX_IDBR0 = 0x01;
-	*IOP3XX_ICR0 = 0xea;
-
-	while (1)
-		;
-}
-
-static void n2100_restart(enum reboot_mode mode, const char *cmd)
-{
-	int ret;
-
-	ret = gpio_direction_output(N2100_HARDWARE_RESET, 0);
-	if (ret) {
-		pr_crit("could not drive reset GPIO low\n");
-		return;
-	}
-	/* Wait for reset to happen */
-	while (1)
-		;
-}
-
-
-static struct timer_list power_button_poll_timer;
-
-static void power_button_poll(struct timer_list *unused)
-{
-	if (gpio_get_value(N2100_POWER_BUTTON) == 0) {
-		ctrl_alt_del();
-		return;
-	}
-
-	power_button_poll_timer.expires = jiffies + (HZ / 10);
-	add_timer(&power_button_poll_timer);
-}
-
-static int __init n2100_request_gpios(void)
-{
-	int ret;
-
-	if (!machine_is_n2100())
-		return 0;
-
-	ret = gpio_request(N2100_HARDWARE_RESET, "reset");
-	if (ret)
-		pr_err("could not request reset GPIO\n");
-
-	ret = gpio_request(N2100_POWER_BUTTON, "power");
-	if (ret)
-		pr_err("could not request power GPIO\n");
-	else {
-		ret = gpio_direction_input(N2100_POWER_BUTTON);
-		if (ret)
-			pr_err("could not set power GPIO as input\n");
-	}
-	/* Set up power button poll timer */
-	timer_setup(&power_button_poll_timer, power_button_poll, 0);
-	power_button_poll_timer.expires = jiffies + (HZ / 10);
-	add_timer(&power_button_poll_timer);
-	return 0;
-}
-device_initcall(n2100_request_gpios);
-
-static void __init n2100_init_machine(void)
-{
-	register_iop32x_gpio();
-	gpiod_add_lookup_table(&iop3xx_i2c0_gpio_lookup);
-	platform_device_register(&iop3xx_i2c0_device);
-	platform_device_register(&n2100_flash_device);
-	platform_device_register(&n2100_serial_device);
-	platform_device_register(&iop3xx_dma_0_channel);
-	platform_device_register(&iop3xx_dma_1_channel);
-
-	i2c_register_board_info(0, n2100_i2c_devices,
-		ARRAY_SIZE(n2100_i2c_devices));
-
-	pm_power_off = n2100_power_off;
-}
-
-MACHINE_START(N2100, "Thecus N2100")
-	/* Maintainer: Lennert Buytenhek <buytenh@wantstofly.org> */
-	.atag_offset	= 0x100,
-	.nr_irqs	= IOP32X_NR_IRQS,
-	.map_io		= n2100_map_io,
-	.init_irq	= iop32x_init_irq,
-	.init_time	= n2100_timer_init,
-	.init_machine	= n2100_init_machine,
-	.restart	= n2100_restart,
-MACHINE_END
diff --git a/arch/arm/mach-iop32x/n2100.h b/arch/arm/mach-iop32x/n2100.h
deleted file mode 100644
index 0b97b940d3e7..000000000000
--- a/arch/arm/mach-iop32x/n2100.h
+++ /dev/null
@@ -1,18 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Thecus N2100 board registers
- */
-
-#ifndef __N2100_H
-#define __N2100_H
-
-#define N2100_UART		0xfe800000	/* UART */
-
-#define N2100_COPY_BUTTON	IOP3XX_GPIO_LINE(0)
-#define N2100_PCA9532_RESET	IOP3XX_GPIO_LINE(2)
-#define N2100_RESET_BUTTON	IOP3XX_GPIO_LINE(3)
-#define N2100_HARDWARE_RESET	IOP3XX_GPIO_LINE(4)
-#define N2100_POWER_BUTTON	IOP3XX_GPIO_LINE(5)
-
-
-#endif
diff --git a/arch/arm/mach-iop32x/pci.c b/arch/arm/mach-iop32x/pci.c
deleted file mode 100644
index 7a215d2ee7e2..000000000000
--- a/arch/arm/mach-iop32x/pci.c
+++ /dev/null
@@ -1,404 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * arch/arm/plat-iop/pci.c
- *
- * PCI support for the Intel IOP32X and IOP33X processors
- *
- * Author: Rory Bolt <rorybolt@pacbell.net>
- * Copyright (C) 2002 Rory Bolt
- */
-
-#include <linux/kernel.h>
-#include <linux/pci.h>
-#include <linux/slab.h>
-#include <linux/mm.h>
-#include <linux/init.h>
-#include <linux/ioport.h>
-#include <linux/io.h>
-#include <asm/irq.h>
-#include <asm/signal.h>
-#include <asm/mach/pci.h>
-#include "hardware.h"
-#include "iop3xx.h"
-
-// #define DEBUG
-
-#ifdef DEBUG
-#define  DBG(x...) printk(x)
-#else
-#define  DBG(x...) do { } while (0)
-#endif
-
-/*
- * This routine builds either a type0 or type1 configuration command.  If the
- * bus is on the 803xx then a type0 made, else a type1 is created.
- */
-static u32 iop3xx_cfg_address(struct pci_bus *bus, int devfn, int where)
-{
-	struct pci_sys_data *sys = bus->sysdata;
-	u32 addr;
-
-	if (sys->busnr == bus->number)
-		addr = 1 << (PCI_SLOT(devfn) + 16) | (PCI_SLOT(devfn) << 11);
-	else
-		addr = bus->number << 16 | PCI_SLOT(devfn) << 11 | 1;
-
-	addr |=	PCI_FUNC(devfn) << 8 | (where & ~3);
-
-	return addr;
-}
-
-/*
- * This routine checks the status of the last configuration cycle.  If an error
- * was detected it returns a 1, else it returns a 0.  The errors being checked
- * are parity, master abort, target abort (master and target).  These types of
- * errors occur during a config cycle where there is no device, like during
- * the discovery stage.
- */
-static int iop3xx_pci_status(void)
-{
-	unsigned int status;
-	int ret = 0;
-
-	/*
-	 * Check the status registers.
-	 */
-	status = *IOP3XX_ATUSR;
-	if (status & 0xf900) {
-		DBG("\t\t\tPCI: P0 - status = 0x%08x\n", status);
-		*IOP3XX_ATUSR = status & 0xf900;
-		ret = 1;
-	}
-
-	status = *IOP3XX_ATUISR;
-	if (status & 0x679f) {
-		DBG("\t\t\tPCI: P1 - status = 0x%08x\n", status);
-		*IOP3XX_ATUISR = status & 0x679f;
-		ret = 1;
-	}
-
-	return ret;
-}
-
-/*
- * Simply write the address register and read the configuration
- * data.  Note that the 4 nops ensure that we are able to handle
- * a delayed abort (in theory.)
- */
-static u32 iop3xx_read(unsigned long addr)
-{
-	u32 val;
-
-	__asm__ __volatile__(
-		"str	%1, [%2]\n\t"
-		"ldr	%0, [%3]\n\t"
-		"nop\n\t"
-		"nop\n\t"
-		"nop\n\t"
-		"nop\n\t"
-		: "=r" (val)
-		: "r" (addr), "r" (IOP3XX_OCCAR), "r" (IOP3XX_OCCDR));
-
-	return val;
-}
-
-/*
- * The read routines must check the error status of the last configuration
- * cycle.  If there was an error, the routine returns all hex f's.
- */
-static int
-iop3xx_read_config(struct pci_bus *bus, unsigned int devfn, int where,
-		int size, u32 *value)
-{
-	unsigned long addr = iop3xx_cfg_address(bus, devfn, where);
-	u32 val = iop3xx_read(addr) >> ((where & 3) * 8);
-
-	if (iop3xx_pci_status())
-		val = 0xffffffff;
-
-	*value = val;
-
-	return PCIBIOS_SUCCESSFUL;
-}
-
-static int
-iop3xx_write_config(struct pci_bus *bus, unsigned int devfn, int where,
-		int size, u32 value)
-{
-	unsigned long addr = iop3xx_cfg_address(bus, devfn, where);
-	u32 val;
-
-	if (size != 4) {
-		val = iop3xx_read(addr);
-		if (iop3xx_pci_status())
-			return PCIBIOS_SUCCESSFUL;
-
-		where = (where & 3) * 8;
-
-		if (size == 1)
-			val &= ~(0xff << where);
-		else
-			val &= ~(0xffff << where);
-
-		*IOP3XX_OCCDR = val | value << where;
-	} else {
-		asm volatile(
-			"str	%1, [%2]\n\t"
-			"str	%0, [%3]\n\t"
-			"nop\n\t"
-			"nop\n\t"
-			"nop\n\t"
-			"nop\n\t"
-			:
-			: "r" (value), "r" (addr),
-			  "r" (IOP3XX_OCCAR), "r" (IOP3XX_OCCDR));
-	}
-
-	return PCIBIOS_SUCCESSFUL;
-}
-
-struct pci_ops iop3xx_ops = {
-	.read	= iop3xx_read_config,
-	.write	= iop3xx_write_config,
-};
-
-/*
- * When a PCI device does not exist during config cycles, the 80200 gets a
- * bus error instead of returning 0xffffffff. This handler simply returns.
- */
-static int
-iop3xx_pci_abort(unsigned long addr, unsigned int fsr, struct pt_regs *regs)
-{
-	DBG("PCI abort: address = 0x%08lx fsr = 0x%03x PC = 0x%08lx LR = 0x%08lx\n",
-		addr, fsr, regs->ARM_pc, regs->ARM_lr);
-
-	/*
-	 * If it was an imprecise abort, then we need to correct the
-	 * return address to be _after_ the instruction.
-	 */
-	if (fsr & (1 << 10))
-		regs->ARM_pc += 4;
-
-	return 0;
-}
-
-int iop3xx_pci_setup(int nr, struct pci_sys_data *sys)
-{
-	struct resource *res;
-	struct resource realio;
-
-	if (nr != 0)
-		return 0;
-
-	res = kzalloc(sizeof(struct resource), GFP_KERNEL);
-	if (!res)
-		panic("PCI: unable to alloc resources");
-
-	res->start = IOP3XX_PCI_LOWER_MEM_PA;
-	res->end   = IOP3XX_PCI_LOWER_MEM_PA + IOP3XX_PCI_MEM_WINDOW_SIZE - 1;
-	res->name  = "IOP3XX PCI Memory Space";
-	res->flags = IORESOURCE_MEM;
-	request_resource(&iomem_resource, res);
-
-	/*
-	 * Use whatever translation is already setup.
-	 */
-	sys->mem_offset = IOP3XX_PCI_LOWER_MEM_PA - *IOP3XX_OMWTVR0;
-
-	pci_add_resource_offset(&sys->resources, res, sys->mem_offset);
-
-	realio.start = 0;
-	realio.end = realio.start + SZ_64K - 1;
-	pci_remap_iospace(&realio, IOP3XX_PCI_LOWER_IO_PA);
-
-	return 1;
-}
-
-void __init iop3xx_atu_setup(void)
-{
-	/* BAR 0 ( Disabled ) */
-	*IOP3XX_IAUBAR0 = 0x0;
-	*IOP3XX_IABAR0  = 0x0;
-	*IOP3XX_IATVR0  = 0x0;
-	*IOP3XX_IALR0   = 0x0;
-
-	/* BAR 1 ( Disabled ) */
-	*IOP3XX_IAUBAR1 = 0x0;
-	*IOP3XX_IABAR1  = 0x0;
-	*IOP3XX_IALR1   = 0x0;
-
-	/* BAR 2 (1:1 mapping with Physical RAM) */
-	/* Set limit and enable */
-	*IOP3XX_IALR2 = ~((u32)IOP3XX_MAX_RAM_SIZE - 1) & ~0x1;
-	*IOP3XX_IAUBAR2 = 0x0;
-
-	/* Align the inbound bar with the base of memory */
-	*IOP3XX_IABAR2 = PHYS_OFFSET |
-			       PCI_BASE_ADDRESS_MEM_TYPE_64 |
-			       PCI_BASE_ADDRESS_MEM_PREFETCH;
-
-	*IOP3XX_IATVR2 = PHYS_OFFSET;
-
-	/* Outbound window 0 */
-	*IOP3XX_OMWTVR0 = IOP3XX_PCI_LOWER_MEM_BA;
-	*IOP3XX_OUMWTVR0 = 0;
-
-	/* Outbound window 1 */
-	*IOP3XX_OMWTVR1 = IOP3XX_PCI_LOWER_MEM_BA +
-			  IOP3XX_PCI_MEM_WINDOW_SIZE / 2;
-	*IOP3XX_OUMWTVR1 = 0;
-
-	/* BAR 3 ( Disabled ) */
-	*IOP3XX_IAUBAR3 = 0x0;
-	*IOP3XX_IABAR3  = 0x0;
-	*IOP3XX_IATVR3  = 0x0;
-	*IOP3XX_IALR3   = 0x0;
-
-	/* Setup the I/O Bar
-	 */
-	*IOP3XX_OIOWTVR = IOP3XX_PCI_LOWER_IO_BA;
-
-	/* Enable inbound and outbound cycles
-	 */
-	*IOP3XX_ATUCMD |= PCI_COMMAND_MEMORY | PCI_COMMAND_MASTER |
-			       PCI_COMMAND_PARITY | PCI_COMMAND_SERR;
-	*IOP3XX_ATUCR |= IOP3XX_ATUCR_OUT_EN;
-}
-
-void __init iop3xx_atu_disable(void)
-{
-	*IOP3XX_ATUCMD = 0;
-	*IOP3XX_ATUCR = 0;
-
-	/* wait for cycles to quiesce */
-	while (*IOP3XX_PCSR & (IOP3XX_PCSR_OUT_Q_BUSY |
-				     IOP3XX_PCSR_IN_Q_BUSY))
-		cpu_relax();
-
-	/* BAR 0 ( Disabled ) */
-	*IOP3XX_IAUBAR0 = 0x0;
-	*IOP3XX_IABAR0  = 0x0;
-	*IOP3XX_IATVR0  = 0x0;
-	*IOP3XX_IALR0   = 0x0;
-
-	/* BAR 1 ( Disabled ) */
-	*IOP3XX_IAUBAR1 = 0x0;
-	*IOP3XX_IABAR1  = 0x0;
-	*IOP3XX_IALR1   = 0x0;
-
-	/* BAR 2 ( Disabled ) */
-	*IOP3XX_IAUBAR2 = 0x0;
-	*IOP3XX_IABAR2  = 0x0;
-	*IOP3XX_IATVR2  = 0x0;
-	*IOP3XX_IALR2   = 0x0;
-
-	/* BAR 3 ( Disabled ) */
-	*IOP3XX_IAUBAR3 = 0x0;
-	*IOP3XX_IABAR3  = 0x0;
-	*IOP3XX_IATVR3  = 0x0;
-	*IOP3XX_IALR3   = 0x0;
-
-	/* Clear the outbound windows */
-	*IOP3XX_OIOWTVR  = 0;
-
-	/* Outbound window 0 */
-	*IOP3XX_OMWTVR0 = 0;
-	*IOP3XX_OUMWTVR0 = 0;
-
-	/* Outbound window 1 */
-	*IOP3XX_OMWTVR1 = 0;
-	*IOP3XX_OUMWTVR1 = 0;
-}
-
-/* Flag to determine whether the ATU is initialized and the PCI bus scanned */
-int init_atu;
-
-int iop3xx_get_init_atu(void) {
-	/* check if default has been overridden */
-	if (init_atu != IOP3XX_INIT_ATU_DEFAULT)
-		return init_atu;
-	else
-		return IOP3XX_INIT_ATU_DISABLE;
-}
-
-static void __init iop3xx_atu_debug(void)
-{
-	DBG("PCI: Intel IOP3xx PCI init.\n");
-	DBG("PCI: Outbound memory window 0: PCI 0x%08x%08x\n",
-		*IOP3XX_OUMWTVR0, *IOP3XX_OMWTVR0);
-	DBG("PCI: Outbound memory window 1: PCI 0x%08x%08x\n",
-		*IOP3XX_OUMWTVR1, *IOP3XX_OMWTVR1);
-	DBG("PCI: Outbound IO window: PCI 0x%08x\n",
-		*IOP3XX_OIOWTVR);
-
-	DBG("PCI: Inbound memory window 0: PCI 0x%08x%08x 0x%08x -> 0x%08x\n",
-		*IOP3XX_IAUBAR0, *IOP3XX_IABAR0, *IOP3XX_IALR0, *IOP3XX_IATVR0);
-	DBG("PCI: Inbound memory window 1: PCI 0x%08x%08x 0x%08x\n",
-		*IOP3XX_IAUBAR1, *IOP3XX_IABAR1, *IOP3XX_IALR1);
-	DBG("PCI: Inbound memory window 2: PCI 0x%08x%08x 0x%08x -> 0x%08x\n",
-		*IOP3XX_IAUBAR2, *IOP3XX_IABAR2, *IOP3XX_IALR2, *IOP3XX_IATVR2);
-	DBG("PCI: Inbound memory window 3: PCI 0x%08x%08x 0x%08x -> 0x%08x\n",
-		*IOP3XX_IAUBAR3, *IOP3XX_IABAR3, *IOP3XX_IALR3, *IOP3XX_IATVR3);
-
-	DBG("PCI: Expansion ROM window: PCI 0x%08x%08x 0x%08x -> 0x%08x\n",
-		0, *IOP3XX_ERBAR, *IOP3XX_ERLR, *IOP3XX_ERTVR);
-
-	DBG("ATU: IOP3XX_ATUCMD=0x%04x\n", *IOP3XX_ATUCMD);
-	DBG("ATU: IOP3XX_ATUCR=0x%08x\n", *IOP3XX_ATUCR);
-
-	hook_fault_code(16+6, iop3xx_pci_abort, SIGBUS, 0, "imprecise external abort");
-}
-
-/* for platforms that might be host-bus-adapters */
-void __init iop3xx_pci_preinit_cond(void)
-{
-	if (iop3xx_get_init_atu() == IOP3XX_INIT_ATU_ENABLE) {
-		iop3xx_atu_disable();
-		iop3xx_atu_setup();
-		iop3xx_atu_debug();
-	}
-}
-
-void __init iop3xx_pci_preinit(void)
-{
-	pcibios_min_mem = 0;
-
-	iop3xx_atu_disable();
-	iop3xx_atu_setup();
-	iop3xx_atu_debug();
-}
-
-/* allow init_atu to be user overridden */
-static int __init iop3xx_init_atu_setup(char *str)
-{
-	init_atu = IOP3XX_INIT_ATU_DEFAULT;
-	if (str) {
-		while (*str != '\0') {
-			switch (*str) {
-			case 'y':
-			case 'Y':
-				init_atu = IOP3XX_INIT_ATU_ENABLE;
-				break;
-			case 'n':
-			case 'N':
-				init_atu = IOP3XX_INIT_ATU_DISABLE;
-				break;
-			case ',':
-			case '=':
-				break;
-			default:
-				printk(KERN_DEBUG "\"%s\" malformed at "
-					    "character: \'%c\'",
-					    __func__,
-					    *str);
-				*(str + 1) = '\0';
-			}
-			str++;
-		}
-	}
-
-	return 1;
-}
-
-__setup("iop3xx_init_atu", iop3xx_init_atu_setup);
-
diff --git a/arch/arm/mach-iop32x/pmu.c b/arch/arm/mach-iop32x/pmu.c
deleted file mode 100644
index bdbc7a3cb8a3..000000000000
--- a/arch/arm/mach-iop32x/pmu.c
+++ /dev/null
@@ -1,29 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * PMU IRQ registration for the iop3xx xscale PMU families.
- * Copyright (C) 2010 Will Deacon, ARM Ltd.
- */
-
-#include <linux/platform_device.h>
-#include "irqs.h"
-
-static struct resource pmu_resource = {
-	.start	= IRQ_IOP32X_CORE_PMU,
-	.end	= IRQ_IOP32X_CORE_PMU,
-	.flags	= IORESOURCE_IRQ,
-};
-
-static struct platform_device pmu_device = {
-	.name		= "xscale-pmu",
-	.id		= -1,
-	.resource	= &pmu_resource,
-	.num_resources	= 1,
-};
-
-static int __init iop3xx_pmu_init(void)
-{
-	platform_device_register(&pmu_device);
-	return 0;
-}
-
-arch_initcall(iop3xx_pmu_init);
diff --git a/arch/arm/mach-iop32x/restart.c b/arch/arm/mach-iop32x/restart.c
deleted file mode 100644
index 3dfa54d3a7a8..000000000000
--- a/arch/arm/mach-iop32x/restart.c
+++ /dev/null
@@ -1,17 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * restart.c
- *
- * Copyright (C) 2001 MontaVista Software, Inc.
- */
-#include <asm/system_misc.h>
-#include "hardware.h"
-#include "iop3xx.h"
-
-void iop3xx_restart(enum reboot_mode mode, const char *cmd)
-{
-	*IOP3XX_PCSR = 0x30;
-
-	/* Jump into ROM at address 0 */
-	soft_restart(0);
-}
diff --git a/arch/arm/mach-iop32x/setup.c b/arch/arm/mach-iop32x/setup.c
deleted file mode 100644
index a0a81c28a632..000000000000
--- a/arch/arm/mach-iop32x/setup.c
+++ /dev/null
@@ -1,31 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * arch/arm/plat-iop/setup.c
- *
- * Author: Nicolas Pitre <nico@fluxnic.net>
- * Copyright (C) 2001 MontaVista Software, Inc.
- * Copyright (C) 2004 Intel Corporation.
- */
-
-#include <linux/mm.h>
-#include <linux/init.h>
-#include <asm/mach/map.h>
-#include "iop3xx.h"
-
-/*
- * Standard IO mapping for all IOP3xx based systems.  Note that
- * the IOP3xx OCCDR must be mapped uncached and unbuffered.
- */
-static struct map_desc iop3xx_std_desc[] __initdata = {
-	{	/* mem mapped registers */
-		.virtual	= IOP3XX_PERIPHERAL_VIRT_BASE,
-		.pfn		= __phys_to_pfn(IOP3XX_PERIPHERAL_PHYS_BASE),
-		.length		= IOP3XX_PERIPHERAL_SIZE,
-		.type		= MT_UNCACHED,
-	},
-};
-
-void __init iop3xx_map_io(void)
-{
-	iotable_init(iop3xx_std_desc, ARRAY_SIZE(iop3xx_std_desc));
-}
diff --git a/arch/arm/mach-iop32x/time.c b/arch/arm/mach-iop32x/time.c
deleted file mode 100644
index ae533b66fefd..000000000000
--- a/arch/arm/mach-iop32x/time.c
+++ /dev/null
@@ -1,179 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * arch/arm/plat-iop/time.c
- *
- * Timer code for IOP32x and IOP33x based systems
- *
- * Author: Deepak Saxena <dsaxena@mvista.com>
- *
- * Copyright 2002-2003 MontaVista Software Inc.
- */
-
-#include <linux/kernel.h>
-#include <linux/interrupt.h>
-#include <linux/time.h>
-#include <linux/init.h>
-#include <linux/timex.h>
-#include <linux/io.h>
-#include <linux/clocksource.h>
-#include <linux/clockchips.h>
-#include <linux/export.h>
-#include <linux/sched_clock.h>
-#include <asm/irq.h>
-#include <linux/uaccess.h>
-#include <asm/mach/irq.h>
-#include <asm/mach/time.h>
-
-#include "hardware.h"
-#include "irqs.h"
-
-/*
- * Minimum clocksource/clockevent timer range in seconds
- */
-#define IOP_MIN_RANGE 4
-
-/*
- * IOP clocksource (free-running timer 1).
- */
-static u64 notrace iop_clocksource_read(struct clocksource *unused)
-{
-	return 0xffffffffu - read_tcr1();
-}
-
-static struct clocksource iop_clocksource = {
-	.name 		= "iop_timer1",
-	.rating		= 300,
-	.read		= iop_clocksource_read,
-	.mask		= CLOCKSOURCE_MASK(32),
-	.flags		= CLOCK_SOURCE_IS_CONTINUOUS,
-};
-
-/*
- * IOP sched_clock() implementation via its clocksource.
- */
-static u64 notrace iop_read_sched_clock(void)
-{
-	return 0xffffffffu - read_tcr1();
-}
-
-/*
- * IOP clockevents (interrupting timer 0).
- */
-static int iop_set_next_event(unsigned long delta,
-			      struct clock_event_device *unused)
-{
-	u32 tmr = IOP_TMR_PRIVILEGED | IOP_TMR_RATIO_1_1;
-
-	BUG_ON(delta == 0);
-	write_tmr0(tmr & ~(IOP_TMR_EN | IOP_TMR_RELOAD));
-	write_tcr0(delta);
-	write_tmr0((tmr & ~IOP_TMR_RELOAD) | IOP_TMR_EN);
-
-	return 0;
-}
-
-static unsigned long ticks_per_jiffy;
-
-static int iop_set_periodic(struct clock_event_device *evt)
-{
-	u32 tmr = read_tmr0();
-
-	write_tmr0(tmr & ~IOP_TMR_EN);
-	write_tcr0(ticks_per_jiffy - 1);
-	write_trr0(ticks_per_jiffy - 1);
-	tmr |= (IOP_TMR_RELOAD | IOP_TMR_EN);
-
-	write_tmr0(tmr);
-	return 0;
-}
-
-static int iop_set_oneshot(struct clock_event_device *evt)
-{
-	u32 tmr = read_tmr0();
-
-	/* ->set_next_event sets period and enables timer */
-	tmr &= ~(IOP_TMR_RELOAD | IOP_TMR_EN);
-	write_tmr0(tmr);
-	return 0;
-}
-
-static int iop_shutdown(struct clock_event_device *evt)
-{
-	u32 tmr = read_tmr0();
-
-	tmr &= ~IOP_TMR_EN;
-	write_tmr0(tmr);
-	return 0;
-}
-
-static int iop_resume(struct clock_event_device *evt)
-{
-	u32 tmr = read_tmr0();
-
-	tmr |= IOP_TMR_EN;
-	write_tmr0(tmr);
-	return 0;
-}
-
-static struct clock_event_device iop_clockevent = {
-	.name			= "iop_timer0",
-	.features		= CLOCK_EVT_FEAT_PERIODIC |
-				  CLOCK_EVT_FEAT_ONESHOT,
-	.rating			= 300,
-	.set_next_event		= iop_set_next_event,
-	.set_state_shutdown	= iop_shutdown,
-	.set_state_periodic	= iop_set_periodic,
-	.tick_resume		= iop_resume,
-	.set_state_oneshot	= iop_set_oneshot,
-};
-
-static irqreturn_t
-iop_timer_interrupt(int irq, void *dev_id)
-{
-	struct clock_event_device *evt = dev_id;
-
-	write_tisr(1);
-	evt->event_handler(evt);
-	return IRQ_HANDLED;
-}
-
-static unsigned long iop_tick_rate;
-unsigned long get_iop_tick_rate(void)
-{
-	return iop_tick_rate;
-}
-EXPORT_SYMBOL(get_iop_tick_rate);
-
-void __init iop_init_time(unsigned long tick_rate)
-{
-	u32 timer_ctl;
-	int irq = IRQ_IOP32X_TIMER0;
-
-	sched_clock_register(iop_read_sched_clock, 32, tick_rate);
-
-	ticks_per_jiffy = DIV_ROUND_CLOSEST(tick_rate, HZ);
-	iop_tick_rate = tick_rate;
-
-	timer_ctl = IOP_TMR_EN | IOP_TMR_PRIVILEGED |
-			IOP_TMR_RELOAD | IOP_TMR_RATIO_1_1;
-
-	/*
-	 * Set up interrupting clockevent timer 0.
-	 */
-	write_tmr0(timer_ctl & ~IOP_TMR_EN);
-	write_tisr(1);
-	if (request_irq(irq, iop_timer_interrupt, IRQF_TIMER | IRQF_IRQPOLL,
-			"IOP Timer Tick", &iop_clockevent))
-		pr_err("Failed to request irq() %d (IOP Timer Tick)\n", irq);
-	iop_clockevent.cpumask = cpumask_of(0);
-	clockevents_config_and_register(&iop_clockevent, tick_rate,
-					0xf, 0xfffffffe);
-
-	/*
-	 * Set up free-running clocksource timer 1.
-	 */
-	write_trr1(0xffffffff);
-	write_tcr1(0xffffffff);
-	write_tmr1(timer_ctl);
-	clocksource_register_hz(&iop_clocksource, tick_rate);
-}
diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 264e780ae32e..e488e1b8e803 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -723,11 +723,11 @@ config I2C_IMX_LPI2C
 	  will be called i2c-imx-lpi2c.
 
 config I2C_IOP3XX
-	tristate "Intel IOPx3xx and IXP4xx on-chip I2C interface"
-	depends on ARCH_IOP32X || ARCH_IXP4XX || COMPILE_TEST
+	tristate "Intel IXP4xx on-chip I2C interface"
+	depends on ARCH_IXP4XX || COMPILE_TEST
 	help
 	  Say Y here if you want to use the IIC bus controller on
-	  the Intel IOPx3xx I/O Processors or IXP4xx Network Processors.
+	  the Intel IXP4xx Network Processors.
 
 	  This driver can also be built as a module.  If so, the module
 	  will be called i2c-iop3xx.
-- 
2.29.2

