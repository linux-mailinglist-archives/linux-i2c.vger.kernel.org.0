Return-Path: <linux-i2c+bounces-6077-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6002A96AB63
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 00:07:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C50DAB244AC
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2024 22:07:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5AEE1DC06D;
	Tue,  3 Sep 2024 22:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UCSW2v5A"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3D01DB930;
	Tue,  3 Sep 2024 22:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725401025; cv=none; b=p445ktukWgLKlZSQqadZ4gm0HWHdWGbTHS1L8NsLEDF+LLZJAURS2wZiB/4fuiJ/Q6iIMVcFr2+6jKqMblQskLfAQRw7VvrhKk547IDuSu+R4pbh6N30fnZ9f03ZH1E1gR+SGwubuZpP7lp19q/ho6Uz/5zpJaRyEOHvATAeqf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725401025; c=relaxed/simple;
	bh=RT43NvnYI8KokyHtIcUoYMFsPFcr8ZBvTOQSPuQ+8Vw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UdbufrIxsVKMaE1k04WYbk3CBxFyisCk8EHMV8gkhXqd8Jb3Jfcrio6xYCzkwHCpXEkeGeWUUXCKTDfKSX+NUjedGcPPCZz+9h5W7HHGVGWJQqKf1b04Nlvb4/pNVJy0M5ADupSx467neAfhEjH77ku2OLFr6bn8WYGRF4qDQ0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UCSW2v5A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 483Bvw58022362;
	Tue, 3 Sep 2024 22:03:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7tfB68W+5+9Gbp/8HchPcn6kiOZl88SONsHykq2stjY=; b=UCSW2v5A9QumgjqI
	yEBE2DHT/icbCzdcN6wWC2DJJwBPLwBIZ9t1kIBnlyd7wps3W+gvnPEYWh5KuG43
	ezAcHFmA8QJtgpScovA4de0OjRDmNl8wvCEjrsl2u+vmlie8OneZDZpaZoqYrYHo
	TRlcoYvgORpK7sJfztqGvu9TcN4IhYPo4qBg59I2zPWfPdPtxGdp9CrUVYbbaPNk
	x9+0Soj8hPE5H4c6PrKR+8aiSkqpJ9mypy6b9x3+F9LDw+VnvGTYSDcj1eNLa9RT
	D9XXCrRdVvjt33LtcVJPMPNJz54plUHVMuVXuGuIKtWTIif2tdFx0Th/H1Kg9Rrc
	zSYnCQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41brvf11uf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Sep 2024 22:03:12 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 483M3BRk002648
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Sep 2024 22:03:11 GMT
Received: from hu-nkela-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 3 Sep 2024 15:03:07 -0700
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
Subject: [PATCH v2 15/21] dt-bindings: i2c: document support for SA8255p
Date: Tue, 3 Sep 2024 15:02:34 -0700
Message-ID: <20240903220240.2594102-16-quic_nkela@quicinc.com>
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
X-Proofpoint-GUID: m_UpNyaGFDGid86XxW4CFTS0a0puWrif
X-Proofpoint-ORIG-GUID: m_UpNyaGFDGid86XxW4CFTS0a0puWrif
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-03_10,2024-09-03_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 adultscore=0 mlxlogscore=999 priorityscore=1501 malwarescore=0 spamscore=0
 mlxscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2409030177

Add compatible representing i2c support on SA8255p.

Clocks and interconnects are being configured in Firmware VM
on SA8255p, therefore making them optional.

CC: Praveen Talari <quic_ptalari@quicinc.com>
Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
---
 .../bindings/i2c/qcom,i2c-geni-qcom.yaml      | 33 +++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
index 9f66a3bb1f80..b477fae734b6 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
@@ -15,6 +15,7 @@ properties:
     enum:
       - qcom,geni-i2c
       - qcom,geni-i2c-master-hub
+      - qcom,sa8255p-geni-i2c
 
   clocks:
     minItems: 1
@@ -69,8 +70,6 @@ properties:
 required:
   - compatible
   - interrupts
-  - clocks
-  - clock-names
   - reg
 
 allOf:
@@ -81,6 +80,10 @@ allOf:
           contains:
             const: qcom,geni-i2c-master-hub
     then:
+      required:
+        - clocks
+        - clock-names
+
       properties:
         clocks:
           minItems: 2
@@ -100,7 +103,21 @@ allOf:
           items:
             - const: qup-core
             - const: qup-config
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,sa8255p-geni-i2c
+    then:
+      required:
+        - power-domains
+
     else:
+      required:
+        - clocks
+        - clock-names
+
       properties:
         clocks:
           maxItems: 1
@@ -143,4 +160,16 @@ examples:
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


