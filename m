Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 569F3530474
	for <lists+linux-i2c@lfdr.de>; Sun, 22 May 2022 18:28:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346616AbiEVQ21 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 22 May 2022 12:28:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243694AbiEVQ2X (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 22 May 2022 12:28:23 -0400
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FE2E14087;
        Sun, 22 May 2022 09:28:19 -0700 (PDT)
Received: from g550jk.arnhem.chello.nl (a246182.upc-a.chello.nl [62.163.246.182])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 10579CCD2E;
        Sun, 22 May 2022 16:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1653236896; bh=EYhJQ3zWTulE41T2N72ykAggT09j3zyFPWoji/hdbwE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=cNlA50cyRZbv+u0T2TeGH5BINL6PKlmu1z/myopBKlIvzl850rKwWDJ6wxCwzpJTC
         aIqL/bzephBRoMPWRBbml8k1m576+8kx2YY38YKQaburllRqFumfGXYJxr+7Q4ejdS
         mx7CK9AbwBxZDTocTa3hiZdDgLBVC3/wnxHYURkE=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Todor Tomov <todor.too@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        matti.lehtimaki@gmail.com, Luca Weiss <luca@z3ntu.xyz>
Subject: [RFC PATCH 01/14] media: dt-bindings: media: camss: Add qcom,msm8974-camss binding
Date:   Sun, 22 May 2022 18:27:49 +0200
Message-Id: <20220522162802.208275-2-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220522162802.208275-1-luca@z3ntu.xyz>
References: <20220522162802.208275-1-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FROM_SUSPICIOUS_NTLD,
        PDS_OTHER_BAD_TLD,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Matti Lehtimäki <matti.lehtimaki@gmail.com>

Add bindings for qcom,msm8974-camss in order to support the camera
subsystem on MSM8974.

Signed-off-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 .../bindings/media/qcom,msm8974-camss.yaml    | 321 ++++++++++++++++++
 1 file changed, 321 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,msm8974-camss.yaml

diff --git a/Documentation/devicetree/bindings/media/qcom,msm8974-camss.yaml b/Documentation/devicetree/bindings/media/qcom,msm8974-camss.yaml
new file mode 100644
index 000000000000..f8f71e477535
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,msm8974-camss.yaml
@@ -0,0 +1,321 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/media/qcom,msm8974-camss.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Qualcomm CAMSS ISP
+
+maintainers:
+  - Robert Foss <robert.foss@linaro.org>
+
+description: |
+  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms
+
+properties:
+  compatible:
+    const: qcom,msm8974-camss
+
+  clocks:
+    minItems: 31
+    maxItems: 31
+
+  clock-names:
+    items:
+      - const: top_ahb
+      - const: ispif_ahb
+      - const: csiphy0_timer
+      - const: csiphy1_timer
+      - const: csiphy2_timer
+      - const: csi0_ahb
+      - const: csi0
+      - const: csi0_phy
+      - const: csi0_pix
+      - const: csi0_rdi
+      - const: csi1_ahb
+      - const: csi1
+      - const: csi1_phy
+      - const: csi1_pix
+      - const: csi1_rdi
+      - const: csi2_ahb
+      - const: csi2
+      - const: csi2_phy
+      - const: csi2_pix
+      - const: csi2_rdi
+      - const: csi3_ahb
+      - const: csi3
+      - const: csi3_phy
+      - const: csi3_pix
+      - const: csi3_rdi
+      - const: vfe0
+      - const: vfe1
+      - const: csi_vfe0
+      - const: csi_vfe1
+      - const: iface
+      - const: bus
+
+  interrupts:
+    minItems: 10
+    maxItems: 10
+
+  interrupt-names:
+    items:
+      - const: csiphy0
+      - const: csiphy1
+      - const: csiphy2
+      - const: csid0
+      - const: csid1
+      - const: csid2
+      - const: csid3
+      - const: ispif
+      - const: vfe0
+      - const: vfe1
+
+  power-domains:
+    items:
+      - description: VFE GDSC - Video Front End, Global Distributed Switch Controller.
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
+                items:
+                  - const: 1
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
+                items:
+                  - const: 1
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
+                items:
+                  - const: 1
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
+    minItems: 14
+    maxItems: 14
+
+  reg-names:
+    items:
+      - const: csiphy0
+      - const: csiphy0_clk_mux
+      - const: csiphy1
+      - const: csiphy1_clk_mux
+      - const: csiphy2
+      - const: csiphy2_clk_mux
+      - const: csid0
+      - const: csid1
+      - const: csid2
+      - const: csid3
+      - const: ispif
+      - const: csi_clk_mux
+      - const: vfe0
+      - const: vfe1
+
+  vdda-supply:
+    description:
+      Definition of the regulator used as analog power supply.
+
+required:
+  - clock-names
+  - clocks
+  - compatible
+  - interrupt-names
+  - interrupts
+  - power-domains
+  - reg
+  - reg-names
+  - vdda-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/qcom,gcc-msm8974.h>
+    #include <dt-bindings/clock/qcom,mmcc-msm8974.h>
+    camss@fda00000 {
+        compatible = "qcom,msm8974-camss";
+        reg = <0xfda0ac00 0x200>,
+              <0xfda00030 0x4>,
+              <0xfda0b000 0x200>,
+              <0xfda00038 0x4>,
+              <0xfda0b400 0x200>,
+              <0xfda00040 0x4>,
+              <0xfda08000 0x100>,
+              <0xfda08400 0x100>,
+              <0xfda08800 0x100>,
+              <0xfda08c00 0x100>,
+              <0xfda0a000 0x800>,
+              <0xfda00020 0x10>,
+              <0xfda10000 0x1000>,
+              <0xfda14000 0x1000>;
+        reg-names = "csiphy0",
+                    "csiphy0_clk_mux",
+                    "csiphy1",
+                    "csiphy1_clk_mux",
+                    "csiphy2",
+                    "csiphy2_clk_mux",
+                    "csid0",
+                    "csid1",
+                    "csid2",
+                    "csid3",
+                    "ispif",
+                    "csi_clk_mux",
+                    "vfe0",
+                    "vfe1";
+        interrupts = <GIC_SPI 78 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 79 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 80 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 51 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 52 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 53 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 54 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 55 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 57 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 58 IRQ_TYPE_EDGE_RISING>;
+        interrupt-names = "csiphy0",
+                          "csiphy1",
+                          "csiphy2",
+                          "csid0",
+                          "csid1",
+                          "csid2",
+                          "csid3",
+                          "ispif",
+                          "vfe0",
+                          "vfe1";
+        power-domains = <&mmcc CAMSS_VFE_GDSC>;
+        clocks = <&mmcc CAMSS_TOP_AHB_CLK>,
+                 <&mmcc CAMSS_ISPIF_AHB_CLK>,
+                 <&mmcc CAMSS_PHY0_CSI0PHYTIMER_CLK>,
+                 <&mmcc CAMSS_PHY1_CSI1PHYTIMER_CLK>,
+                 <&mmcc CAMSS_PHY2_CSI2PHYTIMER_CLK>,
+                 <&mmcc CAMSS_CSI0_AHB_CLK>,
+                 <&mmcc CAMSS_CSI0_CLK>,
+                 <&mmcc CAMSS_CSI0PHY_CLK>,
+                 <&mmcc CAMSS_CSI0PIX_CLK>,
+                 <&mmcc CAMSS_CSI0RDI_CLK>,
+                 <&mmcc CAMSS_CSI1_AHB_CLK>,
+                 <&mmcc CAMSS_CSI1_CLK>,
+                 <&mmcc CAMSS_CSI1PHY_CLK>,
+                 <&mmcc CAMSS_CSI1PIX_CLK>,
+                 <&mmcc CAMSS_CSI1RDI_CLK>,
+                 <&mmcc CAMSS_CSI2_AHB_CLK>,
+                 <&mmcc CAMSS_CSI2_CLK>,
+                 <&mmcc CAMSS_CSI2PHY_CLK>,
+                 <&mmcc CAMSS_CSI2PIX_CLK>,
+                 <&mmcc CAMSS_CSI2RDI_CLK>,
+                 <&mmcc CAMSS_CSI3_AHB_CLK>,
+                 <&mmcc CAMSS_CSI3_CLK>,
+                 <&mmcc CAMSS_CSI3PHY_CLK>,
+                 <&mmcc CAMSS_CSI3PIX_CLK>,
+                 <&mmcc CAMSS_CSI3RDI_CLK>,
+                 <&mmcc CAMSS_VFE_VFE0_CLK>,
+                 <&mmcc CAMSS_VFE_VFE1_CLK>,
+                 <&mmcc CAMSS_CSI_VFE0_CLK>,
+                 <&mmcc CAMSS_CSI_VFE1_CLK>,
+                 <&mmcc CAMSS_VFE_VFE_AHB_CLK>,
+                 <&mmcc CAMSS_VFE_VFE_AXI_CLK>;
+        clock-names = "top_ahb",
+                      "ispif_ahb",
+                      "csiphy0_timer",
+                      "csiphy1_timer",
+                      "csiphy2_timer",
+                      "csi0_ahb",
+                      "csi0",
+                      "csi0_phy",
+                      "csi0_pix",
+                      "csi0_rdi",
+                      "csi1_ahb",
+                      "csi1",
+                      "csi1_phy",
+                      "csi1_pix",
+                      "csi1_rdi",
+                      "csi2_ahb",
+                      "csi2",
+                      "csi2_phy",
+                      "csi2_pix",
+                      "csi2_rdi",
+                      "csi3_ahb",
+                      "csi3",
+                      "csi3_phy",
+                      "csi3_pix",
+                      "csi3_rdi",
+                      "vfe0",
+                      "vfe1",
+                      "csi_vfe0",
+                      "csi_vfe1",
+                      "iface",
+                      "bus";
+
+        vdda-supply = <&pm8941_l12>;
+
+        ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+        };
+    };
-- 
2.36.0

