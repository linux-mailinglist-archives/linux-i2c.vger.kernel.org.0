Return-Path: <linux-i2c+bounces-7969-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8F89C7881
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Nov 2024 17:15:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D49471F2651A
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Nov 2024 16:15:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9787F1FBF7F;
	Wed, 13 Nov 2024 16:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jFFr0oW5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B4B16FF4E;
	Wed, 13 Nov 2024 16:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731514487; cv=none; b=KAVdKLU39A8cLKbCMCcdx+rJIrBT4mPL7AAAms75J8ckNNqnMvrdd9ZeMExNfXk5Xybu0u90pvoYFeVP/i0Ov0TYaoLZqd/KSs43vSALRpBwXGL7+R0dmW6O1BvHvuAy3U/8eMF9HyD06yLAKAD6w4aKecgJQuxjOYJCn2ke8ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731514487; c=relaxed/simple;
	bh=E50JKna0/+pk36SEE0T79mdCvAogBdnYBumojUZWpOc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bEEC8EGxqNiQUu8RUfizF+WVk83/iIklH+jj0fJYn6b0ndDH2KYFNQVuPMQVgUpNcI6/zagkjadqSi5o707khEpQu3LD55gC/XXIy48Dqp+G6DPw6aixjMovjsJm6a6p65mqn6e1lgiV5hElBFGXwx638r+A4EObEwPrYkOSnlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jFFr0oW5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ADAKwKb018304;
	Wed, 13 Nov 2024 16:14:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wyvvoNKx5js
	EDP8Vk0f8lzjlQL3KrBTthksLN14g1Hw=; b=jFFr0oW5NofU0teAQb17vrFM4Tv
	X545+12+/tNbxCa7u1PrjfsVZKfcTN0pfKBBJS1ImSjOiO41x7DkvhdnhR1y/EWd
	wCDkOdlQkZffdZiOdgyU8cV5DgFZE6zrNeEnRJaS9C4KzPqL5P9rCi16BFi7BaOn
	1mpKkX76QtHxGbTtfrswIf8MsMTd8ONJyvAEQuL2fV2hsuP784AIpBXk5Pd454SU
	vUpCeZXu1ba7LRbWeZALMak2XAE0hgwIbojNzXSs5Dw5YO56n1uyi6wBCQf74LR9
	Mlc7xv5hx2DGGgwcYzLl1yQZ2H6bfG7c4l4QHHFl2yesZ3Eha+gqT+EyqdA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42v4kqvh9x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 16:14:37 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 4ADGEYRY032587;
	Wed, 13 Nov 2024 16:14:34 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 42t0tmhvfy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 16:14:34 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4ADGEXDm032579;
	Wed, 13 Nov 2024 16:14:33 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-msavaliy-hyd.qualcomm.com [10.213.110.207])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4ADGEXRW032577
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 16:14:33 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 429934)
	id C7B8124055; Wed, 13 Nov 2024 21:44:32 +0530 (+0530)
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
Subject: [PATCH v4 3/4] soc: qcom: geni-se: Do not keep GPIOs to sleep state for shared SE usecase
Date: Wed, 13 Nov 2024 21:44:12 +0530
Message-Id: <20241113161413.3821858-4-quic_msavaliy@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241113161413.3821858-1-quic_msavaliy@quicinc.com>
References: <20241113161413.3821858-1-quic_msavaliy@quicinc.com>
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
X-Proofpoint-ORIG-GUID: O90mU9CBvOLLRjH31gjHApIBF3ar3Zt4
X-Proofpoint-GUID: O90mU9CBvOLLRjH31gjHApIBF3ar3Zt4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 malwarescore=0 spamscore=0 clxscore=1015 mlxscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411130135

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
index 4cb959106efa..2116593c4d3b 100644
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


