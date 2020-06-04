Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6CB41EDAF8
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Jun 2020 04:00:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726678AbgFDCAC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 3 Jun 2020 22:00:02 -0400
Received: from inva021.nxp.com ([92.121.34.21]:44774 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726434AbgFDB74 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 3 Jun 2020 21:59:56 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 7FB36200124;
        Thu,  4 Jun 2020 03:59:54 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 1896220013B;
        Thu,  4 Jun 2020 03:59:49 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id B13EE40299;
        Thu,  4 Jun 2020 09:59:42 +0800 (SGT)
From:   Anson Huang <Anson.Huang@nxp.com>
To:     aisheng.dong@nxp.com, robh+dt@kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux@rempel-privat.de, wolfram@the-dreams.de,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH V2 3/3] dt-bindings: i2c: Convert imx i2c to json-schema
Date:   Thu,  4 Jun 2020 09:49:18 +0800
Message-Id: <1591235358-15516-4-git-send-email-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591235358-15516-1-git-send-email-Anson.Huang@nxp.com>
References: <1591235358-15516-1-git-send-email-Anson.Huang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Convert the i.MX I2C binding to DT schema format using json-schema,
some improvements applied, such as update example based on latest DT
file, add more compatible for existing SoCs, and remove unnecessary
common property "pinctrl".

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
Changes since V1:
	- add "additionalProperties: false".
---
 Documentation/devicetree/bindings/i2c/i2c-imx.txt  |  49 ---------
 Documentation/devicetree/bindings/i2c/i2c-imx.yaml | 119 +++++++++++++++++++++
 2 files changed, 119 insertions(+), 49 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-imx.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-imx.yaml

