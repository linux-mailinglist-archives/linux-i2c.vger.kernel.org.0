Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 147E3372C77
	for <lists+linux-i2c@lfdr.de>; Tue,  4 May 2021 16:51:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231469AbhEDOwZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 4 May 2021 10:52:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231577AbhEDOwP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 4 May 2021 10:52:15 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BAC4C06138B
        for <linux-i2c@vger.kernel.org>; Tue,  4 May 2021 07:51:17 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:1ca1:e52f:3ec5:3ac5])
        by baptiste.telenet-ops.be with bizsmtp
        id 0erG250093aEpPb01erGMj; Tue, 04 May 2021 16:51:16 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ldwOJ-002nxg-Mc; Tue, 04 May 2021 16:51:15 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ldwOJ-00HQUi-7b; Tue, 04 May 2021 16:51:15 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Rob Herring <robh+dt@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Chris Brandt <chris.brandt@renesas.com>
Cc:     devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 4/6] dt-bindings: i2c: renesas,iic: Convert to json-schema
Date:   Tue,  4 May 2021 16:51:11 +0200
Message-Id: <ecfaf6be5e8c285db2bcc823bb1dd89931fa5c29.1620138454.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1620138454.git.geert+renesas@glider.be>
References: <cover.1620138454.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Convert the Renesas R-Mobile I2C Bus Interface (IIC) Device Tree binding
documentation to json-schema.

Document missing properties.
R-Mobile A1 and SH-Mobile have multiple interrupts.
Update the example to match reality.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
It is still not clear to me which instances on R-Car Gen2 and RZ/G1
support automatic transmission, cfr. this note for the IIC3 instance in
the Hardware User's Manual:

    Automatic transmission for PMIC control (DVFS) is not available
    because the second generation R-Car series and RZ/G series products
    do not support the DVFS function (automatic transmission can be used
    as a hardware function, but this is not meaningful for actual use
    cases).

The only thing that's clear is that R-Car E2 and RZ/G1E do not have the
automatic transmission registers.  Note that current r8a7745.dtsi and
r8a7794.dtsi do not reflect that.

This binding interpretes the note as that IIC3 does not support
automatic transmission on R-Car H2, M2-W, M2-N, and V2H, and RZ/G1H,
RZ/H1M, RZ/G1N, while the other (if any) IIC instances on these SoCs do
support automatic transmission.  This matches with the current
r8a774[234].dtsi, which do not declare compatibility with the
family-specific and generic versions.  Note that the current
r8a779[0123].dtsi still do, and thus should be updated!

Possible alternative interpretations of the note are:
  - Only IIC3 has the automatic transmission registers.  But the
    automatic transmission feature is not useful as the SoCs lack DVFS
    support.
  - All IIC instances have the automatic transmission registers, and
    IIC3 is traditionally used to control the PMIC.  But as the SoCs
    lack DVFS support, the automatic transmission feature is not useful.
    As R-Car V2H has only instance IIC3, and is documented to have
    automatic transmissiong registers, this might be the correct
    interpration?
  - Anything else?

Thanks for your comments!
---
 .../devicetree/bindings/i2c/renesas,iic.txt   |  72 --------
 .../bindings/i2c/renesas,rmobile-iic.yaml     | 160 ++++++++++++++++++
 MAINTAINERS                                   |   2 +-
 3 files changed, 161 insertions(+), 73 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/renesas,iic.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/renesas,rmobile-iic.yaml

