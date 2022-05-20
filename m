Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABBB152F464
	for <lists+linux-i2c@lfdr.de>; Fri, 20 May 2022 22:29:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353453AbiETU3b (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 20 May 2022 16:29:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347363AbiETU3a (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 20 May 2022 16:29:30 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37FEF185C87
        for <linux-i2c@vger.kernel.org>; Fri, 20 May 2022 13:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=U29WYmQyVQCYUu
        V8AWl6uqxuHoxGbWuriGBrCNSHgRs=; b=mEazvjZqGGpMBb6NFCskHYFKKePDvY
        eZi9krVXQjaWWxFweSANE3eBZcq5CX2tVOnAhuWFe/PJmsPNbx9lcE4O1t4TQazw
        6Nwe7W+lQFzgeqIcKCcj8LTOpp9CpVDbW2OoR+Q/w+fFOWCpYLyjWTATSG5ygNOF
        ZOake1cEYjbc0=
Received: (qmail 3917295 invoked from network); 20 May 2022 22:29:25 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 May 2022 22:29:25 +0200
X-UD-Smtp-Session: l3s3148p1@YZinWHffhusgAwDtxwyXAGMY7IbT6g6m
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 2/3] i2c: rcar: REP_AFTER_RD is not a persistent flag
Date:   Fri, 20 May 2022 22:29:17 +0200
Message-Id: <20220520202918.17889-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220520202918.17889-1-wsa+renesas@sang-engineering.com>
References: <20220520202918.17889-1-wsa+renesas@sang-engineering.com>
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

Previous refactoring makes it easy now to convert the above flag to a
non-persistent one. This is more apropriate and easier to maintain.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-rcar.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index 88d060725301..034d1ec64cf0 100644
--- a/drivers/i2c/busses/i2c-rcar.c
+++ b/drivers/i2c/busses/i2c-rcar.c
@@ -98,16 +98,16 @@
 #define RCAR_IRQ_STOP	(MST)
 
 #define ID_LAST_MSG		BIT(0)
+#define ID_REP_AFTER_RD		BIT(1)
 #define ID_DONE			BIT(2)
 #define ID_ARBLOST		BIT(3)
 #define ID_NACK			BIT(4)
 #define ID_EPROTO		BIT(5)
 /* persistent flags */
-#define ID_P_HOST_NOTIFY	BIT(28)
-#define ID_P_REP_AFTER_RD	BIT(29)
+#define ID_P_HOST_NOTIFY	BIT(29)
 #define ID_P_NO_RXDMA		BIT(30) /* HW forbids RXDMA sometimes */
 #define ID_P_PM_BLOCKED		BIT(31)
-#define ID_P_MASK		GENMASK(31, 28)
+#define ID_P_MASK		GENMASK(31, 29)
 
 enum rcar_i2c_type {
 	I2C_RCAR_GEN1,
@@ -341,6 +341,7 @@ static int rcar_i2c_clock_calculate(struct rcar_i2c_priv *priv)
 static void rcar_i2c_prepare_msg(struct rcar_i2c_priv *priv)
 {
 	int read = !!rcar_i2c_is_recv(priv);
+	bool rep_start = !(priv->flags & ID_REP_AFTER_RD);
 
 	priv->pos = 0;
 	priv->flags &= ID_P_MASK;
@@ -352,9 +353,7 @@ static void rcar_i2c_prepare_msg(struct rcar_i2c_priv *priv)
 	if (!priv->atomic_xfer)
 		rcar_i2c_write(priv, ICMIER, read ? RCAR_IRQ_RECV : RCAR_IRQ_SEND);
 
-	if (priv->flags & ID_P_REP_AFTER_RD)
-		priv->flags &= ~ID_P_REP_AFTER_RD;
-	else
+	if (rep_start)
 		rcar_i2c_write(priv, ICMCR, RCAR_BUS_PHASE_START);
 }
 
@@ -575,7 +574,7 @@ static void rcar_i2c_irq_recv(struct rcar_i2c_priv *priv, u32 msr)
 			rcar_i2c_write(priv, ICMCR, RCAR_BUS_PHASE_STOP);
 		} else {
 			rcar_i2c_write(priv, ICMCR, RCAR_BUS_PHASE_START);
-			priv->flags |= ID_P_REP_AFTER_RD;
+			priv->flags |= ID_REP_AFTER_RD;
 		}
 	}
 
@@ -706,7 +705,7 @@ static irqreturn_t rcar_i2c_gen2_irq(int irq, void *ptr)
 	u32 msr;
 
 	/* Clear START or STOP immediately, except for REPSTART after read */
-	if (likely(!(priv->flags & ID_P_REP_AFTER_RD)))
+	if (likely(!(priv->flags & ID_REP_AFTER_RD)))
 		rcar_i2c_write(priv, ICMCR, RCAR_BUS_PHASE_DATA);
 
 	/* Only handle interrupts that are currently enabled */
@@ -731,7 +730,7 @@ static irqreturn_t rcar_i2c_gen3_irq(int irq, void *ptr)
 	 * Clear START or STOP immediately, except for REPSTART after read or
 	 * if a spurious interrupt was detected.
 	 */
-	if (likely(!(priv->flags & ID_P_REP_AFTER_RD) && msr))
+	if (likely(!(priv->flags & ID_REP_AFTER_RD) && msr))
 		rcar_i2c_write(priv, ICMCR, RCAR_BUS_PHASE_DATA);
 
 	return rcar_i2c_irq(irq, priv, msr);
-- 
2.35.1

