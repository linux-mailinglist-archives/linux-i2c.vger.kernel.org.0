Return-Path: <linux-i2c+bounces-1687-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD578513D2
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Feb 2024 13:53:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 747A11F22A61
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Feb 2024 12:53:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBD1739FFD;
	Mon, 12 Feb 2024 12:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Fdpbv5pW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA5039FEE;
	Mon, 12 Feb 2024 12:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707742374; cv=none; b=EAB4wfH35Y2Gy49mLPAOSdekIlpX3a6KjFibDeYeRAcrSbyt76lR7Qco4SBz0pzatWbSmcJdWxCNGxKXRZ2KPVk0XW143qKLFmsVfuz2GnEeydZyF7NCNvKOGREEoGl4Z1LtZBkvaQV57GbLuWUOPRAx+ta56BKAftS98CeASc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707742374; c=relaxed/simple;
	bh=6afESl8ji0nrWjSycErOnuewc2Nz1C3FUk6hiC18jcs=;
	h=From:To:Cc:Subject:Date:Message-Id; b=ZlPZQO+bjrK8qjXzW2ZcDpyDH1nskigmCBHtGxjOWyfqTNMrUOlFhAOipQIHx9MemKVgA5u0yZDkWlITnmXjDx8ASQ9jlOQQiSr/3AjX10pqmAgaCm0Vn2qyuNLBDje19MIaDRymlSXWiyw9dwklBOULJkFx6LmkFKMC9/3Yvo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Fdpbv5pW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41C9eLYZ011091;
	Mon, 12 Feb 2024 12:52:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id; s=qcppdkim1; bh=RlnNmNKxZ+OT
	iubKfVtBwXhbJHaiIJPiVQpTnrhvbMI=; b=Fdpbv5pWEtkO4bEQMXgwu8A0LaSr
	DE7Ty2ajywJM45/iJr6mLmV8jXJv/yh2jGzz+mDb2urjc077cmyekNdPKd203hG4
	vJ+7yeTEVf9Oq3PtxQpXBzzTjo6cPId46M9ffGN2ODVqUwy40S/KzDo32BuTud7Z
	fdvjNSqQMH8BMjsBJyA4jo9RBoPpwCH54/R7Ks5+FNIxsUIYhvkI8tKul1QEI2l3
	VS9qQzSW4jP5bv8C4SeXWzgCbNOqmIkzPBNtBzbYTlYO8CH1+xlEWdSYm+SZnq1L
	v8fGrvqfA19UPgJ2RkbSRlfEreXkGqTQ+e0fW6CHZsRynPbL6OjcptRMXg==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w7gvjgfgk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Feb 2024 12:52:46 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 41CCqhSH004434;
	Mon, 12 Feb 2024 12:52:43 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 3w627kpub8-1;
	Mon, 12 Feb 2024 12:52:43 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 41CCqhXo004428;
	Mon, 12 Feb 2024 12:52:43 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-vdadhani-hyd.qualcomm.com [10.213.106.28])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 41CCqhLL004427;
	Mon, 12 Feb 2024 12:52:43 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 4047106)
	id 489DE500A3F; Mon, 12 Feb 2024 18:22:42 +0530 (+0530)
From: Viken Dadhaniya <quic_vdadhani@quicinc.com>
To: andersson@kernel.org, konrad.dybcio@linaro.org, andi.shyti@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, vkoul@kernel.org,
        quic_bjorande@quicinc.com, manivannan.sadhasivam@linaro.org,
        bryan.odonoghue@linaro.org, dmitry.baryshkov@linaro.org
Cc: quic_msavaliy@quicinc.com, quic_vtanuku@quicinc.com,
        Viken Dadhaniya <quic_vdadhani@quicinc.com>
Subject: [PATCH v4] i2c: i2c-qcom-geni: Correct I2C TRE sequence
Date: Mon, 12 Feb 2024 18:22:39 +0530
Message-Id: <20240212125239.7764-1-quic_vdadhani@quicinc.com>
X-Mailer: git-send-email 2.17.1
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: CG7qLS0VHRwTDcxexlNdH2MfYKi6OB5V
X-Proofpoint-ORIG-GUID: CG7qLS0VHRwTDcxexlNdH2MfYKi6OB5V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-12_09,2024-02-12_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 suspectscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=999 adultscore=0
 bulkscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402120098
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

For i2c read operation in GSI mode, we are getting timeout
due to malformed TRE basically incorrect TRE sequence
in gpi(drivers/dma/qcom/gpi.c) driver.

I2C driver has geni_i2c_gpi(I2C_WRITE) function which generates GO TRE and
geni_i2c_gpi(I2C_READ)generates DMA TRE. Hence to generate GO TRE before
DMA TRE, we should move geni_i2c_gpi(I2C_WRITE) before
geni_i2c_gpi(I2C_READ) inside the I2C GSI mode transfer function
i.e. geni_i2c_gpi_xfer().

TRE stands for Transfer Ring Element - which is basically an element with
size of 4 words. It contains all information like slave address,
clk divider, dma address value data size etc).

Mainly we have 3 TREs(Config, GO and DMA tre).
- CONFIG TRE : consists of internal register configuration which is
               required before start of the transfer.
- DMA TRE :    contains DDR/Memory address, called as DMA descriptor.
- GO TRE :     contains Transfer directions, slave ID, Delay flags, Length
               of the transfer.

I2c driver calls GPI driver API to config each TRE depending on the
protocol.

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

Fixes: d8703554f4de ("i2c: qcom-geni: Add support for GPI DMA")
Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # qrb5165-rb5
Co-developed-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>

---
v3 -> v4:
- Update commit log.
- Add review/tested/co-develop tag.
- Fix patch title by adding "PATCH" string.

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


