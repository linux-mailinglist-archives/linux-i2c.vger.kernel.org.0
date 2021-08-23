Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 852C03F52F2
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Aug 2021 23:42:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232503AbhHWVnB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 23 Aug 2021 17:43:01 -0400
Received: from phobos.denx.de ([85.214.62.61]:40802 "EHLO phobos.denx.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232954AbhHWVnB (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 23 Aug 2021 17:43:01 -0400
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id B32D782C03;
        Mon, 23 Aug 2021 23:42:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1629754937;
        bh=ZO5w9EtJMDEcvyoxYdU6wFXZXO3f81gZfTDmo5R07ow=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=BkFLXgl+G336rznJObNOrhYsema2mWSuZUWJFihAuf97iiBH0JoE0Qsg6Wu9qfoj7
         zCFaj04KNrvveL9FYsu4vl/ybKRAb2d1oDG22iiC5tdnsZhizeXRngrmJAue9sknLU
         pPlom0uI+uDomGZIU7xNAwRnj4MvvihasCOYlpK+LVprLRElyVh5/WzdgvB9jFQwIU
         1ChJUv9fZlPUrATnJiWrzOmGcMHn+IFuacN2hIaiXztr42L7Cm9BvMqmUGnoGq3OOF
         e+5j/qKebnu6S4a66icWUdWiJC86zNSYqlH+yEObPDwFSj8C9bDawGierxO1oDn4PL
         H1UfxeT/NVUfg==
From:   Marek Vasut <marex@denx.de>
To:     linux-i2c@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        Michal Simek <michal.simek@xilinx.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        Wolfram Sang <wsa@kernel.org>
Subject: [PATCH v2 3/6] i2c: xiic: Defer xiic_wakeup() and __xiic_start_xfer() in xiic_process()
Date:   Mon, 23 Aug 2021 23:41:42 +0200
Message-Id: <20210823214145.295104-4-marex@denx.de>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210823214145.295104-1-marex@denx.de>
References: <20210823214145.295104-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The __xiic_start_xfer() manipulates the interrupt flags, xiic_wakeup()
may result in return from xiic_xfer() early. Defer both to the end of
the xiic_process() interrupt thread, so that they are executed after
all the other interrupt bits handling completed and once it completely
safe to perform changes to the interrupt bits in the hardware.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Michal Simek <michal.simek@xilinx.com>
Cc: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Cc: Wolfram Sang <wsa@kernel.org>
---
V2: No change
---
 drivers/i2c/busses/i2c-xiic.c | 37 ++++++++++++++++++++++++-----------
 1 file changed, 26 insertions(+), 11 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index b13166e94d894..aecdeec579977 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -375,6 +375,9 @@ static irqreturn_t xiic_process(int irq, void *dev_id)
 	struct xiic_i2c *i2c = dev_id;
 	u32 pend, isr, ier;
 	u32 clr = 0;
+	int xfer_more = 0;
+	int wakeup_req = 0;
+	int wakeup_code = 0;
 
 	/* Get the interrupt Status from the IPIF. There is no clearing of
 	 * interrupts in the IPIF. Interrupts must be cleared at the source.
@@ -411,10 +414,14 @@ static irqreturn_t xiic_process(int irq, void *dev_id)
 		 */
 		xiic_reinit(i2c);
 
-		if (i2c->rx_msg)
-			xiic_wakeup(i2c, STATE_ERROR);
-		if (i2c->tx_msg)
-			xiic_wakeup(i2c, STATE_ERROR);
+		if (i2c->rx_msg) {
+			wakeup_req = 1;
+			wakeup_code = STATE_ERROR;
+		}
+		if (i2c->tx_msg) {
+			wakeup_req = 1;
+			wakeup_code = STATE_ERROR;
+		}
 	}
 	if (pend & XIIC_INTR_RX_FULL_MASK) {
 		/* Receive register/FIFO is full */
@@ -448,8 +455,7 @@ static irqreturn_t xiic_process(int irq, void *dev_id)
 				i2c->tx_msg++;
 				dev_dbg(i2c->adap.dev.parent,
 					"%s will start next...\n", __func__);
-
-				__xiic_start_xfer(i2c);
+				xfer_more = 1;
 			}
 		}
 	}
@@ -463,11 +469,13 @@ static irqreturn_t xiic_process(int irq, void *dev_id)
 		if (!i2c->tx_msg)
 			goto out;
 
-		if ((i2c->nmsgs == 1) && !i2c->rx_msg &&
-			xiic_tx_space(i2c) == 0)
-			xiic_wakeup(i2c, STATE_DONE);
+		wakeup_req = 1;
+
+		if (i2c->nmsgs == 1 && !i2c->rx_msg &&
+		    xiic_tx_space(i2c) == 0)
+			wakeup_code = STATE_DONE;
 		else
-			xiic_wakeup(i2c, STATE_ERROR);
+			wakeup_code = STATE_ERROR;
 	}
 	if (pend & (XIIC_INTR_TX_EMPTY_MASK | XIIC_INTR_TX_HALF_MASK)) {
 		/* Transmit register/FIFO is empty or ½ empty */
@@ -491,7 +499,7 @@ static irqreturn_t xiic_process(int irq, void *dev_id)
 			if (i2c->nmsgs > 1) {
 				i2c->nmsgs--;
 				i2c->tx_msg++;
-				__xiic_start_xfer(i2c);
+				xfer_more = 1;
 			} else {
 				xiic_irq_dis(i2c, XIIC_INTR_TX_HALF_MASK);
 
@@ -509,6 +517,13 @@ static irqreturn_t xiic_process(int irq, void *dev_id)
 	dev_dbg(i2c->adap.dev.parent, "%s clr: 0x%x\n", __func__, clr);
 
 	xiic_setreg32(i2c, XIIC_IISR_OFFSET, clr);
+	if (xfer_more)
+		__xiic_start_xfer(i2c);
+	if (wakeup_req)
+		xiic_wakeup(i2c, wakeup_code);
+
+	WARN_ON(xfer_more && wakeup_req);
+
 	mutex_unlock(&i2c->lock);
 	return IRQ_HANDLED;
 }
-- 
2.32.0

