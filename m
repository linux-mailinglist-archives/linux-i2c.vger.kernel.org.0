Return-Path: <linux-i2c+bounces-9139-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AD30EA16A1B
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Jan 2025 10:58:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 30BF818883AF
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Jan 2025 09:58:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E69AB1B423D;
	Mon, 20 Jan 2025 09:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YsGCXdVH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FDF21B4149;
	Mon, 20 Jan 2025 09:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737367103; cv=none; b=mvETbzVpk4ufeymLZRXYW7s2QoDvb17JP+PMSQkiEP06koo7hPKn+TOcnNEn62r+1bcEk7CZMGfcWCDuG3LjNnXQdydC8qfPRUDEZo36FJjYZWjQgINXFKtt9GwjPQd0cS27pmHutH5MZmnmNqrAgruGpJn4tFqkeo8b7j0eKxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737367103; c=relaxed/simple;
	bh=VV/VEt+VvYdE18CiVg55sT4+waQmJnL4gugX2A8/tpg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W1h0yLzFr7pqdJYXTG7dUgiwrYc9oik8DbhSUDuDSgEjJt06vlEkpIV54AEMrMpFVDF9qXvL+7ScSULmFZV6NQghL8r1rbgy4WuMa1PWjfCEtirgdPwM5DtMkRhgjGnDMBnUdtuMRngQORzK4qvmw9vQRBgMHbdBumKKib2LTmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YsGCXdVH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50K6ZZsn016293;
	Mon, 20 Jan 2025 09:58:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AN4Jch/REtwkkav3gDrLSjuz
	m6hIEI5AAWKnHLHjgR8=; b=YsGCXdVHIqG08pRqS/FBQ0yqdQM099BAx3JzpglE
	UG4aIC/BXtaWvZW9jV0eQwc7zskALn2hTWeFtyAMflGYbIU4Pi6miQJYxwcjk++J
	VEKKRbMM1chUF/CvsZCqEnPthNcUfDbxa/2LMRfrcE3pdaDjR13Y/bXbgPfF5qvW
	fKPNLVbn94sWJB8UScd5y3V8fXyo/9jbsbuqFwuOk58fFdJsOhmQ0be/9y2e6Vze
	3QMOezZNJXsBTN2svWccHemiMSM/3I066mh2fHbJO8ixU27nefWh7jXjZbltZFVG
	jrC2ftdRvBIyOIrhOaJB9XStlwiNYWL2v1S18BL4hz/AYQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 449hbw8guw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Jan 2025 09:58:15 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50K9wFnY019603
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Jan 2025 09:58:15 GMT
Received: from hu-jseerapu-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 20 Jan 2025 01:58:11 -0800
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
Subject: [PATCH v5 1/2] dmaengine: qcom: gpi: Add GPI Block event interrupt support
Date: Mon, 20 Jan 2025 15:27:52 +0530
Message-ID: <20250120095753.25539-2-quic_jseerapu@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250120095753.25539-1-quic_jseerapu@quicinc.com>
References: <20250120095753.25539-1-quic_jseerapu@quicinc.com>
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
X-Proofpoint-GUID: zGY7NgzGaZqXsjvRizlwteM4eTgjOORM
X-Proofpoint-ORIG-GUID: zGY7NgzGaZqXsjvRizlwteM4eTgjOORM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-20_02,2025-01-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 mlxscore=0 clxscore=1015 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 phishscore=0 suspectscore=0 spamscore=0
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501200083

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

v4 -> v5:
   -  BEI flag naming changed from flags to bei_flag.
   -  QCOM_GPI_BLOCK_EVENT_IRQ macro is removed from qcom-gpi-dma.h
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
index 52a7c8f2498f..d925a8156317 100644
--- a/drivers/dma/qcom/gpi.c
+++ b/drivers/dma/qcom/gpi.c
@@ -1693,6 +1693,9 @@ static int gpi_create_i2c_tre(struct gchan *chan, struct gpi_desc *desc,
 
 		tre->dword[3] = u32_encode_bits(TRE_TYPE_DMA, TRE_FLAGS_TYPE);
 		tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_IEOT);
+
+		if (i2c->bei_flag)
+			tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_BEI);
 	}
 
 	for (i = 0; i < tre_idx; i++)
diff --git a/include/linux/dma/qcom-gpi-dma.h b/include/linux/dma/qcom-gpi-dma.h
index 6680dd1a43c6..1060b7eac305 100644
--- a/include/linux/dma/qcom-gpi-dma.h
+++ b/include/linux/dma/qcom-gpi-dma.h
@@ -65,6 +65,7 @@ enum i2c_op {
  * @rx_len: receive length for buffer
  * @op: i2c cmd
  * @muli-msg: is part of multi i2c r-w msgs
+ * @bei_flag: true for block event interrupt support
  */
 struct gpi_i2c_config {
 	u8 set_config;
@@ -78,6 +79,7 @@ struct gpi_i2c_config {
 	u32 rx_len;
 	enum i2c_op op;
 	bool multi_msg;
+	bool bei_flag;
 };
 
 #endif /* QCOM_GPI_DMA_H */
-- 
2.17.1


