Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A75091B9347
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Apr 2020 20:59:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726312AbgDZS7I (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 26 Apr 2020 14:59:08 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:58818 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726191AbgDZS7H (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 26 Apr 2020 14:59:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1587927544; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:references; bh=MPcskCveO2zpxatA04dSJRF87yAOrKmZ9Wd1I3xcHTU=;
        b=Z6/fqZftGdOUEtMtcu02nGndmzyxIBgeOF9dPZBgE5ifLiRAyektZNhiEL0ueCc3Iuk9Fo
        hXLnc6XscOR9Fbncc4E7XDFz9GllPXw7KS0Xn/IGPrD2HbdBeplzxpdR6vHzuRIWSpa3ff
        Y+t9/96FUmUzzA+qCK1I+9CPwK4JJhY=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     od@zcrc.me,
        =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0?= <zhouyanjie@wanyeetech.com>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-i2c@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 1/8] dt-bindings: clock: Convert ingenic,cgu.txt to YAML
Date:   Sun, 26 Apr 2020 20:58:49 +0200
Message-Id: <20200426185856.38826-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Convert the ingenic,cgu.txt doc file to ingenic,cgu.yaml.

The binding documentation has been updated as well. The node can have a
child node that corresponds to the USB PHY, which happens to be present
in the middle of the CGU registers.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 .../devicetree/bindings/clock/ingenic,cgu.txt |  57 --------
 .../bindings/clock/ingenic,cgu.yaml           | 122 ++++++++++++++++++
 2 files changed, 122 insertions(+), 57 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/ingenic,cgu.txt
 create mode 100644 Documentation/devicetree/bindings/clock/ingenic,cgu.yaml

diff --git a/Documentation/devicetree/bindings/clock/ingenic,cgu.txt b/Documentation/devicetree/bindings/clock/ingenic,cgu.txt
deleted file mode 100644
index 75598e655067..000000000000
--- a/Documentation/devicetree/bindings/clock/ingenic,cgu.txt
+++ /dev/null
@@ -1,57 +0,0 @@
-Ingenic SoC CGU binding
-
-The CGU in an Ingenic SoC provides all the clocks generated on-chip. It
-typically includes a variety of PLLs, multiplexers, dividers & gates in order
-to provide many different clock signals derived from only 2 external source
-clocks.
-
-Required properties:
-- compatible : Should be one of:
-  * ingenic,jz4740-cgu
-  * ingenic,jz4725b-cgu
-  * ingenic,jz4770-cgu
-  * ingenic,jz4780-cgu
-  * ingenic,x1000-cgu
-- reg : The address & length of the CGU registers.
-- clocks : List of phandle & clock specifiers for clocks external to the CGU.
-  Two such external clocks should be specified - first the external crystal
-  "ext" and second the RTC clock source "rtc".
-- clock-names : List of name strings for the external clocks.
-- #clock-cells: Should be 1.
-  Clock consumers specify this argument to identify a clock. The valid values
-  may be found in <dt-bindings/clock/<soctype>-cgu.h>.
-
-Example SoC include file:
-
-/ {
-	cgu: jz4740-cgu {
-		compatible = "ingenic,jz4740-cgu";
-		reg = <0x10000000 0x100>;
-		#clock-cells = <1>;
-	};
-
-	uart0: serial@10030000 {
-		clocks = <&cgu JZ4740_CLK_UART0>;
-	};
-};
-
-Example board file:
-
-/ {
-	ext: clock@0 {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <12000000>;
-	};
-
-	rtc: clock@1 {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <32768>;
-	};
-
-	&cgu {
-		clocks = <&ext> <&rtc>;
-		clock-names: "ext", "rtc";
-	};
-};
diff --git a/Documentation/devicetree/bindings/clock/ingenic,cgu.yaml b/Documentation/devicetree/bindings/clock/ingenic,cgu.yaml
new file mode 100644
index 000000000000..0281cd1d7e1b
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/ingenic,cgu.yaml
@@ -0,0 +1,122 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/ingenic,cgu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ingenic SoCs CGU devicetree bindings
+
+description: |
+  The CGU in an Ingenic SoC provides all the clocks generated on-chip. It
+  typically includes a variety of PLLs, multiplexers, dividers & gates in order
+  to provide many different clock signals derived from only 2 external source
+  clocks.
+
+maintainers:
+  - Paul Cercueil <paul@crapouillou.net>
+
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - ingenic,jz4740-cgu
+          - ingenic,jz4725b-cgu
+          - ingenic,jz4770-cgu
+          - ingenic,jz4780-cgu
+          - ingenic,x1000-cgu
+  required:
+    - compatible
+
+properties:
+  $nodename:
+    pattern: "^clock-controller@[0-9a-f]+$"
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+  "#clock-cells":
+    const: 1
+
+  ranges: true
+
+  compatible:
+    items:
+      - enum:
+        - ingenic,jz4740-cgu
+        - ingenic,jz4725b-cgu
+        - ingenic,jz4770-cgu
+        - ingenic,jz4780-cgu
+        - ingenic,x1000-cgu
+      - const: simple-mfd
+    minItems: 1
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: External oscillator clock
+      - description: Internal 32 kHz RTC clock
+
+  clock-names:
+    items:
+      - const: ext
+      - enum:
+        - rtc
+        - osc32k # Different name, same clock
+
+  assigned-clocks:
+    minItems: 1
+    maxItems: 64
+
+  assigned-clock-parents:
+    minItems: 1
+    maxItems: 64
+
+  assigned-clock-rates:
+    minItems: 1
+    maxItems: 64
+
+required:
+  - "#clock-cells"
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+
+patternProperties:
+  "^usb-phy@[a-f0-9]+$":
+    allOf: [ $ref: "../usb/ingenic,jz4770-phy.yaml#" ]
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/jz4770-cgu.h>
+    cgu: clock-controller@10000000 {
+      compatible = "ingenic,jz4770-cgu", "simple-mfd";
+      reg = <0x10000000 0x100>;
+      #address-cells = <1>;
+      #size-cells = <1>;
+      ranges = <0x0 0x10000000 0x100>;
+
+      clocks = <&ext>, <&osc32k>;
+      clock-names = "ext", "osc32k";
+
+      #clock-cells = <1>;
+
+      otg_phy: usb-phy@3c {
+        compatible = "ingenic,jz4770-phy";
+        reg = <0x3c 0x10>;
+
+        clocks = <&cgu JZ4770_CLK_OTG_PHY>;
+
+        vcc-supply = <&ldo5>;
+
+        #phy-cells = <0>;
+      };
+    };
-- 
2.26.2

