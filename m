Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0582727FBD1
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Oct 2020 10:45:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731604AbgJAIpH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 1 Oct 2020 04:45:07 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:45387 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731527AbgJAIpH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 1 Oct 2020 04:45:07 -0400
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 01 Oct 2020 01:45:06 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 01 Oct 2020 01:45:04 -0700
X-QCInternal: smtphost
Received: from c-rojay-linux.qualcomm.com ([10.206.21.80])
  by ironmsg02-blr.qualcomm.com with ESMTP; 01 Oct 2020 14:14:33 +0530
Received: by c-rojay-linux.qualcomm.com (Postfix, from userid 88981)
        id 8F5A122A4; Thu,  1 Oct 2020 14:14:32 +0530 (IST)
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
Subject: [PATCH V5 2/3] i2c: i2c-qcom-geni: Store DMA mapping data in geni_i2c_dev struct
Date:   Thu,  1 Oct 2020 14:14:24 +0530
Message-Id: <20201001084425.23117-3-rojay@codeaurora.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201001084425.23117-1-rojay@codeaurora.org>
References: <20201001084425.23117-1-rojay@codeaurora.org>
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

 drivers/i2c/busses/i2c-qcom-geni.c | 63 ++++++++++++++++++++++--------
 1 file changed, 47 insertions(+), 16 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index dead5db3315a..aee2a1dd2c62 100644
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
@@ -349,14 +352,43 @@ static void geni_i2c_tx_fsm_rst(struct geni_i2c_dev *gi2c)
 		dev_err(gi2c->se.dev, "Timeout resetting TX_FSM\n");
 }
 
+static void geni_i2c_rx_msg_cleanup(struct geni_i2c_dev *gi2c,
+				     struct i2c_msg *cur)
+{
+	struct geni_se *se = &gi2c->se;
+
+	gi2c->cur_rd = 0;
+	if (gi2c->dma_buf) {
+		if (gi2c->err)
+			geni_i2c_rx_fsm_rst(gi2c);
+		geni_se_rx_dma_unprep(se, gi2c->dma_addr, gi2c->xfer_len);
+		i2c_put_dma_safe_msg_buf(gi2c->dma_buf, cur, !gi2c->err);
+	}
+}
+
+static void geni_i2c_tx_msg_cleanup(struct geni_i2c_dev *gi2c,
+				     struct i2c_msg *cur)
+{
+	struct geni_se *se = &gi2c->se;
+
+	gi2c->cur_wr = 0;
+	if (gi2c->dma_buf) {
+		if (gi2c->err)
+			geni_i2c_tx_fsm_rst(gi2c);
+		geni_se_tx_dma_unprep(se, gi2c->dma_addr, gi2c->xfer_len);
+		i2c_put_dma_safe_msg_buf(gi2c->dma_buf, cur, !gi2c->err);
+	}
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
@@ -372,21 +404,20 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 		geni_se_select_mode(se, GENI_SE_FIFO);
 		i2c_put_dma_safe_msg_buf(dma_buf, msg, false);
 		dma_buf = NULL;
+	} else {
+		gi2c->xfer_len = len;
+		gi2c->dma_addr = rx_dma;
+		gi2c->dma_buf = dma_buf;
 	}
 
 	geni_se_setup_m_cmd(se, I2C_READ, m_param);
 
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
@@ -394,11 +425,12 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
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
@@ -414,6 +446,10 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 		geni_se_select_mode(se, GENI_SE_FIFO);
 		i2c_put_dma_safe_msg_buf(dma_buf, msg, false);
 		dma_buf = NULL;
+	} else {
+		gi2c->xfer_len = len;
+		gi2c->dma_addr = tx_dma;
+		gi2c->dma_buf = dma_buf;
 	}
 
 	geni_se_setup_m_cmd(se, I2C_WRITE, m_param);
@@ -421,17 +457,12 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
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

