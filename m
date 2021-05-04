Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88F6F372C29
	for <lists+linux-i2c@lfdr.de>; Tue,  4 May 2021 16:36:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231313AbhEDOhD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 4 May 2021 10:37:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231248AbhEDOhB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 4 May 2021 10:37:01 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A15AC06138F
        for <linux-i2c@vger.kernel.org>; Tue,  4 May 2021 07:36:05 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:1ca1:e52f:3ec5:3ac5])
        by baptiste.telenet-ops.be with bizsmtp
        id 0ec32500R3aEpPb01ec3xM; Tue, 04 May 2021 16:36:03 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ldw9b-002njz-2s; Tue, 04 May 2021 16:36:03 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ldw9a-00HQA3-CR; Tue, 04 May 2021 16:36:02 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Rob Herring <robh+dt@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Chris Brandt <chris.brandt@renesas.com>
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/6] dt-bindings: i2c: renesas,i2c: Convert to json-schema
Date:   Tue,  4 May 2021 16:35:55 +0200
Message-Id: <e80b6d1825d280b25f00a980c2caf778c9907d85.1620138454.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1620138454.git.geert+renesas@glider.be>
References: <cover.1620138454.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Convert the Renesas R-Car I2C Controller Device Tree binding
documentation to json-schema.

Document missing properties.
Make the clocks property required.
DMA is supported on R-Car Gen3 and RZ/G2 only.
Update the example to match reality.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../devicetree/bindings/i2c/renesas,i2c.txt   |  66 --------
 .../bindings/i2c/renesas,rcar-i2c.yaml        | 158 ++++++++++++++++++
 MAINTAINERS                                   |   2 +-
 3 files changed, 159 insertions(+), 67 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/renesas,i2c.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/renesas,rcar-i2c.yaml