diff --git a/Documentation/devicetree/bindings/i2c/renesas,iic.txt b/Documentation/devicetree/bindings/i2c/renesas,iic.txt
deleted file mode 100644
index 93d412832e66b682..0000000000000000
--- a/Documentation/devicetree/bindings/i2c/renesas,iic.txt
+++ /dev/null
@@ -1,72 +0,0 @@
-Device tree configuration for Renesas IIC (sh_mobile) driver
-
-Required properties:
-- compatible      :
-			- "renesas,iic-r8a73a4" (R-Mobile APE6)
-			- "renesas,iic-r8a7740" (R-Mobile A1)
-			- "renesas,iic-r8a7742" (RZ/G1H)
-			- "renesas,iic-r8a7743" (RZ/G1M)
-			- "renesas,iic-r8a7744" (RZ/G1N)
-			- "renesas,iic-r8a7745" (RZ/G1E)
-			- "renesas,iic-r8a774a1" (RZ/G2M)
-			- "renesas,iic-r8a774b1" (RZ/G2N)
-			- "renesas,iic-r8a774c0" (RZ/G2E)
-			- "renesas,iic-r8a774e1" (RZ/G2H)
-			- "renesas,iic-r8a7790" (R-Car H2)
-			- "renesas,iic-r8a7791" (R-Car M2-W)
-			- "renesas,iic-r8a7792" (R-Car V2H)
-			- "renesas,iic-r8a7793" (R-Car M2-N)
-			- "renesas,iic-r8a7794" (R-Car E2)
-			- "renesas,iic-r8a7795" (R-Car H3)
-			- "renesas,iic-r8a7796" (R-Car M3-W)
-			- "renesas,iic-r8a77961" (R-Car M3-W+)
-			- "renesas,iic-r8a77965" (R-Car M3-N)
-			- "renesas,iic-r8a77990" (R-Car E3)
-			- "renesas,iic-sh73a0" (SH-Mobile AG5)
-			- "renesas,rcar-gen2-iic" (generic R-Car Gen2 or RZ/G1
-							compatible device)
-			- "renesas,rcar-gen3-iic" (generic R-Car Gen3 or RZ/G2
-							compatible device)
-			- "renesas,rmobile-iic" (generic device)
-
-			When compatible with a generic R-Car version, nodes
-			must list the SoC-specific version corresponding to
-			the platform first followed by the generic R-Car
-			version.
-
-			When compatible with "renesas,rmobile-iic" it should
-			be the last compatibility string listed.
-
-			The r8a77990 (R-Car E3) and r8a774c0 (RZ/G2E)
-			controllers are not considered compatible with
-			"renesas,rcar-gen3-iic" or "renesas,rmobile-iic"
-			due to the absence of automatic transmission registers.
-
-- reg             : address start and address range size of device
-- interrupts      : interrupt of device
-- clocks          : clock for device
-- #address-cells  : should be <1>
-- #size-cells     : should be <0>
-
-Optional properties:
-- clock-frequency : frequency of bus clock in Hz. Default 100kHz if unset.
-- dmas            : Must contain a list of two references to DMA
-		    specifiers, one for transmission, and one for
-		    reception.
-- dma-names       : Must contain a list of two DMA names, "tx" and "rx".
-
-
-Pinctrl properties might be needed, too. See there.
-
-Example:
-
-	iic0: i2c@e6500000 {
-		compatible = "renesas,iic-r8a7790", "renesas,rcar-gen2-iic",
-			     "renesas,rmobile-iic";
-		reg = <0 0xe6500000 0 0x425>;
-		interrupts = <0 174 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&mstp3_clks R8A7790_CLK_IIC0>;
-		clock-frequency = <400000>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-	};
diff --git a/Documentation/devicetree/bindings/i2c/renesas,rmobile-iic.yaml b/Documentation/devicetree/bindings/i2c/renesas,rmobile-iic.yaml
new file mode 100644
index 0000000000000000..7aa87f64922c0fd2
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/renesas,rmobile-iic.yaml
@@ -0,0 +1,160 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/renesas,rmobile-iic.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas R-Mobile I2C Bus Interface (IIC)
+
+maintainers:
+  - Wolfram Sang <wsa+renesas@sang-engineering.com>
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - renesas,iic-r8a73a4      # R-Mobile APE6
+              - renesas,iic-r8a7740      # R-Mobile A1
+              - renesas,iic-sh73a0       # SH-Mobile AG5
+          - const: renesas,rmobile-iic   # Generic
+
+      - items:
+          - enum:
+              - renesas,iic-r8a7742      # RZ/G1H IIC[012]
+              - renesas,iic-r8a7743      # RZ/G1M IIC[01]
+              - renesas,iic-r8a7744      # RZ/G1N IIC[01]
+              - renesas,iic-r8a7790      # R-Car H2 IIC[012]
+              - renesas,iic-r8a7791      # R-Car M2-W IIC[01]
+              - renesas,iic-r8a7793      # R-Car M2-N IIC[01]
+          - const: renesas,rcar-gen2-iic # R-Car Gen2 and RZ/G1
+          - const: renesas,rmobile-iic   # Generic
+
+      - items:
+          - enum:
+              - renesas,iic-r8a774a1     # RZ/G2M
+              - renesas,iic-r8a774b1     # RZ/G2N
+              - renesas,iic-r8a774e1     # RZ/G2H
+              - renesas,iic-r8a7795      # R-Car H3
+              - renesas,iic-r8a7796      # R-Car M3-W
+              - renesas,iic-r8a77961     # R-Car M3-W+
+              - renesas,iic-r8a77965     # R-Car M3-N
+          - const: renesas,rcar-gen3-iic # R-Car Gen3 and RZ/G2
+          - const: renesas,rmobile-iic   # Generic
+
+      - items:
+            # Instances lacking automatic transmission registers are not
+            # considered compatible with family-specific or generic versions
+          - enum:
+              - renesas,iic-r8a7742      # RZ/G1H IIC3
+              - renesas,iic-r8a7743      # RZ/G1M IIC3
+              - renesas,iic-r8a7744      # RZ/G1N IIC3
+              - renesas,iic-r8a7745      # RZ/G1E
+              - renesas,iic-r8a774c0     # RZ/G2E
+              - renesas,iic-r8a7790      # R-Car H2 IIC3
+              - renesas,iic-r8a7791      # R-Car M2-W IIC3
+              - renesas,iic-r8a7792      # R-Car V2H IIC3
+              - renesas,iic-r8a7793      # R-Car M2-N IIC3
+              - renesas,iic-r8a7794      # R-Car E2
+              - renesas,iic-r8a77990     # R-Car E3
+
+  reg:
+    maxItems: 1
+
+  interrupts: true
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
+              - renesas,iic-r8a7740
+              - renesas,iic-sh73a0
+    then:
+      properties:
+        interrupts:
+          items:
+            - description: Arbitration Lost Interrupt (ALI)
+            - description: Non-acknowledge Detection Interrupt (TACKI)
+            - description: Wait Interrupt (WAITI)
+            - description: Data Transmit Enable interrupt (DTEI)
+    else:
+      properties:
+        interrupts:
+          items:
+            - description: Single combined interrupt
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,rcar-gen2-iic
+              - renesas,rcar-gen3-iic
+    then:
+      required:
+        - resets
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/r8a7790-cpg-mssr.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/r8a7790-sysc.h>
+
+    iic0: i2c@e6500000 {
+            compatible = "renesas,iic-r8a7790", "renesas,rcar-gen2-iic",
+                         "renesas,rmobile-iic";
+            reg = <0xe6500000 0x425>;
+            interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&cpg CPG_MOD 318>;
+            clock-frequency = <400000>;
+            dmas = <&dmac0 0x61>, <&dmac0 0x62>, <&dmac1 0x61>, <&dmac1 0x62>;
+            dma-names = "tx", "rx", "tx", "rx";
+            power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
+            resets = <&cpg 318>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 8a7ca33961d49daa..c8834d7a1aac0efd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15453,7 +15453,7 @@ RENESAS R-CAR I2C DRIVERS
 M:	Wolfram Sang <wsa+renesas@sang-engineering.com>
 S:	Supported
 F:	Documentation/devicetree/bindings/i2c/renesas,rcar-i2c.yaml
-F:	Documentation/devicetree/bindings/i2c/renesas,iic.txt
+F:	Documentation/devicetree/bindings/i2c/renesas,rmobile-iic.yaml
 F:	drivers/i2c/busses/i2c-rcar.c
 F:	drivers/i2c/busses/i2c-sh_mobile.c
 
-- 
2.25.1

