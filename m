Return-Path: <linux-i2c+bounces-13112-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4E7B94CFA
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Sep 2025 09:39:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4A9007B104B
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Sep 2025 07:37:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 311133164B7;
	Tue, 23 Sep 2025 07:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dDJQ0WfJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585BD2F85B;
	Tue, 23 Sep 2025 07:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758613109; cv=none; b=eLItb2qUZg4aMpsHwMxVt8CZJh1d3k2XETd7a4feP2nbUuQm7Om9g9ngVuDpgQWNl0jWO2ALBfPv4fyI+ubwVjjGskDzkfV3fOkZoSIeJpBZw9yGWd9/Y2581QSG8yzgwpfotIDSShb4s0av3Io5GWHEcDINV3waqJSSb67jkQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758613109; c=relaxed/simple;
	bh=Ja3B97cG9sxVWxTkb4GQib6YypxTJ4oZZnJ6CJdGC8I=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=P1Zl/Laf27//RXbcCibYPdu/+8AVgyWtcyfykMm6Rfd004d55F3nrgHH820Fn/Ql98noqznlXJx1LyUP+OgArhjBjWZuMMToyKNNR2JuiIWwGi+yDwDW+VVw7JFKk70QfpKwaHbUoj11qQnYm0DXBF9NthQbxnouekRuoTWdhVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dDJQ0WfJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58N6a35L003970;
	Tue, 23 Sep 2025 07:38:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ARRojs7K/Ahf3PtDD+Sn4Q
	I+Dr8gi7jHPV6Qe7jbNeg=; b=dDJQ0WfJJW9OMa4HlNdMTpSpP0zv6BzZyMcuZa
	oO3cbwASS3AEpKsFZN0I7zwP+ktKtOWY3IeW9JrI+Xwuxet8G3GnEHoZ6EZZsryg
	aZZBueO07CS5H5Jqf6QcZnl3p7pYXtG2o9gzmWaUoD3qTTJUk1qofGGhX6eTQdaP
	J7MzS+VAhgULd+nvecRngHy2NClGG300Kvq+LMR0GuVb2TEVVUL8ykUwqPLjim77
	PpxLsjqPRrlt31hhDH9YxSVuzEOYChg2IwS4GeTu7AAHaMlFkiJaHk33SFG+3SeG
	5AOylnq5O/2P4Nh6qSs6ZS09Jqh0dDAdMQSn83/JZ8uubJyw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49b3kk3h94-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Sep 2025 07:38:22 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 58N7cE3c007501
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Sep 2025 07:38:14 GMT
Received: from hu-jseerapu-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Tue, 23 Sep 2025 00:38:08 -0700
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
Subject: [PATCH v7 RESEND 0/2] i2c: i2c-qcom-geni: Add Block event interrupt support
Date: Tue, 23 Sep 2025 13:07:50 +0530
Message-ID: <20250923073752.1425802-1-quic_jseerapu@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: NtWhGDcvVbjlvjhD8c6dxb6mUpOFQ-zU
X-Proofpoint-ORIG-GUID: NtWhGDcvVbjlvjhD8c6dxb6mUpOFQ-zU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDA4OSBTYWx0ZWRfXwc67rxRtf3Dr
 jUXp+t7rIMDNEdFzaajt9yHU/9Ua4XQuHyb1Gfr04nj0Mv8n8xKXh/RUQN4qzkoIjp9Vd3QwF2K
 ZruUrZzWd62slCp5YX6j+iZE/efNQCvhTjh19D2UIDqMXi87BHRuFKRLPEee/4sznZDk8kJaX3C
 RTQ4Glc/BBXYodPyP65ob0N5nm94tHqUx9TjPrwX5H4T9wCc+HLWszXIqA1yt/6ltVF8voRHXm8
 FWjYye0AmCwa6X0lmS0v+nJoEY7Kp4sAZiCTKmJJEZQ8YWVOH4fBpEUTe0VnoHkLBGahXL16TRO
 Ufc8rf+HyQFdDs7MuALIG9yu2Mpnxa/KiONXhBzjQ/oBFLFESeCVWg+2aKbHYLdeeQdEArmJrHQ
 GpXpQ6dQ
X-Authority-Analysis: v=2.4 cv=BabY0qt2 c=1 sm=1 tr=0 ts=68d24e6e cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=yJojWOMRYYMA:10 a=Bp52wIM_v22GRZO56cAA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_01,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220089

The I2C driver gets an interrupt upon transfer completion.
When handling multiple messages in a single transfer, this
results in N interrupts for N messages, leading to significant
software interrupt latency.

To mitigate this latency, utilize Block Event Interrupt (BEI)
mechanism. Enabling BEI instructs the hardware to prevent interrupt
generation and BEI is disabled when an interrupt is necessary.

Large I2C transfer can be divided into chunks of messages internally.
Interrupts are not expected for the messages for which BEI bit set,
only the last message triggers an interrupt, indicating the completion of
N messages. This BEI mechanism enhances overall transfer efficiency.

BEI optimizations are currently implemented for I2C write transfers only,
as there is no use case for multiple I2C read messages in a single transfer
at this time.


v6 -> v7:
   - The design has been modified to configure BEI for interrupt
     generation either:
     After the last I2C message, if sufficient TREs are available, or
     After a specific I2C message, when no further TREs are available.
   - dma_buf and dma_addr for multi descriptor support is changed from
     static allocation to dynmic allocation.
   - In i2c_gpi_cb_result function, for multi descriptor case, instead of invoking
     complete for everry 8 messages completions, changed the logic to Invoke 'complete'
     for every I2C callback (for submitted I2C messages).
   - For I2C multi descriptor case, updated 'gi2c_gpi_xfer->dma_buf' and
     'gi2c_gpi_xfer->dma_addr' for unmappping in geni_i2c_gpi_multi_desc_unmap.
   - In the GPI driver, passed the flags argumnetr to the gpi_create_i2c_tre function and
     so avoided using external variables for DMA_PREP_INTERRUPT status.
   - Updated documentation removed for "struct geni_i2c_dev" as per the review comments.

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

 drivers/dma/qcom/gpi.c             |  11 +-
 drivers/i2c/busses/i2c-qcom-geni.c | 248 ++++++++++++++++++++++++++---
 2 files changed, 233 insertions(+), 26 deletions(-)

-- 
2.34.1


