Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A443C1F83CE
	for <lists+linux-i2c@lfdr.de>; Sat, 13 Jun 2020 17:08:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726323AbgFMPIL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 13 Jun 2020 11:08:11 -0400
Received: from mail-out.m-online.net ([212.18.0.10]:41347 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726403AbgFMPIG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 13 Jun 2020 11:08:06 -0400
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 49kgvQ2pyyz1rqrb;
        Sat, 13 Jun 2020 17:08:02 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 49kgvQ2KpMz1qql0;
        Sat, 13 Jun 2020 17:08:02 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id Ay6FCyeGH_w0; Sat, 13 Jun 2020 17:08:01 +0200 (CEST)
X-Auth-Info: xuwNCW829crHxpwnCKgiTehed7XIE72r3VSOmCma6/E=
Received: from desktop.lan (ip-86-49-35-8.net.upcbroadband.cz [86.49.35.8])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Sat, 13 Jun 2020 17:08:01 +0200 (CEST)
From:   Marek Vasut <marex@denx.de>
To:     linux-i2c@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        Michal Simek <michal.simek@xilinx.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        Wolfram Sang <wsa@kernel.org>
Subject: [PATCH 2/5] i2c: xiic: Drop broken interrupt handler
Date:   Sat, 13 Jun 2020 17:07:48 +0200
Message-Id: <20200613150751.114595-2-marex@denx.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200613150751.114595-1-marex@denx.de>
References: <20200613150751.114595-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The interrupt handler is missing locking when reading out registers
and is racing with other threads which might access the driver. Drop
it altogether, so that the threaded interrupt is always executed, as
that one is already serialized by the driver mutex. This also allows
dropping local_irq_save()/local_irq_restore() in xiic_start_recv().

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Michal Simek <michal.simek@xilinx.com>
Cc: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Cc: Wolfram Sang <wsa@kernel.org>
---
 drivers/i2c/busses/i2c-xiic.c | 25 +------------------------
 1 file changed, 1 insertion(+), 24 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 0777e577720db..6db71c0fb6583 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -543,7 +543,6 @@ static void xiic_start_recv(struct xiic_i2c *i2c)
 {
 	u8 rx_watermark;
 	struct i2c_msg *msg = i2c->rx_msg = i2c->tx_msg;
-	unsigned long flags;
 
 	/* Clear and enable Rx full interrupt. */
 	xiic_irq_clr_en(i2c, XIIC_INTR_RX_FULL_MASK | XIIC_INTR_TX_ERROR_MASK);
@@ -559,7 +558,6 @@ static void xiic_start_recv(struct xiic_i2c *i2c)
 		rx_watermark = IIC_RX_FIFO_DEPTH;
 	xiic_setreg8(i2c, XIIC_RFD_REG_OFFSET, rx_watermark - 1);
 
-	local_irq_save(flags);
 	if (!(msg->flags & I2C_M_NOSTART))
 		/* write the address */
 		xiic_setreg16(i2c, XIIC_DTR_REG_OFFSET,
@@ -569,7 +567,6 @@ static void xiic_start_recv(struct xiic_i2c *i2c)
 
 	xiic_setreg16(i2c, XIIC_DTR_REG_OFFSET,
 		msg->len | ((i2c->nmsgs == 1) ? XIIC_TX_DYN_STOP_MASK : 0));
-	local_irq_restore(flags);
 
 	if (i2c->nmsgs == 1)
 		/* very last, enable bus not busy as well */
@@ -609,26 +606,6 @@ static void xiic_start_send(struct xiic_i2c *i2c)
 		XIIC_INTR_BNB_MASK);
 }
 
-static irqreturn_t xiic_isr(int irq, void *dev_id)
-{
-	struct xiic_i2c *i2c = dev_id;
-	u32 pend, isr, ier;
-	irqreturn_t ret = IRQ_NONE;
-	/* Do not processes a devices interrupts if the device has no
-	 * interrupts pending
-	 */
-
-	dev_dbg(i2c->adap.dev.parent, "%s entry\n", __func__);
-
-	isr = xiic_getreg32(i2c, XIIC_IISR_OFFSET);
-	ier = xiic_getreg32(i2c, XIIC_IIER_OFFSET);
-	pend = isr & ier;
-	if (pend)
-		ret = IRQ_WAKE_THREAD;
-
-	return ret;
-}
-
 static void __xiic_start_xfer(struct xiic_i2c *i2c)
 {
 	int first = 1;
@@ -807,7 +784,7 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 	pm_runtime_use_autosuspend(i2c->dev);
 	pm_runtime_set_active(i2c->dev);
 	pm_runtime_enable(i2c->dev);
-	ret = devm_request_threaded_irq(&pdev->dev, irq, xiic_isr,
+	ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
 					xiic_process, IRQF_ONESHOT,
 					pdev->name, i2c);
 
-- 
2.26.2

