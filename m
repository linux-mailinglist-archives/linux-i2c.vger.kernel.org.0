Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD32146CF57
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Dec 2021 09:46:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229534AbhLHIta (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Dec 2021 03:49:30 -0500
Received: from www.zeus03.de ([194.117.254.33]:51526 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229540AbhLHIt3 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 8 Dec 2021 03:49:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=sde5C8iKX6z/QR
        RzCq5HMFRRgs1YJgDByVp81kFPX/o=; b=lqQANUgQqqFcVMFzB2G79/Qbc2KxNm
        5OSJIgXr8cvafh09wLQb5lpBkvH9ALdZfb5eSf+ALaaR2KG4aHu/NNN72OvpwIsC
        MHYjaEUBJ1ONKDLmcH0JhMmp6ELi4Xj9XuA+hYOLeHZ/SyyiyWYyyqXpeKx/e9uY
        Fv1FJOQG14NwY=
Received: (qmail 562706 invoked from network); 8 Dec 2021 09:45:56 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 8 Dec 2021 09:45:56 +0100
X-UD-Smtp-Session: l3s3148p1@SFmxhJ7SprIgAwDPXwXFABlafC1M4YKF
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 2/2] i2c: sh_mobile: update to new DMAENGINE API when terminating
Date:   Wed,  8 Dec 2021 09:45:43 +0100
Message-Id: <20211208084543.20181-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211208084543.20181-1-wsa+renesas@sang-engineering.com>
References: <20211208084543.20181-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

dmaengine_terminate_all() is deprecated. When converting the existing
calls, it turned out that the termination in the DMA setup and callback
were superfluous and only a side effect of simply calling
rcar_i2c_cleanup_dma(). As either no DMA transfers have been submitted
yet or the last one has successfully completed, there is nothing to
terminate and we can leave it out. So, merge the DMA unmap and cleanup
function to save some code. Then, add a flag if the new cleanup function
needs to terminate DMA. This is only the case for the erorr handling in
the main thread, so we can finally switch from dmaengine_terminate_all()
to dmaengine_terminate_sync() here.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-sh_mobile.c | 26 +++++++++-----------------
 1 file changed, 9 insertions(+), 17 deletions(-)

diff --git a/drivers/i2c/busses/i2c-sh_mobile.c b/drivers/i2c/busses/i2c-sh_mobile.c
index db8fa4186814..7b8caf172851 100644
--- a/drivers/i2c/busses/i2c-sh_mobile.c
+++ b/drivers/i2c/busses/i2c-sh_mobile.c
@@ -442,34 +442,26 @@ static irqreturn_t sh_mobile_i2c_isr(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static void sh_mobile_i2c_dma_unmap(struct sh_mobile_i2c_data *pd)
+static void sh_mobile_i2c_cleanup_dma(struct sh_mobile_i2c_data *pd, bool terminate)
 {
 	struct dma_chan *chan = pd->dma_direction == DMA_FROM_DEVICE
 				? pd->dma_rx : pd->dma_tx;
 
+	/* only allowed from thread context! */
+	if (terminate)
+		dmaengine_terminate_sync(chan);
+
 	dma_unmap_single(chan->device->dev, sg_dma_address(&pd->sg),
 			 pd->msg->len, pd->dma_direction);
 
 	pd->dma_direction = DMA_NONE;
 }
 
-static void sh_mobile_i2c_cleanup_dma(struct sh_mobile_i2c_data *pd)
-{
-	if (pd->dma_direction == DMA_NONE)
-		return;
-	else if (pd->dma_direction == DMA_FROM_DEVICE)
-		dmaengine_terminate_sync(pd->dma_rx);
-	else if (pd->dma_direction == DMA_TO_DEVICE)
-		dmaengine_terminate_sync(pd->dma_tx);
-
-	sh_mobile_i2c_dma_unmap(pd);
-}
-
 static void sh_mobile_i2c_dma_callback(void *data)
 {
 	struct sh_mobile_i2c_data *pd = data;
 
-	sh_mobile_i2c_dma_unmap(pd);
+	sh_mobile_i2c_cleanup_dma(pd, false);
 	pd->pos = pd->msg->len;
 	pd->stop_after_dma = true;
 
@@ -549,7 +541,7 @@ static void sh_mobile_i2c_xfer_dma(struct sh_mobile_i2c_data *pd)
 					 DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
 	if (!txdesc) {
 		dev_dbg(pd->dev, "dma prep slave sg failed, using PIO\n");
-		sh_mobile_i2c_cleanup_dma(pd);
+		sh_mobile_i2c_cleanup_dma(pd, false);
 		return;
 	}
 
@@ -559,7 +551,7 @@ static void sh_mobile_i2c_xfer_dma(struct sh_mobile_i2c_data *pd)
 	cookie = dmaengine_submit(txdesc);
 	if (dma_submit_error(cookie)) {
 		dev_dbg(pd->dev, "submitting dma failed, using PIO\n");
-		sh_mobile_i2c_cleanup_dma(pd);
+		sh_mobile_i2c_cleanup_dma(pd, false);
 		return;
 	}
 
@@ -698,7 +690,7 @@ static int sh_mobile_xfer(struct sh_mobile_i2c_data *pd,
 		if (!time_left) {
 			dev_err(pd->dev, "Transfer request timed out\n");
 			if (pd->dma_direction != DMA_NONE)
-				sh_mobile_i2c_cleanup_dma(pd);
+				sh_mobile_i2c_cleanup_dma(pd, true);
 
 			err = -ETIMEDOUT;
 			break;
-- 
2.30.2

