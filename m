Return-Path: <linux-i2c+bounces-6339-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C4396FC01
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 21:15:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6228F1C23C6A
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 19:15:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAB1C1D7E4A;
	Fri,  6 Sep 2024 19:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HWqdav5W"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 012C41D2780;
	Fri,  6 Sep 2024 19:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725650112; cv=none; b=NIq21Bb//XEAZkjfN1YLUczUplH0bkFIUO0IlWKP6cJGWp4/nj2xQOZfXaru9rHIeajo8NK8mbnB8IVg2G6PAEENBw6bKTQiemHtezgC/ifaL3AQ7kFDLNruxtsYJe4UYJu2sJekkWAKFrXDH6cIGdHj+/Ax+10dQYnFmaaZU3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725650112; c=relaxed/simple;
	bh=+5dDg9NVffD2clZE3AXTBaTxOgGo+jPUTsPx+Lqu8PM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=F6b0WcJJT8LwJFPvNjIA/26qgr7QX9wPQCY2xrNTu9jR7eBhJxgAPwhY8Sx5hrMHQwKRBVIwW4Xpkve6rnN+7DRFrGzAgIhXUzH9/mdI0Rh2vPOhspeCnwMuelRsNjgjMACmqX5FzWYqYFTJuC/Hb8SEPKw/r2bYORbntvI3dts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HWqdav5W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4868kwIe021679;
	Fri, 6 Sep 2024 19:15:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=R6WZwQ35x63
	c8PqrFC/HxMcND2wBPj6a4MsoV46F1Do=; b=HWqdav5WC1dAiWojRHG0TNyQhWi
	WMSlQ0zFuE8hcybtQRNfbsEuTdPx9rIKISmjAITTBKgibUSLHgCGCCe4lXgvN7E4
	eiz+8Lk47xAFp4zS2crcuT4c7ocpYE//4caJej9yJ5bBSAIeLwQmLWzXH8Vt8Fpl
	oKAqZs2Oe1VOLBpD4WYcM9akOr5tuWkTW1AlzO+Rig+f+jlGXRz5ccsYFfPu8cEt
	6GWBtjphbh9WmC/D1MTb0i7LpEm0IJrG9a4aZSc3GG+9bMK7W0A+pgUDyhk3RNCj
	mJpyQk0EkfJyBRMYw69uqDREcdS1hC+h1BktvLwZ+DIXNglUhJ443OaK4Ug==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41fhws373d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Sep 2024 19:15:03 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 486JF0Q1013145;
	Fri, 6 Sep 2024 19:15:00 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 41bv8mxy2y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Sep 2024 19:14:59 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 486JExuV013140;
	Fri, 6 Sep 2024 19:14:59 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-msavaliy-hyd.qualcomm.com [10.213.110.207])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 486JExLs013137
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Sep 2024 19:14:59 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 429934)
	id 6CEE624186; Sat,  7 Sep 2024 00:44:58 +0530 (+0530)
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
To: konrad.dybcio@linaro.org, andersson@kernel.org, andi.shyti@kernel.org,
        linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        conor+dt@kernel.org, agross@kernel.org, devicetree@vger.kernel.org,
        vkoul@kernel.org, linux@treblig.org, dan.carpenter@linaro.org,
        Frank.Li@nxp.com, konradybcio@kernel.org
Cc: quic_vdadhani@quicinc.com,
        Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Subject: [PATCH v2 3/4] soc: qcom: geni-se: Export function geni_se_clks_off()
Date: Sat,  7 Sep 2024 00:44:37 +0530
Message-Id: <20240906191438.4104329-4-quic_msavaliy@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240906191438.4104329-1-quic_msavaliy@quicinc.com>
References: <20240906191438.4104329-1-quic_msavaliy@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Xzlg97264dNVa-vEgMwWXT4761v1KjnX
X-Proofpoint-GUID: Xzlg97264dNVa-vEgMwWXT4761v1KjnX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_04,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 impostorscore=0 mlxlogscore=999 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409060141

Currently the driver provides a function called geni_serial_resources_off()
to turn off resources like clocks and  pinctrl. We don't have a function to
control clocks separately hence, export the function geni_se_clks_off() to
turn off clocks separately without disturbing GPIO.

Client drivers like I2C require this function for use-cases where the I2C
SE is shared between two subsystems.

Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
---
 drivers/soc/qcom/qcom-geni-se.c  | 4 +++-
 include/linux/soc/qcom/geni-se.h | 3 +++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index 2e8f24d5da80..20166c8fc919 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (c) 2017-2018, The Linux Foundation. All rights reserved.
+// Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
 
 /* Disable MMIO tracing to prevent excessive logging of unwanted MMIO traces */
 #define __DISABLE_TRACE_MMIO__
@@ -482,13 +483,14 @@ void geni_se_config_packing(struct geni_se *se, int bpw, int pack_words,
 }
 EXPORT_SYMBOL_GPL(geni_se_config_packing);
 
-static void geni_se_clks_off(struct geni_se *se)
+void geni_se_clks_off(struct geni_se *se)
 {
 	struct geni_wrapper *wrapper = se->wrapper;
 
 	clk_disable_unprepare(se->clk);
 	clk_bulk_disable_unprepare(wrapper->num_clks, wrapper->clks);
 }
+EXPORT_SYMBOL_GPL(geni_se_clks_off);
 
 /**
  * geni_se_resources_off() - Turn off resources associated with the serial
diff --git a/include/linux/soc/qcom/geni-se.h b/include/linux/soc/qcom/geni-se.h
index 0f038a1a0330..caf2c0c4505b 100644
--- a/include/linux/soc/qcom/geni-se.h
+++ b/include/linux/soc/qcom/geni-se.h
@@ -1,6 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /*
  * Copyright (c) 2017-2018, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #ifndef _LINUX_QCOM_GENI_SE
@@ -494,6 +495,8 @@ int geni_se_resources_off(struct geni_se *se);
 
 int geni_se_resources_on(struct geni_se *se);
 
+void geni_se_clks_off(struct geni_se *se);
+
 int geni_se_clk_tbl_get(struct geni_se *se, unsigned long **tbl);
 
 int geni_se_clk_freq_match(struct geni_se *se, unsigned long req_freq,
-- 
2.25.1


