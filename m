Return-Path: <linux-i2c+bounces-8121-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C95A9D4D5C
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Nov 2024 14:02:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0E0A71F23D9B
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Nov 2024 13:02:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A66AD1D90B9;
	Thu, 21 Nov 2024 13:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MCwLyuuy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8AB21D89E3;
	Thu, 21 Nov 2024 13:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732194126; cv=none; b=e8Zadh3b5xPd07Sh4XwGiuOyG52VIjT606UasBNmeFF/SPgtVJYRC7xsfM/wKco0U18p9dzURSVNziGJ/sgk3FFWHMV9X2IGBoHSLLlYXFDOcftHmrrN5r9uwdpiAEGOc4oYDmrlnZfdXyc/ApOtXQvckHGLwysVCGquF6hql7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732194126; c=relaxed/simple;
	bh=MOye4Rv/CGaoopShXXmDC1S1nGm1R9L5HrCkKIMgdz8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OFKdN/SXlyhnMndiXckzya0ZXTFd5MQbhuxy4NZv1GE8WgpOaS3jRy11wZMn2JUY6lFLwkg4KSIEP7e2NIGU7kgCemkPVxrrszf3QUAxyLWPLNirB2TG+nHw36HVNj5MAit2y9BlVyBCQqjEYIi9SyU/NS1lRY8XKbKGshsDXFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MCwLyuuy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ALAYAb5028002;
	Thu, 21 Nov 2024 13:01:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fcV24CP8p8ZKQbyl5/VFsxFA
	jZC6tzjZ4McjekVadAw=; b=MCwLyuuyl9RXTOujosvnYav2mHpDr6nyxaGPousX
	y7Z5p3YwV0E6l0KHNbmEdQl0uAwMHhTjuB0XOGe0btCFlA6IaOmExRhbuE3/ODuZ
	wxDoYos3Si0YoY+WrMq/TNw4Ag0kzU19yWk/ufvRcAV76dsjHGZMvvJNJhoXugsJ
	qmuurYr1e9najDzZ002wxAMY+Not6MSi6sdzfDkvlANY33mf8pQFR6gvpxFsw0u+
	ZFTnwxBzZxzGy+weiKju0guhQc0zbGyVlsTUos+DqwuFM48RTAwVdnF5cWyppbqw
	nPnhkwJx0b9+mlpER0Tq9BhJ3JF9pBClKiuj/QgrK46WeQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 431ebybrj0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 13:01:58 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ALD1v1J021441
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 13:01:57 GMT
Received: from hu-jseerapu-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 21 Nov 2024 05:01:52 -0800
From: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
To: Vinod Koul <vkoul@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        "Sumit
 Semwal" <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?=
	<christian.koenig@amd.com>
CC: <linux-arm-msm@vger.kernel.org>, <dmaengine@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <linaro-mm-sig@lists.linaro.org>, <quic_msavaliy@quicinc.com>,
        <quic_vtanuku@quicinc.com>
Subject: [PATCH v3 1/3] dmaengine: qcom: gpi: Add GPI Block event interrupt support
Date: Thu, 21 Nov 2024 18:31:32 +0530
Message-ID: <20241121130134.29408-2-quic_jseerapu@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241121130134.29408-1-quic_jseerapu@quicinc.com>
References: <20241121130134.29408-1-quic_jseerapu@quicinc.com>
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
X-Proofpoint-GUID: AZurs0eNqLY67AGMlRLkGTQ5857_x39I
X-Proofpoint-ORIG-GUID: AZurs0eNqLY67AGMlRLkGTQ5857_x39I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 mlxlogscore=999
 spamscore=0 mlxscore=0 phishscore=0 suspectscore=0 bulkscore=0
 adultscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411210102

GSI hardware generates an interrupt for each transfer completion.
For multiple messages within a single transfer, this results in
N interrupts for N messages, leading to significant software
interrupt latency.

To mitigate this latency, utilize Block Event Interrupt (BEI) mechanism.
Enabling BEI instructs the GSI hardware to prevent interrupt generation
and BEI is disabled when an interrupt is necessary.

