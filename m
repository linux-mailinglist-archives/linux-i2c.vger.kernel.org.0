Return-Path: <linux-i2c+bounces-7389-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F344F99E8A9
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Oct 2024 14:08:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A4611F234DF
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Oct 2024 12:08:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C96F81EBA10;
	Tue, 15 Oct 2024 12:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="baSMsM2m"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062D01D4154;
	Tue, 15 Oct 2024 12:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728994101; cv=none; b=GbnHmG+XVbMhB+j801+qGdbKNsCPZ6DKOAH3LSvt+Y+CzETZZWs2+cqwyIQ8MfzOmwmkGqBPRU7Cs5Qhnb3KwiGsvDMmgL8KmeecpAplr1RHVXdp1BcnVwPyt+1AYq627fVreCdl7Dn6NgEuv8mQAcOJvo2xBOCCz2CXaXifY9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728994101; c=relaxed/simple;
	bh=m5786o8hDirP/0X352phnGyaNCXxjkqXYh0KZhUayf4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hkKF3bjIdIpUA6nWYIfQ5AHAe6S43lCY2c7JAC6KkufxyyfrD88gf0FSi82La58XkRVIwPJ/fZsDEnZ5fuD0EX9T9dtDXyLLltTL+ckmqIeYDMwtduotbtn/kCs9PnSmFNhv65pgDkmJ7A8ZCzXZu3FrcHTJiE3eXDMpvhJlN2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=baSMsM2m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49F1fBeq028132;
	Tue, 15 Oct 2024 12:08:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=cOb2D1xZISSQDWqXPYO06kPKB8aeAQW4UEJymP8ZKWw=; b=ba
	SMsM2mBlE2+tsZkyLadIT1tkucf4FDqQA9dmzdH3qZ1inQ8nMvwpqM1Dx8NnrX2Z
	kS4HnU5aQJpp9fLE1e9GiLrnFOuCUYZs0UotbQO/kXnKxVORAxHrPMfk9wlyMz/W
	4YUcdpfd/dVxD2e++IoTb/bQNXP+rX/BbrXHN8pmPxMcoJzPQ5R+UUwE3CTXDJ4K
	ex9z9PF1ySxreW9l3/en2iosQl775q9JLD9nxrcBV9WR9CDF9LMvWuSoM1cUGfg2
	Ep3jvsagujg/a7hJzpUQltDqj+CR5lyYlitR6aamaUNVtw1bsxuOZ3vcsRWi7th/
	52qJF/X/jsxAtPR3Q+3A==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 429exw1ce0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Oct 2024 12:08:11 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49FC8ABS025421
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Oct 2024 12:08:10 GMT
Received: from hu-jseerapu-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 15 Oct 2024 05:08:05 -0700
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
Subject: [PATCH v1 0/5] Add Block event interrupt support for I2C protocol
Date: Tue, 15 Oct 2024 17:37:45 +0530
Message-ID: <20241015120750.21217-1-quic_jseerapu@quicinc.com>
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
X-Proofpoint-ORIG-GUID: kn6zcNgNnPYCCNO7GWlDuduX0UPko3Lj
X-Proofpoint-GUID: kn6zcNgNnPYCCNO7GWlDuduX0UPko3Lj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 bulkscore=0 malwarescore=0 spamscore=0 impostorscore=0 mlxscore=0
 clxscore=1011 adultscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410150083

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

Jyothi Kumar Seerapu (5):
  dt-bindings: dmaengine: qcom: gpi: Add additional arg to dma-cell
    property
  arm64: dts: qcom: Add support for configuring channel TRE size
  dmaengine: qcom: gpi: Add provision to support TRE size as the fourth
    argument of dma-cells property
  dmaengine: qcom: gpi: Add GPI Block event interrupt support
  i2c: i2c-qcom-geni: Add Block event interrupt support

 .../devicetree/bindings/dma/qcom,gpi.yaml     |   6 +-
 arch/arm64/boot/dts/qcom/sc7280.dtsi          | 132 +++++------
 drivers/dma/qcom/gpi.c                        |  74 ++++++-
 drivers/i2c/busses/i2c-qcom-geni.c            | 205 ++++++++++++++++--
 include/linux/dma/qcom-gpi-dma.h              |  37 ++++
 5 files changed, 355 insertions(+), 99 deletions(-)


base-commit: 55bcd2e0d04c1171d382badef1def1fd04ef66c5
-- 
2.17.1


