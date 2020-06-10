Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06C0C1F5C0D
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jun 2020 21:39:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730018AbgFJTj1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 10 Jun 2020 15:39:27 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.21]:17495 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728122AbgFJTj0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 10 Jun 2020 15:39:26 -0400
X-Greylist: delayed 364 seconds by postgrey-1.27 at vger.kernel.org; Wed, 10 Jun 2020 15:39:24 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1591817963;
        s=strato-dkim-0002; d=fpond.eu;
        h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=T35EhsbNR/Bg/PdpwAh28JlDXIcsX6YrPiYnzxPmwk4=;
        b=XIqw7YI7pmfzVcpHXKqxiOwE8sBrIDi3h6i5a27LCkMTA0BVRZPgvgYk7opMfq8/n7
        gkZ6lRx7AJ1i5v+sMs3JoPEcjXw46zJEiqT02NkcgJNIJxuzMok4CY0u/63WVtgvCuz+
        jIQADawfmMH3HMkAErwnUHHcUM2sWxw77k1juHY0qSYLPCE/SVmrHP1KsZsSMYemllqQ
        aFIHw25f2BeDVi94FSy20TbWREMz8adQeSVw5ksSHx9ZNmOuQs0hthU9wnix/sO3zMcQ
        I7JxWGDFl0h9D5az1qFaHvqmFBEQxz+Jm4YH7pTch4vj8op4yh5F+mXNBQ/edP9lSAqj
        otfw==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73dmm4I5W0/AvA67Ot4fvR8GBad1QwaqQ="
X-RZG-CLASS-ID: mo00
Received: from groucho.site
        by smtp.strato.de (RZmta 46.9.1 DYNA|AUTH)
        with ESMTPSA id Q084d6w5AJXIULo
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Wed, 10 Jun 2020 21:33:18 +0200 (CEST)
From:   Ulrich Hecht <uli+renesas@fpond.eu>
To:     linux-renesas-soc@vger.kernel.org
Cc:     wsa@the-dreams.de, linux-i2c@vger.kernel.org,
        Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PATCH] i2c: sh_mobile: implement atomic transfers
Date:   Wed, 10 Jun 2020 21:33:11 +0200
Message-Id: <1591817591-852-1-git-send-email-uli+renesas@fpond.eu>
X-Mailer: git-send-email 2.7.4
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Implements atomic transfers to fix reboot/shutdown on r8a7790 Lager and
similar boards.

Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
---
 drivers/i2c/busses/i2c-sh_mobile.c | 100 +++++++++++++++++++++++++++----------
 1 file changed, 74 insertions(+), 26 deletions(-)

