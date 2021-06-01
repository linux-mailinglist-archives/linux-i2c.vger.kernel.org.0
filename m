Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4371C3976BC
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Jun 2021 17:31:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234417AbhFAPdV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Jun 2021 11:33:21 -0400
Received: from leibniz.telenet-ops.be ([195.130.137.77]:39288 "EHLO
        leibniz.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234082AbhFAPdT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Jun 2021 11:33:19 -0400
X-Greylist: delayed 336 seconds by postgrey-1.27 at vger.kernel.org; Tue, 01 Jun 2021 11:33:19 EDT
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by leibniz.telenet-ops.be (Postfix) with ESMTPS id 4FvbbC4B1DzMqvND
        for <linux-i2c@vger.kernel.org>; Tue,  1 Jun 2021 17:25:59 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:555:bf00:6951:b6ab])
        by baptiste.telenet-ops.be with bizsmtp
        id BrRp2500b35oben01rRpyb; Tue, 01 Jun 2021 17:25:59 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lo6H7-00BuxR-7b; Tue, 01 Jun 2021 17:25:49 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lo6H6-000JYT-N5; Tue, 01 Jun 2021 17:25:48 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Rob Herring <robh+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H . Peter Anvin" <hpa@zytor.com>
Cc:     devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        x86@kernel.org, linux-omap@vger.kernel.org,
        linux-i2c@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 4/4] dt-bindings: gpio: pcf857x: Convert to json-schema
Date:   Tue,  1 Jun 2021 17:25:47 +0200
Message-Id: <7caa954add90255fc177e5dbabe17d62e0242861.1622560799.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1622560799.git.geert+renesas@glider.be>
References: <cover.1622560799.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Convert the PCF857x-compatible I/O expanders Device Tree binding
documentation to json-schema.

Document missing compatible values, properties, and gpio hogs.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Drop support for "ti,pcf8575", as it's 100% compatible with
    "nxp,pcf8575",
  - Drop "hog-[0-9]+" from hog names,
  - Rely on dt-schema/schemas/gpio/gpio-hog.yaml for hog properties.
---
 .../devicetree/bindings/gpio/gpio-pcf857x.txt |  69 ------------
 .../devicetree/bindings/gpio/nxp,pcf8575.yaml | 103 ++++++++++++++++++
 2 files changed, 103 insertions(+), 69 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-pcf857x.txt
 create mode 100644 Documentation/devicetree/bindings/gpio/nxp,pcf8575.yaml

