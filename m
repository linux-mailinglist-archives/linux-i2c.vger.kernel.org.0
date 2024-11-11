Return-Path: <linux-i2c+bounces-7923-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C85D49C4030
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Nov 2024 15:03:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8E0052837D4
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Nov 2024 14:03:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 359D919E997;
	Mon, 11 Nov 2024 14:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YP3bMhwd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E7419CC21;
	Mon, 11 Nov 2024 14:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731333803; cv=none; b=MeJvzLi6hFqZ61AoG1Gz864ZzGhe2v62h07JRDVqpU4nhkBtkQtTMzUucgNo6VPGMZRNoZtYCWSQf7par0P0P44Y0J+Baqp1mHLYrqagrwNWTiODUcVlUz9DqZw16IETKAtkAhGVLQv1sCs1eranGdeOntze0dNhyB2w8oc6uk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731333803; c=relaxed/simple;
	bh=rejxNvUFkpmhXfx0zBux3+ufVK+b01fKS1/HffKbOHg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tqQznCMwnPBu7aTVDfQxzy5dax8Q1gKdfL1HdWAUiUIR2/cJ4pczwAalcfR6aDN+pHe3Zk9g6DFxHDYg4KjARvQWIUBwIjxEPT5ljk9JS527gYLIgcgrKFRHC1GwPyCIlhXJlcAuq+9PilOOBUPDImSEPV0CLzN/2ElpObrfpds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YP3bMhwd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AB5rCJ6022324;
	Mon, 11 Nov 2024 14:03:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=sjhplPPQK7ppcjkE3V7ps2shkeWB28iWauTvCNdrxcQ=; b=YP
	3bMhwdWwPBROnymvNv2srM4RisApkNgpFqNAWLKSXjQzuxVD1S8KKYJvlXDeO1FS
	sFN58Q2LktgfyFOCUVOL53FFn22ed0pM8iU2S8etBvsTSbUHUvU/0YO0tFtQLt4j
	fTit5UKXdxVVeZAjWXQyH0g3U94lvsLS1IwT5g+CHXRvPR+HXlsu1/Am5i7Bljpp
	tvN3ZY9Dgi3nqv9JKf4UERFf4XfS0fqW1eQddZd+DAEZa8OrolOLwVzGPPUrHgoA
	fc1yAhYy5mWwjeODuzjzuqaR8MaJwckOwVE9uCEZyJx/jBMeXCBZ2fT5LH+Kyxcf
	/HQPRGjN7FzQCJGLGemA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42uc6091ch-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Nov 2024 14:03:11 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ABE3A4m017894
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Nov 2024 14:03:10 GMT
Received: from hu-jseerapu-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 11 Nov 2024 06:03:06 -0800
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
Subject: [PATCH v2 RESEND 0/3] Add Block event interrupt support for I2C protocol
Date: Mon, 11 Nov 2024 19:32:41 +0530
Message-ID: <20241111140244.13474-1-quic_jseerapu@quicinc.com>
X-Mailer: git-send-email 2.17.1
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
X-Proofpoint-GUID: oacjeXcKxvG2unwH4KqKeDrgAOyFJaS1
X-Proofpoint-ORIG-GUID: oacjeXcKxvG2unwH4KqKeDrgAOyFJaS1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 phishscore=0 suspectscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411110116

The I2C driver gets an interrupt upon transfer completion.
For multiple messages in a single transfer, N interrupts will be
received for N messages, leading to significant software interrupt
latency. To mitigate this latency, utilize Block Event Interrupt (BEI)
only when an interrupt is necessary. This means large transfers can be
split into multiple chunks of 8 messages internally, without expecting
interrupts for the first 7 messages completion, only the last one will
trigger an interrupt indicating 8 messages completed.

By implementing BEI, multi-message transfers can be divided into
chunks of 8 messages, improving overall transfer time.
This optimization reduces transfer time from 168 ms to 48 ms for a
series of 200 I2C write messages in a single transfer, with a
clock frequency support of 100 kHz.

BEI optimizations are currently implemented for I2C write transfers only,
as there is no use case for multiple I2C read messages in a single transfer
at this time.

v1 -> v2:
  - DT changes are reverted for adding dma channel size as a new arg of
    dma-cells property.
  - DT binding change reveted for dma channel size as a new arg of
    dma-cells property.
  - In GPI driver, reverted the changes to parse the channel TRE size
    from device tree.
  - Made the changes in QCOM I2C geni driver to support the BEI
    functionality with the existing TRE size of 64.
  - Made changes in QCOM I2C geni driver as per the review comments.
  - Fixed Kernel test robot reported compiltion issues.
	 

Jyothi Kumar Seerapu (3):
  dmaengine: qcom: gpi: Add GPI Block event interrupt support
  i2c: qcom_geni: Update compile dependenices for qcom geni
  i2c: i2c-qcom-geni: Add Block event interrupt support

 drivers/dma/qcom/gpi.c             |  49 +++++++
 drivers/i2c/busses/Kconfig         |   1 +
 drivers/i2c/busses/i2c-qcom-geni.c | 203 +++++++++++++++++++++++++----
 include/linux/dma/qcom-gpi-dma.h   |  37 ++++++
 4 files changed, 265 insertions(+), 25 deletions(-)


base-commit: 55bcd2e0d04c1171d382badef1def1fd04ef66c5
-- 
2.17.1


