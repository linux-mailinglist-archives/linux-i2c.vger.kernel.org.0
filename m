Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 500881CCA41
	for <lists+linux-i2c@lfdr.de>; Sun, 10 May 2020 12:27:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728856AbgEJK1C (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 10 May 2020 06:27:02 -0400
Received: from 212.199.177.27.static.012.net.il ([212.199.177.27]:48394 "EHLO
        herzl.nuvoton.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726913AbgEJK1C (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 10 May 2020 06:27:02 -0400
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
        by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 04AANrW8015178;
        Sun, 10 May 2020 13:23:53 +0300
Received: by taln60.nuvoton.co.il (Postfix, from userid 20088)
        id A6DD6639C1; Sun, 10 May 2020 13:23:53 +0300 (IDT)
From:   Tali Perry <tali.perry1@gmail.com>
To:     ofery@google.com, brendanhiggins@google.com,
        avifishman70@gmail.com, tmaimon77@gmail.com, kfting@nuvoton.com,
        venture@google.com, yuenn@google.com, benjaminfair@google.com,
        robh+dt@kernel.org, wsa@the-dreams.de,
        andriy.shevchenko@linux.intel.com
Cc:     linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        openbmc@lists.ozlabs.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Tali Perry <tali.perry1@gmail.com>
Subject: [PATCH v10 1/3] dt-bindings: i2c: npcm7xx: add NPCM I2C controller
Date:   Sun, 10 May 2020 13:23:28 +0300
Message-Id: <20200510102330.66715-2-tali.perry1@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200510102330.66715-1-tali.perry1@gmail.com>
References: <20200510102330.66715-1-tali.perry1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Added device tree binding documentation for Nuvoton BMC
NPCM I2C controller.

Signed-off-by: Tali Perry <tali.perry1@gmail.com>
---
 .../bindings/i2c/nuvoton,npcm7xx-i2c.yaml     | 62 +++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml

diff --git a/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml b/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml
new file mode 100644
index 000000000000..d6f553154388
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/nuvoton,npcm7xx-i2c.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/nuvoton,npcm7xx-i2c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: nuvoton NPCM7XX I2C Controller Device Tree Bindings
+
+description: |
+  The NPCM750x includes sixteen I2C bus controllers. All Controllers support
+  both master and slave mode. Each controller can switch between master and slave
+  at run time (i.e. IPMB mode). Each controller has two 16 byte HW FIFO for TX and
+  RX.
+
+maintainers:
+  - Tali Perry <tali.perry1@gmail.com>
+
+properties:
+  compatible:
+      - const: nuvoton,npcm7xx-i2c
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+    items:
+      - description: Reference clock for the I2C bus
+
+  clock-frequency:
+    maxItems: 1
+    default: 100000
+    enum: [ 100000, 400000, 1000000 ]
+    description:
+      SCL frequency to use (in Hz). If omitted, 100kHz is used.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c0: i2c@80000 {
+        compatible = "nuvoton,npcm750-i2c";
+        reg = <0x80000 0x1000>;
+        clocks = <&clk NPCM7XX_CLK_APB2>;
+        bus-frequency = <100000>;
+        interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&smb0_pins>;
+    };
+
+...
-- 
2.22.0