diff --git a/drivers/i2c/busses/i2c-sh_mobile.c b/drivers/i2c/busses/i2c-sh_mobile.c
index d83ca40..e8436f4 100644
--- a/drivers/i2c/busses/i2c-sh_mobile.c
+++ b/drivers/i2c/busses/i2c-sh_mobile.c
@@ -129,6 +129,7 @@ struct sh_mobile_i2c_data {
 	int sr;
 	bool send_stop;
 	bool stop_after_dma;
+	bool atomic_xfer;
 
 	struct resource *res;
 	struct dma_chan *dma_tx;
@@ -330,13 +331,15 @@ static unsigned char i2c_op(struct sh_mobile_i2c_data *pd, enum sh_mobile_i2c_op
 		ret = iic_rd(pd, ICDR);
 		break;
 	case OP_RX_STOP: /* enable DTE interrupt, issue stop */
-		iic_wr(pd, ICIC,
-		       ICIC_DTEE | ICIC_WAITE | ICIC_ALE | ICIC_TACKE);
+		if (!pd->atomic_xfer)
+			iic_wr(pd, ICIC,
+			       ICIC_DTEE | ICIC_WAITE | ICIC_ALE | ICIC_TACKE);
 		iic_wr(pd, ICCR, ICCR_ICE | ICCR_RACK);
 		break;
 	case OP_RX_STOP_DATA: /* enable DTE interrupt, read data, issue stop */
-		iic_wr(pd, ICIC,
-		       ICIC_DTEE | ICIC_WAITE | ICIC_ALE | ICIC_TACKE);
+		if (!pd->atomic_xfer)
+			iic_wr(pd, ICIC,
+			       ICIC_DTEE | ICIC_WAITE | ICIC_ALE | ICIC_TACKE);
 		ret = iic_rd(pd, ICDR);
 		iic_wr(pd, ICCR, ICCR_ICE | ICCR_RACK);
 		break;
@@ -366,7 +369,7 @@ static int sh_mobile_i2c_isr_tx(struct sh_mobile_i2c_data *pd)
 
 static int sh_mobile_i2c_isr_rx(struct sh_mobile_i2c_data *pd)
 {
-	unsigned char data;
+	unsigned char data = 0;
 	int real_pos;
 
 	/* switch from TX (address) to RX (data) adds two interrupts */
@@ -432,7 +435,8 @@ static irqreturn_t sh_mobile_i2c_isr(int irq, void *dev_id)
 
 	if (wakeup) {
 		pd->sr |= SW_DONE;
-		wake_up(&pd->wait);
+		if (!pd->atomic_xfer)
+			wake_up(&pd->wait);
 	}
 
 	/* defeat write posting to avoid spurious WAIT interrupts */
@@ -584,12 +588,14 @@ static void start_ch(struct sh_mobile_i2c_data *pd, struct i2c_msg *usr_msg,
 	pd->pos = -1;
 	pd->sr = 0;
 
-	pd->dma_buf = i2c_get_dma_safe_msg_buf(pd->msg, 8);
-	if (pd->dma_buf)
-		sh_mobile_i2c_xfer_dma(pd);
-
-	/* Enable all interrupts to begin with */
-	iic_wr(pd, ICIC, ICIC_DTEE | ICIC_WAITE | ICIC_ALE | ICIC_TACKE);
+	if (!pd->atomic_xfer) {
+		pd->dma_buf = i2c_get_dma_safe_msg_buf(pd->msg, 8);
+		if (pd->dma_buf)
+			sh_mobile_i2c_xfer_dma(pd);
+		/* Enable all interrupts to begin with */
+		iic_wr(pd, ICIC,
+		       ICIC_DTEE | ICIC_WAITE | ICIC_ALE | ICIC_TACKE);
+	}
 }
 
 static int poll_dte(struct sh_mobile_i2c_data *pd)
@@ -640,18 +646,16 @@ static int poll_busy(struct sh_mobile_i2c_data *pd)
 	return i ? 0 : -ETIMEDOUT;
 }
 
-static int sh_mobile_i2c_xfer(struct i2c_adapter *adapter,
-			      struct i2c_msg *msgs,
-			      int num)
+static int xfer(struct sh_mobile_i2c_data *pd, struct i2c_msg *msgs, int num)
 {
-	struct sh_mobile_i2c_data *pd = i2c_get_adapdata(adapter);
 	struct i2c_msg	*msg;
 	int err = 0;
 	int i;
 	long timeout;
 
 	/* Wake up device and enable clock */
-	pm_runtime_get_sync(pd->dev);
+	if (!pd->atomic_xfer)
+		pm_runtime_get_sync(pd->dev);
 
 	/* Process all messages */
 	for (i = 0; i < num; i++) {
@@ -665,13 +669,35 @@ static int sh_mobile_i2c_xfer(struct i2c_adapter *adapter,
 		if (do_start)
 			i2c_op(pd, OP_START);
 
-		/* The interrupt handler takes care of the rest... */
-		timeout = wait_event_timeout(pd->wait,
-				       pd->sr & (ICSR_TACK | SW_DONE),
-				       adapter->timeout);
+		if (pd->atomic_xfer) {
+			unsigned long j = jiffies + pd->adap.timeout;
+
+			timeout = 1;
+			while (!time_after(jiffies, j) &&
+			       !(pd->sr & (ICSR_TACK | SW_DONE))) {
+				unsigned char sr = iic_rd(pd, ICSR);
+
+				if (sr & (ICSR_AL   | ICSR_TACK |
+					  ICSR_WAIT | ICSR_DTE)) {
+					sh_mobile_i2c_isr(0, pd);
+					udelay(150);
+				} else
+					cpu_relax();
+			}
+
+			if (time_after(jiffies, j))
+				timeout = 0;
+		} else {
+			/* The interrupt handler takes care of the rest... */
+			timeout = wait_event_timeout(pd->wait,
+					pd->sr & (ICSR_TACK | SW_DONE),
+					pd->adap.timeout);
 
-		/* 'stop_after_dma' tells if DMA transfer was complete */
-		i2c_put_dma_safe_msg_buf(pd->dma_buf, pd->msg, pd->stop_after_dma);
+			/* 'stop_after_dma' tells if DMA xfer was complete */
+			i2c_put_dma_safe_msg_buf(pd->dma_buf, pd->msg,
+						 pd->stop_after_dma);
+
+		}
 
 		if (!timeout) {
 			dev_err(pd->dev, "Transfer request timed out\n");
@@ -694,19 +720,41 @@ static int sh_mobile_i2c_xfer(struct i2c_adapter *adapter,
 	iic_wr(pd, ICCR, ICCR_SCP);
 
 	/* Disable clock and mark device as idle */
-	pm_runtime_put_sync(pd->dev);
+	if (!pd->atomic_xfer)
+		pm_runtime_put_sync(pd->dev);
 
 	return err ?: num;
 }
 
+static int sh_mobile_i2c_xfer(struct i2c_adapter *adapter,
+			      struct i2c_msg *msgs,
+			      int num)
+{
+	struct sh_mobile_i2c_data *pd = i2c_get_adapdata(adapter);
+
+	pd->atomic_xfer = false;
+	return xfer(pd, msgs, num);
+}
+
+static int sh_mobile_i2c_xfer_atomic(struct i2c_adapter *adapter,
+				     struct i2c_msg *msgs,
+				     int num)
+{
+	struct sh_mobile_i2c_data *pd = i2c_get_adapdata(adapter);
+
+	pd->atomic_xfer = true;
+	return xfer(pd, msgs, num);
+}
+
 static u32 sh_mobile_i2c_func(struct i2c_adapter *adapter)
 {
 	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL | I2C_FUNC_PROTOCOL_MANGLING;
 }
 
 static const struct i2c_algorithm sh_mobile_i2c_algorithm = {
-	.functionality	= sh_mobile_i2c_func,
-	.master_xfer	= sh_mobile_i2c_xfer,
+	.functionality		= sh_mobile_i2c_func,
+	.master_xfer		= sh_mobile_i2c_xfer,
+	.master_xfer_atomic	= sh_mobile_i2c_xfer_atomic,
 };
 
 static const struct i2c_adapter_quirks sh_mobile_i2c_quirks = {
-- 
2.7.4

