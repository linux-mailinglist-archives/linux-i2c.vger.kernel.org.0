Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29EA552F466
	for <lists+linux-i2c@lfdr.de>; Fri, 20 May 2022 22:29:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241803AbiETU3b (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 20 May 2022 16:29:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353446AbiETU3a (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 20 May 2022 16:29:30 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35430186286
        for <linux-i2c@vger.kernel.org>; Fri, 20 May 2022 13:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=rHfBZDV61v2cgd
        nDCsDQmTlJBFkrE/duuOMKhNkhQbI=; b=dVu79n/uWLd+hEO/yCPp+yCRc5Zjra
        wvITFVBZyMPQcTL4TJ6k6RKtyA/gjILztgvzmkVZRLA5+R3OVw2JTvZNNgYBeeVx
        93pYoQoSZAIcw5gXJQ6V9JMlvSHpmuPwp2ME+vGX92h+xzXrGJMNq+Fz7DPREh5P
        acdPLwiop5BRU=
Received: (qmail 3917320 invoked from network); 20 May 2022 22:29:26 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 May 2022 22:29:26 +0200
X-UD-Smtp-Session: l3s3148p1@b9OxWHffiOsgAwDtxwyXAGMY7IbT6g6m
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 3/3] i2c: rcar: use flags instead of atomic_xfer
Date:   Fri, 20 May 2022 22:29:18 +0200
Message-Id: <20220520202918.17889-4-wsa+renesas@sang-engineering.com>
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

From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

i2c-rcar already has priv->flags. This patch adds a new persistent flag
ID_P_NOT_ATOMIC and uses it to save the extra variable. The negation of
the logic was done to make the code more readable.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
[wsa: negated the logic, rebased, updated the commit message]
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-rcar.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index 034d1ec64cf0..6e7be9d9f504 100644
--- a/drivers/i2c/busses/i2c-rcar.c
+++ b/drivers/i2c/busses/i2c-rcar.c
@@ -104,10 +104,11 @@
 #define ID_NACK			BIT(4)
 #define ID_EPROTO		BIT(5)
 /* persistent flags */
+#define ID_P_NOT_ATOMIC		BIT(28)
 #define ID_P_HOST_NOTIFY	BIT(29)
 #define ID_P_NO_RXDMA		BIT(30) /* HW forbids RXDMA sometimes */
 #define ID_P_PM_BLOCKED		BIT(31)
-#define ID_P_MASK		GENMASK(31, 29)
+#define ID_P_MASK		GENMASK(31, 28)
 
 enum rcar_i2c_type {
 	I2C_RCAR_GEN1,
@@ -138,7 +139,6 @@ struct rcar_i2c_priv {
 	enum dma_data_direction dma_direction;
 
 	struct reset_control *rstc;
-	bool atomic_xfer;
 	int irq;
 
 	struct i2c_client *host_notify_client;
@@ -350,7 +350,7 @@ static void rcar_i2c_prepare_msg(struct rcar_i2c_priv *priv)
 		priv->flags |= ID_LAST_MSG;
 
 	rcar_i2c_write(priv, ICMAR, i2c_8bit_addr_from_msg(priv->msg));
-	if (!priv->atomic_xfer)
+	if (priv->flags & ID_P_NOT_ATOMIC)
 		rcar_i2c_write(priv, ICMIER, read ? RCAR_IRQ_RECV : RCAR_IRQ_SEND);
 
 	if (rep_start)
@@ -420,7 +420,7 @@ static bool rcar_i2c_dma(struct rcar_i2c_priv *priv)
 	int len;
 
 	/* Do various checks to see if DMA is feasible at all */
-	if (priv->atomic_xfer || IS_ERR(chan) || msg->len < RCAR_MIN_DMA_LEN ||
+	if (!(priv->flags & ID_P_NOT_ATOMIC) || IS_ERR(chan) || msg->len < RCAR_MIN_DMA_LEN ||
 	    !(msg->flags & I2C_M_DMA_SAFE) || (read && priv->flags & ID_P_NO_RXDMA))
 		return false;
 
@@ -670,7 +670,7 @@ static irqreturn_t rcar_i2c_irq(int irq, struct rcar_i2c_priv *priv, u32 msr)
 	/* Nack */
 	if (msr & MNR) {
 		/* HW automatically sends STOP after received NACK */
-		if (!priv->atomic_xfer)
+		if (priv->flags & ID_P_NOT_ATOMIC)
 			rcar_i2c_write(priv, ICMIER, RCAR_IRQ_STOP);
 		priv->flags |= ID_NACK;
 		goto out;
@@ -692,7 +692,7 @@ static irqreturn_t rcar_i2c_irq(int irq, struct rcar_i2c_priv *priv, u32 msr)
 	if (priv->flags & ID_DONE) {
 		rcar_i2c_write(priv, ICMIER, 0);
 		rcar_i2c_write(priv, ICMSR, 0);
-		if (!priv->atomic_xfer)
+		if (priv->flags & ID_P_NOT_ATOMIC)
 			wake_up(&priv->wait);
 	}
 
@@ -710,7 +710,7 @@ static irqreturn_t rcar_i2c_gen2_irq(int irq, void *ptr)
 
 	/* Only handle interrupts that are currently enabled */
 	msr = rcar_i2c_read(priv, ICMSR);
-	if (!priv->atomic_xfer)
+	if (priv->flags & ID_P_NOT_ATOMIC)
 		msr &= rcar_i2c_read(priv, ICMIER);
 
 	return rcar_i2c_irq(irq, priv, msr);
@@ -723,7 +723,7 @@ static irqreturn_t rcar_i2c_gen3_irq(int irq, void *ptr)
 
 	/* Only handle interrupts that are currently enabled */
 	msr = rcar_i2c_read(priv, ICMSR);
-	if (!priv->atomic_xfer)
+	if (priv->flags & ID_P_NOT_ATOMIC)
 		msr &= rcar_i2c_read(priv, ICMIER);
 
 	/*
@@ -832,7 +832,7 @@ static int rcar_i2c_master_xfer(struct i2c_adapter *adap,
 	int i, ret;
 	long time_left;
 
-	priv->atomic_xfer = false;
+	priv->flags |= ID_P_NOT_ATOMIC;
 
 	pm_runtime_get_sync(dev);
 
@@ -896,7 +896,7 @@ static int rcar_i2c_master_xfer_atomic(struct i2c_adapter *adap,
 	bool time_left;
 	int ret;
 
-	priv->atomic_xfer = true;
+	priv->flags &= ~ID_P_NOT_ATOMIC;
 
 	pm_runtime_get_sync(dev);
 
-- 
2.35.1

