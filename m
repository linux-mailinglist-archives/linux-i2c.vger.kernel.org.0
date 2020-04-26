Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC8D21B9357
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Apr 2020 21:01:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726205AbgDZS7Q (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 26 Apr 2020 14:59:16 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:58890 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726004AbgDZS7Q (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 26 Apr 2020 14:59:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1587927545; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=LBcEz9by+T4cFgShyhpvICcXahPKT+AnlbYY5I/mqIw=;
        b=J1r27QurD8bfCdUW3P9HroiZx+syuKqbnQSd/IWk+JgNKDWJR0SOW1X8vB4tlS9N2tyUhv
        aeM+vnFie2Dn4iM9Jtof2wCw+iD2IIIvIVxFmwe1z7ybRBK9tFm1m7MORfUlbCTEWjrHno
        y7xVX+v/OlgVxM/pCrPxA/JiSrWcnk0=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     od@zcrc.me,
        =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0?= <zhouyanjie@wanyeetech.com>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-i2c@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 2/8] dt-bindings: intc: Convert ingenic,intc.txt to YAML
Date:   Sun, 26 Apr 2020 20:58:50 +0200
Message-Id: <20200426185856.38826-2-paul@crapouillou.net>
In-Reply-To: <20200426185856.38826-1-paul@crapouillou.net>
References: <20200426185856.38826-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Convert the ingenic,intc.txt doc file to ingenic,intc.yaml.

Some compatible strings now require a fallback, as the controller
generally works the same across the SoCs families.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 .../interrupt-controller/ingenic,intc.txt     | 28 ---------
 .../interrupt-controller/ingenic,intc.yaml    | 63 +++++++++++++++++++
 2 files changed, 63 insertions(+), 28 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/ingenic,intc.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/ingenic,intc.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/ingenic,intc.txt b/Documentation/devicetree/bindings/interrupt-controller/ingenic,intc.txt
deleted file mode 100644
index d4373d0f7121..000000000000
--- a/Documentation/devicetree/bindings/interrupt-controller/ingenic,intc.txt
+++ /dev/null
@@ -1,28 +0,0 @@
-Ingenic SoC Interrupt Controller
-
-Required properties:
-
-- compatible : should be "ingenic,<socname>-intc". Valid strings are:
-    ingenic,jz4740-intc
-    ingenic,jz4725b-intc
-    ingenic,jz4770-intc
-    ingenic,jz4775-intc
-    ingenic,jz4780-intc
-- reg : Specifies base physical address and size of the registers.
-- interrupt-controller : Identifies the node as an interrupt controller
-- #interrupt-cells : Specifies the number of cells needed to encode an
-  interrupt source. The value shall be 1.
-- interrupts : Specifies the CPU interrupt the controller is connected to.
-
-Example:
-
-intc: interrupt-controller@10001000 {
-	compatible = "ingenic,jz4740-intc";
-	reg = <0x10001000 0x14>;
-
-	interrupt-controller;
-	#interrupt-cells = <1>;
-
-	interrupt-parent = <&cpuintc>;
-	interrupts = <2>;
-};
diff --git a/Documentation/devicetree/bindings/interrupt-controller/ingenic,intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/ingenic,intc.yaml
new file mode 100644
index 000000000000..28b27e1a6e9d
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/ingenic,intc.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/ingenic,intc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ingenic SoCs interrupt controller devicetree bindings
+
+maintainers:
+  - Paul Cercueil <paul@crapouillou.net>
+
+properties:
+  $nodename:
+    pattern: "^interrupt-controller@[0-9a-f]+$"
+
+  compatible:
+    oneOf:
+      - enum:
+        - ingenic,jz4740-intc
+        - ingenic,jz4760-intc
+        - ingenic,jz4780-intc
+      - items:
+        - enum:
+          - ingenic,jz4775-intc
+          - ingenic,jz4770-intc
+        - const: ingenic,jz4760-intc
+      - items:
+        - const: ingenic,x1000-intc
+        - const: ingenic,jz4780-intc
+      - items:
+        - const: ingenic,jz4725b-intc
+        - const: ingenic,jz4740-intc
+
+  "#interrupt-cells":
+    const: 1
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller: true
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - "#interrupt-cells"
+  - interrupt-controller
+
+examples:
+  - |
+    intc: interrupt-controller@10001000 {
+      compatible = "ingenic,jz4770-intc", "ingenic,jz4760-intc";
+      reg = <0x10001000 0x40>;
+
+      interrupt-controller;
+      #interrupt-cells = <1>;
+
+      interrupt-parent = <&cpuintc>;
+      interrupts = <2>;
+    };
-- 
2.26.2

