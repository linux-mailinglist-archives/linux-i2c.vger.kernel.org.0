Return-Path: <linux-i2c+bounces-1580-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A228454F3
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Feb 2024 11:13:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CDDA2B2215B
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Feb 2024 10:13:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81DBE15B101;
	Thu,  1 Feb 2024 10:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XmORwHa9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC564D9E3;
	Thu,  1 Feb 2024 10:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706782418; cv=none; b=foSyJDtTKN+/B4qbaMQqkHAnAZYckgrd16WfTD5q3I3ZUYoOKNuCDAt6C1nQ6m9/nrBtu6xV+RHK7qJsG3nxt9m8+EBoX6Wx3VkaQOtTtZV3fonJOKIoRPPmBUlp7eJeqDWf3gqm0AlMiRJdePuSQjVl1vM0HwofDBI/RTjLBAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706782418; c=relaxed/simple;
	bh=t6r3dOD2sw+3vBsEhZO6nySPDH9t5Kcnd6SxmAS56WQ=;
	h=From:To:Cc:Subject:Date:Message-Id; b=uHdhEOcg/DZWZ3WC79bcCSTt0OrmicOQjnGduPSdGQbyKJaIZakyMc3LLnHK9Ivlan/2vQzjbgeyljYbwHDuk23U96jD2P/Qdy3zduVXtYlrt/1RtJDDsBgczES/4ZLdr+wGZVFO77+GoRfp3K8Owen/cMmBMUw8SHxW8I+fnJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XmORwHa9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4114SAeO011112;
	Thu, 1 Feb 2024 10:13:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id; s=qcppdkim1; bh=M/36BzqapNq4
	h0smSpIUMa7Hl5sStqeGMFw5QZt0zcA=; b=XmORwHa9AAFNy5WmbBX9qhsQ/4on
	13HP5g1iXvSEhL6CJkJiucZZwXazJDWqxb5O1eBEAjxT7pwECJjOvASy164gCyHi
	ZTzuvOR4YlCvNuz0cuJrIphr53zwNeKNrIMYFKeS99asXNwGJGPc8lGZqlb/sFsV
	gGk7TgHJgL7PM+hI/7I8O2oE3DNVQYh4C5gfdpG6jw2TBtTIDhmHT0CzcBQggcO7
	Y2sPulEdkKT9q0ep7Sx76qK/3CDiytZWrKJw60/57Vm9FNUU/VPfrFqlvaxm79+3
	iGhBtyLjrjWChbei7/hivRgl7n3f9/pV7eqOv11J8jzhmkw/q+l86D3Ewg==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vypaq2vd0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Feb 2024 10:13:32 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 411ADT1T005428;
	Thu, 1 Feb 2024 10:13:29 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 3vvtwm0bgb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 01 Feb 2024 10:13:29 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 411ADSs1005423;
	Thu, 1 Feb 2024 10:13:28 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-vdadhani-hyd.qualcomm.com [10.213.106.28])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 411ADSRT005422;
	Thu, 01 Feb 2024 10:13:28 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 4047106)
	id 37D8A5001CE; Thu,  1 Feb 2024 15:43:27 +0530 (+0530)
From: Viken Dadhaniya <quic_vdadhani@quicinc.com>
To: andersson@kernel.org, konrad.dybcio@linaro.org, andi.shyti@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, vkoul@kernel.org,
        quic_bjorande@quicinc.com, manivannan.sadhasivam@linaro.org,
        bryan.odonoghue@linaro.org
Cc: quic_msavaliy@quicinc.com, quic_vtanuku@quicinc.com,
        Viken Dadhaniya <quic_vdadhani@quicinc.com>
Subject: [V3] i2c: i2c-qcom-geni: Correct I2C TRE sequence
Date: Thu,  1 Feb 2024 15:43:23 +0530
Message-Id: <20240201101323.13676-1-quic_vdadhani@quicinc.com>
X-Mailer: git-send-email 2.17.1
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: iLsouOwDgyAhcRBvATVKnQtN6Gu9wWlT
X-Proofpoint-GUID: iLsouOwDgyAhcRBvATVKnQtN6Gu9wWlT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-31_10,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1011
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 suspectscore=0
 malwarescore=0 spamscore=0 mlxlogscore=999 phishscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2402010082
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

For i2c read operation in GSI mode, we are getting timeout
due to malformed TRE basically incorrect TRE sequence
in gpi(drivers/dma/qcom/gpi.c) driver.

TRE stands for Transfer Ring Element - which is basically an element with
size of 4 words. It contains all information like slave address,
clk divider, dma address value data size etc).

Mainly we have 3 TREs(Config, GO and DMA tre).
- CONFIG TRE : consists of internal register configuration which is
               required before start of the transfer.
- DMA TRE :    contains DDR/Memory address, called as DMA descriptor.
- GO TRE :     contains Transfer directions, slave ID, Delay flags, Length
               of the transfer.

Driver calls GPI driver API to config each TRE depending on the protocol.
If we see GPI driver, for RX operation we are configuring DMA tre and
for TX operation we are configuring GO tre.

For read operation tre sequence will be as below which is not aligned
to hardware programming guide.

- CONFIG tre
- DMA tre
- GO tre

As per Qualcomm's internal Hardware Programming Guide, we should configure
TREs in below sequence for any RX only transfer.

- CONFIG tre
- GO tre
- DMA tre

In summary, for RX only transfers, we are reordering DMA and GO TREs.
Tested covering i2c read/write transfer on QCM6490 RB3 board.

Fixes: d8703554f4de ("i2c: qcom-geni: Add support for GPI DMA")
Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
---
v2 -> v3:
- Update commit log to explain change in simple way.
- Correct fix tag format.

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