diff --git a/Documentation/devicetree/bindings/i2c/renesas,i2c.txt b/Documentation/devicetree/bindings/i2c/renesas,i2c.txt
deleted file mode 100644
index f4240fcf28bbf6eb..0000000000000000
--- a/Documentation/devicetree/bindings/i2c/renesas,i2c.txt
+++ /dev/null
@@ -1,66 +0,0 @@
-I2C for R-Car platforms
-
-Required properties:
-- compatible:
-	"renesas,i2c-r8a7742" if the device is a part of a R8A7742 SoC.
-	"renesas,i2c-r8a7743" if the device is a part of a R8A7743 SoC.
-	"renesas,i2c-r8a7744" if the device is a part of a R8A7744 SoC.
-	"renesas,i2c-r8a7745" if the device is a part of a R8A7745 SoC.
-	"renesas,i2c-r8a77470" if the device is a part of a R8A77470 SoC.
-	"renesas,i2c-r8a774a1" if the device is a part of a R8A774A1 SoC.
-	"renesas,i2c-r8a774b1" if the device is a part of a R8A774B1 SoC.
-	"renesas,i2c-r8a774c0" if the device is a part of a R8A774C0 SoC.
-	"renesas,i2c-r8a774e1" if the device is a part of a R8A774E1 SoC.
-	"renesas,i2c-r8a7778" if the device is a part of a R8A7778 SoC.
-	"renesas,i2c-r8a7779" if the device is a part of a R8A7779 SoC.
-	"renesas,i2c-r8a7790" if the device is a part of a R8A7790 SoC.
-	"renesas,i2c-r8a7791" if the device is a part of a R8A7791 SoC.
-	"renesas,i2c-r8a7792" if the device is a part of a R8A7792 SoC.
-	"renesas,i2c-r8a7793" if the device is a part of a R8A7793 SoC.
-	"renesas,i2c-r8a7794" if the device is a part of a R8A7794 SoC.
-	"renesas,i2c-r8a7795" if the device is a part of a R8A7795 SoC.
-	"renesas,i2c-r8a7796" if the device is a part of a R8A77960 SoC.
-	"renesas,i2c-r8a77961" if the device is a part of a R8A77961 SoC.
-	"renesas,i2c-r8a77965" if the device is a part of a R8A77965 SoC.
-	"renesas,i2c-r8a77970" if the device is a part of a R8A77970 SoC.
-	"renesas,i2c-r8a77980" if the device is a part of a R8A77980 SoC.
-	"renesas,i2c-r8a77990" if the device is a part of a R8A77990 SoC.
-	"renesas,i2c-r8a77995" if the device is a part of a R8A77995 SoC.
-	"renesas,i2c-r8a779a0" if the device is a part of a R8A779A0 SoC.
-	"renesas,rcar-gen1-i2c" for a generic R-Car Gen1 compatible device.
-	"renesas,rcar-gen2-i2c" for a generic R-Car Gen2 or RZ/G1 compatible
-				device.
-	"renesas,rcar-gen3-i2c" for a generic R-Car Gen3 or RZ/G2 compatible
-				device.
-
-	When compatible with the generic version, nodes must list the
-	SoC-specific version corresponding to the platform first followed
-	by the generic version.
-
-- reg: physical base address of the controller and length of memory mapped
-  region.
-- interrupts: interrupt specifier.
-
-Optional properties:
-- clock-frequency: desired I2C bus clock frequency in Hz. The absence of this
-  property indicates the default frequency 100 kHz.
-- clocks: clock specifier.
-- dmas: Must contain a list of two references to DMA specifiers, one for
-  transmission, and one for reception.
-- dma-names: Must contain a list of two DMA names, "tx" and "rx".
-
-- i2c-scl-falling-time-ns: see i2c.txt
-- i2c-scl-internal-delay-ns: see i2c.txt
-- i2c-scl-rising-time-ns: see i2c.txt
-
-Examples :
-
-i2c0: i2c@e6508000 {
-	#address-cells = <1>;
-	#size-cells = <0>;
-	compatible = "renesas,i2c-r8a7791", "renesas,rcar-gen2-i2c";
-	reg = <0 0xe6508000 0 0x40>;
-	interrupts = <0 287 IRQ_TYPE_LEVEL_HIGH>;
-	clocks = <&mstp9_clks R8A7791_CLK_I2C0>;
-	clock-frequency = <400000>;
-};
diff --git a/Documentation/devicetree/bindings/i2c/renesas,rcar-i2c.yaml b/Documentation/devicetree/bindings/i2c/renesas,rcar-i2c.yaml
new file mode 100644
index 0000000000000000..052aad44e781a561
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/renesas,rcar-i2c.yaml
@@ -0,0 +1,158 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/renesas,rcar-i2c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas R-Car I2C Controller
+
+maintainers:
+  - Wolfram Sang <wsa+renesas@sang-engineering.com>
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - renesas,i2c-r8a7778      # R-Car M1A
+              - renesas,i2c-r8a7779      # R-Car H1
+          - const: renesas,rcar-gen1-i2c # R-Car Gen1
+
+      - items:
+          - enum:
+              - renesas,i2c-r8a7742      # RZ/G1H
+              - renesas,i2c-r8a7743      # RZ/G1M
+              - renesas,i2c-r8a7744      # RZ/G1N
+              - renesas,i2c-r8a7745      # RZ/G1E
+              - renesas,i2c-r8a77470     # RZ/G1C
+              - renesas,i2c-r8a7790      # R-Car H2
+              - renesas,i2c-r8a7791      # R-Car M2-W
+              - renesas,i2c-r8a7792      # R-Car V2H
+              - renesas,i2c-r8a7793      # R-Car M2-N
+              - renesas,i2c-r8a7794      # R-Car E2
+          - const: renesas,rcar-gen2-i2c # R-Car Gen2 and RZ/G1
+
+      - items:
+          - enum:
+              - renesas,i2c-r8a774a1     # RZ/G2M
+              - renesas,i2c-r8a774b1     # RZ/G2N
+              - renesas,i2c-r8a774c0     # RZ/G2E
+              - renesas,i2c-r8a774e1     # RZ/G2H
+              - renesas,i2c-r8a7795      # R-Car H3
+              - renesas,i2c-r8a7796      # R-Car M3-W
+              - renesas,i2c-r8a77961     # R-Car M3-W+
+              - renesas,i2c-r8a77965     # R-Car M3-N
+              - renesas,i2c-r8a77970     # R-Car V3M
+              - renesas,i2c-r8a77980     # R-Car V3H
+              - renesas,i2c-r8a77990     # R-Car E3
+              - renesas,i2c-r8a77995     # R-Car D3
+              - renesas,i2c-r8a779a0     # R-Car V3U
+          - const: renesas,rcar-gen3-i2c # R-Car Gen3 and RZ/G2
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
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
+  resets:
+    maxItems: 1
+
+  dmas:
+    minItems: 2
+    maxItems: 4
+    description:
+      Must contain a list of pairs of references to DMA specifiers, one for
+      transmission, and one for reception.
+
+  dma-names:
+    minItems: 2
+    maxItems: 4
+    items:
+      enum:
+        - tx
+        - rx
+
+  i2c-scl-falling-time-ns:
+    default: 35
+    description:
+      Number of nanoseconds the SCL signal takes to fall; t(f) in the I2C
+      specification.
+
+  i2c-scl-internal-delay-ns:
+    default: 50
+    description:
+      Number of nanoseconds the IP core additionally needs to setup SCL.
+
+  i2c-scl-rising-time-ns:
+    default: 200
+    description:
+      Number of nanoseconds the SCL signal takes to rise; t(r) in the I2C
+      specification.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - power-domains
+  - '#address-cells'
+  - '#size-cells'
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,rcar-gen1-i2c
+              - renesas,rcar-gen2-i2c
+    then:
+      properties:
+        dmas: false
+        dma-names: false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,rcar-gen2-i2c
+              - renesas,rcar-gen3-i2c
+    then:
+      required:
+        - resets
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/r8a7791-cpg-mssr.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/r8a7791-sysc.h>
+
+    i2c0: i2c@e6508000 {
+            #address-cells = <1>;
+            #size-cells = <0>;
+            compatible = "renesas,i2c-r8a7791", "renesas,rcar-gen2-i2c";
+            reg = <0xe6508000 0x40>;
+            interrupts = <GIC_SPI 287 IRQ_TYPE_LEVEL_HIGH>;
+            clock-frequency = <400000>;
+            clocks = <&cpg CPG_MOD 931>;
+            power-domains = <&sysc R8A7791_PD_ALWAYS_ON>;
+            resets = <&cpg 931>;
+            i2c-scl-internal-delay-ns = <6>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 88a34613fa20cdb1..8a7ca33961d49daa 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15452,7 +15452,7 @@ F:	drivers/iio/adc/rcar-gyroadc.c
 RENESAS R-CAR I2C DRIVERS
 M:	Wolfram Sang <wsa+renesas@sang-engineering.com>
 S:	Supported
-F:	Documentation/devicetree/bindings/i2c/renesas,i2c.txt
+F:	Documentation/devicetree/bindings/i2c/renesas,rcar-i2c.yaml
 F:	Documentation/devicetree/bindings/i2c/renesas,iic.txt
 F:	drivers/i2c/busses/i2c-rcar.c
 F:	drivers/i2c/busses/i2c-sh_mobile.c
-- 
2.25.1

