Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E1C346CF55
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Dec 2021 09:45:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229543AbhLHIta (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Dec 2021 03:49:30 -0500
Received: from www.zeus03.de ([194.117.254.33]:51506 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229534AbhLHIt3 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 8 Dec 2021 03:49:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=hKlYOOujtt6xvfk3cIOEDYTH9sV
        0I+ud6x4mCtg+Q+M=; b=Jk2Y5iuiYVAILM+HMKXij6N83j7g9dy/9TB+SmXjKIJ
        esQJsJERrZXPlIXZGlQgYzSd38yIHj/ZYj/x4I/pkqul801S2p0qE0oeGhAaT+m8
        I+ZqDOHovqZRk1ddPubPILBF+Fw3uLJ13t0vqur8wX9yKhtGdONgm+zCMhVkv8HQ
        =
Received: (qmail 562677 invoked from network); 8 Dec 2021 09:45:56 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 8 Dec 2021 09:45:56 +0100
X-UD-Smtp-Session: l3s3148p1@QeJ6hJ7SpLIgAwDPXwXFABlafC1M4YKF
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 1/2] i2c: rcar: update to new DMAENGINE API when terminating
Date:   Wed,  8 Dec 2021 09:45:42 +0100
Message-Id: <20211208084543.20181-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

dmaengine_terminate_all() is deprecated. When converting the existing
calls, it turned out that the termination in the interrupt handlers was
superfluous and only a side effect of simply calling
rcar_i2c_cleanup_dma(). As either no DMA transfers have been submitted
yet or the last one has successfully completed, there is nothing to
terminate and we can leave it out. So, merge the DMA unmap and cleanup
function to save some code. Then, add a flag if the new cleanup function
needs to terminate DMA. This is only the case for the erorr handling in
the main thread, so we can finally switch from dmaengine_terminate_all()
to dmaengine_terminate_sync() here.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-rcar.c | 26 +++++++++-----------------
 1 file changed, 9 insertions(+), 17 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index fc13511f4562..f71c730f9838 100644
--- a/drivers/i2c/busses/i2c-rcar.c
+++ b/drivers/i2c/busses/i2c-rcar.c
@@ -367,11 +367,15 @@ static void rcar_i2c_next_msg(struct rcar_i2c_priv *priv)
 	rcar_i2c_prepare_msg(priv);
 }
 
-static void rcar_i2c_dma_unmap(struct rcar_i2c_priv *priv)
+static void rcar_i2c_cleanup_dma(struct rcar_i2c_priv *priv, bool terminate)
 {
 	struct dma_chan *chan = priv->dma_direction == DMA_FROM_DEVICE
 		? priv->dma_rx : priv->dma_tx;
 
+	/* only allowed from thread context! */
+	if (terminate)
+		dmaengine_terminate_sync(chan);
+
 	dma_unmap_single(chan->device->dev, sg_dma_address(&priv->sg),
 			 sg_dma_len(&priv->sg), priv->dma_direction);
 
@@ -386,25 +390,13 @@ static void rcar_i2c_dma_unmap(struct rcar_i2c_priv *priv)
 	rcar_i2c_write(priv, ICDMAER, 0);
 }
 
-static void rcar_i2c_cleanup_dma(struct rcar_i2c_priv *priv)
-{
-	if (priv->dma_direction == DMA_NONE)
-		return;
-	else if (priv->dma_direction == DMA_FROM_DEVICE)
-		dmaengine_terminate_all(priv->dma_rx);
-	else if (priv->dma_direction == DMA_TO_DEVICE)
-		dmaengine_terminate_all(priv->dma_tx);
-
-	rcar_i2c_dma_unmap(priv);
-}
-
 static void rcar_i2c_dma_callback(void *data)
 {
 	struct rcar_i2c_priv *priv = data;
 
 	priv->pos += sg_dma_len(&priv->sg);
 
-	rcar_i2c_dma_unmap(priv);
+	rcar_i2c_cleanup_dma(priv, false);
 }
 
 static bool rcar_i2c_dma(struct rcar_i2c_priv *priv)
@@ -456,7 +448,7 @@ static bool rcar_i2c_dma(struct rcar_i2c_priv *priv)
 					 DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
 	if (!txdesc) {
 		dev_dbg(dev, "dma prep slave sg failed, using PIO\n");
-		rcar_i2c_cleanup_dma(priv);
+		rcar_i2c_cleanup_dma(priv, false);
 		return false;
 	}
 
@@ -466,7 +458,7 @@ static bool rcar_i2c_dma(struct rcar_i2c_priv *priv)
 	cookie = dmaengine_submit(txdesc);
 	if (dma_submit_error(cookie)) {
 		dev_dbg(dev, "submitting dma failed, using PIO\n");
-		rcar_i2c_cleanup_dma(priv);
+		rcar_i2c_cleanup_dma(priv, false);
 		return false;
 	}
 
@@ -846,7 +838,7 @@ static int rcar_i2c_master_xfer(struct i2c_adapter *adap,
 
 	/* cleanup DMA if it couldn't complete properly due to an error */
 	if (priv->dma_direction != DMA_NONE)
-		rcar_i2c_cleanup_dma(priv);
+		rcar_i2c_cleanup_dma(priv, true);
 
 	if (!time_left) {
 		rcar_i2c_init(priv);
-- 
2.30.2

