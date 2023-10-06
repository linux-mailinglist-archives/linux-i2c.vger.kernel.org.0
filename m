Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3583D7BB73D
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Oct 2023 14:03:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232271AbjJFMC1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 6 Oct 2023 08:02:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232245AbjJFMCY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 6 Oct 2023 08:02:24 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E18A5101
        for <linux-i2c@vger.kernel.org>; Fri,  6 Oct 2023 05:02:11 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-307d58b3efbso1811186f8f.0
        for <linux-i2c@vger.kernel.org>; Fri, 06 Oct 2023 05:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696593730; x=1697198530; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sA3+SU1gK4I9o33maayaRXCk8ucCP93alpAZPFu3cUc=;
        b=jTiAVUjBn4vDqPHGF6rvAaANJVdnl3XDHDqcgjSmAM0djONqJHp1sHgI8hmNlFyh8a
         kYOi/2sKmbqahjx6i2odAa9vxwFtx6JZxwiiC5uSoJSygxvxpnMApy8i3FPDvpXDjN1T
         rV52M30u3fwfvu3nVKJ3x0IkSEXrdra70Po5KE+vbUW/l7tT5Oum7aQ+C+7sYbhTmAsk
         BIihg++JDe6TqCRB/vNHPdwm75UGUEZAXAXJTURu0OcLoiu4aHy0EDzty6P4tOj/5cnj
         jiTXlUJuLyIVPooSfBVETA9juDXEY7e60bCzJkVB+Ze9odlhivYEiuGOi2wuqEXNhy1D
         eSxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696593730; x=1697198530;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sA3+SU1gK4I9o33maayaRXCk8ucCP93alpAZPFu3cUc=;
        b=cQ33LKp0B6rhcSOzliqZRi6VtKt2HjxPP1hdPAty6pJCixwtrSP5wrHaPvERt85MPr
         viXcMgZkF8/o+mgHwOrVI6ihhyCEEf+wspo7zxjeMLviz4zUfkGSjrbKUCsRJGwo2dxg
         QJm9SXpFItRYg26cEeJidb6yselPU6YdPFCUwMmiQz2cxb0gkhs18PkxytiVRkcFjCFK
         Apkdnqg/Larur9r79L1lX6ONM64PihqZw8dz4Fow1LSV9QqJ0db6P3YH0JRK6P1JsaUC
         9NdQKCeNukD1VhulnOipbvhZJ50MiRexG4t+XD78yaOVuV3Ze26rr/OCxsuj5s7Hlnk9
         Zyqg==
X-Gm-Message-State: AOJu0Yx4F+9ojfBeTjzJu9gr8fhQTNRsslpnBYmPCvTlWyfBk6p+S29k
        ooDWjGhTNej3y+foszvSFZaQFQ==
X-Google-Smtp-Source: AGHT+IHy9LbQZfieq53VLHqOgO2kSdt7FA6xals9UjWBFrjHwKAT4xW/aLR+5jaL/ZVIQI7CwHxPKg==
X-Received: by 2002:a5d:6703:0:b0:31f:a16a:aecd with SMTP id o3-20020a5d6703000000b0031fa16aaecdmr6683388wru.68.1696593729479;
        Fri, 06 Oct 2023 05:02:09 -0700 (PDT)
Received: from x13s-linux.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id m8-20020a056000180800b00321773bb933sm1491061wrh.77.2023.10.06.05.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 05:02:09 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        loic.poulain@linaro.org, rfoss@kernel.org, andi.shyti@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, todor.too@gmail.com, mchehab@kernel.org,
        bryan.odonoghue@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] media: dt-bindings: media: camss: Add qcom,sc8280xp-camss binding
Date:   Fri,  6 Oct 2023 13:01:58 +0100
Message-Id: <20231006120159.3413789-5-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231006120159.3413789-1-bryan.odonoghue@linaro.org>
References: <20231006120159.3413789-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add bindings for qcom,sc8280xp-camss in order to support the camera
subsystem for sc8280xp as found in the Lenovo x13s Laptop.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/media/qcom,sc8280xp-camss.yaml   | 598 ++++++++++++++++++
 1 file changed, 598 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml

