Return-Path: <linux-i2c+bounces-5860-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66EDA963249
	for <lists+linux-i2c@lfdr.de>; Wed, 28 Aug 2024 22:43:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 88519B2373F
	for <lists+linux-i2c@lfdr.de>; Wed, 28 Aug 2024 20:42:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 612311B1D41;
	Wed, 28 Aug 2024 20:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nzh/gRDh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3977A1B012A;
	Wed, 28 Aug 2024 20:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724877517; cv=none; b=OXZmCkesjScx6GZXg4M7qH+Z8K78pRK/pwKPccgP8MtiwwZqU58M/HPt+f7j8ROytVQczYW/LgYJZ6wIHoZmByuN4kfNtg2/HyL0ULELPkuCiKvI3BYBGOoqzbPE4M62FTD/stzmE/4efgYmKgsyKSBQF0aLnRl+F5WwiwxLd+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724877517; c=relaxed/simple;
	bh=k2a1vZw71+L3bchz4Rndvna3m9p7JIovSgKrV2hK8fk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Geu0cbBoDDK7fXOhO4CZmmXyDiMpsstdGchUfQkkhLQe3lk3v7YocgawmUXD9dvLr7+nJFkcbZ0A0Osk1kbhwlnmKaqvO3YxhzosJa8htj41V1xoNfmO80bbqvxGwfg5nyb4RIVOpOVFvcduMC8fj7DQFkM27SvSWQ/Pst5nsoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=nzh/gRDh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47SJM4lp019869;
	Wed, 28 Aug 2024 20:38:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jGyCPGpLI2lIbiBh5RYLDxsuylz28OWUQKVgAwX36Vw=; b=nzh/gRDhVrFAl0DS
	yXKLGFVJ4JjdZEyK3/IPKaVomcxAKpgTGi/L5AQUvGfGXnT3MIP8Qirbep2r3ewS
	pHEiUfTkpUBp/cyRemMQbkcSiM2YU8KhD9oKg/dz+4xCMr7ilB1xY/3QblTKKCyO
	XzWmncmHH82dowT3zLhif/p1xJ5wm5SCT6xcc2cg1NWGZSeArs67kua2CYOptdcq
	JZB32ShHbRjaKKkex3250ufpXGtCzsA/eghlthYbNtmgaxEZmSpDKuyvRXnrTDth
	agoYdB3+nTqzwcTLt7c2NmlSjgE9sPVa0U0E2XP4bf7N2+4rfro5bT9kWaBoUGOO
	JDDROQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419q2xu0q4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 20:38:15 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47SKcDSa015590
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 20:38:13 GMT
Received: from hu-nkela-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 28 Aug 2024 13:38:10 -0700
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
Subject: [PATCH 17/22] dt-bindings: serial: document support for SA8255p
Date: Wed, 28 Aug 2024 13:37:16 -0700
Message-ID: <20240828203721.2751904-18-quic_nkela@quicinc.com>
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
X-Proofpoint-ORIG-GUID: La2gYDAdRbh4F5L0dmV_q1s5osbysFkQ
X-Proofpoint-GUID: La2gYDAdRbh4F5L0dmV_q1s5osbysFkQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-28_08,2024-08-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 mlxlogscore=999 phishscore=0 adultscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408280149

Add compatibles representing UART support on SA8255p.

Clocks and interconnects are being configured in the firmware VM
on SA8255p platform, therefore making them optional.

CC: Praveen Talari <quic_ptalari@quicinc.com>
Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
---
 .../serial/qcom,serial-geni-qcom.yaml         | 58 ++++++++++++++++---
 1 file changed, 51 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/qcom,serial-geni-qcom.yaml b/Documentation/devicetree/bindings/serial/qcom,serial-geni-qcom.yaml
index dd33794b3534..dcd43e1353ec 100644
--- a/Documentation/devicetree/bindings/serial/qcom,serial-geni-qcom.yaml
+++ b/Documentation/devicetree/bindings/serial/qcom,serial-geni-qcom.yaml
@@ -13,11 +13,42 @@ maintainers:
 allOf:
   - $ref: /schemas/serial/serial.yaml#
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sa8255p-geni-uart
+              - qcom,sa8255p-geni-debug-uart
+    then:
+      required:
+        - power-domains
+        - power-domain-names
+      properties:
+        power-domains:
+          minItems: 2
+          maxItems: 2
+    else:
+      required:
+        - clocks
+        - clock-names
+      properties:
+        power-domains:
+          maxItems: 1
+        interconnects:
+          maxItems: 2
+        interconnect-names:
+          items:
+            - const: qup-core
+            - const: qup-config
+
 properties:
   compatible:
     enum:
       - qcom,geni-uart
       - qcom,geni-debug-uart
+      - qcom,sa8255p-geni-uart
+      - qcom,sa8255p-geni-debug-uart
 
   clocks:
     maxItems: 1
@@ -26,12 +57,10 @@ properties:
     const: se
 
   interconnects:
-    maxItems: 2
+    description: phandles of interconnect bw provider
 
   interconnect-names:
-    items:
-      - const: qup-core
-      - const: qup-config
+    description: names of interconnects
 
   interrupts:
     minItems: 1
@@ -51,15 +80,19 @@ properties:
       - const: sleep
 
   power-domains:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
+
+  power-domain-names:
+    items:
+      - const: power
+      - const: perf
 
   reg:
     maxItems: 1
 
 required:
   - compatible
-  - clocks
-  - clock-names
   - interrupts
   - reg
 
@@ -83,4 +116,15 @@ examples:
                         <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_0 0>;
         interconnect-names = "qup-core", "qup-config";
     };
+
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    serial@990000 {
+        compatible = "qcom,sa8255p-geni-uart";
+        reg = <0x990000 0x4000>;
+        interrupts = <GIC_SPI 531 IRQ_TYPE_LEVEL_HIGH>;
+        power-domains = <&scmi11_pd 4>, <&scmi11_dvfs 4>;
+        power-domain-names = "power", "perf";
+    };
 ...
-- 
2.34.1


