Return-Path: <linux-i2c+bounces-12792-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4AFFB4A17E
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Sep 2025 07:48:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5A04D4E0880
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Sep 2025 05:48:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A38302FE05F;
	Tue,  9 Sep 2025 05:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="f3gFkuDi"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8CEB2FE04F;
	Tue,  9 Sep 2025 05:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757396915; cv=none; b=cRNv91p78h0UzdRPRqA4EppHtRFNEF1nk/tMimCElh9aY/Oivmj6UsO2F+8WplODFN5DCjxSlFG9D2itT2ifH9CUD1wfvUTYCaEy8jUUpFV7tQCHWCXI7bILgFAKKOI5YDfP/YJkgOkja+P2/m17jqFW1nRqsBnvk94ffeojlHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757396915; c=relaxed/simple;
	bh=2J7CQf7DMs6bdAmRNfRSs3FGQV6bF5ogSfPOTxxOYc0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C5rBXV/T0OmIXXXD/tcV5BEDHA4Bt6Jtc+ZbLCtg9rP8A2RT3jNt3X5yh9aJvhI+Q3H+Bhpo53/rJ2S11Vxxww5XukJhiQaU++45m/ABNe9U28hkcKuf83a6RL6i21C2U1kebl7+MWDkBcQ2HAYUbJl+AYBvmjrl5O6IqlBvrUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=f3gFkuDi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5895aRO3014507;
	Tue, 9 Sep 2025 05:48:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sznMq80P195Xj811kocWxFa7pSS33CGlaWexbDkZRFU=; b=f3gFkuDijzKDzPAr
	Xp2PQ4X1qmxC1yrGhL0SrguCfjz/PaYb6qPVQ3nymTHKHSXH7+1khJDQ/NXMDGYS
	sRLfYTTNQCMMrP1IBGAt/5Qu3nBHh7ncMb3DGxjYIcFTGWLJzsPtQdXfXm6PaN2b
	dt0g3yAJ3W7A3cu3E636KE4FLrgVoaRSlvzec1YI2nKZgO246NSXI8dUJqDIjbcW
	i1sHR0T3JsOOUvEqSQmswLVN/Rmtq/ZDNzGC1LEc8k0VdTGV8vhKebLga9sUf+Sb
	n8KdMG8Wq0v4cxPbJEgSyRPCg3+1h1D9RKD7haaag73qqNlxDbeRzSlnHHgRJihv
	z8wW4A==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490by8y44j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Sep 2025 05:48:30 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5895mTcD003424
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Sep 2025 05:48:29 GMT
Received: from hu-mmanikan-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Mon, 8 Sep 2025 22:48:24 -0700
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <quic_msavaliy@quicinc.com>, <quic_vdadhani@quicinc.com>,
        <andi.shyti@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>
CC: <quic_varada@quicinc.com>, <quic_srichara@quicinc.com>,
        <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH v3 1/2] i2c: qcom-geni: add OPP table support
Date: Tue, 9 Sep 2025 11:18:10 +0530
Message-ID: <20250909054811.3991901-2-quic_mmanikan@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250909054811.3991901-1-quic_mmanikan@quicinc.com>
References: <20250909054811.3991901-1-quic_mmanikan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Yv8PR5YX c=1 sm=1 tr=0 ts=68bfbfae cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=PkaDvUb3SntloxbNxXMA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: AKRvUvN2Myop0XvvvoQ7xkklS1OyHtAe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfX62P32QdKrF5D
 /LR3GvyTgK1GI3/pApD62ImvexkeLojFFA/6A+moMb+T0v6LEYrmtIgB8uKZMgFahOvhXtDTCpb
 eGxIPu0/C0tYaPGLq57CjlewnHacSmpRl31nhwQzg1Rd4VKGBorkPjC0zkBu7u7LAnXGEsiIDzu
 tjwhPMvWfq9qC+wVuvZnB6ZAyXy+MzzTVZbAjDNuVAXoHa405EhBawReBKcztszN6Xdl+0rxhhD
 jMvWiXcHLisQFTE1T/fmtWFSS9dcMtjRF7TfKsgoqwVOmbCmHtoP6rwF4cmh+cuz7a8bUkSgHJo
 ff/chgjm8MTU+ba1/VGEnE8f3KW7e2RqGokfGjJ+CDlB3jYQm3lcyi1pzfs6gBYvwikjwh+2BM1
 YMzUVF45
X-Proofpoint-ORIG-GUID: AKRvUvN2Myop0XvvvoQ7xkklS1OyHtAe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018

Add support for reading and configuring the OPP table in the GENI I2C
driver. This enables setting the frequency based on device tree data,
removing dependency on bootloader configuration.

Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
---
v3: Fix the format-specifier to correctly display the clock rate and change
   '&pdev->dev' to 'dev' as per suggestions from Andi Shyti.
 
drivers/i2c/busses/i2c-qcom-geni.c | 27 ++++++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index ff2289b52c84..380581a3699c 100644
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
 
+	ret = devm_pm_opp_set_clkname(dev, "se");
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
+			return dev_err_probe(dev, ret, "failed to set the rate=%lu\n", freq);
+	} else if (ret && ret != -ENODEV) {
+		return dev_err_probe(dev, ret, "invalid OPP table in device tree\n");
+	}
+
 	if (has_acpi_companion(dev))
 		ACPI_COMPANION_SET(&gi2c->adap.dev, ACPI_COMPANION(dev));
 
-- 
2.34.1


