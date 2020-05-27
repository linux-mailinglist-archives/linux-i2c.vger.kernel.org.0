Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A035A1E4182
	for <lists+linux-i2c@lfdr.de>; Wed, 27 May 2020 14:08:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727102AbgE0MIK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 27 May 2020 08:08:10 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:34908 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728416AbgE0MHb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 27 May 2020 08:07:31 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id B2FA78030836;
        Wed, 27 May 2020 12:07:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id N5nurM-VWybS; Wed, 27 May 2020 15:07:23 +0300 (MSK)
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Rob Herring <robh+dt@kernel.org>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        <linux-mips@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 01/11] dt-bindings: i2c: Convert DW I2C binding to DT schema
Date:   Wed, 27 May 2020 15:01:01 +0300
Message-ID: <20200527120111.5781-2-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20200527120111.5781-1-Sergey.Semin@baikalelectronics.ru>
References: <20200527120111.5781-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Modern device tree bindings are supposed to be created as YAML-files
in accordance with dt-schema. This commit replaces Synopsys DW I2C
legacy bare text bindings with YAML file. As before the bindings file
states that the corresponding dts node is supposed to be compatible
either with generic DW I2C controller or with Microsemi Ocelot SoC I2C
one, to have registers, interrupts and clocks properties. In addition
the node may have clock-frequency, i2c-sda-hold-time-ns,
i2c-scl-falling-time-ns and i2c-sda-falling-time-ns optional properties.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Reviewed-by: Rob Herring <robh@kernel.org>
Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-mips@vger.kernel.org

---

Changelog v2:
- Make sure that "mscc,ocelot-i2c" compatible node may have up to two
  registers space defined, while normal DW I2C controller will have only
  one registers space.
- Add "mscc,ocelot-i2c" example to test the previous fix.
- Declare "unevaluatedProperties" property instead of
  "additionalProperties" one.
- Due to the previous fix we can now discard the dummy boolean properties
  definitions, since the proper type evaluation will be performed by the
  generic i2c-controller.yaml schema.

Changelog v3:
- Discard $ref from the "-ns" suffixed properties since they've got the
  uint32-array type by default applied in the common schema. Set "maxItems: 1"
  there instead to make sure the property will have a single value specified.
---
 .../bindings/i2c/i2c-designware.txt           |  73 ---------
 .../bindings/i2c/snps,designware-i2c.yaml     | 154 ++++++++++++++++++
 2 files changed, 154 insertions(+), 73 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-designware.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml

diff --git a/Documentation/devicetree/bindings/i2c/i2c-designware.txt b/Documentation/devicetree/bindings/i2c/i2c-designware.txt
deleted file mode 100644
index 08be4d3846e5..000000000000
--- a/Documentation/devicetree/bindings/i2c/i2c-designware.txt
+++ /dev/null
@@ -1,73 +0,0 @@
-* Synopsys DesignWare I2C
-
-Required properties :
-
- - compatible : should be "snps,designware-i2c"
-                or "mscc,ocelot-i2c" with "snps,designware-i2c" for fallback
- - reg : Offset and length of the register set for the device
- - interrupts : <IRQ> where IRQ is the interrupt number.
- - clocks : phandles for the clocks, see the description of clock-names below.
-   The phandle for the "ic_clk" clock is required. The phandle for the "pclk"
-   clock is optional. If a single clock is specified but no clock-name, it is
-   the "ic_clk" clock. If both clocks are listed, the "ic_clk" must be first.
-
-Recommended properties :
-
- - clock-frequency : desired I2C bus clock frequency in Hz.
-
-Optional properties :
-
- - clock-names : Contains the names of the clocks:
-    "ic_clk", for the core clock used to generate the external I2C clock.
-    "pclk", the interface clock, required for register access.
-
- - reg : for "mscc,ocelot-i2c", a second register set to configure the SDA hold
-   time, named ICPU_CFG:TWI_DELAY in the datasheet.
-
- - i2c-sda-hold-time-ns : should contain the SDA hold time in nanoseconds.
-   This option is only supported in hardware blocks version 1.11a or newer and
-   on Microsemi SoCs ("mscc,ocelot-i2c" compatible).
-
- - i2c-scl-falling-time-ns : should contain the SCL falling time in nanoseconds.
-   This value which is by default 300ns is used to compute the tLOW period.
-
- - i2c-sda-falling-time-ns : should contain the SDA falling time in nanoseconds.
-   This value which is by default 300ns is used to compute the tHIGH period.
-
-Examples :
-
-	i2c@f0000 {
-		#address-cells = <1>;
-		#size-cells = <0>;
-		compatible = "snps,designware-i2c";
-		reg = <0xf0000 0x1000>;
-		interrupts = <11>;
-		clock-frequency = <400000>;
-	};
-
-	i2c@1120000 {
-		#address-cells = <1>;
-		#size-cells = <0>;
-		compatible = "snps,designware-i2c";
-		reg = <0x1120000 0x1000>;
-		interrupt-parent = <&ictl>;
-		interrupts = <12 1>;
-		clock-frequency = <400000>;
-		i2c-sda-hold-time-ns = <300>;
-		i2c-sda-falling-time-ns = <300>;
-		i2c-scl-falling-time-ns = <300>;
-	};
-
-	i2c@1120000 {
-		#address-cells = <1>;
-		#size-cells = <0>;
-		reg = <0x2000 0x100>;
-		clock-frequency = <400000>;
-		clocks = <&i2cclk>;
-		interrupts = <0>;
-
-		eeprom@64 {
-			compatible = "linux,slave-24c02";
-			reg = <0x40000064>;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
new file mode 100644
index 000000000000..4bd430b2b41d
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
@@ -0,0 +1,154 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/snps,designware-i2c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Synopsys DesignWare APB I2C Controller
+
+maintainers:
+  - Jarkko Nikula <jarkko.nikula@linux.intel.com>
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+  - if:
+      properties:
+        compatible:
+          not:
+            contains:
+              const: mscc,ocelot-i2c
+    then:
+      properties:
+        reg:
+          maxItems: 1
+
+properties:
+  compatible:
+    oneOf:
+      - description: Generic Synopsys DesignWare I2C controller
+        const: snps,designware-i2c
+      - description: Microsemi Ocelot SoCs I2C controller
+        items:
+          - const: mscc,ocelot-i2c
+          - const: snps,designware-i2c
+
+  reg:
+    minItems: 1
+    items:
+      - description: DW APB I2C controller memory mapped registers
+      - description: |
+          ICPU_CFG:TWI_DELAY registers to setup the SDA hold time.
+          This registers are specific to the Ocelot I2C-controller.
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+    items:
+      - description: I2C controller reference clock source
+      - description: APB interface clock source
+
+  clock-names:
+    minItems: 1
+    items:
+      - const: ref
+      - const: pclk
+
+  resets:
+    maxItems: 1
+
+  clock-frequency:
+    description: Desired I2C bus clock frequency in Hz
+    enum: [100000, 400000, 1000000, 3400000]
+    default: 400000
+
+  i2c-sda-hold-time-ns:
+    maxItems: 1
+    description: |
+      The property should contain the SDA hold time in nanoseconds. This option
+      is only supported in hardware blocks version 1.11a or newer or on
+      Microsemi SoCs.
+
+  i2c-scl-falling-time-ns:
+    maxItems: 1
+    description: |
+      The property should contain the SCL falling time in nanoseconds.
+      This value is used to compute the tLOW period.
+    default: 300
+
+  i2c-sda-falling-time-ns:
+    maxItems: 1
+    description: |
+      The property should contain the SDA falling time in nanoseconds.
+      This value is used to compute the tHIGH period.
+    default: 300
+
+  dmas:
+    items:
+      - description: TX DMA Channel
+      - description: RX DMA Channel
+
+  dma-names:
+    items:
+      - const: tx
+      - const: rx
+
+unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - "#address-cells"
+  - "#size-cells"
+  - interrupts
+
+examples:
+  - |
+    i2c@f0000 {
+      compatible = "snps,designware-i2c";
+      reg = <0xf0000 0x1000>;
+      #address-cells = <1>;
+      #size-cells = <0>;
+      interrupts = <11>;
+      clock-frequency = <400000>;
+    };
+  - |
+    i2c@1120000 {
+      compatible = "snps,designware-i2c";
+      reg = <0x1120000 0x1000>;
+      #address-cells = <1>;
+      #size-cells = <0>;
+      interrupts = <12 1>;
+      clock-frequency = <400000>;
+      i2c-sda-hold-time-ns = <300>;
+      i2c-sda-falling-time-ns = <300>;
+      i2c-scl-falling-time-ns = <300>;
+    };
+  - |
+    i2c@2000 {
+      compatible = "snps,designware-i2c";
+      reg = <0x2000 0x100>;
+      #address-cells = <1>;
+      #size-cells = <0>;
+      clock-frequency = <400000>;
+      clocks = <&i2cclk>;
+      interrupts = <0>;
+
+      eeprom@64 {
+        compatible = "linux,slave-24c02";
+        reg = <0x40000064>;
+      };
+    };
+  - |
+    i2c@100400 {
+      compatible = "mscc,ocelot-i2c", "snps,designware-i2c";
+      reg = <0x100400 0x100>, <0x198 0x8>;
+      pinctrl-0 = <&i2c_pins>;
+      pinctrl-names = "default";
+      #address-cells = <1>;
+      #size-cells = <0>;
+      interrupts = <8>;
+      clocks = <&ahb_clk>;
+    };
+...
-- 
2.26.2

