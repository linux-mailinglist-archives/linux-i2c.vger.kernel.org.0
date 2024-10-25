Return-Path: <linux-i2c+bounces-7589-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A095A9B0CC5
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Oct 2024 20:12:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1C12EB22451
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Oct 2024 18:12:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAC64214406;
	Fri, 25 Oct 2024 18:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="B9KhsNqg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4472200B9E;
	Fri, 25 Oct 2024 18:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729879839; cv=none; b=Iz0NUtw6Tw+eq/sOo5hSLxjA+n5QI9SIlZx9wiAmZ66q6M+UZONy+px4LZGpvzpJEWZ30TOtEECQYXywjczRrsjQV+HTZ/2q3gXePVFP6TYkGfdBlPmnXn9MXPxE5Wc2jZ/gvQae0sKiLypLBvH8aWe4Bl+w+c//2MUwhPmXr9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729879839; c=relaxed/simple;
	bh=cN6fc+l9w3fXvNQkNpCtBE6d3MCpI0KtngEwDe5xOZE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rcFfSDAdQaus7TvxkiOHDWL7ofpxrc9cmjpi0Kg5voZGfprGYFNfjeYreTg9xBU1A4GkhfjQHLkU4V0qnvlv9LRSVXgRDatVqcPHBTU7trVzcIVPuekXi9wG2uxXK84/PWOtHHGGhY3MHie07zk/7QJTP8iOjHDBUVS4DICy5pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=B9KhsNqg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49PBowBO009099;
	Fri, 25 Oct 2024 18:10:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=sxUUwmhFaPuoMwnZaOrlOdteCBTzOmWEbOZ3EA4q5B0=; b=B9
	KhsNqg5Uju0YmojfqFyDc/wO1rutaFMWu8ZkLTQ0Sd1pThirlHTySGR68e3rb1JO
	FbPCJ7HIZxBup4Od4GLwBe4IExJkqj6jI0CkwPf/Ws5MA18SI4XIwjOlk9NiGb6B
	j0Hpx5ulOkyVVpmwxxIvBUpUWDmQN3bZIqSEwrgAuJEDVjtBtcMvQYKyjJHanTgV
	96U+lxbiDkmxKWRjIgwcM2nR+sd5Wa95FG8+Wx5SSvNSxALLoIKcoc0rjNufbUZ7
	yOHwm03fhJjpHLBLyDpUkA9SwIglvUt3QIlOzlqs2PoFM0GMNaP5Aeffxb89xn+m
	X8OD9gVwJFMoTsOCBZeA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em43j1q3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 18:10:29 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49PIAStK023486
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 18:10:28 GMT
Received: from hu-jseerapu-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 25 Oct 2024 11:10:24 -0700
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
Subject: [PATCH v2 0/3] Add Block event interrupt support for I2C protocol
Date: Fri, 25 Oct 2024 23:40:07 +0530
Message-ID: <20241025181010.7555-1-quic_jseerapu@quicinc.com>
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
X-Proofpoint-GUID: G3ymxqY7NZ-QQOQ6UtigGScoJJVLo1ra
X-Proofpoint-ORIG-GUID: G3ymxqY7NZ-QQOQ6UtigGScoJJVLo1ra
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 adultscore=0 mlxlogscore=999 spamscore=0 malwarescore=0 impostorscore=0
 phishscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410250138

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
  - DT binding change reveted for ma channel size as a new arg of
    dma-cells property.
  - In GPI driver, reverted the changes to parse the channel TRE size
    from device tree.
  - Made the changes in QCOM I2C geni driver to support the BEI
    functionality with the existing TRE size of 64.
  - Made changes in QCOM I2C geni driver as per the review comments.
  - Fixed Kernel test robot reported compiltion issues
	 

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


