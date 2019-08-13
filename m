Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 263868BE31
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Aug 2019 18:21:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728457AbfHMQVU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Aug 2019 12:21:20 -0400
Received: from mout.gmx.net ([212.227.15.15]:33717 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728308AbfHMQVU (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 13 Aug 2019 12:21:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1565713262;
        bh=p/SSnJeKxjXEaPbgC1CRpaN/K2ZQCUsvDyxx2Jvj4LU=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=HGAaxH8n+e7hjJX8rYPnrfAYFN9v1a8uXAQdpTqSX+B3oIe92oIT0lQNtZOC0bbZ6
         osB9q80c9C4UrMmMvsK4pD7+QJyBeh0g8e9laFstPo9i568112uFV6V2mOodK/YiiR
         9/+aSEvO792a9jPSobxidWgTLHD8bKamJJYvbcHs=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([37.4.249.106]) by mail.gmx.com
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MWRVh-1hmDWI3vqN-00XpC3; Tue, 13 Aug 2019 18:21:02 +0200
From:   Stefan Wahren <wahrenst@gmx.net>
To:     Eric Anholt <eric@anholt.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     bcm-kernel-feedback-list@broadcom.com,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V2 11/13] ARM: bcm: Add support for BCM2711 SoC
Date:   Tue, 13 Aug 2019 18:20:46 +0200
Message-Id: <1565713248-4906-12-git-send-email-wahrenst@gmx.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1565713248-4906-1-git-send-email-wahrenst@gmx.net>
References: <1565713248-4906-1-git-send-email-wahrenst@gmx.net>
X-Provags-ID: V03:K1:dFIO1Y73cHhYByVqZYoc8TOkFxlgLtwZRXUHniPN7XlD/XNDCa9
 m9n9eNR6vODXNafG+h/DHp03ptu6IxHcGydxEQy/wryeqZsi4u6jdkz1cQTivz330HgDDJI
 TBmr7tX87emKd7Y3zMfLh51QJDwfHg4zrQe62z6+LJrEnP0MFjm36rnyRYFaZYXaDnE2SVL
 8HWa/+fzafFnulyKmpoig==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:5bicyWtCMlw=:K09yliheb9ZgWexnnYrLqO
 w14DFkCZl3Jl6qEhRe1SXZ9kvnvJBXA7a3pnuuyb8vRd15wQY0/ZElmPf92kW+TYjDb4EH1uK
 rpGtSDqZrJtKK70+JjEtipknm8/walVHJcIhe/ubR6JIRWsRKMEcPKIhBHPgZTpt0ppU9Exg8
 8lwJbX5bH/RpdhA1iy/Yf1w9fVDtQYbrxMlQqPlaBAUfd7YjbT4BJN7lkz8ulbcA+LJdzZw2w
 WRaMomdoAYnapFyochF/DyjkBn8H0KUPnARk3ljtM11uUJFwqL2hSOjEIsCQKQLycznuJkFaZ
 Q9pjqf6Xg9SdbHcwpKLGeUZ9sJSe6+0Pd3J1KxcJZKvrE+CwoG9sNUoS6RLzG8uaeMqnsmQgj
 5Aoe4K5U0QX0M+k4ntqPKztN/q0yg4gQ7qrT4IJ6IZCSNmmhebU7YK6MlJNASWRdPrzzQzTLY
 aCsuxh3Jj6SIaTC/XP2ezo1GNj4HepZs6C+VmvN/weoe2j2aDZM4i2GPI9AcBz3gebnNSLzvf
 eSzBkwBTXdPeU46WM5jpjaWCe9iMy0FpX+IfxybNc1PdstUIJZamnc8DEoz474RvXI95GFMZl
 kz/yPu2qEVPav1iEaLFdjCLAH+px7NELlQ3CvTR0+Hf5ee8uWOTwXdZwp1uQ2uMDToyO6mhll
 xZn4IVObC2lQP0C9cRU3yJu9KtFcFe6bnkmitGLCIUmE+NqSggCrxYQE40uQKwr61Wyk5VmfY
 r5PE+3C5ePOo6CreeC6+flGDbek4SVOUYxUs82XuVO4v3vIpB2F/RkA+MFqrOVMZNcJUwS54x
 cDEKUxHpq1bEIex1e3P2uzrglvuarDvgGkoKB8o/8CfX9wMZQEviJVV4P3R9sPM6HSwtdSLBv
 U4ypMvw5HrTgyWNVu3fYFJ8iZcBbJhFR0a5ysabz7WnzraZL7OcRK3keL5szS6TRF62Yx2X6T
 z/qBaKCfQZEyYIRJTY7ou8E6NRksSk5B1G32WZeXP2MYX5TDIRTIzXuvqJzSsi6D3KXAZHPud
 nIIsdhKai+uDWdNv5eEwrHxs8StxVNv3WaQodOHV3dU3bB+6RIcbCh1KZMEmqSElG90wo0432
 omFL21MjsjTGj/X95forwjUjhxAkP0zWgnQoaDEwTWZ/NFF8Qg3C5aMQg==
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add the BCM2711 to ARCH_BCM2835, but use new machine board code
because of the differences.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 arch/arm/mach-bcm/Kconfig   |  3 ++-
 arch/arm/mach-bcm/Makefile  |  3 ++-
 arch/arm/mach-bcm/bcm2711.c | 22 ++++++++++++++++++++++
 3 files changed, 26 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm/mach-bcm/bcm2711.c

diff --git a/arch/arm/mach-bcm/Kconfig b/arch/arm/mach-bcm/Kconfig
index 5e5f1fa..39bcbea 100644
=2D-- a/arch/arm/mach-bcm/Kconfig
+++ b/arch/arm/mach-bcm/Kconfig
@@ -161,6 +161,7 @@ config ARCH_BCM2835
 	select GPIOLIB
 	select ARM_AMBA
 	select ARM_ERRATA_411920 if ARCH_MULTI_V6
+	select ARM_GIC if ARCH_MULTI_V7
 	select ARM_TIMER_SP804
 	select HAVE_ARM_ARCH_TIMER if ARCH_MULTI_V7
 	select TIMER_OF
@@ -169,7 +170,7 @@ config ARCH_BCM2835
 	select PINCTRL_BCM2835
 	select MFD_CORE
 	help
-	  This enables support for the Broadcom BCM2835 and BCM2836 SoCs.
+	  This enables support for the Broadcom BCM2711 and BCM283x SoCs.
 	  This SoC is used in the Raspberry Pi and Roku 2 devices.

 config ARCH_BCM_53573
diff --git a/arch/arm/mach-bcm/Makefile b/arch/arm/mach-bcm/Makefile
index b59c813..7baa8c9 100644
=2D-- a/arch/arm/mach-bcm/Makefile
+++ b/arch/arm/mach-bcm/Makefile
@@ -42,8 +42,9 @@ obj-$(CONFIG_ARCH_BCM_MOBILE_L2_CACHE) +=3D kona_l2_cach=
e.o
 obj-$(CONFIG_ARCH_BCM_MOBILE_SMC) +=3D bcm_kona_smc.o

 # BCM2835
-obj-$(CONFIG_ARCH_BCM2835)	+=3D board_bcm2835.o
 ifeq ($(CONFIG_ARCH_BCM2835),y)
+obj-y				+=3D board_bcm2835.o
+obj-y				+=3D bcm2711.o
 ifeq ($(CONFIG_ARM),y)
 obj-$(CONFIG_SMP)		+=3D platsmp.o
 endif
diff --git a/arch/arm/mach-bcm/bcm2711.c b/arch/arm/mach-bcm/bcm2711.c
new file mode 100644
index 0000000..1fa15b4
=2D-- /dev/null
+++ b/arch/arm/mach-bcm/bcm2711.c
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2019 Stefan Wahren
+ */
+
+#include <linux/of_address.h>
+
+#include <asm/mach/arch.h>
+
+#include "platsmp.h"
+
+static const char * const bcm2711_compat[] =3D {
+#ifdef CONFIG_ARCH_MULTI_V7
+	"brcm,bcm2711",
+#endif
+};
+
+DT_MACHINE_START(BCM2711, "BCM2711")
+	.dma_zone_size	=3D SZ_1G,
+	.dt_compat =3D bcm2711_compat,
+	.smp =3D smp_ops(bcm2836_smp_ops),
+MACHINE_END
=2D-
2.7.4

