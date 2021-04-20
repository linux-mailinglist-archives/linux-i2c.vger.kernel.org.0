Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D328A365750
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Apr 2021 13:14:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230408AbhDTLPT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 20 Apr 2021 07:15:19 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:51381 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230290AbhDTLPS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 20 Apr 2021 07:15:18 -0400
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 20 Apr 2021 04:14:47 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 20 Apr 2021 04:14:44 -0700
X-QCInternal: smtphost
Received: from c-rojay-linux.qualcomm.com ([10.206.21.80])
  by ironmsg01-blr.qualcomm.com with ESMTP; 20 Apr 2021 16:43:59 +0530
Received: by c-rojay-linux.qualcomm.com (Postfix, from userid 88981)
        id 18D5ABE0; Tue, 20 Apr 2021 16:43:57 +0530 (IST)
From:   Roja Rani Yarubandi <rojay@codeaurora.org>
To:     wsa@kernel.org
Cc:     swboyd@chromium.org, dianders@chromium.org,
        saiprakash.ranjan@codeaurora.org, gregkh@linuxfoundation.org,
        mka@chromium.org, skananth@codeaurora.org,
        msavaliy@qti.qualcomm.com, skakit@codeaurora.org,
        rnayak@codeaurora.org, agross@kernel.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        sumit.semwal@linaro.org, linux-media@vger.kernel.org,
        Roja Rani Yarubandi <rojay@codeaurora.org>
Subject: [PATCH V9] i2c: i2c-qcom-geni: Add shutdown callback for i2c
Date:   Tue, 20 Apr 2021 16:43:55 +0530
Message-Id: <20210420111355.18462-1-rojay@codeaurora.org>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Changes in V4:
 - As per Stephen's comments cleaned up geni_i2c_stop_xfer function,
   added dma_buf in geni_i2c_dev struct to call i2c_put_dma_safe_msg_buf()
   from other functions, removed "iova" check in geni_se_rx_dma_unprep()
   and geni_se_tx_dma_unprep() functions.
 - Added two helper functions geni_i2c_rx_one_msg_done() and
   geni_i2c_tx_one_msg_done() to unwrap the things after rx/tx FIFO/DMA
   transfers, so that the same can be used in geni_i2c_stop_xfer() function
   during shutdown callback. Updated commit text accordingly.
 - Checking whether it is tx/rx transfer using I2C_M_RD which is valid for both
   FIFO and DMA cases, so dropped DMA_RX_ACTIVE and DMA_TX_ACTIVE bit checking

Changes in V5:
 - As per Stephen's comments, added spin_lock_irqsave & spin_unlock_irqsave in
   geni_i2c_stop_xfer() function.

Changes in V6:
 - As per Stephen's comments, taken care of unsafe lock order in
   geni_i2c_stop_xfer().
 - Moved spin_lock/unlock to geni_i2c_rx_msg_cleanup() and
   geni_i2c_tx_msg_cleanup() functions.

Changes in V7:
 - No changes

Changes in V8:
 - As per Wolfram Sang comment, removed goto and modified geni_i2c_stop_xfer()
   accordingly.

