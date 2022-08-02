Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF7A5587F28
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Aug 2022 17:40:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233477AbiHBPkg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 2 Aug 2022 11:40:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231911AbiHBPkS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 2 Aug 2022 11:40:18 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78912130
        for <linux-i2c@vger.kernel.org>; Tue,  2 Aug 2022 08:40:09 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id bx38so6178460ljb.10
        for <linux-i2c@vger.kernel.org>; Tue, 02 Aug 2022 08:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mRLanuME96wPjp8H7M+PfpQzPAMElhMOqOMIo9y5QKw=;
        b=NpaOMVR0Mtb24/vJYjIGZnxs3n5/ZQgj1hh1O2AOPWgK7xaa8iGF5cIkZtWT+LDJ05
         fVuAl84J3xlPMuaWsTZ6XWIGV9ey025dc9DoKRGas+X3EvE4tGzjDyDH4NLN1XS6YAvB
         aun6nn4B+1N1xrUvAaWmYQ6FUsp1z2nHej+pgdX7MBrhDGHcrn2+EDP8hwrFch5SokZ8
         DAsOYctlnUa9aEb4tx1b3ivuKI6Em5i0mFtrKMCQxFGGUs5n58ur2JDSKdsVx0KAP5OY
         4ERDUXaczSbzfGnl9HQB2kZui/5U7kJUvZ62nefS7P8GpRj9ewOmT80sDVLn+QL2MHA0
         EGlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mRLanuME96wPjp8H7M+PfpQzPAMElhMOqOMIo9y5QKw=;
        b=Smj4PJi7v4SHYNYE52WbFeEdLVLZNMVknNmEpHZG8fuGdqfCtlEiuUUNaqDi9eJq97
         eT5WkL5vgn0HT3iBJS5bDNk/GmSBoofUdp5pdlq8OVId/gmLAzqnD3zTbOopKrV2KQAn
         tOOVPLjKg6rS8021SOFCxML3822kEl49PuOzQHwNKYm8LV26Oak40MvPNam4CuImipNk
         oJdT91orfQDAPBmthEX5QgM+2g88QJ/lXVo1uv2+w3o6mH6+xUF/3LG2Fl8sHYu1VOK1
         ImnFuA7hEKt0DyjFI/XE5sCV/nL/LkHg7d0hR8Urb3hltBw7sN/sAtQhzJqhD9ZXQxop
         Hn8A==
X-Gm-Message-State: AJIora9Xq5BeN0lWp/mXa9s8QFRUxBzHXPbiYXwpQLog+plXicvD0kN+
        hH581Ya21QgjigTdrl4zRiNIHQ==
X-Google-Smtp-Source: AGRyM1t2eyl9aw+FQ8cyJR10lGcIFIWZkg6kQRzUt7UwdDIhyJKiUwg6lJCgRz0bsEbLCdANbABLUg==
X-Received: by 2002:a05:651c:50f:b0:25d:9c69:a4e6 with SMTP id o15-20020a05651c050f00b0025d9c69a4e6mr7321814ljp.391.1659454808873;
        Tue, 02 Aug 2022 08:40:08 -0700 (PDT)
Received: from krzk-bin.. ([213.161.169.44])
        by smtp.gmail.com with ESMTPSA id c2-20020a056512074200b0048b06f34566sm407669lfs.76.2022.08.02.08.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Aug 2022 08:40:08 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     corbet@lwn.net,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 5/5] dt-bindings: i2c: qcom,i2c-cci: convert to dtschema
Date:   Tue,  2 Aug 2022 17:39:47 +0200
Message-Id: <20220802153947.44457-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220802153947.44457-1-krzysztof.kozlowski@linaro.org>
References: <20220802153947.44457-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Convert the Qualcomm Camera Control Interface (CCI) I2C controller to DT
schema.  The original bindings were not complete, so this includes
changes:
1. Add address/size-cells.
2. Describe the clocks per variant.
3. Use more descriptive example based on sdm845.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/i2c/i2c-qcom-cci.txt  |  96 -------
 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml | 242 ++++++++++++++++++
 MAINTAINERS                                   |   2 +-
 3 files changed, 243 insertions(+), 97 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml

