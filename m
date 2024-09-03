Return-Path: <linux-i2c+bounces-6081-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A7096AB8B
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 00:08:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C83ECB2465E
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2024 22:08:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EE711DEFCF;
	Tue,  3 Sep 2024 22:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="apl+gmoH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CABA71D58A8;
	Tue,  3 Sep 2024 22:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725401027; cv=none; b=f7To5slouQBhIMHFpujDyTBaOTbs2GpZa399m0V2dnEmLwW3F8+Wlb6mKV7lh3pXkx0nX6HvfFzxCmhoFy9FHAgFiHO7eSc8DAOVk6X1FIP3eNKV2SJH6X4JPgco2QfWMaZP6kEbV55PdbYikc4VCN/UA63H5CDkQ3iOZ4u3uiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725401027; c=relaxed/simple;
	bh=hrUMCaah3xBH4nlenkPRmzcpNXwo8dERr0YIxzI0cNw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jUL8LhU6LbXT5sCVN4yGjyneqINfEFoWiQYXHuGRYz7kbbgnZfwYtWIbQY/t927jsfwy5YN/jZ0i/+IA+sH7YHshPK2u2mbF/PdA3tGTBH64EN0dyGn/Do7tfGMxPqJu3pcLWKGAZbbTGuu3upU+C5Q6x0mFbjNfzuyJXigQEaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=apl+gmoH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 483HV1sF021752;
	Tue, 3 Sep 2024 22:03:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fwUsqRu9Wku3omcq0/UE3/f7A4zFMFi8ZKdWGP9H6Bc=; b=apl+gmoHGW8tKjof
	whqhYUqbFD8izYmmqUMANYoAuVOmzMhc44e5RnOuiLUDTOAfb9N/2oU0xABZ2vM/
	dCtkDROk91VFP3BuJIH379Wjnaj4yPq/u5W+3XI/zw1ms9PR18IwnBR9nyk7R8pl
	rZzc/wj9C4JdzPFTjZPRnNhkdHql4DFEEIRvbhBI42TdCzho1HSYxs9ghH+xnqSr
	KMcyzIQZuxG3hCGiXE/6zgAnrj6e1cTYS1GzpLoH5IutjdTaEbayP9LTU5jBkpJe
	8ScQyk/0/Jdwq+dtva38i9eoa6QKXwiG71fI3kyWhOvXvRb2QaqmaxweCkri9TW4
	9Wrj7A==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41dxy2284r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Sep 2024 22:03:14 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 483M3D97007753
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Sep 2024 22:03:13 GMT
Received: from hu-nkela-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 3 Sep 2024 15:03:09 -0700
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
Subject: [PATCH v2 17/21] dt-bindings: serial: document support for SA8255p
Date: Tue, 3 Sep 2024 15:02:36 -0700
Message-ID: <20240903220240.2594102-18-quic_nkela@quicinc.com>
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
X-Proofpoint-GUID: rRR8fCKu0G6hr2_RJ-cjYxjOxPOS06Pm
X-Proofpoint-ORIG-GUID: rRR8fCKu0G6hr2_RJ-cjYxjOxPOS06Pm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-03_10,2024-09-03_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 lowpriorityscore=0 mlxlogscore=999 spamscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2409030177

Add compatibles representing UART support on SA8255p.

Clocks and interconnects are being configured in the firmware VM
on SA8255p platform, therefore making them optional.

CC: Praveen Talari <quic_ptalari@quicinc.com>
Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
---
 .../serial/qcom,serial-geni-qcom.yaml         | 53 ++++++++++++++++---
 1 file changed, 47 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/qcom,serial-geni-qcom.yaml b/Documentation/devicetree/bindings/serial/qcom,serial-geni-qcom.yaml
index dd33794b3534..b63c984684f3 100644
--- a/Documentation/devicetree/bindings/serial/qcom,serial-geni-qcom.yaml
+++ b/Documentation/devicetree/bindings/serial/qcom,serial-geni-qcom.yaml
@@ -10,14 +10,13 @@ maintainers:
   - Andy Gross <agross@kernel.org>
   - Bjorn Andersson <bjorn.andersson@linaro.org>
 
-allOf:
-  - $ref: /schemas/serial/serial.yaml#
-
 properties:
   compatible:
     enum:
       - qcom,geni-uart
       - qcom,geni-debug-uart
+      - qcom,sa8255p-geni-uart
+      - qcom,sa8255p-geni-debug-uart
 
   clocks:
     maxItems: 1
@@ -51,18 +50,49 @@ properties:
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
 
+allOf:
+  - $ref: /schemas/serial/serial.yaml#
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
+
+      properties:
+        power-domains:
+          minItems: 2
+
+    else:
+      required:
+        - clocks
+        - clock-names
+
+      properties:
+        power-domains:
+          maxItems: 1
+
 unevaluatedProperties: false
 
 examples:
@@ -83,4 +113,15 @@ examples:
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


