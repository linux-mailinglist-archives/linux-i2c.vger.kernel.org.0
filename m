Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 172531B9378
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Apr 2020 21:02:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726475AbgDZS77 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 26 Apr 2020 14:59:59 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:59070 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726004AbgDZS76 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 26 Apr 2020 14:59:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1587927552; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Jh2ddJMVI7j8PzDuCFU41+bSxoW1q7AM13axcnTvN5s=;
        b=pOeCX0LYioFgu/D4E6/DRhHGVFLi1F4A6C6Vu6Hgd85n6Dzd6QuXzQoZvR6OfRpnNpEkE8
        MbILWvBsuQOJVE8eUZ7coJ+ZFYfxpeyocbnfTmyFwFsMwLgDKrW2V6gohDJ1H9PFhkO1vT
        CWXjW3opKnhvBj7MQpYM84UA/fflAhM=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     od@zcrc.me,
        =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0?= <zhouyanjie@wanyeetech.com>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-i2c@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 7/8] dt-bindings: serial: Convert ingenic,uart.txt to YAML
Date:   Sun, 26 Apr 2020 20:58:55 +0200
Message-Id: <20200426185856.38826-7-paul@crapouillou.net>
In-Reply-To: <20200426185856.38826-1-paul@crapouillou.net>
References: <20200426185856.38826-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Convert the ingenic,uart.txt to a new ingenic,uart.yaml file.

A few things were changed in the process:
- the dmas and dma-names properties are now required.
- the ingenic,jz4770-uart and ingenic,jz4775-uart compatible strings now
  require the ingenic,jz4760-uart string to be used as fallback, since
  the hardware is compatible.
- the ingenic,jz4725b-uart compatible string was added, with a fallback
  to ingenic,jz4740-uart.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 .../bindings/serial/ingenic,uart.txt          | 28 ------
 .../bindings/serial/ingenic,uart.yaml         | 94 +++++++++++++++++++
 2 files changed, 94 insertions(+), 28 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/serial/ingenic,uart.txt
 create mode 100644 Documentation/devicetree/bindings/serial/ingenic,uart.yaml

diff --git a/Documentation/devicetree/bindings/serial/ingenic,uart.txt b/Documentation/devicetree/bindings/serial/ingenic,uart.txt
deleted file mode 100644
index 24ed8769f4af..000000000000
--- a/Documentation/devicetree/bindings/serial/ingenic,uart.txt
+++ /dev/null
@@ -1,28 +0,0 @@
-* Ingenic SoC UART
-
-Required properties:
-- compatible : One of:
-  - "ingenic,jz4740-uart",
-  - "ingenic,jz4760-uart",
-  - "ingenic,jz4770-uart",
-  - "ingenic,jz4775-uart",
-  - "ingenic,jz4780-uart",
-  - "ingenic,x1000-uart".
-- reg : offset and length of the register set for the device.
-- interrupts : should contain uart interrupt.
-- clocks : phandles to the module & baud clocks.
-- clock-names: tuple listing input clock names.
-	Required elements: "baud", "module"
-
-Example:
-
-uart0: serial@10030000 {
-	compatible = "ingenic,jz4740-uart";
-	reg = <0x10030000 0x100>;
-
-	interrupt-parent = <&intc>;
-	interrupts = <9>;
-
-	clocks = <&ext>, <&cgu JZ4740_CLK_UART0>;
-	clock-names = "baud", "module";
-};
diff --git a/Documentation/devicetree/bindings/serial/ingenic,uart.yaml b/Documentation/devicetree/bindings/serial/ingenic,uart.yaml
new file mode 100644
index 000000000000..c023d650e9c1
--- /dev/null
+++ b/Documentation/devicetree/bindings/serial/ingenic,uart.yaml
@@ -0,0 +1,94 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/serial/ingenic,uart.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ingenic SoCs UART controller devicetree bindings
+
+maintainers:
+  - Paul Cercueil <paul@crapouillou.net>
+
+properties:
+  $nodename:
+    pattern: "^serial@[0-9a-f]+$"
+
+  compatible:
+    oneOf:
+      - enum:
+        - ingenic,jz4740-uart
+        - ingenic,jz4760-uart
+        - ingenic,jz4780-uart
+        - ingenic,x1000-uart
+      - items:
+        - enum:
+          - ingenic,jz4770-uart
+          - ingenic,jz4775-uart
+        - const: ingenic,jz4760-uart
+      - items:
+        - const: ingenic,jz4725b-uart
+        - const: ingenic,jz4740-uart
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Baud clock
+      - description: UART module clock
+
+  clock-names:
+    items:
+      - const: baud
+      - const: module
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
+  - clock-names
+  - dmas
+  - dma-names
+
+examples:
+  - |
+    #include <dt-bindings/clock/jz4780-cgu.h>
+    #include <dt-bindings/dma/jz4780-dma.h>
+    #include <dt-bindings/gpio/gpio.h>
+    serial@10032000 {
+      compatible = "ingenic,jz4780-uart";
+      reg = <0x10032000 0x100>;
+
+      interrupt-parent = <&intc>;
+      interrupts = <49>;
+
+      clocks = <&ext>, <&cgu JZ4780_CLK_UART2>;
+      clock-names = "baud", "module";
+
+      dmas = <&dma JZ4780_DMA_UART2_RX 0xffffffff>,
+             <&dma JZ4780_DMA_UART2_TX 0xffffffff>;
+      dma-names = "rx", "tx";
+
+      bluetooth {
+        compatible = "brcm,bcm4330-bt";
+        reset-gpios = <&gpf 8 GPIO_ACTIVE_HIGH>;
+        vcc-supply = <&wlan0_power>;
+        device-wakeup-gpios = <&gpf 5 GPIO_ACTIVE_HIGH>;
+        host-wakeup-gpios = <&gpf 6 GPIO_ACTIVE_HIGH>;
+        shutdown-gpios = <&gpf 4 GPIO_ACTIVE_LOW>;
+      };
+    };
-- 
2.26.2