diff --git a/Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt b/Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt
deleted file mode 100644
index 166865e48849..000000000000
--- a/Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt
+++ /dev/null
@@ -1,96 +0,0 @@
-Qualcomm Camera Control Interface (CCI) I2C controller
-
-PROPERTIES:
-
-- compatible:
-	Usage: required
-	Value type: <string>
-	Definition: must be one of:
-		"qcom,msm8916-cci"
-		"qcom,msm8974-cci"
-		"qcom,msm8996-cci"
-		"qcom,sdm845-cci"
-		"qcom,sm8250-cci"
-		"qcom,sm8450-cci"
-
-- reg
-	Usage: required
-	Value type: <prop-encoded-array>
-	Definition: base address CCI I2C controller and length of memory
-		    mapped region.
-
-- interrupts:
-	Usage: required
-	Value type: <prop-encoded-array>
-	Definition: specifies the CCI I2C interrupt. The format of the
-		    specifier is defined by the binding document describing
-		    the node's interrupt parent.
-
-- clocks:
-	Usage: required
-	Value type: <prop-encoded-array>
-	Definition: a list of phandle, should contain an entry for each
-		    entries in clock-names.
-
-- clock-names
-	Usage: required
-	Value type: <string>
-	Definition: a list of clock names, must include "cci" clock.
-
-- power-domains
-	Usage: required for "qcom,msm8996-cci"
-	Value type: <prop-encoded-array>
-	Definition:
-
-SUBNODES:
-
-The CCI provides I2C masters for one (msm8916) or two i2c busses (msm8974,
-msm8996, sdm845, sm8250 and sm8450), described as subdevices named "i2c-bus@0"
-and "i2c-bus@1".
-
-PROPERTIES:
-
-- reg:
-	Usage: required
-	Value type: <u32>
-	Definition: Index of the CCI bus/master
-
-- clock-frequency:
-	Usage: optional
-	Value type: <u32>
-	Definition: Desired I2C bus clock frequency in Hz, defaults to 100
-		    kHz if omitted.
-
-Example:
-
-	cci@a0c000 {
-		compatible = "qcom,msm8996-cci";
-		#address-cells = <1>;
-		#size-cells = <0>;
-		reg = <0xa0c000 0x1000>;
-		interrupts = <GIC_SPI 295 IRQ_TYPE_EDGE_RISING>;
-		clocks = <&mmcc MMSS_MMAGIC_AHB_CLK>,
-			 <&mmcc CAMSS_TOP_AHB_CLK>,
-			 <&mmcc CAMSS_CCI_AHB_CLK>,
-			 <&mmcc CAMSS_CCI_CLK>,
-			 <&mmcc CAMSS_AHB_CLK>;
-		clock-names = "mmss_mmagic_ahb",
-			      "camss_top_ahb",
-			      "cci_ahb",
-			      "cci",
-			      "camss_ahb";
-
-		i2c-bus@0 {
-			reg = <0>;
-			clock-frequency = <400000>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-		};
-
-		i2c-bus@1 {
-			reg = <1>;
-			clock-frequency = <400000>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
new file mode 100644
index 000000000000..90c9e401229e
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -0,0 +1,242 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/qcom,i2c-cci.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Camera Control Interface (CCI) I2C controller
+
+maintainers:
+  - Loic Poulain <loic.poulain@linaro.org>
+  - Robert Foss <robert.foss@linaro.org>
+
+properties:
+  compatible:
+    enum:
+      - qcom,msm8916-cci
+      - qcom,msm8974-cci
+      - qcom,msm8996-cci
+      - qcom,sdm845-cci
+      - qcom,sm8250-cci
+      - qcom,sm8450-cci
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  clocks:
+    minItems: 4
+    maxItems: 6
+
+  clock-names:
+    minItems: 4
+    maxItems: 6
+
+  interrupts:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  reg:
+    maxItems: 1
+
+patternProperties:
+  "^i2c-bus@[01]$":
+    $ref: /schemas/i2c/i2c-controller.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        maxItems: 1
+
+      clock-frequency:
+        default: 100000
+
+required:
+  - compatible
+  - clock-names
+  - clocks
+  - interrupts
+  - reg
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,msm8996-cci
+    then:
+      required:
+        - power-domains
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,msm8916-cci
+    then:
+      properties:
+        i2c-bus@1: false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,msm8916-cci
+              - qcom,msm8996-cci
+    then:
+      properties:
+        clocks:
+          maxItems: 4
+        clock-names:
+          items:
+            - const: camss_top_ahb
+            - const: cci_ahb
+            - const: cci
+            - const: camss_ahb
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sdm845-cci
+    then:
+      properties:
+        clocks:
+          minItems: 6
+        clock-names:
+          items:
+            - const: camnoc_axi
+            - const: soc_ahb
+            - const: slow_ahb_src
+            - const: cpas_ahb
+            - const: cci
+            - const: cci_src
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sm8250-cci
+    then:
+      properties:
+        clocks:
+          minItems: 5
+          maxItems: 5
+        clock-names:
+          items:
+            - const: camnoc_axi
+            - const: slow_ahb_src
+            - const: cpas_ahb
+            - const: cci
+            - const: cci_src
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,camcc-sdm845.h>
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    cci@ac4a000 {
+        reg = <0x0ac4a000 0x4000>;
+        compatible = "qcom,sdm845-cci";
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        interrupts = <GIC_SPI 460 IRQ_TYPE_EDGE_RISING>;
+        power-domains = <&clock_camcc TITAN_TOP_GDSC>;
+
+        clocks = <&clock_camcc CAM_CC_CAMNOC_AXI_CLK>,
+                 <&clock_camcc CAM_CC_SOC_AHB_CLK>,
+                 <&clock_camcc CAM_CC_SLOW_AHB_CLK_SRC>,
+                 <&clock_camcc CAM_CC_CPAS_AHB_CLK>,
+                 <&clock_camcc CAM_CC_CCI_CLK>,
+                 <&clock_camcc CAM_CC_CCI_CLK_SRC>;
+        clock-names = "camnoc_axi",
+                      "soc_ahb",
+                      "slow_ahb_src",
+                      "cpas_ahb",
+                      "cci",
+                      "cci_src";
+
+        assigned-clocks = <&clock_camcc CAM_CC_CAMNOC_AXI_CLK>,
+                          <&clock_camcc CAM_CC_CCI_CLK>;
+        assigned-clock-rates = <80000000>,
+                               <37500000>;
+
+        pinctrl-names = "default", "sleep";
+        pinctrl-0 = <&cci0_default &cci1_default>;
+        pinctrl-1 = <&cci0_sleep &cci1_sleep>;
+
+        i2c-bus@0 {
+            reg = <0>;
+            clock-frequency = <1000000>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            camera@10 {
+                compatible = "ovti,ov8856";
+                reg = <0x10>;
+
+                reset-gpios = <&tlmm 9 GPIO_ACTIVE_LOW>;
+                pinctrl-names = "default";
+                pinctrl-0 = <&cam0_default>;
+
+                clocks = <&clock_camcc CAM_CC_MCLK0_CLK>;
+                clock-names = "xvclk";
+                clock-frequency = <19200000>;
+
+                dovdd-supply = <&vreg_lvs1a_1p8>;
+                avdd-supply = <&cam0_avdd_2v8>;
+                dvdd-supply = <&cam0_dvdd_1v2>;
+
+                port {
+                    ov8856_ep: endpoint {
+                        link-frequencies = /bits/ 64 <360000000 180000000>;
+                        data-lanes = <1 2 3 4>;
+                        remote-endpoint = <&csiphy0_ep>;
+                    };
+                };
+            };
+        };
+
+        cci_i2c1: i2c-bus@1 {
+            reg = <1>;
+            clock-frequency = <1000000>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            camera@60 {
+                compatible = "ovti,ov7251";
+                reg = <0x60>;
+
+                enable-gpios = <&tlmm 21 GPIO_ACTIVE_HIGH>;
+                pinctrl-names = "default";
+                pinctrl-0 = <&cam3_default>;
+
+                clocks = <&clock_camcc CAM_CC_MCLK3_CLK>;
+                clock-names = "xclk";
+                clock-frequency = <24000000>;
+
+                vdddo-supply = <&vreg_lvs1a_1p8>;
+                vdda-supply = <&cam3_avdd_2v8>;
+
+                port {
+                    ov7251_ep: endpoint {
+                        data-lanes = <0 1>;
+                        remote-endpoint = <&csiphy3_ep>;
+                    };
+                };
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 56af0182a93b..ea0aaf754eaf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16882,7 +16882,7 @@ M:	Robert Foss <robert.foss@linaro.org>
 L:	linux-i2c@vger.kernel.org
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
-F:	Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt
+F:	Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
 F:	drivers/i2c/busses/i2c-qcom-cci.c
 
 QUALCOMM INTERCONNECT BWMON DRIVER
-- 
2.34.1

