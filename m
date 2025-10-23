Return-Path: <linux-i2c+bounces-13736-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F21C002A3
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Oct 2025 11:15:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EAB78188BA9F
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Oct 2025 09:15:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B00A92FD7D8;
	Thu, 23 Oct 2025 09:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yj39xjJZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB392FBE0E
	for <linux-i2c@vger.kernel.org>; Thu, 23 Oct 2025 09:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761210889; cv=none; b=RQXIttAJ+Y6A8tuWQug9VC+QjrkTounuIOebDn1m26911iKTlZGUKylMUkmTb1pUnnEoFrKX8c0LYJ7lY3/srY9pZlAO71yZpWQSl8VSQEiQr1lXTKdAUsuutEdXgP7YbTfhbI5coiTbfjHOMiCX7RD7qMM/NJFIKzM5o/2rp2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761210889; c=relaxed/simple;
	bh=//vs5qyC5tzY6Hi//oAaaRHh/IjMO629wyAyFVmdjGc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nC7sUHPG4m3h0bL8Of7FoPgy3O9q7l4pyv7PrvAtu05vXf34aMgAKa+9tDtqr6K6RsYFQf4ucxNqgmFpEvZjceNMhrOHy84QnWexPqopWrdHYAuZpryIsrc2D9hOWBN2Baz237NjDT7QEmrdayFJeRfuQbxRvfAb0pKmY4TA1J4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yj39xjJZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N6KrwE025821
	for <linux-i2c@vger.kernel.org>; Thu, 23 Oct 2025 09:14:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	InVgLQ17lHKS2krRtO9emdUXwoyWzPJt7C37BZwP1ak=; b=Yj39xjJZ6VDHU4io
	95XwDd9UspWh6ObbfjKpf/XH0dD8Np0VOsDKrLz8x1n5BjuK5ReNcSDXgQ3WkzfP
	tN+//dwK4FR81o0LEk7Cp2vwdGzGuoM4PePMDawTqQYW8jRne2M4DWZYvpjXqOKe
	R5E/qezp853XhZtsu7PjrkdWkbuxRC8Y9NKZ7SqzPz00eVF3SeLJUfoatn5fXHU1
	9oZ48MnEPiilZdr/3d5OsbuiomUUmv3305Cp8Ay0YCEJsOcajMQ+Bjjl3qBdNUdH
	LtS8ml5m0f17SiZ1qe1U6FkAPgDX52nViO6CH1LkN5xrfu1HXeiCVy99A5ZHWGLe
	/nqz4g==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v42kfkph-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Thu, 23 Oct 2025 09:14:45 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b6ce25bea3eso444588a12.2
        for <linux-i2c@vger.kernel.org>; Thu, 23 Oct 2025 02:14:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761210885; x=1761815685;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=InVgLQ17lHKS2krRtO9emdUXwoyWzPJt7C37BZwP1ak=;
        b=LC/sXGMZixQUe1CAJUZc6jDzod8InTMZpdKrX10Kopabq3f+SwxaUP2BA/xbgknVLR
         D5DWMRjdDga1yJg0XjSYphqoypvxFVFvHtiKzSz1Kk+vZ27umqOcfn2/MlDVjMw7r2ne
         tXXMF6OjSP6fIR6+7bro/oREcAju0A/4dCtrc5UubuBZ6mRBTY+yuNxJx9+nxzfVYd5X
         pHW3AoENzLzFlHWDxm56LWzmD/n/uzJuOX8znuC5zTvP1KQIZF7L59t9x5pYZBSynVzx
         NsbvC1gRsMw8DGOjbiNN/5prh0AFZVu+OfBla+YZmMZUHAVKNf3N2tzEoKcwX7E1JTk0
         hviw==
