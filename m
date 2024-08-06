Return-Path: <linux-i2c+bounces-5172-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2F0949B6E
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Aug 2024 00:42:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 26DAC1F2222A
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Aug 2024 22:42:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05115175D35;
	Tue,  6 Aug 2024 22:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dUinmh4Z"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F008174EDB;
	Tue,  6 Aug 2024 22:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722984160; cv=none; b=orRDbh34W1D19HYaYgjQD8GOQgdRWyFkQo1Ncc2G/YQZoJYBPycwjkg3Yak1tkk4zajfSGNzuV7cEiBr/8VV6z4hST8XWs9z1SasccsUWh6cWqRkP8wD+CGUAIqlD1OYnVe9lRycmfTW4+WF2LxGL3iziEA5HZbdiW/YJLzbUpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722984160; c=relaxed/simple;
	bh=8bctoAvT7pZQ8R4durCBntOt3MEfpWg6QccBHopJ5Zc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UYR5Ak/oLjtJ/iSrBJKotjFJcCcY0ciWDqsK2OXicUZhptorW5+fF5CokrTGkyqd5ZqEe9jEHU1Jagmdfl0RB1zGJftm+AANhv9FF1AuBTxmHmefH6XJekaqFx6cgguv0JJwfJAeiZhq/JMx68LF2sTK7xsWkE6PQBaMTUssPSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dUinmh4Z; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-5c6661bca43so631951eaf.0;
        Tue, 06 Aug 2024 15:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722984158; x=1723588958; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Xejg4yK9/46bzQfIUbH4G5OGkJqvsOtZELZYOC1evo=;
        b=dUinmh4ZFcOP6sIDNQ6ox9Kguk3k+V13eeUS/k+O/srcZPi4Yi7BGYeSfR+uByVg8N
         rzDtFvvxD1BWeaakNSh//idmJLeciQJwuJ6nz7SwMJBdMY+76vsDpCVPKVwn/9EpcQvm
         KXEpvUjnkbWpEonbfHCM9XSAeT2c9KH73DOEGM45kOanQyxRLZAfjszn/fTJdl/0Gq/x
         Wke6p9QvCYVH8l2E7y3RJWxbtPOi+O69PNpY0Z2hDldspgf62mFAu3oDRzCR9lrIRTKp
         QFlf50oZQO4bAuN5dXWelzajWvvuCqUcdTporRg9j/NHBookDECht7X3O/J8OrQzAgXu
         QaQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722984158; x=1723588958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Xejg4yK9/46bzQfIUbH4G5OGkJqvsOtZELZYOC1evo=;
        b=GAkJAGm6HA25jO1N68gsFunVzc09c3Zoc+YAezMrXlIggxS7Zjxyq5cWsk7stOK0TZ
         iGQ9iv5gLrHwfKsvHGIYNhYacKa/xKM9W6c5YWR3JwED07XhIqvcj313VasvhtiAaX3j
         LKPm+yPnhrdbVtQvdtwPNmSVHd1Pbihv2VRniFB9e2RtjrVpxMT2YXJid8dhvopn04Jl
         VrmdQbm6inSZCLxYHEYnSOs0qACgkrEVS1M3KGa097xg0r4JiYyUqouARSkaYml2520M
         w4t/YKYWcl3HUHkkROhnkL9XrsAfU+xHOcB8pLIsB+E8SHYrK4CQQbsY76rONhc0P0be
         m4jQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwlOrqmirGW+utGS0ygGrAW+yEeIKP2GGnecDmS6FY0DP7SqlvjO7wYFuQ4rixkmxqNgBuja3s73BicKdrBRY8Tfz+gamMivpNs5ET8Ce9gZC9+OTfeKqLg4mBYdcaW9KXhlTiJhLFXhGWYRmaMJ69r/SiOuE2LvScprGzfWMy6RodKswW0iGhziabMVT1TfkxAJjiLIgeGkhj0o74O02k8w==
X-Gm-Message-State: AOJu0YxL0Dy4zgEZ2RDwKVgTvmmE8DkoApFhi3mjNMuazngalsXdGmYx
	IJWcNs1s6SMyoi0x4Ymg5yXL0tfe6Stm98zM+739xxxw2DBdqPwG
X-Google-Smtp-Source: AGHT+IGhDQWfgonbTyLDa+6xN/nMSkWWG69eXMoe+MsJfiuqaAt4ZnTtFfZbNG5q7L7/T9noP5j6pA==
X-Received: by 2002:a05:6358:939d:b0:1aa:c492:1d34 with SMTP id e5c5f4694b2df-1af3bb5a5cbmr2410747655d.23.1722984157890;
        Tue, 06 Aug 2024 15:42:37 -0700 (PDT)
