Return-Path: <linux-i2c+bounces-10822-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C4BAAC251
	for <lists+linux-i2c@lfdr.de>; Tue,  6 May 2025 13:19:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 63D891B68634
	for <lists+linux-i2c@lfdr.de>; Tue,  6 May 2025 11:19:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4623527A91C;
	Tue,  6 May 2025 11:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TgMSa8gh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD9427A939;
	Tue,  6 May 2025 11:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746530355; cv=none; b=Te5l53kVPVgI43kCQs8zU2vsccs5+lZ0HrPaKiPjxd7BqYMeI1UiBeMIf+bIBlbQ9td/GRbDnDmDWlMKruDFDTbD1DD63UMoiYOnXq8T/RSCL4QJ8+IiLhBg11MusaugSxRit2lD/BHZjOFIy07K0QcM81Ti55fxIuTzkEzAaRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746530355; c=relaxed/simple;
	bh=Q4ptrZzuR6AE70wnRLbBNjV7Y8kpiJ7rLfEo5P+D7tE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mbgt2fsb1nJXJYsaHIMLv4eu0debk6VuiW5bJ6cWG3tRkR8tBhJhBXGvr+m7OtOBeZAx1l1/9ks877MHAjOBgnBHMWVg8ojTgPqwD7FPBhRyrihSU4/Fqku+Fjv6a3fI3HAauM9YlUeJx275yOjwD7eZzv1doyO5cfe1h/kQ+PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TgMSa8gh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54690pSb025917;
	Tue, 6 May 2025 11:19:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=sq/XukGZUXYYVsOD5xL/hcID5GPFU2bSXyfbBAjjLZQ=; b=Tg
	MSa8gh90nq3spjC+Ckx4XFniKRuAZCzGOrN/nms9OvsrmQ3GlcG5OqUbhv0I4bsw
	bCvDnaABoTnHsKgBtAW9BwQQmjIxKzyHgse+sCebdMZ84aMiR+OpwShH+WvUsDdw
	iowhf67S22/7C5zpTU1zC+bRXR0vJtlCPvw+zRssx2ifKq2LoJjEv1mhUtEvnM0u
	PrhsJZ5NxoNk0QPgXkzEvcQViUPPfxqz1Wiuh/TKO1a/byK1txPXRE2Y17WPKpYV
	JlAznmF1SmnK9PzLKiTnnRd6lwPvBisAN1L5V/7EGQMkI3aAKaRg3yI2OJlYmT0k
	9RDVH5shT15WPkfP/ABg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46f5sv22cs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 May 2025 11:19:05 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 546BJ4TZ020004
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 6 May 2025 11:19:04 GMT
Received: from hu-jseerapu-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 6 May 2025 04:19:00 -0700
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
Subject: [PATCH v6 0/2] Add Block event interrupt support for I2C protocol
Date: Tue, 6 May 2025 16:48:42 +0530
Message-ID: <20250506111844.1726-1-quic_jseerapu@quicinc.com>
X-Mailer: git-send-email 2.17.1
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
X-Proofpoint-GUID: Qavxbg1SzTLizwsNslDnoj8DnphgRz2O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDEwOCBTYWx0ZWRfX6h0ajjpsTg3W
 KaSMEsGpYYIzjVxLfx5meXqX/NLhwV4fqUHaC+X7Z739wf9FNlTlIBY0gqB/Llu62/BefPv5hTK
 B1SYJDyxHLZEjZZN4IfIWDxHNJkRk/VaSDLAyiHvwLZebKWqfAKoeFecppUgDhbZ1Ly/N3qQACW
 nnWx3Q+gKEzjAX5KshNuG5N9+jliNE0FetYtRqOgEMvZhpcpp8ZMwVek+f3N8wlPweKeYcqvYnL
 jFk0YmOdSd9qNYElqj5SsVawuxGNpHvVfnCWrK+of9UcQVX06qxQMZmIrW+K9/OEIMHBQKPP7De
 VfCqDuTjRQtnFTI6s88xapyAC33RXEnFkRK9w/Hz1lkblyovaj025oHMsfuBNBdEOKZvCbmhG45
 E767CYDU8M/4bUUrt1WvPc6FVQEpqwxX9fFcSk33n2/ZkDy3wawJP2K3uu9kbo2H9vHC0ni/
X-Authority-Analysis: v=2.4 cv=cOXgskeN c=1 sm=1 tr=0 ts=6819f029 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=dt9VzEwgFbYA:10 a=Bp52wIM_v22GRZO56cAA:9
X-Proofpoint-ORIG-GUID: Qavxbg1SzTLizwsNslDnoj8DnphgRz2O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_05,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1011 suspectscore=0 priorityscore=1501 bulkscore=0
 mlxlogscore=999 adultscore=0 impostorscore=0 malwarescore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505060108

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

v5 -> v6:
   - Instead of using bei_flag, moved the logic to use with DMA
     supported flags like DMA_PREP_INTERRUPT.
   - Additional parameter comments removed from geni_i2c_gpi_multi_desc_unmap
     function documentation.

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
 drivers/i2c/busses/i2c-qcom-geni.c | 307 ++++++++++++++++++++++++++---
 include/linux/dma/qcom-gpi-dma.h   |   2 +
 3 files changed, 285 insertions(+), 27 deletions(-)

-- 
base-commit: 55bcd2e0d04c1171d382badef1def1fd04ef66c5
2.17.1


