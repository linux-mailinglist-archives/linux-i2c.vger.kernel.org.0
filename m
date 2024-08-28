Return-Path: <linux-i2c+bounces-5856-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC2C96321F
	for <lists+linux-i2c@lfdr.de>; Wed, 28 Aug 2024 22:41:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3082F1F242F2
	for <lists+linux-i2c@lfdr.de>; Wed, 28 Aug 2024 20:41:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 682BF1AED55;
	Wed, 28 Aug 2024 20:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gqg+sriu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 957031AE842;
	Wed, 28 Aug 2024 20:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724877513; cv=none; b=TASn9/tlEHyzLfalxqA4YNUpLeWpNjlLTRm+uhJdiscisDRQudtEeoQhl4OKPeWTBjAadB6VSQ0ayHVw8H+S63YC4ZcilXEZ5NXoUcfdaccBR3MNQoF8GdWgytZHH7unWZfHsYGf8tKANNVtHnFvIHfYuchVuAa4QqLjH1ExHvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724877513; c=relaxed/simple;
	bh=8agfdh9u7G+iNRiugX/N1uridyAKJmWuj+kOcO/RcdQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XZICnHTEr6UN6+eAcgp3g7ewt3NjxObyAx0nHu0Is+AWSqGTBZDWtXF1cUY8suwiurRYG2zoVMdSeRueAjObVcPEtgBUHM1H5m3Gmno+iwqp6PPTjAMwrvMTJMYrm80ECFiNTsYCHR2yCiIra/j0dpNK8kIjZ7Q4uQ66AJ3EZTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gqg+sriu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47SJO08B023136;
	Wed, 28 Aug 2024 20:38:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dvp/u1SA+nQPFwyrWyEXENH+ReXEPpXNCIyLa8eQsfk=; b=gqg+sriubTAMgiwf
	iMDkVkHwurcEvyt5RpftrxtgMrL/6ipKBHjGtL3rS8O3IxekdXGOyOhsOH8YVkMM
	R8NcIvYh20/XoyCncnsxsIBIkFCM/UvGFXbJ9YwvINinibLLmvpg5C5pGqg8oS+1
	PbMInMWNfqOOQjL8Hn4maCynMZlOI2HMgbwfYauNPnE5akHu2/z7D/cY7hCj4OVQ
	hE7X4FK/oX/3jmV8a+F8urYS8okv+84JIrAWR8Rdb1MxVoewJobdE4jNEoyrpjbr
	Z89BAbfyTEiYts16PAUeoH5Uw1bhkYgkr94jDzDrb2lhAyIyWBfkIuS4wAHNjcn6
	3QNVxA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419q2xu0py-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 20:38:11 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47SKcASG004668
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 20:38:10 GMT
Received: from hu-nkela-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 28 Aug 2024 13:38:06 -0700
From: Nikunj Kela <quic_nkela@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <rafael@kernel.org>,
        <viresh.kumar@linaro.org>, <herbert@gondor.apana.org.au>,
        <davem@davemloft.net>, <sudeep.holla@arm.com>, <andi.shyti@kernel.org>,
        <tglx@linutronix.de>, <will@kernel.org>, <joro@8bytes.org>,
        <jassisinghbrar@gmail.com>, <lee@kernel.org>,
        <linus.walleij@linaro.org>, <amitk@kernel.org>,
        <thara.gopinath@gmail.com>, <broonie@kernel.org>,
        <wim@linux-watchdog.org>, <linux@roeck-us.net>
CC: <robin.murphy@arm.com>, <cristian.marussi@arm.com>, <rui.zhang@intel.com>,
        <lukasz.luba@arm.com>, <vkoul@kernel.org>, <quic_gurus@quicinc.com>,
        <agross@kernel.org>, <bartosz.golaszewski@linaro.org>,
        <quic_rjendra@quicinc.com>, <robimarko@gmail.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
        <linux-crypto@vger.kernel.org>, <arm-scmi@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-i2c@vger.kernel.org>,
        <iommu@lists.linux.dev>, <linux-gpio@vger.kernel.org>,
        <linux-serial@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <linux-watchdog@vger.kernel.org>, <kernel@quicinc.com>,
        <quic_psodagud@quicinc.com>, <quic_tsoni@quicinc.com>,
        <quic_shazhuss@quicinc.com>, Nikunj Kela <quic_nkela@quicinc.com>
Subject: [PATCH 13/22] dt-bindings: thermal: tsens: document support on SA8255p
Date: Wed, 28 Aug 2024 13:37:12 -0700
Message-ID: <20240828203721.2751904-14-quic_nkela@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240828203721.2751904-1-quic_nkela@quicinc.com>
References: <20240828203721.2751904-1-quic_nkela@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: e3-6zbq2ubQ3zR7NONyvqUC3W0rLkcQa
X-Proofpoint-GUID: e3-6zbq2ubQ3zR7NONyvqUC3W0rLkcQa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-28_08,2024-08-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 mlxlogscore=999 phishscore=0 adultscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408280149

Add compatible for sensors representing support on SA8255p.

Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
---
 Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
index 72048c5a0412..d45690d6a465 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
@@ -51,6 +51,7 @@ properties:
               - qcom,msm8996-tsens
               - qcom,msm8998-tsens
               - qcom,qcm2290-tsens
+              - qcom,sa8255p-tsens
               - qcom,sa8775p-tsens
               - qcom,sc7180-tsens
               - qcom,sc7280-tsens
-- 
2.34.1


