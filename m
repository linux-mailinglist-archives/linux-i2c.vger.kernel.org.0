Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B788187C86
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Mar 2020 10:41:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726416AbgCQJkx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Mar 2020 05:40:53 -0400
Received: from v6.sk ([167.172.42.174]:50606 "EHLO v6.sk"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726287AbgCQJkx (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 17 Mar 2020 05:40:53 -0400
Received: from localhost (v6.sk [IPv6:::1])
        by v6.sk (Postfix) with ESMTP id D040861093;
        Tue, 17 Mar 2020 09:40:49 +0000 (UTC)
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
Subject: [PATCH 19/28] dt-bindings: mmc: Convert sdhci-pxa to json-schema
Date:   Tue, 17 Mar 2020 10:39:13 +0100
Message-Id: <20200317093922.20785-20-lkundrak@v3.sk>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200317093922.20785-1-lkundrak@v3.sk>
References: <20200317093922.20785-1-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Convert the sdhci-pxa binding to DT schema format using json-schema.

At the same time, fix a couple of issues with the examples discovered by
the validation tool -- a semicolon instead of a comma and wrong node names.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 .../devicetree/bindings/mmc/sdhci-pxa.txt     |  50 ---------
 .../devicetree/bindings/mmc/sdhci-pxa.yaml    | 101 ++++++++++++++++++
 2 files changed, 101 insertions(+), 50 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mmc/sdhci-pxa.txt
 create mode 100644 Documentation/devicetree/bindings/mmc/sdhci-pxa.yaml

diff --git a/Documentation/devicetree/bindings/mmc/sdhci-pxa.txt b/Documentation/devicetree/bindings/mmc/sdhci-pxa.txt
deleted file mode 100644
index 3d1b449d6097d..0000000000000
--- a/Documentation/devicetree/bindings/mmc/sdhci-pxa.txt
+++ /dev/null
@@ -1,50 +0,0 @@
-* Marvell sdhci-pxa v2/v3 controller
-
-This file documents differences between the core properties in mmc.txt
-and the properties used by the sdhci-pxav2 and sdhci-pxav3 drivers.
-
-Required properties:
-- compatible: Should be "mrvl,pxav2-mmc", "mrvl,pxav3-mmc" or
-  "marvell,armada-380-sdhci".
-- reg:
-  * for "mrvl,pxav2-mmc" and "mrvl,pxav3-mmc", one register area for
-    the SDHCI registers.
-
-  * for "marvell,armada-380-sdhci", three register areas. The first
-    one for the SDHCI registers themselves, the second one for the
-    AXI/Mbus bridge registers of the SDHCI unit, the third one for the
-    SDIO3 Configuration register
-- reg names: should be "sdhci", "mbus", "conf-sdio3". only mandatory
-  for "marvell,armada-380-sdhci"
-- clocks: Array of clocks required for SDHCI; requires at least one for
-    I/O clock.
-- clock-names: Array of names corresponding to clocks property; shall be
-    "io" for I/O clock and "core" for optional core clock.
-
-Optional properties:
-- mrvl,clk-delay-cycles: Specify a number of cycles to delay for tuning.
-
-Example:
-
-sdhci@d4280800 {
-	compatible = "mrvl,pxav3-mmc";
-	reg = <0xd4280800 0x800>;
-	bus-width = <8>;
-	interrupts = <27>;
-	clocks = <&chip CLKID_SDIO1XIN>, <&chip CLKID_SDIO1>;
-	clock-names = "io", "core";
-	non-removable;
-	mrvl,clk-delay-cycles = <31>;
-};
-
-sdhci@d8000 {
-	compatible = "marvell,armada-380-sdhci";
-	reg-names = "sdhci", "mbus", "conf-sdio3";
-	reg = <0xd8000 0x1000>,
-		<0xdc000 0x100>;
-		<0x18454 0x4>;
-	interrupts = <0 25 0x4>;
-	clocks = <&gateclk 17>;
-	clock-names = "io";
-	mrvl,clk-delay-cycles = <0x1F>;
-};
diff --git a/Documentation/devicetree/bindings/mmc/sdhci-pxa.yaml b/Documentation/devicetree/bindings/mmc/sdhci-pxa.yaml
new file mode 100644
index 0000000000000..4ae0926ac294f
--- /dev/null
+++ b/Documentation/devicetree/bindings/mmc/sdhci-pxa.yaml
@@ -0,0 +1,101 @@
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mmc/sdhci-pxa.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Marvell PXA SDHCI v2/v3 bindings
+
+maintainers:
+  - devicetree@vger.kernel.org
+
+allOf:
+  - $ref: mmc-controller.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: marvell,armada-380-sdhci
+    then:
+      properties:
+        regs:
+          minItems: 3
+          maxItems: 3
+        reg-names:
+          items:
+            - const: sdhci
+            - const: mbus
+            - const: conf-sdio3
+      required:
+        - reg-names
+    else:
+      properties:
+        regs:
+          minItems: 1
+          maxItems: 1
+        reg-names:
+          minItems: 1
+          maxItems: 1
+
+properties:
+  compatible:
+    enum:
+      - mrvl,pxav2-mmc
+      - mrvl,pxav3-mmc
+      - marvell,armada-380-sdhci
+
+  reg: true
+
+  reg-names: true
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+    maxItems: 2
+
+  clock-names:
+    minItems: 1
+    maxItems: 2
+    items:
+      - const: io
+      - const: core
+
+  mrvl,clk-delay-cycles:
+    description: Specify a number of cycles to delay for tuning.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+examples:
+  - |
+    #include <dt-bindings/clock/berlin2.h>
+    mmc@d4280800 {
+        compatible = "mrvl,pxav3-mmc";
+        reg = <0xd4280800 0x800>;
+        bus-width = <8>;
+        interrupts = <27>;
+        clocks = <&chip CLKID_SDIO1XIN>, <&chip CLKID_SDIO1>;
+        clock-names = "io", "core";
+        non-removable;
+        mrvl,clk-delay-cycles = <31>;
+    };
+  - |
+    mmc@d8000 {
+        compatible = "marvell,armada-380-sdhci";
+        reg-names = "sdhci", "mbus", "conf-sdio3";
+        reg = <0xd8000 0x1000>,
+              <0xdc000 0x100>,
+              <0x18454 0x4>;
+        interrupts = <0 25 0x4>;
+        clocks = <&gateclk 17>;
+        clock-names = "io";
+        mrvl,clk-delay-cycles = <0x1F>;
+    };
+
+...
-- 
2.25.1

