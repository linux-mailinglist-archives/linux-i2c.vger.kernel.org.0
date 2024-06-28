Return-Path: <linux-i2c+bounces-4481-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9EA91C5C1
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 20:33:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3FAE11C22EBB
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 18:33:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24A7B1CE0A0;
	Fri, 28 Jun 2024 18:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cuGilejF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E05761CB33D;
	Fri, 28 Jun 2024 18:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719599588; cv=none; b=F/kLmLH6O5lYDyETvFBkNMsfcqMmPB95ZoVht/IOkMp6RWFLUuOVHf/qOsHQz4YCq1y9v/odBJ5zGA9hTpLLZ07+eeHeumX4ZkF2pDIpaVKC9DpImK+xW6AZdIkENlguNI5CHLrgnSzzmz+x8MtZdyC5CjHm0oCLkBAehWKMpoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719599588; c=relaxed/simple;
	bh=pTheMAHKv7goMu0ShQLXXkFb2Lcx2phWjcw3U1pD8/s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=r5IkzK42SwnRM7C1Pk7FEWOQBNLvEQ+1LwHiwenP8EQPz37u7+pJJ4Gi8RHNAhLVBnIagIpBbdFvkcHQ2+RaQRDH0swJ9LIUCe1UzUvgrag2vFcT5NeKDRvEbm58t8ryJCuRTPWnKl2zL8miLba7LOxQXuLs9qHHBBrYN564XvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cuGilejF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45SEMr6H029826;
	Fri, 28 Jun 2024 18:33:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5VqmJ1KYpP+4lNEi1Kqwi7rGWHEE28maPtYubzOTwb4=; b=cuGilejFYW4MPEKU
	c/yDWxNpA/TZr73vWS00SUTVcacO1XeVLoPQB8Bevy6T16wCQdeoNd9aTmOuQ6A7
	HUoPj9gm5pA5lUwQH05QRCfvRoRKkRJYMHacGUrbIcnsaklF9+o7Z3RNJCISdyPq
	46rEdp0tH2QlTBPA9Hhyfn+7riS4OmTWQ0fHSuTu2zm/Oj1oFwHXA1BN9H5oJysq
	mzIdGAUbKjkhaRtwa+DxiIZRg1z4GGCT6IL4U5TGCqQFn0JzP1NEa+g6AzfgXdu6
	q/p4GqEqr5x9PHFFDApsMcOvzBiKz5Ttuo9KP5vMrvFYgRz62rIMUiRJfiXKu8Xq
	7IGpTg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 400c46gtm1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Jun 2024 18:33:01 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45SIX0Q3028177
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Jun 2024 18:33:00 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 28 Jun 2024 11:32:53 -0700
From: Vikram Sharma <quic_vikramsa@quicinc.com>
Date: Sat, 29 Jun 2024 00:02:35 +0530
Subject: [PATCH 1/6] media: dt-bindings: media: camss: Add
 qcom,sc7280-camss binding
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240629-camss_first_post_linux_next-v1-1-bc798edabc3a@quicinc.com>
References: <20240629-camss_first_post_linux_next-v1-0-bc798edabc3a@quicinc.com>
In-Reply-To: <20240629-camss_first_post_linux_next-v1-0-bc798edabc3a@quicinc.com>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        "Bryan
 O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kapatrala Syed
	<akapatra@quicinc.com>,
        Hariram Purushothaman <hariramp@quicinc.com>,
        <cros-qcom-dts-watchers@chromium.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "Loic
 Poulain" <loic.poulain@linaro.org>,
        Andi Shyti <andi.shyti@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, Vikram Sharma <quic_vikramsa@quicinc.com>,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Trishansh Bhardwaj
	<quic_tbhardwa@quicinc.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719599566; l=14775;
 i=quic_vikramsa@quicinc.com; s=20240628; h=from:subject:message-id;
 bh=pTheMAHKv7goMu0ShQLXXkFb2Lcx2phWjcw3U1pD8/s=;
 b=xMNJ7F6zKD4S7knXIX9/Cxb+qhgK7Mtt6A2s2Of7kYZhUu3kyBlffvoXjuAy4rY7Oa0Rj+v2l
 1PHPR3eYpe/B1gk/kHpXOQ0x/bfN2NavQk1OXjIuoo0QY7WO8iKaYMB