When using BEI, consider splitting a single multi-message transfer into
chunks of 8 internally. Interrupts are not expected for the first 7 message
completions, only the last message triggers an interrupt,indicating
the completion of 8 messages.

This BEI mechanism enhances overall transfer efficiency.

Signed-off-by: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
---

v2-> v3:
   - Renamed gpi_multi_desc_process to gpi_multi_xfer_timeout_handler
   - MIN_NUM_OF_MSGS_MULTI_DESC changed from 4 to 2
   - Added documentation for newly added changes in "qcom-gpi-dma.h" file
   - Updated commit description. 

v1 -> v2:
   - Changed dma_addr type from array of pointers to array.
   - To support BEI functionality with the TRE size of 64 defined in GPI driver,
     updated QCOM_GPI_MAX_NUM_MSGS to 16 and NUM_MSGS_PER_IRQ to 4.
 
 drivers/dma/qcom/gpi.c           | 48 ++++++++++++++++++++
 include/linux/dma/qcom-gpi-dma.h | 76 ++++++++++++++++++++++++++++++++
 2 files changed, 124 insertions(+)

diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
index 52a7c8f2498f..5442b65b1638 100644
--- a/drivers/dma/qcom/gpi.c
+++ b/drivers/dma/qcom/gpi.c
@@ -1693,6 +1693,9 @@ static int gpi_create_i2c_tre(struct gchan *chan, struct gpi_desc *desc,
 
 		tre->dword[3] = u32_encode_bits(TRE_TYPE_DMA, TRE_FLAGS_TYPE);
 		tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_IEOT);
+
+		if (i2c->flags & QCOM_GPI_BLOCK_EVENT_IRQ)
+			tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_BEI);
 	}
 
 	for (i = 0; i < tre_idx; i++)
@@ -2098,6 +2101,51 @@ static int gpi_find_avail_gpii(struct gpi_dev *gpi_dev, u32 seid)
 	return -EIO;
 }
 
+/**
+ * gpi_multi_xfer_timeout_handler() - Handle multi message transfer timeout
+ * @dev: pointer to the corresponding dev node
+ * @multi_xfer: pointer to the gpi_multi_xfer
+ * @num_xfers: total number of transfers
+ * @transfer_timeout_msecs: transfer timeout value
+ * @transfer_comp: completion object of the transfer
+ *
+ * This function is used to wait for the processed transfers based on
+ * the interrupts generated upon transfer completion.
+ * Return: On success returns 0, otherwise return error code (-ETIMEDOUT)
+ */
+int gpi_multi_xfer_timeout_handler(struct device *dev, struct gpi_multi_xfer *multi_xfer,
+				   u32 num_xfers, u32 transfer_timeout_msecs,
+				   struct completion *transfer_comp)
+{
+	int i;
+	u32 max_irq_cnt, time_left;
+
+	max_irq_cnt = num_xfers / NUM_MSGS_PER_IRQ;
+	if (num_xfers % NUM_MSGS_PER_IRQ)
+		max_irq_cnt++;
+
+	/*
+	 * Wait for the interrupts of the processed transfers in multiple
+	 * of 8 and for the last transfer. If the hardware is fast and
+	 * already processed all the transfers then no need to wait.
+	 */
+	for (i = 0; i < max_irq_cnt; i++) {
+		reinit_completion(transfer_comp);
+		if (max_irq_cnt != multi_xfer->irq_cnt) {
+			time_left = wait_for_completion_timeout(transfer_comp,
+								transfer_timeout_msecs);
+			if (!time_left) {
+				dev_err(dev, "%s: Transfer timeout\n", __func__);
+				return -ETIMEDOUT;
+			}
+		}
+		if (num_xfers > multi_xfer->msg_idx_cnt)
+			return 0;
+	}
+	return 0;
+}
+EXPORT_SYMBOL_GPL(gpi_multi_xfer_timeout_handler);
+
 /* gpi_of_dma_xlate: open client requested channel */
 static struct dma_chan *gpi_of_dma_xlate(struct of_phandle_args *args,
 					 struct of_dma *of_dma)
