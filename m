Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23AEF166D38
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Feb 2020 04:04:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729412AbgBUDEa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Feb 2020 22:04:30 -0500
Received: from condef-07.nifty.com ([202.248.20.72]:20414 "EHLO
        condef-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729268AbgBUDEa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 Feb 2020 22:04:30 -0500
Received: from conuserg-12.nifty.com ([10.126.8.75])by condef-07.nifty.com with ESMTP id 01L2uGOm010103
        for <linux-i2c@vger.kernel.org>; Fri, 21 Feb 2020 11:56:16 +0900
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id 01L2tdO6023920;
        Fri, 21 Feb 2020 11:55:40 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 01L2tdO6023920
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1582253740;
        bh=vTMt2uEoaFnRBKMBfZKu0mlCweAUU3le5mGsF2+Dxrc=;
        h=From:To:Cc:Subject:Date:From;
        b=0AGAWm2hC1GtMKf5Lby8tvCdTujIg1GgmQko91NvqDiYxQqWiIVBfBIhdT3LY5GEX
         renzjQU5ZIwooALJrkcxAeHWHbZm1hNNIWDOwqLZxhZW//UA+dM4UmqZpQJ2d7Y2tk
         ArJhUz76R0cYi0WLnuKobHu2/W5pIf4RdHw3TXkH8h/avfaXIMYJhiWpRYnHIEbAPh
         1j0ilH4jzqfnA3DLoTe6qpm3kebAj9qvLF+JbdPmhng9Zz+7qjUazkPqZ3X7PpkmMw
         EBucMAwYNbS4XpZU8w8EtAy1H+cAfaqyEC2Px/bU6E/VZrEWFjJ98VGy3xiO6uIv2K
         uEf2Z5xKsySWg==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Cc:     Frank Rowand <frowand.list@gmail.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: i2c: Convert UniPhier I2C controller to json-schema
Date:   Fri, 21 Feb 2020 11:55:33 +0900
Message-Id: <20200221025535.30311-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Convert the UniPhier I2C controller (FIFO-less) binding to DT schema
format.

There are two types of I2C controllers used on the UniPhier platform.
This is the legacy one without FIFO support, which is used on the
sLD8 SoC or older.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

When I search for a subsystem-common schema, I need to
look in both dt-schema project and the kernel tree.

For example,
the i2c-controller.yaml is located in the dt-schema project.
dt-schema/schemas/i2c/i2c-controller.yaml

The dma-controller.yaml is located in the kernel tree.
Documentation/devicetree/bindings/dma/dma-controller.yaml

I am still wondering about the policy...

As far as I understood, the schema written by Rob
tend to go in the dt-schma project. Is this correct?


 .../devicetree/bindings/i2c/i2c-uniphier.txt  | 25 ----------
 .../bindings/i2c/socionext,uniphier-i2c.yaml  | 50 +++++++++++++++++++
 2 files changed, 50 insertions(+), 25 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-uniphier.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/socionext,uniphier-i2c.yaml

diff --git a/Documentation/devicetree/bindings/i2c/i2c-uniphier.txt b/Documentation/devicetree/bindings/i2c/i2c-uniphier.txt
deleted file mode 100644
index 26f9d95b3436..000000000000
--- a/Documentation/devicetree/bindings/i2c/i2c-uniphier.txt
+++ /dev/null
@@ -1,25 +0,0 @@
-UniPhier I2C controller (FIFO-less)
-
-Required properties:
-- compatible: should be "socionext,uniphier-i2c".
-- #address-cells: should be 1.
-- #size-cells: should be 0.
-- reg: offset and length of the register set for the device.
-- interrupts: a single interrupt specifier.
-- clocks: phandle to the input clock.
-
-Optional properties:
-- clock-frequency: desired I2C bus frequency in Hz.  The maximum supported
-  value is 400000.  Defaults to 100000 if not specified.
-
-Examples:
-
-	i2c0: i2c@58400000 {
-		compatible = "socionext,uniphier-i2c";
-		reg = <0x58400000 0x40>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		interrupts = <0 41 1>;
-		clocks = <&i2c_clk>;
-		clock-frequency = <100000>;
-	};
diff --git a/Documentation/devicetree/bindings/i2c/socionext,uniphier-i2c.yaml b/Documentation/devicetree/bindings/i2c/socionext,uniphier-i2c.yaml
new file mode 100644
index 000000000000..ef998def554e
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/socionext,uniphier-i2c.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/socionext,uniphier-i2c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: UniPhier I2C controller (FIFO-less)
+
+maintainers:
+  - Masahiro Yamada <yamada.masahiro@socionext.com>
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
+properties:
+  compatible:
+    const: socionext,uniphier-i2c
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
+  clock-frequency:
+    minimum: 100000
+    maximum: 400000
+
+required:
+  - compatible
+  - reg
+  - "#address-cells"
+  - "#size-cells"
+  - interrupts
+  - clocks
+
+examples:
+  - |
+    i2c0: i2c@58400000 {
+        compatible = "socionext,uniphier-i2c";
+        reg = <0x58400000 0x40>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+        interrupts = <0 41 1>;
+        clocks = <&i2c_clk>;
+        clock-frequency = <100000>;
+    };
-- 
2.17.1

