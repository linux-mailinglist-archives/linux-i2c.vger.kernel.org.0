Return-Path: <linux-i2c+bounces-7394-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD2C99E8D5
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Oct 2024 14:10:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B7AE283365
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Oct 2024 12:10:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAF3B1F8EEB;
	Tue, 15 Oct 2024 12:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UQ8nc6OV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE941F8EE0;
	Tue, 15 Oct 2024 12:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728994130; cv=none; b=KGpRAwNFdG7Ni28brTjRGGJNZHkBgXwSZALwgD/rr3KwtSsiv8cd1cG+vZ02qtR51FK/f+oCVdzwqpBcYR+OfMiTy0lV/Aecg9v7nOATgMTtx4nSNNLabejhgWNLnq3a5fe+7uvwh25qPkBHRwLqKe24I+bKVY4jPJ6m073HqW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728994130; c=relaxed/simple;
	bh=PB7ITYqeJHSWN7dDeshEQNuJtkk65I1VUnMHSCBdzG0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dwCD9EGpHzCjBdMlEqrLxXBnu+7er217YEdXnY6FMGCCUJ5+7TV9FciXoI3cFTD+k6O7e6TcN8ldda9lwZ7IvCFqw28amXDCXPGHWF3gwizuNFyQ1/RVjQt5Q2zKE95WXZdx8sjdq1GERCHm7Uf3H3+cRwJsP1Sv2AYK/qstkEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UQ8nc6OV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49FBVKeL028539;
	Tue, 15 Oct 2024 12:08:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0o+CFFxLvBXPtKGJfpW0Lc+u
	4Hdpi4klAbpdj7dOxbo=; b=UQ8nc6OVoj2T1cUFmbiFhoDzX1VPgK2JurHgv3CV
	2xWxpnx7o3xe7q7gMEXPWTb51sCwhJOog74LEaE6w0C6x/myR6wWkvmgkSV8l0UW
	9wrhgn9culQTSVYb89NVrDnkN/Y45fE0G2Z7FCgIPZErAXhV8kyWCoyPrxnAR87c
	4e2KjBY5IlegTpkQ1b0y7jRYDy9lqot7t5asdpzuPUdrZusbiTUOtMgxTr+nVrsd
	INGt1FFpqOsghmUtTTms3zrzhEtBAQD5PsVm83/c3fxJs8yjSC5NRton/W/holIl
	YNh0K5yeiTfzr0zuANdfJE9ubzh2bobm1hE/WDP8EcALyg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4292evk69c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Oct 2024 12:08:39 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49FC8c79011440
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Oct 2024 12:08:38 GMT
Received: from hu-jseerapu-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 15 Oct 2024 05:08:33 -0700
From: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
CC: <cros-qcom-dts-watchers@chromium.org>, <linux-arm-msm@vger.kernel.org>,
        <dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <linaro-mm-sig@lists.linaro.org>, <quic_msavaliy@quicinc.com>,
        <quic_vtanuku@quicinc.com>
Subject: [PATCH v1 5/5] i2c: i2c-qcom-geni: Add Block event interrupt support
Date: Tue, 15 Oct 2024 17:37:50 +0530
Message-ID: <20241015120750.21217-6-quic_jseerapu@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241015120750.21217-1-quic_jseerapu@quicinc.com>
References: <20241015120750.21217-1-quic_jseerapu@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: igqfXn0az7sxVPtrNFgXme81UVCGm5Qq
X-Proofpoint-ORIG-GUID: igqfXn0az7sxVPtrNFgXme81UVCGm5Qq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 malwarescore=0 mlxlogscore=999 lowpriorityscore=0
 phishscore=0 adultscore=0 bulkscore=0 mlxscore=0 impostorscore=0
 suspectscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2410150083

