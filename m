Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27B353B179A
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Jun 2021 12:00:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231265AbhFWKCT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Jun 2021 06:02:19 -0400
Received: from www.zeus03.de ([194.117.254.33]:51026 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231186AbhFWKCM (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 23 Jun 2021 06:02:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=I33H4EByZc0csK
        pE0fENe7nleEwl4e+vhGhP/UxIkFY=; b=gx/YfhBRyET/K1MN1Fh7AYxfBYv76Z
        qayK8Mo+Uppd4RT2VwUXDvg11Z422h25sCsEqvqubc/IW8CYlrlybm6XOzALgfjq
        WP8TMKw4yMOmVVxn08y4MxAUgvuEZ8YC71FyRXQLc1QTq+rbLQLTOZM15cQ1C/ta
        t1mfISKUzig9o=
Received: (qmail 2552157 invoked from network); 23 Jun 2021 11:59:47 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 Jun 2021 11:59:47 +0200
X-UD-Smtp-Session: l3s3148p1@HQRw92vFHqogARa4RfhaAavnjlTTqzSz
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-i2c@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 7/7] i2c: stm32f7: : use proper DMAENGINE API for termination
Date:   Wed, 23 Jun 2021 11:59:41 +0200
Message-Id: <20210623095942.3325-8-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210623095942.3325-1-wsa+renesas@sang-engineering.com>
References: <20210623095942.3325-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

dmaengine_terminate_all() is deprecated in favor of explicitly saying if
it should be sync or async. Here, we want dmaengine_terminate_sync()
because there is no other synchronization code in the driver to handle
an async case.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-stm32f7.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index 0138317ea600..9ea074a7ced6 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -1567,7 +1567,7 @@ static irqreturn_t stm32f7_i2c_isr_event_thread(int irq, void *data)
 	if (!ret) {
 		dev_dbg(i2c_dev->dev, "<%s>: Timed out\n", __func__);
 		stm32f7_i2c_disable_dma_req(i2c_dev);
-		dmaengine_terminate_all(dma->chan_using);
+		dmaengine_terminate_sync(dma->chan_using);
 		f7_msg->result = -ETIMEDOUT;
 	}
 
@@ -1637,7 +1637,7 @@ static irqreturn_t stm32f7_i2c_isr_error(int irq, void *data)
 	/* Disable dma */
 	if (i2c_dev->use_dma) {
 		stm32f7_i2c_disable_dma_req(i2c_dev);
-		dmaengine_terminate_all(dma->chan_using);
+		dmaengine_terminate_sync(dma->chan_using);
 	}
 
 	i2c_dev->master_mode = false;
@@ -1678,7 +1678,7 @@ static int stm32f7_i2c_xfer(struct i2c_adapter *i2c_adap,
 		dev_dbg(i2c_dev->dev, "Access to slave 0x%x timed out\n",
 			i2c_dev->msg->addr);
 		if (i2c_dev->use_dma)
-			dmaengine_terminate_all(dma->chan_using);
+			dmaengine_terminate_sync(dma->chan_using);
 		ret = -ETIMEDOUT;
 	}
 
@@ -1727,7 +1727,7 @@ static int stm32f7_i2c_smbus_xfer(struct i2c_adapter *adapter, u16 addr,
 	if (!timeout) {
 		dev_dbg(dev, "Access to slave 0x%x timed out\n", f7_msg->addr);
 		if (i2c_dev->use_dma)
-			dmaengine_terminate_all(dma->chan_using);
+			dmaengine_terminate_sync(dma->chan_using);
 		ret = -ETIMEDOUT;
 		goto pm_free;
 	}
-- 
2.30.2

