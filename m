Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6091B37B7C5
	for <lists+linux-i2c@lfdr.de>; Wed, 12 May 2021 10:23:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230160AbhELIYS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 12 May 2021 04:24:18 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:5544 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229968AbhELIYR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 12 May 2021 04:24:17 -0400
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 12 May 2021 01:23:10 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 12 May 2021 01:23:07 -0700
X-QCInternal: smtphost
Received: from c-rojay-linux.qualcomm.com ([10.206.21.80])
  by ironmsg01-blr.qualcomm.com with ESMTP; 12 May 2021 13:52:24 +0530
Received: by c-rojay-linux.qualcomm.com (Postfix, from userid 88981)
        id 1378D11F1; Wed, 12 May 2021 13:52:22 +0530 (IST)
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
Subject: [PATCH V10] i2c: i2c-qcom-geni: Add shutdown callback for i2c
Date:   Wed, 12 May 2021 13:52:20 +0530
Message-Id: <20210512082220.7137-1-rojay@codeaurora.org>
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

So, implement shutdown callback for i2c driver to suspend the bus
during system "reboot" or "shutdown".

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

Changes in V10:
 - As per Stephen's comments, removed ongoing transfers flush and only 
   suspending i2c bus in shutdown callback.
 - Also removed all other changes which have been made for ongoing transfers 
   flush, handling race issues etc., during shutdown callback.
 - Updated commit text accordingly.

 drivers/i2c/busses/i2c-qcom-geni.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 214b4c913a13..277ab7e7dd51 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -650,6 +650,14 @@ static int geni_i2c_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static void geni_i2c_shutdown(struct platform_device *pdev)
+{
+	struct geni_i2c_dev *gi2c = platform_get_drvdata(pdev);
+
+	if (!pm_runtime_status_suspended(gi2c->se.dev))
+		pm_runtime_set_suspended(gi2c->se.dev);
+}
+
 static int __maybe_unused geni_i2c_runtime_suspend(struct device *dev)
 {
 	int ret;
@@ -714,6 +722,7 @@ MODULE_DEVICE_TABLE(of, geni_i2c_dt_match);
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

