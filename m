Return-Path: <linux-i2c+bounces-2247-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 99967874AFA
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Mar 2024 10:36:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 00509B22F2C
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Mar 2024 09:36:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D662883CAF;
	Thu,  7 Mar 2024 09:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hTI+sI2O"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3BBE84A28;
	Thu,  7 Mar 2024 09:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709804184; cv=none; b=JNxUIIOcbGkYuiLUYfR7tMg3uB9X/EKiyFvDzJpGSeecSxxACpuRrGAymffBZC6ftlGC87U61F1UkWDqDlYepSRF0Vn+zUjRMRY0gqXxJDBOYPOv4XSvQVhaU8macVJ/eN9h4PuIHSFdor5SxSLUVcqYoqOXmXXVcg71rAXiSTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709804184; c=relaxed/simple;
	bh=c6JTae3X8EbGrrBXZAoYFKB4tWKTJORuMmYAk3xdjzM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oVb0baLbl4Bp+lo8zSCz1uHZ+lexNfldP6jMzhK6lhO6cusJwuZIkXef5yh5uH6ijjEdUIQEtafpGoqnykYxIRhsL6YOk6yl9bXD5x3CjryhkUmDJFTcQlz3MWgDddM2XCDRhM4jLGFkhpMgKd6ot4XM0vRSuBCethlB3olaEGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hTI+sI2O; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4279R5MB018976;
	Thu, 7 Mar 2024 09:36:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=qcppdkim1; bh=/+HV/DoqfIaT7XetzG/p
	opW0g9YNP1zbblxQCDJHK8w=; b=hTI+sI2OXlalzZGDIGSJZWpfnWvh5pkg134l
	PSH0wru+/wi+TW4Rb1+JnqtfgAzYNLA/foJDFTBldNGslVyy7R4bVwM1HYW6n2YS
	s74uiV4tE2nlQ+EdZGWp79RQ/x890dP8Egt9yWVKCYY+xomkUfIGv6nQgVh8d2d5
	z1RVjBxJ6LigctZGuq9OxtVEsryaqhNHsk3YNWQeBHUzfqi6vUq1VaFX3slyYd+N
	TrXrUqDTVfouV+GXuy1c3B3eCWya44aU+pTudyHHy2tgzoQv7dmHHaYWV6FlM4Hp
	EodVFgYeeBW6QzyIJzWYFSVWvcnty+BYH1LPajuWREUOrDouEw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wqay8r0hw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Mar 2024 09:36:17 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 4279aEYO019558;
	Thu, 7 Mar 2024 09:36:14 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 3wkw6kxy5y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Mar 2024 09:36:14 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4279aDaX019552;
	Thu, 7 Mar 2024 09:36:14 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-msavaliy-hyd.qualcomm.com [10.213.110.207])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4279aDXe019549
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Mar 2024 09:36:13 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 429934)
	id 78A23243B2; Thu,  7 Mar 2024 15:06:12 +0530 (+0530)
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
To: konrad.dybcio@linaro.org, bjorn.andersson@linaro.org, vkoul@kernel.org,
        andi.shyti@kernel.org, wsa@kernel.org, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
Cc: quic_vdadhani@quicinc.com,
        Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Subject: [PATCH v2] i2c: i2c-qcom-geni: Parse Error correctly in i2c GSI mode
Date: Thu,  7 Mar 2024 15:06:05 +0530
Message-Id: <20240307093605.4142639-1-quic_msavaliy@quicinc.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 8cPEz2i-lOzdB72moP2sYmRaGb2xOcU0
X-Proofpoint-ORIG-GUID: 8cPEz2i-lOzdB72moP2sYmRaGb2xOcU0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-07_06,2024-03-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=999
 priorityscore=1501 suspectscore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 spamscore=0 adultscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403070069

We are seeing transfer failure instead of NACK error for simple
device scan test.Ideally it should report exact error like NACK
if device is not present.

We may also expect errors like BUS_PROTO or ARB_LOST, hence we are
adding such error support in GSI mode and reporting it accordingly
by adding respective error logs.

During geni_i2c_gpi_xfer(), we should expect callback param as a
transfer result. For that we have added a new structure named
gpi_i2c_result, which will store xfer result.

Upon receiving an interrupt, gpi_process_xfer_compl_event() will
store transfer result into status variable and then call the
dmaengine_desc_callback_invoke(). Hence i2c_gpi_cb_result() can
parse the respective errors.

while parsing error from the status param, use FIELD_GET with the
mask instead of multiple shifting operations for each error.

