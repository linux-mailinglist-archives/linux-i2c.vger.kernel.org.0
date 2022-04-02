Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B96C4F0587
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Apr 2022 20:40:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358783AbiDBSmg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 2 Apr 2022 14:42:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355904AbiDBSme (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 2 Apr 2022 14:42:34 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CCD64ECEA
        for <linux-i2c@vger.kernel.org>; Sat,  2 Apr 2022 11:40:26 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id n35so3519651wms.5
        for <linux-i2c@vger.kernel.org>; Sat, 02 Apr 2022 11:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=risKkAqOEjWleKmnT8bK4h1KlQ5AGYxyoMhBddPo4NY=;
        b=crRmsryJtbKcnhb0bGcpTCYhixdMvRx86AheptFtDOcs7zUDb8AX52Hgz3zpG4YQq0
         enrzShGgZ7acmJQIFgq8btYpe+CcCG+CnD29wqVM2f56VCdiPJUr9bvXPe7nzO85KMLl
         yfSLV/VtX+dMdDd214mGIoVOgWFa3D504YaW47gZPUQqCFVmj94KGo55c5P05JoOnj0z
         5wFOeZ0up4z65FAHe1790YdMLY56ktB4REXDN0ebLzgeYxxjTIahFeTGFgQ1rT+uFeJG
         UOfF+vIMhpE1IIbCp4Nbk5/55l917vSwx+XhZottRV7K+vT5fw+owozOYcnyF5ga/jAT
         Ja1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=risKkAqOEjWleKmnT8bK4h1KlQ5AGYxyoMhBddPo4NY=;
        b=EmyTvS/zUTIRRXvl3TxJMEN5uFl3isyN8uZFScHNH6D0KRUUI/X+reb7aNr3Asu0d/
         Mfc3Ia759g8qrvqkkwrcoyyIbA9vB4tJVj+tL8nirFuXwVz/Hu2UiiCza8bfD1XFt82X
         6xIRSpTU9DYpsleJCCNUQOUjD94lG589PpSQYw6I/ppmLvFIwqAWsGsMYnL7INpxZP0n
         bmXh+P31aOUo+h5MgRqcLphHKR9g7tIg26V7esBPmuMCHVEyEfYr8nrj68BfnJ+R+n3K
         V2k1pV0/zvS8iveFf4jbWETbeDUJrKFluCOb0lkNmF/IhvEuY6ZJZdPpliLVGJJXbW1k
         kEIg==
X-Gm-Message-State: AOAM533ZrmR6Zv6euhlKKr4TJMyFHjo4pXMUtbcylO8FLUs0tqnzGQnH
        U9RMvVpcFxWx1ShUDa2EVemmVtgFZUbXTbN/
X-Google-Smtp-Source: ABdhPJxJQX61Lgc2fAm69igVVaag+E3gYfkAZRc9p6w8zF72MDwfxkT2QRbAS8dxPrqO/W3uXoelLA==
X-Received: by 2002:a7b:c1d3:0:b0:38c:5b15:de91 with SMTP id a19-20020a7bc1d3000000b0038c5b15de91mr13178881wmj.40.1648924824755;
        Sat, 02 Apr 2022 11:40:24 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id m20-20020a05600c4f5400b0038b5162260csm6760502wmq.23.2022.04.02.11.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Apr 2022 11:40:24 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org
Cc:     Kuldeep Singh <singh.kuldeep87k@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 7/9] dt-bindings: serial: qcom,msm-uartdm: convert to dtschema
Date:   Sat,  2 Apr 2022 20:40:09 +0200
Message-Id: <20220402184011.132465-8-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220402184011.132465-1-krzysztof.kozlowski@linaro.org>
References: <20220402184011.132465-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Convert the Qualcomm MSM Serial UARTDM bindings to DT Schema.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/serial/qcom,msm-uartdm.txt       |  81 -------------
 .../bindings/serial/qcom,msm-uartdm.yaml      | 112 ++++++++++++++++++
 2 files changed, 112 insertions(+), 81 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/serial/qcom,msm-uartdm.txt
 create mode 100644 Documentation/devicetree/bindings/serial/qcom,msm-uartdm.yaml

