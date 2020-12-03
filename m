Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 869792CD3AB
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Dec 2020 11:35:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388685AbgLCKdV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Dec 2020 05:33:21 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:36077 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388706AbgLCKdV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Dec 2020 05:33:21 -0500
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 03 Dec 2020 02:32:40 -0800
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 03 Dec 2020 02:32:38 -0800
X-QCInternal: smtphost
Received: from c-rojay-linux.qualcomm.com ([10.206.21.80])
  by ironmsg01-blr.qualcomm.com with ESMTP; 03 Dec 2020 16:02:00 +0530
Received: by c-rojay-linux.qualcomm.com (Postfix, from userid 88981)
        id 765FF2832; Thu,  3 Dec 2020 16:01:59 +0530 (IST)
From:   Roja Rani Yarubandi <rojay@codeaurora.org>
To:     wsa@kernel.org
Cc:     swboyd@chromium.org, dianders@chromium.org,
        saiprakash.ranjan@codeaurora.org, gregkh@linuxfoundation.org,
        mka@chromium.org, akashast@codeaurora.org,
        msavaliy@qti.qualcomm.com, skakit@codeaurora.org,
        vkaur@codeaurora.org, pyarlaga@codeaurora.org,
        rnayak@codeaurora.org, agross@kernel.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        sumit.semwal@linaro.org, linux-media@vger.kernel.org,
        Roja Rani Yarubandi <rojay@codeaurora.org>
Subject: [RESEND PATCH V6 1/2] i2c: i2c-qcom-geni: Store DMA mapping data in geni_i2c_dev struct
Date:   Thu,  3 Dec 2020 16:01:55 +0530
Message-Id: <20201203103156.32595-2-rojay@codeaurora.org>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201203103156.32595-1-rojay@codeaurora.org>
References: <20201203103156.32595-1-rojay@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Store DMA mapping data in geni_i2c_dev struct to enhance DMA mapping
data scope. For example during shutdown callback to unmap DMA mapping,
this stored DMA mapping data can be used to call geni_se_tx_dma_unprep
and geni_se_rx_dma_unprep functions.

Add two helper functions geni_i2c_rx_msg_cleanup and
geni_i2c_tx_msg_cleanup to unwrap the things after rx/tx FIFO/DMA
transfers, so that the same can be used in geni_i2c_stop_xfer()
function during shutdown callback.

Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
---
Changes in V5:
 - As per Stephen's comments separated this patch from shutdown
   callback patch, gi2c->cur = NULL is not removed from
   geni_i2c_abort_xfer(), and made a copy of gi2c->cur and passed
   to cleanup functions.

Changes in V6:
 - Added spin_lock/unlock in geni_i2c_rx_msg_cleanup() and
   geni_i2c_tx_msg_cleanup() functions.

 drivers/i2c/busses/i2c-qcom-geni.c | 69 +++++++++++++++++++++++-------
 1 file changed, 53 insertions(+), 16 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index dce75b85253c..bfbc80f65006 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -86,6 +86,9 @@ struct geni_i2c_dev {
 	u32 clk_freq_out;
 	const struct geni_i2c_clk_fld *clk_fld;
 	int suspended;
+	void *dma_buf;
+	size_t xfer_len;
+	dma_addr_t dma_addr;
 };
 
 struct geni_i2c_err_log {
@@ -348,14 +351,49 @@ static void geni_i2c_tx_fsm_rst(struct geni_i2c_dev *gi2c)
 		dev_err(gi2c->se.dev, "Timeout resetting TX_FSM\n");
 }
 
