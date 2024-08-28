Return-Path: <linux-i2c+bounces-5865-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5455D963282
	for <lists+linux-i2c@lfdr.de>; Wed, 28 Aug 2024 22:44:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 79CC51C22260
	for <lists+linux-i2c@lfdr.de>; Wed, 28 Aug 2024 20:44:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 287561B4C3E;
	Wed, 28 Aug 2024 20:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kduSaAB4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F031B29B7;
	Wed, 28 Aug 2024 20:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724877519; cv=none; b=uYrVNRyBT3ZGvPUGxjOlFy6FSBO+zNeRLKCGVYY9dv63//WKVrcreoxg3lEYLxAL1/FcFX9Gwc84IAqjvDvARovyzLkA2KEY8lja/pJLgTy98zgAIUhaSR8jhJPOVlfg9eBE/jEiJyQYXtxwJd5dJ9PSuUjiSi/yFlVnHtAX63I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724877519; c=relaxed/simple;
	bh=r6A5x6neGN/gqm6/YpxaKazVoTk/J4JEjs+0+MW+bBs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YEmsx9lqzAVcKObaEPOH78P6WwzwVOLxE3i77srU6N8FEtPaG/nZvmF4PeqzBDD30TIyVcRN+/RYXPE7Gxy4GKgtxH6HGm+OSIhp/PqCpZZI9MzBaOrD50bHZbYnA18OE38J7MmwfWEDTEIX54ud9By9ezlsOKGVivAJ+vXK8D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kduSaAB4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47SJM4JS019866;
	Wed, 28 Aug 2024 20:38:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1ogm+uahN8ntWDNctVAKdHEFeX2pjjyNnQRIIojb8BM=; b=kduSaAB4Jvzqrvat
	3hqRJ4OJJPE1pi+EBK10nkMBzNRCObyx9ivUh+FSePSzNRdLe4bZ3gww/cAuxFi3
	WUBrdE/2VTIEKpeOKJ6VzTy3H56asVaTyUD7otcAXw/fVCwISWwz53/SmgMBqrn8
	BY5a72jAkDQXarI3PAy3OQ39z1xrSnHb8ygx9Wh8KXmwTH8v/O6ty3ORHRfaTySy
	wZvL4IJWGEkH1EJxmIuRvhBHxfiGSUYricr4k3NheqccOpF/vjqNNNGx92A2KzCu
	yOOXzWZ3GHeShiaXCHW79YCLJg/23QjLJK7p15eXrM2Qt8JGgaL3TS7W7hV9ch1b
	WY4z1A==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419q2xu0q8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 20:38:17 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47SKcFUR014342
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 20:38:15 GMT
Received: from hu-nkela-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 28 Aug 2024 13:38:11 -0700
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
Subject: [PATCH 19/22] dt-bindings: i2c: document support for SA8255p
Date: Wed, 28 Aug 2024 13:37:18 -0700
Message-ID: <20240828203721.2751904-20-quic_nkela@quicinc.com>
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
X-Proofpoint-ORIG-GUID: PQNtLENXd5OWtZe41yvCqgXLeHMXIdF0
X-Proofpoint-GUID: PQNtLENXd5OWtZe41yvCqgXLeHMXIdF0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-28_08,2024-08-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 mlxlogscore=999 phishscore=0 adultscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408280149

Add compatible representing i2c support on SA8255p.

Clocks and interconnects are being configured in Firmware VM
on SA8255p, therefore making them optional.

CC: Praveen Talari <quic_ptalari@quicinc.com>
Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
---
 .../bindings/i2c/qcom,i2c-geni-qcom.yaml      | 56 ++++++++++++-------
 1 file changed, 36 insertions(+), 20 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
index 9f66a3bb1f80..88f513fc5b08 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
@@ -15,14 +15,13 @@ properties:
     enum:
       - qcom,geni-i2c
       - qcom,geni-i2c-master-hub
+      - qcom,sa8255p-geni-i2c
 
   clocks:
-    minItems: 1
-    maxItems: 2
+    description: phandles for the clock providers
 
   clock-names:
-    minItems: 1
-    maxItems: 2
+    description: names for the clocks
 
   clock-frequency:
     default: 100000
@@ -36,12 +35,13 @@ properties:
       - const: rx
 
   interconnects:
-    minItems: 2
-    maxItems: 3
+    description: phandles of interconnect bw provider
 
   interconnect-names:
-    minItems: 2
-    maxItems: 3
+    items:
+      - const: qup-core
+      - const: qup-config
+      - const: qup-memory
 
   interrupts:
     maxItems: 1
@@ -69,8 +69,6 @@ properties:
 required:
   - compatible
   - interrupts
-  - clocks
-  - clock-names
   - reg
 
 allOf:
@@ -100,22 +98,28 @@ allOf:
           items:
             - const: qup-core
             - const: qup-config
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,sa8255p-geni-i2c
+    then:
+      required:
+        - power-domains
     else:
       properties:
         clocks:
-          maxItems: 1
-
+          minItems: 1
+          maxItems: 2
         clock-names:
-          const: se
-
+          minItems: 1
+          maxItems: 2
         interconnects:
-          minItems: 3
-
+          minItems: 2
+          maxItems: 3
         interconnect-names:
-          items:
-            - const: qup-core
-            - const: qup-config
-            - const: qup-memory
+          minItems: 2
+          maxItems: 3
 
 unevaluatedProperties: false
 
@@ -143,4 +147,16 @@ examples:
         power-domains = <&rpmhpd SC7180_CX>;
         required-opps = <&rpmhpd_opp_low_svs>;
     };
+
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    i2c@a90000 {
+        compatible = "qcom,sa8255p-geni-i2c";
+        reg = <0xa90000 0x4000>;
+        interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+        power-domains = <&scmi9_pd 11>;
+    };
 ...
-- 
2.34.1