X-Gm-Message-State: AOJu0Yx0XHcROm0v6IQLWYOaNov+XXePKPLsjLsrPVb9nNjzyQoEagvi
	H+JPNwPExWSaHxVf54q9GR+JYhnFUCVjRc1BQL5pQZQ05T+99zLF7B1HPJhhOc/e72P7KXodYLX
	5z6yUppzezPHH6uZZfA1YrpPCqVUny7c3mV7tD6w3CMbtL325a03J9qDHdtPHgaM=
X-Gm-Gg: ASbGnctp+G4eX4UJgl7sku/pOaN1MSpK+e944znzQJJm2lma8nzFQtGVy4+ty1fWBis
	sW7NFIBPJ8gbCauN7JsUaOg0lfh2orHPC4EmSaRf8ECUItlWqX3JD4d/1Zafq7Tg7u64Vea7FXo
	RGzBGb+nDu22Jkwz++DAJ46wvlureNs7y+A3mlY+R3mPITE+OwHshY7Wg3np5MTZ5RzrcXiO4nF
	9//oiWjIDijaijtZ/n+nX9fVR2kWhTmPN2P7cNIrhgO9xX1YQC0N+yrg6c7dW75ANVgYwSv+2Mp
	yZvD5c5p5NZ6ziCKf2bUbaQQ1Gydbjh9cdYJCpl/TTSMphfSWpxjdMDlWKzWcjTt06wRFiq97W7
	F8JP2JCmZPw1fLVf5AHO1aiKfnPjqB/zDUcTNuv2xRs4A/w7wBqNDwQ==
X-Received: by 2002:a05:6a21:998f:b0:251:2a11:e61 with SMTP id adf61e73a8af0-334a8532b39mr32354747637.17.1761210884551;
        Thu, 23 Oct 2025 02:14:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHG7LV99CBMm4KjrP/AmsknharA0RRmzGW7D6pp6OfJNiZ1UNT262YA+yG3d6ZRsbgOyia5ag==
X-Received: by 2002:a05:6a21:998f:b0:251:2a11:e61 with SMTP id adf61e73a8af0-334a8532b39mr32354700637.17.1761210884016;
        Thu, 23 Oct 2025 02:14:44 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6cf4e318a2sm1490081a12.33.2025.10.23.02.14.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 02:14:43 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Thu, 23 Oct 2025 02:14:34 -0700
Subject: [PATCH v3 2/6] dt-bindings: media: camss: Add qcom,kaanapali-camss
 binding
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251023-add-support-for-camss-on-kaanapali-v3-2-02abc9a107bf@oss.qualcomm.com>
References: <20251023-add-support-for-camss-on-kaanapali-v3-0-02abc9a107bf@oss.qualcomm.com>
In-Reply-To: <20251023-add-support-for-camss-on-kaanapali-v3-0-02abc9a107bf@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: 4SGfgWthTl8bVR3yhDa0YDFiAxdDVTNV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAzMSBTYWx0ZWRfX28Ls20AnFHXh
 KUTwezudb9t8pLFobnf1BeyVE2J+koyjxc8LfbEDy0QHwZ5/8Kl4mgtfQ0aa3u37nRvQElk/fqi
 szbnuiy9w2w2VbWVrboEmHx9knU1LsgcCRefURxdWmZiBrxLXZV/srH5fu9yFxdf4EcQu/CTJyI
 MDjSeQArUx8tpWa+nxZyIS533APXjXxBEwej6nNRdkaJechweGHhOowhxZWbC8qGdcOCuda8IlZ
 +bicXWY+2/F3cJTTf7js1XUI6zwnsZ7sN+8eOjthTtbfWnk8OcG+JToskFj6cE58oyWw1sFnbje
 GCLt2cItSHkSvQVqas+WzwCYc46sndJM83XtgQ1k8UcD3cf+vu5FE5niTvIon7b8pKa1LOBDIqG
 KvHC8GR0MyN5MkaqZsOrk9M4wRJjnQ==
X-Authority-Analysis: v=2.4 cv=QYNrf8bv c=1 sm=1 tr=0 ts=68f9f205 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=2cgThBgHkgOnM4IxGdMA:9
 a=CrRsnYyEDPKn3pUz:21 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: 4SGfgWthTl8bVR3yhDa0YDFiAxdDVTNV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180031

