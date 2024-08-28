Return-Path: <linux-i2c+bounces-5858-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E128963232
	for <lists+linux-i2c@lfdr.de>; Wed, 28 Aug 2024 22:42:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CCC661F23BA6
	for <lists+linux-i2c@lfdr.de>; Wed, 28 Aug 2024 20:42:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A43AA1B0138;
	Wed, 28 Aug 2024 20:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="AF/GLJ8b"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937E41AC8A4;
	Wed, 28 Aug 2024 20:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724877516; cv=none; b=TvX9BpKh0wk/++y6/D48ywesFzxP0P3TXFPe6MHC8xPCK/B6VSMfsGKYpSH8ettj1AHSsCiy2Bb1A8EGOy36yPrDPFE0Zst9mAhbqU2Xgu4hoOYXw8bLm38hD/YeBF6IRXPKPxquANRaUVfrISdYE4L5ay5GT2VRpBFBXs8lhug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724877516; c=relaxed/simple;
	bh=uvLg1L1n44/Eq94rDT9bTtEnOQJNKZ7wwhLm8G/spWU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HoMc4eR3nrmauCvuYdYL+d34/Cnkf7xBK04td9c/8hCY5yduIAOrYzO/46YyykOsNBOQhcG9SEyZJc90Bzh5HypQImd8EOuaGVEzgFZa159oa+gk75qj5Tgnp09B5qXPEzjaaFFHjahB8fOnvxkjkpMEedbCmmxP8PjxwubWmY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=AF/GLJ8b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47SJMX1m009653;
	Wed, 28 Aug 2024 20:38:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9gPTZdfVGR/bVntrUXtv6maP7nFyh3aqSQflvjPnEd4=; b=AF/GLJ8bL8JHDhhh
	gEkWDHZE37WhwmozFQ90AEn7sCGQlr/VprxCpNuRfDTe+CTZ/OuZk6Jd4K8DHrdU
	CkCcQobm6N/wJpsnTbqE/BYBDWJo8ehBPkbGvh9yUv1YjT2poSxS6CNx3W9+8ns6
	BbhB2c8gxsejRnTEmk1e/qDxoTNG7jVtZC5rqXqb1TckOzeAruyC7PMm/YKA6nuv
	GoEjdaOvhZQVSPRv9xZ513sCDloVjruF8+7i/RFXUSe6yszDQsXSDrQmEuZpfHFA
	AUntQG2SAtb0PxXpmd3YUdJn9FAY7Hnq+Ut5AhGCeTxwZhB9KTmQsIR9WHV211b7
	S/6xuA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419pv0b0xu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 20:38:14 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47SKcCFO014305
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 20:38:12 GMT
Received: from hu-nkela-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 28 Aug 2024 13:38:09 -0700
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
        <quic_shazhuss@quicinc.com>, Nikunj Kela <quic_nkela@quicinc.com>,
        "Praveen
 Talari" <quic_ptalari@quicinc.com>
Subject: [PATCH 16/22] dt-bindings: qcom: geni-se: document support for SA8255P
Date: Wed, 28 Aug 2024 13:37:15 -0700
Message-ID: <20240828203721.2751904-17-quic_nkela@quicinc.com>
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
X-Proofpoint-GUID: EmqtUq7HEKnKjYzyXAxkMyvJ_jb3OvLX
X-Proofpoint-ORIG-GUID: EmqtUq7HEKnKjYzyXAxkMyvJ_jb3OvLX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-28_08,2024-08-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 mlxlogscore=999 mlxscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408280149

Add "qcom,sa8255p-geni-se-qup" compatible for representing QUP on
SA8255p.

Clocks are being managed by the firmware VM and not required on
SA8255p Linux VM hence removing it from required list.

CC: Praveen Talari <quic_ptalari@quicinc.com>
Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
---
 .../bindings/soc/qcom/qcom,geni-se.yaml       | 47 +++++++++++++++++--
 1 file changed, 43 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
index 7b031ef09669..40e3a3e045da 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
@@ -22,17 +22,16 @@ properties:
     enum:
       - qcom,geni-se-qup
       - qcom,geni-se-i2c-master-hub
+      - qcom,sa8255p-geni-se-qup
 
   reg:
     description: QUP wrapper common register address and length.
     maxItems: 1
 
   clock-names:
-    minItems: 1
     maxItems: 2
 
   clocks:
-    minItems: 1
     maxItems: 2
 
   "#address-cells":
@@ -57,8 +56,6 @@ properties:
 required:
   - compatible
   - reg
-  - clock-names
-  - clocks
   - "#address-cells"
   - "#size-cells"
   - ranges
@@ -83,6 +80,17 @@ patternProperties:
     $ref: /schemas/serial/qcom,serial-geni-qcom.yaml#
 
 allOf:
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              const: qcom,sa8255p-geni-se-qup
+    then:
+      required:
+        - clocks
+        - clock-names
+
   - if:
       properties:
         compatible:
@@ -162,4 +170,35 @@ examples:
         };
     };
 
+  - |
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        geniqup@9c0000 {
+            compatible = "qcom,sa8255p-geni-se-qup";
+            reg = <0 0x9c0000 0 0x6000>;
+            #address-cells = <2>;
+            #size-cells = <2>;
+            ranges;
+
+            i2c1: i2c@984000 {
+                compatible = "qcom,sa8255p-geni-i2c";
+                reg = <0 0x984000 0 0x4000>;
+                interrupts = <GIC_SPI 551 IRQ_TYPE_LEVEL_HIGH>;
+                #address-cells = <1>;
+                #size-cells = <0>;
+                power-domains = <&scmi9_pd 1>;
+            };
+
+            uart4: serial@990000 {
+                compatible = "qcom,sa8255p-geni-uart";
+                reg = <0 0x990000 0 0x4000>;
+                interrupts = <GIC_SPI 531 IRQ_TYPE_LEVEL_HIGH>;
+                power-domains = <&scmi11_pd 4>, <&scmi11_dvfs 4>;
+                power-domain-names = "power", "perf";
+            };
+        };
+    };
 ...
-- 
2.34.1


