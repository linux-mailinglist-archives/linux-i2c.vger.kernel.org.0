Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4599E391F95
	for <lists+linux-i2c@lfdr.de>; Wed, 26 May 2021 20:49:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235665AbhEZSu0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 May 2021 14:50:26 -0400
Received: from mail-oi1-f170.google.com ([209.85.167.170]:45998 "EHLO
        mail-oi1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235774AbhEZSuZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 26 May 2021 14:50:25 -0400
Received: by mail-oi1-f170.google.com with SMTP id w127so2490875oig.12;
        Wed, 26 May 2021 11:48:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tIs3Bl4p7nCUo6QIJ/gkAi6qKC+97acIjJgKNO5hs7I=;
        b=dICR8It+BdytaFX2RMcOMenuWByRCE4DtoJ6lViavJyIiziGZAOsdz6+QOgKFQH+LC
         LRcwwOvqx+itfZR+S5OYClwQsqBa+Mw8dvptFeTvSihm5WUXV//h+FCpb/uFGJFlfcKq
         yq+KZjm2Zltrc9MYV6PPoHYiwkygWlhZ9uO5i2Id8Qi4bRZtL8hmFYsVa88r83CdheK4
         e4sIb11awojUKxfjkYffpgD9ErmdDHV+9Bgwk3qR3FYK1QpDr/34A33DG5h1JOWVHwUd
         7gu/JkhFZYGHo5hP+mHdCk/ygeEtC7qFtT/ljxE9Kt0ryB9gsYtyg1q8/6QeF0ay8vli
         DkNQ==
X-Gm-Message-State: AOAM530DXCD50KJB5/hjTrnonC/gCM/AotbbCvEJxGJt6UTzK6jsR9DV
        +Gonzin4LZS3enE+mL4mSRz+LwUn2Q==
X-Google-Smtp-Source: ABdhPJwvXH/XZyMoKx91x4niYEksJemq+xHyj+Zth3Kkkza0J0Ov9KXLYKm+HsiNUOj2kJZB/jWQCw==
X-Received: by 2002:a05:6808:1402:: with SMTP id w2mr2916827oiv.72.1622054931278;
        Wed, 26 May 2021 11:48:51 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.googlemail.com with ESMTPSA id x65sm7224otb.59.2021.05.26.11.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 11:48:50 -0700 (PDT)
From:   Rob Herring <robh@kernel.org>
To:     devicetree@vger.kernel.org, Peter Rosin <peda@axentia.se>,
        Wolfram Sang <wsa@kernel.org>
Cc:     linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Lee Jones <lee.jones@linaro.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-i2c@vger.kernel.org
Subject: [PATCH v2 4/6] dt-bindings: i2c: Convert i2c-mux bindings to DT schema
Date:   Wed, 26 May 2021 13:48:37 -0500
Message-Id: <20210526184839.2937899-5-robh@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210526184839.2937899-1-robh@kernel.org>
References: <20210526184839.2937899-1-robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

As some of the example I2C devices don't have schemas yet, change them to
ones that do.

Cc: Peter Rosin <peda@axentia.se>
Signed-off-by: Rob Herring <robh@kernel.org>
---
v2:
 - Comment and bullet list cleanups
---
 .../bindings/i2c/i2c-demux-pinctrl.txt        |   2 +-
 .../devicetree/bindings/i2c/i2c-mux-gpio.txt  |   4 +-
 .../devicetree/bindings/i2c/i2c-mux-gpmux.txt |  99 --------------
 .../bindings/i2c/i2c-mux-gpmux.yaml           | 124 ++++++++++++++++++
 .../bindings/i2c/i2c-mux-ltc4306.txt          |   4 +-
 .../bindings/i2c/i2c-mux-pinctrl.txt          |   4 +-
 .../devicetree/bindings/i2c/i2c-mux-reg.txt   |   4 +-
 .../devicetree/bindings/i2c/i2c-mux.txt       |  73 -----------
 .../devicetree/bindings/i2c/i2c-mux.yaml      |  87 ++++++++++++
 9 files changed, 220 insertions(+), 181 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-mux-gpmux.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-mux-gpmux.yaml
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-mux.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-mux.yaml

diff --git a/Documentation/devicetree/bindings/i2c/i2c-demux-pinctrl.txt b/Documentation/devicetree/bindings/i2c/i2c-demux-pinctrl.txt
index 81b5d55086fa..86b2e433a969 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-demux-pinctrl.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c-demux-pinctrl.txt
@@ -27,7 +27,7 @@ Required properties:
 - i2c-bus-name: The name of this bus. Also needed as pinctrl-name for the I2C
 		parents.
 
-Furthermore, I2C mux properties and child nodes. See i2c-mux.txt in this
+Furthermore, I2C mux properties and child nodes. See i2c-mux.yaml in this
 directory.
 
 Example:
diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-gpio.txt b/Documentation/devicetree/bindings/i2c/i2c-mux-gpio.txt
index 21da3ecbb370..e00d2b9e957a 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-mux-gpio.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c-mux-gpio.txt
@@ -22,8 +22,8 @@ Required properties:
 - i2c-parent: The phandle of the I2C bus that this multiplexer's master-side
   port is connected to.
 - mux-gpios: list of gpios used to control the muxer
-* Standard I2C mux properties. See i2c-mux.txt in this directory.
-* I2C child bus nodes. See i2c-mux.txt in this directory.
+* Standard I2C mux properties. See i2c-mux.yaml in this directory.
+* I2C child bus nodes. See i2c-mux.yaml in this directory.
 
 Optional properties:
 - idle-state: value to set the muxer to when idle. When no value is
diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-gpmux.txt b/Documentation/devicetree/bindings/i2c/i2c-mux-gpmux.txt
deleted file mode 100644
index 057083a8ba17..000000000000
--- a/Documentation/devicetree/bindings/i2c/i2c-mux-gpmux.txt
+++ /dev/null
@@ -1,99 +0,0 @@
-General Purpose I2C Bus Mux
-
-This binding describes an I2C bus multiplexer that uses a mux controller
-from the mux subsystem to route the I2C signals.
-
-                                  .-----.  .-----.
-                                  | dev |  | dev |
-    .------------.                '-----'  '-----'
-    | SoC        |                   |        |
-    |            |          .--------+--------'
-    |   .------. |  .------+    child bus A, on MUX value set to 0
-    |   | I2C  |-|--| Mux  |
-    |   '------' |  '--+---+    child bus B, on MUX value set to 1
-    |   .------. |     |    '----------+--------+--------.
-    |   | MUX- | |     |               |        |        |
-    |   | Ctrl |-|-----+            .-----.  .-----.  .-----.
-    |   '------' |                  | dev |  | dev |  | dev |
-    '------------'                  '-----'  '-----'  '-----'
-
-Required properties:
-- compatible: i2c-mux
-- i2c-parent: The phandle of the I2C bus that this multiplexer's master-side
-  port is connected to.
-- mux-controls: The phandle of the mux controller to use for operating the
-  mux.
-* Standard I2C mux properties. See i2c-mux.txt in this directory.
-* I2C child bus nodes. See i2c-mux.txt in this directory. The sub-bus number
-  is also the mux-controller state described in ../mux/mux-controller.yaml
-
-Optional properties:
-- mux-locked: If present, explicitly allow unrelated I2C transactions on the
-  parent I2C adapter at these times:
-   + during setup of the multiplexer
-   + between setup of the multiplexer and the child bus I2C transaction
-   + between the child bus I2C transaction and releasing of the multiplexer
-   + during releasing of the multiplexer
-  However, I2C transactions to devices behind all I2C multiplexers connected
-  to the same parent adapter that this multiplexer is connected to are blocked
-  for the full duration of the complete multiplexed I2C transaction (i.e.
-  including the times covered by the above list).
-  If mux-locked is not present, the multiplexer is assumed to be parent-locked.
-  This means that no unrelated I2C transactions are allowed on the parent I2C
-  adapter for the complete multiplexed I2C transaction.
-  The properties of mux-locked and parent-locked multiplexers are discussed
-  in more detail in Documentation/i2c/i2c-topology.rst.
-
-For each i2c child node, an I2C child bus will be created. They will
-be numbered based on their order in the device tree.
-
-Whenever an access is made to a device on a child bus, the value set
-in the relevant node's reg property will be set as the state in the
-mux controller.
-
-Example:
-	mux: mux-controller {
-		compatible = "gpio-mux";
-		#mux-control-cells = <0>;
-
-		mux-gpios = <&pioA 0 GPIO_ACTIVE_HIGH>,
-			    <&pioA 1 GPIO_ACTIVE_HIGH>;
-	};
-
-	i2c-mux {
-		compatible = "i2c-mux";
-		mux-locked;
-		i2c-parent = <&i2c1>;
-
-		mux-controls = <&mux>;
-
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		i2c@1 {
-			reg = <1>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			ssd1307: oled@3c {
-				compatible = "solomon,ssd1307fb-i2c";
-				reg = <0x3c>;
-				pwms = <&pwm 4 3000>;
-				reset-gpios = <&gpio2 7 1>;
-				reset-active-low;
-			};
-		};
-
-		i2c@3 {
-			reg = <3>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			pca9555: pca9555@20 {
-				compatible = "nxp,pca9555";
-				gpio-controller;
-				#gpio-cells = <2>;
-				reg = <0x20>;
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-gpmux.yaml b/Documentation/devicetree/bindings/i2c/i2c-mux-gpmux.yaml
new file mode 100644
index 000000000000..9b0603a72f40
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/i2c-mux-gpmux.yaml
@@ -0,0 +1,124 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/i2c-mux-gpmux.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: General Purpose I2C Bus Mux
+
+maintainers:
+  - Peter Rosin <peda@axentia.se>
+
+description: |+
+  This binding describes an I2C bus multiplexer that uses a mux controller
+  from the mux subsystem to route the I2C signals.
+
+                                    .-----.  .-----.
+                                    | dev |  | dev |
+      .------------.                '-----'  '-----'
+      | SoC        |                   |        |
+      |            |          .--------+--------'
+      |   .------. |  .------+    child bus A, on MUX value set to 0
+      |   | I2C  |-|--| Mux  |
+      |   '------' |  '--+---+    child bus B, on MUX value set to 1
+      |   .------. |     |    '----------+--------+--------.
+      |   | MUX- | |     |               |        |        |
+      |   | Ctrl |-|-----+            .-----.  .-----.  .-----.
+      |   '------' |                  | dev |  | dev |  | dev |
+      '------------'                  '-----'  '-----'  '-----'
+
+
+
+allOf:
+  - $ref: /schemas/i2c/i2c-mux.yaml#
+
+properties:
+  compatible:
+    const: i2c-mux
+
+  i2c-parent:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      The phandle of the I2C bus that this multiplexer's master-side port is
+      connected to.
+
+  mux-controls:
+    maxItems: 1
+    description:
+      The mux-controller states are the I2C sub-bus numbers.
+
+  mux-locked:
+    type: boolean
+    description: |
+      Explicitly allow unrelated I2C transactions on the parent I2C adapter at
+      these times:
+       - during setup of the multiplexer
+       - between setup of the multiplexer and the child bus I2C transaction
+       - between the child bus I2C transaction and releasing of the multiplexer
+       - during releasing of the multiplexer
+
+      However, I2C transactions to devices behind all I2C multiplexers connected
+      to the same parent adapter that this multiplexer is connected to are blocked
+      for the full duration of the complete multiplexed I2C transaction (i.e.
+      including the times covered by the above list).
+      If mux-locked is not present, the multiplexer is assumed to be parent-locked.
+      This means that no unrelated I2C transactions are allowed on the parent I2C
+      adapter for the complete multiplexed I2C transaction.
+      The properties of mux-locked and parent-locked multiplexers are discussed
+      in more detail in Documentation/i2c/i2c-topology.rst.
+
+required:
+  - compatible
+  - i2c-parent
+  - mux-controls
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    mux: mux-controller {
+        compatible = "gpio-mux";
+        #mux-control-cells = <0>;
+
+        mux-gpios = <&pioA 0 GPIO_ACTIVE_HIGH>,
+                    <&pioA 1 GPIO_ACTIVE_HIGH>;
+    };
+
+    i2c-mux {
+        compatible = "i2c-mux";
+        mux-locked;
+        i2c-parent = <&i2c1>;
+
+        mux-controls = <&mux>;
+
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        i2c@1 {
+            reg = <1>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            gpio@20 {
+                compatible = "nxp,pca9555";
+                gpio-controller;
+                #gpio-cells = <2>;
+                reg = <0x20>;
+            };
+        };
+
+        i2c@3 {
+            reg = <3>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            gpio@20 {
+                compatible = "nxp,pca9555";
+                gpio-controller;
+                #gpio-cells = <2>;
+                reg = <0x20>;
+            };
+        };
+    };
+...
diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-ltc4306.txt b/Documentation/devicetree/bindings/i2c/i2c-mux-ltc4306.txt
index 8b1e49cdce3f..29c4550c9782 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-mux-ltc4306.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c-mux-ltc4306.txt
@@ -8,8 +8,8 @@ Required Properties:
 
   The following required properties are defined externally:
 
-  - Standard I2C mux properties. See i2c-mux.txt in this directory.
-  - I2C child bus nodes. See i2c-mux.txt in this directory.
+  - Standard I2C mux properties. See i2c-mux.yaml in this directory.
+  - I2C child bus nodes. See i2c-mux.yaml in this directory.
 
 Optional Properties:
 
diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-pinctrl.txt b/Documentation/devicetree/bindings/i2c/i2c-mux-pinctrl.txt
index 33119a98e144..997a287ed3f6 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-mux-pinctrl.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c-mux-pinctrl.txt
@@ -28,9 +28,9 @@ Also required are:
 * Standard pinctrl properties that specify the pin mux state for each child
   bus. See ../pinctrl/pinctrl-bindings.txt.
 
-* Standard I2C mux properties. See i2c-mux.txt in this directory.
+* Standard I2C mux properties. See i2c-mux.yaml in this directory.
 
-* I2C child bus nodes. See i2c-mux.txt in this directory.
+* I2C child bus nodes. See i2c-mux.yaml in this directory.
 
 For each named state defined in the pinctrl-names property, an I2C child bus
 will be created. I2C child bus numbers are assigned based on the index into
diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-reg.txt b/Documentation/devicetree/bindings/i2c/i2c-mux-reg.txt
index de00d7fc450b..b9d9755e4172 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-mux-reg.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c-mux-reg.txt
@@ -7,8 +7,8 @@ Required properties:
 - compatible: i2c-mux-reg
 - i2c-parent: The phandle of the I2C bus that this multiplexer's master-side
   port is connected to.
-* Standard I2C mux properties. See i2c-mux.txt in this directory.
-* I2C child bus nodes. See i2c-mux.txt in this directory.
+* Standard I2C mux properties. See i2c-mux.yaml in this directory.
+* I2C child bus nodes. See i2c-mux.yaml in this directory.
 
 Optional properties:
 - reg: this pair of <offset size> specifies the register to control the mux.
diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux.txt b/Documentation/devicetree/bindings/i2c/i2c-mux.txt
deleted file mode 100644
index b38f58a1c878..000000000000
--- a/Documentation/devicetree/bindings/i2c/i2c-mux.txt
+++ /dev/null
@@ -1,73 +0,0 @@
-Common i2c bus multiplexer/switch properties.
-
-An i2c bus multiplexer/switch will have several child busses that are
-numbered uniquely in a device dependent manner.  The nodes for an i2c bus
-multiplexer/switch will have one child node for each child bus.
-
-Optional properties:
-- #address-cells = <1>;
-   This property is required if the i2c-mux child node does not exist.
-
-- #size-cells = <0>;
-   This property is required if the i2c-mux child node does not exist.
-
-- i2c-mux
-   For i2c multiplexers/switches that have child nodes that are a mixture
-   of both i2c child busses and other child nodes, the 'i2c-mux' subnode
-   can be used for populating the i2c child busses.  If an 'i2c-mux'
-   subnode is present, only subnodes of this will be considered as i2c
-   child busses.
-
-Required properties for the i2c-mux child node:
-- #address-cells = <1>;
-- #size-cells = <0>;
-
-Required properties for i2c child bus nodes:
-- #address-cells = <1>;
-- #size-cells = <0>;
-- reg : The sub-bus number.
-
-Optional properties for i2c child bus nodes:
-- Other properties specific to the multiplexer/switch hardware.
-- Child nodes conforming to i2c bus binding
-
-
-Example :
-
-	/*
-	   An NXP pca9548 8 channel I2C multiplexer at address 0x70
-	   with two NXP pca8574 GPIO expanders attached, one each to
-	   ports 3 and 4.
-	 */
-
-	mux@70 {
-		compatible = "nxp,pca9548";
-		reg = <0x70>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		i2c@3 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <3>;
-
-			gpio1: gpio@38 {
-				compatible = "nxp,pca8574";
-				reg = <0x38>;
-				#gpio-cells = <2>;
-				gpio-controller;
-			};
-		};
-		i2c@4 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <4>;
-
-			gpio2: gpio@38 {
-				compatible = "nxp,pca8574";
-				reg = <0x38>;
-				#gpio-cells = <2>;
-				gpio-controller;
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux.yaml b/Documentation/devicetree/bindings/i2c/i2c-mux.yaml
new file mode 100644
index 000000000000..24cac36037f5
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/i2c-mux.yaml
@@ -0,0 +1,87 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/i2c-mux.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Common i2c bus multiplexer/switch properties.
+
+maintainers:
+  - Peter Rosin <peda@axentia.se>
+
+description: |+
+  An i2c bus multiplexer/switch will have several child busses that are numbered
+  uniquely in a device dependent manner.  The nodes for an i2c bus
+  multiplexer/switch will have one child node for each child bus.
+
+  For i2c multiplexers/switches that have child nodes that are a mixture of both
+  i2c child busses and other child nodes, the 'i2c-mux' subnode can be used for
+  populating the i2c child busses.  If an 'i2c-mux' subnode is present, only
+  subnodes of this will be considered as i2c child busses.
+
+properties:
+  $nodename:
+    pattern: '^(i2c-?)?mux'
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+patternProperties:
+  '^i2c@[0-9a-f]+$':
+    $ref: /schemas/i2c/i2c-controller.yaml
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        description: The mux selector sub-bus number for the child I2C bus.
+        maxItems: 1
+
+additionalProperties: true
+
+examples:
+  - |
+    /*
+     * An NXP pca9548 8 channel I2C multiplexer at address 0x70
+     * with two NXP pca8574 GPIO expanders attached, one each to
+     * ports 3 and 4.
+     */
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        i2c-mux@70 {
+            compatible = "nxp,pca9548";
+            reg = <0x70>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            i2c@3 {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                reg = <3>;
+
+                gpio@20 {
+                    compatible = "nxp,pca9555";
+                    gpio-controller;
+                    #gpio-cells = <2>;
+                    reg = <0x20>;
+                };
+            };
+            i2c@4 {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                reg = <4>;
+
+                gpio@20 {
+                    compatible = "nxp,pca9555";
+                    gpio-controller;
+                    #gpio-cells = <2>;
+                    reg = <0x20>;
+                };
+            };
+        };
+    };
+...
-- 
2.27.0

