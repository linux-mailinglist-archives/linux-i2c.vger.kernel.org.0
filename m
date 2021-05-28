Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EBEB3940FE
	for <lists+linux-i2c@lfdr.de>; Fri, 28 May 2021 12:35:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236514AbhE1Khb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 May 2021 06:37:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236479AbhE1Kha (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 28 May 2021 06:37:30 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79FC7C061763
        for <linux-i2c@vger.kernel.org>; Fri, 28 May 2021 03:35:54 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:751e:82a3:f2a2:3459])
        by andre.telenet-ops.be with bizsmtp
        id AAbs2500g20MPSF01Absbv; Fri, 28 May 2021 12:35:53 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lmZqK-00AD9W-A5; Fri, 28 May 2021 12:35:52 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lmYfX-007PmR-Uv; Fri, 28 May 2021 11:20:39 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v2] dt-bindings: i2c: renesas,riic: Convert to json-schema
Date:   Fri, 28 May 2021 11:19:48 +0200
Message-Id: <5938b2d35663d4b9fefeeb2e60ff19e3343c51de.1622193505.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Convert the Renesas RZ/A I2C Bus Interface (RIIC) Device Tree binding
documentation to json-schema.

Document missing properties.
Update the example to match reality.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Rob Herring <robh@kernel.org>
---
v2:
  - Drop unneeded oneOf,
  - Add Reviewed-by.
---
 .../devicetree/bindings/i2c/renesas,riic.txt  | 32 --------
 .../devicetree/bindings/i2c/renesas,riic.yaml | 82 +++++++++++++++++++
 MAINTAINERS                                   |  2 +-
 3 files changed, 83 insertions(+), 33 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/renesas,riic.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/renesas,riic.yaml

diff --git a/Documentation/devicetree/bindings/i2c/renesas,riic.txt b/Documentation/devicetree/bindings/i2c/renesas,riic.txt
deleted file mode 100644
index e26fe3ad86a9509f..0000000000000000
--- a/Documentation/devicetree/bindings/i2c/renesas,riic.txt
+++ /dev/null
@@ -1,32 +0,0 @@
-Device tree configuration for Renesas RIIC driver
-
-Required properties:
-- compatible      :
-	"renesas,riic-r7s72100" if the device is a part of a R7S72100 SoC.
-	"renesas,riic-r7s9210" if the device is a part of a R7S9210 SoC.
-	"renesas,riic-rz" for a generic RZ/A compatible device.
-- reg             : address start and address range size of device
-- interrupts      : 8 interrupts (TEI, RI, TI, SPI, STI, NAKI, ALI, TMOI)
-- clock-frequency : frequency of bus clock in Hz
-- #address-cells  : should be <1>
-- #size-cells     : should be <0>
-
-Pinctrl properties might be needed, too. See there.
-
-Example:
-
-	i2c0: i2c@fcfee000 {
-		compatible = "renesas,riic-r7s72100", "renesas,riic-rz";
-		reg = <0xfcfee000 0x44>;
-		interrupts = <0 157 IRQ_TYPE_LEVEL_HIGH>,
-			     <0 158 IRQ_TYPE_EDGE_RISING>,
-			     <0 159 IRQ_TYPE_EDGE_RISING>,
-			     <0 160 IRQ_TYPE_LEVEL_HIGH>,
-			     <0 161 IRQ_TYPE_LEVEL_HIGH>,
-			     <0 162 IRQ_TYPE_LEVEL_HIGH>,
-			     <0 163 IRQ_TYPE_LEVEL_HIGH>,
-			     <0 164 IRQ_TYPE_LEVEL_HIGH>;
-		clock-frequency = <100000>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-	};
diff --git a/Documentation/devicetree/bindings/i2c/renesas,riic.yaml b/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
new file mode 100644
index 0000000000000000..2d6378164958ff65
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
@@ -0,0 +1,82 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/renesas,riic.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas RZ/A I2C Bus Interface (RIIC)
+
+maintainers:
+  - Chris Brandt <chris.brandt@renesas.com>
+  - Wolfram Sang <wsa+renesas@sang-engineering.com>
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - renesas,riic-r7s72100 # RZ/A1H
+          - renesas,riic-r7s9210  # RZ/A2M
+      - const: renesas,riic-rz    # RZ/A
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: Transmit End Interrupt (TEI)
+      - description: Receive Data Full Interrupt (RI)
+      - description: Transmit Data Empty Interrupt (TI)
+      - description: Stop Condition Detection Interrupt (SPI)
+      - description: Start Condition Detection Interrupt (STI)
+      - description: NACK Reception Interrupt (NAKI)
+      - description: Arbitration-Lost Interrupt (ALI)
+      - description: Timeout Interrupt (TMOI)
+
+  clock-frequency:
+    description:
+      Desired I2C bus clock frequency in Hz. The absence of this property
+      indicates the default frequency 100 kHz.
+
+  clocks:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-frequency
+  - power-domains
+  - '#address-cells'
+  - '#size-cells'
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/r7s72100-clock.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    i2c0: i2c@fcfee000 {
+            compatible = "renesas,riic-r7s72100", "renesas,riic-rz";
+            reg = <0xfcfee000 0x44>;
+            interrupts = <GIC_SPI 157 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 158 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 159 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&mstp9_clks R7S72100_CLK_I2C0>;
+            clock-frequency = <100000>;
+            power-domains = <&cpg_clocks>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index d9874c67f51fa49b..acaf1cda858ed678 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15641,7 +15641,7 @@ F:	drivers/thermal/rcar_thermal.c
 RENESAS RIIC DRIVER
 M:	Chris Brandt <chris.brandt@renesas.com>
 S:	Supported
-F:	Documentation/devicetree/bindings/i2c/renesas,riic.txt
+F:	Documentation/devicetree/bindings/i2c/renesas,riic.yaml
 F:	drivers/i2c/busses/i2c-riic.c
 
 RENESAS USB PHY DRIVER
-- 
2.25.1

