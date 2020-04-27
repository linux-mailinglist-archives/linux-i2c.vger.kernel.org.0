Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8A621BA761
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Apr 2020 17:09:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727077AbgD0PJD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Apr 2020 11:09:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727010AbgD0PJD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Apr 2020 11:09:03 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81CA2C0610D5
        for <linux-i2c@vger.kernel.org>; Mon, 27 Apr 2020 08:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
        Content-Transfer-Encoding:MIME-Version:Subject:To:From:References:In-Reply-To
        :Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=Ri7RAyzDscd/OQzuji+jCNKQh7njCHbHtzYEZDdgFF4=; b=FYdkVZsAV5WXKCb6pHn44IOSgx
        w+9SOWDEtSlA3i/YoHJY1SYnrqKr8LiuaUPxG5WQQRm1VNI7c0yYklzaf1ddBJnxw9mByRVHlJkLh
        kCJIKGB9Y2A+punB5zaboTQrPVwNExuQkFEWe8sthzTcIzcMyeknTiLoIyQgmidCRm6wXJF+ulM1D
        pfVT2yzN5pEtmQEloS2RU7tm1pwMUKa2c7PS4YP2ocwLwiOL9Hp8SNvyPM5AnwnIkivmCSGUVJK8D
        oqPHb+i2gCx2YcngxJgR50dGGsjuRU6W+99RkzF9yNfPUqq0oOKWFguk5AgZTtbBpnc29xd/lufZE
        zPMKSSPA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([2002:4e20:1eda:1:222:68ff:fe15:37dd]:33710 helo=rmk-PC.armlinux.org.uk)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1jT5NS-0003Xs-Jd; Mon, 27 Apr 2020 16:08:58 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1jT5NS-0001rC-3J; Mon, 27 Apr 2020 16:08:58 +0100
In-Reply-To: <20200427150755.GT5827@shell.armlinux.org.uk>
References: <20200427150755.GT5827@shell.armlinux.org.uk>
From:   Russell King <rmk+kernel@armlinux.org.uk>
To:     linux-i2c@vger.kernel.org
Subject: [PATCH REPOST 05/12] i2c: pxa: re-arrange register field definitions
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1jT5NS-0001rC-3J@rmk-PC.armlinux.org.uk>
Date:   Mon, 27 Apr 2020 16:08:58 +0100
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Arrange the register field definitions to be grouped together, rather
than the Armada-3700 definitions being separated from the rest of the
definitions.

Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
---
 drivers/i2c/busses/i2c-pxa.c | 113 ++++++++++++++++-------------------
 1 file changed, 53 insertions(+), 60 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pxa.c b/drivers/i2c/busses/i2c-pxa.c
index e77cbe325996..62b7d4fa5cfd 100644
--- a/drivers/i2c/busses/i2c-pxa.c
+++ b/drivers/i2c/busses/i2c-pxa.c
@@ -32,6 +32,56 @@
 #include <linux/platform_data/i2c-pxa.h>
 #include <linux/slab.h>
 
