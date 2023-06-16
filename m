Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DBBCE7332CD
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Jun 2023 16:00:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343842AbjFPOAa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 16 Jun 2023 10:00:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345227AbjFPOAY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 16 Jun 2023 10:00:24 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E9C0359F;
        Fri, 16 Jun 2023 07:00:17 -0700 (PDT)
Received: from desky.lan (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3278A12AE;
        Fri, 16 Jun 2023 15:59:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1686923981;
        bh=H5byX9BR3izXApOzFQA8+xqAPcha46UtXqsX7Usjt0I=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=vbSm68moKgIDNLSXBhyk5HA28cbLpvwqBdDgmzC1t/HN7jb/wX0OO7fufXFKbX7di
         5cIR/t/+wscpyAUsV0zmSY4T1cnhF49x1To80GQo0m/XDjbDWUNLV1YtVr6rYbG5tl
         9JBk2qaB2Yh7bPQ3MNV3nFfEfiEYKHjWRyx3RCvo=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Matti Vaittinen <Matti.Vaittinen@fi.rohmeurope.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Wolfram Sang <wsa@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mike Pagano <mpagano@gentoo.org>,
        =?UTF-8?q?Krzysztof=20Ha=C5=82asa?= <khalasa@piap.pl>,
        Marek Vasut <marex@denx.de>,
        Satish Nagireddy <satish.nagireddy@getcruise.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v14 04/18] dt-bindings: media: add TI DS90UB953 FPD-Link III Serializer
Date:   Fri, 16 Jun 2023 16:59:08 +0300
Message-Id: <20230616135922.442979-5-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230616135922.442979-1-tomi.valkeinen@ideasonboard.com>
References: <20230616135922.442979-1-tomi.valkeinen@ideasonboard.com>
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

Add DT bindings for TI DS90UB953 FPD-Link III Serializer.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/media/i2c/ti,ds90ub953.yaml      | 134 ++++++++++++++++++
 1 file changed, 134 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml
new file mode 100644
index 000000000000..2030366994d1
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml
@@ -0,0 +1,134 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/ti,ds90ub953.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments DS90UB953 FPD-Link III Serializer
+
+maintainers:
+  - Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
+
+description:
+  The TI DS90UB953 is an FPD-Link III video serializer for MIPI CSI-2.
+
+properties:
+  compatible:
+    enum:
+      - ti,ds90ub953-q1
+      - ti,ds90ub971-q1
+
+  '#gpio-cells':
+    const: 2
+    description:
+      First cell is the GPIO pin number, second cell is the flags. The GPIO pin
+      number must be in range of [0, 3].
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
+        description: CSI-2 input port
+
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            required:
+              - data-lanes
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
+        sensor@1a {
+          compatible = "sony,imx274";
+          reg = <0x1a>;
+
+          reset-gpios = <&serializer 0 GPIO_ACTIVE_LOW>;
+
+          clocks = <&serializer>;
+          clock-names = "inck";
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

