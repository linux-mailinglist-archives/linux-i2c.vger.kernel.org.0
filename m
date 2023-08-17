Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12C4177FF02
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Aug 2023 22:28:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354865AbjHQU1q (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Aug 2023 16:27:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354876AbjHQU12 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Aug 2023 16:27:28 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08AA4359C;
        Thu, 17 Aug 2023 13:27:27 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8C34861FE9;
        Thu, 17 Aug 2023 20:27:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24D46C433C7;
        Thu, 17 Aug 2023 20:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692304046;
        bh=N4h/9erYEL2Ffzymz/cqNbvkGlt3eZnqrWxrHYkGXe0=;
        h=From:To:Cc:Subject:Date:From;
        b=V/yD1h9UVs+NgvwbDl9HTmfJNXJ6mEYoHl38aNkAl0Wmd1P5l4eHBPwJcnmS+O2O8
         C6d/2foh0R60c+a1DyqSNvWmHJaocrtdsFQTzgklsQWoQMjicRqDklBwBhM0Vae0zz
         J52YsohD5EWek9U52xN159Q0BOOj6GHz+4IOgGvzqxVuHyTH5Vb5eQcMfHidfoNL48
         bE77SXR1pPDEusyZ/YFm10VUA39MH0YMBTgdzp38HYLcUqPQcyX1ia1YGKQ8GtDBO8
         js9ppJExaiqkDX8lOkwmogzgCp0IfoWRr3tfB9IrE+n8+UdOm97t/yLhpxOt7eOfFR
         Ah0CQPGo0M/6g==
Received: (nullmailer pid 2180435 invoked by uid 1000);
        Thu, 17 Aug 2023 20:27:22 -0000
From:   Rob Herring <robh@kernel.org>
To:     Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <rfoss@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Todor Tomov <todor.too@gmail.com>
Cc:     Conor Dooley <conor.dooley@microchip.com>,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: [PATCH v2] media: dt-bindings: Convert Omnivision OV7251 to DT schema
Date:   Thu, 17 Aug 2023 15:27:13 -0500
Message-Id: <20230817202713.2180195-1-robh@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Convert the OmniVision OV7251 Image Sensor binding to DT schema format.

vddd-supply was listed as required, but the example and actual user
don't have it. Also, the data brief says it has an internal regulator,
so perhaps it is truly optional.

Add missing common "link-frequencies" which is used and required by the
Linux driver.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
v2:
 - Add link-frequencies which the driver requires
---
 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml |   1 +
 .../devicetree/bindings/media/i2c/ov7251.txt  |  52 ---------
 .../bindings/media/i2c/ovti,ov7251.yaml       | 109 ++++++++++++++++++
 3 files changed, 110 insertions(+), 52 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/ov7251.txt
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov7251.yaml

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index ec79b7270437..042d4dc636ee 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -269,6 +269,7 @@ examples:
                 port {
                     ov7251_ep: endpoint {
                         data-lanes = <0 1>;
+                        link-frequencies = /bits/ 64 <240000000 319200000>;
                         remote-endpoint = <&csiphy3_ep>;
                     };
                 };
diff --git a/Documentation/devicetree/bindings/media/i2c/ov7251.txt b/Documentation/devicetree/bindings/media/i2c/ov7251.txt
deleted file mode 100644
index 8281151f7493..000000000000
--- a/Documentation/devicetree/bindings/media/i2c/ov7251.txt
+++ /dev/null
@@ -1,52 +0,0 @@
-* Omnivision 1/7.5-Inch B&W VGA CMOS Digital Image Sensor
-
-The Omnivision OV7251 is a 1/7.5-Inch CMOS active pixel digital image sensor
-with an active array size of 640H x 480V. It is programmable through a serial
-I2C interface.
-
-Required Properties:
-- compatible: Value should be "ovti,ov7251".
-- clocks: Reference to the xclk clock.
-- clock-names: Should be "xclk".
-- clock-frequency: Frequency of the xclk clock.
-- enable-gpios: Chip enable GPIO. Polarity is GPIO_ACTIVE_HIGH. This corresponds
-  to the hardware pin XSHUTDOWN which is physically active low.
-- vdddo-supply: Chip digital IO regulator.
-- vdda-supply: Chip analog regulator.
-- vddd-supply: Chip digital core regulator.
-
-The device node shall contain one 'port' child node with a single 'endpoint'
-subnode for its digital output video port, in accordance with the video
-interface bindings defined in
-Documentation/devicetree/bindings/media/video-interfaces.txt.
-
-Example:
-
-	&i2c1 {
-		...
-
-		ov7251: camera-sensor@60 {
-			compatible = "ovti,ov7251";
-			reg = <0x60>;
-
-			enable-gpios = <&gpio1 6 GPIO_ACTIVE_HIGH>;
-			pinctrl-names = "default";
-			pinctrl-0 = <&camera_bw_default>;
-
-			clocks = <&clks 200>;
-			clock-names = "xclk";
-			clock-frequency = <24000000>;
-
-			vdddo-supply = <&camera_dovdd_1v8>;
-			vdda-supply = <&camera_avdd_2v8>;
-			vddd-supply = <&camera_dvdd_1v2>;
-
-			port {
-				ov7251_ep: endpoint {
-					clock-lanes = <1>;
-					data-lanes = <0>;
-					remote-endpoint = <&csi0_ep>;
-				};
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov7251.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov7251.yaml
new file mode 100644
index 000000000000..2e5187acbbb8
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov7251.yaml
@@ -0,0 +1,109 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/ovti,ov7251.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: OmniVision OV7251 Image Sensor
+
+description:
+  The Omnivision OV7251 is a 1/7.5-Inch CMOS active pixel digital image sensor
+  with an active array size of 640H x 480V. It is programmable through a serial
+  I2C interface.
+
+maintainers:
+  - Todor Tomov <todor.too@gmail.com>
+
+properties:
+  compatible:
+    const: ovti,ov7251
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    description: XCLK Input Clock
+
+  clock-names:
+    const: xclk
+
+  clock-frequency:
+    description: Frequency of the xclk clock in Hz.
+
+  vdda-supply:
+    description: Analog voltage supply, 2.8 volts
+
+  vddd-supply:
+    description: Digital core voltage supply, 1.2 volts
+
+  vdddo-supply:
+    description: Digital I/O voltage supply, 1.8 volts
+
+  enable-gpios:
+    maxItems: 1
+    description:
+      Reference to the GPIO connected to the XSHUTDOWN pin, if any. Polarity
+      is GPIO_ACTIVE_HIGH.
+
+  port:
+    description: Digital Output Port
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    additionalProperties: false
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          clock-lanes:
+            maximum: 1
+
+          data-lanes:
+            maxItems: 1
+
+          link-frequencies: true
+
+        required:
+          - data-lanes
+          - link-frequencies
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - vdddo-supply
+  - vdda-supply
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        camera@3c {
+            compatible = "ovti,ov7251";
+            reg = <0x3c>;
+            clocks = <&clks 1>;
+            clock-frequency = <24000000>;
+            vdddo-supply = <&ov7251_vdddo_1v8>;
+            vdda-supply = <&ov7251_vdda_2v8>;
+            vddd-supply = <&ov7251_vddd_1v5>;
+            enable-gpios = <&gpio1 19 GPIO_ACTIVE_HIGH>;
+
+            port {
+                ov7251_ep: endpoint {
+                    remote-endpoint = <&csi0_ep>;
+                    clock-lanes = <1>;
+                    data-lanes = <0>;
+                    link-frequencies = /bits/ 64 <240000000 319200000>;
+                };
+            };
+        };
+    };
+...
-- 
2.40.1

