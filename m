Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD6C3187CD8
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Mar 2020 10:41:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727210AbgCQJlK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Mar 2020 05:41:10 -0400
Received: from v6.sk ([167.172.42.174]:50756 "EHLO v6.sk"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727166AbgCQJlJ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 17 Mar 2020 05:41:09 -0400
Received: from localhost (v6.sk [IPv6:::1])
        by v6.sk (Postfix) with ESMTP id AE68D6109A;
        Tue, 17 Mar 2020 09:41:06 +0000 (UTC)
From:   Lubomir Rintel <lkundrak@v3.sk>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Brown <broonie@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-media@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-usb@vger.kernel.org,
        Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH 23/28] dt-bindings: interrupt-controller: Convert mrvl,intc to json-schema
Date:   Tue, 17 Mar 2020 10:39:17 +0100
Message-Id: <20200317093922.20785-24-lkundrak@v3.sk>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200317093922.20785-1-lkundrak@v3.sk>
References: <20200317093922.20785-1-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Convert the mrvl,intc binding to DT schema format using json-schema.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 .../interrupt-controller/mrvl,intc.txt        |  64 --------
 .../interrupt-controller/mrvl,intc.yaml       | 144 ++++++++++++++++++
 2 files changed, 144 insertions(+), 64 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/mrvl,intc.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/mrvl,intc.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/mrvl,intc.txt b/Documentation/devicetree/bindings/interrupt-controller/mrvl,intc.txt