The I2C driver gets an interrupt upon transfer completion.
For multiple messages in a single transfer, N interrupts will be
received for N messages, leading to significant software interrupt
latency. To mitigate this latency, utilize Block Event Interrupt (BEI)
only when an interrupt is necessary. This means large transfers can be
split into multiple chunks of 64 messages internally, without expecting
interrupts for the first 63 transfers, only the last one will trigger
an interrupt indicating 64 transfers completed.

By implementing BEI, multi-message transfers can be divided into
chunks of 64 messages, improving overall transfer time.
This optimization reduces transfer time from 168 ms to 48 ms for a
series of 200 I2C write messages in a single transfer, with a
clock frequency support of 100 kHz.

BEI optimizations are currently implemented for I2C write transfers only,
as there is no use case for multiple I2C read messages in a single transfer
at this time.

Signed-off-by: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 205 +++++++++++++++++++++++++----
 1 file changed, 181 insertions(+), 24 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 212336f724a6..a73dc1738a62 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -99,6 +99,10 @@ struct geni_i2c_dev {
 	struct dma_chan *rx_c;
 	bool gpi_mode;
 	bool abort_done;
+	bool is_tx_multi_xfer;
+	u32 num_msgs;
+	u32 tx_irq_cnt;
+	struct gpi_i2c_config *gpi_config;
 };
 
 struct geni_i2c_desc {
@@ -485,6 +489,7 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 static void i2c_gpi_cb_result(void *cb, const struct dmaengine_result *result)
 {
 	struct geni_i2c_dev *gi2c = cb;
+	struct gpi_multi_xfer *tx_multi_xfer;
 
 	if (result->result != DMA_TRANS_NOERROR) {
 		dev_err(gi2c->se.dev, "DMA txn failed:%d\n", result->result);
@@ -493,7 +498,21 @@ static void i2c_gpi_cb_result(void *cb, const struct dmaengine_result *result)
 		dev_dbg(gi2c->se.dev, "DMA xfer has pending: %d\n", result->residue);
 	}
 
-	complete(&gi2c->done);
+	if (gi2c->is_tx_multi_xfer) {
+		tx_multi_xfer = &gi2c->gpi_config->multi_xfer;
+
+		/*
+		 * Send Completion for last message or multiple of NUM_MSGS_PER_IRQ.
+		 */
+		if ((tx_multi_xfer->irq_msg_cnt == gi2c->num_msgs - 1) ||
+		    (!((tx_multi_xfer->irq_msg_cnt + 1) % NUM_MSGS_PER_IRQ))) {
+			tx_multi_xfer->irq_cnt++;
+			complete(&gi2c->done);
+		}
+		tx_multi_xfer->irq_msg_cnt++;
+	} else {
+		complete(&gi2c->done);
+	}
 }
 
 static void geni_i2c_gpi_unmap(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
@@ -511,7 +530,41 @@ static void geni_i2c_gpi_unmap(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 	}
 }
 
-static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
+/**
+ * gpi_i2c_multi_desc_unmap() - unmaps the buffers post multi message TX transfers
+ * @dev: pointer to the corresponding dev node
+ * @gi2c: i2c dev handle
+ * @msgs: i2c messages array
+ * @peripheral: pointer to the gpi_i2c_config
+ */
+static void gpi_i2c_multi_desc_unmap(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[],
+				     struct gpi_i2c_config *peripheral)
+{
+	u32 msg_xfer_cnt, wr_idx = 0;
+	struct gpi_multi_xfer *tx_multi_xfer = &peripheral->multi_xfer;
+
+	/*
+	 * In error case, need to unmap all messages based on the msg_idx_cnt.
+	 * Non-error case unmap all the processed messages.
+	 */
+	if (gi2c->err)
+		msg_xfer_cnt = tx_multi_xfer->msg_idx_cnt;
+	else
+		msg_xfer_cnt = tx_multi_xfer->irq_cnt * NUM_MSGS_PER_IRQ;
+
+	/* Unmap the processed DMA buffers based on the received interrupt count */
+	for (; tx_multi_xfer->unmap_msg_cnt < msg_xfer_cnt; tx_multi_xfer->unmap_msg_cnt++) {
+		if (tx_multi_xfer->unmap_msg_cnt == gi2c->num_msgs)
+			break;
+		wr_idx = tx_multi_xfer->unmap_msg_cnt % QCOM_GPI_MAX_NUM_MSGS;
+		geni_i2c_gpi_unmap(gi2c, &msgs[tx_multi_xfer->unmap_msg_cnt],
+				   tx_multi_xfer->dma_buf[wr_idx],
+				   tx_multi_xfer->dma_addr[wr_idx], NULL, NULL);
+		tx_multi_xfer->freed_msg_cnt++;
+	}
+}
+
+static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], int cur_msg_idx,
 			struct dma_slave_config *config, dma_addr_t *dma_addr_p,
 			void **buf, unsigned int op, struct dma_chan *dma_chan)
 {
@@ -523,26 +576,49 @@ static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 	enum dma_transfer_direction dma_dirn;
 	struct dma_async_tx_descriptor *desc;
 	int ret;
+	struct gpi_multi_xfer *gi2c_gpi_xfer;
+	dma_cookie_t cookie;
 
 	peripheral = config->peripheral_config;
-
-	dma_buf = i2c_get_dma_safe_msg_buf(msg, 1);
-	if (!dma_buf)
+	gi2c_gpi_xfer = &peripheral->multi_xfer;
+	gi2c_gpi_xfer->msg_idx_cnt = cur_msg_idx;
+	dma_buf = gi2c_gpi_xfer->dma_buf[gi2c_gpi_xfer->buf_idx];
+	addr = gi2c_gpi_xfer->dma_addr[gi2c_gpi_xfer->buf_idx];
+
+	dma_buf = i2c_get_dma_safe_msg_buf(&msgs[gi2c_gpi_xfer->msg_idx_cnt], 1);
+	if (!dma_buf) {
+		gi2c->err = -ENOMEM;
 		return -ENOMEM;
+	}
 
 	if (op == I2C_WRITE)
 		map_dirn = DMA_TO_DEVICE;
 	else
 		map_dirn = DMA_FROM_DEVICE;
 
-	addr = dma_map_single(gi2c->se.dev->parent, dma_buf, msg->len, map_dirn);
+	addr = dma_map_single(gi2c->se.dev->parent,
+			      dma_buf, msgs[gi2c_gpi_xfer->msg_idx_cnt].len,
+			      map_dirn);
 	if (dma_mapping_error(gi2c->se.dev->parent, addr)) {
-		i2c_put_dma_safe_msg_buf(dma_buf, msg, false);
+		i2c_put_dma_safe_msg_buf(dma_buf, &msgs[gi2c_gpi_xfer->msg_idx_cnt],
+					 false);
+		gi2c->err = -ENOMEM;
 		return -ENOMEM;
 	}
 
+	if (gi2c->is_tx_multi_xfer) {
+		if (((gi2c_gpi_xfer->msg_idx_cnt + 1) % NUM_MSGS_PER_IRQ))
+			peripheral->flags |= QCOM_GPI_BLOCK_EVENT_IRQ;
+		else
+			peripheral->flags &= ~QCOM_GPI_BLOCK_EVENT_IRQ;
+
+		/* BEI bit to be cleared for last TRE */
+		if (gi2c_gpi_xfer->msg_idx_cnt == gi2c->num_msgs - 1)
+			peripheral->flags &= ~QCOM_GPI_BLOCK_EVENT_IRQ;
+	}
+
 	/* set the length as message for rx txn */
-	peripheral->rx_len = msg->len;
+	peripheral->rx_len = msgs[gi2c_gpi_xfer->msg_idx_cnt].len;
 	peripheral->op = op;
 
 	ret = dmaengine_slave_config(dma_chan, config);
@@ -560,25 +636,56 @@ static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 	else
 		dma_dirn = DMA_DEV_TO_MEM;
 
-	desc = dmaengine_prep_slave_single(dma_chan, addr, msg->len, dma_dirn, flags);
+	desc = dmaengine_prep_slave_single(dma_chan, addr,
+					   msgs[gi2c_gpi_xfer->msg_idx_cnt].len,
+					   dma_dirn, flags);
 	if (!desc) {
 		dev_err(gi2c->se.dev, "prep_slave_sg failed\n");
-		ret = -EIO;
+		gi2c->err = -EIO;
 		goto err_config;
 	}
 
 	desc->callback_result = i2c_gpi_cb_result;
 	desc->callback_param = gi2c;
 
-	dmaengine_submit(desc);
-	*buf = dma_buf;
-	*dma_addr_p = addr;
+	if (!((msgs[cur_msg_idx].flags & I2C_M_RD) && op == I2C_WRITE)) {
+		gi2c_gpi_xfer->msg_idx_cnt++;
+		gi2c_gpi_xfer->buf_idx = (cur_msg_idx + 1) % QCOM_GPI_MAX_NUM_MSGS;
+	}
+	cookie = dmaengine_submit(desc);
+	if (dma_submit_error(cookie)) {
+		dev_err(gi2c->se.dev,
+			"%s: dmaengine_submit failed (%d)\n", __func__, cookie);
+		return -EINVAL;
+	}
 
+	if (gi2c->is_tx_multi_xfer) {
+		dma_async_issue_pending(gi2c->tx_c);
+		if ((cur_msg_idx == (gi2c->num_msgs - 1)) ||
+		    (gi2c_gpi_xfer->msg_idx_cnt >=
+		     QCOM_GPI_MAX_NUM_MSGS + gi2c_gpi_xfer->freed_msg_cnt)) {
+			ret = gpi_multi_desc_process(gi2c->se.dev, gi2c_gpi_xfer,
+						     gi2c->num_msgs, XFER_TIMEOUT,
+						     &gi2c->done);
+			if (ret) {
+				dev_dbg(gi2c->se.dev,
+					"I2C multi write msg transfer timeout: %d\n",
+					ret);
+				gi2c->err = -ETIMEDOUT;
+				goto err_config;
+			}
+		}
+	} else {
+		/* Non multi descriptor message transfer */
+		*buf = dma_buf;
+		*dma_addr_p = addr;
+	}
 	return 0;
 
 err_config:
-	dma_unmap_single(gi2c->se.dev->parent, addr, msg->len, map_dirn);
-	i2c_put_dma_safe_msg_buf(dma_buf, msg, false);
+	dma_unmap_single(gi2c->se.dev->parent, addr,
+			 msgs[cur_msg_idx].len, map_dirn);
+	i2c_put_dma_safe_msg_buf(dma_buf, &msgs[cur_msg_idx], false);
 	return ret;
 }
 
