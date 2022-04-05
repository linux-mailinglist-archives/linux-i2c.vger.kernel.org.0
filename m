Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2741C4F235C
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Apr 2022 08:35:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230284AbiDEGhg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 Apr 2022 02:37:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230348AbiDEGhd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 5 Apr 2022 02:37:33 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD3E918B15
        for <linux-i2c@vger.kernel.org>; Mon,  4 Apr 2022 23:35:20 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id l26so8224321ejx.1
        for <linux-i2c@vger.kernel.org>; Mon, 04 Apr 2022 23:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CBvlbU43jHzlylVBNIqHKM031Xg4IT9urGiAHQVtPUQ=;
        b=II3h2PtUIgEV6c5K+3sALeQYfGFWVVfOmHcA+KQYJewDuem5RY1eAAR4hoPWhjJqYs
         1LrqSLJt6tDpxWU3S9XndOtaZKz1DoA2+/AqybjdcNI8/+C3rPgVEuKdO3CeCHWDnubJ
         a6JWFuovkctm1Yy2t6qnq1zgffR3LWt/7tPnSIEoVmKpu5aidJHfq79jwO7GYJTxs+BA
         eTJNRXiyZGeqqGikyCd8iOzPEd3V1BSx1E1FCcpsi7CEfCLXqKln2gHHFnct/QZqVVX9
         CLML1z7QttWQ5VZGVSY05P6b3KPZM1CMyothq7HZ+FORKf18dMFd/xhdO62Fl3ZeJ/mA
         tCzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CBvlbU43jHzlylVBNIqHKM031Xg4IT9urGiAHQVtPUQ=;
        b=ybE6F5u9t23ExhEbW+Mzr4fpEGJz6RM4fhi3rSO1BDIaxM4XpuHeSJ2tFfI7qN1/Xh
         pU9wAJjEWpEZjGUtcpP3+xDVpJHcAbvds5pLRa5ndl6S2RrqLUuFCErABWI2p+Tktlz8
         9bV6RfDsGEY43SF2FUQMRh7PqjsGQZpxWqUjfcgTqzg/ug+dHBinK2tvzQFnN1joGq39
         frKfeWgzTtLr9Ict2IlKqeCL/KaLT4CI98UVJqR8lIVwBoXQXUTBqs2Ks677pYLqC9Sz
         ZPzW22aiz5D7SwpMFr55sDBg4EwbI8m+I/bJ/bLuurLGGjOlwYzSB3tiklkkzTlEJcge
         beNw==
X-Gm-Message-State: AOAM533Z57fF9XeLn9Y5C6K/jhDFigzNTN/dH+Y7j+rvpQqGAjSyhkW9
        NVd9XHUW1IsBJ8yMkkGbfICDkw==
X-Google-Smtp-Source: ABdhPJzuIslR7e62msxXDGKisOMK2+YPFnREc28H4X8PEniBM44xQHZDnA6eym9Q3LGIpL0Gxsuc1Q==
X-Received: by 2002:a17:907:7d89:b0:6e7:fdc1:255b with SMTP id oz9-20020a1709077d8900b006e7fdc1255bmr1986753ejc.340.1649140519232;
        Mon, 04 Apr 2022 23:35:19 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id bs7-20020a056402304700b004197e5d2350sm6086543edb.54.2022.04.04.23.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Apr 2022 23:35:18 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org
Cc:     Kuldeep Singh <singh.kuldeep87k@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v4 9/9] dt-bindings: qcom: qcom,gsbi: convert to dtschema
Date:   Tue,  5 Apr 2022 08:34:51 +0200
Message-Id: <20220405063451.12011-10-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220405063451.12011-1-krzysztof.kozlowski@linaro.org>
References: <20220405063451.12011-1-krzysztof.kozlowski@linaro.org>
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

