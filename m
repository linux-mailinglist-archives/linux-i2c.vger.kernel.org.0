Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80D1688020
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Aug 2019 18:34:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407453AbfHIQeD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 9 Aug 2019 12:34:03 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:58595 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407425AbfHIQeC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 9 Aug 2019 12:34:02 -0400
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.129]) with ESMTPA (Nemesis) id
 1MOAJt-1hgXxb2QOn-00OWqK; Fri, 09 Aug 2019 18:33:46 +0200
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
Subject: [PATCH 4/7] dma: iop-adma: allow building without platform headers
Date:   Fri,  9 Aug 2019 18:33:18 +0200
Message-Id: <20190809163334.489360-4-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190809163334.489360-1-arnd@arndb.de>
References: <20190809162956.488941-1-arnd@arndb.de>
 <20190809163334.489360-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:u4Z5Q8yTDVcUzzMzBGkBzT4UZJwW8aGFhqKiWCEh7mh16JiuGrs
 7IZStdUpfO8N6pAlVC7ociBXCsFHeV+1j+u3ay/XI2kwkZ/N1T3Jm2eeSBYC9ZBevNopBrt
 pCL+v1wAAM5qvLNpKizU7cT7FHI3Qo0OAG0+ghu3cPosZmT0m6lBrDY137x5gMwL9dwb5pX
 eHX+YgocfodhKYK3lJlNQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Y3hzfQhETzE=:bt5C68uTCSgsRpntYwiNiB
 yp61HklJ0NRpmIM+x9rFuZ/gTBsvr+OuR+7KwtQezKsOt39h68pj6XJe5EuqkKWbb+QMy4I1x
 1VMhG8AKBnjU7EHgD/uML4sQmeH7s2Ga7i3/DBayeIWNJ3djFXljMYISUohcYQARUIhrO2cB4
 BNrXOu4KbHgksBV3N+gyPsYkytB4prSl9XBzOIa5O2aszVdW5T38JkD/7uZkG6aFHUCjNI4wp
 dBIVio3dVk4XJII4U6ewoUqnHu7JIROpc0cFQotL8Kyam3qg82nIxORo873Fs6jh2l8WUZxBM
 kfyvAcc2MXkMRQNESWXc9kvgUHHHtV7lnzj2ebGaImsf7dvCo8ibpVQUkki6SJsTL4G9fwJD+
 7RH58fUjLmY8EWkSc6GQk0PbE+Z3AfBtR4pdqnhVJsVi/ph2c3oqrWqOlk6TWMgcMPCj+dyj4
 KAvX5HzFCXA+8gJonNk4tLTXZB9apKD6Ioj6ukWki2fiZAk7cpK70iVQ+xKM/0y4Dn2YhbJ3E
 ZKw9jGuDgrJ09H1wv9yA7YtJJvu0Ah+KmCoLgpiY+IJQSCQ9A5gFoXeojEGTsMnvYPAcwlHuL
 d8RmiZHHQQlF8NtutUikgPpwik/Sikbkza8q+rnDoNqBSvX3HSb6QIwiQqtJxepEmfV1k8Dbi
 4vMq8q5vnpea7wOrxguQ3GR/3qU15bsAUXWJfZ67QZ2q+dkwXxHkZX6ncoEqDCth7qT/pfxD4
 NZt37UbFd/QtkfZ/SJA9XYA4lw7Sf6yM3LjamQ==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Now that iop3xx and iop13xx are gone, the iop-adma driver no
longer needs to deal with incompatible register layout defined
in machine specific header files.

Move the iop32x specific definitions into drivers/dma/iop-adma.h
and the platform_data into include/linux/platform_data/dma-iop32x.h,
and change the machine code to no longer reference those.

The DMA0_ID/DMA1_ID/AAU_ID macros are required as part of the
platform data interface and still need to be visible, so move
those from one header to the other.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-iop32x/include/mach/adma.h                   | 6 ------
 arch/arm/plat-iop/adma.c                                   | 3 +--
 drivers/dma/Kconfig                                        | 4 ++--
 drivers/dma/iop-adma.c                                     | 3 +--
 .../asm/hardware/iop3xx-adma.h => drivers/dma/iop-adma.h   | 7 +------
 .../iop_adma.h => include/linux/platform_data/dma-iop32x.h | 4 ++++
 6 files changed, 9 insertions(+), 18 deletions(-)
 delete mode 100644 arch/arm/mach-iop32x/include/mach/adma.h
 rename arch/arm/include/asm/hardware/iop3xx-adma.h => drivers/dma/iop-adma.h (99%)
 rename arch/arm/include/asm/hardware/iop_adma.h => include/linux/platform_data/dma-iop32x.h (98%)

