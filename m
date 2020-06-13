Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 879531F83D0
	for <lists+linux-i2c@lfdr.de>; Sat, 13 Jun 2020 17:08:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726452AbgFMPIM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 13 Jun 2020 11:08:12 -0400
Received: from mail-out.m-online.net ([212.18.0.10]:47149 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726453AbgFMPIH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 13 Jun 2020 11:08:07 -0400
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 49kgvV0nY5z1rVw0;
        Sat, 13 Jun 2020 17:08:06 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 49kgvV0MNFz1qql0;
        Sat, 13 Jun 2020 17:08:06 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id CJTjf4_f7NZi; Sat, 13 Jun 2020 17:08:04 +0200 (CEST)
X-Auth-Info: cIFdFg255UAzKnWC7fD+zxsVmupHZOyKYVOC5m0BH08=
Received: from desktop.lan (ip-86-49-35-8.net.upcbroadband.cz [86.49.35.8])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Sat, 13 Jun 2020 17:08:04 +0200 (CEST)
From:   Marek Vasut <marex@denx.de>
To:     linux-i2c@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        Michal Simek <michal.simek@xilinx.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        Wolfram Sang <wsa@kernel.org>
Subject: [PATCH 5/5] i2c: xiic: Only ever transfer single message
Date:   Sat, 13 Jun 2020 17:07:51 +0200
Message-Id: <20200613150751.114595-5-marex@denx.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200613150751.114595-1-marex@denx.de>
References: <20200613150751.114595-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
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
 drivers/i2c/busses/i2c-xiic.c | 43 ++++++++---------------------------
 1 file changed, 10 insertions(+), 33 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index e4c3427b2f3f5..fad0b84a273d1 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -595,8 +595,6 @@ static void xiic_start_send(struct xiic_i2c *i2c)
 {
 	struct i2c_msg *msg = i2c->tx_msg;
 
-	xiic_irq_clr(i2c, XIIC_INTR_TX_ERROR_MASK);
-
 	dev_dbg(i2c->adap.dev.parent, "%s entry, msg: %p, len: %d",
 		__func__, msg, msg->len);
 	dev_dbg(i2c->adap.dev.parent, "%s entry, ISR: 0x%x, CR: 0x%x\n",
@@ -614,11 +612,13 @@ static void xiic_start_send(struct xiic_i2c *i2c)
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
@@ -634,35 +634,12 @@ static void __xiic_start_xfer(struct xiic_i2c *i2c)
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
2.26.2