diff --git a/Documentation/devicetree/bindings/gpio/gpio-pcf857x.txt b/Documentation/devicetree/bindings/gpio/gpio-pcf857x.txt
deleted file mode 100644
index a482455a205b0855..0000000000000000
--- a/Documentation/devicetree/bindings/gpio/gpio-pcf857x.txt
+++ /dev/null
@@ -1,69 +0,0 @@
-* PCF857x-compatible I/O expanders
-
-The PCF857x-compatible chips have "quasi-bidirectional" I/O lines that can be
-driven high by a pull-up current source or driven low to ground. This combines
-the direction and output level into a single bit per line, which can't be read
-back. We can't actually know at initialization time whether a line is configured
-(a) as output and driving the signal low/high, or (b) as input and reporting a
-low/high value, without knowing the last value written since the chip came out
-of reset (if any). The only reliable solution for setting up line direction is
-thus to do it explicitly.
-
-Required Properties:
-
-  - compatible: should be one of the following.
-    - "maxim,max7328": For the Maxim MAX7378
-    - "maxim,max7329": For the Maxim MAX7329
-    - "nxp,pca8574": For the NXP PCA8574
-    - "nxp,pca8575": For the NXP PCA8575
-    - "nxp,pca9670": For the NXP PCA9670
-    - "nxp,pca9671": For the NXP PCA9671
-    - "nxp,pca9672": For the NXP PCA9672
-    - "nxp,pca9673": For the NXP PCA9673
-    - "nxp,pca9674": For the NXP PCA9674
-    - "nxp,pca9675": For the NXP PCA9675
-    - "nxp,pcf8574": For the NXP PCF8574
-    - "nxp,pcf8574a": For the NXP PCF8574A
-    - "nxp,pcf8575": For the NXP PCF8575
-
-  - reg: I2C slave address.
-
-  - gpio-controller: Marks the device node as a gpio controller.
-  - #gpio-cells: Should be 2. The first cell is the GPIO number and the second
-    cell specifies GPIO flags, as defined in <dt-bindings/gpio/gpio.h>. Only the
-    GPIO_ACTIVE_HIGH and GPIO_ACTIVE_LOW flags are supported.
-
-Optional Properties:
-
-  - lines-initial-states: Bitmask that specifies the initial state of each
-  line. When a bit is set to zero, the corresponding line will be initialized to
-  the input (pulled-up) state. When the  bit is set to one, the line will be
-  initialized the low-level output state. If the property is not specified
-  all lines will be initialized to the input state.
-
-  The I/O expander can detect input state changes, and thus optionally act as
-  an interrupt controller. When the expander interrupt line is connected all the
-  following properties must be set. For more information please see the
-  interrupt controller device tree bindings documentation available at
-  Documentation/devicetree/bindings/interrupt-controller/interrupts.txt.
-
-  - interrupt-controller: Identifies the node as an interrupt controller.
-  - #interrupt-cells: Number of cells to encode an interrupt source, shall be 2.
-  - interrupts: Interrupt specifier for the controllers interrupt.
-
-
-Please refer to gpio.txt in this directory for details of the common GPIO
-bindings used by client devices.
-
-Example: PCF8575 I/O expander node
-
-	pcf8575: gpio@20 {
-		compatible = "nxp,pcf8575";
-		reg = <0x20>;
-		interrupt-parent = <&irqpin2>;
-		interrupts = <3 0>;
-		gpio-controller;
-		#gpio-cells = <2>;
-		interrupt-controller;
-		#interrupt-cells = <2>;
-	};
diff --git a/Documentation/devicetree/bindings/gpio/nxp,pcf8575.yaml b/Documentation/devicetree/bindings/gpio/nxp,pcf8575.yaml
new file mode 100644
index 0000000000000000..f0ff66c4c74e252d
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/nxp,pcf8575.yaml
@@ -0,0 +1,103 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/nxp,pcf8575.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: PCF857x-compatible I/O expanders
+
+maintainers:
+  - Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
+
+description:
+  The PCF857x-compatible chips have "quasi-bidirectional" I/O lines that can be
+  driven high by a pull-up current source or driven low to ground. This
+  combines the direction and output level into a single bit per line, which
+  can't be read back. We can't actually know at initialization time whether a
+  line is configured (a) as output and driving the signal low/high, or (b) as
+  input and reporting a low/high value, without knowing the last value written
+  since the chip came out of reset (if any). The only reliable solution for
+  setting up line direction is thus to do it explicitly.
+
+properties:
+  compatible:
+    enum:
+      - maxim,max7328
+      - maxim,max7329
+      - nxp,pca8574
+      - nxp,pca8575
+      - nxp,pca9670
+      - nxp,pca9671
+      - nxp,pca9672
+      - nxp,pca9673
+      - nxp,pca9674
+      - nxp,pca9675
+      - nxp,pcf8574
+      - nxp,pcf8574a
+      - nxp,pcf8575
+
+  reg:
+    maxItems: 1
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+    description:
+      The first cell is the GPIO number and the second cell specifies GPIO
+      flags, as defined in <dt-bindings/gpio/gpio.h>. Only the GPIO_ACTIVE_HIGH
+      and GPIO_ACTIVE_LOW flags are supported.
+
+  lines-initial-states:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Bitmask that specifies the initial state of each line.
+      When a bit is set to zero, the corresponding line will be initialized to
+      the input (pulled-up) state.
+      When the  bit is set to one, the line will be initialized to the
+      low-level output state.
+      If the property is not specified all lines will be initialized to the
+      input state.
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 2
+
+  wakeup-source: true
+
+patternProperties:
+  "^(.+-hog(-[0-9]+)?)$":
+    type: object
+
+    required:
+      - gpio-hog
+
+required:
+  - compatible
+  - reg
+  - gpio-controller
+  - '#gpio-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            pcf8575: gpio@20 {
+                    compatible = "nxp,pcf8575";
+                    reg = <0x20>;
+                    interrupt-parent = <&irqpin2>;
+                    interrupts = <3 0>;
+                    gpio-controller;
+                    #gpio-cells = <2>;
+                    interrupt-controller;
+                    #interrupt-cells = <2>;
+            };
+    };
-- 
2.25.1

