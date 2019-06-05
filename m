Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F9C635CD8
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2019 14:29:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727604AbfFEM34 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Jun 2019 08:29:56 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:34073 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727273AbfFEM34 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 5 Jun 2019 08:29:56 -0400
X-Originating-IP: 90.88.144.139
Received: from localhost (aaubervilliers-681-1-24-139.w90-88.abo.wanadoo.fr [90.88.144.139])
        (Authenticated sender: maxime.ripard@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id CE6B360019;
        Wed,  5 Jun 2019 12:29:45 +0000 (UTC)
From:   Maxime Ripard <maxime.ripard@bootlin.com>
To:     Wolfram Sang <wsa@the-dreams.de>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Gregory Clement <gregory.clement@bootlin.com>
Cc:     linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2 2/2] dt-bindings: i2c: mv64xxx: Add YAML schemas
Date:   Wed,  5 Jun 2019 14:29:36 +0200
Message-Id: <20190605122936.11972-2-maxime.ripard@bootlin.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190605122936.11972-1-maxime.ripard@bootlin.com>
References: <20190605122936.11972-1-maxime.ripard@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Switch the DT binding to a YAML schema to enable the DT validation.

Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>

---

Changes from v1:
  - Fix the maintainers
---
 .../devicetree/bindings/i2c/i2c-mv64xxx.txt   |  64 -----------
 .../bindings/i2c/marvell,mv64xxx-i2c.yaml     | 105 ++++++++++++++++++
 2 files changed, 105 insertions(+), 64 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-mv64xxx.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mv64xxx.txt b/Documentation/devicetree/bindings/i2c/i2c-mv64xxx.txt
deleted file mode 100644
index 0ffe65a316ae..000000000000
--- a/Documentation/devicetree/bindings/i2c/i2c-mv64xxx.txt
+++ /dev/null
@@ -1,64 +0,0 @@
-
-* Marvell MV64XXX I2C controller
-
-Required properties :
-
- - reg             : Offset and length of the register set for the device
- - compatible      : Should be either:
-                     - "allwinner,sun4i-a10-i2c"
-                     - "allwinner,sun6i-a31-i2c"
-                     - "marvell,mv64xxx-i2c"
-                     - "marvell,mv78230-i2c"
-                     - "marvell,mv78230-a0-i2c"
-                       * Note: Only use "marvell,mv78230-a0-i2c" for a
-                         very rare, initial version of the SoC which
-                         had broken offload support.  Linux
-                         auto-detects this and sets it appropriately.
- - interrupts      : The interrupt number
-
-Optional properties :
-
- - clock-frequency : Desired I2C bus clock frequency in Hz. If not set the
-default frequency is 100kHz
-
- - resets          : phandle to the parent reset controller. Mandatory
-                     whenever you're using the "allwinner,sun6i-a31-i2c"
-                     compatible.
-
- - clocks:	   : pointers to the reference clocks for this device, the
-		     first one is the one used for the clock on the i2c bus,
-		     the second one is the clock used to acces the registers
-		     of the controller
-
- - clock-names	   : names of used clocks, mandatory if the second clock is
-		     used, the name must be "core", and "reg" (the latter is
-		     only for Armada 7K/8K).
-
-Examples:
-
-	i2c@11000 {
-		compatible = "marvell,mv64xxx-i2c";
-		reg = <0x11000 0x20>;
-		interrupts = <29>;
-		clock-frequency = <100000>;
-	};
-
-For the Armada XP:
-
-	i2c@11000 {
-		compatible = "marvell,mv78230-i2c", "marvell,mv64xxx-i2c";
-		reg = <0x11000 0x100>;
-		interrupts = <29>;
-		clock-frequency = <100000>;
-	};
-
-For the Armada 7040:
-
-	i2c@701000 {
-		compatible = "marvell,mv78230-i2c";
-		reg = <0x701000 0x20>;
-		interrupts = <29>;
-		clock-frequency = <100000>;
-		clock-names = "core", "reg";
-		clocks = <&core_clock>, <&reg_clock>;
-	};
diff --git a/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml b/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
new file mode 100644
index 000000000000..a1c631eaeafd
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
@@ -0,0 +1,105 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/marvell,mv64xxx-i2c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Marvell MV64XXX I2C Controller Device Tree Bindings
+
+maintainers:
+  - Gregory CLEMENT <gregory.clement@bootlin.com>
+
+properties:
+  compatible:
+    oneOf:
+      - const: allwinner,sun4i-a10-i2c
+      - items:
+          - const: allwinner,sun7i-a20-i2c
+          - const: allwinner,sun4i-a10-i2c
+      - const: allwinner,sun6i-a31-i2c
+      - items:
+          - const: allwinner,sun8i-a23-i2c
+          - const: allwinner,sun6i-a31-i2c
+      - items:
+          - const: allwinner,sun8i-a83t-i2c
+          - const: allwinner,sun6i-a31-i2c
+      - items:
+          - const: allwinner,sun50i-a64-i2c
+          - const: allwinner,sun6i-a31-i2c
+
+      - const: marvell,mv64xxx-i2c
+      - const: marvell,mv78230-i2c
+      - const: marvell,mv78230-a0-i2c
+
+    description:
+      Only use "marvell,mv78230-a0-i2c" for a very rare, initial
+      version of the SoC which had broken offload support. Linux
+      auto-detects this and sets it appropriately.
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+    maxItems: 2
+    items:
+      - description: Reference clock for the I2C bus
+      - description: Bus clock (Only for Armada 7K/8K)
+
+  clock-names:
+    minItems: 1
+    maxItems: 2
+    items:
+      - const: core
+      - const: reg
+    description:
+      Mandatory if two clocks are used (only for Armada 7k and 8k).
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - allwinner,sun4i-a10-i2c
+              - allwinner,sun6i-a31-i2c
+
+    then:
+      required:
+        - clocks
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: allwinner,sun6i-a31-i2c
+
+    then:
+      required:
+        - resets
+
+# FIXME: We should set it, but it would report all the generic
+# properties as additional properties.
+# additionalProperties: false
+
+examples:
+  - |
+    timer {
+      compatible = "allwinner,sun4i-a10-timer";
+      reg = <0x01c20c00 0x400>;
+      interrupts = <22>;
+      clocks = <&osc>;
+    };
+...
-- 
2.21.0

