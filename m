Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A41E73C6E3
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Jun 2019 11:04:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404833AbfFKJDR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 11 Jun 2019 05:03:17 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:40569 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725766AbfFKJDQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 11 Jun 2019 05:03:16 -0400
X-Originating-IP: 90.88.159.246
Received: from localhost (aaubervilliers-681-1-40-246.w90-88.abo.wanadoo.fr [90.88.159.246])
        (Authenticated sender: maxime.ripard@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 5B0CDFF81B;
        Tue, 11 Jun 2019 09:03:11 +0000 (UTC)
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
Subject: [PATCH v3 1/2] dt-bindings: i2c: sun6i-p2wi: Add YAML schemas
Date:   Tue, 11 Jun 2019 11:03:08 +0200
Message-Id: <20190611090309.7930-1-maxime.ripard@bootlin.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Switch the DT binding to a YAML schema to enable the DT validation.

Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>

---

Changes from v2
  - Remove redundant constraints on address-cells and size-cells
  - Fix the example
---
 .../i2c/allwinner,sun6i-a31-p2wi.yaml         | 65 +++++++++++++++++++
 .../bindings/i2c/i2c-sun6i-p2wi.txt           | 41 ------------
 2 files changed, 65 insertions(+), 41 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/i2c/allwinner,sun6i-a31-p2wi.yaml
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-sun6i-p2wi.txt

diff --git a/Documentation/devicetree/bindings/i2c/allwinner,sun6i-a31-p2wi.yaml b/Documentation/devicetree/bindings/i2c/allwinner,sun6i-a31-p2wi.yaml
new file mode 100644
index 000000000000..1804abe24f14
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/allwinner,sun6i-a31-p2wi.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/allwinner,sun6i-a31-p2wi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner A31 P2WI (Push/Pull 2 Wires Interface) Device Tree Bindings
+
+maintainers:
+  - Chen-Yu Tsai <wens@csie.org>
+  - Maxime Ripard <maxime.ripard@bootlin.com>
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
+properties:
+  compatible:
+    const: allwinner,sun6i-a31-p2wi
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
+  resets:
+    maxItems: 1
+
+  clock-frequency:
+    minimum: 1
+    maximum: 6000000
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - resets
+
+# FIXME: We should set it, but it would report all the generic
+# properties as additional properties.
+# additionalProperties: false
+
+examples:
+  - |
+    i2c@1f03400 {
+        compatible = "allwinner,sun6i-a31-p2wi";
+        reg = <0x01f03400 0x400>;
+        interrupts = <0 39 4>;
+        clocks = <&apb0_gates 3>;
+        clock-frequency = <6000000>;
+        resets = <&apb0_rst 3>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        axp221: pmic@68 {
+            compatible = "x-powers,axp221";
+            reg = <0x68>;
+        };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/i2c/i2c-sun6i-p2wi.txt b/Documentation/devicetree/bindings/i2c/i2c-sun6i-p2wi.txt
deleted file mode 100644
index 49df0053347a..000000000000
--- a/Documentation/devicetree/bindings/i2c/i2c-sun6i-p2wi.txt
+++ /dev/null
@@ -1,41 +0,0 @@
-
-* Allwinner P2WI (Push/Pull 2 Wire Interface) controller
-
-Required properties :
-
- - reg             : Offset and length of the register set for the device.
- - compatible      : Should one of the following:
-                     - "allwinner,sun6i-a31-p2wi"
- - interrupts      : The interrupt line connected to the P2WI peripheral.
- - clocks          : The gate clk connected to the P2WI peripheral.
- - resets          : The reset line connected to the P2WI peripheral.
-
-Optional properties :
-
- - clock-frequency : Desired P2WI bus clock frequency in Hz. If not set the
-default frequency is 100kHz
-
-A P2WI may contain one child node encoding a P2WI slave device.
-
-Slave device properties:
-  Required properties:
-   - reg           : the I2C slave address used during the initialization
-                     process to switch from I2C to P2WI mode
-
-Example:
-
-	p2wi@1f03400 {
-		compatible = "allwinner,sun6i-a31-p2wi";
-		reg = <0x01f03400 0x400>;
-		interrupts = <0 39 4>;
-		clocks = <&apb0_gates 3>;
-		clock-frequency = <6000000>;
-		resets = <&apb0_rst 3>;
-
-		axp221: pmic@68 {
-			compatible = "x-powers,axp221";
-			reg = <0x68>;
-
-			/* ... */
-		};
-	};
-- 
2.21.0

