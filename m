Return-Path: <linux-i2c+bounces-5863-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F940963268
	for <lists+linux-i2c@lfdr.de>; Wed, 28 Aug 2024 22:44:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9D838B219DC
	for <lists+linux-i2c@lfdr.de>; Wed, 28 Aug 2024 20:43:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADD031B373F;
	Wed, 28 Aug 2024 20:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MFB3GV1Y"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4994F1B1416;
	Wed, 28 Aug 2024 20:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724877518; cv=none; b=E6xZpVvC1RzGdQ5lmrjNPSInyBkMmV0k0opGEkOCO8V/YXQcV7L9RdtRASGIDQ6RrmwND0pYBL+vcZAanGtetUiPqKaNOE0b54WnRco1UYMqAhY5RuDrYCB3rWxVfg0fKUshkZDbagO9fT1bEHLhwwvj7k3IUCzZEXi/+xpP2VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724877518; c=relaxed/simple;
	bh=z1eCBL8amlHVa3qRCYl6nDZ0qIYjB7P8iLmr/0rXiMo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ia8/mML0RmK3JG+q4PjMxLeWw8t9KcQOCOopCGrk8niCBBJ0V23Z1B9SVnSdgXUF03aHIUBP4yRPc5l8Oa5UqcgRUoUVgztOYE/7zSrwvvylS7i4evIU4DcZu478THzacOw7yxJt7DvpLMsauxbyAPLuVZWafNSnb65BimRTx1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MFB3GV1Y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47SJM3Vp022580;
	Wed, 28 Aug 2024 20:38:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qp8xp43FNQk+HVjhJZwN1Rolf/PCgnRs3Iuzs1VsKEI=; b=MFB3GV1YEdhEz5G9
	HPDE2FUpD8oZGheKm2uQgtmydQFxKBkUjIbvOfP7iNqrdSdFPKHixH1d4v/4uYHV
	S8v4bsTFCJqp2vtYmi4wFBdWDiHQG0tRrahOp8j1TRSAASz2iP0LmXLZrMWUZuT6
	tQ8V/Jq3krQRdJhRII4EMQCnnBL/8L/dhuZs3+BBZX8qZurPOVeRu1Oq8CN74SHk
	pL5tC2v0qA4p5g3jZereqo+kVtiRbogFeV75ii+Blw0l4t9O8aLS9XrJVS2drOPe
	Kvsr3Gp9nTRzGYt2R10yKmw2iQWKmriukCRKB+2eikTwq2/60H4db2X50M4kwMdE
	54XZ1Q==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419puuk278-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 20:38:06 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47SKc45l004609
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 20:38:04 GMT
Received: from hu-nkela-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 28 Aug 2024 13:38:00 -0700
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
Subject: [PATCH 07/22] dt-bindings: crypto: qcom,prng: document support for SA8255p
Date: Wed, 28 Aug 2024 13:37:06 -0700
Message-ID: <20240828203721.2751904-8-quic_nkela@quicinc.com>
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
X-Proofpoint-ORIG-GUID: EhU0rJMN_npaQxPH8VC0xvDHYLXtrkSl
X-Proofpoint-GUID: EhU0rJMN_npaQxPH8VC0xvDHYLXtrkSl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-28_08,2024-08-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 clxscore=1015 impostorscore=0 phishscore=0 adultscore=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408280149

Document SA8255p compatible for the True Random Number Generator.

Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
---
 Documentation/devicetree/bindings/crypto/qcom,prng.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
index 89c88004b41b..048b769a73c0 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
@@ -17,6 +17,7 @@ properties:
           - qcom,prng-ee  # 8996 and later using EE
       - items:
           - enum:
+              - qcom,sa8255p-trng
               - qcom,sa8775p-trng
               - qcom,sc7280-trng
               - qcom,sm8450-trng
-- 
2.34.1


