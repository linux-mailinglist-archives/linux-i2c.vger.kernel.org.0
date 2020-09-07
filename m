Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0191225FB03
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Sep 2020 15:10:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729368AbgIGNIu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Sep 2020 09:08:50 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:41689 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729418AbgIGNIj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Sep 2020 09:08:39 -0400
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 07 Sep 2020 06:08:15 -0700
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 07 Sep 2020 06:08:13 -0700
Received: from c-rojay-linux.qualcomm.com ([10.206.21.80])
  by ironmsg02-blr.qualcomm.com with ESMTP; 07 Sep 2020 18:37:35 +0530
Received: by c-rojay-linux.qualcomm.com (Postfix, from userid 88981)
        id C17E920F7; Mon,  7 Sep 2020 18:37:33 +0530 (IST)
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
Subject: [PATCH V3] i2c: i2c-qcom-geni: Add shutdown callback for i2c
Date:   Mon,  7 Sep 2020 18:37:31 +0530
Message-Id: <20200907130731.2607-1-rojay@codeaurora.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

If the hardware is still accessing memory after SMMU translation
is disabled (as part of smmu shutdown callback), then the
IOVAs (I/O virtual address) which it was using will go on the bus
as the physical addresses which will result in unknown crashes
like NoC/interconnect errors.

So, implement shutdown callback to i2c driver to stop on-going transfer
and unmap DMA mappings during system "reboot" or "shutdown".

Store DMA mapping data in geni_i2c_dev struct to enhance DMA mapping
data scope. For example during shutdown callback to unmap DMA mapping,
this stored DMA mapping data can be used to call geni_se_tx_dma_unprep
and geni_se_rx_dma_unprep functions.

Fixes: 37692de5d523 ("i2c: i2c-qcom-geni: Add bus driver for the Qualcomm GENI I2C controller")
Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
---
Changes in V2:
 - As per Stephen's comments added seperate function for stop transfer,
   fixed minor nitpicks.
 - As per Stephen's comments, changed commit text.

