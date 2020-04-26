Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 186AC1B935D
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Apr 2020 21:02:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726377AbgDZS7Z (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 26 Apr 2020 14:59:25 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:58906 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726004AbgDZS7Z (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 26 Apr 2020 14:59:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1587927547; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=CZKr0/96JdPCJ9s16N8cU+O8/MVaUDaCoYL4FKT8OTI=;
        b=x1jESb6k0M5Z+tjPZ+Nu1D0sHi8Z0L7xTTWFyA0QmuKQTsjU5oqUD5Puq7xhio0YUHsF/t
        GwNl4MKO6KRuYIjjToDV1zNRU4QoUn2Uu+FjNAAgQqt7DcKGcmZuzPisyGucpllm8qABP4
        ZcSbq83CLt5uU1nRd0wDCET60G1PZIE=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     od@zcrc.me,
        =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0?= <zhouyanjie@wanyeetech.com>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-i2c@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 3/8] dt-bindings: pinctrl: Convert ingenic,pinctrl.txt to YAML
Date:   Sun, 26 Apr 2020 20:58:51 +0200
Message-Id: <20200426185856.38826-3-paul@crapouillou.net>
In-Reply-To: <20200426185856.38826-1-paul@crapouillou.net>
References: <20200426185856.38826-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Convert the ingenic,pinctrl.txt doc file to ingenic,pinctrl.yaml.

In the process, some compatible strings now require a fallback, as the
corresponding SoCs are pin-compatible with their fallback variant.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 .../bindings/pinctrl/ingenic,pinctrl.txt      |  81 ----------
 .../bindings/pinctrl/ingenic,pinctrl.yaml     | 138 ++++++++++++++++++
 2 files changed, 138 insertions(+), 81 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.txt
deleted file mode 100644
index d9b2100c98e8..000000000000
--- a/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.txt
+++ /dev/null
@@ -1,81 +0,0 @@
-Ingenic XBurst pin controller
-
-Please refer to pinctrl-bindings.txt in this directory for details of the
-common pinctrl bindings used by client devices, including the meaning of the
-phrase "pin configuration node".
-
-For the XBurst SoCs, pin control is tightly bound with GPIO ports. All pins may
-be used as GPIOs, multiplexed device functions are configured within the
-GPIO port configuration registers and it is typical to refer to pins using the
-naming scheme "PxN" where x is a character identifying the GPIO port with
-which the pin is associated and N is an integer from 0 to 31 identifying the
-pin within that GPIO port. For example PA0 is the first pin in GPIO port A, and
-PB31 is the last pin in GPIO port B. The jz4740, the x1000 and the x1830
-contains 4 GPIO ports, PA to PD, for a total of 128 pins. The jz4760, the
-jz4770 and the jz4780 contains 6 GPIO ports, PA to PF, for a total of 192 pins.
-
-
-Required properties:
---------------------
-
- - compatible: One of:
-    - "ingenic,jz4740-pinctrl"
-    - "ingenic,jz4725b-pinctrl"
-    - "ingenic,jz4760-pinctrl"
-    - "ingenic,jz4760b-pinctrl"
-    - "ingenic,jz4770-pinctrl"
-    - "ingenic,jz4780-pinctrl"
-    - "ingenic,x1000-pinctrl"
-    - "ingenic,x1000e-pinctrl"
-    - "ingenic,x1500-pinctrl"
-    - "ingenic,x1830-pinctrl"
- - reg: Address range of the pinctrl registers.
-
-
-Required properties for sub-nodes (GPIO chips):
------------------------------------------------
-
- - compatible: Must contain one of:
-    - "ingenic,jz4740-gpio"
-    - "ingenic,jz4760-gpio"
-    - "ingenic,jz4770-gpio"
-    - "ingenic,jz4780-gpio"
-    - "ingenic,x1000-gpio"
-    - "ingenic,x1830-gpio"
- - reg: The GPIO bank number.
- - interrupt-controller: Marks the device node as an interrupt controller.
- - interrupts: Interrupt specifier for the controllers interrupt.
- - #interrupt-cells: Should be 2. Refer to
-   ../interrupt-controller/interrupts.txt for more details.
- - gpio-controller: Marks the device node as a GPIO controller.
- - #gpio-cells: Should be 2. The first cell is the GPIO number and the second
-    cell specifies GPIO flags, as defined in <dt-bindings/gpio/gpio.h>. Only the
-    GPIO_ACTIVE_HIGH and GPIO_ACTIVE_LOW flags are supported.
- - gpio-ranges: Range of pins managed by the GPIO controller. Refer to
-   ../gpio/gpio.txt for more details.
-
-
-Example:
---------
-
-pinctrl: pin-controller@10010000 {
-	compatible = "ingenic,jz4740-pinctrl";
-	reg = <0x10010000 0x400>;
-	#address-cells = <1>;
-	#size-cells = <0>;
-
-	gpa: gpio@0 {
-		compatible = "ingenic,jz4740-gpio";
-		reg = <0>;
-
-		gpio-controller;
-		gpio-ranges = <&pinctrl 0 0 32>;
-		#gpio-cells = <2>;
-
-		interrupt-controller;
-		#interrupt-cells = <2>;
-
-		interrupt-parent = <&intc>;
-		interrupts = <28>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml
new file mode 100644
index 000000000000..adf462cc2737
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml
@@ -0,0 +1,138 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/ingenic,pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ingenic SoCs pin controller devicetree bindings
+
+description: >
+  Please refer to pinctrl-bindings.txt in this directory for details of the
+  common pinctrl bindings used by client devices, including the meaning of the
+  phrase "pin configuration node".
+
+  For the Ingenic SoCs, pin control is tightly bound with GPIO ports. All pins
+  may be used as GPIOs, multiplexed device functions are configured within the
+  GPIO port configuration registers and it is typical to refer to pins using the
+  naming scheme "PxN" where x is a character identifying the GPIO port with
+  which the pin is associated and N is an integer from 0 to 31 identifying the
+  pin within that GPIO port. For example PA0 is the first pin in GPIO port A,
+  and PB31 is the last pin in GPIO port B. The JZ4740, the X1000 and the X1830
+  contains 4 GPIO ports, PA to PD, for a total of 128 pins. The JZ4760, the
+  JZ4770 and the JZ4780 contains 6 GPIO ports, PA to PF, for a total of 192
+  pins.
+
+maintainers:
+  - Paul Cercueil <paul@crapouillou.net>
+
+properties:
+  nodename:
+    pattern: "^pin-controller@[0-9a-f]+$"
+
+  compatible:
+    oneOf:
+      - enum:
+        - ingenic,jz4740-pinctrl
+        - ingenic,jz4725b-pinctrl
+        - ingenic,jz4760-pinctrl
+        - ingenic,jz4770-pinctrl
+        - ingenic,jz4780-pinctrl
+        - ingenic,x1000-pinctrl
+        - ingenic,x1500-pinctrl
+        - ingenic,x1830-pinctrl
+      - items:
+        - const: ingenic,jz4760b-pinctrl
+        - const: ingenic,jz4760-pinctrl
+      - items:
+        - const: ingenic,x1000e-pinctrl
+        - const: ingenic,x1000-pinctrl
+
+  reg:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^gpio@[0-9]$":
+    type: object
+    properties:
+      compatible:
+        enum:
+          - ingenic,jz4740-gpio
+          - ingenic,jz4725b-gpio
+          - ingenic,jz4760-gpio
+          - ingenic,jz4770-gpio
+          - ingenic,jz4780-gpio
+          - ingenic,x1000-gpio
+          - ingenic,x1500-gpio
+          - ingenic,x1830-gpio
+
+      reg:
+        items:
+          - description: The GPIO bank number
+
+      gpio-controller: true
+
+      "#gpio-cells":
+        const: 2
+
+      gpio-ranges:
+        maxItems: 1
+
+      interrupt-controller: true
+
+      "#interrupt-cells":
+        const: 2
+        description:
+          Refer to ../interrupt-controller/interrupts.txt for more details.
+
+      interrupts:
+        maxItems: 1
+
+    required:
+      - compatible
+      - reg
+      - gpio-controller
+      - "#gpio-cells"
+      - interrupts
+      - interrupt-controller
+      - "#interrupt-cells"
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    pin-controller@10010000 {
+      compatible = "ingenic,jz4770-pinctrl";
+      reg = <0x10010000 0x600>;
+
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      gpio@0 {
+        compatible = "ingenic,jz4770-gpio";
+        reg = <0>;
+
+        gpio-controller;
+        gpio-ranges = <&pinctrl 0 0 32>;
+        #gpio-cells = <2>;
+
+        interrupt-controller;
+        #interrupt-cells = <2>;
+
+        interrupt-parent = <&intc>;
+        interrupts = <17>;
+      };
+    };
-- 
2.26.2

