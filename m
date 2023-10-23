Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 158517D387E
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Oct 2023 15:53:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229707AbjJWNxH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 23 Oct 2023 09:53:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229686AbjJWNxG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 23 Oct 2023 09:53:06 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFB43C2
        for <linux-i2c@vger.kernel.org>; Mon, 23 Oct 2023 06:53:03 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:375d:2b56:c03f:d72d])
        by xavier.telenet-ops.be with bizsmtp
        id 1Rt32B00C3CbNjd01Rt3e3; Mon, 23 Oct 2023 15:53:03 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1quvMW-007KHO-8p;
        Mon, 23 Oct 2023 15:53:03 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1quvMd-007oLl-3v;
        Mon, 23 Oct 2023 15:53:03 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: i2c: i2c-demux-pinctrl: Convert to json-schema
Date:   Mon, 23 Oct 2023 15:53:00 +0200
Message-Id: <28c173dfbbc17403b0c5a6f27661d7bd33a86f84.1698068607.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Convert the pinctrl-based I2C bus demultiplexer Device Tree binding
documentation to json-schema.

Update the example to match reality.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
The example includes changes from "[PATCH 0/3] dts: renesas: Fix I2C bus
demux node names and ADV751[13] power supplies"
(https://lore.kernel.org/r/cover.1698068646.git.geert+renesas@glider.be)

 .../bindings/i2c/i2c-demux-pinctrl.txt        | 135 --------------
 .../bindings/i2c/i2c-demux-pinctrl.yaml       | 172 ++++++++++++++++++
 2 files changed, 172 insertions(+), 135 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-demux-pinctrl.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-demux-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/i2c/i2c-demux-pinctrl.txt b/Documentation/devicetree/bindings/i2c/i2c-demux-pinctrl.txt
deleted file mode 100644
index 86b2e433a969013c..0000000000000000
--- a/Documentation/devicetree/bindings/i2c/i2c-demux-pinctrl.txt
+++ /dev/null
@@ -1,135 +0,0 @@
-Pinctrl-based I2C Bus DeMux
-
-This binding describes an I2C bus demultiplexer that uses pin multiplexing to
-route the I2C signals, and represents the pin multiplexing configuration using
-the pinctrl device tree bindings. This may be used to select one I2C IP core at
-runtime which may have a better feature set for a given task than another I2C
-IP core on the SoC. The most simple example is to fall back to GPIO bitbanging
-if your current runtime configuration hits an errata of the internal IP core.
-
-    +-------------------------------+
-    | SoC                           |
-    |                               |   +-----+  +-----+
-    |   +------------+              |   | dev |  | dev |
-    |   |I2C IP Core1|--\           |   +-----+  +-----+
-    |   +------------+   \-------+  |      |        |
-    |                    |Pinctrl|--|------+--------+
-    |   +------------+   +-------+  |
-    |   |I2C IP Core2|--/           |
-    |   +------------+              |
-    |                               |
-    +-------------------------------+
-
-Required properties:
-- compatible: "i2c-demux-pinctrl"
-- i2c-parent: List of phandles of I2C masters available for selection. The first
-	      one will be used as default.
-- i2c-bus-name: The name of this bus. Also needed as pinctrl-name for the I2C
-		parents.
-
-Furthermore, I2C mux properties and child nodes. See i2c-mux.yaml in this
-directory.
-
-Example:
-
-Here is a snipplet for a bus to be demuxed. It contains various i2c clients for
-HDMI, so the bus is named "i2c-hdmi":
-
-	i2chdmi: i2c@8 {
-
-		compatible = "i2c-demux-pinctrl";
-		i2c-parent = <&gpioi2c>, <&iic2>, <&i2c2>;
-		i2c-bus-name = "i2c-hdmi";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		ak4643: sound-codec@12 {
-			compatible = "asahi-kasei,ak4643";
-
-			#sound-dai-cells = <0>;
-			reg = <0x12>;
-		};
-
-		composite-in@20 {
-			compatible = "adi,adv7180";
-			reg = <0x20>;
-			remote = <&vin1>;
-
-			port {
-				adv7180: endpoint {
-					bus-width = <8>;
-					remote-endpoint = <&vin1ep0>;
-				};
-			};
-		};
-
-		hdmi@39 {
-			compatible = "adi,adv7511w";
-			reg = <0x39>;
-			interrupt-parent = <&gpio1>;
-			interrupts = <15 IRQ_TYPE_LEVEL_LOW>;
-
-			adi,input-depth = <8>;
-			adi,input-colorspace = "rgb";
-			adi,input-clock = "1x";
-			adi,input-style = <1>;
-			adi,input-justification = "evenly";
-
-			ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				port@0 {
-					reg = <0>;
-					adv7511_in: endpoint {
-						remote-endpoint = <&du_out_lvds0>;
-					};
-				};
-
-				port@1 {
-					reg = <1>;
-					adv7511_out: endpoint {
-						remote-endpoint = <&hdmi_con>;
-					};
-				};
-			};
-		};
-	};
-
-And for clarification, here are the snipplets for the i2c-parents:
-
-	gpioi2c: i2c@9 {
-		#address-cells = <1>;
-		#size-cells = <0>;
-		compatible = "i2c-gpio";
-		gpios = <&gpio5 6 GPIO_ACTIVE_HIGH /* sda */
-			 &gpio5 5 GPIO_ACTIVE_HIGH /* scl */
-			>;
-		i2c-gpio,delay-us = <5>;
-	};
-
-...
-
-&i2c2	{
-	pinctrl-0 = <&i2c2_pins>;
-	pinctrl-names = "i2c-hdmi";
-
-	clock-frequency = <100000>;
-};
-
-...
-
-&iic2	{
-	pinctrl-0 = <&iic2_pins>;
-	pinctrl-names = "i2c-hdmi";
-
-	clock-frequency = <100000>;
-};
-
-Please note:
-
-- pinctrl properties for the parent I2C controllers need a pinctrl state
-  with the same name as i2c-bus-name, not "default"!
-
-- the i2c masters must have their status "disabled". This driver will
-  enable them at runtime when needed.
diff --git a/Documentation/devicetree/bindings/i2c/i2c-demux-pinctrl.yaml b/Documentation/devicetree/bindings/i2c/i2c-demux-pinctrl.yaml
new file mode 100644
index 0000000000000000..2c08f2a7cf1ee28c
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/i2c-demux-pinctrl.yaml
@@ -0,0 +1,172 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/i2c-demux-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Pinctrl-based I2C Bus Demultiplexer
+
+maintainers:
+  - Wolfram Sang <wsa+renesas@sang-engineering.com>
+
+description: |
+  This binding describes an I2C bus demultiplexer that uses pin multiplexing to
+  route the I2C signals, and represents the pin multiplexing configuration
+  using the pinctrl device tree bindings.  This may be used to select one I2C
+  IP core at runtime which may have a better feature set for a given task than
+  another I2C IP core on the SoC.  The most simple example is to fall back to
+  GPIO bitbanging if your current runtime configuration hits an errata of the
+  internal IP core.
+
+      +-------------------------------+
+      | SoC                           |
+      |                               |   +-----+  +-----+
+      |   +------------+              |   | dev |  | dev |
+      |   |I2C IP Core1|--\           |   +-----+  +-----+
+      |   +------------+   \-------+  |      |        |
+      |                    |Pinctrl|--|------+--------+
+      |   +------------+   +-------+  |
+      |   |I2C IP Core2|--/           |
+      |   +------------+              |
+      |                               |
+      +-------------------------------+
+
+allOf:
+  - $ref: i2c-mux.yaml
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
+properties:
+  compatible:
+    const: i2c-demux-pinctrl
+
+  i2c-parent:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description:
+      List of phandles of I2C masters available for selection.  The first one
+      will be used as default.
+
+  i2c-bus-name:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      The name of this bus.  Also needed as pinctrl-name for the I2C parents.
+
+required:
+  - compatible
+  - i2c-parent
+  - i2c-bus-name
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    gpioi2c2: i2c-9 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        compatible = "i2c-gpio";
+        scl-gpios = <&gpio5 5 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+        sda-gpios = <&gpio5 6 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+        i2c-gpio,delay-us = <5>;
+
+        // The I2C controller must have its status "disabled".  The I2C bus
+        // demultiplexer will enable it at runtime when needed.
+        status = "disabled";
+    };
+
+    iic2: i2c@e6520000 {
+        reg = <0xe6520000 0x425>;
+        pinctrl-0 = <&iic2_pins>;
+        // The pinctrl property for the parent I2C controller needs a pinctrl
+        // state with the same name as i2c-bus-name in the I2C bus demultiplexer
+        // node, not "default"!
+        pinctrl-names = "i2c-hdmi";
+
+        clock-frequency = <100000>;
+
+        // The I2C controller must have its status "disabled".  The I2C bus
+        // demultiplexer will enable it at runtime when needed.
+        status = "disabled";
+    };
+
+    i2c2: i2c@e6530000 {
+        reg = <0 0xe6530000 0 0x40>;
+        pinctrl-0 = <&i2c2_pins>;
+        // The pinctrl property for the parent I2C controller needs a pinctrl
+        // state with the same name as i2c-bus-name in the I2C bus demultiplexer
+        // node, not "default"!
+        pinctrl-names = "i2c-hdmi";
+
+        clock-frequency = <100000>;
+
+        // The I2C controller must have its status "disabled".  The I2C bus
+        // demultiplexer will enable it at runtime when needed.
+        status = "disabled";
+    };
+
+    // Example for a bus to be demuxed.  It contains various I2C clients for
+    // HDMI, so the bus is named "i2c-hdmi":
+    i2chdmi: i2c-mux3 {
+            compatible = "i2c-demux-pinctrl";
+            i2c-parent = <&iic2>, <&i2c2>, <&gpioi2c2>;
+            i2c-bus-name = "i2c-hdmi";
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            ak4643: codec@12 {
+                    compatible = "asahi-kasei,ak4643";
+                    #sound-dai-cells = <0>;
+                    reg = <0x12>;
+            };
+
+            composite-in@20 {
+                    compatible = "adi,adv7180";
+                    reg = <0x20>;
+
+                    port {
+                            adv7180: endpoint {
+                                    bus-width = <8>;
+                                    remote-endpoint = <&vin1ep0>;
+                            };
+                    };
+            };
+
+            hdmi@39 {
+                    compatible = "adi,adv7511w";
+                    reg = <0x39>;
+                    interrupt-parent = <&gpio1>;
+                    interrupts = <15 IRQ_TYPE_LEVEL_LOW>;
+                    clocks = <&cec_clock>;
+                    clock-names = "cec";
+
+                    avdd-supply = <&fixedregulator1v8>;
+                    dvdd-supply = <&fixedregulator1v8>;
+                    pvdd-supply = <&fixedregulator1v8>;
+                    dvdd-3v-supply = <&fixedregulator3v3>;
+                    bgvdd-supply = <&fixedregulator1v8>;
+
+                    adi,input-depth = <8>;
+                    adi,input-colorspace = "rgb";
+                    adi,input-clock = "1x";
+
+                    ports {
+                            #address-cells = <1>;
+                            #size-cells = <0>;
+
+                            port@0 {
+                                    reg = <0>;
+                                    adv7511_in: endpoint {
+                                            remote-endpoint = <&lvds0_out>;
+                                    };
+                            };
+
+                            port@1 {
+                                    reg = <1>;
+                                    adv7511_out: endpoint {
+                                            remote-endpoint = <&hdmi_con_out>;
+                                    };
+                            };
+                    };
+            };
+    };
-- 
2.34.1

