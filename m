Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9D594F059B
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Apr 2022 20:41:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354970AbiDBSmo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 2 Apr 2022 14:42:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357268AbiDBSme (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 2 Apr 2022 14:42:34 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D373450066
        for <linux-i2c@vger.kernel.org>; Sat,  2 Apr 2022 11:40:28 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id r64so3522415wmr.4
        for <linux-i2c@vger.kernel.org>; Sat, 02 Apr 2022 11:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Sp/oLqlbge5GU7mZsZW/vx3cnsSFA9iABPk+CXY4wNg=;
        b=uQermoBxdAv6ihdtqTEbNjddI5LOjv2sgP8uaq/x7bM+rs+7OvofhXs1aFzKnXMqXs
         VqZ9BIvz2+6qyO6KrBEjovUZvAY3RjAJXc+uk2MUj4xYKyfTyipQBym0Lyar3l6iTFye
         gMChWkuyapkbpPU8fzvoZ8OzqRq7u7pUS5FWnSvzAjItqng+dJXb48A1IctyOJhTfL0y
         wGc/+JvG2Sx4PcyZlO6YEyO/JEDehtr8sUeWLNLSHNCsIcDfupzDab8ij3duScj2m4YB
         KfFLHIfkAIA7kIhfMJkQOS5xv55ZPFI8q9gLrlD+HUgU2kW+cwQ1eyQTSpOUIbDoi2qt
         /+Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Sp/oLqlbge5GU7mZsZW/vx3cnsSFA9iABPk+CXY4wNg=;
        b=rcEd2VErJewEFImBMMRwmGVZ6a0h7GZw6O/ezoCz8GXb5mJX09tk+YMVhmq/DPKXqt
         8Dzhg7eE4OZU6Y4BJoXz3krywhTyAbZWMfGGnt7w26ouwn+08zglhOAPdbM3FEtdzJRI
         ybNt4e7gbyf2ncDqm9LOuUzviXPlO6nhaWJjJmA3TYlolQ3VfhujFbaFQoM2XxOaRPAH
         PavVxx4Xc8BKiv4n8IKCjoROy8e9Jin31oVYOTaB5Fh2dknISHEwDkXU627clajs8AmK
         qM1xiYrLYa+nqI+7kH+y61TvxRQ6vbIC1fKL0sFHv+JHMYgY/ChEB+4dAsgNh3LfQrjp
         0m4g==
X-Gm-Message-State: AOAM533AUvUnqfAb/fF/oJqEr2QjAAidoiGTvY8Jqvj8ZzLlcCZcpCgC
        vO938+852vFladotqksxTh3okQ==
X-Google-Smtp-Source: ABdhPJzKWhMSetsdvl9+noYgz+2YR/oqaR3HdqGzxC62zE4oTWSrcJcdEMLv0GwYLxCeb80tJWa+MA==
X-Received: by 2002:a05:600c:600a:b0:38c:f953:adc0 with SMTP id az10-20020a05600c600a00b0038cf953adc0mr13523252wmb.188.1648924827120;
        Sat, 02 Apr 2022 11:40:27 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id m20-20020a05600c4f5400b0038b5162260csm6760502wmq.23.2022.04.02.11.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Apr 2022 11:40:26 -0700 (PDT)
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
Subject: [PATCH v3 9/9] dt-bindings: qcom: qcom,gsbi: convert to dtschema
Date:   Sat,  2 Apr 2022 20:40:11 +0200
Message-Id: <20220402184011.132465-10-krzysztof.kozlowski@linaro.org>
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

Convert the Qualcomm General Serial Bus Interface (GSBI) to DT
Schema.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/soc/qcom/qcom,gsbi.txt           |  87 ------------
 .../bindings/soc/qcom/qcom,gsbi.yaml          | 133 ++++++++++++++++++
 2 files changed, 133 insertions(+), 87 deletions(-)
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
index 000000000000..b97e359f3f90
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,gsbi.yaml
@@ -0,0 +1,133 @@
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
+    enum:
+      - qcom,gsbi-v1.0.0
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