diff --git a/Documentation/devicetree/bindings/i2c/i2c-imx.txt b/Documentation/devicetree/bindings/i2c/i2c-imx.txt
deleted file mode 100644
index b967544..0000000
--- a/Documentation/devicetree/bindings/i2c/i2c-imx.txt
+++ /dev/null
@@ -1,49 +0,0 @@
-* Freescale Inter IC (I2C) and High Speed Inter IC (HS-I2C) for i.MX
-
-Required properties:
-- compatible :
-  - "fsl,imx1-i2c" for I2C compatible with the one integrated on i.MX1 SoC
-  - "fsl,imx21-i2c" for I2C compatible with the one integrated on i.MX21 SoC
-  - "fsl,vf610-i2c" for I2C compatible with the one integrated on Vybrid vf610 SoC
-- reg : Should contain I2C/HS-I2C registers location and length
-- interrupts : Should contain I2C/HS-I2C interrupt
-- clocks : Should contain the I2C/HS-I2C clock specifier
-
-Optional properties:
-- clock-frequency : Constains desired I2C/HS-I2C bus clock frequency in Hz.
-  The absence of the property indicates the default frequency 100 kHz.
-- dmas: A list of two dma specifiers, one for each entry in dma-names.
-- dma-names: should contain "tx" and "rx".
-- scl-gpios: specify the gpio related to SCL pin
-- sda-gpios: specify the gpio related to SDA pin
-- pinctrl: add extra pinctrl to configure i2c pins to gpio function for i2c
-  bus recovery, call it "gpio" state
-
-Examples:
-
-i2c@83fc4000 { /* I2C2 on i.MX51 */
-	compatible = "fsl,imx51-i2c", "fsl,imx21-i2c";
-	reg = <0x83fc4000 0x4000>;
-	interrupts = <63>;
-};
-
-i2c@70038000 { /* HS-I2C on i.MX51 */
-	compatible = "fsl,imx51-i2c", "fsl,imx21-i2c";
-	reg = <0x70038000 0x4000>;
-	interrupts = <64>;
-	clock-frequency = <400000>;
-};
-
-i2c0: i2c@40066000 { /* i2c0 on vf610 */
-	compatible = "fsl,vf610-i2c";
-	reg = <0x40066000 0x1000>;
-	interrupts =<0 71 0x04>;
-	dmas = <&edma0 0 50>,
-		<&edma0 0 51>;
-	dma-names = "rx","tx";
-	pinctrl-names = "default", "gpio";
-	pinctrl-0 = <&pinctrl_i2c1>;
-	pinctrl-1 = <&pinctrl_i2c1_gpio>;
-	scl-gpios = <&gpio5 26 GPIO_ACTIVE_HIGH>;
-	sda-gpios = <&gpio5 27 GPIO_ACTIVE_HIGH>;
-};
diff --git a/Documentation/devicetree/bindings/i2c/i2c-imx.yaml b/Documentation/devicetree/bindings/i2c/i2c-imx.yaml
new file mode 100644
index 0000000..63cceab
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/i2c-imx.yaml
@@ -0,0 +1,119 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/i2c-imx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale Inter IC (I2C) and High Speed Inter IC (HS-I2C) for i.MX
+
+maintainers:
+  - Wolfram Sang <wolfram@the-dreams.de>
+
+properties:
+  compatible:
+    oneOf:
+      - const: fsl,imx1-i2c
+      - const: fsl,imx21-i2c
+      - const: fsl,vf610-i2c
+      - items:
+          - const: fsl,imx35-i2c
+          - const: fsl,imx1-i2c
+      - items:
+          - enum:
+            - fsl,imx25-i2c
+            - fsl,imx27-i2c
+            - fsl,imx31-i2c
+            - fsl,imx50-i2c
+            - fsl,imx51-i2c
+            - fsl,imx53-i2c
+            - fsl,imx6q-i2c
+            - fsl,imx6sl-i2c
+            - fsl,imx6sx-i2c
+            - fsl,imx6sll-i2c
+            - fsl,imx6ul-i2c
+            - fsl,imx7s-i2c
+            - fsl,imx8mq-i2c
+            - fsl,imx8mm-i2c
+            - fsl,imx8mn-i2c
+            - fsl,imx8mp-i2c
+          - const: fsl,imx21-i2c
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: ipg
+
+  clock-frequency:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Constains desired I2C/HS-I2C bus clock frequency in Hz.
+      The absence of the property indicates the default frequency 100 kHz.
+    default: 100000
+
+  dmas:
+    items:
+      - description: DMA controller phandle and request line for RX
+      - description: DMA controller phandle and request line for TX
+
+  dma-names:
+    items:
+      - const: rx
+      - const: tx
+
+  sda-gpios:
+    $ref: '/schemas/types.yaml#/definitions/phandle'
+    description: |
+      gpio used for the sda signal, this should be flagged as
+      active high using open drain with (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)
+      from <dt-bindings/gpio/gpio.h> since the signal is by definition
+      open drain.
+    maxItems: 1
+
+  scl-gpios:
+    $ref: '/schemas/types.yaml#/definitions/phandle'
+    description: |
+      gpio used for the scl signal, this should be flagged as
+      active high using open drain with (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)
+      from <dt-bindings/gpio/gpio.h> since the signal is by definition
+      open drain.
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx5-clock.h>
+    #include <dt-bindings/clock/vf610-clock.h>
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    i2c@83fc4000 {
+        compatible = "fsl,imx51-i2c", "fsl,imx21-i2c";
+        reg = <0x83fc4000 0x4000>;
+        interrupts = <63>;
+        clocks = <&clks IMX5_CLK_I2C2_GATE>;
+    };
+
+    i2c@40066000 {
+        compatible = "fsl,vf610-i2c";
+        reg = <0x40066000 0x1000>;
+        interrupts = <71 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clks VF610_CLK_I2C0>;
+        clock-names = "ipg";
+        dmas = <&edma0 0 50>,
+               <&edma0 0 51>;
+        dma-names = "rx","tx";
+    };
-- 
2.7.4

