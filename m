Return-Path: <linux-i2c+bounces-12571-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 731F7B41810
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Sep 2025 10:10:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B5F6C1B23D21
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Sep 2025 08:11:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 205272EA721;
	Wed,  3 Sep 2025 08:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="AnrYYuEB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F5721DF270;
	Wed,  3 Sep 2025 08:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756887021; cv=none; b=gRsIh4/Uqj+dSkCP6XiAJ27M13rIIxz6NmH/1ZB9PFDdNP5dmIHipaU7FexexMmAzEhGR4fymhL7b1aXxL2gKpkAXadCI1vkPVHRbUiRD76ZHKz12dFNkO44VlnXlGBMsEMFScMJVWXxA+W+54j2ilHbJ3My60Xk6xGKkRmDucA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756887021; c=relaxed/simple;
	bh=fwqhmYU0zJjtRM4AoymrT8y+EeDMT2LZy3J+wjceevs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aBSobuzdqhOVo6bVrtW5iA6vQhSIefxGCNxKbk5Yr/YXgVZWOz8WK9bmB7pUD1i+HYvlyJKwvfEkaMWUnQORd02/tuRgCgsjjfZBhqvzDL978UcBr6x/nfVK/sXQEPgy0aGXEYAlGvij78OaGKddX6FmmonV0omZrz+MudGYSo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=AnrYYuEB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58335HNV012176;
	Wed, 3 Sep 2025 08:10:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L8KJSGPZDQuXLFnHuyhuskaClGdAwGOnDa5JEVRNmJ8=; b=AnrYYuEBAZFvoVlN
	i4NKdVPxSKUt5jXEsl57pq0ISIawduz5tZvI+XJJKdsuS/MnnRA8XYmBQegRTsv8
	/toWPS/WCqgKH8qdUKDqHixotWqAUs9sBHPu6UXsjT3Y2+MSBvnTgn85vrfrOBh2
	IbytVr3RMGv4PpfhwaM25wFJbF+Rf2RKmdFm8/Ysl7FsPrk5BnLScM9PBTegamUu
	DbBNbRKCUYduuTIT5NTP74QcfCgIvjXtFRjEX+E8OJ7BpyIdPThOdV1MNzoJzhsq
	3z6Y+z1JJ8fC+I1ULUEBhatGhUgVRcyWd8/MbqEnvK4nMoElx/mXo057q4Glhh6K
	/YCQJA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ut2fjmwu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Sep 2025 08:10:16 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5838A7lJ005434
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 3 Sep 2025 08:10:07 GMT
Received: from hu-mmanikan-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Wed, 3 Sep 2025 01:10:02 -0700
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <quic_msavaliy@quicinc.com>, <quic_vdadhani@quicinc.com>,
        <andi.shyti@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>,
        <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH v2 1/2] i2c: qcom-geni: add OPP table support
Date: Wed, 3 Sep 2025 13:39:47 +0530
Message-ID: <20250903080948.3898671-2-quic_mmanikan@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250903080948.3898671-1-quic_mmanikan@quicinc.com>
References: <20250903080948.3898671-1-quic_mmanikan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzOCBTYWx0ZWRfX/CPYMYwtuUF5
 2BuaKxnhWiHvoxPxhEtnM3Ysspjny1bdkOfFzSqeq0WUL5IS4qBaczIIUtwzWR9r8tz/nJ+fDJ+
 fFOhgVa1/FcTh+d50Eu0/WW/vYSXmCyaC9TBS5p/CZJu07Y2gcUO3brdwyhRR7IBELR+oKjUDts
 En3zS2k+AzwDzan04EFN9Ui+lEC3Xf2EvFiY2OiY1+0fEvZDXQJwtsXjojPMScZnw8Qnh2tzxOP
 Ghxe22g0bLrvPlPfxxNaUQH3cfYF8UKyFwZoJybUIrdrnQltKtpzvvVgqoQFGc9b6aZK1evoy3f
 CYuJYZOX8IaPP/ZSm7dlHg80T3RJZ+KYmj/wxMQJe7wNYtky4oUOiv605pAEmOSxhqJSSUjbRZx
 aRSc0PoE
X-Proofpoint-ORIG-GUID: 42Fs02m87ur47nO2CW56vkMDvZFugU-J
X-Proofpoint-GUID: 42Fs02m87ur47nO2CW56vkMDvZFugU-J
X-Authority-Analysis: v=2.4 cv=U7iSDfru c=1 sm=1 tr=0 ts=68b7f7e9 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=PkaDvUb3SntloxbNxXMA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1011 impostorscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300038

Add support for reading and configuring the OPP table in the GENI I2C
driver. This enables setting the frequency based on device tree data,
removing dependency on bootloader configuration.

Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 27 ++++++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index ff2289b52c84..85b7f25e0c6e 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -13,6 +13,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/pm_opp.h>
 #include <linux/pm_runtime.h>
 #include <linux/soc/qcom/geni-se.h>
 #include <linux/spinlock.h>
@@ -779,11 +780,13 @@ static int setup_gpi_dma(struct geni_i2c_dev *gi2c)
 
 static int geni_i2c_probe(struct platform_device *pdev)
 {
-	struct geni_i2c_dev *gi2c;
+	const struct geni_i2c_desc *desc = NULL;
 	u32 proto, tx_depth, fifo_disable;
-	int ret;
 	struct device *dev = &pdev->dev;
-	const struct geni_i2c_desc *desc = NULL;
+	unsigned long freq = ULONG_MAX;
+	struct geni_i2c_dev *gi2c;
+	struct dev_pm_opp *opp;
+	int ret;
 
 	gi2c = devm_kzalloc(dev, sizeof(*gi2c), GFP_KERNEL);
 	if (!gi2c)
@@ -814,6 +817,24 @@ static int geni_i2c_probe(struct platform_device *pdev)
 		gi2c->clk_freq_out = I2C_MAX_STANDARD_MODE_FREQ;
 	}
 
+	ret = devm_pm_opp_set_clkname(&pdev->dev, "se");
+	if (ret)
+		return ret;
+
+	/* OPP table is optional */
+	ret = devm_pm_opp_of_add_table(dev);
+	if (!ret) {
+		opp = dev_pm_opp_find_freq_floor(dev, &freq);
+		if (IS_ERR(opp))
+			return dev_err_probe(dev, PTR_ERR(opp), "failed to find the frequency\n");
+		dev_pm_opp_put(opp);
+		ret = dev_pm_opp_set_rate(dev, freq);
+		if (ret)
+			return dev_err_probe(dev, ret, "failed to set the rate=%ld\n", freq);
+	} else if (ret && ret != -ENODEV) {
+		return dev_err_probe(&pdev->dev, ret, "invalid OPP table in device tree\n");
+	}
+
 	if (has_acpi_companion(dev))
 		ACPI_COMPANION_SET(&gi2c->adap.dev, ACPI_COMPANION(dev));
 
-- 
2.34.1


