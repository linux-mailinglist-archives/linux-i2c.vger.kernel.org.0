Return-Path: <linux-i2c+bounces-10823-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 91BBFAAC257
	for <lists+linux-i2c@lfdr.de>; Tue,  6 May 2025 13:19:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D9133B72ED
	for <lists+linux-i2c@lfdr.de>; Tue,  6 May 2025 11:19:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 192BA27AC56;
	Tue,  6 May 2025 11:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mqs5R1CM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F2D27AC59;
	Tue,  6 May 2025 11:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746530359; cv=none; b=nW/igTCFMUWFBtWYeZCHy9qHWbAzfx+1eJ8jz+W/uxgYuS9j/mt1WXSby1f7ckvKP+UI1cuDRp4pkA6NdZ2poa3ZcQY4VQutH5iINsrWlN0/KfTsygczMmGqLszZh20Fnic7nlPGtA3QVEMVFh6kWmfOFfoM3d9ynpf5r/T5eWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746530359; c=relaxed/simple;
	bh=x6TiEqVvF6dcpdg7HoUHt+Ef8RwWNgehZD0MngwB99c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SCRup1mqi6zul23TVvx7147ebMYFqqpkWoPdyDgn8DZahEXcAxiVcgPHdLzDz2JbyW5Klbtq7yxettstV0C01PqflDibExZEftZtU/ZmBw8KU3OKVuzkULaNbxvmhFsAEKzsVVIGLrmWg04+n1iTmnLJd5rOV/NXRjWgZQBYNXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mqs5R1CM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 546A1Wiw017859;
	Tue, 6 May 2025 11:19:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hNzrM86H8/Sl+GfeIpuqD7rH
	r1aeC0XaSYBc3yrTtjA=; b=mqs5R1CMeUmcD7na0X39GgDLvq0m/WKagLx4PuqG
	bCEnDOxYDq8mHIczfHHtYpBCLTgOsI8HiqH67CW+w+JDTjRkcGR6HNiRWpFR+SmS
	3obeme90QX4smMJlxSqGmkkKwe8TXBRur1LfaIbZOqUDNOCjumA2wwzfT+o6nAvR
	BOoJW6rtIqQfwr3S4seIGlw2AeFOS6mlOILWuTGOsejDxsiKWNdKbPFNsMJeRgK+
	iTC7gmEVxwfI2Kmgz/MI6BrtC5sRJdgi/VQUFJjfxXNHg1yU129jjDH7QRj8Vvfy
	kZtnkcp8LZHX+rRwellXO9/dlKhOS3ALP4C87krMMwTZTQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46f8gv1phm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 May 2025 11:19:09 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 546BJ8TE005162
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 6 May 2025 11:19:08 GMT
Received: from hu-jseerapu-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 6 May 2025 04:19:04 -0700
From: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
To: Vinod Koul <vkoul@kernel.org>,
        Mukesh Kumar Savaliya
	<quic_msavaliy@quicinc.com>,
        Viken Dadhaniya <quic_vdadhani@quicinc.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
CC: <linux-arm-msm@vger.kernel.org>, <dmaengine@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <linaro-mm-sig@lists.linaro.org>, <quic_vtanuku@quicinc.com>
Subject: [PATCH v6 1/2] dmaengine: qcom: gpi: Add GPI Block event interrupt support
Date: Tue, 6 May 2025 16:48:43 +0530
Message-ID: <20250506111844.1726-2-quic_jseerapu@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250506111844.1726-1-quic_jseerapu@quicinc.com>
References: <20250506111844.1726-1-quic_jseerapu@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=dYmA3WXe c=1 sm=1 tr=0 ts=6819f02d cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=NISQXaMT3V-eHe_uHBIA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: LsbNNL4t4SJ4u437EngkHGJo5ABxZVS4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDEwOCBTYWx0ZWRfXxduG0wT/Tiqj
 BYUaMbD1Ma7y2dQax0FLdxmi0XmunAl820iuBI7xTHCowqdS8zVjTIUCwwamGWJiMsExq60A3x3
 U4tM4oR8kZ5PKoso3RVrg0oxH2ceBA+1Uzw8MEOY4d5hocyOXaXO2rK7Poy9ddH7PEOcnfW3Aiq
 Y8jR8zNpF81pVSv9eusYKVvH5YeXuRkE6+Dp2PQteDhqKTywa3SUdD+Vq27GCerjBkWi7vO2a3N
 QcxrTdSFab9I8J4sVq5r0SOJ7PkaEhjCL7NvaR0qDpWLrSu8t2OG+lh+mfT3a4sHHmic+xw+H80
 JCCqafi8jI9x+lFSq0Wmuvor7C/x8Chka2PHGsikTfp15xtK5Y42meIic8uvuKAp0OdA//T0HAG
 atKYhfX1A+TUNXuhsygHPRJ+G4NgHek0b6BjC/rC/8Nw3Z/k/Jnsdiwf01Yt1uNNx9w/HdGF