@@ -590,6 +697,7 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
 	unsigned long time_left;
 	dma_addr_t tx_addr, rx_addr;
 	void *tx_buf = NULL, *rx_buf = NULL;
+	struct gpi_multi_xfer *tx_multi_xfer;
 	const struct geni_i2c_clk_fld *itr = gi2c->clk_fld;
 
 	config.peripheral_config = &peripheral;
@@ -603,6 +711,39 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
 	peripheral.set_config = 1;
 	peripheral.multi_msg = false;
 
+	gi2c->gpi_config = &peripheral;
+	gi2c->num_msgs = num;
+	gi2c->is_tx_multi_xfer = false;
+	gi2c->tx_irq_cnt = 0;
+
+	tx_multi_xfer = &peripheral.multi_xfer;
+	tx_multi_xfer->msg_idx_cnt = 0;
+	tx_multi_xfer->buf_idx = 0;
+	tx_multi_xfer->unmap_msg_cnt = 0;
+	tx_multi_xfer->freed_msg_cnt = 0;
+	tx_multi_xfer->irq_msg_cnt = 0;
+	tx_multi_xfer->irq_cnt = 0;
+
+	/*
+	 * If number of write messages are four and higher then
+	 * configure hardware for multi descriptor transfers with BEI.
+	 */
+	if (num >= MIN_NUM_OF_MSGS_MULTI_DESC) {
+		gi2c->is_tx_multi_xfer = true;
+		for (i = 0; i < num; i++) {
+			if (msgs[i].flags & I2C_M_RD) {
+				/*
+				 * Multi descriptor transfer with BEI
+				 * support is enabled for write transfers.
+				 * Add BEI optimization support for read
+				 * transfers later.
+				 */
+				gi2c->is_tx_multi_xfer = false;
+				break;
+			}
+		}
+	}
+
 	for (i = 0; i < num; i++) {
 		gi2c->cur = &msgs[i];
 		gi2c->err = 0;
@@ -613,14 +754,16 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
 			peripheral.stretch = 1;
 
 		peripheral.addr = msgs[i].addr;
+		if (i > 0 && (!(msgs[i].flags & I2C_M_RD)))
+			peripheral.multi_msg = false;
 
-		ret =  geni_i2c_gpi(gi2c, &msgs[i], &config,
+		ret =  geni_i2c_gpi(gi2c, msgs, i, &config,
 				    &tx_addr, &tx_buf, I2C_WRITE, gi2c->tx_c);
 		if (ret)
 			goto err;
 
 		if (msgs[i].flags & I2C_M_RD) {
-			ret =  geni_i2c_gpi(gi2c, &msgs[i], &config,
+			ret =  geni_i2c_gpi(gi2c, msgs, i, &config,
 					    &rx_addr, &rx_buf, I2C_READ, gi2c->rx_c);
 			if (ret)
 				goto err;
@@ -628,18 +771,28 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
 			dma_async_issue_pending(gi2c->rx_c);
 		}
 
-		dma_async_issue_pending(gi2c->tx_c);
-
-		time_left = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
-		if (!time_left)
-			gi2c->err = -ETIMEDOUT;
+		if (!gi2c->is_tx_multi_xfer) {
+			dma_async_issue_pending(gi2c->tx_c);
+			time_left = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
+			if (!time_left) {
+				dev_err(gi2c->se.dev, "%s:I2C timeout\n", __func__);
+				gi2c->err = -ETIMEDOUT;
+			}
+		}
 
 		if (gi2c->err) {
 			ret = gi2c->err;
 			goto err;
 		}
 
-		geni_i2c_gpi_unmap(gi2c, &msgs[i], tx_buf, tx_addr, rx_buf, rx_addr);
+		if (!gi2c->is_tx_multi_xfer) {
+			geni_i2c_gpi_unmap(gi2c, &msgs[i], tx_buf, tx_addr, rx_buf, rx_addr);
+		} else {
+			if (gi2c->tx_irq_cnt != tx_multi_xfer->irq_cnt) {
+				gi2c->tx_irq_cnt = tx_multi_xfer->irq_cnt;
+				gpi_i2c_multi_desc_unmap(gi2c, msgs, &peripheral);
+			}
+		}
 	}
 
 	return num;
@@ -648,7 +801,11 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
 	dev_err(gi2c->se.dev, "GPI transfer failed: %d\n", ret);
 	dmaengine_terminate_sync(gi2c->rx_c);
 	dmaengine_terminate_sync(gi2c->tx_c);
-	geni_i2c_gpi_unmap(gi2c, &msgs[i], tx_buf, tx_addr, rx_buf, rx_addr);
+	if (gi2c->is_tx_multi_xfer)
+		gpi_i2c_multi_desc_unmap(gi2c, msgs, &peripheral);
+	else
+		geni_i2c_gpi_unmap(gi2c, &msgs[i], tx_buf, tx_addr, rx_buf, rx_addr);
+
 	return ret;
 }
 
-- 
2.17.1