+static void geni_i2c_rx_msg_cleanup(struct geni_i2c_dev *gi2c,
+				     struct i2c_msg *cur)
+{
+	struct geni_se *se = &gi2c->se;
+	unsigned long flags;
+
+	spin_lock_irqsave(&gi2c->lock, flags);
+	gi2c->cur_rd = 0;
+	if (gi2c->dma_buf) {
+		if (gi2c->err)
+			geni_i2c_rx_fsm_rst(gi2c);
+		geni_se_rx_dma_unprep(se, gi2c->dma_addr, gi2c->xfer_len);
+		i2c_put_dma_safe_msg_buf(gi2c->dma_buf, cur, !gi2c->err);
+	}
+	spin_unlock_irqrestore(&gi2c->lock, flags);
+}
+
+static void geni_i2c_tx_msg_cleanup(struct geni_i2c_dev *gi2c,
+				     struct i2c_msg *cur)
+{
+	struct geni_se *se = &gi2c->se;
+	unsigned long flags;
+
+	spin_lock_irqsave(&gi2c->lock, flags);
+	gi2c->cur_wr = 0;
+	if (gi2c->dma_buf) {
+		if (gi2c->err)
+			geni_i2c_tx_fsm_rst(gi2c);
+		geni_se_tx_dma_unprep(se, gi2c->dma_addr, gi2c->xfer_len);
+		i2c_put_dma_safe_msg_buf(gi2c->dma_buf, cur, !gi2c->err);
+	}
+	spin_unlock_irqrestore(&gi2c->lock, flags);
+}
+
 static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 				u32 m_param)
 {
-	dma_addr_t rx_dma;
+	dma_addr_t rx_dma = 0;
 	unsigned long time_left;
 	void *dma_buf = NULL;
 	struct geni_se *se = &gi2c->se;
 	size_t len = msg->len;
+	struct i2c_msg *cur;
 
 	if (!of_machine_is_compatible("lenovo,yoga-c630"))
 		dma_buf = i2c_get_dma_safe_msg_buf(msg, 32);
@@ -372,19 +410,18 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 		geni_se_select_mode(se, GENI_SE_FIFO);
 		i2c_put_dma_safe_msg_buf(dma_buf, msg, false);
 		dma_buf = NULL;
+	} else {
+		gi2c->xfer_len = len;
+		gi2c->dma_addr = rx_dma;
+		gi2c->dma_buf = dma_buf;
 	}
 
+	cur = gi2c->cur;
 	time_left = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
 	if (!time_left)
 		geni_i2c_abort_xfer(gi2c);
 
-	gi2c->cur_rd = 0;
-	if (dma_buf) {
-		if (gi2c->err)
-			geni_i2c_rx_fsm_rst(gi2c);
-		geni_se_rx_dma_unprep(se, rx_dma, len);
-		i2c_put_dma_safe_msg_buf(dma_buf, msg, !gi2c->err);
-	}
+	geni_i2c_rx_msg_cleanup(gi2c, cur);
 
 	return gi2c->err;
 }
@@ -392,11 +429,12 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 				u32 m_param)
 {
-	dma_addr_t tx_dma;
+	dma_addr_t tx_dma = 0;
 	unsigned long time_left;
 	void *dma_buf = NULL;
 	struct geni_se *se = &gi2c->se;
 	size_t len = msg->len;
+	struct i2c_msg *cur;
 
 	if (!of_machine_is_compatible("lenovo,yoga-c630"))
 		dma_buf = i2c_get_dma_safe_msg_buf(msg, 32);
@@ -413,22 +451,21 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 		geni_se_select_mode(se, GENI_SE_FIFO);
 		i2c_put_dma_safe_msg_buf(dma_buf, msg, false);
 		dma_buf = NULL;
+	} else {
+		gi2c->xfer_len = len;
+		gi2c->dma_addr = tx_dma;
+		gi2c->dma_buf = dma_buf;
 	}
 
 	if (!dma_buf) /* Get FIFO IRQ */
 		writel_relaxed(1, se->base + SE_GENI_TX_WATERMARK_REG);
 
+	cur = gi2c->cur;
 	time_left = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
 	if (!time_left)
 		geni_i2c_abort_xfer(gi2c);
 
-	gi2c->cur_wr = 0;
-	if (dma_buf) {
-		if (gi2c->err)
-			geni_i2c_tx_fsm_rst(gi2c);
-		geni_se_tx_dma_unprep(se, tx_dma, len);
-		i2c_put_dma_safe_msg_buf(dma_buf, msg, !gi2c->err);
-	}
+	geni_i2c_tx_msg_cleanup(gi2c, cur);
 
 	return gi2c->err;
 }
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

