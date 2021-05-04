Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6AF9372C80
	for <lists+linux-i2c@lfdr.de>; Tue,  4 May 2021 16:51:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231640AbhEDOwd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 4 May 2021 10:52:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231535AbhEDOwV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 4 May 2021 10:52:21 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30218C061346
        for <linux-i2c@vger.kernel.org>; Tue,  4 May 2021 07:51:18 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:1ca1:e52f:3ec5:3ac5])
        by baptiste.telenet-ops.be with bizsmtp
        id 0erG2500x3aEpPb01erGN7; Tue, 04 May 2021 16:51:16 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ldwOK-002nxh-8d; Tue, 04 May 2021 16:51:16 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ldwOJ-00HQUm-9o; Tue, 04 May 2021 16:51:15 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Rob Herring <robh+dt@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Chris Brandt <chris.brandt@renesas.com>
Cc:     devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 5/6] dt-bindings: i2c: renesas,riic: Convert to json-schema
Date:   Tue,  4 May 2021 16:51:12 +0200
Message-Id: <e1bb5790675b6f4a518c6a9cbc22eb7452a2f78c.1620138454.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1620138454.git.geert+renesas@glider.be>
References: <cover.1620138454.git.geert+renesas@glider.be>
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
---
 .../devicetree/bindings/i2c/renesas,riic.txt  | 32 -------
 .../devicetree/bindings/i2c/renesas,riic.yaml | 83 +++++++++++++++++++
 MAINTAINERS                                   |  2 +-
 3 files changed, 84 insertions(+), 33 deletions(-)
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
index 0000000000000000..e6951bf451d95cff
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
@@ -0,0 +1,83 @@
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
+    oneOf:
+      - items:
+          - enum:
+              - renesas,riic-r7s72100 # RZ/A1H
+              - renesas,riic-r7s9210  # RZ/A2M
+          - const: renesas,riic-rz    # RZ/A
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
index c8834d7a1aac0efd..ea519a8ffc6a9356 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15469,7 +15469,7 @@ F:	drivers/thermal/rcar_thermal.c
 RENESAS RIIC DRIVER
 M:	Chris Brandt <chris.brandt@renesas.com>
 S:	Supported
-F:	Documentation/devicetree/bindings/i2c/renesas,riic.txt
+F:	Documentation/devicetree/bindings/i2c/renesas,riic.yaml
 F:	drivers/i2c/busses/i2c-riic.c
 
 RENESAS USB PHY DRIVER
-- 
2.25.1

