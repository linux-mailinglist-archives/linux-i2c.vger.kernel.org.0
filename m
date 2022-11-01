Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 031EA614B98
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Nov 2022 14:21:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230346AbiKANVH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Nov 2022 09:21:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230323AbiKANVD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Nov 2022 09:21:03 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E6A0FD08;
        Tue,  1 Nov 2022 06:21:00 -0700 (PDT)
Received: from desky.lan (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 64CD31896;
        Tue,  1 Nov 2022 14:20:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1667308857;
        bh=NEKkHEBB4RH0Zj0qc6AixmaYtTyN8NOU/sWL3QoF3ng=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=vVTr1tO7YW5IWWZf1vDbaQgegj/qLTUylNLPH1kjesEgpBdNOck3TuA74E/GpWq/0
         elMhl70rRgR4dmT1TlT2+Nop2u2mAMk+Yj73RiGHD0qOjmjkh5ntWihACYV0MStWM7
         jckHsF54Ayrh74Z+WW4u1K4KYrtN2TwM1XKL3dO0=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Mark Rutland <mark.rutland@arm.com>,
        Matti Vaittinen <Matti.Vaittinen@fi.rohmeurope.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Rob Herring <robh+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        satish.nagireddy@getcruise.com,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v4 3/8] dt-bindings: media: add bindings for TI DS90UB960
Date:   Tue,  1 Nov 2022 15:20:27 +0200
Message-Id: <20221101132032.1542416-4-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221101132032.1542416-1-tomi.valkeinen@ideasonboard.com>
References: <20221101132032.1542416-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add DT bindings for TI DS90UB960 FPDLink-3 Deserializer.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 .../bindings/media/i2c/ti,ds90ub960.yaml      | 392 ++++++++++++++++++
 1 file changed, 392 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
