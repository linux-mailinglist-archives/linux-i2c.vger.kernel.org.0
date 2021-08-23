Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EBAF3F52F3
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Aug 2021 23:42:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232979AbhHWVnC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 23 Aug 2021 17:43:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232964AbhHWVnB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 23 Aug 2021 17:43:01 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62905C061575
        for <linux-i2c@vger.kernel.org>; Mon, 23 Aug 2021 14:42:18 -0700 (PDT)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 4F84682BE5;
        Mon, 23 Aug 2021 23:42:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1629754936;
        bh=/9BAaomeDN8lddP6hBwwmqMpX5vLm6a310aOxL9ME8A=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=lfSXSufV0g7UBGIEnC5cNzi1CkPyaPquHO76B1sDrDxaE5VNvRXL2Hs+YKXUbmbbK
         RmiEGEHFVB/ocG4nMSkU4ZJ1ksIMchPcPYmUa9+JBy2dPxREyyK0Aorp0IKqSSbfUB
         cqZlv/+F7nJ/97cPMvDvxon/GcM1SDyBMpK36eeS9qpHX9JhffwG8/uH4ZHOwB6SHc
         rdRQu3sl2tnj4FHouzP4XvB8EzrqYujy3qVWVO0JbDwoikzZJP6Vs2Jcdf3KhWLrOB
         byMv2i/SmJUR0n+8H13XumywRnU2UwXx9rVbgVWag033ZMKPN41jj9xE1lA0w3YQGy
         bCIeAY36a8sAA==
From:   Marek Vasut <marex@denx.de>
To:     linux-i2c@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        Michal Simek <michal.simek@xilinx.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        Wolfram Sang <wsa@kernel.org>
Subject: [PATCH v2 2/6] i2c: xiic: Drop broken interrupt handler
Date:   Mon, 23 Aug 2021 23:41:41 +0200
Message-Id: <20210823214145.295104-3-marex@denx.de>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210823214145.295104-1-marex@denx.de>
References: <20210823214145.295104-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
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
V2: No change
---
 drivers/i2c/busses/i2c-xiic.c | 25 +------------------------
 1 file changed, 1 insertion(+), 24 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 50320dd32eea9..b13166e94d894 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -554,7 +554,6 @@ static void xiic_start_recv(struct xiic_i2c *i2c)
 {
 	u8 rx_watermark;
 	struct i2c_msg *msg = i2c->rx_msg = i2c->tx_msg;
-	unsigned long flags;
 
 	/* Clear and enable Rx full interrupt. */
 	xiic_irq_clr_en(i2c, XIIC_INTR_RX_FULL_MASK | XIIC_INTR_TX_ERROR_MASK);
@@ -570,7 +569,6 @@ static void xiic_start_recv(struct xiic_i2c *i2c)
 		rx_watermark = IIC_RX_FIFO_DEPTH;
 	xiic_setreg8(i2c, XIIC_RFD_REG_OFFSET, rx_watermark - 1);
 
-	local_irq_save(flags);
 	if (!(msg->flags & I2C_M_NOSTART))
 		/* write the address */
 		xiic_setreg16(i2c, XIIC_DTR_REG_OFFSET,
@@ -580,7 +578,6 @@ static void xiic_start_recv(struct xiic_i2c *i2c)
 
 	xiic_setreg16(i2c, XIIC_DTR_REG_OFFSET,
 		msg->len | ((i2c->nmsgs == 1) ? XIIC_TX_DYN_STOP_MASK : 0));
-	local_irq_restore(flags);
 
 	if (i2c->nmsgs == 1)
 		/* very last, enable bus not busy as well */
@@ -620,26 +617,6 @@ static void xiic_start_send(struct xiic_i2c *i2c)
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
@@ -818,7 +795,7 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 	pm_runtime_use_autosuspend(i2c->dev);
 	pm_runtime_set_active(i2c->dev);
 	pm_runtime_enable(i2c->dev);
-	ret = devm_request_threaded_irq(&pdev->dev, irq, xiic_isr,
+	ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
 					xiic_process, IRQF_ONESHOT,
 					pdev->name, i2c);
 
-- 
2.32.0

