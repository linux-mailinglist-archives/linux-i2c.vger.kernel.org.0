Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38D848801D
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Aug 2019 18:34:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437241AbfHIQeM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 9 Aug 2019 12:34:12 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:34229 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726516AbfHIQeE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 9 Aug 2019 12:34:04 -0400
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.129]) with ESMTPA (Nemesis) id
 1N2Unv-1iJPbx03ep-013rP0; Fri, 09 Aug 2019 18:33:54 +0200
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
Subject: [PATCH 6/7] ARM: iop32x: make mach/uncompress.h independent of mach/hardware.h
Date:   Fri,  9 Aug 2019 18:33:20 +0200
Message-Id: <20190809163334.489360-6-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190809163334.489360-1-arnd@arndb.de>
References: <20190809162956.488941-1-arnd@arndb.de>
 <20190809163334.489360-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:vI8dtEjZnzwjq2sWL8d5fbMPZeZEV7AvW59MnNKT2uhvW6Kjd4+
 QOBkKhwEY9azPiKocWLoN574G7bvFZsJ4nOPkqLfmzxeSVwcFhzfQ0JOtSGKa8iDPx/KThd
 TMGllJRSWZY65qV4DjOqg2L4+9LOEf+gmG01q5n2GW2PEpZW47K4PK4kCQfoxu3mdrKP62T
 Y4DxEjvGN/6JC5oXKg3Jg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:R8VBPo7GS74=:ak4pWH17CjBan7Jv8I0xTE
 PIAFwppEm1A3IRTBsM35Id6qfBh/wGR5EWYKsptcsgDSiEPj8uLo3tvEbQmu4aogQQfanUBRw
 ec6HQjPzNLXdXbJFCNHcdM3WgfIhVxyvnii6xXjPIhhxizJUK1/w6S5lIpgDiSNenX9lTdzx6
 PGGEJF926WXnFBe5J8mV7WM0Qc6x3OwgW1bfkrgTculBAGdAtIdlCotRzOJVZeUiiQSc9Y5mb
 dFVMH57p5cB6JE53vy5YKR23yZCq+lLg04xSTwfXEMId58QYyIsuZR/OBLBcSN2L5SOF/R1cS
 9PEhxBXDgx04Fb42oV8eJAXGKCDlPOKZTqsBGbupDWte4b1+vbbO0DAAHUzmQoZ7QW3E2F5AS
 WdzkRtW0GakUXzPo1hggUyEZMQ9cG445/+0Gxn5ueOXi0NBIgK2qzlCkfgYFzPqjkPkCzJ7Wz
 66EeDd0BvJWrn8SrbzAiiCDJCYuXtgYq3thXXmMF0vyIdwDM5nfAGQwsoWSwHPDwF/D4wqNrt
 lqky1W4IwL7IP7sJQspXT1F0G/YbHd25e7sQ2oaV3+OsVwtiwOBL0pYMl8he8OaZTOBRrzqHt
 LffMwccDCho231N3Tlzr4zve/UkmrsqydZ4w2Vv1KGkxSPUr/cKHapjHKfr+aB+a4pbQnz0C6
 Wh+vO2Ox24XvBnngmzChO+3Xq7I1QG+DTZNt1Y2qmyPoZ80MJRi5nE3OP3EE7i5QKJ53BMwPo
 vVZC+WLPECLeIdpiDVyM1KXUhsMwy37TNHPCbA==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

All supported uarts use the same address: IQ80321_UART and IQ31244_UART
are both defined to the default value of 0xfe800000. By using that as
the address unconditionally, all dependencies on other machine headers
can be avoided.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-iop32x/include/mach/uncompress.h | 18 ++----------------
 1 file changed, 2 insertions(+), 16 deletions(-)

diff --git a/arch/arm/mach-iop32x/include/mach/uncompress.h b/arch/arm/mach-iop32x/include/mach/uncompress.h
index ed4ac3e28fa1..c8548875d942 100644
--- a/arch/arm/mach-iop32x/include/mach/uncompress.h
+++ b/arch/arm/mach-iop32x/include/mach/uncompress.h
@@ -6,9 +6,8 @@
 #include <asm/types.h>
 #include <asm/mach-types.h>
 #include <linux/serial_reg.h>
-#include <mach/hardware.h>
 
-volatile u8 *uart_base;
+#define uart_base ((volatile u8 *)0xfe800000)
 
 #define TX_DONE		(UART_LSR_TEMT | UART_LSR_THRE)
 
@@ -23,17 +22,4 @@ static inline void flush(void)
 {
 }
 
-static __inline__ void __arch_decomp_setup(unsigned long arch_id)
-{
-	if (machine_is_iq80321())
-		uart_base = (volatile u8 *)IQ80321_UART;
-	else if (machine_is_iq31244() || machine_is_em7210())
-		uart_base = (volatile u8 *)IQ31244_UART;
-	else
-		uart_base = (volatile u8 *)0xfe800000;
-}
-
-/*
- * nothing to do
- */
-#define arch_decomp_setup()	__arch_decomp_setup(arch_id)
+#define arch_decomp_setup() do { } while (0)
-- 
2.20.0

