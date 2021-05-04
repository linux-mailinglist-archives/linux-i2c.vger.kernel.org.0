Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 478B1372C7C
	for <lists+linux-i2c@lfdr.de>; Tue,  4 May 2021 16:51:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231674AbhEDOw1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 4 May 2021 10:52:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231633AbhEDOwU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 4 May 2021 10:52:20 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2A7EC061343
        for <linux-i2c@vger.kernel.org>; Tue,  4 May 2021 07:51:17 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:1ca1:e52f:3ec5:3ac5])
        by baptiste.telenet-ops.be with bizsmtp
        id 0erG2500q3aEpPb01erGMy; Tue, 04 May 2021 16:51:16 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ldwOK-002nxj-3N; Tue, 04 May 2021 16:51:16 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ldwOJ-00HQUr-B2; Tue, 04 May 2021 16:51:15 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Rob Herring <robh+dt@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Chris Brandt <chris.brandt@renesas.com>
Cc:     devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 6/6] dt-bindings: i2c: renesas,iic-emev2: Convert to json-schema
Date:   Tue,  4 May 2021 16:51:13 +0200
Message-Id: <3a72f4353b24c4d790a216bfde1b284800b3029a.1620138454.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1620138454.git.geert+renesas@glider.be>
References: <cover.1620138454.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Convert the Renesas EMMA Mobile EV2 IIC Interface (IIC) Device Tree
binding documentation to json-schema.

Document missing properties.
Update the example to match reality.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../bindings/i2c/renesas,iic-emev2.txt        | 22 --------
 .../bindings/i2c/renesas,iic-emev2.yaml       | 54 +++++++++++++++++++
 MAINTAINERS                                   |  2 +-
 3 files changed, 55 insertions(+), 23 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/renesas,iic-emev2.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/renesas,iic-emev2.yaml

diff --git a/Documentation/devicetree/bindings/i2c/renesas,iic-emev2.txt b/Documentation/devicetree/bindings/i2c/renesas,iic-emev2.txt
deleted file mode 100644
index 5ed1ea1c7e14a9cd..0000000000000000
--- a/Documentation/devicetree/bindings/i2c/renesas,iic-emev2.txt
+++ /dev/null
@@ -1,22 +0,0 @@
-Device tree configuration for Renesas EMEV2 IIC controller
-
-Required properties:
-- compatible      : "renesas,iic-emev2"
-- reg             : address start and address range size of device
-- interrupts      : specifier for the IIC controller interrupt
-- clocks          : phandle to the IP core SCLK
-- clock-names     : must be "sclk"
-- #address-cells  : should be <1>
-- #size-cells     : should be <0>
-
-Example:
-
-	iic0: i2c@e0070000 {
-		#address-cells = <1>;
-		#size-cells = <0>;
-		compatible = "renesas,iic-emev2";
-		reg = <0xe0070000 0x28>;
-		interrupts = <0 32 IRQ_TYPE_EDGE_RISING>;
-		clocks = <&iic0_sclk>;
-		clock-names = "sclk";
-	};
diff --git a/Documentation/devicetree/bindings/i2c/renesas,iic-emev2.yaml b/Documentation/devicetree/bindings/i2c/renesas,iic-emev2.yaml
new file mode 100644
index 0000000000000000..17c1102562be98e7
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/renesas,iic-emev2.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/renesas,iic-emev2.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas EMMA Mobile EV2 IIC Interface
+
+maintainers:
+  - Wolfram Sang <wsa+renesas@sang-engineering.com>
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
+properties:
+  compatible:
+    const: renesas,iic-emev2
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
+  clock-names:
+    const: sclk
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - '#address-cells'
+  - '#size-cells'
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    iic0: i2c@e0070000 {
+            #address-cells = <1>;
+            #size-cells = <0>;
+            compatible = "renesas,iic-emev2";
+            reg = <0xe0070000 0x28>;
+            interrupts = <GIC_SPI 32 IRQ_TYPE_EDGE_RISING>;
+            clocks = <&iic0_sclk>;
+            clock-names = "sclk";
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index ea519a8ffc6a9356..c9e5749a4402c441 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15431,7 +15431,7 @@ F:	drivers/clk/renesas/
 RENESAS EMEV2 I2C DRIVER
 M:	Wolfram Sang <wsa+renesas@sang-engineering.com>
 S:	Supported
-F:	Documentation/devicetree/bindings/i2c/renesas,iic-emev2.txt
+F:	Documentation/devicetree/bindings/i2c/renesas,iic-emev2.yaml
 F:	drivers/i2c/busses/i2c-emev2.c
 
 RENESAS ETHERNET DRIVERS
-- 
2.25.1

