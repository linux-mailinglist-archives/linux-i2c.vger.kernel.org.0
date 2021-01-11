Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0852D2F196C
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Jan 2021 16:18:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732928AbhAKPSQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 Jan 2021 10:18:16 -0500
Received: from mail.kernel.org ([198.145.29.99]:54022 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731411AbhAKPSP (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 11 Jan 2021 10:18:15 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3BC4B22AAD;
        Mon, 11 Jan 2021 15:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610378254;
        bh=1RM1BNZzHpaIt39vBzX76yfWIxdh0luCR0ga/vWK/ec=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gUo4RjYUF6So50ry4Kljg0Lh0EN2z9jSL/8wef0YtlLccXbdU6he29iMYAu63AOnL
         Dzlep5gKJgmUXBwhzjS566L7WqiXmFxeE3T7YXJJEPPYsPgWVtZ5K3jn5u0z6MUZ7e
         L7jx4TJB2yGeJoxcDq8fKpn+tmfoCqrH+rPG69hC0pENgIWVhX0ntpHQkqHjTE+eW/
         7rZ87ynuKk1GW9VX2UYxVE2bCf01bNEG86VVqdp+8sMekWLSBqocno9SdmIIhTAF5m
         w3CvnubgnyApx8l+A6BQrxVHEtokaXFQHMtsoCIvO//WhCGS96PydXAnWRVx+W5to6
         KFyK1JiXjmZjQ==
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mark Brown <broonie@kernel.org>, Wolfram Sang <wsa@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/7] soc: qcom: geni: Add support for gpi dma
Date:   Mon, 11 Jan 2021 20:46:47 +0530
Message-Id: <20210111151651.1616813-4-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210111151651.1616813-1-vkoul@kernel.org>
References: <20210111151651.1616813-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

GPI DMA is one of the DMA modes supported on geni, this adds support to
enable that mode

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/soc/qcom/qcom-geni-se.c | 39 ++++++++++++++++++++++++++++++++-
 include/linux/qcom-geni-se.h    |  4 ++++
 2 files changed, 42 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index a3868228ea05..db44dc32e049 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -310,6 +310,39 @@ static void geni_se_select_dma_mode(struct geni_se *se)
 		writel_relaxed(val, se->base + SE_GENI_DMA_MODE_EN);
 }
 
+static int geni_se_select_gpi_mode(struct geni_se *se)
+{
+	unsigned int geni_dma_mode = 0;
+	unsigned int gpi_event_en = 0;
+	unsigned int common_geni_m_irq_en = 0;
+	unsigned int common_geni_s_irq_en = 0;
+
+	common_geni_m_irq_en = readl_relaxed(se->base + SE_GENI_M_IRQ_EN);
+	common_geni_s_irq_en = readl_relaxed(se->base + SE_GENI_S_IRQ_EN);
+	common_geni_m_irq_en &=
+			~(M_CMD_DONE_EN | M_TX_FIFO_WATERMARK_EN |
+			M_RX_FIFO_WATERMARK_EN | M_RX_FIFO_LAST_EN);
+	common_geni_s_irq_en &= ~S_CMD_DONE_EN;
+	geni_dma_mode = readl_relaxed(se->base + SE_GENI_DMA_MODE_EN);
+	gpi_event_en = readl_relaxed(se->base + SE_GSI_EVENT_EN);
+
+	geni_dma_mode |= GENI_DMA_MODE_EN;
+	gpi_event_en |= (DMA_RX_EVENT_EN | DMA_TX_EVENT_EN |
+				GENI_M_EVENT_EN | GENI_S_EVENT_EN);
+
+	writel_relaxed(0, se->base + SE_IRQ_EN);
+	writel_relaxed(common_geni_s_irq_en, se->base + SE_GENI_S_IRQ_EN);
+	writel_relaxed(common_geni_m_irq_en, se->base + SE_GENI_M_IRQ_EN);
+	writel_relaxed(0xFFFFFFFF, se->base + SE_GENI_M_IRQ_CLEAR);
+	writel_relaxed(0xFFFFFFFF, se->base + SE_GENI_S_IRQ_CLEAR);
+	writel_relaxed(0xFFFFFFFF, se->base + SE_DMA_TX_IRQ_CLR);
+	writel_relaxed(0xFFFFFFFF, se->base + SE_DMA_RX_IRQ_CLR);
+	writel_relaxed(geni_dma_mode, se->base + SE_GENI_DMA_MODE_EN);
+	writel_relaxed(gpi_event_en, se->base + SE_GSI_EVENT_EN);
+
+	return 0;
+}
+
 /**
  * geni_se_select_mode() - Select the serial engine transfer mode
  * @se:		Pointer to the concerned serial engine.
@@ -317,7 +350,8 @@ static void geni_se_select_dma_mode(struct geni_se *se)
  */
 void geni_se_select_mode(struct geni_se *se, enum geni_se_xfer_mode mode)
 {
-	WARN_ON(mode != GENI_SE_FIFO && mode != GENI_SE_DMA);
+	WARN_ON(mode != GENI_SE_FIFO && mode != GENI_SE_DMA &&
+		mode != GENI_GPI_DMA);
 
 	switch (mode) {
 	case GENI_SE_FIFO:
@@ -326,6 +360,9 @@ void geni_se_select_mode(struct geni_se *se, enum geni_se_xfer_mode mode)
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
index cb4e40908f9f..12003a6cb133 100644
--- a/include/linux/qcom-geni-se.h
+++ b/include/linux/qcom-geni-se.h
@@ -12,6 +12,7 @@
 enum geni_se_xfer_mode {
 	GENI_SE_INVALID,
 	GENI_SE_FIFO,
+	GENI_GPI_DMA,
 	GENI_SE_DMA,
 };
 
@@ -123,6 +124,9 @@ struct geni_se {
 #define CLK_DIV_MSK			GENMASK(15, 4)
 #define CLK_DIV_SHFT			4
 
+/* GENI_IF_DISABLE_RO fields */
+#define FIFO_IF_DISABLE			(BIT(0))
+
 /* GENI_FW_REVISION_RO fields */
 #define FW_REV_PROTOCOL_MSK		GENMASK(15, 8)
 #define FW_REV_PROTOCOL_SHFT		8
-- 
2.26.2

