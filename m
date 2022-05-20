Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06A6452E9F2
	for <lists+linux-i2c@lfdr.de>; Fri, 20 May 2022 12:33:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348141AbiETKdh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 20 May 2022 06:33:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348136AbiETKdf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 20 May 2022 06:33:35 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E9AC8CCC2
        for <linux-i2c@vger.kernel.org>; Fri, 20 May 2022 03:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=whHSXYbHza0AY8
        tPCXiERYHBIKvKIgdfZhENGZbjFiQ=; b=JlAjoJYAiEuOaTjZ6fFuw+nCs+TvSK
        Wdj/x/+6TJsX9AVTqmksIdzTdM6ThdtzeKhfvT+/tL02GaUwVcHGAwIcc2FA7ZYd
        PclA3ubraOg9pC19hvs4Fr3C5jkkUvO4fPKpkvTXWUSbj5mpp2JxN9cB8dN7E9e+
        AA1LyHjNfEo0U=
Received: (qmail 3736505 invoked from network); 20 May 2022 12:33:31 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 May 2022 12:33:31 +0200
X-UD-Smtp-Session: l3s3148p1@xgCRBW/fOXJZD+8D
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 1/2] i2c: rcar: avoid race condition with SMIs
Date:   Fri, 20 May 2022 12:33:24 +0200
Message-Id: <20220520103325.81110-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220520103325.81110-1-wsa+renesas@sang-engineering.com>
References: <20220520103325.81110-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

A customer experienced a race condition with 'repeated starts' when a
System Management Interrupt took over for 30us and more. The problem was
that during the SMI a new MAT interrupt came in because we set up the
'repeated start' condition. But the old one was not acknowledged yet.
So, when it was acknowledged after the SMI, the new MAT interrupt was
lost, confusing the state machine of the driver.

The fix consists of two parts. First, we do not clear the status
register for 'repeated starts' when preparing the next message anymore.
The interrupt handlers for sending and receiving data is now solely
responsible for that and it makes the code easier to follow, in fact.
Secondly, clearing the status register is now split up to handle MAT
interrupts independently. This avoids the race condition because the old
MAT interrupt will be now cleared before we initiate the "repeated
start" condition.

Reported-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-rcar.c | 28 +++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index ca61dbe218bf..143cb4186daa 100644
--- a/drivers/i2c/busses/i2c-rcar.c
+++ b/drivers/i2c/busses/i2c-rcar.c
@@ -97,9 +97,6 @@
 #define RCAR_IRQ_RECV	(MNR | MAL | MST | MAT | MDR)
 #define RCAR_IRQ_STOP	(MST)
 
-#define RCAR_IRQ_ACK_SEND	(~(MAT | MDE) & 0x7F)
-#define RCAR_IRQ_ACK_RECV	(~(MAT | MDR) & 0x7F)
-
 #define ID_LAST_MSG	(1 << 0)
 #define ID_FIRST_MSG	(1 << 1)
 #define ID_DONE		(1 << 2)
@@ -161,6 +158,11 @@ static u32 rcar_i2c_read(struct rcar_i2c_priv *priv, int reg)
 	return readl(priv->io + reg);
 }
 
+static void rcar_i2c_clear_irq(struct rcar_i2c_priv *priv, u32 val)
+{
+	writel(~val & 0x7f, priv->io + ICMSR);
+}
+
 static int rcar_i2c_get_scl(struct i2c_adapter *adap)
 {
 	struct rcar_i2c_priv *priv = i2c_get_adapdata(adap);
@@ -356,7 +358,7 @@ static void rcar_i2c_prepare_msg(struct rcar_i2c_priv *priv)
 			priv->flags &= ~ID_P_REP_AFTER_RD;
 		else
 			rcar_i2c_write(priv, ICMCR, RCAR_BUS_PHASE_START);
-		rcar_i2c_write(priv, ICMSR, 0);
+		/* ICMSR is cleared in interrupt handlers */
 	}
 }
 
@@ -476,11 +478,15 @@ static bool rcar_i2c_dma(struct rcar_i2c_priv *priv)
 static void rcar_i2c_irq_send(struct rcar_i2c_priv *priv, u32 msr)
 {
 	struct i2c_msg *msg = priv->msg;
+	u32 irqs_to_clear = MDE;
 
 	/* FIXME: sometimes, unknown interrupt happened. Do nothing */
 	if (!(msr & MDE))
 		return;
 
+	if (msr & MAT)
+		irqs_to_clear |= MAT;
+
 	/* Check if DMA can be enabled and take over */
 	if (priv->pos == 1 && rcar_i2c_dma(priv))
 		return;
@@ -504,32 +510,32 @@ static void rcar_i2c_irq_send(struct rcar_i2c_priv *priv, u32 msr)
 		 * [ICRXTX] -> [SHIFT] -> [I2C bus]
 		 */
 
-		if (priv->flags & ID_LAST_MSG) {
+		if (priv->flags & ID_LAST_MSG)
 			/*
 			 * If current msg is the _LAST_ msg,
 			 * prepare stop condition here.
 			 * ID_DONE will be set on STOP irq.
 			 */
 			rcar_i2c_write(priv, ICMCR, RCAR_BUS_PHASE_STOP);
-		} else {
+		else
 			rcar_i2c_next_msg(priv);
-			return;
-		}
 	}
 
-	rcar_i2c_write(priv, ICMSR, RCAR_IRQ_ACK_SEND);
+	rcar_i2c_clear_irq(priv, irqs_to_clear);
 }
 
 static void rcar_i2c_irq_recv(struct rcar_i2c_priv *priv, u32 msr)
 {
 	struct i2c_msg *msg = priv->msg;
 	bool recv_len_init = priv->pos == 0 && msg->flags & I2C_M_RECV_LEN;
+	u32 irqs_to_clear = MDR;
 
 	/* FIXME: sometimes, unknown interrupt happened. Do nothing */
 	if (!(msr & MDR))
 		return;
 
 	if (msr & MAT) {
+		irqs_to_clear |= MAT;
 		/*
 		 * Address transfer phase finished, but no data at this point.
 		 * Try to use DMA to receive data.
@@ -570,8 +576,8 @@ static void rcar_i2c_irq_recv(struct rcar_i2c_priv *priv, u32 msr)
 
 	if (priv->pos == msg->len && !(priv->flags & ID_LAST_MSG))
 		rcar_i2c_next_msg(priv);
-	else
-		rcar_i2c_write(priv, ICMSR, RCAR_IRQ_ACK_RECV);
+
+	rcar_i2c_clear_irq(priv, irqs_to_clear);
 }
 
 static bool rcar_i2c_slave_irq(struct rcar_i2c_priv *priv)
-- 
2.35.1

