Return-Path: <linux-i2c+bounces-7045-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B84AC987E6B
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Sep 2024 08:32:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6E5FC1C209BB
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Sep 2024 06:32:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 368E817B50D;
	Fri, 27 Sep 2024 06:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="N9Bu3ZZs"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1C817A590;
	Fri, 27 Sep 2024 06:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727418699; cv=none; b=Ng/7lzB7npyT1eE52c91Zb1DlYdW319mr1zVT/ZD+yXeJDYulg9OjYAcXxJh6IfXSHlNc8VBDVvkVhrYoqEQ7sjs1tFTU36D+8Ui4deeqV13/dpRscLp4YnTQBep29sRdsVFlI9rXCWVN/NBrKlkiSBPbJqngqo+gqbW9cvgG/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727418699; c=relaxed/simple;
	bh=YiBEyMGkuz5kpWjLn8/rzckTTdeNVTIwDDh+4HtJPgA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=k0VFKSKzfVAWu60rGaC22IaczFFbMHDdukhj0vroirdmt9lKe9VSwSWXWsgVtiqUZTcrC/uMgvnEXbJ7XiIxBcwv1vTdR+6bIy5HpjyKeElawTVS0lYMjimmMV4dAKsKTP7PO7KsGr1LWFVWCL3dpQhJUe3K6OVWausHp6LT3rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=N9Bu3ZZs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48R6FaoB026493;
	Fri, 27 Sep 2024 06:31:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=4zsVzf2BA5j
	x/ttHUgcj2pHb1xIaBaZxzi+pRWBkB5U=; b=N9Bu3ZZs+3bvNpSYFoyhWUPsmxC
	Ki4UuCchhodgTLxW4Fbtaed/VHyn8wNfb1KbW8s71MRjrStSA/3ihseehqn63Jp0
	wK2OoTq5yH79+mcWvidfKzG6e5RlldTc1CeDGTgxY7MefmtaqBuE+ndy0maJKtu9
	HBGqucwGSosGUYbjOlTgl2TFrjwz44vWQXO6u+VJGtXNnUzs8cd+QSL0InNWSIHS
	HJlHo3E4vgbxm66ptuLtVZpUfO0XALWwwmq4E4ADxeDefAWOJyEqHyaQRql93CKe
	FHcotODYMDyUpoFjm3nfWSMQO4a5nt3FBcLjuPHrPcHx/S19FwPRi72euIQ==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41sn5c23rg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Sep 2024 06:31:29 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 48R6VQAh001890;
	Fri, 27 Sep 2024 06:31:26 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 41sq7mnbnd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Sep 2024 06:31:26 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 48R6VQ6g001884;
	Fri, 27 Sep 2024 06:31:26 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-msavaliy-hyd.qualcomm.com [10.213.110.207])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 48R6VPhY001883
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Sep 2024 06:31:26 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 429934)
	id B2C9B2408B; Fri, 27 Sep 2024 12:01:24 +0530 (+0530)
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
To: konrad.dybcio@linaro.org, andersson@kernel.org, andi.shyti@kernel.org,
        linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        conor+dt@kernel.org, agross@kernel.org, devicetree@vger.kernel.org,
        vkoul@kernel.org, linux@treblig.org, dan.carpenter@linaro.org,
        Frank.Li@nxp.com, konradybcio@kernel.org, bryan.odonoghue@linaro.org,
        krzk+dt@kernel.org, robh@kernel.org
Cc: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Subject: [PATCH v3 2/4] dma: gpi: Add Lock and Unlock TRE support to access SE exclusively
Date: Fri, 27 Sep 2024 12:01:06 +0530
Message-Id: <20240927063108.2773304-3-quic_msavaliy@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240927063108.2773304-1-quic_msavaliy@quicinc.com>
References: <20240927063108.2773304-1-quic_msavaliy@quicinc.com>
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
X-Proofpoint-ORIG-GUID: aidnH4_FHISXJN-pOv3h8N7h_zjsVA_a
X-Proofpoint-GUID: aidnH4_FHISXJN-pOv3h8N7h_zjsVA_a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 mlxlogscore=999
 spamscore=0 mlxscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409270043

GSI DMA provides specific TREs namely Lock and Unlock TRE, which
provides mutual exclusive access to SE from any of the subsystem
(E.g. Apps, TZ, ADSP etc). Lock prevents other subsystems from
concurrently performing DMA transfers and avoids disturbance to
data path. Basically for shared SE usecase, lock the SE for
particular subsystem, complete the transfer, unlock the SE.

Apply Lock TRE for the first transfer of shared SE and Apply Unlock
TRE for the last transfer.

Also change MAX_TRE macro to 5 from 3 because of the two additional TREs.

