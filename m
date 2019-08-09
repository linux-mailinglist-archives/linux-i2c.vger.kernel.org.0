Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F263288028
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Aug 2019 18:34:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437257AbfHIQeS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 9 Aug 2019 12:34:18 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:59139 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726516AbfHIQeS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 9 Aug 2019 12:34:18 -0400
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.129]) with ESMTPA (Nemesis) id
 1MeCd5-1iUMvQ1qyt-00bNEQ; Fri, 09 Aug 2019 18:33:59 +0200
From:   Arnd Bergmann <arnd@arndb.de>
To:     soc@kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Russell King <linux@armlinux.org.uk>,
        Dan Williams <dan.j.williams@intel.com>,
        Vinod Koul <vkoul@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org
Subject: [PATCH 7/7] ARM: iop32x: merge everything into mach-iop32x/
Date:   Fri,  9 Aug 2019 18:33:21 +0200
Message-Id: <20190809163334.489360-7-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190809163334.489360-1-arnd@arndb.de>
References: <20190809162956.488941-1-arnd@arndb.de>
 <20190809163334.489360-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:vGdFETC8T6cVfKFAfP5qqphwVXYITl9uUg+E0rFaHju/C++Ve44
 mq/wBYbKOaR6GOIaaWELrDC7SW5dHg2I2f77JfKDAgbR9ck1v6uvFTOHerR+ZpptN1QaQCy
 WUDQzNkVZRcZn+T6SRJPYCuU+7XYIza1usj/Y8qyz6+VrocONqGG0dVhCiGPDecYyKptSkX
 dtxCB1zQMsUXrrIlsubGg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:1yU16ztvtR8=:tXGRaN2lEuQaRQ3YDneIIs
 rdkp6z7Jidn7tCD1WJs0scbdrf5bjVZpyuLa4OGVr3e1H62cuDCbw1qWfyNhOtu7HHvinb/4b
 8Axo1XQRbz5cU/EDNnpO//0wdyY+AHqCPE2JhBzomQPiNeL+OKIie8O3a9P6RU45hjPxiWHiX
 PfDS0MvKGsDAwlbbPc42wcztYT5lxVYdW77EHG3tJ6qxaoPS2hCqVLdOoJgs45MaxshTO5jW8
 OeBrd8gGyv0J9QHg/KMFKle1C3PGZiQnXSMp1ESrExC4PDVpBMoE/Oog5gMh8pdbEmfc2fjH6
 m88CqcLscoENzE4EhplWmr+OYh/hkrnRh3M9QtuaZLMLyxTVOC+7f/s28cKqdd7Vhvt6sHF5y
 aY73IZN+ciYY0cQO1HWjyb+iHVs9sO1IEbnOzwY6tNhr04zgOdx1myL4IvGFreBQ350MLNmyN
 znF3PfO9bUsyVUC8LzRIy2e/0lCpIYm6NqkonQdXQzX7SNqkzB07ViIvZR79lL5m9m1VxlDlR
 EU6VVGbwpcHkpt0VQ+Ub02WBSTBS17fwLrkFSHt9fkhWepPMYIBkbV6jDiu+1Lnu9MdyD0/I2
 xmzqYT4zfWXY8Yv+xGgflLLJqK5hraBT4mfZyT/8haiAv2CClu/tSEGeXu9T/hjNISMns1ZFu
 9anibrnKlTD+wvYgpK/gIaVcehn2S53FKNuQgr5wIj4jWgCndOvzE7KC27phRT95QfNnno0e2
 hdXTD9i+8E3equE0gnw5/fjCo/jranU2IZLMJe0MBUOXpyT3AQfdkj1dlcw=
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Various bits of iop32x are now in their traditional locations in plat-iop,
mach-iop/include/mach/ and in include/asm/mach/hardware. As nothing
outside of the iop32x mach code references these any more, this can all
be moved into one place now.