Fixes: d8703554f4de ("i2c: qcom-geni: Add support for GPI DMA")
Co-developed-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
---
---
- Commit log changed we->We.
- Explained the problem that we are not detecing NACK error.
- Removed Heap based memory allocation and hence memory leakage issue.
- Used FIELD_GET and removed shiting and masking every time as suggested by Bjorn.
- Changed commit log to reflect the code changes done.
- Removed adding anything into struct gpi_i2c_config and created new structure
  for error status as suggested by Bjorn.
---
 drivers/dma/qcom/gpi.c             | 12 +++++++++++-
 drivers/i2c/busses/i2c-qcom-geni.c | 19 +++++++++++++++----
 include/linux/dma/qcom-gpi-dma.h   | 10 ++++++++++
 3 files changed, 36 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
index 1c93864e0e4d..e3508d51fdc9 100644
--- a/drivers/dma/qcom/gpi.c
+++ b/drivers/dma/qcom/gpi.c
@@ -1076,7 +1076,17 @@ static void gpi_process_xfer_compl_event(struct gchan *gchan,
 	dev_dbg(gpii->gpi_dev->dev, "Residue %d\n", result.residue);
 
 	dma_cookie_complete(&vd->tx);
-	dmaengine_desc_get_callback_invoke(&vd->tx, &result);
+	if (gchan->protocol == QCOM_GPI_I2C) {
+		struct dmaengine_desc_callback cb;
+		struct gpi_i2c_result *i2c;
+
+		dmaengine_desc_get_callback(&vd->tx, &cb);
+		i2c = cb.callback_param;
+		i2c->status = compl_event->status;
+		dmaengine_desc_callback_invoke(&cb, &result);
+	} else {
+		dmaengine_desc_get_callback_invoke(&vd->tx, &result);
+	}
 
 gpi_free_desc:
 	spin_lock_irqsave(&gchan->vc.lock, flags);
diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index da94df466e83..36a7c0c0ff54 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -66,6 +66,7 @@ enum geni_i2c_err_code {
 	GENI_TIMEOUT,
 };
 
+#define I2C_DMA_TX_IRQ_MASK	GENMASK(12, 5)
 #define DM_I2C_CB_ERR		((BIT(NACK) | BIT(BUS_PROTO) | BIT(ARB_LOST)) \
 									<< 5)
 
@@ -99,6 +100,7 @@ struct geni_i2c_dev {
 	struct dma_chan *rx_c;
 	bool gpi_mode;
 	bool abort_done;
+	struct gpi_i2c_result i2c_result;
 };
 
 struct geni_i2c_desc {
@@ -484,9 +486,18 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 
 static void i2c_gpi_cb_result(void *cb, const struct dmaengine_result *result)
 {
-	struct geni_i2c_dev *gi2c = cb;
-
-	if (result->result != DMA_TRANS_NOERROR) {
+	struct gpi_i2c_result *i2c_res = cb;
+	struct geni_i2c_dev *gi2c = container_of(i2c_res, struct geni_i2c_dev, i2c_result);
+	u32 status;
+
+	status = FIELD_GET(I2C_DMA_TX_IRQ_MASK, i2c_res->status);
+	if (status == BIT(NACK)) {
+		geni_i2c_err(gi2c, NACK);
+	} else if (status == BIT(BUS_PROTO)) {
+		geni_i2c_err(gi2c, BUS_PROTO);
+	} else if (status == BIT(ARB_LOST)) {
+		geni_i2c_err(gi2c, ARB_LOST);
+	} else if (result->result != DMA_TRANS_NOERROR) {
 		dev_err(gi2c->se.dev, "DMA txn failed:%d\n", result->result);
 		gi2c->err = -EIO;
 	} else if (result->residue) {
@@ -568,7 +579,7 @@ static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 	}
 
 	desc->callback_result = i2c_gpi_cb_result;
-	desc->callback_param = gi2c;
+	desc->callback_param = &gi2c->i2c_result;
 
 	dmaengine_submit(desc);
 	*buf = dma_buf;
diff --git a/include/linux/dma/qcom-gpi-dma.h b/include/linux/dma/qcom-gpi-dma.h
index 6680dd1a43c6..f585c6a35e51 100644
--- a/include/linux/dma/qcom-gpi-dma.h
+++ b/include/linux/dma/qcom-gpi-dma.h
@@ -80,4 +80,14 @@ struct gpi_i2c_config {
 	bool multi_msg;
 };
 
+/**
+ * struct gpi_i2c_result - i2c transfer status result in GSI mode
+ *
+ * @status: store txfer status value as part of callback
+ *
+ */
+struct gpi_i2c_result {
+	u32 status;
+};
+
 #endif /* QCOM_GPI_DMA_H */
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project


