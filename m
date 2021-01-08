Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F37B2EF483
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Jan 2021 16:07:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727713AbhAHPHV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 8 Jan 2021 10:07:21 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:33390 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725806AbhAHPHU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 8 Jan 2021 10:07:20 -0500
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 08 Jan 2021 07:06:26 -0800
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 08 Jan 2021 07:06:24 -0800
X-QCInternal: smtphost
Received: from c-rojay-linux.qualcomm.com ([10.206.21.80])
  by ironmsg01-blr.qualcomm.com with ESMTP; 08 Jan 2021 20:35:55 +0530
Received: by c-rojay-linux.qualcomm.com (Postfix, from userid 88981)
        id BE95F28B9; Fri,  8 Jan 2021 20:35:54 +0530 (IST)
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
        Roja Rani Yarubandi <rojay@codeaurora.org>
Subject: [PATCH V8 1/1] i2c: i2c-qcom-geni: Add shutdown callback for i2c
Date:   Fri,  8 Jan 2021 20:35:45 +0530
Message-Id: <20210108150545.2018-2-rojay@codeaurora.org>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20210108150545.2018-1-rojay@codeaurora.org>
References: <20210108150545.2018-1-rojay@codeaurora.org>
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

 drivers/i2c/busses/i2c-qcom-geni.c | 34 ++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 214b4c913a13..c3f584795911 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -375,6 +375,32 @@ static void geni_i2c_tx_msg_cleanup(struct geni_i2c_dev *gi2c,
 	}
 }
 
+static void geni_i2c_stop_xfer(struct geni_i2c_dev *gi2c)
+{
+	int ret;
+	u32 geni_status;
+	struct i2c_msg *cur;
+
+	/* Resume device, as runtime suspend can happen anytime during transfer */
+	ret = pm_runtime_get_sync(gi2c->se.dev);
+	if (ret < 0) {
+		dev_err(gi2c->se.dev, "Failed to resume device: %d\n", ret);
+		return;
+	}
+
+	geni_status = readl_relaxed(gi2c->se.base + SE_GENI_STATUS);
+	if (geni_status & M_GENI_CMD_ACTIVE) {
+		cur = gi2c->cur;
+		geni_i2c_abort_xfer(gi2c);
+		if (cur->flags & I2C_M_RD)
+			geni_i2c_rx_msg_cleanup(gi2c, cur);
+		else
+			geni_i2c_tx_msg_cleanup(gi2c, cur);
+	}
+
+	pm_runtime_put_sync_suspend(gi2c->se.dev);
+}
+
 static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 				u32 m_param)
 {
@@ -650,6 +676,13 @@ static int geni_i2c_remove(struct platform_device *pdev)
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
@@ -714,6 +747,7 @@ MODULE_DEVICE_TABLE(of, geni_i2c_dt_match);
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

