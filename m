Return-Path: <linux-i2c+bounces-1272-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B521682C12A
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Jan 2024 14:54:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6591A284ED9
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Jan 2024 13:54:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F7266D1BA;
	Fri, 12 Jan 2024 13:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="AievCUHb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72B86D1B4;
	Fri, 12 Jan 2024 13:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40CDIW99009300;
	Fri, 12 Jan 2024 13:53:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id; s=qcppdkim1; bh=DhVXr6gyIbMg
	zR2b0surHFdqtEQz2xq2bAyxCY1BWNg=; b=AievCUHbdq/ugHWm/OsV+lLygUYw
	K4NGsL8+BJKPUcnaL5SLCddxxnLGtTrMlu/YrkUMYAEX3mKJ6rMsXWz8ZVlcvz1+
	RBDQwQjJHe8is7YTZnhNKGI+S7wOmHMyknU/EpYpZl2mcKI10rrNyU4Hf7WBbhch
	1wmMuY95zzYuRv9R9lzZzgcpCo3LlP9Cj/oIwKLQQr780eBCGW5MvAsCX4JRWrEA
	J7LObRPepcjDFQVOLNC57IDNKcy+qdEboAgBom+AEedwPK8shDK9XUCrT+FAobpM
	obsUYXxRqVwwkVmwKo53WKfamBm698dM9jDzQXwJXgJM4wUIjpdJfpA1MA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vjrqj1ysn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Jan 2024 13:53:46 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 40CDrhs3005326;
	Fri, 12 Jan 2024 13:53:43 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 3veyxm4mxw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 12 Jan 2024 13:53:43 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 40CDrgeK005319;
	Fri, 12 Jan 2024 13:53:42 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-vdadhani-hyd.qualcomm.com [10.213.106.28])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 40CDrg91005316;
	Fri, 12 Jan 2024 13:53:42 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 4047106)
	id 29C915013A9; Fri, 12 Jan 2024 19:23:41 +0530 (+0530)
From: Viken Dadhaniya <quic_vdadhani@quicinc.com>
To: andersson@kernel.org, konrad.dybcio@linaro.org, andi.shyti@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, vkoul@kernel.org
Cc: quic_msavaliy@quicinc.com, quic_vtanuku@quicinc.com,
        Viken Dadhaniya <quic_vdadhani@quicinc.com>
Subject: [PATCH 1/1] i2c: i2c-qcom-geni: Correct I2C TRE sequence
Date: Fri, 12 Jan 2024 19:23:32 +0530
Message-Id: <20240112135332.24957-1-quic_vdadhani@quicinc.com>
X-Mailer: git-send-email 2.17.1
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: OoHBo6GdfJgBuPdX_brWoMYa6rkH5ixG
X-Proofpoint-GUID: OoHBo6GdfJgBuPdX_brWoMYa6rkH5ixG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 malwarescore=0 mlxlogscore=720 mlxscore=0 clxscore=1011 adultscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401120109
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

For i2c read operation, we are getting gsi mode timeout due
to malformed TRE(Transfer Ring Element). currently for read opreration,
we are configuring incorrect TRE sequence(config->dma->go).

So correct TRE sequence(config->go->dma) to resolve timeout
issue for read operation.

Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 0d2e7171e3a6..5904fc8bba71 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -613,6 +613,11 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
 
 		peripheral.addr = msgs[i].addr;
 
+		ret =  geni_i2c_gpi(gi2c, &msgs[i], &config,
+				    &tx_addr, &tx_buf, I2C_WRITE, gi2c->tx_c);
+		if (ret)
+			goto err;
+
 		if (msgs[i].flags & I2C_M_RD) {
 			ret =  geni_i2c_gpi(gi2c, &msgs[i], &config,
 					    &rx_addr, &rx_buf, I2C_READ, gi2c->rx_c);
@@ -620,11 +625,6 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
 				goto err;
 		}
 
-		ret =  geni_i2c_gpi(gi2c, &msgs[i], &config,
-				    &tx_addr, &tx_buf, I2C_WRITE, gi2c->tx_c);
-		if (ret)
-			goto err;
-
 		if (msgs[i].flags & I2C_M_RD)
 			dma_async_issue_pending(gi2c->rx_c);
 		dma_async_issue_pending(gi2c->tx_c);
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation


