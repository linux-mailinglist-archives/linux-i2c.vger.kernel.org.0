Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C7461FA763
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Jun 2020 06:03:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727027AbgFPECE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 Jun 2020 00:02:04 -0400
Received: from inva020.nxp.com ([92.121.34.13]:44300 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726466AbgFPECD (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 16 Jun 2020 00:02:03 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 04E831A0579;
        Tue, 16 Jun 2020 06:02:01 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id D43861A053F;
        Tue, 16 Jun 2020 06:01:55 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 8A072402E8;
        Tue, 16 Jun 2020 12:01:49 +0800 (SGT)
From:   Anson Huang <Anson.Huang@nxp.com>
To:     linux@rempel-privat.de, kernel@pengutronix.de, robh+dt@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
        wolfram@the-dreams.de, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH V3 2/2] dt-bindings: i2c: Convert imx i2c to json-schema
Date:   Tue, 16 Jun 2020 11:50:54 +0800
Message-Id: <1592279454-32551-2-git-send-email-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1592279454-32551-1-git-send-email-Anson.Huang@nxp.com>
References: <1592279454-32551-1-git-send-email-Anson.Huang@nxp.com>
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
Changes since V2:
	- remove 'clock-frequency' property's type and use enum for it, ONLY support 100KHz/400KHz.
	- remove *-gpios's typs/description, since it is already defined in i2c-gpio.yaml.
	- fix space issue in example.
---
 Documentation/devicetree/bindings/i2c/i2c-imx.txt  |  49 ----------
 Documentation/devicetree/bindings/i2c/i2c-imx.yaml | 103 +++++++++++++++++++++
 2 files changed, 103 insertions(+), 49 deletions(-)
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
index 0000000..869f2ae
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/i2c-imx.yaml
@@ -0,0 +1,103 @@
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
+    enum: [ 100000, 400000 ]
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
+    maxItems: 1
+
+  scl-gpios:
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
+        dma-names = "rx", "tx";
+    };
-- 
2.7.4