diff --git a/include/linux/dma/qcom-gpi-dma.h b/include/linux/dma/qcom-gpi-dma.h
index 6680dd1a43c6..f001a8ac1887 100644
--- a/include/linux/dma/qcom-gpi-dma.h
+++ b/include/linux/dma/qcom-gpi-dma.h
@@ -15,6 +15,38 @@ enum spi_transfer_cmd {
 	SPI_DUPLEX,
 };
 
+/**
+ * define QCOM_GPI_BLOCK_EVENT_IRQ - Block event interrupt support
+ *
+ * This is used to enable/disable the Block event interrupt mechanism.
+ */
+#define QCOM_GPI_BLOCK_EVENT_IRQ	BIT(0)
+
+/**
+ * define QCOM_GPI_MAX_NUM_MSGS	- maximum number of messages support
+ *
+ * This indicates maximum number of messages can allocate and
+ * submit to hardware. To handle more messages beyond this,
+ * need to unmap the processed messages.
+ */
+#define QCOM_GPI_MAX_NUM_MSGS		16
+
+/**
+ * define NUM_MSGS_PER_IRQ - interrupt per messages completion
+ *
+ * This indicates that trigger an interrupt, after the completion of 8 messages.
+ */
+#define NUM_MSGS_PER_IRQ		8
+
+/**
+ * define MIN_NUM_OF_MSGS_MULTI_DESC - \
+ *	minimum number of messages to support Block evenet interrupt
+ *
+ * This indicates minimum number of messages in a trenafer required to
+ * process it using block event interrupt mechanism.
+ */
+#define MIN_NUM_OF_MSGS_MULTI_DESC	2
+
 /**
  * struct gpi_spi_config - spi config for peripheral
  *
@@ -51,6 +83,29 @@ enum i2c_op {
 	I2C_READ,
 };
 
+/**
+ * struct gpi_multi_xfer - Used for multi transfer support
+ *
+ * @msg_idx_cnt: message index for the transfer
+ * @buf_idx: dma buffer index
+ * @unmap_msg_cnt: unmapped transfer index
+ * @freed_msg_cnt: freed transfer index
+ * @irq_cnt: received interrupt count
+ * @irq_msg_cnt: transfer message count for the received irqs
+ * @dma_buf: virtual addresses of the buffers
+ * @dma_addr: dma addresses of the buffers
+ */
+struct gpi_multi_xfer {
+	u32 msg_idx_cnt;
+	u32 buf_idx;
+	u32 unmap_msg_cnt;
+	u32 freed_msg_cnt;
+	u32 irq_cnt;
+	u32 irq_msg_cnt;
+	void *dma_buf[QCOM_GPI_MAX_NUM_MSGS];
+	dma_addr_t dma_addr[QCOM_GPI_MAX_NUM_MSGS];
+};
+
 /**
  * struct gpi_i2c_config - i2c config for peripheral
  *
@@ -65,6 +120,8 @@ enum i2c_op {
  * @rx_len: receive length for buffer
  * @op: i2c cmd
  * @muli-msg: is part of multi i2c r-w msgs
+ * @flags: true for block event interrupt support
+ * @multi_xfer: indicates transfer has multi messages
  */
 struct gpi_i2c_config {
 	u8 set_config;
@@ -78,6 +135,25 @@ struct gpi_i2c_config {
 	u32 rx_len;
 	enum i2c_op op;
 	bool multi_msg;
+	u8 flags;
+	struct gpi_multi_xfer multi_xfer;
 };
 
+/**
+ * gpi_multi_timeout_handler() - Handle multi message transfer timeout
+ * @dev: pointer to the corresponding dev node
+ * @multi_xfer: pointer to the gpi_multi_xfer
+ * @num_xfers: total number of transfers
+ * @transfer_timeout_msecs: transfer timeout value
+ * @transfer_comp: completion object of the transfer
+ *
+ * This function is used to wait for the processed transfers based on
+ * the interrupts generated upon transfer completion.
+ *
+ * Return: On success returns 0, otherwise return error code (-ETIMEDOUT)
+ */
+int gpi_multi_xfer_timeout_handler(struct device *dev, struct gpi_multi_xfer *multi_xfer,
+			   u32 num_xfers, u32 tranfer_timeout_msecs,
+			   struct completion *transfer_comp);
+
 #endif /* QCOM_GPI_DMA_H */
-- 
2.17.1


