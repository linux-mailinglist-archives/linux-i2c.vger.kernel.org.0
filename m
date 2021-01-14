Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A283A2F68E3
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Jan 2021 19:08:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729830AbhANSFO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 14 Jan 2021 13:05:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729828AbhANSFO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 14 Jan 2021 13:05:14 -0500
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it [IPv6:2001:4b7a:2000:18::164])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4B24C0613CF;
        Thu, 14 Jan 2021 10:04:18 -0800 (PST)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 436DC1F4EA;
        Thu, 14 Jan 2021 19:04:17 +0100 (CET)
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
To:     agross@kernel.org
Cc:     linux-kernel@vger.kernel.org, konrad.dybcio@somainline.org,
        marijn.suijten@somainline.org, martin.botka@somainline.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, phone-devel@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Subject: [PATCH v3 1/3] dt-bindings: i2c: qcom,i2c-qup: Convert txt to YAML schema
Date:   Thu, 14 Jan 2021 19:04:13 +0100
Message-Id: <20210114180415.404418-2-angelogioacchino.delregno@somainline.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210114180415.404418-1-angelogioacchino.delregno@somainline.org>
References: <20210114180415.404418-1-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Convert the qcom,i2c-qup binding to YAML schema.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
---
 .../devicetree/bindings/i2c/qcom,i2c-qup.txt  | 40 ---------
 .../devicetree/bindings/i2c/qcom,i2c-qup.yaml | 87 +++++++++++++++++++
 2 files changed, 87 insertions(+), 40 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/qcom,i2c-qup.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/qcom,i2c-qup.yaml

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-qup.txt b/Documentation/devicetree/bindings/i2c/qcom,i2c-qup.txt
deleted file mode 100644
index dc71754a56af..000000000000
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-qup.txt
+++ /dev/null
@@ -1,40 +0,0 @@
-Qualcomm Universal Peripheral (QUP) I2C controller
-
-Required properties:
- - compatible: Should be:
-   * "qcom,i2c-qup-v1.1.1" for 8660, 8960 and 8064.
-   * "qcom,i2c-qup-v2.1.1" for 8974 v1.
-   * "qcom,i2c-qup-v2.2.1" for 8974 v2 and later.
- - reg: Should contain QUP register address and length.
- - interrupts: Should contain I2C interrupt.
-
- - clocks: A list of phandles + clock-specifiers, one for each entry in
-   clock-names.
- - clock-names: Should contain:
-   * "core" for the core clock
-   * "iface" for the AHB clock
-
- - #address-cells: Should be <1> Address cells for i2c device address
- - #size-cells: Should be <0> as i2c addresses have no size component
-
-Optional properties:
- - clock-frequency: Should specify the desired i2c bus clock frequency in Hz,
-                    defaults to 100kHz if omitted.
-
-Child nodes should conform to i2c bus binding.
-
-Example:
-
- i2c@f9924000 {
- 	compatible = "qcom,i2c-qup-v2.2.1";
- 	reg = <0xf9924000 0x1000>;
- 	interrupts = <0 96 0>;
-
- 	clocks = <&gcc GCC_BLSP1_QUP2_I2C_APPS_CLK>, <&gcc GCC_BLSP1_AHB_CLK>;
- 	clock-names = "core", "iface";
-
- 	clock-frequency = <355000>;
-
- 	#address-cells = <1>;
- 	#size-cells = <0>;
- };
diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-qup.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-qup.yaml
new file mode 100644
index 000000000000..c5c7db3ac2a6
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-qup.yaml
@@ -0,0 +1,87 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+
+$id: http://devicetree.org/schemas/i2c/qcom,i2c-qup.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Universal Peripheral (QUP) I2C controller
+
+maintainers:
+  - Andy Gross <agross@kernel.org>
+  - Bjorn Andersson <bjorn.andersson@linaro.org>
+
+description: Binding for Qualcomm "QUP" I2C controllers
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
+properties:
+  compatible:
+    enum:
+      - qcom,i2c-qup-v1.1.1
+      - qcom,i2c-qup-v2.1.1
+      - qcom,i2c-qup-v2.2.1
+
+  reg:
+    items:
+      - description: QUP I2C register iospace
+
+  clocks:
+    items:
+      - description: Core QUP I2C clock
+      - description: AHB clock
+
+  clock-names:
+    items:
+      - const: core
+      - const: iface
+
+  clock-frequency:
+    minimum: 100000
+    maximum: 1000000
+    default: 100000
+
+  dmas:
+    items:
+      - description: RX DMA Channel phandle
+      - description: TX DMA Channel phandle
+
+  dma-names:
+    items:
+      - const: rx
+      - const: tx
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+required:
+  - compatible
+  - clocks
+  - clock-names
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-msm8998.h>
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    i2c@c175000 {
+        compatible = "qcom,i2c-qup-v2.2.1";
+        reg = <0x0c175000 0x600>;
+        interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&gcc GCC_BLSP1_QUP1_I2C_APPS_CLK>,
+                 <&gcc GCC_BLSP1_AHB_CLK>;
+        clock-names = "core", "iface";
+        clock-frequency = <400000>;
+        dmas = <&blsp_dma 4>, <&blsp_dma 5>;
+        dma-names = "rx", "tx";
+        #address-cells = <1>;
+        #size-cells = <0>;
+    };
-- 
2.29.2

