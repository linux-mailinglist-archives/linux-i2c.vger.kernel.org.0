Return-Path: <linux-i2c+bounces-6070-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0A196AB1D
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 00:04:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 19BF41C213E9
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2024 22:04:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 999FA1D223A;
	Tue,  3 Sep 2024 22:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="buOGp5UK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A5E1D0DDC;
	Tue,  3 Sep 2024 22:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725401018; cv=none; b=bCZdl+OgobT7MWOQ8LnnkIHqGkTZAp+Q+yOQagVhQpKdA5SVepeaxekdEpw5bW6zl1/o9gsqllnZeb+vrsEQI77u/UCszTNGPBrwQD5S6Dvt2Xq4hrjsSDXvQ/DZo2mh0o2jwWPf30Cj/SdiBG8zH00LDZQXf5WQmwjY7W9ZyTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725401018; c=relaxed/simple;
	bh=eqMuL0FXfJK/q7I1MHJ6BblllcuFn5oPx38mhMou4nU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HlqRdtWGrGQRwjfTobYcnJF7nfS1y6/CiSglc6rl0Mz0TIwF4WvudoORQ4NlkBCmfS72hUqOH1aeVuoF+87GHPdPJTatRM3cR5V7gFzUmHXLTUxFHcArtLuQ3UKOiDp10lLA+E+zVDbXLYCXp41+rzcSbvl/WiViY3wfYZEGCaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=buOGp5UK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 483Bdrjh031413;
	Tue, 3 Sep 2024 22:03:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+Oui60hqBzQnl3aPPcWHlMDSgLaKp2PvvdEgSerdrH4=; b=buOGp5UK0mHa7t8D
	mTXW4r2W5LmeQHPqJP//wHmhoGghGxb0B5MvanH4JtHqQacjMWRbQcGxC0WDYr4R
	hy5MvQSVQRCOf3DiYsGU13Stga0v/qSIe89eYbd61DRk9nYBozVflZbAp0r3+KnK
	w7dNucU00MW4o63D8psUvujH3sbEK/6wOHI4WVCbkM4ERKykX6tQ6F3sy+gA5TIz
	fSEhFk+LY9WTJIp7Y/AdkSwRyNkl78jX0PR3VCb4telU4ekD6qDV5n35yHR4HX4f
	ugu8fVocL3N+TkUau2kSIQRf+8kb9L9LZ3loU7D+TqXlejMBAzMYXKmKHwBrJBp1
	ovLnrA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41bvbkgpe2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Sep 2024 22:03:08 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 483M37Ie020278
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Sep 2024 22:03:07 GMT
Received: from hu-nkela-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 3 Sep 2024 15:03:03 -0700
From: Nikunj Kela <quic_nkela@quicinc.com>
To: <quic_nkela@quicinc.com>
CC: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <rafael@kernel.org>,
        <viresh.kumar@linaro.org>, <herbert@gondor.apana.org.au>,
        <davem@davemloft.net>, <sudeep.holla@arm.com>, <andi.shyti@kernel.org>,
        <tglx@linutronix.de>, <will@kernel.org>, <robin.murphy@arm.com>,
        <joro@8bytes.org>, <jassisinghbrar@gmail.com>, <lee@kernel.org>,
        <linus.walleij@linaro.org>, <amitk@kernel.org>,
        <thara.gopinath@gmail.com>, <broonie@kernel.org>,
        <cristian.marussi@arm.com>, <rui.zhang@intel.com>,
        <lukasz.luba@arm.com>, <wim@linux-watchdog.org>, <linux@roeck-us.net>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
        <linux-crypto@vger.kernel.org>, <arm-scmi@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-i2c@vger.kernel.org>,
        <iommu@lists.linux.dev>, <linux-gpio@vger.kernel.org>,
        <linux-serial@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <linux-watchdog@vger.kernel.org>, <kernel@quicinc.com>,
        <quic_psodagud@quicinc.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 10/21] dt-bindings: arm-smmu: document the support on SA8255p
Date: Tue, 3 Sep 2024 15:02:29 -0700
Message-ID: <20240903220240.2594102-11-quic_nkela@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240903220240.2594102-1-quic_nkela@quicinc.com>
References: <20240828203721.2751904-1-quic_nkela@quicinc.com>
 <20240903220240.2594102-1-quic_nkela@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: OdhnE9JxXUqTkkxpIILCvkGYoUIHuu1A
X-Proofpoint-GUID: OdhnE9JxXUqTkkxpIILCvkGYoUIHuu1A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-03_10,2024-09-03_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 mlxscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2409030177

Add compatible for smmu representing support on SA8255p.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 280b4e49f219..3353c2d37841 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -37,6 +37,7 @@ properties:
           - enum:
               - qcom,qcm2290-smmu-500
               - qcom,qdu1000-smmu-500
+              - qcom,sa8255p-smmu-500
               - qcom,sa8775p-smmu-500
               - qcom,sc7180-smmu-500
               - qcom,sc7280-smmu-500
@@ -84,6 +85,7 @@ properties:
         items:
           - enum:
               - qcom,qcm2290-smmu-500
+              - qcom,sa8255p-smmu-500
               - qcom,sa8775p-smmu-500
               - qcom,sc7280-smmu-500
               - qcom,sc8180x-smmu-500
@@ -553,6 +555,7 @@ allOf:
               - marvell,ap806-smmu-500
               - nvidia,smmu-500
               - qcom,qdu1000-smmu-500
+              - qcom,sa8255p-smmu-500
               - qcom,sc7180-smmu-500
               - qcom,sdm670-smmu-500
               - qcom,sdm845-smmu-500
-- 
2.34.1