diff --git a/Documentation/devicetree/bindings/serial/qcom,msm-uartdm.txt b/Documentation/devicetree/bindings/serial/qcom,msm-uartdm.txt
deleted file mode 100644
index 9d098cf73b53..000000000000
--- a/Documentation/devicetree/bindings/serial/qcom,msm-uartdm.txt
+++ /dev/null
@@ -1,81 +0,0 @@
-* MSM Serial UARTDM
-
-The MSM serial UARTDM hardware is designed for high-speed use cases where the
-transmit and/or receive channels can be offloaded to a dma-engine. From a
-software perspective it's mostly compatible with the MSM serial UART except
-that it supports reading and writing multiple characters at a time.
-
-Required properties:
-- compatible: Should contain at least "qcom,msm-uartdm".
-              A more specific property should be specified as follows depending
-	      on the version:
-		"qcom,msm-uartdm-v1.1"
-		"qcom,msm-uartdm-v1.2"
-		"qcom,msm-uartdm-v1.3"
-		"qcom,msm-uartdm-v1.4"
-- reg: Should contain UART register locations and lengths. The first
-       register shall specify the main control registers. An optional second
-       register location shall specify the GSBI control region.
-       "qcom,msm-uartdm-v1.3" is the only compatible value that might
-       need the GSBI control region.
-- interrupts: Should contain UART interrupt.
-- clocks: Should contain the core clock and the AHB clock.
-- clock-names: Should be "core" for the core clock and "iface" for the
-	       AHB clock.
-
-Optional properties:
-- dmas: Should contain dma specifiers for transmit and receive channels
-- dma-names: Should contain "tx" for transmit and "rx" for receive channels
-- qcom,tx-crci: Identificator <u32> for Client Rate Control Interface to be
-           used with TX DMA channel. Required when using DMA for transmission
-           with UARTDM v1.3 and below.
-- qcom,rx-crci: Identificator <u32> for Client Rate Control Interface to be
-           used with RX DMA channel. Required when using DMA for reception
-           with UARTDM v1.3 and below.
-
-Note: Aliases may be defined to ensure the correct ordering of the UARTs.
-The alias serialN will result in the UART being assigned port N.  If any
-serialN alias exists, then an alias must exist for each enabled UART.  The
-serialN aliases should be in a .dts file instead of in a .dtsi file.
-
-Examples:
-
-- A uartdm v1.4 device with dma capabilities.
-
-	serial@f991e000 {
-		compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
-		reg = <0xf991e000 0x1000>;
-		interrupts = <0 108 0x0>;
-		clocks = <&blsp1_uart2_apps_cxc>, <&blsp1_ahb_cxc>;
-		clock-names = "core", "iface";
-		dmas = <&dma0 0>, <&dma0 1>;
-		dma-names = "tx", "rx";
-	};
-
-- A uartdm v1.3 device without dma capabilities and part of a GSBI complex.
-
-	serial@19c40000 {
-		compatible = "qcom,msm-uartdm-v1.3", "qcom,msm-uartdm";
-		reg = <0x19c40000 0x1000>,
-		<0x19c00000 0x1000>;
-		interrupts = <0 195 0x0>;
-		clocks = <&gsbi5_uart_cxc>, <&gsbi5_ahb_cxc>;
-		clock-names = "core", "iface";
-	};
-
-- serialN alias.
-
-	aliases {
-		serial0 = &uarta;
-		serial1 = &uartc;
-		serial2 = &uartb;
-	};
-
-	uarta: serial@12490000 {
-	};
-
-	uartb: serial@16340000 {
-	};
-
-	uartc: serial@1a240000 {
-	};
diff --git a/Documentation/devicetree/bindings/serial/qcom,msm-uartdm.yaml b/Documentation/devicetree/bindings/serial/qcom,msm-uartdm.yaml
new file mode 100644
index 000000000000..e73366fe7f7d
--- /dev/null
+++ b/Documentation/devicetree/bindings/serial/qcom,msm-uartdm.yaml
@@ -0,0 +1,112 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/serial/qcom,msm-uartdm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm MSM Serial UARTDM
+
+maintainers:
+  - Andy Gross <agross@kernel.org>
+  - Bjorn Andersson <bjorn.andersson@linaro.org>
+  - Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
+
+description: |
+  The MSM serial UARTDM hardware is designed for high-speed use cases where the
+  transmit and/or receive channels can be offloaded to a dma-engine. From a
+  software perspective it's mostly compatible with the MSM serial UART except
+  that it supports reading and writing multiple characters at a time.
+
+  Note:: Aliases may be defined to ensure the correct ordering of the UARTs.
+  The alias serialN will result in the UART being assigned port N.  If any
+  serialN alias exists, then an alias must exist for each enabled UART.  The
+  serialN aliases should be in a .dts file instead of in a .dtsi file.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - qcom,msm-uartdm-v1.1
+          - qcom,msm-uartdm-v1.2
+          - qcom,msm-uartdm-v1.3
+          - qcom,msm-uartdm-v1.4
+      - const: qcom,msm-uartdm
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: core
+      - const: iface
+
+  dmas:
+    maxItems: 2
+
+  dma-names:
+    items:
+      - const: tx
+      - const: rx
+
+  interrupts:
+    maxItems: 1
+
+  qcom,rx-crci:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Identificator for Client Rate Control Interface to be used with RX DMA
+      channel. Required when using DMA for reception with UARTDM v1.3 and
+      below.
+
+  qcom,tx-crci:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Identificator for Client Rate Control Interface to be used with TX DMA
+      channel. Required when using DMA for transmission with UARTDM v1.3 and
+      below.
+
+  reg:
+    minItems: 1
+    items:
+      - description: Main control registers
+      - description: An optional second register location shall specify the GSBI control region.
+
+required:
+  - compatible
+  - clock-names
+  - clocks
+  - interrupts
+  - reg
+
+unevaluatedProperties: false
+
+allOf:
+  - $ref: /schemas/serial/serial.yaml#
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,msm-uartdm-v1.3
+    then:
+      properties:
+        reg:
+          minItems: 2
+    else:
+      properties:
+        reg:
+          maxItems: 1
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    serial@f991e000 {
+        compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
+        reg = <0xf991e000 0x1000>;
+        interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&blsp1_uart2_apps_cxc>, <&blsp1_ahb_cxc>;
+        clock-names = "core", "iface";
+        dmas = <&dma0 1>, <&dma0 0>;
+        dma-names = "rx", "tx";
+    };
-- 
2.32.0

