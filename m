Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 877821B9370
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Apr 2020 21:02:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726166AbgDZS7u (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 26 Apr 2020 14:59:50 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:59010 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726004AbgDZS7u (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 26 Apr 2020 14:59:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1587927551; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4g9D4y5gDtWMMffSqwXa5g3+cluAqfYCl9HnWWe2i54=;
        b=odiYDHWnFPVSxmcMC8qtWCwc2Zt9LEnWgvXRbcr3KT6IdjyQbI2tDd5ZyS++f2DvZgh+bn
        1OeHDLyfoPZTnxbZjK6DPB/95K61//aVz/92NgXI3Zl1a9HtrYDHI9gFnUgmjeZbBcrdwk
        iVhkBOZU1Qvoew2RkpkAI7LWAavNOHs=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     od@zcrc.me,
        =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0?= <zhouyanjie@wanyeetech.com>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-i2c@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 6/8] dt-bindings: i2c: Convert i2c-jz4780.txt to YAML
Date:   Sun, 26 Apr 2020 20:58:54 +0200
Message-Id: <20200426185856.38826-6-paul@crapouillou.net>
In-Reply-To: <20200426185856.38826-1-paul@crapouillou.net>
References: <20200426185856.38826-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Convert the i2c-jz4780.txt file to ingenic,i2c.yaml.

Two things were changed in the process:
- the clock-frequency property can now only be set to the two values
  that can be set by the hardware;
- the dmas and dma-names properties are now required.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 .../devicetree/bindings/i2c/i2c-jz4780.txt    | 33 --------
 .../devicetree/bindings/i2c/ingenic,i2c.yaml  | 83 +++++++++++++++++++
 2 files changed, 83 insertions(+), 33 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-jz4780.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/ingenic,i2c.yaml

diff --git a/Documentation/devicetree/bindings/i2c/i2c-jz4780.txt b/Documentation/devicetree/bindings/i2c/i2c-jz4780.txt
deleted file mode 100644
index d229eff5ca1b..000000000000
--- a/Documentation/devicetree/bindings/i2c/i2c-jz4780.txt
+++ /dev/null
@@ -1,33 +0,0 @@
-* Ingenic JZ4780 I2C Bus controller
-
-Required properties:
-- compatible: should be one of the following:
-  - "ingenic,jz4780-i2c" for the JZ4780
-  - "ingenic,x1000-i2c" for the X1000
-- reg: Should contain the address & size of the I2C controller registers.
-- interrupts: Should specify the interrupt provided by parent.
-- clocks: Should contain a single clock specifier for the JZ4780 I2C clock.
-- clock-frequency: desired I2C bus clock frequency in Hz.
-
-Recommended properties:
-- pinctrl-names: should be "default";
-- pinctrl-0: phandle to pinctrl function
-
-Example
-
-/ {
-	i2c4: i2c4@10054000 {
-		compatible = "ingenic,jz4780-i2c";
-		reg = <0x10054000 0x1000>;
-
-		interrupt-parent = <&intc>;
-		interrupts = <56>;
-
-		clocks = <&cgu JZ4780_CLK_SMB4>;
-		clock-frequency = <100000>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&pins_i2c4_data>;
-
-	};
-};
-
diff --git a/Documentation/devicetree/bindings/i2c/ingenic,i2c.yaml b/Documentation/devicetree/bindings/i2c/ingenic,i2c.yaml
new file mode 100644
index 000000000000..4759b9a3eb18
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/ingenic,i2c.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/ingenic,i2c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ingenic SoCs I2C controller devicetree bindings
+
+maintainers:
+  - Paul Cercueil <paul@crapouillou.net>
+
+properties:
+  $nodename:
+    pattern: "^i2c@[0-9a-f]+$"
+
+  compatible:
+    enum:
+      - ingenic,jz4780-i2c
+      - ingenic,x1000-i2c
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
+    enum: [ 100000, 400000 ]
+
+  dmas:
+    items:
+      - description: DMA controller phandle and request line for RX
+      - description: DMA controller phandle and request line for TX
+
+  dma-names:
+    items:
+      - const: rx
+      - const: tx
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-frequency
+  - dmas
+  - dma-names
+
+examples:
+  - |
+    #include <dt-bindings/clock/jz4780-cgu.h>
+    #include <dt-bindings/dma/jz4780-dma.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c@10054000 {
+      compatible = "ingenic,jz4780-i2c";
+      #address-cells = <1>;
+      #size-cells = <0>;
+      reg = <0x10054000 0x1000>;
+
+      interrupt-parent = <&intc>;
+      interrupts = <56>;
+
+      clocks = <&cgu JZ4780_CLK_SMB4>;
+      pinctrl-names = "default";
+      pinctrl-0 = <&pins_i2c4_data>;
+
+      dmas = <&dma JZ4780_DMA_SMB4_RX 0xffffffff>,
+             <&dma JZ4780_DMA_SMB4_TX 0xffffffff>;
+      dma-names = "rx", "tx";
+
+      clock-frequency = <400000>;
+
+      rtc@51 {
+        compatible = "nxp,pcf8563";
+        reg = <0x51>;
+
+        interrupt-parent = <&gpf>;
+        interrupts = <30 IRQ_TYPE_LEVEL_LOW>;
+      };
+    };
-- 
2.26.2