Changes in V3:
 - As per Stephen's comments, squashed patch 1 into patch 2, added Fixes tag.
 - As per Akash's comments, included FIFO case in stop_xfer, fixed minor nitpicks.

 drivers/i2c/busses/i2c-qcom-geni.c | 70 +++++++++++++++++++++++++++---
 include/linux/qcom-geni-se.h       |  5 +++
 2 files changed, 69 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index dead5db3315a..b3609760909f 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -86,6 +86,9 @@ struct geni_i2c_dev {
 	u32 clk_freq_out;
 	const struct geni_i2c_clk_fld *clk_fld;
 	int suspended;
+	dma_addr_t tx_dma;
+	dma_addr_t rx_dma;
+	size_t xfer_len;
 };
 
 struct geni_i2c_err_log {
@@ -352,12 +355,12 @@ static void geni_i2c_tx_fsm_rst(struct geni_i2c_dev *gi2c)
 static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 				u32 m_param)
 {
-	dma_addr_t rx_dma;
 	unsigned long time_left;
 	void *dma_buf = NULL;
 	struct geni_se *se = &gi2c->se;
 	size_t len = msg->len;
 
+	gi2c->xfer_len = len;
 	if (!of_machine_is_compatible("lenovo,yoga-c630"))
 		dma_buf = i2c_get_dma_safe_msg_buf(msg, 32);
 
@@ -368,7 +371,7 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 
 	writel_relaxed(len, se->base + SE_I2C_RX_TRANS_LEN);
 
-	if (dma_buf && geni_se_rx_dma_prep(se, dma_buf, len, &rx_dma)) {
+	if (dma_buf && geni_se_rx_dma_prep(se, dma_buf, len, &gi2c->rx_dma)) {
 		geni_se_select_mode(se, GENI_SE_FIFO);
 		i2c_put_dma_safe_msg_buf(dma_buf, msg, false);
 		dma_buf = NULL;
@@ -384,7 +387,8 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 	if (dma_buf) {
 		if (gi2c->err)
 			geni_i2c_rx_fsm_rst(gi2c);
-		geni_se_rx_dma_unprep(se, rx_dma, len);
+		geni_se_rx_dma_unprep(se, gi2c->rx_dma, len);
+		gi2c->rx_dma = (dma_addr_t)NULL;
 		i2c_put_dma_safe_msg_buf(dma_buf, msg, !gi2c->err);
 	}
 
@@ -394,12 +398,12 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 				u32 m_param)
 {
-	dma_addr_t tx_dma;
 	unsigned long time_left;
 	void *dma_buf = NULL;
 	struct geni_se *se = &gi2c->se;
 	size_t len = msg->len;
 
+	gi2c->xfer_len = len;
 	if (!of_machine_is_compatible("lenovo,yoga-c630"))
 		dma_buf = i2c_get_dma_safe_msg_buf(msg, 32);
 
@@ -410,7 +414,7 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 
 	writel_relaxed(len, se->base + SE_I2C_TX_TRANS_LEN);
 
-	if (dma_buf && geni_se_tx_dma_prep(se, dma_buf, len, &tx_dma)) {
+	if (dma_buf && geni_se_tx_dma_prep(se, dma_buf, len, &gi2c->tx_dma)) {
 		geni_se_select_mode(se, GENI_SE_FIFO);
 		i2c_put_dma_safe_msg_buf(dma_buf, msg, false);
 		dma_buf = NULL;
@@ -429,7 +433,8 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 	if (dma_buf) {
 		if (gi2c->err)
 			geni_i2c_tx_fsm_rst(gi2c);
-		geni_se_tx_dma_unprep(se, tx_dma, len);
+		geni_se_tx_dma_unprep(se, gi2c->tx_dma, len);
+		gi2c->tx_dma = (dma_addr_t)NULL;
 		i2c_put_dma_safe_msg_buf(dma_buf, msg, !gi2c->err);
 	}
 
@@ -479,6 +484,51 @@ static int geni_i2c_xfer(struct i2c_adapter *adap,
 	return ret;
 }
 
+static void geni_i2c_stop_xfer(struct geni_i2c_dev *gi2c)
+{
+	int ret;
+	u32 dma;
+	u32 val;
+	u32 geni_status;
+	struct geni_se *se = &gi2c->se;
+
+	ret = pm_runtime_get_sync(gi2c->se.dev);
+	if (ret < 0) {
+		dev_err(gi2c->se.dev, "Failed to resume device: %d\n", ret);
+		return;
+	}
+
+	geni_status = readl_relaxed(gi2c->se.base + SE_GENI_STATUS);
+	if (geni_status & M_GENI_CMD_ACTIVE) {
+		geni_i2c_abort_xfer(gi2c);
+		dma = readl_relaxed(se->base + SE_GENI_DMA_MODE_EN);
+		if (dma) {
+			val = readl_relaxed(gi2c->se.base + SE_DMA_DEBUG_REG0);
+			if (val & DMA_TX_ACTIVE) {
+				gi2c->cur_wr = 0;
+				if (gi2c->err)
+					geni_i2c_tx_fsm_rst(gi2c);
+				if (gi2c->tx_dma) {
+					geni_se_tx_dma_unprep(se,
+						 gi2c->tx_dma, gi2c->xfer_len);
+					gi2c->tx_dma = (dma_addr_t)NULL;
+				}
+			} else if (val & DMA_RX_ACTIVE) {
+				gi2c->cur_rd = 0;
+				if (gi2c->err)
+					geni_i2c_rx_fsm_rst(gi2c);
+				if (gi2c->rx_dma) {
+					geni_se_rx_dma_unprep(se,
+						gi2c->rx_dma, gi2c->xfer_len);
+					gi2c->rx_dma = (dma_addr_t)NULL;
+				}
+			}
+		}
+	}
+
+	pm_runtime_put_sync_suspend(gi2c->se.dev);
+}
+
 static u32 geni_i2c_func(struct i2c_adapter *adap)
 {
 	return I2C_FUNC_I2C | (I2C_FUNC_SMBUS_EMUL & ~I2C_FUNC_SMBUS_QUICK);
@@ -630,6 +680,13 @@ static int geni_i2c_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static void geni_i2c_shutdown(struct platform_device *pdev)
+{
+	struct geni_i2c_dev *gi2c = platform_get_drvdata(pdev);
+
+	geni_i2c_stop_xfer(gi2c);
+}
+
 static int __maybe_unused geni_i2c_runtime_suspend(struct device *dev)
 {
 	int ret;
@@ -694,6 +751,7 @@ MODULE_DEVICE_TABLE(of, geni_i2c_dt_match);
 static struct platform_driver geni_i2c_driver = {
 	.probe  = geni_i2c_probe,
 	.remove = geni_i2c_remove,
+	.shutdown = geni_i2c_shutdown,
 	.driver = {
 		.name = "geni_i2c",
 		.pm = &geni_i2c_pm_ops,
diff --git a/include/linux/qcom-geni-se.h b/include/linux/qcom-geni-se.h
index 8f385fbe5a0e..7279d8b3b04c 100644
--- a/include/linux/qcom-geni-se.h
+++ b/include/linux/qcom-geni-se.h
@@ -96,6 +96,7 @@ struct geni_se {
 #define SE_DMA_RX_FSM_RST		0xd58
 #define SE_HW_PARAM_0			0xe24
 #define SE_HW_PARAM_1			0xe28
+#define SE_DMA_DEBUG_REG0		0xe40
 
 /* GENI_FORCE_DEFAULT_REG fields */
 #define FORCE_DEFAULT	BIT(0)
@@ -226,6 +227,10 @@ struct geni_se {
 #define RX_GENI_CANCEL_IRQ		BIT(11)
 #define RX_GENI_GP_IRQ_EXT		GENMASK(13, 12)
 
+/* SE_DMA_DEBUG_REG0 Register fields */
+#define DMA_TX_ACTIVE			BIT(0)
+#define DMA_RX_ACTIVE			BIT(1)
+
 /* SE_HW_PARAM_0 fields */
 #define TX_FIFO_WIDTH_MSK		GENMASK(29, 24)
 #define TX_FIFO_WIDTH_SHFT		24
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

