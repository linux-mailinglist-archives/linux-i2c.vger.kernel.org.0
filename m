Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7304F614BA0
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Nov 2022 14:21:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230382AbiKANVY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Nov 2022 09:21:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230343AbiKANVH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Nov 2022 09:21:07 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 872841182D;
        Tue,  1 Nov 2022 06:21:04 -0700 (PDT)
Received: from desky.lan (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DA8D33307;
        Tue,  1 Nov 2022 14:20:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1667308859;
        bh=WHz0ZfQ7Bf+utOyail1PxyTVN4OPrlob7z8JQ6wr28Y=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=S2lbDvmXu5Q/ByfvaKDS+y6KcHgFg6twnFBLEEzFRzOFIAJsMBvFsMjL/jVbxCxgh
         qxvuMbUCpQQXEpkXraI1er5S+z28D4k7NAPmmaYubA8/McowRunpr27E2XtDmrXk7k
         YubE/qkUS2CDRKOAr5dLEAaXoTIgTXRoFeoCITMI=
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
Subject: [PATCH v4 5/8] dt-bindings: media: add bindings for TI DS90UB953
Date:   Tue,  1 Nov 2022 15:20:29 +0200
Message-Id: <20221101132032.1542416-6-tomi.valkeinen@ideasonboard.com>
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

Add DT bindings for TI DS90UB953 FPDLink-3 Serializer.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 .../bindings/media/i2c/ti,ds90ub953.yaml      | 120 ++++++++++++++++++
 1 file changed, 120 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml
new file mode 100644
index 000000000000..355f7d6a19fe
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml
@@ -0,0 +1,120 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/ti,ds90ub953.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments DS90UB953 FPD-Link 3 Serializer
+
+maintainers:
+  - Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
+
+description: |
+  The TI DS90UB953 is an FPD-Link 3 video serializer for MIPI CSI-2.
+
+properties:
+  compatible:
+    enum:
+      - ti,ds90ub953-q1
+      - ti,ds90ub971-q1
+
+  '#gpio-cells':
+    const: 2
+
+  gpio-controller: true
+
+  '#clock-cells':
+    const: 0
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        description: CSI-2 input port
+
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+
+      port@1:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        description: FPD-Link 3 output port
+
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+
+  i2c:
+    $ref: /schemas/i2c/i2c-controller.yaml#
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - '#gpio-cells'
+  - gpio-controller
+  - '#clock-cells'
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    serializer {
+      compatible = "ti,ds90ub953-q1";
+
+      gpio-controller;
+      #gpio-cells = <2>;
+
+      #clock-cells = <0>;
+
+      ports {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        port@0 {
+          reg = <0>;
+          ub953_in: endpoint {
+            clock-lanes = <0>;
+            data-lanes = <1 2 3 4>;
+            remote-endpoint = <&sensor_out>;
+          };
+        };
+
+        port@1 {
+          reg = <1>;
+          endpoint {
+            remote-endpoint = <&deser_fpd_in>;
+          };
+        };
+      };
+
+      i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        sensor@21 {
+          compatible = "sony,imx390";
+          reg = <0x21>;
+
+          clocks = <&clk_cam_27M>;
+          clock-names = "inck";
+
+          xclr-gpios = <&serializer 0 GPIO_ACTIVE_LOW>;
+          error0-gpios = <&serializer 1 GPIO_ACTIVE_HIGH>;
+          error1-gpios = <&serializer 2 GPIO_ACTIVE_HIGH>;
+          comready-gpios = <&serializer 3 GPIO_ACTIVE_HIGH>;
+
+          port {
+            sensor_out: endpoint {
+              remote-endpoint = <&ub953_in>;
+            };
+          };
+        };
+      };
+    };
+...
-- 
2.34.1

