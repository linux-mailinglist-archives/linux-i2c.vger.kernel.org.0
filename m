Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6EF8C187CCD
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Mar 2020 10:41:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726635AbgCQJlX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Mar 2020 05:41:23 -0400
Received: from v6.sk ([167.172.42.174]:50870 "EHLO v6.sk"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727266AbgCQJlW (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 17 Mar 2020 05:41:22 -0400
Received: from localhost (v6.sk [IPv6:::1])
        by v6.sk (Postfix) with ESMTP id 48B316109F;
        Tue, 17 Mar 2020 09:41:19 +0000 (UTC)
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
Subject: [PATCH 26/28] dt-bindings: spi: Convert spi-pxa2xx to json-schema
Date:   Tue, 17 Mar 2020 10:39:20 +0100
Message-Id: <20200317093922.20785-27-lkundrak@v3.sk>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200317093922.20785-1-lkundrak@v3.sk>
References: <20200317093922.20785-1-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

A straightforward conversion of the the spi-pxa2xx binding to DT schema
format using json-schema.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 .../bindings/spi/marvell,mmp2-ssp.yaml        | 58 +++++++++++++++++++
 .../devicetree/bindings/spi/spi-pxa2xx.txt    | 27 ---------
 2 files changed, 58 insertions(+), 27 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/spi/marvell,mmp2-ssp.yaml
 delete mode 100644 Documentation/devicetree/bindings/spi/spi-pxa2xx.txt

diff --git a/Documentation/devicetree/bindings/spi/marvell,mmp2-ssp.yaml b/Documentation/devicetree/bindings/spi/marvell,mmp2-ssp.yaml
new file mode 100644
index 0000000000000..de6b6a53b70d8
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/marvell,mmp2-ssp.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
+# Copyright 2019,2020 Lubomir Rintel <lkundrak@v3.sk>
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spi/marvell,mmp2-ssp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: PXA2xx SSP SPI Controller bindings
+
+maintainers:
+  - Lubomir Rintel <lkundrak@v3.sk>
+
+allOf:
+  - $ref: spi-controller.yaml#
+
+properties:
+  compatible:
+    const: marvell,mmp2-ssp
+
+  interrupts:
+    maxItems: 1
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  ready-gpios:
+    description: |
+      GPIO used to signal a SPI master that the FIFO is filled and we're
+      ready to service a transfer. Only useful in slave mode.
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - '#address-cells'
+  - '#size-cells'
+
+dependencies:
+  ready-gpios: [ spi-slave ]
+
+examples:
+  - |
+    #include <dt-bindings/clock/marvell,mmp2.h>
+    spi@d4035000 {
+        compatible = "marvell,mmp2-ssp";
+        #address-cells = <1>;
+        #size-cells = <0>;
+        reg = <0xd4035000 0x1000>;
+        clocks = <&soc_clocks MMP2_CLK_SSP0>;
+        interrupts = <0>;
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/spi/spi-pxa2xx.txt b/Documentation/devicetree/bindings/spi/spi-pxa2xx.txt
deleted file mode 100644
index e30e0c2a4bce1..0000000000000
--- a/Documentation/devicetree/bindings/spi/spi-pxa2xx.txt
+++ /dev/null
@@ -1,27 +0,0 @@
-PXA2xx SSP SPI Controller
-
-Required properties:
-- compatible: Must be "marvell,mmp2-ssp".
-- reg: Offset and length of the device's register set.
-- interrupts: Should be the interrupt number.
-- clocks: Should contain a single entry describing the clock input.
-- #address-cells:  Number of cells required to define a chip select address.
-- #size-cells: Should be zero.
-
-Optional properties:
-- cs-gpios: list of GPIO chip selects. See the SPI bus bindings,
-  Documentation/devicetree/bindings/spi/spi-bus.txt
-- spi-slave: Empty property indicating the SPI controller is used in slave mode.
-- ready-gpios: GPIO used to signal a SPI master that the FIFO is filled
-  and we're ready to service a transfer. Only useful in slave mode.
-
-Child nodes represent devices on the SPI bus
-  See ../spi/spi-bus.txt
-
-Example:
-	ssp1: spi@d4035000 {
-		compatible = "marvell,mmp2-ssp";
-		reg = <0xd4035000 0x1000>;
-		clocks = <&soc_clocks MMP2_CLK_SSP0>;
-		interrupts = <0>;
-	};
-- 
2.25.1