diff --git a/arch/arm/mach-iop32x/include/mach/adma.h b/arch/arm/mach-iop32x/include/mach/adma.h
deleted file mode 100644
index 2b20063123ad..000000000000
--- a/arch/arm/mach-iop32x/include/mach/adma.h
+++ /dev/null
@@ -1,6 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef IOP32X_ADMA_H
-#define IOP32X_ADMA_H
-#include <asm/hardware/iop3xx-adma.h>
-#endif
-
diff --git a/arch/arm/plat-iop/adma.c b/arch/arm/plat-iop/adma.c
index 368496471e60..601cc9c11b07 100644
--- a/arch/arm/plat-iop/adma.c
+++ b/arch/arm/plat-iop/adma.c
@@ -6,8 +6,7 @@
 #include <linux/platform_device.h>
 #include <asm/hardware/iop3xx.h>
 #include <linux/dma-mapping.h>
-#include <mach/adma.h>
-#include <asm/hardware/iop_adma.h>
+#include <linux/platform_data/dma-iop32x.h>
 
 #define IRQ_DMA0_EOT IRQ_IOP32X_DMA0_EOT
 #define IRQ_DMA0_EOC IRQ_IOP32X_DMA0_EOC
diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
index cc84863bc52b..7c511e3db4c8 100644
--- a/drivers/dma/Kconfig
+++ b/drivers/dma/Kconfig
@@ -294,8 +294,8 @@ config INTEL_IOATDMA
 	  If unsure, say N.
 
 config INTEL_IOP_ADMA
-	tristate "Intel IOP ADMA support"
-	depends on ARCH_IOP32X
+	tristate "Intel IOP32x ADMA support"
+	depends on ARCH_IOP32X || COMPILE_TEST
 	select DMA_ENGINE
 	select ASYNC_TX_ENABLE_CHANNEL_SWITCH
 	help
diff --git a/drivers/dma/iop-adma.c b/drivers/dma/iop-adma.c
index aebdd671651a..03f4a588cf7f 100644
--- a/drivers/dma/iop-adma.c
+++ b/drivers/dma/iop-adma.c
@@ -22,8 +22,7 @@
 #include <linux/raid/pq.h>
 #include <linux/slab.h>
 
-#include <mach/adma.h>
-
+#include "iop-adma.h"
 #include "dmaengine.h"
 
 #define to_iop_adma_chan(chan) container_of(chan, struct iop_adma_chan, common)
diff --git a/arch/arm/include/asm/hardware/iop3xx-adma.h b/drivers/dma/iop-adma.h
similarity index 99%
rename from arch/arm/include/asm/hardware/iop3xx-adma.h
rename to drivers/dma/iop-adma.h
index 6d998df17efd..c499c9578f00 100644
--- a/arch/arm/include/asm/hardware/iop3xx-adma.h
+++ b/drivers/dma/iop-adma.h
@@ -6,8 +6,7 @@
 #define _ADMA_H
 #include <linux/types.h>
 #include <linux/io.h>
-#include <mach/hardware.h>
-#include <asm/hardware/iop_adma.h>
+#include <linux/platform_data/dma-iop32x.h>
 
 /* Memory copy units */
 #define DMA_CCR(chan)		(chan->mmr_base + 0x0)
@@ -34,10 +33,6 @@
 #define AAU_EDCR1_IDX	17
 #define AAU_EDCR2_IDX	26
 
-#define DMA0_ID 0
-#define DMA1_ID 1
-#define AAU_ID 2
-
 struct iop3xx_aau_desc_ctrl {
 	unsigned int int_en:1;
 	unsigned int blk1_cmd_ctrl:3;
diff --git a/arch/arm/include/asm/hardware/iop_adma.h b/include/linux/platform_data/dma-iop32x.h
similarity index 98%
rename from arch/arm/include/asm/hardware/iop_adma.h
rename to include/linux/platform_data/dma-iop32x.h
index bcedbab90ac0..ac83cff89549 100644
--- a/arch/arm/include/asm/hardware/iop_adma.h
+++ b/include/linux/platform_data/dma-iop32x.h
@@ -17,6 +17,10 @@
 #endif
 #define iop_paranoia(x) BUG_ON(IOP_PARANOIA && (x))
 
+#define DMA0_ID 0
+#define DMA1_ID 1
+#define AAU_ID 2
+
 /**
  * struct iop_adma_device - internal representation of an ADMA device
  * @pdev: Platform device
-- 
2.20.0