The only remaining things in the include/mach/ directory are now the
NR_IRQS definition, the entry-macros.S file and the the decompressor
uart access. After the irqchip code has been converted to SPARSE_IRQ
and GENERIC_IRQ_MULTI_HANDLER, it can be moved to ARCH_MULTIPLATFORM.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/Makefile                             |  1 -
 arch/arm/mach-iop32x/Makefile                 | 10 ++++-
 arch/arm/{plat-iop => mach-iop32x}/adma.c     |  4 +-
 arch/arm/{plat-iop => mach-iop32x}/cp6.c      |  0
 arch/arm/mach-iop32x/em7210.c                 |  5 ++-
 arch/arm/mach-iop32x/glantank.c               |  5 ++-
 .../mach-iop32x/{include/mach => }/glantank.h |  2 -
 .../mach-iop32x/{include/mach => }/hardware.h |  6 +--
 arch/arm/{plat-iop => mach-iop32x}/i2c.c      |  6 ++-
 .../mach-iop32x/include/mach/entry-macro.S    |  2 -
 arch/arm/mach-iop32x/include/mach/iop32x.h    | 31 --------------
 arch/arm/mach-iop32x/include/mach/irqs.h      | 33 ---------------
 arch/arm/mach-iop32x/include/mach/time.h      |  5 ---
 .../asm/hardware => mach-iop32x}/iop3xx.h     | 18 +++++++-
 arch/arm/mach-iop32x/iq31244.c                |  5 ++-
 .../mach-iop32x/{include/mach => }/iq31244.h  |  2 -
 arch/arm/mach-iop32x/iq80321.c                |  5 ++-
 .../mach-iop32x/{include/mach => }/iq80321.h  |  2 -
 arch/arm/mach-iop32x/irq.c                    |  3 +-
 arch/arm/mach-iop32x/irqs.h                   | 42 +++++++++++++++++++
 arch/arm/mach-iop32x/n2100.c                  |  5 ++-
 .../mach-iop32x/{include/mach => }/n2100.h    |  2 -
 arch/arm/{plat-iop => mach-iop32x}/pci.c      |  4 +-
 arch/arm/{plat-iop => mach-iop32x}/pmu.c      |  2 +-
 arch/arm/{plat-iop => mach-iop32x}/restart.c  |  4 +-
 arch/arm/{plat-iop => mach-iop32x}/setup.c    |  2 +-
 arch/arm/{plat-iop => mach-iop32x}/time.c     |  7 ++--
 arch/arm/plat-iop/Makefile                    | 14 -------
 28 files changed, 102 insertions(+), 125 deletions(-)
 rename arch/arm/{plat-iop => mach-iop32x}/adma.c (98%)
 rename arch/arm/{plat-iop => mach-iop32x}/cp6.c (100%)
 rename arch/arm/mach-iop32x/{include/mach => }/glantank.h (78%)
 rename arch/arm/mach-iop32x/{include/mach => }/hardware.h (90%)
 rename arch/arm/{plat-iop => mach-iop32x}/i2c.c (96%)
 delete mode 100644 arch/arm/mach-iop32x/include/mach/iop32x.h
 delete mode 100644 arch/arm/mach-iop32x/include/mach/time.h
 rename arch/arm/{include/asm/hardware => mach-iop32x}/iop3xx.h (96%)
 rename arch/arm/mach-iop32x/{include/mach => }/iq31244.h (89%)
 rename arch/arm/mach-iop32x/{include/mach => }/iq80321.h (89%)
 create mode 100644 arch/arm/mach-iop32x/irqs.h
 rename arch/arm/mach-iop32x/{include/mach => }/n2100.h (89%)
 rename arch/arm/{plat-iop => mach-iop32x}/pci.c (99%)
 rename arch/arm/{plat-iop => mach-iop32x}/pmu.c (96%)
 rename arch/arm/{plat-iop => mach-iop32x}/restart.c (82%)
 rename arch/arm/{plat-iop => mach-iop32x}/setup.c (95%)
 rename arch/arm/{plat-iop => mach-iop32x}/time.c (97%)
 delete mode 100644 arch/arm/plat-iop/Makefile

diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index d92bc5328df7..075dd2f06d78 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -231,7 +231,6 @@ plat-$(CONFIG_ARCH_EXYNOS)	+= samsung
 plat-$(CONFIG_ARCH_OMAP)	+= omap
 plat-$(CONFIG_ARCH_S3C64XX)	+= samsung
 plat-$(CONFIG_ARCH_S5PV210)	+= samsung
-plat-$(CONFIG_PLAT_IOP)		+= iop
 plat-$(CONFIG_PLAT_ORION)	+= orion
 plat-$(CONFIG_PLAT_PXA)		+= pxa
 plat-$(CONFIG_PLAT_S3C24XX)	+= samsung