Convert the Qualcomm General Serial Bus Interface (GSBI) to DT
Schema.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/soc/qcom/qcom,gsbi.txt           |  87 ------------
 .../bindings/soc/qcom/qcom,gsbi.yaml          | 132 ++++++++++++++++++
 2 files changed, 132 insertions(+), 87 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,gsbi.txt
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,gsbi.yaml

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,gsbi.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,gsbi.txt
deleted file mode 100644
index fe1855f09dcc..000000000000
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,gsbi.txt
+++ /dev/null
@@ -1,87 +0,0 @@
-QCOM GSBI (General Serial Bus Interface) Driver
-
-The GSBI controller is modeled as a node with zero or more child nodes, each
-representing a serial sub-node device that is mux'd as part of the GSBI
-configuration settings.  The mode setting will govern the input/output mode of
-the 4 GSBI IOs.
-
-Required properties:
-- compatible:	Should contain "qcom,gsbi-v1.0.0"
-- cell-index:	Should contain the GSBI index
-- reg: Address range for GSBI registers
-- clocks: required clock
-- clock-names: must contain "iface" entry
-- qcom,mode : indicates MUX value for configuration of the serial interface.
-  Please reference dt-bindings/soc/qcom,gsbi.h for valid mux values.
-
-Optional properties:
-- qcom,crci : indicates CRCI MUX value for QUP CRCI ports.  Please reference
-  dt-bindings/soc/qcom,gsbi.h for valid CRCI mux values.
-- syscon-tcsr: indicates phandle of TCSR syscon node.  Required if child uses
-  dma.
-
-Required properties if child node exists:
-- #address-cells: Must be 1
-- #size-cells: Must be 1
-- ranges: Must be present
-
-Properties for children:
-
-A GSBI controller node can contain 0 or more child nodes representing serial
-devices.  These serial devices can be a QCOM UART, I2C controller, spi
-controller, or some combination of aforementioned devices.
-
-See the following for child node definitions:
-Documentation/devicetree/bindings/i2c/qcom,i2c-qup.txt
-Documentation/devicetree/bindings/spi/qcom,spi-qup.txt
-Documentation/devicetree/bindings/serial/qcom,msm-uartdm.txt
-
-Example for APQ8064:
-
-#include <dt-bindings/soc/qcom,gsbi.h>
-
-	gsbi4@16300000 {
-		compatible = "qcom,gsbi-v1.0.0";
-		cell-index = <4>;
-		reg = <0x16300000 0x100>;
-		clocks = <&gcc GSBI4_H_CLK>;
-		clock-names = "iface";
-		#address-cells = <1>;
-		#size-cells = <1>;
-		ranges;
-		qcom,mode = <GSBI_PROT_I2C_UART>;
-		qcom,crci = <GSBI_CRCI_QUP>;
-
-		syscon-tcsr = <&tcsr>;
-
-		/* child nodes go under here */
-
-		i2c_qup4: i2c@16380000 {
-			compatible = "qcom,i2c-qup-v1.1.1";
-			reg = <0x16380000 0x1000>;
-			interrupts = <0 153 0>;
-
-			clocks = <&gcc GSBI4_QUP_CLK>, <&gcc GSBI4_H_CLK>;
-			clock-names = "core", "iface";
-
-			clock-frequency = <200000>;
-
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-		};
-
-		uart4:	serial@16340000 {
-			compatible = "qcom,msm-uartdm-v1.3", "qcom,msm-uartdm";
-			reg = <0x16340000 0x1000>,
-				<0x16300000 0x1000>;
-			interrupts = <0 152 0x0>;
-			clocks = <&gcc GSBI4_UART_CLK>, <&gcc GSBI4_H_CLK>;
-			clock-names = "core", "iface";
-		};
-	};
-
-	tcsr: syscon@1a400000 {
-		compatible = "qcom,apq8064-tcsr", "syscon";
-		reg = <0x1a400000 0x100>;
-	};
diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,gsbi.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,gsbi.yaml
new file mode 100644
index 000000000000..c33704333e49
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,gsbi.yaml
@@ -0,0 +1,132 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/qcom/qcom,gsbi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm General Serial Bus Interface (GSBI)
+
+maintainers:
+  - Andy Gross <agross@kernel.org>
+  - Bjorn Andersson <bjorn.andersson@linaro.org>
+  - Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
+
+description:
+  The GSBI controller is modeled as a node with zero or more child nodes, each
+  representing a serial sub-node device that is mux'd as part of the GSBI
+  configuration settings.  The mode setting will govern the input/output mode
+  of the 4 GSBI IOs.
+
+  A GSBI controller node can contain 0 or more child nodes representing serial
+  devices.  These serial devices can be a QCOM UART, I2C controller, spi
+  controller, or some combination of aforementioned devices.
+
+properties:
+  compatible:
+    const: qcom,gsbi-v1.0.0
+
+  '#address-cells':
+    const: 1
+
+  cell-index:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      The GSBI index.
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: iface
+
+  qcom,crci:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      CRCI MUX value for QUP CRCI ports.  Please reference
+      include/dt-bindings/soc/qcom,gsbi.h for valid CRCI mux values.
+
+  qcom,mode:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      MUX value for configuration of the serial interface.  Please reference
+      include/dt-bindings/soc/qcom,gsbi.h for valid mux values.
+
+  '#size-cells':
+    const: 1
+
+  syscon-tcsr:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle of TCSR syscon node.Required if child uses dma.
+
+  ranges: true
+
+  reg:
+    maxItems: 1
+
+patternProperties:
+  "spi@[0-9a-f]+$":
+    type: object
+    $ref: /schemas/spi/qcom,spi-qup.yaml#
+
+  "i2c@[0-9a-f]+$":
+    type: object
+    $ref: /schemas/i2c/qcom,i2c-qup.yaml#
+
+  "serial@[0-9a-f]+$":
+    type: object
+    $ref: /schemas/serial/qcom,msm-uartdm.yaml#
+
+required:
+  - compatible
+  - cell-index
+  - clocks
+  - clock-names
+  - qcom,mode
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-msm8960.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/soc/qcom,gsbi.h>
+
+    gsbi@12440000 {
+        compatible = "qcom,gsbi-v1.0.0";
+        reg = <0x12440000 0x100>;
+        cell-index = <1>;
+        clocks = <&gcc GSBI1_H_CLK>;
+        clock-names = "iface";
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+
+        syscon-tcsr = <&tcsr>;
+        qcom,mode = <GSBI_PROT_I2C_UART>;
+
+        serial@12450000 {
+            compatible = "qcom,msm-uartdm-v1.3", "qcom,msm-uartdm";
+            reg = <0x12450000 0x100>,
+                  <0x12400000 0x03>;
+            interrupts = <0 193 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&gcc GSBI1_UART_CLK>, <&gcc GSBI1_H_CLK>;
+            clock-names = "core", "iface";
+        };
+
+        i2c@12460000 {
+            compatible = "qcom,i2c-qup-v1.1.1";
+            reg = <0x12460000 0x1000>;
+            pinctrl-0 = <&i2c1_pins>;
+            pinctrl-1 = <&i2c1_pins_sleep>;
+            pinctrl-names = "default", "sleep";
+            interrupts = <0 194 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&gcc GSBI1_QUP_CLK>, <&gcc GSBI1_H_CLK>;
+            clock-names = "core", "iface";
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            status = "disabled"; /* UART chosen */
+        };
+    };
-- 
2.32.0

