Return-Path: <linux-i2c+bounces-2345-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE3187A2A8
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Mar 2024 06:27:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8AC5C283304
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Mar 2024 05:27:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA5F01643E;
	Wed, 13 Mar 2024 05:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Te5eyCrn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C901C16428;
	Wed, 13 Mar 2024 05:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710307619; cv=none; b=cWQHwcsauEmO04gjYi3tF4lIavgjtvp6PupKgMt5z4c4GvWGB9SOUlLvDBSBv7EpKASAmDVjfSCBUPCNEvR+vQv9nLDy+X/LQ8u4rjiotIj1RTGD6SGKsLd4t3tGq8v3TTjsdJcT6dzOGF2W6IgPjzxOA3/lHHQ9YZbRAciT/Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710307619; c=relaxed/simple;
	bh=QDIMpAX3SblXqrKkGcVkal7Kc4YUL294h+W6+O3lvc8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KR0aiHFPm9OUhJg4//xhgWRSwhJj+8peFLpHNNKxDwyti0WyEYNmnwFbQMik42b//lJrW6uh+i6tvaFEwwZz+MXSzT7poX+7acUAh4feOpuH6qRSu0Wpbz1JOwGt8Cqk2As0JQQojFSRsdBaVDeWM78uJsy09XNt+gUcFhrLekw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Te5eyCrn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42D3EQnR026369;
	Wed, 13 Mar 2024 05:26:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=qcppdkim1; bh=HWAo1HneO3Cr4Ui3pBc8
	jLTbpGGRUGbVZPOuSOySp24=; b=Te5eyCrndjiFy62oDwa2H/Y0g9SI35JXIBQN
	Fm5O2JyspEvI4a6KY1Aj3+t5OUxVlKbpW3PkKlRBHHg2E6FW9d726xjOCRgbriJu
	/6exdJKc2/+NXCptzRv0I9EPAweirglhq+CwqW4HjgYHOiNttZ79Sd73XDwpGkEs
	wGau5yTNWVdch0O3tFv3/dqoEm23L217QfLTgMx04TRRR5ssUPu4q8ouCjlAqFxw
	/WaEXudl4dqsFgsUIoO23spyb6+P5wD5W26cN/AZkgSZsCByTLbYm2jSfC8vndDd
	mpBclfk+3EkJwg2z1PvSNogLRR9IDwH0DXRVPI1wiW7UqH8gGQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wu2j38ayn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Mar 2024 05:26:47 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 42D5QhKs007250;
	Wed, 13 Mar 2024 05:26:43 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 3wrgum5361-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Mar 2024 05:26:43 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 42D5QhYE007244;
	Wed, 13 Mar 2024 05:26:43 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-msavaliy-hyd.qualcomm.com [10.213.110.207])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 42D5QgYK007243
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Mar 2024 05:26:43 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 429934)
	id 4BC6D240E1; Wed, 13 Mar 2024 10:56:42 +0530 (+0530)
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
To: konrad.dybcio@linaro.org, andersson@kernel.org, vkoul@kernel.org,
        andi.shyti@kernel.org, wsa@kernel.org, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
Cc: quic_vdadhani@quicinc.com,
        Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v4] i2c: i2c-qcom-geni: Parse Error correctly in i2c GSI mode
Date: Wed, 13 Mar 2024 10:56:39 +0530
Message-Id: <20240313052639.1747078-1-quic_msavaliy@quicinc.com>
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
X-Proofpoint-ORIG-GUID: TxmVZef7H9yyvkUCUNfsHl74njhk29cM
X-Proofpoint-GUID: TxmVZef7H9yyvkUCUNfsHl74njhk29cM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-13_05,2024-03-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015 phishscore=0
 mlxscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403130039

I2C driver currently reports "DMA txn failed" error even though it's
NACK OR BUS_PROTO OR ARB_LOST. Detect NACK error when no device ACKs
on the bus instead of generic transfer failure which doesn't give any
specific clue.

Make Changes inside i2c driver callback handler function
i2c_gpi_cb_result() to parse these errors and make sure GSI driver
stores the error status during error interrupt.

Co-developed-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
v3 -> v4:
- Included bitfield.h to fix compilation issue for x86 arch.
- Removed Fixes tag as this is not fixing any crash.
- Added Reviewed-by tag.

v2 -> v3:
- Modifed commit log reflecting an imperative mood.

v1 -> v2:
- Commit log changed we->We.
- Explained the problem that we are not detecing NACK error.
- Removed Heap based memory allocation and hence memory leakage issue.
- Used FIELD_GET and removed shiting and masking every time as suggested by Bjorn.
- Changed commit log to reflect the code changes done.
- Removed adding anything into struct gpi_i2c_config and created new structure
  for error status as suggested by Bjorn.
---
 drivers/dma/qcom/gpi.c             | 12 +++++++++++-
 drivers/i2c/busses/i2c-qcom-geni.c | 20 ++++++++++++++++----
 include/linux/dma/qcom-gpi-dma.h   | 10 ++++++++++
 3 files changed, 37 insertions(+), 5 deletions(-)

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
index da94df466e83..11dcfcf13d8b 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -2,6 +2,7 @@
 // Copyright (c) 2017-2018, The Linux Foundation. All rights reserved.
 
 #include <linux/acpi.h>
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/dmaengine.h>
 #include <linux/dma-mapping.h>
@@ -66,6 +67,7 @@ enum geni_i2c_err_code {
 	GENI_TIMEOUT,
 };
 
+#define I2C_DMA_TX_IRQ_MASK	GENMASK(12, 5)
 #define DM_I2C_CB_ERR		((BIT(NACK) | BIT(BUS_PROTO) | BIT(ARB_LOST)) \
 									<< 5)
 
@@ -99,6 +101,7 @@ struct geni_i2c_dev {
 	struct dma_chan *rx_c;
 	bool gpi_mode;
 	bool abort_done;
+	struct gpi_i2c_result i2c_result;
 };
 
 struct geni_i2c_desc {
@@ -484,9 +487,18 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 
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
@@ -568,7 +580,7 @@ static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
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


