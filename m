Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1536524477B
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Aug 2020 11:56:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726830AbgHNJ4y (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 14 Aug 2020 05:56:54 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:5634 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726603AbgHNJ4y (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 14 Aug 2020 05:56:54 -0400
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 14 Aug 2020 02:56:53 -0700
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 14 Aug 2020 02:56:50 -0700
Received: from c-rojay-linux.qualcomm.com ([10.206.21.80])
  by ironmsg02-blr.qualcomm.com with ESMTP; 14 Aug 2020 15:26:30 +0530
Received: by c-rojay-linux.qualcomm.com (Postfix, from userid 88981)
        id 925F11AC8; Fri, 14 Aug 2020 15:26:29 +0530 (IST)
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
Subject: [PATCH 1/2] i2c: i2c-qcom-geni: Add tx_dma, rx_dma and xfer_len to geni_i2c_dev struct
Date:   Fri, 14 Aug 2020 15:25:39 +0530
Message-Id: <20200814095540.32115-2-rojay@codeaurora.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200814095540.32115-1-rojay@codeaurora.org>
References: <20200814095540.32115-1-rojay@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Adding tx_dma, rx_dma and xfer length in geni_i2c_dev struct to
store DMA mapping data to enhance its scope. For example during
shutdown callback to unmap DMA mapping, these new struct members
can be used as part of geni_se_tx_dma_unprep and
geni_se_rx_dma_unprep calls.

Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 7f130829bf01..53ca41f76080 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -86,6 +86,9 @@ struct geni_i2c_dev {
 	u32 clk_freq_out;
 	const struct geni_i2c_clk_fld *clk_fld;
 	int suspended;
+	dma_addr_t tx_dma;
+	dma_addr_t rx_dma;
+	u32 xfer_len;
 };
 
 struct geni_i2c_err_log {
@@ -352,12 +355,11 @@ static void geni_i2c_tx_fsm_rst(struct geni_i2c_dev *gi2c)
 static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 				u32 m_param)
 {
-	dma_addr_t rx_dma;
 	unsigned long time_left;
 	void *dma_buf = NULL;
 	struct geni_se *se = &gi2c->se;
-	size_t len = msg->len;
 
+	gi2c->xfer_len = msg->len;
 	if (!of_machine_is_compatible("lenovo,yoga-c630"))
 		dma_buf = i2c_get_dma_safe_msg_buf(msg, 32);
 
@@ -366,9 +368,10 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 	else
 		geni_se_select_mode(se, GENI_SE_FIFO);
 
-	writel_relaxed(len, se->base + SE_I2C_RX_TRANS_LEN);
+	writel_relaxed(gi2c->xfer_len, se->base + SE_I2C_RX_TRANS_LEN);
 
-	if (dma_buf && geni_se_rx_dma_prep(se, dma_buf, len, &rx_dma)) {
+	if (dma_buf && geni_se_rx_dma_prep(se, dma_buf, gi2c->xfer_len,
+					   &gi2c->rx_dma)) {
 		geni_se_select_mode(se, GENI_SE_FIFO);
 		i2c_put_dma_safe_msg_buf(dma_buf, msg, false);
 		dma_buf = NULL;
@@ -384,7 +387,7 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 	if (dma_buf) {
 		if (gi2c->err)
 			geni_i2c_rx_fsm_rst(gi2c);
-		geni_se_rx_dma_unprep(se, rx_dma, len);
+		geni_se_rx_dma_unprep(se, gi2c->rx_dma, gi2c->xfer_len);
 		i2c_put_dma_safe_msg_buf(dma_buf, msg, !gi2c->err);
 	}
 
@@ -394,12 +397,11 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 				u32 m_param)
 {
-	dma_addr_t tx_dma;
 	unsigned long time_left;
 	void *dma_buf = NULL;
 	struct geni_se *se = &gi2c->se;
-	size_t len = msg->len;
 
+	gi2c->xfer_len = msg->len;
 	if (!of_machine_is_compatible("lenovo,yoga-c630"))
 		dma_buf = i2c_get_dma_safe_msg_buf(msg, 32);
 
@@ -408,9 +410,10 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 	else
 		geni_se_select_mode(se, GENI_SE_FIFO);
 
-	writel_relaxed(len, se->base + SE_I2C_TX_TRANS_LEN);
+	writel_relaxed(gi2c->xfer_len, se->base + SE_I2C_TX_TRANS_LEN);
 
-	if (dma_buf && geni_se_tx_dma_prep(se, dma_buf, len, &tx_dma)) {
+	if (dma_buf && geni_se_tx_dma_prep(se, dma_buf, gi2c->xfer_len,
+					   &gi2c->tx_dma)) {
 		geni_se_select_mode(se, GENI_SE_FIFO);
 		i2c_put_dma_safe_msg_buf(dma_buf, msg, false);
 		dma_buf = NULL;
@@ -429,7 +432,7 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 	if (dma_buf) {
 		if (gi2c->err)
 			geni_i2c_tx_fsm_rst(gi2c);
-		geni_se_tx_dma_unprep(se, tx_dma, len);
+		geni_se_tx_dma_unprep(se, gi2c->tx_dma, gi2c->xfer_len);
 		i2c_put_dma_safe_msg_buf(dma_buf, msg, !gi2c->err);
 	}
 
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

