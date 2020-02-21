Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92069166D3D
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Feb 2020 04:08:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729268AbgBUDIZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Feb 2020 22:08:25 -0500
Received: from condef-10.nifty.com ([202.248.20.75]:45496 "EHLO
        condef-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727488AbgBUDIZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 Feb 2020 22:08:25 -0500
X-Greylist: delayed 560 seconds by postgrey-1.27 at vger.kernel.org; Thu, 20 Feb 2020 22:08:23 EST
Received: from conuserg-12.nifty.com ([10.126.8.75])by condef-10.nifty.com with ESMTP id 01L2uGGl005943
        for <linux-i2c@vger.kernel.org>; Fri, 21 Feb 2020 11:56:16 +0900
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id 01L2tdO7023920;
        Fri, 21 Feb 2020 11:55:40 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 01L2tdO7023920
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1582253741;
        bh=Wm9EZBLQ6fa2VaFPNXP/gUS5cdwkPG2Nxsj1pxgGwCg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=D2m8R7VOUNi1oB2rHGL6R82/XRsEFsNwTSUHNZH54JCt2yk4yEIzM8PK24keQet1a
         HwvIdoxtjRZ/s3sSquWvW8HITHAk/H4Nnz+VOE2HwSPlDsvcvZbUo2eYaXumWzd+2q
         NQiVc1av5hrXDBif1esdeDxNeLxEZhu1LBwbIL33Le79Fy9Buip8Yw9caIhJBHLae6
         newctF6gkRPR1iDaAr/8dnpMQ0eo3sSOsCd00dxq7mxs4KxlCWQm8X87zdTne/9Tyb
         G0FerbpMIkeSU1fuZKJSu4xD9PmZ+XuLrzD2IL1Lyj2ubPtpoo4n4hpOgnjEfcrUhV
         cgRKy5GWBgrlg==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Cc:     Frank Rowand <frowand.list@gmail.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] dt-bindings: i2c: Convert UniPhier FI2C controller to json-schema
Date:   Fri, 21 Feb 2020 11:55:34 +0900
Message-Id: <20200221025535.30311-2-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200221025535.30311-1-yamada.masahiro@socionext.com>
References: <20200221025535.30311-1-yamada.masahiro@socionext.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Convert the UniPhier FIFO-builtin I2C (a.k.a. FIFO) controller binding
to DT schema format.

There are two types of I2C controllers used on the UniPhier platform.
This is the new one with FIFO support, which is used on the Pro4 SoC
or newer.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 .../bindings/i2c/i2c-uniphier-f.txt           | 25 ----------
 .../bindings/i2c/socionext,uniphier-fi2c.yaml | 50 +++++++++++++++++++
 2 files changed, 50 insertions(+), 25 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-uniphier-f.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/socionext,uniphier-fi2c.yaml

diff --git a/Documentation/devicetree/bindings/i2c/i2c-uniphier-f.txt b/Documentation/devicetree/bindings/i2c/i2c-uniphier-f.txt
deleted file mode 100644
index 27fc6f8c798b..000000000000
--- a/Documentation/devicetree/bindings/i2c/i2c-uniphier-f.txt
+++ /dev/null
@@ -1,25 +0,0 @@
-UniPhier I2C controller (FIFO-builtin)
-
-Required properties:
-- compatible: should be "socionext,uniphier-fi2c".
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
-	i2c0: i2c@58780000 {
-		compatible = "socionext,uniphier-fi2c";
-		reg = <0x58780000 0x80>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		interrupts = <0 41 4>;
-		clocks = <&i2c_clk>;
-		clock-frequency = <100000>;
-	};
diff --git a/Documentation/devicetree/bindings/i2c/socionext,uniphier-fi2c.yaml b/Documentation/devicetree/bindings/i2c/socionext,uniphier-fi2c.yaml
new file mode 100644
index 000000000000..15abc022968e
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/socionext,uniphier-fi2c.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/socionext,uniphier-fi2c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: UniPhier I2C controller (FIFO-builtin)
+
+maintainers:
+  - Masahiro Yamada <yamada.masahiro@socionext.com>
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
+properties:
+  compatible:
+    const: socionext,uniphier-fi2c
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
+    i2c0: i2c@58780000 {
+        compatible = "socionext,uniphier-fi2c";
+        reg = <0x58780000 0x80>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+        interrupts = <0 41 4>;
+        clocks = <&i2c_clk>;
+        clock-frequency = <100000>;
+    };
-- 
2.17.1

