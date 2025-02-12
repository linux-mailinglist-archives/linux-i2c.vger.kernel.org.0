Return-Path: <linux-i2c+bounces-9380-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0CEA3259A
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Feb 2025 13:06:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 43BC43A8E5E
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Feb 2025 12:06:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BD5020B7F7;
	Wed, 12 Feb 2025 12:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="e4YIH+px"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42BA82B9BC;
	Wed, 12 Feb 2025 12:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739361971; cv=none; b=MDtXFJEumVWqnVWBwmSpxMvvojlY2Q0Zyqxhr+/PETpekdDmmeVRlM109HC2j4muS71ZkcDowVUupUx+0lPqvmmTVtTaRpnmU/X0IpatP5Z6695UiqxfXGynkc4N9QagtCn6YNIE4KnbPrSMgEKOw9Ivr5gLKsKIrs/NHwVB2+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739361971; c=relaxed/simple;
	bh=5GPpJhmUBIfhYoB8yxu0DhjKWbmPWT7lDCwNC2s9RGc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XBkL9L+fYS/DeFhEI2JXyL0Hxns9Ppc+cnQ/AGDzl0lGESGD9oSW59bxYdH/sodpIKtDb7Eyz1cYOjNTQmUo7Ih1iUzyIBmZ2HXY/QapdToyvefhXYhkOnrU4ty/nAcH+jZwHSqmY6QmbemSRM28QgtQN3jHr85ezV2jIwCj9Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=e4YIH+px; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51C9YsYL011426;
	Wed, 12 Feb 2025 12:06:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=nLz/GzCMRPuM71qBBVKXfuXubdgaybSk3JA4GxjpB9Q=; b=e4
	YIH+pxIfUm1pcGGG0xAIgI4nozodDiieMrO0R6OIKqqFBDcegnr7wp1nLksxXevy
	y/iAP7kYKzCivz3iv/ovgXnfBAYyG+FEEwUTHSgq9nBgU5sXKvzqA6CvHD9X0VPf
	d1QkRPWOEBpnw16mbsa1jMu1OyNMBU/zsle3nzn1qF5F9iVyFXlGMuyYnVNLwo5E
	e8T2SnMrtTb66s0aazI+kj20sTswNzJoN6q2xREjGLkgDtRxb+T5/+ckpmScOytA
	4bfUgbyl+tYr+Mzh0eWL4ha8XEgVxNetZJKUPkv2wlr9Zrp3tHf+H0MZxQSYMJOy
	Rdu49Pm38hrVI+IUmKGQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qxv3vts4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Feb 2025 12:06:01 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51CC60L6023599
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Feb 2025 12:06:00 GMT
Received: from hu-jseerapu-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 12 Feb 2025 04:05:56 -0800
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
Subject: [PATCH v5 RESEND 0/2] Add Block event interrupt support for I2C protocol
Date: Wed, 12 Feb 2025 17:35:34 +0530
Message-ID: <20250212120536.28879-1-quic_jseerapu@quicinc.com>
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
X-Proofpoint-GUID: XdFDB-ygidLDF8roYCoLfDjdx37Owqnb
X-Proofpoint-ORIG-GUID: XdFDB-ygidLDF8roYCoLfDjdx37Owqnb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-12_04,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 phishscore=0 adultscore=0 spamscore=0 mlxscore=0
 bulkscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502120093

The I2C driver gets an interrupt upon transfer completion.
When handling multiple messages in a single transfer, this
results in N interrupts for N messages, leading to significant
software interrupt latency.

To mitigate this latency, utilize Block Event Interrupt (BEI)
mechanism. Enabling BEI instructs the hardware to prevent interrupt
generation and BEI is disabled when an interrupt is necessary.

Large I2C transfer can be divided into chunks of 8 messages internally.
Interrupts are not expected for the first 7 message completions, only
the last message triggers an interrupt, indicating the completion of
8 messages. This BEI mechanism enhances overall transfer efficiency.

This optimization reduces transfer time from 168 ms to 48 ms for a
series of 200 I2C write messages in a single transfer, with a
clock frequency support of 100 kHz.

BEI optimizations are currently implemented for I2C write transfers only,
as there is no use case for multiple I2C read messages in a single transfer
at this time.

v4 -> v5:
   -  BEI flag naming changed from flags to bei_flag.  
   -  QCOM_GPI_BLOCK_EVENT_IRQ macro is removed from qcom-gpi-dma.h
      file, and Block event support is checked with bei_flag.
   -  Documentation added for "struct geni_i2c_dev".

v3 -> v4:
  - API's added for Block event interrupt with multi descriptor support is
    moved from qcom-gpi-dma.h file to I2C geni qcom driver file.
  - gpi_multi_xfer_timeout_handler function is moved from GPI driver to
    I2C driver.
  - geni_i2c_gpi_multi_desc_xfer structure is added as a member of
    struct geni_i2c_dev.
  - Removed the changes of making I2C driver is dependent on GPI driver.

v2 -> v3:
  - Updated commit description
  - In I2C GENI driver, for i2c_gpi_cb_result moved the logic of
    "!is_tx_multi_xfer" to else part.
  - MIN_NUM_OF_MSGS_MULTI_DESC changed from 4 to 2
  - Changes of I2C GENI driver to depend on the GPI driver moved
    to patch3.
  - Renamed gpi_multi_desc_process to gpi_multi_xfer_timeout_handler
  - Added description for newly added changes in "qcom-gpi-dma.h" file.

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


Jyothi Kumar Seerapu (2):
  dmaengine: qcom: gpi: Add GPI Block event interrupt support
  i2c: i2c-qcom-geni: Add Block event interrupt support

 drivers/dma/qcom/gpi.c             |   3 +
 drivers/i2c/busses/i2c-qcom-geni.c | 304 ++++++++++++++++++++++++++---
 include/linux/dma/qcom-gpi-dma.h   |   2 +
 3 files changed, 284 insertions(+), 25 deletions(-)

-- 
base-commit: 55bcd2e0d04c1171d382badef1def1fd04ef66c5
2.17.1