X-Proofpoint-GUID: LsbNNL4t4SJ4u437EngkHGJo5ABxZVS4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_05,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 clxscore=1011 adultscore=0
 mlxlogscore=999 impostorscore=0 malwarescore=0 mlxscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505060108

GSI hardware generates an interrupt for each transfer completion.
For multiple messages within a single transfer, this results in
N interrupts for N messages, leading to significant software
interrupt latency.

To mitigate this latency, utilize Block Event Interrupt (BEI) mechanism.
Enabling BEI instructs the GSI hardware to prevent interrupt generation
and BEI is disabled when an interrupt is necessary.

When using BEI, consider splitting a single multi-message transfer into
chunks of 8 messages internally and so interrupts are not expected for
the first 7 message completions, only the last message triggers
an interrupt, indicating the completion of 8 messages.

This BEI mechanism enhances overall transfer efficiency.

Signed-off-by: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
---
v5 ->v6:
  - For updating the block event interrupt bit, instead of relying on
    bei_flag, decision check is moved with DMA_PREP_INTERRUPT flag.
 
v4 -> v5:
  - BEI flag naming changed from flags to bei_flag.
  - QCOM_GPI_BLOCK_EVENT_IRQ macro is removed from qcom-gpi-dma.h
    file, and Block event interrupt support is checked with bei_flag.

v3 -> v4:
  - API's added for Block event interrupt with multi descriptor support for
    I2C is moved from qcom-gpi-dma.h file to I2C geni qcom driver file.
  - gpi_multi_xfer_timeout_handler function is moved from GPI driver to
    I2C driver.

v2-> v3:
   - Renamed gpi_multi_desc_process to gpi_multi_xfer_timeout_handler
   - MIN_NUM_OF_MSGS_MULTI_DESC changed from 4 to 2
   - Added documentation for newly added changes in "qcom-gpi-dma.h" file
   - Updated commit description.

v1 -> v2:
   - Changed dma_addr type from array of pointers to array.
   - To support BEI functionality with the TRE size of 64 defined in GPI driver,
     updated QCOM_GPI_MAX_NUM_MSGS to 16 and NUM_MSGS_PER_IRQ to 4.

 drivers/dma/qcom/gpi.c           | 3 +++
 include/linux/dma/qcom-gpi-dma.h | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
index b1f0001cc99c..7e511f54166a 100644
--- a/drivers/dma/qcom/gpi.c
+++ b/drivers/dma/qcom/gpi.c
@@ -1695,6 +1695,9 @@ static int gpi_create_i2c_tre(struct gchan *chan, struct gpi_desc *desc,
 
 		tre->dword[3] = u32_encode_bits(TRE_TYPE_DMA, TRE_FLAGS_TYPE);
 		tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_IEOT);
+
+		if (!(i2c->dma_flags & DMA_PREP_INTERRUPT))
+			tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_BEI);
 	}
 
 	for (i = 0; i < tre_idx; i++)
diff --git a/include/linux/dma/qcom-gpi-dma.h b/include/linux/dma/qcom-gpi-dma.h
index 6680dd1a43c6..ebac0d3edff2 100644
--- a/include/linux/dma/qcom-gpi-dma.h
+++ b/include/linux/dma/qcom-gpi-dma.h
@@ -65,6 +65,7 @@ enum i2c_op {
  * @rx_len: receive length for buffer
  * @op: i2c cmd
  * @muli-msg: is part of multi i2c r-w msgs
+ * @dma_flags: Flags indicating DMA capabilities
  */
 struct gpi_i2c_config {
 	u8 set_config;
@@ -78,6 +79,7 @@ struct gpi_i2c_config {
 	u32 rx_len;
 	enum i2c_op op;
 	bool multi_msg;
+	unsigned int dma_flags;
 };
 
 #endif /* QCOM_GPI_DMA_H */
-- 
2.17.1


