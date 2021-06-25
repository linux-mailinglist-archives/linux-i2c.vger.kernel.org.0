Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 739EA3B3C23
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Jun 2021 07:22:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233086AbhFYFY4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 25 Jun 2021 01:24:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:46250 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233152AbhFYFY4 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 25 Jun 2021 01:24:56 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 594B161424;
        Fri, 25 Jun 2021 05:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624598556;
        bh=2GtxjBuEOxjqWXeb1a0iOKkA/oBn6Uv+LXGjT67q1F4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=o3PY/btYw+I7gA3JEQit5/BaPv+fnV9TXsqLkld/W2CzaTp8PvGWyEttAc4nETz1v
         Sy0VHS06A2XXAVwQweOMhlDNQbGODymeKAEoyuA5JvyiP51IkHEpKBhlkd1PBwUUpW
         3pIla11IdzSOLuvUUAO/EGepywIuI2UMJahzgVlsSshpC+XKwVTtc8++VgyXho8IQ4
         ZHo6ZjFAbGFb0M33qWf5K5GCQc0pE9ZdfQWIqaXKX5ScvGkxyF4pu6hOAqe3w09GNT
         j71ai1ZBfGqo/57ghgubFdybfNPrMlj6ZHoLPWeMqClJH40bhQB51jsWdJDCjY73am
         SD6p9Mb/rE9ag==
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mark Brown <broonie@kernel.org>, Wolfram Sang <wsa@kernel.org>
Cc:     Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/5] soc: qcom: geni: Add support for gpi dma
Date:   Fri, 25 Jun 2021 10:52:10 +0530
Message-Id: <20210625052213.32260-3-vkoul@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210625052213.32260-1-vkoul@kernel.org>
References: <20210625052213.32260-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

GPI DMA is one of the DMA modes supported on geni, this adds support to
enable that mode

Also do better documentation of the enum geni_se_xfer_mode.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/soc/qcom/qcom-geni-se.c | 29 ++++++++++++++++++++++++++++-
 include/linux/qcom-geni-se.h    | 15 ++++++++++++++-
 2 files changed, 42 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index fe666ea0c487..7d649d2cf31e 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -321,6 +321,30 @@ static void geni_se_select_dma_mode(struct geni_se *se)
 		writel_relaxed(val, se->base + SE_GENI_DMA_MODE_EN);
 }
 
+static void geni_se_select_gpi_mode(struct geni_se *se)
+{
+	u32 val;
+
+	geni_se_irq_clear(se);
+
+	writel(0, se->base + SE_IRQ_EN);
+
+	val = readl(se->base + SE_GENI_S_IRQ_EN);
+	val &= ~S_CMD_DONE_EN;
+	writel(val, se->base + SE_GENI_S_IRQ_EN);
+
+	val = readl(se->base + SE_GENI_M_IRQ_EN);
+	val &= ~(M_CMD_DONE_EN | M_TX_FIFO_WATERMARK_EN |
+		 M_RX_FIFO_WATERMARK_EN | M_RX_FIFO_LAST_EN);
+	writel(val, se->base + SE_GENI_M_IRQ_EN);
+
+	writel(GENI_DMA_MODE_EN, se->base + SE_GENI_DMA_MODE_EN);
+
+	val = readl(se->base + SE_GSI_EVENT_EN);
+	val |= (DMA_RX_EVENT_EN | DMA_TX_EVENT_EN | GENI_M_EVENT_EN | GENI_S_EVENT_EN);
+	writel(val, se->base + SE_GSI_EVENT_EN);
+}
+
 /**
  * geni_se_select_mode() - Select the serial engine transfer mode
  * @se:		Pointer to the concerned serial engine.
@@ -328,7 +352,7 @@ static void geni_se_select_dma_mode(struct geni_se *se)
  */
 void geni_se_select_mode(struct geni_se *se, enum geni_se_xfer_mode mode)
 {
-	WARN_ON(mode != GENI_SE_FIFO && mode != GENI_SE_DMA);
+	WARN_ON(mode != GENI_SE_FIFO && mode != GENI_SE_DMA && mode != GENI_GPI_DMA);
 
 	switch (mode) {
 	case GENI_SE_FIFO:
@@ -337,6 +361,9 @@ void geni_se_select_mode(struct geni_se *se, enum geni_se_xfer_mode mode)
 	case GENI_SE_DMA:
 		geni_se_select_dma_mode(se);
 		break;
+	case GENI_GPI_DMA:
+		geni_se_select_gpi_mode(se);
+		break;
 	case GENI_SE_INVALID:
 	default:
 		break;
diff --git a/include/linux/qcom-geni-se.h b/include/linux/qcom-geni-se.h
index 5114e2144b17..f5672785c0c4 100644
--- a/include/linux/qcom-geni-se.h
+++ b/include/linux/qcom-geni-se.h
@@ -8,11 +8,24 @@
 
 #include <linux/interconnect.h>
 
-/* Transfer mode supported by GENI Serial Engines */
+/**
+ * enum geni_se_xfer_mode: Transfer modes supported by Serial Engines
+ *
+ * @GENI_SE_INVALID: Invalid mode
+ * @GENI_SE_FIFO: FIFO mode. Data is transferred with SE FIFO
+ * by programmed IO method
+ * @GENI_SE_DMA: Serial Engine DMA mode. Data is transferred
+ * with SE by DMAengine internal to SE
+ * @GENI_GPI_DMA: GPI DMA mode. Data is transferred using a DMAengine
+ * configured by a firmware residing on a GSI engine. This DMA name is
+ * interchangeably used as GSI or GPI which seem to imply the same DMAengine
+ */
+
 enum geni_se_xfer_mode {
 	GENI_SE_INVALID,
 	GENI_SE_FIFO,
 	GENI_SE_DMA,
+	GENI_GPI_DMA,
 };
 
 /* Protocols supported by GENI Serial Engines */
-- 
2.31.1