deleted file mode 100644
index a0ed02725a9d7..0000000000000
--- a/Documentation/devicetree/bindings/interrupt-controller/mrvl,intc.txt
+++ /dev/null
@@ -1,64 +0,0 @@
-* Marvell MMP Interrupt controller
-
-Required properties:
-- compatible : Should be
-               "mrvl,mmp-intc" on Marvel MMP,
-               "mrvl,mmp2-intc" along with "mrvl,mmp2-mux-intc" on MMP2 or
-               "marvell,mmp3-intc" with "mrvl,mmp2-mux-intc" on MMP3
-- reg : Address and length of the register set of the interrupt controller.
-  If the interrupt controller is intc, address and length means the range
-  of the whole interrupt controller. The "marvell,mmp3-intc" controller
-  also has a secondary range for the second CPU core.  If the interrupt
-  controller is mux-intc, address and length means one register. Since
-  address of mux-intc is in the range of intc. mux-intc is secondary
-  interrupt controller.
-- reg-names : Name of the register set of the interrupt controller. It's
-  only required in mux-intc interrupt controller.
-- interrupts : Should be the port interrupt shared by mux interrupts. It's
-  only required in mux-intc interrupt controller.
-- interrupt-controller : Identifies the node as an interrupt controller.
-- #interrupt-cells : Specifies the number of cells needed to encode an
-  interrupt source.
-- mrvl,intc-nr-irqs : Specifies the number of interrupts in the interrupt
-  controller.
-- mrvl,clr-mfp-irq : Specifies the interrupt that needs to clear MFP edge
-  detection first.
-
-Example:
-	intc: interrupt-controller@d4282000 {
-		compatible = "mrvl,mmp2-intc";
-		interrupt-controller;
-		#interrupt-cells = <1>;
-		reg = <0xd4282000 0x1000>;
-		mrvl,intc-nr-irqs = <64>;
-	};
-
-	intcmux4@d4282150 {
-		compatible = "mrvl,mmp2-mux-intc";
-		interrupts = <4>;
-		interrupt-controller;
-		#interrupt-cells = <1>;
-		reg = <0x150 0x4>, <0x168 0x4>;
-		reg-names = "mux status", "mux mask";
-		mrvl,intc-nr-irqs = <2>;
-	};
-
-* Marvell Orion Interrupt controller
-
-Required properties
-- compatible :  Should be "marvell,orion-intc".
-- #interrupt-cells: Specifies the number of cells needed to encode an
-  interrupt source. Supported value is <1>.
-- interrupt-controller : Declare this node to be an interrupt controller.
-- reg : Interrupt mask address. A list of 4 byte ranges, one per controller.
-        One entry in the list represents 32 interrupts.
-
-Example:
-
-	intc: interrupt-controller {
-        	compatible = "marvell,orion-intc", "marvell,intc";
-		interrupt-controller;
-		#interrupt-cells = <1>;
-                reg = <0xfed20204 0x04>,
-		      <0xfed20214 0x04>;
-        };
diff --git a/Documentation/devicetree/bindings/interrupt-controller/mrvl,intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/mrvl,intc.yaml
new file mode 100644
index 0000000000000..f0644f7d7e1d2
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/mrvl,intc.yaml
@@ -0,0 +1,144 @@
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/mrvl,intc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Marvell MMP/Orion Interrupt controller bindings
+
+maintainers:
+  - devicetree@vger.kernel.org
+
+allOf:
+  - $ref: /schemas/interrupt-controller.yaml#
+  - if:
+      properties:
+        compatible:
+          not:
+            contains:
+              const: marvell,orion-intc
+    then:
+      required:
+        - mrvl,intc-nr-irqs
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mrvl,mmp-intc
+              - mrvl,mmp2-intc
+    then:
+      properties:
+        reg:
+          minItems: 1
+          maxItems: 1
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - marvell,mmp3-intc
+              - mrvl,mmp2-mux-intc
+    then:
+      properties:
+        reg:
+          minItems: 2
+          maxItems: 2
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: marvell,orion-intc
+    then:
+      properties:
+        reg:
+          minItems: 1
+          maxItems: 2
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mrvl,mmp2-mux-intc
+    then:
+      properties:
+        interrupts:
+          minItems: 1
+          maxItems: 1
+        reg-names:
+          minItems: 2
+          maxItems: 2
+          items:
+            - const: 'mux status'
+            - const: 'mux mask'
+      required:
+        - interrupts
+    else:
+      properties:
+        interrupts: false
+
+properties:
+  '#interrupt-cells':
+    const: 1
+
+  compatible:
+    enum:
+      - mrvl,mmp-intc
+      - mrvl,mmp2-intc
+      - marvell,mmp3-intc
+      - marvell,orion-intc
+      - mrvl,mmp2-mux-intc
+
+  reg: true
+
+  reg-names: true
+
+  interrupts: true
+
+  interrupt-controller: true
+
+  mrvl,intc-nr-irqs:
+    description: |
+      Specifies the number of interrupts in the interrupt controller.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  mrvl,clr-mfp-irq:
+    description: |
+      Specifies the interrupt that needs to clear MFP edge detection first.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+required:
+  - '#interrupt-cells'
+  - compatible
+  - reg
+  - interrupt-controller
+
+additionalProperties: false
+
+examples:
+  - |
+    interrupt-controller@d4282000 {
+        compatible = "mrvl,mmp2-intc";
+        interrupt-controller;
+        #interrupt-cells = <1>;
+        reg = <0xd4282000 0x1000>;
+        mrvl,intc-nr-irqs = <64>;
+    };
+
+    interrupt-controller@d4282150 {
+        compatible = "mrvl,mmp2-mux-intc";
+        interrupts = <4>;
+        interrupt-controller;
+        #interrupt-cells = <1>;
+        reg = <0x150 0x4>, <0x168 0x4>;
+        reg-names = "mux status", "mux mask";
+        mrvl,intc-nr-irqs = <2>;
+    };
+  - |
+    interrupt-controller@fed20204 {
+        compatible = "marvell,orion-intc";
+        interrupt-controller;
+        #interrupt-cells = <1>;
+        reg = <0xfed20204 0x04>,
+              <0xfed20214 0x04>;
+    };
+
+...
-- 
2.25.1