Changes in V9:
 - Fixed possbile race by protecting gi2c->cur and calling geni_i2c_abort_xfer()
   with adding another parameter to differentiate from which sequence is the
   geni_i2c_abort_xfer() called and handle the spin_lock/spin_unlock accordingly
   inside geni_i2c_abort_xfer(). For this added two macros ABORT_XFER and
   STOP_AND_ABORT_XFER.
 - Added a bool variable "stop_xfer" in geni_i2c_dev struct, used to put stop
   to upcoming geni_i2c_rx_one_msg() and geni_i2c_tx_one_msg() calls once we
   recieve the shutdown call.
 - Added gi2c->cur == NULL check in geni_i2c_irq() to not to process the irq
   even if any transfer is queued and shutdown to HW received.

 drivers/i2c/busses/i2c-qcom-geni.c | 71 +++++++++++++++++++++++++++---
 1 file changed, 64 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 214b4c913a13..8ae17ccad99e 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -71,6 +71,8 @@ enum geni_i2c_err_code {
 #define ABORT_TIMEOUT		HZ
 #define XFER_TIMEOUT		HZ
 #define RST_TIMEOUT		HZ
+#define ABORT_XFER		0
+#define STOP_AND_ABORT_XFER	1
 
 struct geni_i2c_dev {
 	struct geni_se se;
@@ -89,6 +91,7 @@ struct geni_i2c_dev {
 	void *dma_buf;
 	size_t xfer_len;
 	dma_addr_t dma_addr;
+	bool stop_xfer;
 };
 
 struct geni_i2c_err_log {
@@ -215,6 +218,11 @@ static irqreturn_t geni_i2c_irq(int irq, void *dev)
 	struct i2c_msg *cur;
 
 	spin_lock(&gi2c->lock);
+	if (!gi2c->cur) {
+		dev_err(gi2c->se.dev, "Can't process irq, gi2c->cur is NULL\n");
+		spin_unlock(&gi2c->lock);
+		return IRQ_HANDLED;
+	}
 	m_stat = readl_relaxed(base + SE_GENI_M_IRQ_STATUS);
 	rx_st = readl_relaxed(base + SE_GENI_RX_FIFO_STATUS);
 	dm_tx_st = readl_relaxed(base + SE_DMA_TX_IRQ_STAT);
@@ -222,8 +230,7 @@ static irqreturn_t geni_i2c_irq(int irq, void *dev)
 	dma = readl_relaxed(base + SE_GENI_DMA_MODE_EN);
 	cur = gi2c->cur;
 
-	if (!cur ||
-	    m_stat & (M_CMD_FAILURE_EN | M_CMD_ABORT_EN) ||
+	if (m_stat & (M_CMD_FAILURE_EN | M_CMD_ABORT_EN) ||
 	    dm_rx_st & (DM_I2C_CB_ERR)) {
 		if (m_stat & M_GP_IRQ_1_EN)
 			geni_i2c_err(gi2c, NACK);
@@ -301,17 +308,19 @@ static irqreturn_t geni_i2c_irq(int irq, void *dev)
 	return IRQ_HANDLED;
 }
 
-static void geni_i2c_abort_xfer(struct geni_i2c_dev *gi2c)
+static void geni_i2c_abort_xfer(struct geni_i2c_dev *gi2c, bool is_stop_xfer)
 {
 	u32 val;
 	unsigned long time_left = ABORT_TIMEOUT;
 	unsigned long flags;
 
-	spin_lock_irqsave(&gi2c->lock, flags);
+	if (!is_stop_xfer)
+		spin_lock_irqsave(&gi2c->lock, flags);
 	geni_i2c_err(gi2c, GENI_TIMEOUT);
 	gi2c->cur = NULL;
 	geni_se_abort_m_cmd(&gi2c->se);
-	spin_unlock_irqrestore(&gi2c->lock, flags);
+	if (!is_stop_xfer)
+		spin_unlock_irqrestore(&gi2c->lock, flags);
 	do {
 		time_left = wait_for_completion_timeout(&gi2c->done, time_left);
 		val = readl_relaxed(gi2c->se.base + SE_GENI_M_IRQ_STATUS);
@@ -375,6 +384,38 @@ static void geni_i2c_tx_msg_cleanup(struct geni_i2c_dev *gi2c,
 	}
 }
 
+static void geni_i2c_stop_xfer(struct geni_i2c_dev *gi2c)
+{
+	int ret;
+	u32 geni_status;
+	struct i2c_msg *cur;
+	unsigned long flags;
+
+	/* Resume device, as runtime suspend can happen anytime during transfer */
+	ret = pm_runtime_get_sync(gi2c->se.dev);
+	if (ret < 0) {
+		dev_err(gi2c->se.dev, "Failed to resume device: %d\n", ret);
+		return;
+	}
+
+	spin_lock_irqsave(&gi2c->lock, flags);
+	gi2c->stop_xfer = 1;
+	geni_status = readl_relaxed(gi2c->se.base + SE_GENI_STATUS);
+	if (geni_status & M_GENI_CMD_ACTIVE) {
+		cur = gi2c->cur;
+		geni_i2c_abort_xfer(gi2c, STOP_AND_ABORT_XFER);
+		spin_unlock_irqrestore(&gi2c->lock, flags);
+		if (cur->flags & I2C_M_RD)
+			geni_i2c_rx_msg_cleanup(gi2c, cur);
+		else
+			geni_i2c_tx_msg_cleanup(gi2c, cur);
+	} else {
+		spin_unlock_irqrestore(&gi2c->lock, flags);
+	}
+
+	pm_runtime_put_sync_suspend(gi2c->se.dev);
+}
+
 static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 				u32 m_param)
 {
@@ -407,7 +448,7 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 	cur = gi2c->cur;
 	time_left = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
 	if (!time_left)
-		geni_i2c_abort_xfer(gi2c);
+		geni_i2c_abort_xfer(gi2c, ABORT_XFER);
 
 	geni_i2c_rx_msg_cleanup(gi2c, cur);
 
@@ -449,7 +490,7 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 	cur = gi2c->cur;
 	time_left = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
 	if (!time_left)
-		geni_i2c_abort_xfer(gi2c);
+		geni_i2c_abort_xfer(gi2c, ABORT_XFER);
 
 	geni_i2c_tx_msg_cleanup(gi2c, cur);
 
@@ -462,6 +503,7 @@ static int geni_i2c_xfer(struct i2c_adapter *adap,
 {
 	struct geni_i2c_dev *gi2c = i2c_get_adapdata(adap);
 	int i, ret;
+	unsigned long flags;
 
 	gi2c->err = 0;
 	reinit_completion(&gi2c->done);
@@ -480,7 +522,13 @@ static int geni_i2c_xfer(struct i2c_adapter *adap,
 
 		m_param |= ((msgs[i].addr << SLV_ADDR_SHFT) & SLV_ADDR_MSK);
 
+		spin_lock_irqsave(&gi2c->lock, flags);
+		if (gi2c->stop_xfer) {
+			spin_unlock_irqrestore(&gi2c->lock, flags);
+			break;
+		}
 		gi2c->cur = &msgs[i];
+		spin_unlock_irqrestore(&gi2c->lock, flags);
 		if (msgs[i].flags & I2C_M_RD)
 			ret = geni_i2c_rx_one_msg(gi2c, &msgs[i], m_param);
 		else
@@ -624,6 +672,7 @@ static int geni_i2c_probe(struct platform_device *pdev)
 	dev_dbg(dev, "i2c fifo/se-dma mode. fifo depth:%d\n", tx_depth);
 
 	gi2c->suspended = 1;
+	gi2c->stop_xfer = 0;
 	pm_runtime_set_suspended(gi2c->se.dev);
 	pm_runtime_set_autosuspend_delay(gi2c->se.dev, I2C_AUTO_SUSPEND_DELAY);
 	pm_runtime_use_autosuspend(gi2c->se.dev);
@@ -650,6 +699,13 @@ static int geni_i2c_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static void  geni_i2c_shutdown(struct platform_device *pdev)
+{
+	struct geni_i2c_dev *gi2c = platform_get_drvdata(pdev);
+
+	geni_i2c_stop_xfer(gi2c);
+}
+
 static int __maybe_unused geni_i2c_runtime_suspend(struct device *dev)
 {
 	int ret;
@@ -714,6 +770,7 @@ MODULE_DEVICE_TABLE(of, geni_i2c_dt_match);
 static struct platform_driver geni_i2c_driver = {
 	.probe  = geni_i2c_probe,
 	.remove = geni_i2c_remove,
+	.shutdown = geni_i2c_shutdown,
 	.driver = {
 		.name = "geni_i2c",
 		.pm = &geni_i2c_pm_ops,
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