+/* I2C register field definitions */
+#define ICR_START	(1 << 0)	   /* start bit */
+#define ICR_STOP	(1 << 1)	   /* stop bit */
+#define ICR_ACKNAK	(1 << 2)	   /* send ACK(0) or NAK(1) */
+#define ICR_TB		(1 << 3)	   /* transfer byte bit */
+#define ICR_MA		(1 << 4)	   /* master abort */
+#define ICR_SCLE	(1 << 5)	   /* master clock enable */
+#define ICR_IUE		(1 << 6)	   /* unit enable */
+#define ICR_GCD		(1 << 7)	   /* general call disable */
+#define ICR_ITEIE	(1 << 8)	   /* enable tx interrupts */
+#define ICR_IRFIE	(1 << 9)	   /* enable rx interrupts */
+#define ICR_BEIE	(1 << 10)	   /* enable bus error ints */
+#define ICR_SSDIE	(1 << 11)	   /* slave STOP detected int enable */
+#define ICR_ALDIE	(1 << 12)	   /* enable arbitration interrupt */
+#define ICR_SADIE	(1 << 13)	   /* slave address detected int enable */
+#define ICR_UR		(1 << 14)	   /* unit reset */
+#define ICR_FM		(1 << 15)	   /* fast mode */
+#define ICR_HS		(1 << 16)	   /* High Speed mode */
+#define ICR_A3700_FM	(1 << 16)	   /* fast mode for armada-3700 */
+#define ICR_A3700_HS	(1 << 17)	   /* high speed mode for armada-3700 */
+#define ICR_GPIOEN	(1 << 19)	   /* enable GPIO mode for SCL in HS */
+
+#define ISR_RWM		(1 << 0)	   /* read/write mode */
+#define ISR_ACKNAK	(1 << 1)	   /* ack/nak status */
+#define ISR_UB		(1 << 2)	   /* unit busy */
+#define ISR_IBB		(1 << 3)	   /* bus busy */
+#define ISR_SSD		(1 << 4)	   /* slave stop detected */
+#define ISR_ALD		(1 << 5)	   /* arbitration loss detected */
+#define ISR_ITE		(1 << 6)	   /* tx buffer empty */
+#define ISR_IRF		(1 << 7)	   /* rx buffer full */
+#define ISR_GCAD	(1 << 8)	   /* general call address detected */
+#define ISR_SAD		(1 << 9)	   /* slave address detected */
+#define ISR_BED		(1 << 10)	   /* bus error no ACK/NAK */
+
+#define ILCR_SLV_SHIFT		0
+#define ILCR_SLV_MASK		(0x1FF << ILCR_SLV_SHIFT)
+#define ILCR_FLV_SHIFT		9
+#define ILCR_FLV_MASK		(0x1FF << ILCR_FLV_SHIFT)
+#define ILCR_HLVL_SHIFT		18
+#define ILCR_HLVL_MASK		(0x1FF << ILCR_HLVL_SHIFT)
+#define ILCR_HLVH_SHIFT		27
+#define ILCR_HLVH_MASK		(0x1F << ILCR_HLVH_SHIFT)
+
+#define IWCR_CNT_SHIFT		0
+#define IWCR_CNT_MASK		(0x1F << IWCR_CNT_SHIFT)
+#define IWCR_HS_CNT1_SHIFT	5
+#define IWCR_HS_CNT1_MASK	(0x1F << IWCR_HS_CNT1_SHIFT)
+#define IWCR_HS_CNT2_SHIFT	10
+#define IWCR_HS_CNT2_MASK	(0x1F << IWCR_HS_CNT2_SHIFT)
+
 struct pxa_reg_layout {
 	u32 ibmr;
 	u32 idbr;
@@ -52,12 +102,7 @@ enum pxa_i2c_types {
 	REGS_A3700,
 };
 
-#define ICR_BUSMODE_FM	(1 << 16)	   /* shifted fast mode for armada-3700 */
-#define ICR_BUSMODE_HS	(1 << 17)	   /* shifted high speed mode for armada-3700 */
-
-/*
- * I2C registers definitions
- */
+/* I2C register layout definitions */
 static struct pxa_reg_layout pxa_reg_layout[] = {
 	[REGS_PXA2XX] = {
 		.ibmr =	0x00,
@@ -95,8 +140,8 @@ static struct pxa_reg_layout pxa_reg_layout[] = {
 		.icr =	0x08,
 		.isr =	0x0c,
 		.isar =	0x10,
-		.fm = ICR_BUSMODE_FM,
-		.hs = ICR_BUSMODE_HS,
+		.fm = ICR_A3700_FM,
+		.hs = ICR_A3700_HS,
 	},
 };
 
@@ -110,58 +155,6 @@ static const struct platform_device_id i2c_pxa_id_table[] = {
 };
 MODULE_DEVICE_TABLE(platform, i2c_pxa_id_table);
 
-/*
- * I2C bit definitions
- */
-
-#define ICR_START	(1 << 0)	   /* start bit */
-#define ICR_STOP	(1 << 1)	   /* stop bit */
-#define ICR_ACKNAK	(1 << 2)	   /* send ACK(0) or NAK(1) */
-#define ICR_TB		(1 << 3)	   /* transfer byte bit */
-#define ICR_MA		(1 << 4)	   /* master abort */
-#define ICR_SCLE	(1 << 5)	   /* master clock enable */
-#define ICR_IUE		(1 << 6)	   /* unit enable */
-#define ICR_GCD		(1 << 7)	   /* general call disable */
-#define ICR_ITEIE	(1 << 8)	   /* enable tx interrupts */
-#define ICR_IRFIE	(1 << 9)	   /* enable rx interrupts */
-#define ICR_BEIE	(1 << 10)	   /* enable bus error ints */
-#define ICR_SSDIE	(1 << 11)	   /* slave STOP detected int enable */
-#define ICR_ALDIE	(1 << 12)	   /* enable arbitration interrupt */
-#define ICR_SADIE	(1 << 13)	   /* slave address detected int enable */
-#define ICR_UR		(1 << 14)	   /* unit reset */
-#define ICR_FM		(1 << 15)	   /* fast mode */
-#define ICR_HS		(1 << 16)	   /* High Speed mode */
-#define ICR_GPIOEN	(1 << 19)	   /* enable GPIO mode for SCL in HS */
-
-#define ISR_RWM		(1 << 0)	   /* read/write mode */
-#define ISR_ACKNAK	(1 << 1)	   /* ack/nak status */
-#define ISR_UB		(1 << 2)	   /* unit busy */
-#define ISR_IBB		(1 << 3)	   /* bus busy */
-#define ISR_SSD		(1 << 4)	   /* slave stop detected */
-#define ISR_ALD		(1 << 5)	   /* arbitration loss detected */
-#define ISR_ITE		(1 << 6)	   /* tx buffer empty */
-#define ISR_IRF		(1 << 7)	   /* rx buffer full */
-#define ISR_GCAD	(1 << 8)	   /* general call address detected */
-#define ISR_SAD		(1 << 9)	   /* slave address detected */
-#define ISR_BED		(1 << 10)	   /* bus error no ACK/NAK */
-
-/* bit field shift & mask */
-#define ILCR_SLV_SHIFT		0
-#define ILCR_SLV_MASK		(0x1FF << ILCR_SLV_SHIFT)
-#define ILCR_FLV_SHIFT		9
-#define ILCR_FLV_MASK		(0x1FF << ILCR_FLV_SHIFT)
-#define ILCR_HLVL_SHIFT		18
-#define ILCR_HLVL_MASK		(0x1FF << ILCR_HLVL_SHIFT)
-#define ILCR_HLVH_SHIFT		27
-#define ILCR_HLVH_MASK		(0x1F << ILCR_HLVH_SHIFT)
-
-#define IWCR_CNT_SHIFT		0
-#define IWCR_CNT_MASK		(0x1F << IWCR_CNT_SHIFT)
-#define IWCR_HS_CNT1_SHIFT	5
-#define IWCR_HS_CNT1_MASK	(0x1F << IWCR_HS_CNT1_SHIFT)
-#define IWCR_HS_CNT2_SHIFT	10
-#define IWCR_HS_CNT2_MASK	(0x1F << IWCR_HS_CNT2_SHIFT)
-
 struct pxa_i2c {
 	spinlock_t		lock;
 	wait_queue_head_t	wait;
-- 
2.20.1