diff --git a/arch/arm/mach-iop32x/Makefile b/arch/arm/mach-iop32x/Makefile
index 71d62447d4d5..c8018ef5c6a9 100644
--- a/arch/arm/mach-iop32x/Makefile
+++ b/arch/arm/mach-iop32x/Makefile
@@ -3,7 +3,15 @@
 # Makefile for the linux kernel.
 #
 
-obj-y			:= irq.o
+obj-$(CONFIG_ARCH_IOP32X) += irq.o
+obj-$(CONFIG_ARCH_IOP32X) += i2c.o
+obj-$(CONFIG_ARCH_IOP32X) += pci.o
+obj-$(CONFIG_ARCH_IOP32X) += setup.o
+obj-$(CONFIG_ARCH_IOP32X) += time.o
+obj-$(CONFIG_ARCH_IOP32X) += cp6.o
+obj-$(CONFIG_ARCH_IOP32X) += adma.o
+obj-$(CONFIG_ARCH_IOP32X) += pmu.o
+obj-$(CONFIG_ARCH_IOP32X) += restart.o
 
 obj-$(CONFIG_MACH_GLANTANK) += glantank.o
 obj-$(CONFIG_ARCH_IQ80321) += iq80321.o
diff --git a/arch/arm/plat-iop/adma.c b/arch/arm/mach-iop32x/adma.c
similarity index 98%
rename from arch/arm/plat-iop/adma.c
rename to arch/arm/mach-iop32x/adma.c
index 601cc9c11b07..764bcbff98df 100644
--- a/arch/arm/plat-iop/adma.c
+++ b/arch/arm/mach-iop32x/adma.c
@@ -4,10 +4,12 @@
  * Copyright © 2006, Intel Corporation.
  */
 #include <linux/platform_device.h>
-#include <asm/hardware/iop3xx.h>
 #include <linux/dma-mapping.h>
 #include <linux/platform_data/dma-iop32x.h>
 
+#include "iop3xx.h"
+#include "irqs.h"
+
 #define IRQ_DMA0_EOT IRQ_IOP32X_DMA0_EOT
 #define IRQ_DMA0_EOC IRQ_IOP32X_DMA0_EOC
 #define IRQ_DMA0_ERR IRQ_IOP32X_DMA0_ERR
diff --git a/arch/arm/plat-iop/cp6.c b/arch/arm/mach-iop32x/cp6.c
similarity index 100%
rename from arch/arm/plat-iop/cp6.c
rename to arch/arm/mach-iop32x/cp6.c
diff --git a/arch/arm/mach-iop32x/em7210.c b/arch/arm/mach-iop32x/em7210.c
index 61a1e593f9ec..d43ced3cd4e7 100644
--- a/arch/arm/mach-iop32x/em7210.c
+++ b/arch/arm/mach-iop32x/em7210.c
@@ -21,7 +21,6 @@
 #include <linux/i2c.h>
 #include <linux/gpio.h>
 #include <linux/gpio/machine.h>
-#include <mach/hardware.h>
 #include <linux/io.h>
 #include <linux/irq.h>
 #include <asm/mach/arch.h>
@@ -29,8 +28,10 @@
 #include <asm/mach/pci.h>
 #include <asm/mach/time.h>
 #include <asm/mach-types.h>
-#include <mach/time.h>
+
+#include "hardware.h"
 #include "gpio-iop32x.h"