new file mode 100644
index 000000000000..4456d9b3e2c7
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
@@ -0,0 +1,392 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/ti,ds90ub960.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments DS90UB9XX Family FPD-Link Deserializer Hubs
+
+maintainers:
+  - Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
+
+description: |
+  The TI DS90UB9XX devices are FPD-Link video deserializers with I2C and GPIO
+  forwarding.
+
+properties:
+  compatible:
+    enum:
+      - ti,ds90ub960-q1
+      - ti,ds90ub9702-q1
+
+  reg:
+    maxItems: 1
+    description:
+      i2c addresses for the deserializer and the serializers
+
+  reg-names:
+    items:
+      - const: main
+
+  clocks:
+    maxItems: 1
+    description:
+      Reference clock connected to the REFCLK pin.
+
+  clock-names:
+    items:
+      - const: refclk
+
+  powerdown-gpios:
+    maxItems: 1
+    description:
+      Specifier for the GPIO connected to the PDB pin.
+
+  i2c-alias-pool:
+    $ref: /schemas/types.yaml#/definitions/uint16-array
+    description:
+      i2c alias pool for remote devices.
+
+  links:
+    type: object
+    additionalProperties: false
+
+    properties:
+      '#address-cells':
+        const: 1
+
+      '#size-cells':
+        const: 0
+
+      manual-strobe:
+        type: boolean
+        description:
+          Enable manual strobe position and EQ level
+
+    patternProperties:
+      '^link@[0-9a-f]+$':
+        type: object
+        additionalProperties: false
+        properties:
+          reg:
+            description: The link number
+            maxItems: 1
+
+          i2c-alias:
+            description: |
+              The i2c address used for the serializer. Transactions to this
+              address on the i2c bus where the deserializer resides are
+              forwarded to the serializer.
+
+          rx-mode:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            enum:
+              - 0 # RAW10
+              - 1 # RAW12 HF
+              - 2 # RAW12 LF
+              - 3 # CSI2 SYNC
+              - 4 # CSI2 NON-SYNC
+            description: FPD-Link Input Mode
+
+          cdr-mode:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            enum:
+              - 0 # FPD3
+              - 1 # FPD4
+            description: FPD-Link CDR Mode
+
+          strobe-pos:
+            $ref: /schemas/types.yaml#/definitions/int32
+            minimum: -13
+            maximum: 13
+            description: Manual strobe position, from -13 to 13
+
+          eq-level:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            maximum: 14
+            description: Manual EQ level, from 0 to 14
+
+          serializer:
+            type: object
+            description: FPD-Link Serializer node
+
+        required:
+          - reg
+          - i2c-alias
+          - rx-mode
+          - serializer
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        description: FPD-Link input 0
+
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+
+      port@1:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        description: FPD-Link input 1
+
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+
+      port@2:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        description: FPD-Link input 2
+
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+
+      port@3:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        description: FPD-Link input 3
+
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+
+      port@4:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        description: CSI-2 Output 0
+
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+
+            properties:
+              clock-lanes:
+                maxItems: 1
+
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+      port@5:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        description: CSI-2 Output 1
+
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+
+            properties:
+              clock-lanes:
+                maxItems: 1
+
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+      clock-frequency = <400000>;
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      deser@3d {
+        compatible = "ti,ds90ub960-q1";
+
+        reg-names = "main";
+        reg       = <0x3d>;
+
+        clock-names = "refclk";
+        clocks = <&fixed_clock>;
+
+        powerdown-gpios = <&pca9555 7 GPIO_ACTIVE_LOW>;
+
+        i2c-alias-pool = /bits/ 16 <0x4a 0x4b 0x4c 0x4d 0x4e 0x4f>;
+
+        ports {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          /* Port 0, Camera 0 */
+          port@0 {
+            reg = <0>;
+
+            ub960_fpd3_1_in: endpoint {
+              remote-endpoint = <&ub953_1_out>;
+
+              rx-mode = <0>;
+            };
+          };
+
+          /* Port 0, Camera 1 */
+          port@1 {
+            reg = <1>;
+
+            ub960_fpd3_2_in: endpoint {
+              remote-endpoint = <&ub913_2_out>;
+
+              rx-mode = <0>;
+            };
+          };
+
+          /* Port 4, CSI-2 TX */
+          port@4 {
+            reg = <4>;
+            ds90ub960_0_csi_out: endpoint {
+              clock-lanes = <0>;
+              data-lanes = <1 2 3 4>;
+              link-frequencies = /bits/ 64 <800000000>;
+              remote-endpoint = <&csi2_phy0>;
+            };
+          };
+        };
+
+        links {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          /* Link 0 has DS90UB953 serializer and IMX390 sensor */
+
+          link@0 {
+            reg = <0>;
+            i2c-alias = <68>;
+
+            rx-mode = <3>;
+
+            serializer1: serializer {
+              compatible = "ti,ds90ub953-q1";
+
+              gpio-controller;
+              #gpio-cells = <2>;
+
+              #clock-cells = <0>;
+
+              ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                  reg = <0>;
+                  ub953_1_in: endpoint {
+                    clock-lanes = <0>;
+                    data-lanes = <1 2 3 4>;
+                    remote-endpoint = <&sensor_1_out>;
+                  };
+                };
+
+                port@1 {
+                  reg = <1>;
+
+                  ub953_1_out: endpoint {
+                    remote-endpoint = <&ub960_fpd3_1_in>;
+                  };
+                };
+              };
+
+              i2c {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                sensor@21 {
+                  compatible = "sony,imx390";
+                  reg = <0x21>;
+
+                  clocks = <&clk_cam_27M>;
+                  clock-names = "inck";
+
+                  xclr-gpios = <&serializer1 0 GPIO_ACTIVE_LOW>;
+                  error0-gpios = <&serializer1 1 GPIO_ACTIVE_HIGH>;
+                  error1-gpios = <&serializer1 2 GPIO_ACTIVE_HIGH>;
+                  comready-gpios = <&serializer1 3 GPIO_ACTIVE_HIGH>;
+
+                  port {
+                    sensor_1_out: endpoint {
+                      remote-endpoint = <&ub953_1_in>;
+                    };
+                  };
+                };
+              };
+            };
+          };  /* End of link@0 */
+
+          /* Link 1 has DS90UB913 serializer and OV10635 sensor */
+
+          link@1 {
+            reg = <1>;
+            i2c-alias = <69>;
+
+            rx-mode = <0>;
+
+            serializer2: serializer {
+              compatible = "ti,ds90ub913a-q1";
+
+              gpio-controller;
+              #gpio-cells = <2>;
+
+              clocks = <&clk_cam_48M>;
+              clock-names = "clkin";
+
+              #clock-cells = <0>;
+
+              ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                  reg = <0>;
+                  ub913_2_in: endpoint {
+                    remote-endpoint = <&sensor_2_out>;
+                  };
+                };
+
+                port@1 {
+                  reg = <1>;
+
+                  ub913_2_out: endpoint {
+                    remote-endpoint = <&ub960_fpd3_2_in>;
+                  };
+                };
+              };
+
+              i2c {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                sensor@30 {
+                  compatible = "ovti,ov10635";
+                  reg = <0x30>;
+
+                  clocks = <&serializer2>;
+                  clock-names = "xvclk";
+
+                  powerdown-gpios = <&serializer2 0 GPIO_ACTIVE_HIGH>;
+
+                  port {
+                    sensor_2_out: endpoint {
+                      remote-endpoint = <&ub913_2_in>;
+                      hsync-active = <1>;
+                      vsync-active = <1>;
+                      pclk-sample = <0>;
+                      bus-width = <10>;
+                    };
+                  };
+                };
+              };
+            };
+          }; /* End of link@1 */
+        };
+      };
+    };
+...
-- 
2.34.1

