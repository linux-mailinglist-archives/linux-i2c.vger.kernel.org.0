Return-Path: <linux-i2c+bounces-5907-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B241E963FF7
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 11:27:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 63E0128499D
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 09:27:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD95718E36A;
	Thu, 29 Aug 2024 09:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nlxJyEXV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832D518E355;
	Thu, 29 Aug 2024 09:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724923572; cv=none; b=uRf1FsqKPW50W3mfIY2Ok2vWgyFgz+EmBRF8TDMXD67aJZi1Jsu2xftS/Dcr164/jM6NPYfuxw5A9ZuL2vZgXhUhsOFSPgbo1x46t65DAy1kBecvd4NrcelQSG9PNZg1znzEvDrykP2pEy8lG9bzwGd7uwl8RtBTMiLMg0Ih70o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724923572; c=relaxed/simple;
	bh=O+gsj7PE33QFAveJ4IgMeevCOPlcjIRh7jKEeWQ7N4I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CtgbfWeEYHwq2ngqVOemBASixO5ldxkcF0dqgpfvdU1sS9eMLQa8aHbKReMkdE45AIMhiVDgXvzJNbt/xlp3TTjxPL/b6mlSzLiFXYw7JNq+rkVhjXd+kxF0CFucRjnctKmo+nL9Ny3P8q9p1jWVy1KLHPbASBxknpak8BeEOCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=nlxJyEXV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47T9OUsY011732;
	Thu, 29 Aug 2024 09:26:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=SwwRjbQj1U4
	WOJEKBVaTsdST91H7i88mljnK9HcUwaE=; b=nlxJyEXV228+oHJ8DPW/3fC0Odm
	Gemoit5wcvqfHnj+hLG9rIXEr4Yu7bMov6lkZklKzq1pH+c93sLFj/1dNQ4jFeOj
	Sv465PGPdCUalW/qQQIT/1XrwOryd8suOOiTf5X0O8Yj/EI4PK6nFZ5bq2fSLV6c
	vjE2viseRnzZqfV4HYYnwpXCpHz9v7ofMiNIAp2Gy05jZ85S04J4tTDfxynCVb0B
	HlvB7xr0DgD7u+C61ysBp96ovM8UYUJiKLqJ3Ee44t8IQmbM6Re/4xpYPAXuUwZB
	DesgEIsHtvfijKaj4CqNGFDptD90FgsqRx8kxJmpH3rMgIi/VlKHJ3lSTzw==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419pv0cnq5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Aug 2024 09:26:06 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 47T9Q3Xh019359;
	Thu, 29 Aug 2024 09:26:03 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4178kmcgjm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Aug 2024 09:26:03 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 47T9Q2X3019351;
	Thu, 29 Aug 2024 09:26:02 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-msavaliy-hyd.qualcomm.com [10.213.110.207])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 47T9Q2VA019348
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Aug 2024 09:26:02 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 429934)
	id 96D5A242FD; Thu, 29 Aug 2024 14:56:01 +0530 (+0530)
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
To: konrad.dybcio@linaro.org, andersson@kernel.org, andi.shyti@kernel.org,
        linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Cc: quic_vdadhani@quicinc.com,
        Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Subject: [PATCH v1 3/4] soc: qcom: geni-se: Export function geni_se_clks_off()
Date: Thu, 29 Aug 2024 14:54:17 +0530
Message-Id: <20240829092418.2863659-4-quic_msavaliy@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240829092418.2863659-1-quic_msavaliy@quicinc.com>
References: <20240829092418.2863659-1-quic_msavaliy@quicinc.com>
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
X-Proofpoint-GUID: MRxVbS7nUIwsAw6FPHJKAPJLJ_J0RRh1
X-Proofpoint-ORIG-GUID: MRxVbS7nUIwsAw6FPHJKAPJLJ_J0RRh1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_02,2024-08-29_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 mlxlogscore=999 mlxscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408290069

Currently driver provides geni_se_resources_off() function to turn
off SE resources like clocks, pinctrl. But we don't have function to
control clock separately, hence export function geni_se_clks_off()
to turn off clocks separately without disturbing GPIO.

The client drivers like i2c requires this function for use case where
i2c SE is shared between two subsystems.

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


