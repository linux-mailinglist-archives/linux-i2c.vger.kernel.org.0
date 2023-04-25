Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6D9B6EDC71
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Apr 2023 09:26:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233444AbjDYH0p (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Apr 2023 03:26:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233504AbjDYH0f (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Apr 2023 03:26:35 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 997BBAD28;
        Tue, 25 Apr 2023 00:26:27 -0700 (PDT)
Received: from desky.lan (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CF390C7E;
        Tue, 25 Apr 2023 09:26:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1682407574;
        bh=TyApQ6qpr4eiku+THwel+cmwld8/fczSmL0rhfymuCk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=i6o91EbwthBiN3AqpwFW0bNfFbIyEyN7afbJ91yaNlNPYs9aeckuwpGZ+K6p51f0g
         gg26mrdwUHYbMycjuJEZM6jFgofkS06aTPhnlFM1lbzkCOoBI/wCvFRpKLuEtMctJC
         sp6nqadGlIJAXFsMAhqhPebIIRB21d0hGrFJVKIE=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Matti Vaittinen <Matti.Vaittinen@fi.rohmeurope.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mike Pagano <mpagano@gentoo.org>,
        =?UTF-8?q?Krzysztof=20Ha=C5=82asa?= <khalasa@piap.pl>,
        Marek Vasut <marex@denx.de>,
        Satish Nagireddy <satish.nagireddy@getcruise.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v12 3/8] dt-bindings: media: add TI DS90UB913 FPD-Link III Serializer
Date:   Tue, 25 Apr 2023 10:25:56 +0300
Message-Id: <20230425072601.51031-4-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230425072601.51031-1-tomi.valkeinen@ideasonboard.com>
References: <20230425072601.51031-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add DT bindings for TI DS90UB913 FPD-Link III Serializer.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/media/i2c/ti,ds90ub913.yaml      | 133 ++++++++++++++++++
 1 file changed, 133 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ti,ds90ub913.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub913.yaml b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub913.yaml
new file mode 100644
index 000000000000..f6612bb0f667
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub913.yaml
@@ -0,0 +1,133 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/ti,ds90ub913.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments DS90UB913 FPD-Link III Serializer
+
+maintainers:
+  - Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
+
+description:
+  The TI DS90UB913 is an FPD-Link III video serializer for parallel video.
+
+properties:
+  compatible:
+    enum:
+      - ti,ds90ub913a-q1
+
+  '#gpio-cells':
+    const: 2
+    description:
+      First cell is the GPO pin number, second cell is the flags. The GPO pin
+      number must be in range of [0, 3]. Note that GPOs 2 and 3 are not
+      available in external oscillator mode.
+
+  gpio-controller: true
+
+  clocks:
+    maxItems: 1
+    description:
+      Reference clock connected to the CLKIN pin.
+
+  clock-names:
+    items:
+      - const: clkin
+
+  '#clock-cells':
+    const: 0
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: Parallel input port
+
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            required:
+              - pclk-sample
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        unevaluatedProperties: false
+        description: FPD-Link III output port
+
+    required:
+      - port@0
+      - port@1
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
+      compatible = "ti,ds90ub913a-q1";
+
+      gpio-controller;
+      #gpio-cells = <2>;
+
+      clocks = <&clk_cam_48M>;
+      clock-names = "clkin";
+
+      #clock-cells = <0>;
+
+      ports {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        port@0 {
+          reg = <0>;
+          ub913_in: endpoint {
+            remote-endpoint = <&sensor_out>;
+            pclk-sample = <1>;
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
+        sensor@48 {
+          compatible = "aptina,mt9v111";
+          reg = <0x48>;
+
+          clocks = <&fixed_clock>;
+
+          port {
+            sensor_out: endpoint {
+              remote-endpoint = <&ub913_in>;
+            };
+          };
+        };
+      };
+    };
+...
-- 
2.34.1

