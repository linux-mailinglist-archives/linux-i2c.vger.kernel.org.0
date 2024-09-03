Return-Path: <linux-i2c+bounces-6068-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4682196AB07
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 00:04:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BBB571F22AE0
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2024 22:04:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F422A1D7995;
	Tue,  3 Sep 2024 22:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OlgPgUE/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E99188917;
	Tue,  3 Sep 2024 22:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725401017; cv=none; b=Sqy+OvMlW9cM6Ua/yU8a0uDTCQSW+7F7c1jMq+AYtx2tnUwwMAXNnS/d/VinHAgU8U9RrrzL6C+iTkGpnnMUXX7m+uEO7WmZCs/d6ov0L+Zv92sImkfCpZb3AUHMMGw6oS1cALhP4VeaQdXghzaCBDwsdSE+hM7LS4V+SoLUX7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725401017; c=relaxed/simple;
	bh=Z8Xp242mUHibbnFpJsSUG/lcrszhFk102xth0mYvEFw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gc58y7G6cmNL8OqSgGG5VVfR9ElAp8RUQ0w9W+VbnyBXQ8jV446FYg0Zj3aII/qzVSPJqwP5fdFhfbSuq3ibOePz+1Q02Lfa6OSuUMXljJLdrailuDMii7S82RIo7s+IUUNubPimgO4UvA0PnYj6rfe1TNlxsvooGhDNWOTm14k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OlgPgUE/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 483KpF8o021177;
	Tue, 3 Sep 2024 22:03:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qnD3ZyC04ln1pwX3mE8lCIeuA6RJCgvOCk2K8e4cKAs=; b=OlgPgUE/VBdFBcgQ
	92JvUKLGAAH9iSPIpDty5V7kvHCfwr46MdDSz+dexu7ygQMLhTwx6rQzHaS5rVFt
	+dxB/svy4JItYGBEn3MDE9LRCsdXe+ukMnm04XLBb9ljd0Urn9kGwkhY+smq4Wgg
	/mRC4+VA/yzUM1fzazmuXyQdOGpU3p7m290CbdRLs6Fcq2yLysINMdpoh9i0jT/x
	hVrWWamRkbpS2dNuu6bPFWhB22DPnuC25mPEfv+29nDfexWLV231XDRPSx2UkUDa
	h54/CGF7sddOja1XodL0/6wMDZ1Ii/nkptuDDe0A1ymKdwLVxcPRYcp1pC2FrU96
	RCQyPQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41brvf11uh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Sep 2024 22:03:14 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 483M3EJZ002688
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Sep 2024 22:03:14 GMT
Received: from hu-nkela-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 3 Sep 2024 15:03:10 -0700
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
        <quic_psodagud@quicinc.com>, Praveen Talari <quic_ptalari@quicinc.com>
Subject: [PATCH v2 18/21] dt-bindings: qcom: geni-se: document support for SA8255P
Date: Tue, 3 Sep 2024 15:02:37 -0700
Message-ID: <20240903220240.2594102-19-quic_nkela@quicinc.com>
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
X-Proofpoint-GUID: GLthblPEpgKqwIH86TqQhw4SHkwMcoFw
X-Proofpoint-ORIG-GUID: GLthblPEpgKqwIH86TqQhw4SHkwMcoFw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-03_10,2024-09-03_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 adultscore=0 mlxlogscore=999 priorityscore=1501 malwarescore=0 spamscore=0
 mlxscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2409030177

Add "qcom,sa8255p-geni-se-qup" compatible for representing QUP on
SA8255p.

Clocks are being managed by the firmware VM and not required on
SA8255p Linux VM hence removing it from required list.

CC: Praveen Talari <quic_ptalari@quicinc.com>
Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
---
 .../bindings/soc/qcom/qcom,geni-se.yaml       | 45 ++++++++++++++++++-
 1 file changed, 43 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
index 7b031ef09669..86eb2b3832cb 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
@@ -22,6 +22,7 @@ properties:
     enum:
       - qcom,geni-se-qup
       - qcom,geni-se-i2c-master-hub
+      - qcom,sa8255p-geni-se-qup
 
   reg:
     description: QUP wrapper common register address and length.
@@ -57,8 +58,6 @@ properties:
 required:
   - compatible
   - reg
-  - clock-names
-  - clocks
   - "#address-cells"
   - "#size-cells"
   - ranges
@@ -83,6 +82,17 @@ patternProperties:
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
@@ -162,4 +172,35 @@ examples:
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


