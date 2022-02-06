Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B7D44AAF9C
	for <lists+linux-i2c@lfdr.de>; Sun,  6 Feb 2022 14:58:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240517AbiBFN6A (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 6 Feb 2022 08:58:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233988AbiBFN57 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 6 Feb 2022 08:57:59 -0500
Received: from hostingweb31-40.netsons.net (hostingweb31-40.netsons.net [89.40.174.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89463C043183;
        Sun,  6 Feb 2022 05:57:56 -0800 (PST)
Received: from [77.244.183.192] (port=63680 helo=melee.fritz.box)
        by hostingweb31.netsons.net with esmtpa (Exim 4.94.2)
        (envelope-from <luca@lucaceresoli.net>)
        id 1nGgDM-00059v-73; Sun, 06 Feb 2022 13:00:20 +0100
From:   Luca Ceresoli <luca@lucaceresoli.net>
To:     linux-media@vger.kernel.org, linux-i2c@vger.kernel.org
Cc:     Luca Ceresoli <luca@lucaceresoli.net>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Peter Rosin <peda@axentia.se>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        matti.vaittinen@fi.rohmeurope.com
Subject: [RFCv3 4/6] media: dt-bindings: add DS90UB954-Q1 video deserializer
Date:   Sun,  6 Feb 2022 12:59:37 +0100
Message-Id: <20220206115939.3091265-5-luca@lucaceresoli.net>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220206115939.3091265-1-luca@lucaceresoli.net>
References: <20220206115939.3091265-1-luca@lucaceresoli.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id: luca+lucaceresoli.net/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Describe the Texas Instruments DS90UB954-Q1, a 2-input MIPI CSI-2 video
deserializer with I2C Address Translator and remote GPIOs.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>

---

Changes RFCv2 -> RFCv3:

 - rewrite in yaml
 - use new layout based on remote-chips under the main deser node
 - new clock configuration based on common clock framework

Changes RFCv1 -> RFCv2:

 - add explicit aliases for the FPD-link RX ports (optional)
 - add proper remote GPIO description
---
 .../bindings/media/i2c/ti,ds90ub954-q1.yaml   | 235 ++++++++++++++++++
 MAINTAINERS                                   |   6 +
 2 files changed, 241 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ti,ds90ub954-q1.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub954-q1.yaml b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub954-q1.yaml
new file mode 100644
index 000000000000..95dc3d22f5d8
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub954-q1.yaml
@@ -0,0 +1,235 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2019 Renesas Electronics Corp.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/ti,ds90ub954-q1.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments DS90UB954-Q1 dual video deserializer
+
+maintainers:
+  - Luca Ceresoli <luca@lucaceresoli.net>
+
+description: |
+  The TI DS90UB954-Q1 is a MIPI CSI-2 video deserializer that forwards
+  video streams from up to two FPD-Link 3 connections to a MIPI CSI-2
+  output. It also allows access to remote I2C and GPIO.
+
+properties:
+  compatible:
+    const: ti,ds90ub954-q1
+
+  reg:
+    description: |
+      main I2C slave address; optionally aliases for RX port registers and
+      remote serializers. The main address is mandatory and must be the
+      first, others are optional and fall back to defaults if not
+      specified. See "reg-names".
+
+  reg-names:
+    description: |
+      Names of I2C address used to communicate with the chip, must match
+      the "reg" values; mandatory if there are 2 or more addresses.
+      "main" is the main I2C address, used to access shared registers.
+      "rxport0" and "rxport1" are the I2C alias to access FPD-link RX
+      port specific registers; must not be used by other slaves on the
+      same bus. "ser0" and "ser1" are the I2C alias to access the remote
+      serializer connected on each FPD-link RX port; must not be used by
+      other slaves on the same bus.
+    minItems: 1
+    maxItems: 5
+    items:
+      - const: main
+      - const: rxport0
+      - const: rxport1
+      - const: ser0
+      - const: ser1
+
+  clocks:
+    description: provider of the clock on the XIN/REFCLK pin
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  reset-gpios:
+    description: chip reset GPIO connected to PDB pin (active low)
+
+  i2c-alias-pool:
+    description: |
+      list of I2C addresses that are known to be available on the "local"
+      (SoC-to-deser) I2C bus; they will be picked at runtime and used as
+      aliases to reach remote I2C chips
+
+  '#clock-cells':
+    description: |
+      the DS90UB954 provides the FPD line rate clock to the serializer
+    const: 0
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    patternProperties:
+      '^port@[01]$':
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        description: FPD-Link RX port 0 (RIN0+/RIN0- pins)
+
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+
+      '^port@2$':
+        $ref: /schemas/graph.yaml#/properties/port
+        description: MIPI-CSI2 TX port
+
+  remote-chips:
+    type: object
+
+    properties:
+      '#address-cells':
+        const: 1
+      '#size-cells':
+        const: 0
+
+    patternProperties:
+      '^remote-chip@([01]+)$':
+        type: object
+        $ref: /schemas/media/i2c/ti,ds90ub953-q1.yaml#
+
+    required:
+      - '#address-cells'
+      - '#size-cells'
+
+    additionalProperties: false
+
+  i2c-atr:
+    description: |
+      Each child describes the I2C bus on the remote side of an RX port
+    type: object
+
+    properties:
+      '#address-cells':
+        const: 1
+      '#size-cells':
+        const: 0
+
+    patternProperties:
+      '^i2c@([01]+)$':
+        type: object
+
+        properties:
+          reg:
+            maxItems: 1
+          '#address-cells':
+            const: 1
+          '#size-cells':
+            const: 0
+          clock-frequency:
+            minimum: 1
+            maximum: 1000000
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - ports
+  - remote-chips
+  - i2c-atr
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/media/ds90ub953.h>
+
+    i2c@0 {
+      reg = <0x0 0x100>;
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      deser: deser@3d {
+        compatible = "ti,ds90ub954-q1";
+        reg-names = "main", "rxport0", "rxport1", "ser0", "ser1";
+        reg       = <0x3d>,  <0x40>,    <0x41>,   <0x44>, <0x45>;
+        clocks = <&clk_25M>;
+        interrupt-parent = <&gic>;
+        interrupts = <3 1 IRQ_TYPE_LEVEL_LOW>;
+        reset-gpios = <&gpio 4 GPIO_ACTIVE_LOW>;
+
+        #clock-cells = <0>;
+
+        i2c-alias-pool = /bits/ 16 <0x4a 0x4b 0x4c 0x4d 0x4e 0x4f>;
+
+        ports {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          port@0 {
+            reg = <0>;
+            ds90ub954_fpd3_in0: endpoint {
+              remote-endpoint = <&sensor_0_out>;
+            };
+          };
+
+          port@2 {
+            reg = <2>;
+            ds90ub954_mipi_out0: endpoint {
+                    data-lanes = <1 2 3 4>;
+                    link-frequencies = /bits/ 64 <400000000>;
+                    remote-endpoint = <&csirx_0_in>;
+            };
+          };
+        };
+
+        remote-chips {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          des0_ser0: remote-chip@0 {
+            reg = <0>;
+            compatible = "ti,ds90ub953-q1";
+            clocks = <&deser>;
+            ti,gpio-functions =
+              <DS90_GPIO_FUNC_UNUSED
+              DS90_GPIO_FUNC_OUTPUT_REMOTE
+              DS90_GPIO_FUNC_UNUSED
+              DS90_GPIO_FUNC_UNUSED>;
+
+            gpio-controller;
+            #gpio-cells = <2>;
+            #clock-cells = <0>;
+          };
+        };
+
+        i2c-atr {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          remote_i2c0: i2c@0 {
+            reg = <0>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            sensor_0@1a {
+              compatible = "sony,imx274";
+              reg = <0x1a>;
+
+              reset-gpios = <&des0_ser0 1 GPIO_ACTIVE_LOW>;
+
+              port {
+                sensor_0_out: endpoint {
+                  remote-endpoint = <&ds90ub954_fpd3_in0>;
+                };
+              };
+            };
+          };
+        };
+      };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 4429ce035496..f0156062f788 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19097,6 +19097,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/ti,ds90ub953-q1.yaml
 F:	include/dt-bindings/media/ds90ub953.h
 
+TEXAS INSTRUMENTS DS90UB954 VIDEO DESERIALIZER DRIVER
+M:	Luca Ceresoli <luca@lucaceresoli.net>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/i2c/ti,ds90ub954-q1.yaml
+
 TEXAS INSTRUMENTS' SYSTEM CONTROL INTERFACE (TISCI) PROTOCOL DRIVER
 M:	Nishanth Menon <nm@ti.com>
 M:	Tero Kristo <kristo@kernel.org>
-- 
2.25.1

