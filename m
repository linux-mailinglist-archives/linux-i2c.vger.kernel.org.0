Return-Path: <linux-i2c+bounces-8271-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A5F9DE8CD
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Nov 2024 15:45:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 70E42282A89
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Nov 2024 14:44:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB09F148FF5;
	Fri, 29 Nov 2024 14:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Y83pBoQJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD4F75588F;
	Fri, 29 Nov 2024 14:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732891468; cv=none; b=XxVhwCxgvFJcfzElQEA2flbmiijMWTXxKyhuR/dPWUbrx30M/TqgwuxO5nkCNRo5C371W1CLZ+P36qkNLM5QEYdc24bQf6FlZq3DHB30jM0OPdQwxojIuNhQeIX8fA8iDBphHvD5s5sUZpWsH/j4bMaV+v0WypC21Iumi9gm1WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732891468; c=relaxed/simple;
	bh=77DKr25SEFoTKMMrW8VkLQL0rgWcRUq1YdBGDFnNkDs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OkjfxyjUpwSkOHWR1tTOtyosBuHisqffVY+pDxh7SmFHP8gw2DcqjamvzJw2TFfxQGwlxckC90RmJ1MPeib4/fKGmfSV4o0iI69BjFMN3EQ0nqxmZZyAP0/3p33reuoyTTbFnzWlo7hVqsDtJmroY2SsjWUDOaVl4ocwjklRiJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Y83pBoQJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ATD5Rkk014889;
	Fri, 29 Nov 2024 14:44:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=kJvzbQF81kA
	o5BG15XASGJ+AUth6PQl40W4O3iq/qxA=; b=Y83pBoQJsrlEXzqAYovjVCQtWwU
	OtgW4ae1W2n0i10Hc6G3XwHt6qZyBm9iKu69vqyoDX7pRAMT6l1J39bAkopCZjV9
	u8N4kE4UBuoCGaiJQN7QSyka0W40WJQr+LpaCyk7rJhoJ49b1EE9X7+DfWvK+87B
	ewCgufgebl2Lm2zxKCWTjR5dcvgS7wMFNmNherOjOMQEQHJGZsCWq2c0YIesyFEP
	sHnTBMSMOIyT7II75Bip+NUEtjWCrS/qMfeg0uqEXdzwj7xro+nw9JIEqUz7cFiL
	FOxo5OaBMRPv0ESHI6YkXklz8yDlfVOVKhbUF1ItIuzy39/afzXIs3i+FlQ==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4366xwnstn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Nov 2024 14:44:19 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 4ATEi41G028705;
	Fri, 29 Nov 2024 14:44:16 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 43384m8h9u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Nov 2024 14:44:16 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4ATEiGIQ028799;
	Fri, 29 Nov 2024 14:44:16 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-msavaliy-hyd.qualcomm.com [10.213.110.207])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4ATEiFVF028797
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Nov 2024 14:44:16 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 429934)
	id 2F2FE240E9; Fri, 29 Nov 2024 20:14:15 +0530 (+0530)
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
To: konrad.dybcio@linaro.org, andersson@kernel.org, andi.shyti@kernel.org,
        linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        conor+dt@kernel.org, agross@kernel.org, devicetree@vger.kernel.org,
        vkoul@kernel.org, linux@treblig.org, dan.carpenter@linaro.org,
        Frank.Li@nxp.com, konradybcio@kernel.org, bryan.odonoghue@linaro.org,
        krzk+dt@kernel.org, robh@kernel.org
Cc: quic_vdadhani@quicinc.com,
        Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Subject: [PATCH v5 3/4] soc: qcom: geni-se: Do not keep GPIOs to sleep state for shared SE usecase
Date: Fri, 29 Nov 2024 20:13:56 +0530
Message-Id: <20241129144357.2008465-4-quic_msavaliy@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241129144357.2008465-1-quic_msavaliy@quicinc.com>
References: <20241129144357.2008465-1-quic_msavaliy@quicinc.com>
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
X-Proofpoint-ORIG-GUID: WKWJgF8K2KFU1zbMW-zuzL8Gvu2Zs1oS
X-Proofpoint-GUID: WKWJgF8K2KFU1zbMW-zuzL8Gvu2Zs1oS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 mlxlogscore=999
 mlxscore=0 impostorscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2411290120

Currently the driver provides a function called geni_serial_resources_off()
to turn off resources like clocks and  pinctrl.

For shared SE between two SS, we don't need to keep pinctrl to sleep state
as other SS may be actively transferring data over SE. Hence,bypass
keeping pinctrl to sleep state conditionally using shared_geni_se flag.
This will allow other SS to continue to transfer the data without any
disturbance over the IO lines.

Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
---
 drivers/soc/qcom/qcom-geni-se.c  | 13 +++++++++----
 include/linux/soc/qcom/geni-se.h |  3 +++
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index 4cb959106efa..e4721bbd4b05 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (c) 2017-2018, The Linux Foundation. All rights reserved.
+// Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
 
 /* Disable MMIO tracing to prevent excessive logging of unwanted MMIO traces */
 #define __DISABLE_TRACE_MMIO__
@@ -503,10 +504,14 @@ int geni_se_resources_off(struct geni_se *se)
 
 	if (has_acpi_companion(se->dev))
 		return 0;
-
-	ret = pinctrl_pm_select_sleep_state(se->dev);
-	if (ret)
-		return ret;
+	/* Don't alter pin states on shared SEs to avoid potentially
+	 * interrupting transfers started by other subsystems.
+	 */
+	if (!se->shared_geni_se) {
+		ret = pinctrl_pm_select_sleep_state(se->dev);
+		if (ret)
+			return ret;
+	}
 
 	geni_se_clks_off(se);
 	return 0;
diff --git a/include/linux/soc/qcom/geni-se.h b/include/linux/soc/qcom/geni-se.h
index 2996a3c28ef3..f330588873c1 100644
--- a/include/linux/soc/qcom/geni-se.h
+++ b/include/linux/soc/qcom/geni-se.h
@@ -1,6 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /*
  * Copyright (c) 2017-2018, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #ifndef _LINUX_QCOM_GENI_SE
@@ -61,6 +62,7 @@ struct geni_icc_path {
  * @num_clk_levels:	Number of valid clock levels in clk_perf_tbl
  * @clk_perf_tbl:	Table of clock frequency input to serial engine clock
  * @icc_paths:		Array of ICC paths for SE
+ * @shared_geni_se:	True if SE is shared between multiprocessors.
  */
 struct geni_se {
 	void __iomem *base;
@@ -70,6 +72,7 @@ struct geni_se {
 	unsigned int num_clk_levels;
 	unsigned long *clk_perf_tbl;
 	struct geni_icc_path icc_paths[3];
+	bool shared_geni_se;
 };
 
 /* Common SE registers */
-- 
2.25.1