Add bindings for qcom,kaanapali-camss in order to support the camera
subsystem for Kaanapali.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 .../bindings/media/qcom,kaanapali-camss.yaml       | 369 +++++++++++++++++++++
 1 file changed, 369 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml b/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml
new file mode 100644
index 000000000000..82f427bd036b
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml
@@ -0,0 +1,369 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,kaanapali-camss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Kaanapali Camera Subsystem (CAMSS)
+
+maintainers:
+  - Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
+
+description:
+  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
+
+properties:
+  compatible:
+    const: qcom,kaanapali-camss
+
+  reg:
+    maxItems: 16
+
+  reg-names:
+    items:
+      - const: csid0
+      - const: csid1
+      - const: csid2
+      - const: csid_lite0
+      - const: csid_lite1
+      - const: csiphy0
+      - const: csiphy1
+      - const: csiphy2
+      - const: csiphy3
+      - const: csiphy4
+      - const: csiphy5
+      - const: vfe0
+      - const: vfe1
+      - const: vfe2
+      - const: vfe_lite0
+      - const: vfe_lite1
+
+  clocks:
+    maxItems: 34
+
+  clock-names:
+    items:
+      - const: camnoc_nrt_axi
+      - const: camnoc_rt_axi
+      - const: camnoc_rt_vfe0
+      - const: camnoc_rt_vfe1
+      - const: camnoc_rt_vfe2
+      - const: camnoc_rt_vfe_lite
+      - const: cam_top_ahb
+      - const: cam_top_fast_ahb
+      - const: csid
+      - const: csid_csiphy_rx
+      - const: csiphy0
+      - const: csiphy0_timer
+      - const: csiphy1
+      - const: csiphy1_timer
+      - const: csiphy2
+      - const: csiphy2_timer
+      - const: csiphy3
+      - const: csiphy3_timer
+      - const: csiphy4
+      - const: csiphy4_timer
+      - const: csiphy5
+      - const: csiphy5_timer
+      - const: gcc_hf_axi
+      - const: qdss_debug_xo
+      - const: vfe0
+      - const: vfe0_fast_ahb
+      - const: vfe1
+      - const: vfe1_fast_ahb
+      - const: vfe2
+      - const: vfe2_fast_ahb
+      - const: vfe_lite
+      - const: vfe_lite_ahb
+      - const: vfe_lite_cphy_rx
+      - const: vfe_lite_csid
+
+  interrupts:
+    maxItems: 16
+
+  interrupt-names:
+    items:
+      - const: csid0
+      - const: csid1
+      - const: csid2
+      - const: csid_lite0
+      - const: csid_lite1
+      - const: csiphy0
+      - const: csiphy1
+      - const: csiphy2
+      - const: csiphy3
+      - const: csiphy4
+      - const: csiphy5
+      - const: vfe0
+      - const: vfe1
+      - const: vfe2
+      - const: vfe_lite0
+      - const: vfe_lite1
+
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    items:
+      - const: ahb
+      - const: hf_mnoc
+
+  iommus:
+    maxItems: 1
+
+  power-domains:
+    items:
+      - description:
+          TFE0 GDSC - Thin Front End, Global Distributed Switch Controller.
+      - description:
+          TFE1 GDSC - Thin Front End, Global Distributed Switch Controller.
+      - description:
+          TFE2 GDSC - Thin Front End, Global Distributed Switch Controller.
+      - description:
+          Titan GDSC - Titan ISP Block Global Distributed Switch Controller.
+
+  power-domain-names:
+    items:
+      - const: tfe0
+      - const: tfe1
+      - const: tfe2
+      - const: top
+
+  vdd-csiphy-0p8-supply:
+    description:
+      Phandle to a 0.8V regulator supply to CSI PHYs core block.
+
+  vdd-csiphy-1p2-supply:
+    description:
+      Phandle to 1.2V regulator supply to CSI PHYs pll block.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    description:
+      CSI input ports.
+
+    patternProperties:
+      "^port@[0-3]$":
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description:
+          Input port for receiving CSI data on CSI0.
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+            required:
+              - data-lanes
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - interrupts
+  - interrupt-names
+  - interconnects
+  - interconnect-names
+  - iommus
+  - power-domains
+  - power-domain-names
+  - vdd-csiphy-0p8-supply
+  - vdd-csiphy-1p2-supply
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interconnect/qcom,icc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        camss: isp@9253000 {
+            compatible = "qcom,kaanapali-camss";
+
+            reg = <0x0 0x09253000 0x0 0x5e80>,
+                  <0x0 0x09263000 0x0 0x5e80>,
+                  <0x0 0x09273000 0x0 0x5e80>,
+                  <0x0 0x092d3000 0x0 0x3880>,
+                  <0x0 0x092e7000 0x0 0x3880>,
+                  <0x0 0x09523000 0x0 0x2000>,
+                  <0x0 0x09525000 0x0 0x2000>,
+                  <0x0 0x09527000 0x0 0x2000>,
+                  <0x0 0x09529000 0x0 0x2000>,
+                  <0x0 0x0952b000 0x0 0x2000>,
+                  <0x0 0x0952d000 0x0 0x2000>,
+                  <0x0 0x09151000 0x0 0x20000>,
+                  <0x0 0x09171000 0x0 0x20000>,
+                  <0x0 0x09191000 0x0 0x20000>,
+                  <0x0 0x092dc000 0x0 0x1300>,
+                  <0x0 0x092f0000 0x0 0x1300>;
+            reg-names = "csid0",
+                        "csid1",
+                        "csid2",
+                        "csid_lite0",
+                        "csid_lite1",
+                        "csiphy0",
+                        "csiphy1",
+                        "csiphy2",
+                        "csiphy3",
+                        "csiphy4",
+                        "csiphy5",
+                        "vfe0",
+                        "vfe1",
+                        "vfe2",
+                        "vfe_lite0",
+                        "vfe_lite1";
+
+            clocks = <&camcc_cam_cc_camnoc_nrt_axi_clk>,
+                     <&camcc_cam_cc_camnoc_rt_axi_clk>,
+                     <&camcc_cam_cc_camnoc_rt_tfe_0_main_clk>,
+                     <&camcc_cam_cc_camnoc_rt_tfe_1_main_clk>,
+                     <&camcc_cam_cc_camnoc_rt_tfe_2_main_clk>,
+                     <&camcc_cam_cc_camnoc_rt_ife_lite_clk>,
+                     <&camcc_cam_cc_cam_top_ahb_clk>,
+                     <&camcc_cam_cc_cam_top_fast_ahb_clk>,
+                     <&camcc_cam_cc_csid_clk>,
+                     <&camcc_cam_cc_csid_csiphy_rx_clk>,
+                     <&camcc_cam_cc_csiphy0_clk>,
+                     <&camcc_cam_cc_csi0phytimer_clk>,
+                     <&camcc_cam_cc_csiphy1_clk>,
+                     <&camcc_cam_cc_csi1phytimer_clk>,
+                     <&camcc_cam_cc_csiphy2_clk>,
+                     <&camcc_cam_cc_csi2phytimer_clk>,
+                     <&camcc_cam_cc_csiphy3_clk>,
+                     <&camcc_cam_cc_csi3phytimer_clk>,
+                     <&camcc_cam_cc_csiphy4_clk>,
+                     <&camcc_cam_cc_csi4phytimer_clk>,
+                     <&camcc_cam_cc_csiphy5_clk>,
+                     <&camcc_cam_cc_csi5phytimer_clk>,
+                     <&gcc_gcc_camera_hf_axi_clk>,
+                     <&camcc_cam_cc_qdss_debug_xo_clk>,
+                     <&camcc_cam_cc_tfe_0_main_clk>,
+                     <&camcc_cam_cc_tfe_0_main_fast_ahb_clk>,
+                     <&camcc_cam_cc_tfe_1_main_clk>,
+                     <&camcc_cam_cc_tfe_1_main_fast_ahb_clk>,
+                     <&camcc_cam_cc_tfe_2_main_clk>,
+                     <&camcc_cam_cc_tfe_2_main_fast_ahb_clk>,
+                     <&camcc_cam_cc_ife_lite_clk>,
+                     <&camcc_cam_cc_ife_lite_ahb_clk>,
+                     <&camcc_cam_cc_ife_lite_cphy_rx_clk>,
+                     <&camcc_cam_cc_ife_lite_csid_clk>;
+
+            clock-names = "camnoc_nrt_axi",
+                          "camnoc_rt_axi",
+                          "camnoc_rt_vfe0",
+                          "camnoc_rt_vfe1",
+                          "camnoc_rt_vfe2",
+                          "camnoc_rt_vfe_lite",
+                          "cam_top_ahb",
+                          "cam_top_fast_ahb",
+                          "csid",
+                          "csid_csiphy_rx",
+                          "csiphy0",
+                          "csiphy0_timer",
+                          "csiphy1",
+                          "csiphy1_timer",
+                          "csiphy2",
+                          "csiphy2_timer",
+                          "csiphy3",
+                          "csiphy3_timer",
+                          "csiphy4",
+                          "csiphy4_timer",
+                          "csiphy5",
+                          "csiphy5_timer",
+                          "gcc_hf_axi",
+                          "qdss_debug_xo",
+                          "vfe0",
+                          "vfe0_fast_ahb",
+                          "vfe1",
+                          "vfe1_fast_ahb",
+                          "vfe2",
+                          "vfe2_fast_ahb",
+                          "vfe_lite",
+                          "vfe_lite_ahb",
+                          "vfe_lite_cphy_rx",
+                          "vfe_lite_csid";
+
+            interrupts = <GIC_SPI 601 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 603 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 605 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 376 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 448 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 89 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 433 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 436 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 457 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 606 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 377 IRQ_TYPE_EDGE_RISING>;
+            interrupt-names = "csid0",
+                              "csid1",
+                              "csid2",
+                              "csid_lite0",
+                              "csid_lite1",
+                              "csiphy0",
+                              "csiphy1",
+                              "csiphy2",
+                              "csiphy3",
+                              "csiphy4",
+                              "csiphy5",
+                              "vfe0",
+                              "vfe1",
+                              "vfe2",
+                              "vfe_lite0",
+                              "vfe_lite1";
+
+            interconnects = <&gem_noc_master_appss_proc QCOM_ICC_TAG_ACTIVE_ONLY
+                             &config_noc_slave_camera_cfg QCOM_ICC_TAG_ACTIVE_ONLY>,
+                            <&mmss_noc_master_camnoc_hf QCOM_ICC_TAG_ALWAYS
+                             &mc_virt_slave_ebi1 QCOM_ICC_TAG_ALWAYS>;
+            interconnect-names = "ahb",
+                                 "hf_mnoc";
+
+            iommus = <&apps_smmu 0x1c00 0x00>;
+
+            power-domains = <&camcc_cam_cc_tfe_0_gdsc>,
+                            <&camcc_cam_cc_tfe_1_gdsc>,
+                            <&camcc_cam_cc_tfe_2_gdsc>,
+                            <&camcc_cam_cc_titan_top_gdsc>;
+            power-domain-names = "tfe0",
+                                 "tfe1",
+                                 "tfe2",
+                                 "top";
+
+            vdd-csiphy-0p8-supply = <&csiphy_0p8_supply>;
+            vdd-csiphy-1p2-supply = <&csiphy_1p2_supply>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+
+                    csiphy_ep0: endpoint {
+                        data-lanes = <0 1>;
+                        remote-endpoint = <&sensor_ep>;
+                    };
+                };
+            };
+        };
+    };

-- 
2.34.1