X-Developer-Key: i=quic_vikramsa@quicinc.com; a=ed25519;
 pk=vQBkwZr1Hv+VXogAyTAu7AEx8/6bvkOmgrzYFbNGCDI=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: HREsJv-mvwWVcSe5RT9S6oHpwqYKRn1u
X-Proofpoint-GUID: HREsJv-mvwWVcSe5RT9S6oHpwqYKRn1u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-28_14,2024-06-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 phishscore=0 mlxlogscore=999 adultscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2406280138

Add bindings for qcom,sc7280-camss in order to support the camera
subsystem for sc7280.

Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
Signed-off-by: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
---
 .../bindings/media/qcom,sc7280-camss.yaml          | 477 +++++++++++++++++++++
 1 file changed, 477 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml
new file mode 100644
index 000000000000..588c6fb50e2f
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml
@@ -0,0 +1,477 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+
+---
+$id: http://devicetree.org/schemas/media/qcom,sc7280-camss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies, Inc. SC7280 CAMSS ISP
+
+maintainers:
+  - Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>
+  - Hariram Purushothaman <hariramp@quicinc.com>
+
+description: |
+  The CAMSS IP is a CSI decoder and ISP present on
+  Qualcomm Technologies, Inc. platforms.
+
+properties:
+  compatible:
+    const: qcom,sc7280-camss
+
+  clocks:
+    minItems: 41
+    maxItems: 41
+
+  clock-names:
+    items:
+
+      - const: cam_hf_axi
+      - const: slow_ahb_src
+      - const: cpas_ahb
+      - const: camnoc_axi_src
+      - const: camnoc_axi
+      - const: csiphy0
+      - const: csiphy0_timer
+      - const: csiphy0_timer_src
+      - const: csiphy1
+      - const: csiphy1_timer
+      - const: csiphy1_timer_src
+      - const: csiphy2
+      - const: csiphy2_timer
+      - const: csiphy2_timer_src
+      - const: csiphy3
+      - const: csiphy3_timer
+      - const: csiphy3_timer_src
+      - const: csiphy4
+      - const: csiphy4_timer
+      - const: csiphy4_timer_src
+      - const: vfe0_csid
+      - const: vfe0_cphy_rx
+      - const: vfe0
+      - const: vfe0_axi
+      - const: csiphy_rx_src
+      - const: vfe1_csid
+      - const: vfe1_cphy_rx
+      - const: vfe1
+      - const: vfe1_axi
+      - const: vfe2_csid
+      - const: vfe2_cphy_rx
+      - const: vfe2
+      - const: vfe2_axi
+      - const: vfe0_lite_csid
+      - const: vfe0_lite_cphy_rx
+      - const: vfe0_lite
+      - const: vfe1_lite_csid
+      - const: vfe1_lite_cphy_rx
+      - const: vfe1_lite
+      - const: vfe_lite0
+      - const: vfe_lite1
+
+  interrupts:
+    minItems: 15
+    maxItems: 15
+
+  interrupt-names:
+    items:
+      - const: csiphy0
+      - const: csiphy1
+      - const: csiphy2
+      - const: csiphy3
+      - const: csiphy4
+      - const: csid0
+      - const: csid1
+      - const: csid2
+      - const: csid_lite0
+      - const: csid_lite1
+      - const: vfe0
+      - const: vfe1
+      - const: vfe2
+      - const: vfe_lite0
+      - const: vfe_lite1
+
+  iommus:
+    maxItems: 1
+
+  interconnects:
+    minItems: 2
+    maxItems: 2
+
+  interconnect-names:
+    items:
+      - const: cam_ahb
+      - const: cam_hf_0
+
+  power-domains:
+    items:
+      - description: IFE0 GDSC - Image Front End, Global Distributed Switch Controller.
+      - description: IFE1 GDSC - Image Front End, Global Distributed Switch Controller.
+      - description: IFE2 GDSC - Image Front End, Global Distributed Switch Controller.
+      - description: Titan GDSC - Titan ISP Block, Global Distributed Switch Controller.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    description:
+      CSI input ports.
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description:
+          Input port for receiving CSI data.
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              clock-lanes:
+                maxItems: 1
+
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+            required:
+              - clock-lanes
+              - data-lanes
+
+      port@1:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description:
+          Input port for receiving CSI data.
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              clock-lanes:
+                maxItems: 1
+
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+            required:
+              - clock-lanes
+              - data-lanes
+
+      port@2:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description:
+          Input port for receiving CSI data.
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              clock-lanes:
+                maxItems: 1
+
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+            required:
+              - clock-lanes
+              - data-lanes
+
+      port@3:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description:
+          Input port for receiving CSI data.
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              clock-lanes:
+                maxItems: 1
+
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+            required:
+              - clock-lanes
+              - data-lanes
+
+      port@4:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description:
+          Input port for receiving CSI data.
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              clock-lanes:
+                maxItems: 1
+
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+            required:
+              - clock-lanes
+              - data-lanes
+
+      port@5:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description:
+          Input port for receiving CSI data.
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              clock-lanes:
+                maxItems: 1
+
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+            required:
+              - clock-lanes
+              - data-lanes
+
+  reg:
+    minItems: 10
+    maxItems: 10
+
+  reg-names:
+    items:
+      - const: vfe0
+      - const: vfe1
+      - const: vfe2
+      - const: vfe_lite0
+      - const: vfe_lite1
+      - const: csiphy0
+      - const: csiphy1
+      - const: csiphy2
+      - const: csiphy3
+      - const: csiphy4
+
+required:
+  - clock-names
+  - clocks
+  - compatible
+  - interconnects
+  - interconnect-names
+  - interrupts
+  - interrupt-names
+  - iommus
+  - power-domains
+  - reg
+  - reg-names
+
+additionalProperties: false
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/qcom,camcc-sc7280.h>
+    #include <dt-bindings/interconnect/qcom,sc7280.h>
+    #include <dt-bindings/clock/qcom,gcc-sc7280.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        camss: camss@acaf000 {
+            compatible = "qcom,sc7280-camss";
+            reg = <0x0 0x0acaf000 0x0 0x5200>,
+                <0x0 0x0acb6000 0x0 0x5200>,
+                <0x0 0x0acbd000 0x0 0x5200>,
+                <0x0 0x0acc4000 0x0 0x5000>,
+                <0x0 0x0accb000 0x0 0x5000>,
+                <0x0 0x0ace0000 0x0 0x2000>,
+                <0x0 0x0ace2000 0x0 0x2000>,
+                <0x0 0x0ace4000 0x0 0x2000>,
+                <0x0 0x0ace6000 0x0 0x2000>,
+                <0x0 0x0ace8000 0x0 0x2000>;
+
+            reg-names = "vfe0",
+                "vfe1",
+                "vfe2",
+                "vfe_lite0",
+                "vfe_lite1",
+                "csiphy0",
+                "csiphy1",
+                "csiphy2",
+                "csiphy3",
+                "csiphy4";
+
+            interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
+                <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
+                <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
+                <GIC_SPI 448 IRQ_TYPE_EDGE_RISING>,
+                <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>,
+                <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
+                <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
+                <GIC_SPI 640 IRQ_TYPE_EDGE_RISING>,
+                <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
+                <GIC_SPI 359 IRQ_TYPE_EDGE_RISING>,
+                <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
+                <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
+                <GIC_SPI 641 IRQ_TYPE_EDGE_RISING>,
+                <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
+                <GIC_SPI 360 IRQ_TYPE_EDGE_RISING>;
+
+            interrupt-names = "csiphy0",
+                "csiphy1",
+                "csiphy2",
+                "csiphy3",
+                "csiphy4",
+                "csid0",
+                "csid1",
+                "csid2",
+                "csid_lite0",
+                "csid_lite1",
+                "vfe0",
+                "vfe1",
+                "vfe2",
+                "vfe_lite0",
+                "vfe_lite1";
+
+            power-domains = <&camcc CAM_CC_IFE_0_GDSC>,
+                <&camcc CAM_CC_IFE_1_GDSC>,
+                <&camcc CAM_CC_IFE_2_GDSC>,
+                <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+            clocks = <&gcc GCC_CAMERA_HF_AXI_CLK>,
+                <&camcc CAM_CC_SLOW_AHB_CLK_SRC>,
+                <&camcc CAM_CC_CPAS_AHB_CLK>,
+                <&camcc CAM_CC_CAMNOC_AXI_CLK_SRC>,
+                <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+                <&camcc CAM_CC_CSIPHY0_CLK>,
+                <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
+                <&camcc CAM_CC_CSI0PHYTIMER_CLK_SRC>,
+                <&camcc CAM_CC_CSIPHY1_CLK>,
+                <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
+                <&camcc CAM_CC_CSI1PHYTIMER_CLK_SRC>,
+                <&camcc CAM_CC_CSIPHY2_CLK>,
+                <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
+                <&camcc CAM_CC_CSI2PHYTIMER_CLK_SRC>,
+                <&camcc CAM_CC_CSIPHY3_CLK>,
+                <&camcc CAM_CC_CSI3PHYTIMER_CLK>,
+                <&camcc CAM_CC_CSI3PHYTIMER_CLK_SRC>,
+                <&camcc CAM_CC_CSIPHY4_CLK>,
+                <&camcc CAM_CC_CSI4PHYTIMER_CLK>,
+                <&camcc CAM_CC_CSI4PHYTIMER_CLK_SRC>,
+                <&camcc CAM_CC_IFE_0_CSID_CLK>,
+                <&camcc CAM_CC_IFE_0_CPHY_RX_CLK>,
+                <&camcc CAM_CC_IFE_0_CLK>,
+                <&camcc CAM_CC_IFE_0_AXI_CLK>,
+                <&camcc CAM_CC_CPHY_RX_CLK_SRC>,
+                <&camcc CAM_CC_IFE_1_CSID_CLK>,
+                <&camcc CAM_CC_IFE_1_CPHY_RX_CLK>,
+                <&camcc CAM_CC_IFE_1_CLK>,
+                <&camcc CAM_CC_IFE_1_AXI_CLK>,
+                <&camcc CAM_CC_IFE_2_CSID_CLK>,
+                <&camcc CAM_CC_IFE_2_CPHY_RX_CLK>,
+                <&camcc CAM_CC_IFE_2_CLK>,
+                <&camcc CAM_CC_IFE_2_AXI_CLK>,
+                <&camcc CAM_CC_IFE_LITE_0_CSID_CLK>,
+                <&camcc CAM_CC_IFE_LITE_0_CPHY_RX_CLK>,
+                <&camcc CAM_CC_IFE_LITE_0_CLK>,
+                <&camcc CAM_CC_IFE_LITE_1_CSID_CLK>,
+                <&camcc CAM_CC_IFE_LITE_1_CPHY_RX_CLK>,
+                <&camcc CAM_CC_IFE_LITE_1_CLK>,
+                <&camcc CAM_CC_IFE_LITE_0_CLK>,
+                <&camcc CAM_CC_IFE_LITE_1_CLK>;
+
+            clock-names = "cam_hf_axi",
+                "slow_ahb_src",
+                "cpas_ahb",
+                "camnoc_axi_src",
+                "camnoc_axi",
+                "csiphy0",
+                "csiphy0_timer",
+                "csiphy0_timer_src",
+                "csiphy1",
+                "csiphy1_timer",
+                "csiphy1_timer_src",
+                "csiphy2",
+                "csiphy2_timer",
+                "csiphy2_timer_src",
+                "csiphy3",
+                "csiphy3_timer",
+                "csiphy3_timer_src",
+                "csiphy4",
+                "csiphy4_timer",
+                "csiphy4_timer_src",
+                "vfe0_csid",
+                "vfe0_cphy_rx",
+                "vfe0",
+                "vfe0_axi",
+                "csiphy_rx_src",
+                "vfe1_csid",
+                "vfe1_cphy_rx",
+                "vfe1",
+                "vfe1_axi",
+                "vfe2_csid",
+                "vfe2_cphy_rx",
+                "vfe2",
+                "vfe2_axi",
+                "vfe0_lite_csid",
+                "vfe0_lite_cphy_rx",
+                "vfe0_lite",
+                "vfe1_lite_csid",
+                "vfe1_lite_cphy_rx",
+                "vfe1_lite",
+                "vfe_lite0",
+                "vfe_lite1";
+
+            iommus = <&apps_smmu 0x800 0x4e0>;
+
+            interconnect-names = "cam_ahb", "cam_hf_0";
+
+            interconnects = <&gem_noc  MASTER_APPSS_PROC 0 &cnoc2 SLAVE_CAMERA_CFG 0>,
+                <&mmss_noc MASTER_CAMNOC_HF  0 &mc_virt SLAVE_EBI1     0>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                };
+
+                port@1 {
+                    reg = <1>;
+                };
+
+                port@2 {
+                    reg = <2>;
+                };
+
+                port@3 {
+                    reg = <3>;
+                };
+
+                port@4 {
+                    reg = <4>;
+                };
+            };
+        };
+    };

-- 
2.25.1