diff --git a/Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml
new file mode 100644
index 000000000000..46d2da4ad373
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml
@@ -0,0 +1,598 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,sc8280xp-camss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm CAMSS
+
+maintainers:
+  - Bryan O'Donoghue <bryan.odonoghue@linaro.org>
+
+description: |
+  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
+
+properties:
+  compatible:
+    const: qcom,sc8280xp-camss
+
+  clocks:
+    minItems: 63
+    maxItems: 63
+
+  clock-names:
+    items:
+      - const: camnoc_axi
+      - const: camnoc_axi_src
+      - const: cpas_ahb
+      - const: cphy_rx_src
+      - const: csiphy0
+      - const: csiphy0_timer_src
+      - const: csiphy0_timer
+      - const: csiphy1
+      - const: csiphy1_timer_src
+      - const: csiphy1_timer
+      - const: csiphy2
+      - const: csiphy2_timer_src
+      - const: csiphy2_timer
+      - const: csiphy3
+      - const: csiphy3_timer_src
+      - const: csiphy3_timer
+      - const: vfe0_axi
+      - const: vfe0_src
+      - const: vfe0
+      - const: vfe0_cphy_rx
+      - const: vfe0_csid_src
+      - const: vfe0_csid
+      - const: vfe1_axi
+      - const: vfe1_src
+      - const: vfe1
+      - const: vfe1_cphy_rx
+      - const: vfe1_csid_src
+      - const: vfe1_csid
+      - const: vfe2_axi
+      - const: vfe2_src
+      - const: vfe2
+      - const: vfe2_cphy_rx
+      - const: vfe2_csid_src
+      - const: vfe2_csid
+      - const: vfe3_axi
+      - const: vfe3_src
+      - const: vfe3
+      - const: vfe3_cphy_rx
+      - const: vfe3_csid_src
+      - const: vfe3_csid
+      - const: vfe_lite0_src
+      - const: vfe_lite0
+      - const: vfe_lite0_cphy_rx
+      - const: vfe_lite0_csid_src
+      - const: vfe_lite0_csid
+      - const: vfe_lite1_src
+      - const: vfe_lite1
+      - const: vfe_lite1_cphy_rx
+      - const: vfe_lite1_csid_src
+      - const: vfe_lite1_csid
+      - const: vfe_lite2_src
+      - const: vfe_lite2
+      - const: vfe_lite2_cphy_rx
+      - const: vfe_lite2_csid_src
+      - const: vfe_lite2_csid
+      - const: vfe_lite3_src
+      - const: vfe_lite3
+      - const: vfe_lite3_cphy_rx
+      - const: vfe_lite3_csid_src
+      - const: vfe_lite3_csid
+      - const: gcc_axi_hf
+      - const: gcc_axi_sf
+      - const: slow_ahb_src
+
+  interrupts:
+    minItems: 20
+    maxItems: 20
+
+  interrupt-names:
+    items:
+      - const: csid1_lite
+      - const: vfe_lite1
+      - const: csiphy3
+      - const: csid0
+      - const: vfe0
+      - const: csid1
+      - const: vfe1
+      - const: csid0_lite
+      - const: vfe_lite0
+      - const: csiphy0
+      - const: csiphy1
+      - const: csiphy2
+      - const: csid2
+      - const: vfe2
+      - const: csid3_lite
+      - const: csid2_lite
+      - const: vfe_lite3
+      - const: vfe_lite2
+      - const: csid3
+      - const: vfe3
+
+  iommus:
+    minItems: 16
+    maxItems: 16
+
+  interconnects:
+    minItems: 4
+    maxItems: 4
+
+  interconnect-names:
+    items:
+      - const: cam_ahb
+      - const: cam_hf_mnoc
+      - const: cam_sf_mnoc
+      - const: cam_sf_icp_mnoc
+
+  power-domains:
+    items:
+      - description: IFE0 GDSC - Image Front End, Global Distributed Switch Controller.
+      - description: IFE1 GDSC - Image Front End, Global Distributed Switch Controller.
+      - description: IFE2 GDSC - Image Front End, Global Distributed Switch Controller.
+      - description: IFE3 GDSC - Image Front End, Global Distributed Switch Controller.
+      - description: Titan Top GDSC - Titan ISP Block, Global Distributed Switch Controller.
+
+  power-domain-names:
+    items:
+      - description: ife0
+      - description: ife1
+      - description: ife2
+      - description: ife3
+      - description: top
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
+  reg:
+    minItems: 20
+    maxItems: 20
+
+  reg-names:
+    items:
+      - const: csiphy2
+      - const: csiphy3
+      - const: csiphy0
+      - const: csiphy1
+      - const: vfe0
+      - const: csid0
+      - const: vfe1
+      - const: csid1
+      - const: vfe2
+      - const: csid2
+      - const: vfe_lite0
+      - const: csid0_lite
+      - const: vfe_lite1
+      - const: csid1_lite
+      - const: vfe_lite2
+      - const: csid2_lite
+      - const: vfe_lite3
+      - const: csid3_lite
+      - const: vfe3
+      - const: csid3
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
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/qcom,gcc-sc8280xp.h>
+    #include <dt-bindings/clock/qcom,sc8280xp-camcc.h>
+    #include <dt-bindings/interconnect/qcom,sc8280xp.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        camss: camss@ac5a000 {
+            compatible = "qcom,sc8280xp-camss";
+
+            reg = <0 0x0ac5a000 0 0x2000>,
+                  <0 0x0ac5c000 0 0x2000>,
+                  <0 0x0ac65000 0 0x2000>,
+                  <0 0x0ac67000 0 0x2000>,
+                  <0 0x0acaf000 0 0x4000>,
+                  <0 0x0acb3000 0 0x1000>,
+                  <0 0x0acb6000 0 0x4000>,
+                  <0 0x0acba000 0 0x1000>,
+                  <0 0x0acbd000 0 0x4000>,
+                  <0 0x0acc1000 0 0x1000>,
+                  <0 0x0acc4000 0 0x4000>,
+                  <0 0x0acc8000 0 0x1000>,
+                  <0 0x0accb000 0 0x4000>,
+                  <0 0x0accf000 0 0x1000>,
+                  <0 0x0acd2000 0 0x4000>,
+                  <0 0x0acd6000 0 0x1000>,
+                  <0 0x0acd9000 0 0x4000>,
+                  <0 0x0acdd000 0 0x1000>,
+                  <0 0x0ace0000 0 0x4000>,
+                  <0 0x0ace4000 0 0x1000>;
+
+            reg-names = "csiphy2",
+                        "csiphy3",
+                        "csiphy0",
+                        "csiphy1",
+                        "vfe0",
+                        "csid0",
+                        "vfe1",
+                        "csid1",
+                        "vfe2",
+                        "csid2",
+                        "vfe_lite0",
+                        "csid0_lite",
+                        "vfe_lite1",
+                        "csid1_lite",
+                        "vfe_lite2",
+                        "csid2_lite",
+                        "vfe_lite3",
+                        "csid3_lite",
+                        "vfe3",
+                        "csid3";
+
+            vdda-phy-supply = <&vreg_l6d>;
+            vdda-pll-supply = <&vreg_l4d>;
+
+            interrupts = <GIC_SPI 359 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 360 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 448 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 477 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 479 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 640 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 641 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 758 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 759 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 760 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 761 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 762 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 764 IRQ_TYPE_LEVEL_HIGH>;
+
+            interrupt-names = "csid1_lite",
+                              "vfe_lite1",
+                              "csiphy3",
+                              "csid0",
+                              "vfe0",
+                              "csid1",
+                              "vfe1",
+                              "csid0_lite",
+                              "vfe_lite0",
+                              "csiphy0",
+                              "csiphy1",
+                              "csiphy2",
+                              "csid2",
+                              "vfe2",
+                              "csid3_lite",
+                              "csid2_lite",
+                              "vfe_lite3",
+                              "vfe_lite2",
+                              "csid3",
+                              "vfe3";
+
+            power-domains = <&camcc IFE_0_GDSC>,
+                            <&camcc IFE_1_GDSC>,
+                            <&camcc IFE_2_GDSC>,
+                            <&camcc IFE_3_GDSC>,
+                            <&camcc TITAN_TOP_GDSC>;
+
+            power-domain-names = "ife0",
+                                 "ife1",
+                                 "ife2",
+                                 "ife3",
+                                 "top";
+
+            clocks = <&camcc CAMCC_CAMNOC_AXI_CLK>,
+                     <&camcc CAMCC_CAMNOC_AXI_CLK_SRC>,
+                     <&camcc CAMCC_CPAS_AHB_CLK>,
+                     <&camcc CAMCC_CPHY_RX_CLK_SRC>,
+                     <&camcc CAMCC_CSIPHY0_CLK>,
+                     <&camcc CAMCC_CSI0PHYTIMER_CLK_SRC>,
+                     <&camcc CAMCC_CSI0PHYTIMER_CLK>,
+                     <&camcc CAMCC_CSIPHY1_CLK>,
+                     <&camcc CAMCC_CSI1PHYTIMER_CLK_SRC>,
+                     <&camcc CAMCC_CSI1PHYTIMER_CLK>,
+                     <&camcc CAMCC_CSIPHY2_CLK>,
+                     <&camcc CAMCC_CSI2PHYTIMER_CLK_SRC>,
+                     <&camcc CAMCC_CSI2PHYTIMER_CLK>,
+                     <&camcc CAMCC_CSIPHY3_CLK>,
+                     <&camcc CAMCC_CSI3PHYTIMER_CLK_SRC>,
+                     <&camcc CAMCC_CSI3PHYTIMER_CLK>,
+                     <&camcc CAMCC_IFE_0_AXI_CLK>,
+                     <&camcc CAMCC_IFE_0_CLK_SRC>,
+                     <&camcc CAMCC_IFE_0_CLK>,
+                     <&camcc CAMCC_IFE_0_CPHY_RX_CLK>,
+                     <&camcc CAMCC_IFE_0_CSID_CLK_SRC>,
+                     <&camcc CAMCC_IFE_0_CSID_CLK>,
+                     <&camcc CAMCC_IFE_1_AXI_CLK>,
+                     <&camcc CAMCC_IFE_1_CLK_SRC>,
+                     <&camcc CAMCC_IFE_1_CLK>,
+                     <&camcc CAMCC_IFE_1_CPHY_RX_CLK>,
+                     <&camcc CAMCC_IFE_1_CSID_CLK_SRC>,
+                     <&camcc CAMCC_IFE_1_CSID_CLK>,
+                     <&camcc CAMCC_IFE_2_AXI_CLK>,
+                     <&camcc CAMCC_IFE_2_CLK_SRC>,
+                     <&camcc CAMCC_IFE_2_CLK>,
+                     <&camcc CAMCC_IFE_2_CPHY_RX_CLK>,
+                     <&camcc CAMCC_IFE_2_CSID_CLK_SRC>,
+                     <&camcc CAMCC_IFE_2_CSID_CLK>,
+                     <&camcc CAMCC_IFE_3_AXI_CLK>,
+                     <&camcc CAMCC_IFE_3_CLK_SRC>,
+                     <&camcc CAMCC_IFE_3_CLK>,
+                     <&camcc CAMCC_IFE_3_CPHY_RX_CLK>,
+                     <&camcc CAMCC_IFE_3_CSID_CLK_SRC>,
+                     <&camcc CAMCC_IFE_3_CSID_CLK>,
+                     <&camcc CAMCC_IFE_LITE_0_CLK_SRC>,
+                     <&camcc CAMCC_IFE_LITE_0_CLK>,
+                     <&camcc CAMCC_IFE_LITE_0_CPHY_RX_CLK>,
+                     <&camcc CAMCC_IFE_LITE_0_CSID_CLK_SRC>,
+                     <&camcc CAMCC_IFE_LITE_0_CSID_CLK>,
+                     <&camcc CAMCC_IFE_LITE_1_CLK_SRC>,
+                     <&camcc CAMCC_IFE_LITE_1_CLK>,
+                     <&camcc CAMCC_IFE_LITE_1_CPHY_RX_CLK>,
+                     <&camcc CAMCC_IFE_LITE_1_CSID_CLK_SRC>,
+                     <&camcc CAMCC_IFE_LITE_1_CSID_CLK>,
+                     <&camcc CAMCC_IFE_LITE_2_CLK_SRC>,
+                     <&camcc CAMCC_IFE_LITE_2_CLK>,
+                     <&camcc CAMCC_IFE_LITE_2_CPHY_RX_CLK>,
+                     <&camcc CAMCC_IFE_LITE_2_CSID_CLK_SRC>,
+                     <&camcc CAMCC_IFE_LITE_2_CSID_CLK>,
+                     <&camcc CAMCC_IFE_LITE_3_CLK_SRC>,
+                     <&camcc CAMCC_IFE_LITE_3_CLK>,
+                     <&camcc CAMCC_IFE_LITE_3_CPHY_RX_CLK>,
+                     <&camcc CAMCC_IFE_LITE_3_CSID_CLK_SRC>,
+                     <&camcc CAMCC_IFE_LITE_3_CSID_CLK>,
+                     <&gcc GCC_CAMERA_HF_AXI_CLK>,
+                     <&gcc GCC_CAMERA_SF_AXI_CLK>,
+                     <&camcc CAMCC_SLOW_AHB_CLK_SRC>;
+
+            clock-names = "camnoc_axi",
+                          "camnoc_axi_src",
+                          "cpas_ahb",
+                          "cphy_rx_src",
+                          "csiphy0",
+                          "csiphy0_timer_src",
+                          "csiphy0_timer",
+                          "csiphy1",
+                          "csiphy1_timer_src",
+                          "csiphy1_timer",
+                          "csiphy2",
+                          "csiphy2_timer_src",
+                          "csiphy2_timer",
+                          "csiphy3",
+                          "csiphy3_timer_src",
+                          "csiphy3_timer",
+                          "vfe0_axi",
+                          "vfe0_src",
+                          "vfe0",
+                          "vfe0_cphy_rx",
+                          "vfe0_csid_src",
+                          "vfe0_csid",
+                          "vfe1_axi",
+                          "vfe1_src",
+                          "vfe1",
+                          "vfe1_cphy_rx",
+                          "vfe1_csid_src",
+                          "vfe1_csid",
+                          "vfe2_axi",
+                          "vfe2_src",
+                          "vfe2",
+                          "vfe2_cphy_rx",
+                          "vfe2_csid_src",
+                          "vfe2_csid",
+                          "vfe3_axi",
+                          "vfe3_src",
+                          "vfe3",
+                          "vfe3_cphy_rx",
+                          "vfe3_csid_src",
+                          "vfe3_csid",
+                          "vfe_lite0_src",
+                          "vfe_lite0",
+                          "vfe_lite0_cphy_rx",
+                          "vfe_lite0_csid_src",
+                          "vfe_lite0_csid",
+                          "vfe_lite1_src",
+                          "vfe_lite1",
+                          "vfe_lite1_cphy_rx",
+                          "vfe_lite1_csid_src",
+                          "vfe_lite1_csid",
+                          "vfe_lite2_src",
+                          "vfe_lite2",
+                          "vfe_lite2_cphy_rx",
+                          "vfe_lite2_csid_src",
+                          "vfe_lite2_csid",
+                          "vfe_lite3_src",
+                          "vfe_lite3",
+                          "vfe_lite3_cphy_rx",
+                          "vfe_lite3_csid_src",
+                          "vfe_lite3_csid",
+                          "gcc_axi_hf",
+                          "gcc_axi_sf",
+                          "slow_ahb_src";
+
+
+            iommus = <&apps_smmu 0x2000 0x4e0>,
+                     <&apps_smmu 0x2020 0x4e0>,
+                     <&apps_smmu 0x2040 0x4e0>,
+                     <&apps_smmu 0x2060 0x4e0>,
+                     <&apps_smmu 0x2080 0x4e0>,
+                     <&apps_smmu 0x20e0 0x4e0>,
+                     <&apps_smmu 0x20c0 0x4e0>,
+                     <&apps_smmu 0x20a0 0x4e0>,
+                     <&apps_smmu 0x2400 0x4e0>,
+                     <&apps_smmu 0x2420 0x4e0>,
+                     <&apps_smmu 0x2440 0x4e0>,
+                     <&apps_smmu 0x2460 0x4e0>,
+                     <&apps_smmu 0x2480 0x4e0>,
+                     <&apps_smmu 0x24e0 0x4e0>,
+                     <&apps_smmu 0x24c0 0x4e0>,
+                     <&apps_smmu 0x24a0 0x4e0>;
+
+            interconnects = <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_CAMERA_CFG 0>,
+                            <&mmss_noc MASTER_CAMNOC_HF 0 &mc_virt SLAVE_EBI1 0>,
+                            <&mmss_noc MASTER_CAMNOC_SF 0 &mc_virt SLAVE_EBI1 0>,
+                            <&mmss_noc MASTER_CAMNOC_ICP 0 &mc_virt SLAVE_EBI1 0>;
+            interconnect-names = "cam_ahb",
+                                 "cam_hf_mnoc",
+                                 "cam_sf_mnoc",
+                                 "cam_sf_icp_mnoc";
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+                };
+
+                port@1 {
+                    reg = <1>;
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+                };
+
+                port@2 {
+                    reg = <2>;
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+                };
+
+                port@3 {
+                    reg = <3>;
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+                };
+            };
+        };
+    };
-- 
2.40.1