TRE = Transfer Ring Element, refers to the queued descriptor.
SE = Serial Engine
SS = Subsystems (Apps processor, TZ, ADSP, Modem)

Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
---
 drivers/dma/qcom/gpi.c           | 37 +++++++++++++++++++++++++++++++-
 include/linux/dma/qcom-gpi-dma.h |  6 ++++++
 2 files changed, 42 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
index 52a7c8f2498f..120d91234442 100644
--- a/drivers/dma/qcom/gpi.c
+++ b/drivers/dma/qcom/gpi.c
@@ -2,6 +2,7 @@
 /*
  * Copyright (c) 2017-2020, The Linux Foundation. All rights reserved.
  * Copyright (c) 2020, Linaro Limited
+ * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include <dt-bindings/dma/qcom-gpi.h>
@@ -65,6 +66,14 @@
 /* DMA TRE */
 #define TRE_DMA_LEN		GENMASK(23, 0)
 
+/* Lock TRE */
+#define TRE_I2C_LOCK		BIT(0)
+#define TRE_MINOR_TYPE		GENMASK(19, 16)
+#define TRE_MAJOR_TYPE		GENMASK(23, 20)
+
+/* Unlock TRE */
+#define TRE_I2C_UNLOCK		BIT(8)
+
 /* Register offsets from gpi-top */
 #define GPII_n_CH_k_CNTXT_0_OFFS(n, k)	(0x20000 + (0x4000 * (n)) + (0x80 * (k)))
 #define GPII_n_CH_k_CNTXT_0_EL_SIZE	GENMASK(31, 24)
@@ -516,7 +525,7 @@ struct gpii {
 	bool ieob_set;
 };
 
-#define MAX_TRE 3
+#define MAX_TRE 5
 
 struct gpi_desc {
 	struct virt_dma_desc vd;
@@ -1637,6 +1646,19 @@ static int gpi_create_i2c_tre(struct gchan *chan, struct gpi_desc *desc,
 	struct gpi_tre *tre;
 	unsigned int i;
 
+	/* create lock tre for first tranfser */
+	if (i2c->shared_se && i2c->first_msg) {
+		tre = &desc->tre[tre_idx];
+		tre_idx++;
+
+		tre->dword[0] = 0;
+		tre->dword[1] = 0;
+		tre->dword[2] = 0;
+		tre->dword[3] = u32_encode_bits(1, TRE_I2C_LOCK);
+		tre->dword[3] |= u32_encode_bits(0, TRE_MINOR_TYPE);
+		tre->dword[3] |= u32_encode_bits(3, TRE_MAJOR_TYPE);
+	}
+
 	/* first create config tre if applicable */
 	if (i2c->set_config) {
 		tre = &desc->tre[tre_idx];
@@ -1695,6 +1717,19 @@ static int gpi_create_i2c_tre(struct gchan *chan, struct gpi_desc *desc,
 		tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_IEOT);
 	}
 
+	/* Unlock tre for last transfer */
+	if (i2c->shared_se && i2c->last_msg && i2c->op != I2C_READ) {
+		tre = &desc->tre[tre_idx];
+		tre_idx++;
+
+		tre->dword[0] = 0;
+		tre->dword[1] = 0;
+		tre->dword[2] = 0;
+		tre->dword[3] = u32_encode_bits(1, TRE_I2C_UNLOCK);
+		tre->dword[3] |= u32_encode_bits(1, TRE_MINOR_TYPE);
+		tre->dword[3] |= u32_encode_bits(3, TRE_MAJOR_TYPE);
+	}
+
 	for (i = 0; i < tre_idx; i++)
 		dev_dbg(dev, "TRE:%d %x:%x:%x:%x\n", i, desc->tre[i].dword[0],
 			desc->tre[i].dword[1], desc->tre[i].dword[2], desc->tre[i].dword[3]);
diff --git a/include/linux/dma/qcom-gpi-dma.h b/include/linux/dma/qcom-gpi-dma.h
index 6680dd1a43c6..8589c711afae 100644
--- a/include/linux/dma/qcom-gpi-dma.h
+++ b/include/linux/dma/qcom-gpi-dma.h
@@ -65,6 +65,9 @@ enum i2c_op {
  * @rx_len: receive length for buffer
  * @op: i2c cmd
  * @muli-msg: is part of multi i2c r-w msgs
+ * @shared_se: bus is shared between subsystems
+ * @bool first_msg: use it for tracking multimessage xfer
+ * @bool last_msg: use it for tracking multimessage xfer
  */
 struct gpi_i2c_config {
 	u8 set_config;
@@ -78,6 +81,9 @@ struct gpi_i2c_config {
 	u32 rx_len;
 	enum i2c_op op;
 	bool multi_msg;
+	bool shared_se;
+	bool first_msg;
+	bool last_msg;
 };
 
 #endif /* QCOM_GPI_DMA_H */
-- 
2.25.1


