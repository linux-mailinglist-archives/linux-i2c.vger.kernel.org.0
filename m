Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB99111748D
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Dec 2019 19:43:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726956AbfLISnE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 9 Dec 2019 13:43:04 -0500
Received: from mail.bugwerft.de ([46.23.86.59]:34258 "EHLO mail.bugwerft.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726823AbfLISnA (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 9 Dec 2019 13:43:00 -0500
Received: from zenbar.fritz.box (pD95EF75D.dip0.t-ipconnect.de [217.94.247.93])
        by mail.bugwerft.de (Postfix) with ESMTPSA id E97D42E5CDC;
        Mon,  9 Dec 2019 18:29:03 +0000 (UTC)
From:   Daniel Mack <daniel@zonque.org>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Cc:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        broonie@kernel.org, lee.jones@linaro.org, lars@metafoo.de,
        pascal.huerst@gmail.com, Daniel Mack <daniel@zonque.org>
Subject: [PATCH 01/10] dt-bindings: mfd: Add documentation for ad242x
Date:   Mon,  9 Dec 2019 19:35:01 +0100
Message-Id: <20191209183511.3576038-2-daniel@zonque.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191209183511.3576038-1-daniel@zonque.org>
References: <20191209183511.3576038-1-daniel@zonque.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This patch adds documentation on the top-level MFD support for AD242x
devices. The bindings implemented by drivers for sub-devices of the
MFD are documented in other files in their respective subsystems.

The example in this file is referred to by other documents.

Signed-off-by: Daniel Mack <daniel@zonque.org>
---
 .../bindings/mfd/adi,ad242x-bus.yaml          |  29 +++
 .../bindings/mfd/adi,ad242x-master.yaml       | 235 ++++++++++++++++++
 .../bindings/mfd/adi,ad242x-slave.yaml        | 108 ++++++++
 3 files changed, 372 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/adi,ad242x-bus.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/adi,ad242x-master.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/adi,ad242x-slave.yaml

diff --git a/Documentation/devicetree/bindings/mfd/adi,ad242x-bus.yaml b/Documentation/devicetree/bindings/mfd/adi,ad242x-bus.yaml
new file mode 100644
index 000000000000..89ca8d009bb9
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/adi,ad242x-bus.yaml
@@ -0,0 +1,29 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/mfd/adi,ad242x-bus.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Analog Devices AD242x A²B bus node
+
+maintainers:
+  - Daniel Mack <daniel@zonque.org>
+
+description: |
+  AD242x slave nodes represent the secondary I²C address a master node
+  transceiver exposes on the bus.
+
+properties:
+  compatible:
+    enum:
+      - adi,ad2428w-bus
+
+  reg:
+    maxItems: 1
+    description: |
+      The secondary I²C address of the master node
+      (called 'BUS' in the datasheet)
+
+required:
+  - compatible
+  - reg
diff --git a/Documentation/devicetree/bindings/mfd/adi,ad242x-master.yaml b/Documentation/devicetree/bindings/mfd/adi,ad242x-master.yaml
new file mode 100644
index 000000000000..649510575a79
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/adi,ad242x-master.yaml
@@ -0,0 +1,235 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/mfd/adi,ad242x-master.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Analog Devices AD242x A²B master node transceiver
+
+maintainers:
+  - Daniel Mack <daniel@zonque.org>
+
+description: |
+  AD242x devices are A²B (Automotive Audio Bus) transceivers that are connected
+  to each other in a daisy-chain. The payload transported on that bus includes
+  multi-channel audio, I²C, GPIOs and others.
+
+  The datasheet is located here:
+
+    https://www.analog.com/media/en/technical-documentation/user-guides/AD242x_TRM_Rev1.1.pdf
+
+  The primary node in the chain is called the master node, and the nodes in the
+  chain are called slave nodes. A master can address up to 15 slave nodes. The
+  master node exposes two I²C addresses, one for accessing the registers on the
+  node itself, and one for registers on one of the slave nodes.
+
+properties:
+  compatible:
+    enum:
+      - adi,ad2428w-master
+
+  reg:
+    maxItems: 1
+    description: |
+      The primary I²C address of the master node
+      (called 'BASE' in the datasheet)
+
+  clocks:
+    minItems: 1
+
+  clock-names:
+    $ref: /schemas/types.yaml#/definitions/string-array
+    const: sync
+
+  clock-frequency:
+    $ref: '/schemas/types.yaml#/definitions/uint32'
+    enum: [44100, 48000]
+    description: |
+      Specifies the clock frequency in Hz to configure on the given sync clock.
+      If not specified, the clock is expected to already be configured to either
+      44100 or 48000 Hz.
+
+  interrupts:
+    maxItems: 1
+
+  adi,a2b-bus:
+    $ref: '/schemas/types.yaml#/definitions/phandle'
+    description: Specifies the bus handle node
+
+  adi,upstream-slot-size:
+    description: The size for upstream slots
+    allOf:
+      - $ref: '/schemas/types.yaml#/definitions/uint32'
+      - enum: [8, 12, 16, 20, 24, 28, 32]
+
+  adi,downstream-slot-size:
+    description: The size for downstream slots
+    allOf:
+      - $ref: '/schemas/types.yaml#/definitions/uint32'
+      - enum: [8, 12, 16, 20, 24, 28, 32]
+
+  adi,tdm-mode:
+    description: The TDM mode to use
+    allOf:
+      - $ref: '/schemas/types.yaml#/definitions/uint32'
+      - enum: [2, 4, 8, 12, 16, 20, 24, 32]
+
+  adi,tdm-slot-size:
+    description: The TDM slot size to use
+    allOf:
+      - $ref: '/schemas/types.yaml#/definitions/uint32'
+      - enum: [16, 32]
+
+  adi,alternate-upstream-slot-format:
+    description: Selects the alternate format for upstream slots
+    type: boolean
+
+  adi,alternate-downstream-slot-format:
+    description: Selects the alternate format for downstream slots
+    type: boolean
+
+  adi,invert-xcvr-b:
+    description: Inverts the LVDS XCVR B data line
+    type: boolean
+
+  adi,alternating-sync:
+    description: Drives the SYNC pin for I²S operation
+    type: boolean
+
+  adi,invert-sync:
+    description: Invert the SYNC pin
+    type: boolean
+
+  adi,early-sync:
+    description: |
+      Make the SYNC pin change one cycle before the first slot is transmitted
+    type: boolean
+
+  adi,spread-a2b-clock:
+    description: Enables spread spectrum mode for A²B bus clocks
+    type: boolean
+
+  adi,spread-a2b-i2s-clock:
+    description: Enables spread spectrum mode for both A²B and I²S clocks
+    type: boolean
+
+  adi,spread-spectrum-high:
+    description: Selects high spectrum spreading mode
+    type: boolean
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - adi,a2b-bus
+  - adi,upstream-slot-size
+  - adi,downstream-slot-size
+  - adi,tdm-mode
+  - adi,tdm-slot-size
+
+examples:
+  - |
+    sync_clock: clock {
+      compatible = "fixed-clock";
+      #clock-cells = <0>;
+      clock-frequency  = <48000>;
+    };
+
+    i2c-bus {
+      ad2428w-master@68 {
+        reg = <0x68>;
+        compatible = "adi,ad2428w-master";
+        adi,a2b-bus = <&a2b_bus>;
+        clocks = <&sync_clock>;
+        clock-names = "sync";
+
+        adi,upstream-slot-size = <24>;
+        adi,downstream-slot-size = <24>;
+        adi,tdm-mode = <2>;
+        adi,tdm-slot-size = <32>;
+        adi,alternating-sync;
+        adi,early-sync;
+
+        codec {
+          compatible = "adi,ad2428w-codec";
+          #sound-dai-cells = <1>;
+        };
+
+        clock {
+          compatible = "adi,ad2428w-clk";
+          #clock-cells = <1>;
+          clock-output-names = "master-clk1", "master-clk2";
+        };
+
+        nodes {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          node@0 {
+            compatible = "adi,ad2428w-slave";
+            reg = <0>;
+
+            adi,alternating-sync;
+            adi,early-sync;
+            adi,invert-sync;
+            adi,tdm-mode = <8>;
+            adi,tdm-slot-size = <32>;
+
+            downstream {
+              rx-slots = <2 3 6 7 8 9>;
+              #tx-slots = <4>;
+              #forward-slots = <6>;
+            };
+
+            upstream {
+              rx-slots = <0 1 6 7 8 9>;
+              #tx-slots = <4>;
+              #forward-slots = <6>;
+            };
+
+            a2bgpio: gpio {
+              compatible = "adi,ad2428w-gpio";
+              gpio-controller;
+              #gpio-cells = <2>;
+
+              gpio-over-distance {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                pin@0 {
+                  reg = <0>;
+                  adi,virtual-port-mask = <0x01>;
+                };
+              };
+            };
+
+            i2c {
+              compatible = "adi,ad2428w-i2c";
+              clock-frequency = <400000>;
+              #address-cells = <1>;
+              #size-cells = <0>;
+
+              // I²C client devices located on the remote side
+              eeprom-top@52 {
+                reg = <0x52>;
+                compatible = "atmel,24c02";
+                read-only;
+              };
+            };
+
+            a2bclk: clock {
+              compatible = "adi,ad2428w-clk";
+              #clock-cells = <1>;
+              clock-output-names = "node0-clk1", "node0-clk2";
+            };
+
+            codec {
+              compatible = "adi,ad2428w-codec";
+              #sound-dai-cells = <1>;
+              adi,pdm-highpass-filter;
+            };
+          };
+        };
+      };
+    };
diff --git a/Documentation/devicetree/bindings/mfd/adi,ad242x-slave.yaml b/Documentation/devicetree/bindings/mfd/adi,ad242x-slave.yaml
new file mode 100644
index 000000000000..3bea04dff267
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/adi,ad242x-slave.yaml
@@ -0,0 +1,108 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/mfd/adi,ad242x-slave.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Analog Devices AD242x A²B slave node transceiver
+
+maintainers:
+  - Daniel Mack <daniel@zonque.org>
+
+description: |
+  AD242x slave nodes are connected to the master node through a daisy-chain.
+  Modules of this type must be listed under the 'nodes' property of the master
+  DT schema.
+
+properties:
+  compatible:
+    enum:
+      - adi,ad2428w-slave
+
+  adi,tdm-mode:
+    description: The TDM mode to use
+    allOf:
+      - $ref: '/schemas/types.yaml#/definitions/uint32'
+      - enum: [2, 4, 8, 12, 16, 20, 24, 32]
+
+  adi,tdm-slot-size:
+    description: The TDM slot size to use
+    allOf:
+      - $ref: '/schemas/types.yaml#/definitions/uint32'
+      - enum: [16, 32]
+
+  adi,alternating-sync:
+    description: Drives the SYNC pin for I²S operation
+    type: boolean
+
+  adi,invert-sync:
+    description: Invert the SYNC pin
+    type: boolean
+
+  adi,early-sync:
+    description: |
+      Make the SYNC pin change one cycle before the first slot is transmitted
+    type: boolean
+
+  adi,spread-a2b-clock:
+    description: Enables spread spectrum mode for A²B bus clocks
+    type: boolean
+
+  adi,spread-a2b-i2s-clock:
+    description: Enables spread spectrum mode for both A²B and I²S clocks
+    type: boolean
+
+  adi,spread-spectrum-high:
+    description: Selects high spectrum spreading mode
+    type: boolean
+
+  upstream:
+    type: object
+    properties:
+      rx-slots:
+        $ref: '/schemas/types.yaml#/definitions/uint32'
+        description: |
+          A bitmask that describes the slots that are received by the
+          transceiver from the upstream (A) side and put into its TX output
+          framebuffers. If not specified, an empty bitmask is assumed.
+
+      '#tx-slots':
+        $ref: '/schemas/types.yaml#/definitions/uint32'
+        description: |
+          The number of slots this transceiver contributes to the upstream
+          traffic from its RX input frame buffer
+
+      '#forward-slots':
+        $ref: '/schemas/types.yaml#/definitions/uint32'
+        description: |
+          The number of slots this transceiver forwards from the upstream side
+          to the downstream side.
+
+  downstream:
+    type: object
+    properties:
+      rx-slots:
+        $ref: '/schemas/types.yaml#/definitions/uint32'
+        description: |
+          A bitmask that describes the slots that are received by the
+          transceiver from the downstream (B) side and put into its TX output
+          framebuffers. If not specified, an empty bitmask is assumed.
+
+      '#tx-slots':
+        $ref: '/schemas/types.yaml#/definitions/uint32'
+        description: |
+          The number of slots this transceiver contributes to the downstream
+          traffic from its RX input frame buffer
+
+      '#forward-slots':
+        $ref: '/schemas/types.yaml#/definitions/uint32'
+        description: |
+          The number of slots this transceiver forwards from the downstream side
+          to the upstream side.
+
+required:
+  - compatible
+  - adi,tdm-mode
+  - adi,tdm-slot-size
+  - upstream
+  - downstream
-- 
2.23.0

