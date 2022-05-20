Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F50652E9F3
	for <lists+linux-i2c@lfdr.de>; Fri, 20 May 2022 12:33:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348143AbiETKdg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 20 May 2022 06:33:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348141AbiETKdg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 20 May 2022 06:33:36 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D105D8CB20
        for <linux-i2c@vger.kernel.org>; Fri, 20 May 2022 03:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=EsubzTIPZKYeLm
        X/QaAIPlUCB5hQR3IE88ztaYIh7mg=; b=waTEqvh1SDRuSOsEPR2KK1BzX6Z5zM
        RmF70kcdPylImbiaX8fdrs53134zz7RlfD5fd0ZM6kvMFiAxFcVsc6j7W5HpECha
        scWIPgbZnvPUu0yudD6IxZjZ/fIgsFG5Us1c4ZZgPhDEXsc0xEU9W6uzSQCZK+/b
        yqLtjIYSoduic=
Received: (qmail 3736535 invoked from network); 20 May 2022 12:33:32 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 May 2022 12:33:32 +0200
X-UD-Smtp-Session: l3s3148p1@ug2gBW/fqw1ZD+8D
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 2/2] i2c: rcar: refactor handling of first message
Date:   Fri, 20 May 2022 12:33:25 +0200
Message-Id: <20220520103325.81110-3-wsa+renesas@sang-engineering.com>
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

After moving ICMSR handling to interrupt handlers previously to fix a
race condition, we can now also move ICMSR handling for the first
message out of the function to prepare a message. By introducing a
seperate function to initialize the first message, we can not only
remove some code duplication but the remaining code is also easier to
follow. The function to prepare a message is much simpler without ICMSR
handling.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-rcar.c | 50 ++++++++++++++++-------------------
 1 file changed, 23 insertions(+), 27 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index 143cb4186daa..f69903397285 100644
--- a/drivers/i2c/busses/i2c-rcar.c
+++ b/drivers/i2c/busses/i2c-rcar.c
@@ -98,7 +98,6 @@
 #define RCAR_IRQ_STOP	(MST)
 
 #define ID_LAST_MSG	(1 << 0)
-#define ID_FIRST_MSG	(1 << 1)
 #define ID_DONE		(1 << 2)
 #define ID_ARBLOST	(1 << 3)
 #define ID_NACK		(1 << 4)
@@ -333,11 +332,19 @@ static int rcar_i2c_clock_calculate(struct rcar_i2c_priv *priv)
 	return 0;
 }
 
+/*
+ * We don't have a test case but the HW engineers say that the write order of
+ * ICMSR and ICMCR depends on whether we issue START or REP_START. So, ICMSR
+ * handling is outside of this function. First messages clear ICMSR before this
+ * function, interrupt handlers clear the relevant bits after this function.
+ */
 static void rcar_i2c_prepare_msg(struct rcar_i2c_priv *priv)
 {
 	int read = !!rcar_i2c_is_recv(priv);
 
 	priv->pos = 0;
+	priv->flags &= ID_P_MASK;
+
 	if (priv->msgs_left == 1)
 		priv->flags |= ID_LAST_MSG;
 
@@ -345,29 +352,27 @@ static void rcar_i2c_prepare_msg(struct rcar_i2c_priv *priv)
 	if (!priv->atomic_xfer)
 		rcar_i2c_write(priv, ICMIER, read ? RCAR_IRQ_RECV : RCAR_IRQ_SEND);
 
-	/*
-	 * We don't have a test case but the HW engineers say that the write order
-	 * of ICMSR and ICMCR depends on whether we issue START or REP_START. Since
-	 * it didn't cause a drawback for me, let's rather be safe than sorry.
-	 */
-	if (priv->flags & ID_FIRST_MSG) {
-		rcar_i2c_write(priv, ICMSR, 0);
+	if (priv->flags & ID_P_REP_AFTER_RD)
+		priv->flags &= ~ID_P_REP_AFTER_RD;
+	else
 		rcar_i2c_write(priv, ICMCR, RCAR_BUS_PHASE_START);
-	} else {
-		if (priv->flags & ID_P_REP_AFTER_RD)
-			priv->flags &= ~ID_P_REP_AFTER_RD;
-		else
-			rcar_i2c_write(priv, ICMCR, RCAR_BUS_PHASE_START);
-		/* ICMSR is cleared in interrupt handlers */
-	}
+}
+
+static void rcar_i2c_first_msg(struct rcar_i2c_priv *priv,
+			       struct i2c_msg *msgs, int num)
+{
+	priv->msg = msgs;
+	priv->msgs_left = num;
+	rcar_i2c_write(priv, ICMSR, 0); /* must be before preparing msg */
+	rcar_i2c_prepare_msg(priv);
 }
 
 static void rcar_i2c_next_msg(struct rcar_i2c_priv *priv)
 {
 	priv->msg++;
 	priv->msgs_left--;
-	priv->flags &= ID_P_MASK;
 	rcar_i2c_prepare_msg(priv);
+	/* ICMSR handling must come afterwards in the irq handler */
 }
 
 static void rcar_i2c_cleanup_dma(struct rcar_i2c_priv *priv, bool terminate)
@@ -852,11 +857,7 @@ static int rcar_i2c_master_xfer(struct i2c_adapter *adap,
 	for (i = 0; i < num; i++)
 		rcar_i2c_request_dma(priv, msgs + i);
 
-	/* init first message */
-	priv->msg = msgs;
-	priv->msgs_left = num;
-	priv->flags = (priv->flags & ID_P_MASK) | ID_FIRST_MSG;
-	rcar_i2c_prepare_msg(priv);
+	rcar_i2c_first_msg(priv, msgs, num);
 
 	time_left = wait_event_timeout(priv->wait, priv->flags & ID_DONE,
 				     num * adap->timeout);
@@ -906,12 +907,7 @@ static int rcar_i2c_master_xfer_atomic(struct i2c_adapter *adap,
 		goto out;
 
 	rcar_i2c_init(priv);
-
-	/* init first message */
-	priv->msg = msgs;
-	priv->msgs_left = num;
-	priv->flags = (priv->flags & ID_P_MASK) | ID_FIRST_MSG;
-	rcar_i2c_prepare_msg(priv);
+	rcar_i2c_first_msg(priv, msgs, num);
 
 	j = jiffies + num * adap->timeout;
 	do {
-- 
2.35.1

