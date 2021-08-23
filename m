Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8411E3F52F7
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Aug 2021 23:42:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232981AbhHWVnD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 23 Aug 2021 17:43:03 -0400
Received: from phobos.denx.de ([85.214.62.61]:40868 "EHLO phobos.denx.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232970AbhHWVnC (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 23 Aug 2021 17:43:02 -0400
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 77F4882D3C;
        Mon, 23 Aug 2021 23:42:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1629754937;
        bh=DXpoiNJN9yfkPKq5NcMQBP72L7KIlxhNlrAJAYLhDsY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=n44W0uYrZD7Zz9tqBajSCJzLV0bD1wOzvqGybnX8izGFXk0FYdxgDflyteshRWvA4
         MJU/IZ7SKH4P6WSE4SrjjtVbR283MmCK0F8b904qVjc5xedKXkZlPlkwIKjoxLgarX
         NgRSp9o/G033bhcJbDCs9eO/VlmWMUIVkNyKZUK8gX4YZ6X79LKYD8YGnwfRhuspYE
         fEI98/HQSMmdTByBNsrnojzmcidSwJYJ+2vojoUJ649Y7LkR7sTYR1afyRbRg6pfO6
         0Gi23qwfYlq1bGXJCUlA5sgCjVMtnkxAKQfzMNYww+ecV57xxLriCAqzNnq+ua/HMo
         lVZjyFkc/l5cw==
From:   Marek Vasut <marex@denx.de>
To:     linux-i2c@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        Michal Simek <michal.simek@xilinx.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        Wolfram Sang <wsa@kernel.org>
Subject: [PATCH v2 5/6] i2c: xiic: Only ever transfer single message
Date:   Mon, 23 Aug 2021 23:41:44 +0200
Message-Id: <20210823214145.295104-6-marex@denx.de>
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

Transferring multiple messages via XIIC suffers from strange interaction
between the interrupt status/enable register flags. These flags are being
reused in the hardware to indicate different things for read and write
transfer, and doing multiple transactions becomes horribly complex. Just
send a single transaction and reload the controller with another message
once the transaction is done in the interrupt handler thread.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Michal Simek <michal.simek@xilinx.com>
Cc: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Cc: Wolfram Sang <wsa@kernel.org>
---
V2: No change
---
 drivers/i2c/busses/i2c-xiic.c | 44 ++++++++---------------------------
 1 file changed, 10 insertions(+), 34 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index f7277629923ff..6cd7830fe4898 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -609,8 +609,6 @@ static void xiic_start_send(struct xiic_i2c *i2c)
 {
 	struct i2c_msg *msg = i2c->tx_msg;
 
-	xiic_irq_clr(i2c, XIIC_INTR_TX_ERROR_MASK);
-
 	dev_dbg(i2c->adap.dev.parent, "%s entry, msg: %p, len: %d",
 		__func__, msg, msg->len);
 	dev_dbg(i2c->adap.dev.parent, "%s entry, ISR: 0x%x, CR: 0x%x\n",
@@ -628,16 +626,17 @@ static void xiic_start_send(struct xiic_i2c *i2c)
 		xiic_setreg16(i2c, XIIC_DTR_REG_OFFSET, data);
 	}
 
-	xiic_fill_tx_fifo(i2c);
-
 	/* Clear any pending Tx empty, Tx Error and then enable them. */
 	xiic_irq_clr_en(i2c, XIIC_INTR_TX_EMPTY_MASK | XIIC_INTR_TX_ERROR_MASK |
-		XIIC_INTR_BNB_MASK);
+		XIIC_INTR_BNB_MASK |
+		((i2c->nmsgs > 1 || xiic_tx_space(i2c)) ?
+			XIIC_INTR_TX_HALF_MASK : 0));
+
+	xiic_fill_tx_fifo(i2c);
 }
 
 static void __xiic_start_xfer(struct xiic_i2c *i2c)
 {
-	int first = 1;
 	int fifo_space = xiic_tx_fifo_space(i2c);
 	dev_dbg(i2c->adap.dev.parent, "%s entry, msg: %p, fifos space: %d\n",
 		__func__, i2c->tx_msg, fifo_space);
@@ -648,35 +647,12 @@ static void __xiic_start_xfer(struct xiic_i2c *i2c)
 	i2c->rx_pos = 0;
 	i2c->tx_pos = 0;
 	i2c->state = STATE_START;
-	while ((fifo_space >= 2) && (first || (i2c->nmsgs > 1))) {
-		if (!first) {
-			i2c->nmsgs--;
-			i2c->tx_msg++;
-			i2c->tx_pos = 0;
-		} else
-			first = 0;
-
-		if (i2c->tx_msg->flags & I2C_M_RD) {
-			/* we dont date putting several reads in the FIFO */
-			xiic_start_recv(i2c);
-			return;
-		} else {
-			xiic_start_send(i2c);
-			if (xiic_tx_space(i2c) != 0) {
-				/* the message could not be completely sent */
-				break;
-			}
-		}
-
-		fifo_space = xiic_tx_fifo_space(i2c);
+	if (i2c->tx_msg->flags & I2C_M_RD) {
+		/* we dont date putting several reads in the FIFO */
+		xiic_start_recv(i2c);
+	} else {
+		xiic_start_send(i2c);
 	}
-
-	/* there are more messages or the current one could not be completely
-	 * put into the FIFO, also enable the half empty interrupt
-	 */
-	if (i2c->nmsgs > 1 || xiic_tx_space(i2c))
-		xiic_irq_clr_en(i2c, XIIC_INTR_TX_HALF_MASK);
-
 }
 
 static int xiic_start_xfer(struct xiic_i2c *i2c, struct i2c_msg *msgs, int num)
-- 
2.32.0

