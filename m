Return-Path: <linux-i2c+bounces-1505-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 496BC83FDFE
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Jan 2024 07:10:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C7B31C2334A
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Jan 2024 06:10:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAC6345BF0;
	Mon, 29 Jan 2024 06:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XyFrEVFf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0E3446C4;
	Mon, 29 Jan 2024 06:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706508618; cv=none; b=UKZZUe5Wy8Ns1Mr4jbyfFXN26itX7txd1ydtNtDLEnZczk6VUv6nkXicRfHs3hXMiWYGx8fgLnq6bh8sOoE+KSu8lE/kkgrERiVq0+asOpPdpLWUAp0NvJLc8fDIima6ZXxgkqljbvOe71OquIWO/4cBsgBmfG30qS6rIvPTGpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706508618; c=relaxed/simple;
	bh=jcqJD0v4CV6bRhYa0gKiHSfLGMsUg7xc0NXAopIXwew=;
	h=From:To:Cc:Subject:Date:Message-Id; b=u7L3kNxRgxCgt7mOzCuclCTa49JFK+mOt1ZSsIFDL+TEvYCqBc3R8l28ypgb9jIJcPeeO4YtcpC1SDGAIoyaI1gRvtVuFaMXbLpSXpnhub3Aw3XGgCRadKIT4DfM3bK2CiI5BvgwuAzjezN15M/l8aPi4+g+rNULyeK5BaDDy9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XyFrEVFf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40T3lNHf018658;
	Mon, 29 Jan 2024 06:10:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id; s=qcppdkim1; bh=fZX0r032TCAf
	fHZLe8mY0s06DUIcXsbsa7Eh7JqVMLk=; b=XyFrEVFf6zM6RpVkrwVEw2LmzZOb
	QmEgfZgeOKEg1Zb11linpleHvfQ1VRZMmEBOu5IV2Zo83aJ+pmnQYwKsj/2JseQO
	jjjjXIwR83o/QdocXytl1hycs29rp4Uq2JwXqLW1mYxy/w8/wUvATq6yEzcFFLDw
	Bb2fpU7cHrb0uI6VbysADkeC6qg406iDlxO7NIbG+fRuCpyPamCUQV5N2yDP1m/V
	m+qH6bfd8V6IwUXtOI16rOutKYePZxBAVlgJDK5J2J2+6oqLE3Nyg9hlUoUluUHa
	Th2Qy5WvyHc3tIuKIweKfvy1Dl8LSVHfRR+bVKMrdMT5gxhYZRnJnSNOOw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vx23k8d9p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jan 2024 06:10:12 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 40T6A9wY020666;
	Mon, 29 Jan 2024 06:10:09 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 3vvtwknh0x-1;
	Mon, 29 Jan 2024 06:10:09 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 40T6A9J0020660;
	Mon, 29 Jan 2024 06:10:09 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-vdadhani-hyd.qualcomm.com [10.213.106.28])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 40T6A7ak020632;
	Mon, 29 Jan 2024 06:10:09 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 4047106)
	id 0B9615001C1; Mon, 29 Jan 2024 11:40:06 +0530 (+0530)
From: Viken Dadhaniya <quic_vdadhani@quicinc.com>
To: andersson@kernel.org, konrad.dybcio@linaro.org, andi.shyti@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, vkoul@kernel.org,
        quic_bjorande@quicinc.com, manivannan.sadhasivam@linaro.org
Cc: quic_msavaliy@quicinc.com, quic_vtanuku@quicinc.com,
        Viken Dadhaniya <quic_vdadhani@quicinc.com>
Subject: [V2] i2c: i2c-qcom-geni: Correct I2C TRE sequence
Date: Mon, 29 Jan 2024 11:40:03 +0530
Message-Id: <20240129061003.4085-1-quic_vdadhani@quicinc.com>
X-Mailer: git-send-email 2.17.1
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 2wrUhd0eEdoqHX1vfwnWRRKhWPgRdGNk
X-Proofpoint-GUID: 2wrUhd0eEdoqHX1vfwnWRRKhWPgRdGNk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-29_02,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0 mlxlogscore=999
 mlxscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401290042
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

For i2c read operation, we are getting gsi mode timeout due
to malformed TRE(Transfer Ring Element). Currently we are
configuring incorrect TRE sequence in gpi driver
(drivers/dma/qcom/gpi.c) as below

- Sets up CONFIG
- Sets up DMA tre
- Sets up GO tre

As per HPG(Hardware programming guide), We should configure TREs in below
sequence for any i2c transfer

- Sets up CONFIG tre
- Sets up GO tre
- Sets up DMA tre

For only write operation or write followed by read operation,
existing software sequence is correct.

for only read operation, TRE sequence need to be corrected.
Hence, we have changed the sequence to submit GO tre before DMA tre.

Tested covering i2c read/write transfer on QCM6490 RB3 board.

Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
Fixes: commit d8703554f4de ("i2c: qcom-geni: Add support for GPI DMA")
---
v1 -> v2:
- Remove redundant check.
- update commit log.
- add fix tag.
---
---
 drivers/i2c/busses/i2c-qcom-geni.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 0d2e7171e3a6..da94df466e83 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -613,20 +613,20 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
 
 		peripheral.addr = msgs[i].addr;
 
+		ret =  geni_i2c_gpi(gi2c, &msgs[i], &config,
+				    &tx_addr, &tx_buf, I2C_WRITE, gi2c->tx_c);
+		if (ret)
+			goto err;
+
 		if (msgs[i].flags & I2C_M_RD) {
 			ret =  geni_i2c_gpi(gi2c, &msgs[i], &config,
 					    &rx_addr, &rx_buf, I2C_READ, gi2c->rx_c);
 			if (ret)
 				goto err;
-		}
-
-		ret =  geni_i2c_gpi(gi2c, &msgs[i], &config,
-				    &tx_addr, &tx_buf, I2C_WRITE, gi2c->tx_c);
-		if (ret)
-			goto err;
 
-		if (msgs[i].flags & I2C_M_RD)
 			dma_async_issue_pending(gi2c->rx_c);
+		}
+
 		dma_async_issue_pending(gi2c->tx_c);
 
 		timeout = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation


