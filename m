Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70537244784
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Aug 2020 11:57:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727095AbgHNJ4z (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 14 Aug 2020 05:56:55 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:55261 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726679AbgHNJ4z (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 14 Aug 2020 05:56:55 -0400
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 14 Aug 2020 02:56:54 -0700
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 14 Aug 2020 02:56:52 -0700
Received: from c-rojay-linux.qualcomm.com ([10.206.21.80])
  by ironmsg02-blr.qualcomm.com with ESMTP; 14 Aug 2020 15:26:33 +0530
Received: by c-rojay-linux.qualcomm.com (Postfix, from userid 88981)
        id 477501AC8; Fri, 14 Aug 2020 15:26:32 +0530 (IST)
From:   Roja Rani Yarubandi <rojay@codeaurora.org>
To:     wsa@kernel.org
Cc:     swboyd@chromium.org, dianders@chromium.org,
        saiprakash.ranjan@codeaurora.org, gregkh@linuxfoundation.org,
        mka@chromium.org, akashast@codeaurora.org,
        msavaliy@qti.qualcomm.com, skakit@codeaurora.org,
        rnayak@codeaurora.org, agross@kernel.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        sumit.semwal@linaro.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        Roja Rani Yarubandi <rojay@codeaurora.org>
Subject: [PATCH 2/2] i2c: i2c-qcom-geni: Add shutdown callback for i2c
Date:   Fri, 14 Aug 2020 15:25:40 +0530
Message-Id: <20200814095540.32115-3-rojay@codeaurora.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200814095540.32115-1-rojay@codeaurora.org>
References: <20200814095540.32115-1-rojay@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

If the hardware is still accessing memory after SMMU translation
is disabled(as part of smmu shutdown callback), then the
IOVAs(I/O virtual address) which it was using will go on the bus
as the physical addresses which will result in unknown crashes
like NoC/interconnect errors.

So, adding shutdown callback to i2c driver to unmap DMA mappings
during system "reboot" or "shutdown".

Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 36 ++++++++++++++++++++++++++++++
 include/linux/qcom-geni-se.h       |  5 +++++
 2 files changed, 41 insertions(+)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 53ca41f76080..749c225f95c4 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -613,6 +613,41 @@ static int geni_i2c_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static void geni_i2c_shutdown(struct platform_device *pdev)
+{
+	int ret;
+	struct geni_i2c_dev *gi2c = platform_get_drvdata(pdev);
+	struct geni_se *se = &gi2c->se;
+	u32 dma;
+	u32 dma_dbg_reg;
+
+	ret = pm_runtime_get_sync(gi2c->se.dev);
+	if (ret < 0) {
+		dev_err(gi2c->se.dev, "Failed to resume device:%d\n", ret);
+		return;
+	}
+
+	dma = readl_relaxed(se->base + SE_GENI_DMA_MODE_EN);
+	if (dma) {
+		dma_dbg_reg = readl_relaxed(gi2c->se.base + SE_DMA_DEBUG_REG0);
+		if (dma_dbg_reg & DMA_TX_ACTIVE) {
+			geni_i2c_abort_xfer(gi2c);
+			gi2c->cur_wr = 0;
+			if (gi2c->err)
+				geni_i2c_tx_fsm_rst(gi2c);
+			geni_se_tx_dma_unprep(se, gi2c->tx_dma, gi2c->xfer_len);
+		}
+		if (dma_dbg_reg & DMA_RX_ACTIVE) {
+			geni_i2c_abort_xfer(gi2c);
+			gi2c->cur_rd = 0;
+			if (gi2c->err)
+				geni_i2c_rx_fsm_rst(gi2c);
+			geni_se_rx_dma_unprep(se, gi2c->rx_dma, gi2c->xfer_len);
+		}
+	}
+	pm_runtime_put_sync_suspend(gi2c->se.dev);
+}
+
 static int __maybe_unused geni_i2c_runtime_suspend(struct device *dev)
 {
 	int ret;
@@ -673,6 +708,7 @@ MODULE_DEVICE_TABLE(of, geni_i2c_dt_match);
 static struct platform_driver geni_i2c_driver = {
 	.probe  = geni_i2c_probe,
 	.remove = geni_i2c_remove,
+	.shutdown = geni_i2c_shutdown,
 	.driver = {
 		.name = "geni_i2c",
 		.pm = &geni_i2c_pm_ops,
diff --git a/include/linux/qcom-geni-se.h b/include/linux/qcom-geni-se.h
index dd464943f717..acad69be747d 100644
--- a/include/linux/qcom-geni-se.h
+++ b/include/linux/qcom-geni-se.h
@@ -77,6 +77,7 @@ struct geni_se {
 #define SE_DMA_RX_FSM_RST		0xd58
 #define SE_HW_PARAM_0			0xe24
 #define SE_HW_PARAM_1			0xe28
+#define SE_DMA_DEBUG_REG0		0xe40
 
 /* GENI_FORCE_DEFAULT_REG fields */
 #define FORCE_DEFAULT	BIT(0)
@@ -207,6 +208,10 @@ struct geni_se {
 #define RX_GENI_CANCEL_IRQ		BIT(11)
 #define RX_GENI_GP_IRQ_EXT		GENMASK(13, 12)
 
+/* DMA DEBUG Register fields */
+#define DMA_TX_ACTIVE			BIT(0)
+#define DMA_RX_ACTIVE			BIT(1)
+
 /* SE_HW_PARAM_0 fields */
 #define TX_FIFO_WIDTH_MSK		GENMASK(29, 24)
 #define TX_FIFO_WIDTH_SHFT		24
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