Received: from localhost ([2607:fea8:52a3:d200:324c:b818:b179:79b])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bb9c79f3f8sm50960906d6.57.2024.08.06.15.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 15:42:37 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Loic Poulain <loic.poulain@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-i2c@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH 2/4] dt-bindings: media: camss: Add qcom,sdm670-camss
Date: Tue,  6 Aug 2024 18:42:23 -0400
Message-ID: <20240806224219.71623-9-mailingradian@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240806224219.71623-7-mailingradian@gmail.com>
References: <20240806224219.71623-7-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the camera subsystem for the Snapdragon 670.

Adapted from SC8280XP camera subsystem.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 .../bindings/media/qcom,sdm670-camss.yaml     | 353 ++++++++++++++++++
 1 file changed, 353 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml

diff --git a/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
new file mode 100644
index 000000000000..543fad1b5cd7
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
@@ -0,0 +1,353 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,sdm670-camss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SDM670 Camera Subsystem (CAMSS)
+
+maintainers:
+  - Richard Acayan <mailingradian@gmail.com>
+
+description:
+  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
+
+properties:
+  compatible:
+    const: qcom,sdm670-camss
+
+  clocks:
+    maxItems: 33
+
+  clock-names:
+    items:
+      - const: camnoc_axi
+      - const: cpas_ahb
+      - const: cphy_rx_src
+      - const: csi0
+      - const: csi0_src
+      - const: csi1
+      - const: csi1_src
+      - const: csi2
+      - const: csi2_src
+      - const: csiphy0
+      - const: csiphy0_timer
+      - const: csiphy0_timer_src
+      - const: csiphy1
+      - const: csiphy1_timer
+      - const: csiphy1_timer_src
+      - const: csiphy2
+      - const: csiphy2_timer
+      - const: csiphy2_timer_src
+      - const: gcc_camera_ahb
+      - const: gcc_camera_axi
+      - const: slow_ahb_src
+      - const: soc_ahb
+      - const: vfe0_axi
+      - const: vfe0
+      - const: vfe0_cphy_rx
+      - const: vfe0_src
+      - const: vfe1_axi
+      - const: vfe1
+      - const: vfe1_cphy_rx
+      - const: vfe1_src
+      - const: vfe_lite
+      - const: vfe_lite_cphy_rx
+      - const: vfe_lite_src
+
+  interrupts:
+    maxItems: 9
+
+  interrupt-names:
+    items:
+      - const: csid0
+      - const: csid1
+      - const: csid2
+      - const: csiphy0
+      - const: csiphy1
+      - const: csiphy2
+      - const: vfe0
+      - const: vfe1
+      - const: vfe_lite
+
+  iommus:
+    maxItems: 4
+
+  power-domains:
+    items:
+      - description: IFE0 GDSC - Image Front End, Global Distributed Switch Controller.
+      - description: IFE1 GDSC - Image Front End, Global Distributed Switch Controller.
+      - description: Titan Top GDSC - Titan ISP Block, Global Distributed Switch Controller.
+
+  power-domain-names:
+    items:
+      - const: ife0
+      - const: ife1
+      - const: top
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
+          Input port for receiving CSI data from CSIPHY0.
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
+          Input port for receiving CSI data from CSIPHY1.
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
+          Input port for receiving CSI data from CSIPHY2.
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
+    maxItems: 9
+
+  reg-names:
+    items:
+      - const: csid0
+      - const: csid1
+      - const: csid2
+      - const: vfe0
+      - const: csiphy0
+      - const: vfe1
+      - const: csiphy1
+      - const: vfe_lite
+      - const: csiphy2
+
+  vdda-phy-supply:
+    description:
+      Phandle to a regulator supply to PHY core block.
+
+  vdda-pll-supply:
+    description:
+      Phandle to 1.8V regulator supply to PHY refclk pll block.
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
+  - power-domain-names
+  - reg
+  - reg-names
+  - vdda-phy-supply
+  - vdda-pll-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        camss {
+            compatible = "qcom,sdm670-camss";
+
+            reg = <0 0x0ac65000 0 0x1000>,
+                  <0 0x0ac66000 0 0x1000>,
+                  <0 0x0ac67000 0 0x1000>,
+                  <0 0x0acaf000 0 0x4000>,
+                  <0 0x0acb3000 0 0x1000>,
+                  <0 0x0acb6000 0 0x4000>,
+                  <0 0x0acba000 0 0x1000>,
+                  <0 0x0acc4000 0 0x4000>,
+                  <0 0x0acc8000 0 0x1000>;
+            reg-names = "csiphy0",
+                        "csiphy1",
+                        "csiphy2",
+                        "vfe0",
+                        "csid0",
+                        "vfe1",
+                        "csid1",
+                        "vfe_lite",
+                        "csid2";
+
+            interrupts = <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 477 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 479 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-names = "csid0",
+                              "csid1",
+                              "csid2",
+                              "csiphy0",
+                              "csiphy1",
+                              "csiphy2",
+                              "vfe0",
+                              "vfe1",
+                              "vfe_lite";
+
+            clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+                     <&camcc CAM_CC_CPAS_AHB_CLK>,
+                     <&camcc CAM_CC_CPHY_RX_CLK_SRC>,
+                     <&camcc CAM_CC_IFE_0_CSID_CLK>,
+                     <&camcc CAM_CC_IFE_0_CSID_CLK_SRC>,
+                     <&camcc CAM_CC_IFE_1_CSID_CLK>,
+                     <&camcc CAM_CC_IFE_1_CSID_CLK_SRC>,
+                     <&camcc CAM_CC_IFE_LITE_CSID_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_CSID_CLK_SRC>,
+                     <&camcc CAM_CC_CSIPHY0_CLK>,
+                     <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
+                     <&camcc CAM_CC_CSI0PHYTIMER_CLK_SRC>,
+                     <&camcc CAM_CC_CSIPHY1_CLK>,
+                     <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
+                     <&camcc CAM_CC_CSI1PHYTIMER_CLK_SRC>,
+                     <&camcc CAM_CC_CSIPHY2_CLK>,
+                     <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
+                     <&camcc CAM_CC_CSI2PHYTIMER_CLK_SRC>,
+                     <&gcc GCC_CAMERA_AHB_CLK>,
+                     <&gcc GCC_CAMERA_AXI_CLK>,
+                     <&camcc CAM_CC_SLOW_AHB_CLK_SRC>,
+                     <&camcc CAM_CC_SOC_AHB_CLK>,
+                     <&camcc CAM_CC_IFE_0_AXI_CLK>,
+                     <&camcc CAM_CC_IFE_0_CLK>,
+                     <&camcc CAM_CC_IFE_0_CPHY_RX_CLK>,
+                     <&camcc CAM_CC_IFE_0_CLK_SRC>,
+                     <&camcc CAM_CC_IFE_1_AXI_CLK>,
+                     <&camcc CAM_CC_IFE_1_CLK>,
+                     <&camcc CAM_CC_IFE_1_CPHY_RX_CLK>,
+                     <&camcc CAM_CC_IFE_1_CLK_SRC>,
+                     <&camcc CAM_CC_IFE_LITE_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_CLK_SRC>;
+            clock-names = "camnoc_axi",
+                          "cpas_ahb",
+                          "cphy_rx_src",
+                          "csi0",
+                          "csi0_src",
+                          "csi1",
+                          "csi1_src",
+                          "csi2",
+                          "csi2_src",
+                          "csiphy0",
+                          "csiphy0_timer",
+                          "csiphy0_timer_src",
+                          "csiphy1",
+                          "csiphy1_timer",
+                          "csiphy1_timer_src",
+                          "csiphy2",
+                          "csiphy2_timer",
+                          "csiphy2_timer_src",
+                          "gcc_camera_ahb",
+                          "gcc_camera_axi",
+                          "slow_ahb_src",
+                          "soc_ahb",
+                          "vfe0_axi",
+                          "vfe0",
+                          "vfe0_cphy_rx",
+                          "vfe0_src",
+                          "vfe1_axi",
+                          "vfe1",
+                          "vfe1_cphy_rx",
+                          "vfe1_src",
+                          "vfe_lite",
+                          "vfe_lite_cphy_rx",
+                          "vfe_lite_src";
+
+            iommus = <&apps_smmu 0x808 0x0>,
+                     <&apps_smmu 0x810 0x8>,
+                     <&apps_smmu 0xc08 0x0>,
+                     <&apps_smmu 0xc10 0x8>;
+
+            power-domains = <&camcc IFE_0_GDSC>,
+                            <&camcc IFE_1_GDSC>,
+                            <&camcc TITAN_TOP_GDSC>;
+            power-domain-names = "ife0",
+                                 "ife1",
+                                 "top";
+
+            vdda-phy-supply = <&vreg_l1a_1p225>;
+            vdda-pll-supply = <&vreg_l8a_1p8>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    csiphy_ep0: endpoint {
+                        reg = <0>;
+                        clock-lanes = <7>;
+                        data-lanes = <0 1 2 3>;
+                        remote-endpoint = <&front_sensor_ep>;
+                    };
+                };
+            };
+        };
+    };
-- 
2.46.0