+#include "irqs.h"
 
 static void __init em7210_timer_init(void)
 {
diff --git a/arch/arm/mach-iop32x/glantank.c b/arch/arm/mach-iop32x/glantank.c
index 5a45d616d9ac..2fe0f77d1f1d 100644
--- a/arch/arm/mach-iop32x/glantank.c
+++ b/arch/arm/mach-iop32x/glantank.c
@@ -22,7 +22,6 @@
 #include <linux/platform_device.h>
 #include <linux/io.h>
 #include <linux/gpio/machine.h>
-#include <mach/hardware.h>
 #include <asm/irq.h>
 #include <asm/mach/arch.h>
 #include <asm/mach/map.h>
@@ -30,8 +29,10 @@
 #include <asm/mach/time.h>
 #include <asm/mach-types.h>
 #include <asm/page.h>
-#include <mach/time.h>
+
+#include "hardware.h"
 #include "gpio-iop32x.h"
+#include "irqs.h"
 
 /*
  * GLAN Tank timer tick configuration.
diff --git a/arch/arm/mach-iop32x/include/mach/glantank.h b/arch/arm/mach-iop32x/glantank.h
similarity index 78%
rename from arch/arm/mach-iop32x/include/mach/glantank.h
rename to arch/arm/mach-iop32x/glantank.h
index b9df2e4614cf..f38e86b82c3d 100644
--- a/arch/arm/mach-iop32x/include/mach/glantank.h
+++ b/arch/arm/mach-iop32x/glantank.h
@@ -1,7 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /*
- * arch/arm/mach-iop32x/include/mach/glantank.h
- *
  * IO-Data GLAN Tank board registers
  */
 
diff --git a/arch/arm/mach-iop32x/include/mach/hardware.h b/arch/arm/mach-iop32x/hardware.h
similarity index 90%
rename from arch/arm/mach-iop32x/include/mach/hardware.h
rename to arch/arm/mach-iop32x/hardware.h
index 6e5303e60226..43ab4fb8f9b0 100644
--- a/arch/arm/mach-iop32x/include/mach/hardware.h
+++ b/arch/arm/mach-iop32x/hardware.h
@@ -1,8 +1,4 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-/*
- * arch/arm/mach-iop32x/include/mach/hardware.h
- */
-
 #ifndef __HARDWARE_H
 #define __HARDWARE_H
 
@@ -28,7 +24,7 @@ void iop32x_init_irq(void);
 /*
  * Generic chipset bits
  */
-#include "iop32x.h"
+#include "iop3xx.h"
 
 /*
  * Board specific bits
diff --git a/arch/arm/plat-iop/i2c.c b/arch/arm/mach-iop32x/i2c.c
similarity index 96%
rename from arch/arm/plat-iop/i2c.c
rename to arch/arm/mach-iop32x/i2c.c
index 8d5fe349c7cd..dc9f6a14ab1b 100644
--- a/arch/arm/plat-iop/i2c.c
+++ b/arch/arm/mach-iop32x/i2c.c
@@ -22,10 +22,12 @@
 #include <asm/mach/map.h>
 #include <asm/setup.h>
 #include <asm/memory.h>
-#include <mach/hardware.h>
-#include <asm/hardware/iop3xx.h>
 #include <asm/mach/arch.h>
 
+#include "hardware.h"
+#include "iop3xx.h"
+#include "irqs.h"
+
 /*
  * Each of the I2C busses have corresponding GPIO lines, and the driver
  * need to access these directly to drive the bus low at times.
diff --git a/arch/arm/mach-iop32x/include/mach/entry-macro.S b/arch/arm/mach-iop32x/include/mach/entry-macro.S
index ea13ae02d9b1..8e6766d4621e 100644
--- a/arch/arm/mach-iop32x/include/mach/entry-macro.S
+++ b/arch/arm/mach-iop32x/include/mach/entry-macro.S
@@ -7,8 +7,6 @@
  * License version 2. This program is licensed "as is" without any
  * warranty of any kind, whether express or implied.
  */
-#include <mach/iop32x.h>
-
 	.macro get_irqnr_preamble, base, tmp
 	mrc	p15, 0, \tmp, c15, c1, 0
 	orr	\tmp, \tmp, #(1 << 6)
diff --git a/arch/arm/mach-iop32x/include/mach/iop32x.h b/arch/arm/mach-iop32x/include/mach/iop32x.h
deleted file mode 100644
index 84223f86552f..000000000000
--- a/arch/arm/mach-iop32x/include/mach/iop32x.h
+++ /dev/null
@@ -1,31 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * arch/arm/mach-iop32x/include/mach/iop32x.h
- *
- * Intel IOP32X Chip definitions
- *
- * Author: Rory Bolt <rorybolt@pacbell.net>
- * Copyright (C) 2002 Rory Bolt
- * Copyright (C) 2004 Intel Corp.
- */
-
-#ifndef __IOP32X_H
-#define __IOP32X_H
-
-/*
- * Peripherals that are shared between the iop32x and iop33x but
- * located at different addresses.
- */
-#define IOP3XX_TIMER_REG(reg)	(IOP3XX_PERIPHERAL_VIRT_BASE + 0x07e0 + (reg))
-
-#include <asm/hardware/iop3xx.h>
-
-/* ATU Parameters
- * set up a 1:1 bus to physical ram relationship
- * w/ physical ram on top of pci in the memory map
- */
-#define IOP32X_MAX_RAM_SIZE            0x40000000UL
-#define IOP3XX_MAX_RAM_SIZE            IOP32X_MAX_RAM_SIZE
-#define IOP3XX_PCI_LOWER_MEM_BA        0x80000000
-
-#endif
diff --git a/arch/arm/mach-iop32x/include/mach/irqs.h b/arch/arm/mach-iop32x/include/mach/irqs.h
index 82b11743e91c..c4e78df428e8 100644
--- a/arch/arm/mach-iop32x/include/mach/irqs.h
+++ b/arch/arm/mach-iop32x/include/mach/irqs.h
@@ -9,39 +9,6 @@
 #ifndef __IRQS_H
 #define __IRQS_H
 
-/*
- * IOP80321 chipset interrupts
- */
-#define IRQ_IOP32X_DMA0_EOT	0
-#define IRQ_IOP32X_DMA0_EOC	1
-#define IRQ_IOP32X_DMA1_EOT	2
-#define IRQ_IOP32X_DMA1_EOC	3
-#define IRQ_IOP32X_AA_EOT	6
-#define IRQ_IOP32X_AA_EOC	7
-#define IRQ_IOP32X_CORE_PMON	8
-#define IRQ_IOP32X_TIMER0	9
-#define IRQ_IOP32X_TIMER1	10
-#define IRQ_IOP32X_I2C_0	11
-#define IRQ_IOP32X_I2C_1	12
-#define IRQ_IOP32X_MESSAGING	13
-#define IRQ_IOP32X_ATU_BIST	14
-#define IRQ_IOP32X_PERFMON	15
-#define IRQ_IOP32X_CORE_PMU	16
-#define IRQ_IOP32X_BIU_ERR	17
-#define IRQ_IOP32X_ATU_ERR	18
-#define IRQ_IOP32X_MCU_ERR	19
-#define IRQ_IOP32X_DMA0_ERR	20
-#define IRQ_IOP32X_DMA1_ERR	21
-#define IRQ_IOP32X_AA_ERR	23
-#define IRQ_IOP32X_MSG_ERR	24
-#define IRQ_IOP32X_SSP		25
-#define IRQ_IOP32X_XINT0	27
-#define IRQ_IOP32X_XINT1	28
-#define IRQ_IOP32X_XINT2	29
-#define IRQ_IOP32X_XINT3	30
-#define IRQ_IOP32X_HPI		31
-
 #define NR_IRQS			32
 
-
 #endif
diff --git a/arch/arm/mach-iop32x/include/mach/time.h b/arch/arm/mach-iop32x/include/mach/time.h
deleted file mode 100644
index d08950ccebc4..000000000000
--- a/arch/arm/mach-iop32x/include/mach/time.h
+++ /dev/null
@@ -1,5 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _IOP32X_TIME_H_
-#define _IOP32X_TIME_H_
-#define IRQ_IOP_TIMER0 IRQ_IOP32X_TIMER0
-#endif
diff --git a/arch/arm/include/asm/hardware/iop3xx.h b/arch/arm/mach-iop32x/iop3xx.h
similarity index 96%
rename from arch/arm/include/asm/hardware/iop3xx.h
rename to arch/arm/mach-iop32x/iop3xx.h
index 3cb6f22f510b..46b4b34a4ad2 100644
--- a/arch/arm/include/asm/hardware/iop3xx.h
+++ b/arch/arm/mach-iop32x/iop3xx.h
@@ -1,7 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * arch/arm/include/asm/hardware/iop3xx.h
- *
  * Intel IOP32X and IOP33X register definitions
  *
  * Author: Rory Bolt <rorybolt@pacbell.net>
@@ -12,6 +10,22 @@
 #ifndef __IOP3XX_H
 #define __IOP3XX_H
 
+/*
+ * Peripherals that are shared between the iop32x and iop33x but
+ * located at different addresses.
+ */
+#define IOP3XX_TIMER_REG(reg)	(IOP3XX_PERIPHERAL_VIRT_BASE + 0x07e0 + (reg))
+
+#include "iop3xx.h"
+
+/* ATU Parameters
+ * set up a 1:1 bus to physical ram relationship
+ * w/ physical ram on top of pci in the memory map
+ */
+#define IOP32X_MAX_RAM_SIZE            0x40000000UL
+#define IOP3XX_MAX_RAM_SIZE            IOP32X_MAX_RAM_SIZE
+#define IOP3XX_PCI_LOWER_MEM_BA        0x80000000
+
 /*
  * IOP3XX GPIO handling
  */
diff --git a/arch/arm/mach-iop32x/iq31244.c b/arch/arm/mach-iop32x/iq31244.c
index 8755aa87e591..04a7d389d365 100644
--- a/arch/arm/mach-iop32x/iq31244.c
+++ b/arch/arm/mach-iop32x/iq31244.c
@@ -23,7 +23,6 @@
 #include <linux/platform_device.h>
 #include <linux/io.h>
 #include <linux/gpio/machine.h>
-#include <mach/hardware.h>
 #include <asm/cputype.h>
 #include <asm/irq.h>
 #include <asm/mach/arch.h>
@@ -33,7 +32,9 @@
 #include <asm/mach-types.h>
 #include <asm/page.h>
 #include <asm/pgtable.h>
-#include <mach/time.h>
+
+#include "hardware.h"
+#include "irqs.h"
 #include "gpio-iop32x.h"
 
 /*
diff --git a/arch/arm/mach-iop32x/include/mach/iq31244.h b/arch/arm/mach-iop32x/iq31244.h
similarity index 89%
rename from arch/arm/mach-iop32x/include/mach/iq31244.h
rename to arch/arm/mach-iop32x/iq31244.h
index e62da5da6ed4..a7ac691e48d3 100644
--- a/arch/arm/mach-iop32x/include/mach/iq31244.h
+++ b/arch/arm/mach-iop32x/iq31244.h
@@ -1,7 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /*
- * arch/arm/mach-iop32x/include/mach/iq31244.h
- *
  * Intel IQ31244 evaluation board registers
  */
 
diff --git a/arch/arm/mach-iop32x/iq80321.c b/arch/arm/mach-iop32x/iq80321.c
index e12699d1c540..4bd596d6c9c1 100644
--- a/arch/arm/mach-iop32x/iq80321.c
+++ b/arch/arm/mach-iop32x/iq80321.c
@@ -20,7 +20,6 @@
 #include <linux/platform_device.h>
 #include <linux/io.h>
 #include <linux/gpio/machine.h>
-#include <mach/hardware.h>
 #include <asm/irq.h>
 #include <asm/mach/arch.h>
 #include <asm/mach/map.h>
@@ -29,7 +28,9 @@
 #include <asm/mach-types.h>
 #include <asm/page.h>
 #include <asm/pgtable.h>
-#include <mach/time.h>
+
+#include "hardware.h"
+#include "irqs.h"
 #include "gpio-iop32x.h"
 
 /*
diff --git a/arch/arm/mach-iop32x/include/mach/iq80321.h b/arch/arm/mach-iop32x/iq80321.h
similarity index 89%
rename from arch/arm/mach-iop32x/include/mach/iq80321.h
rename to arch/arm/mach-iop32x/iq80321.h
index faf62c26f6f8..3a5d10626ea6 100644
--- a/arch/arm/mach-iop32x/include/mach/iq80321.h
+++ b/arch/arm/mach-iop32x/iq80321.h
@@ -1,7 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /*
- * arch/arm/mach-iop32x/include/mach/iq80321.h
- *
  * Intel IQ80321 evaluation board registers
  */
 
diff --git a/arch/arm/mach-iop32x/irq.c b/arch/arm/mach-iop32x/irq.c
index 2f5d4ec94f9c..2d48bf1398c1 100644
--- a/arch/arm/mach-iop32x/irq.c
+++ b/arch/arm/mach-iop32x/irq.c
@@ -13,9 +13,10 @@
 #include <linux/list.h>
 #include <asm/mach/irq.h>
 #include <asm/irq.h>
-#include <mach/hardware.h>
 #include <asm/mach-types.h>
 
+#include "hardware.h"
+
 static u32 iop32x_mask;
 
 static void intctl_write(u32 val)
diff --git a/arch/arm/mach-iop32x/irqs.h b/arch/arm/mach-iop32x/irqs.h
new file mode 100644
index 000000000000..69858e4e905d
--- /dev/null
+++ b/arch/arm/mach-iop32x/irqs.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Author:	Rory Bolt <rorybolt@pacbell.net>
+ * Copyright:	(C) 2002 Rory Bolt
+ */
+
+#ifndef __IOP32X_IRQS_H
+#define __IOP32X_IRQS_H
+
+/*
+ * IOP80321 chipset interrupts
+ */
+#define IRQ_IOP32X_DMA0_EOT	0
+#define IRQ_IOP32X_DMA0_EOC	1
+#define IRQ_IOP32X_DMA1_EOT	2
+#define IRQ_IOP32X_DMA1_EOC	3
+#define IRQ_IOP32X_AA_EOT	6
+#define IRQ_IOP32X_AA_EOC	7
+#define IRQ_IOP32X_CORE_PMON	8
+#define IRQ_IOP32X_TIMER0	9
+#define IRQ_IOP32X_TIMER1	10
+#define IRQ_IOP32X_I2C_0	11
+#define IRQ_IOP32X_I2C_1	12
+#define IRQ_IOP32X_MESSAGING	13
+#define IRQ_IOP32X_ATU_BIST	14
+#define IRQ_IOP32X_PERFMON	15
+#define IRQ_IOP32X_CORE_PMU	16
+#define IRQ_IOP32X_BIU_ERR	17
+#define IRQ_IOP32X_ATU_ERR	18
+#define IRQ_IOP32X_MCU_ERR	19
+#define IRQ_IOP32X_DMA0_ERR	20
+#define IRQ_IOP32X_DMA1_ERR	21
+#define IRQ_IOP32X_AA_ERR	23
+#define IRQ_IOP32X_MSG_ERR	24
+#define IRQ_IOP32X_SSP		25
+#define IRQ_IOP32X_XINT0	27
+#define IRQ_IOP32X_XINT1	28
+#define IRQ_IOP32X_XINT2	29
+#define IRQ_IOP32X_XINT3	30
+#define IRQ_IOP32X_HPI		31
+
+#endif
diff --git a/arch/arm/mach-iop32x/n2100.c b/arch/arm/mach-iop32x/n2100.c
index 26d76b377e79..5382a93ad0f8 100644
--- a/arch/arm/mach-iop32x/n2100.c
+++ b/arch/arm/mach-iop32x/n2100.c
@@ -28,7 +28,6 @@
 #include <linux/io.h>
 #include <linux/gpio.h>
 #include <linux/gpio/machine.h>
-#include <mach/hardware.h>
 #include <asm/irq.h>
 #include <asm/mach/arch.h>
 #include <asm/mach/map.h>
@@ -37,7 +36,9 @@
 #include <asm/mach-types.h>
 #include <asm/page.h>
 #include <asm/pgtable.h>
-#include <mach/time.h>
+
+#include "hardware.h"
+#include "irqs.h"
 #include "gpio-iop32x.h"
 
 /*
diff --git a/arch/arm/mach-iop32x/include/mach/n2100.h b/arch/arm/mach-iop32x/n2100.h
similarity index 89%
rename from arch/arm/mach-iop32x/include/mach/n2100.h
rename to arch/arm/mach-iop32x/n2100.h
index 70bb660b643a..0b97b940d3e7 100644
--- a/arch/arm/mach-iop32x/include/mach/n2100.h
+++ b/arch/arm/mach-iop32x/n2100.h
@@ -1,7 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /*
- * arch/arm/mach-iop32x/include/mach/n2100.h
- *
  * Thecus N2100 board registers
  */
 
diff --git a/arch/arm/plat-iop/pci.c b/arch/arm/mach-iop32x/pci.c
similarity index 99%
rename from arch/arm/plat-iop/pci.c
rename to arch/arm/mach-iop32x/pci.c
index 4c42c95e4bf5..ab0010dc3145 100644
--- a/arch/arm/plat-iop/pci.c
+++ b/arch/arm/mach-iop32x/pci.c
@@ -17,9 +17,9 @@
 #include <linux/io.h>
 #include <asm/irq.h>
 #include <asm/signal.h>
-#include <mach/hardware.h>
 #include <asm/mach/pci.h>
-#include <asm/hardware/iop3xx.h>
+#include "hardware.h"
+#include "iop3xx.h"
 
 // #define DEBUG
 
diff --git a/arch/arm/plat-iop/pmu.c b/arch/arm/mach-iop32x/pmu.c
similarity index 96%
rename from arch/arm/plat-iop/pmu.c
rename to arch/arm/mach-iop32x/pmu.c
index 3834142c17f4..bdbc7a3cb8a3 100644
--- a/arch/arm/plat-iop/pmu.c
+++ b/arch/arm/mach-iop32x/pmu.c
@@ -5,7 +5,7 @@
  */
 
 #include <linux/platform_device.h>
-#include <mach/irqs.h>
+#include "irqs.h"
 
 static struct resource pmu_resource = {
 	.start	= IRQ_IOP32X_CORE_PMU,
diff --git a/arch/arm/plat-iop/restart.c b/arch/arm/mach-iop32x/restart.c
similarity index 82%
rename from arch/arm/plat-iop/restart.c
rename to arch/arm/mach-iop32x/restart.c
index cf6d3d9a2112..3dfa54d3a7a8 100644
--- a/arch/arm/plat-iop/restart.c
+++ b/arch/arm/mach-iop32x/restart.c
@@ -4,9 +4,9 @@
  *
  * Copyright (C) 2001 MontaVista Software, Inc.
  */
-#include <asm/hardware/iop3xx.h>
 #include <asm/system_misc.h>
-#include <mach/hardware.h>
+#include "hardware.h"
+#include "iop3xx.h"
 
 void iop3xx_restart(enum reboot_mode mode, const char *cmd)
 {
diff --git a/arch/arm/plat-iop/setup.c b/arch/arm/mach-iop32x/setup.c
similarity index 95%
rename from arch/arm/plat-iop/setup.c
rename to arch/arm/mach-iop32x/setup.c
index d10e0102d82c..a0a81c28a632 100644
--- a/arch/arm/plat-iop/setup.c
+++ b/arch/arm/mach-iop32x/setup.c
@@ -10,7 +10,7 @@
 #include <linux/mm.h>
 #include <linux/init.h>
 #include <asm/mach/map.h>
-#include <asm/hardware/iop3xx.h>
+#include "iop3xx.h"
 
 /*
  * Standard IO mapping for all IOP3xx based systems.  Note that
diff --git a/arch/arm/plat-iop/time.c b/arch/arm/mach-iop32x/time.c
similarity index 97%
rename from arch/arm/plat-iop/time.c
rename to arch/arm/mach-iop32x/time.c
index f9dd1f50cfe5..18a4df5c1baa 100644
--- a/arch/arm/plat-iop/time.c
+++ b/arch/arm/mach-iop32x/time.c
@@ -19,12 +19,13 @@
 #include <linux/clockchips.h>
 #include <linux/export.h>
 #include <linux/sched_clock.h>
-#include <mach/hardware.h>
 #include <asm/irq.h>
 #include <linux/uaccess.h>
 #include <asm/mach/irq.h>
 #include <asm/mach/time.h>
-#include <mach/time.h>
+
+#include "hardware.h"
+#include "irqs.h"
 
 /*
  * Minimum clocksource/clockevent timer range in seconds
@@ -167,7 +168,7 @@ void __init iop_init_time(unsigned long tick_rate)
 	 */
 	write_tmr0(timer_ctl & ~IOP_TMR_EN);
 	write_tisr(1);
-	setup_irq(IRQ_IOP_TIMER0, &iop_timer_irq);
+	setup_irq(IRQ_IOP32X_TIMER0, &iop_timer_irq);
 	iop_clockevent.cpumask = cpumask_of(0);
 	clockevents_config_and_register(&iop_clockevent, tick_rate,
 					0xf, 0xfffffffe);
diff --git a/arch/arm/plat-iop/Makefile b/arch/arm/plat-iop/Makefile
deleted file mode 100644
index 86e354b9065d..000000000000
--- a/arch/arm/plat-iop/Makefile
+++ /dev/null
@@ -1,14 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-#
-# Makefile for the linux kernel.
-#
-
-# IOP32X
-obj-$(CONFIG_ARCH_IOP32X) += i2c.o
-obj-$(CONFIG_ARCH_IOP32X) += pci.o
-obj-$(CONFIG_ARCH_IOP32X) += setup.o
-obj-$(CONFIG_ARCH_IOP32X) += time.o
-obj-$(CONFIG_ARCH_IOP32X) += cp6.o
-obj-$(CONFIG_ARCH_IOP32X) += adma.o
-obj-$(CONFIG_ARCH_IOP32X) += pmu.o
-obj-$(CONFIG_ARCH_IOP32X) += restart.o
-- 
2.20.0

