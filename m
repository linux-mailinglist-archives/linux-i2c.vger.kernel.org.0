Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F898391F92
	for <lists+linux-i2c@lfdr.de>; Wed, 26 May 2021 20:48:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235751AbhEZSuX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 May 2021 14:50:23 -0400
Received: from mail-oi1-f171.google.com ([209.85.167.171]:37577 "EHLO
        mail-oi1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235730AbhEZSuW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 26 May 2021 14:50:22 -0400
Received: by mail-oi1-f171.google.com with SMTP id h9so2518915oih.4;
        Wed, 26 May 2021 11:48:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XCS7Hf2Xik/8eZHjopTOTTfq1/p6h02a+CeFVYAZKgw=;
        b=r4+uh270ry/AC6qGrID3oLRVBV01hE7ltVB25eZCtHh8d/B9wAXJ9VxYDXhT0NBVn8
         jf1WtEpQcLQH0/vsrnFZqXySFlo9t4qvYyr4Keh2fNafiJ5LNxjTfFyNrnqRF1f3yVVT
         xqutOQq2YcTO5MR/b3JC2MgZ51ivkE4b+fMfzKYq+kfmDbj2LtMgvzUAA17zIaG5207f
         YqR/8ihHNWzX+AKOGGVPyuU78Q95KFGrSm+Ji64ScVIielyCohXsGezYb3LFLXBiUuwp
         CxqLQB4vREDoWHeCoqs0Zi8D2JY1bI7xw17KsceabDfV/C7dosqtWm9rPPphGEmMXpjy
         xkPw==
X-Gm-Message-State: AOAM533H+DfIzyDiyuawg6UYjt6lqV3uQwAcPZpfrzMkHlIrvJ5bUWgo
        mW6YnPaIbdtHZ+c8xK5MGGnZC+ci8A==
X-Google-Smtp-Source: ABdhPJyErehQo6ntzbZ18R92hSCiYkzfzT5nXfoTlruURksmgzPzVFTX3Xhvg3WqlThKoh79Kd5VfA==
X-Received: by 2002:aca:bc02:: with SMTP id m2mr2855589oif.154.1622054929180;
        Wed, 26 May 2021 11:48:49 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.googlemail.com with ESMTPSA id x65sm7224otb.59.2021.05.26.11.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 11:48:48 -0700 (PDT)
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
Subject: [PATCH v2 3/6] dt-bindings: mux: Convert mux controller bindings to schema
Date:   Wed, 26 May 2021 13:48:36 -0500
Message-Id: <20210526184839.2937899-4-robh@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210526184839.2937899-1-robh@kernel.org>
References: <20210526184839.2937899-1-robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Convert the mux controller bindings to DT schema.

Cc: Peter Rosin <peda@axentia.se>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/i2c/i2c-mux-gpmux.txt |   2 +-
 .../bindings/i2c/i2c-mux-pca954x.txt          |   2 +-
 .../iio/multiplexer/io-channel-mux.txt        |   2 +-
 .../devicetree/bindings/mtd/ti,am654-hbmc.txt |   2 +-
 .../devicetree/bindings/mux/adi,adg792a.txt   |   2 +-
 .../devicetree/bindings/mux/adi,adgs1408.txt  |   2 +-
 .../devicetree/bindings/mux/gpio-mux.txt      |  69 -------
 .../devicetree/bindings/mux/gpio-mux.yaml     |  92 +++++++++
 .../devicetree/bindings/mux/mux-consumer.yaml |  46 +++++
 .../bindings/mux/mux-controller.txt           | 157 ---------------
 .../bindings/mux/mux-controller.yaml          | 182 ++++++++++++++++++
 .../devicetree/bindings/mux/reg-mux.txt       | 129 -------------
 .../devicetree/bindings/mux/reg-mux.yaml      | 143 ++++++++++++++
 .../bindings/net/mdio-mux-multiplexer.txt     |   2 +-
 14 files changed, 470 insertions(+), 362 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mux/gpio-mux.txt
 create mode 100644 Documentation/devicetree/bindings/mux/gpio-mux.yaml
 create mode 100644 Documentation/devicetree/bindings/mux/mux-consumer.yaml
 delete mode 100644 Documentation/devicetree/bindings/mux/mux-controller.txt
 create mode 100644 Documentation/devicetree/bindings/mux/mux-controller.yaml
 delete mode 100644 Documentation/devicetree/bindings/mux/reg-mux.txt
 create mode 100644 Documentation/devicetree/bindings/mux/reg-mux.yaml

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-gpmux.txt b/Documentation/devicetree/bindings/i2c/i2c-mux-gpmux.txt
index 8b444b94e92f..057083a8ba17 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-mux-gpmux.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c-mux-gpmux.txt
@@ -25,7 +25,7 @@ Required properties:
   mux.
 * Standard I2C mux properties. See i2c-mux.txt in this directory.
 * I2C child bus nodes. See i2c-mux.txt in this directory. The sub-bus number
-  is also the mux-controller state described in ../mux/mux-controller.txt
+  is also the mux-controller state described in ../mux/mux-controller.yaml
 
 Optional properties:
 - mux-locked: If present, explicitly allow unrelated I2C transactions on the
diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.txt b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.txt
index 7abda506b828..9f3f3eb67e87 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.txt
@@ -26,7 +26,7 @@ Optional Properties:
 
   - reset-gpios: Reference to the GPIO connected to the reset input.
   - idle-state: if present, overrides i2c-mux-idle-disconnect,
-    Please refer to Documentation/devicetree/bindings/mux/mux-controller.txt
+    Please refer to Documentation/devicetree/bindings/mux/mux-controller.yaml
   - i2c-mux-idle-disconnect: Boolean; if defined, forces mux to disconnect all
     children in idle state. This is necessary for example, if there are several
     multiplexers on the bus and the devices behind them use same I2C addresses.
diff --git a/Documentation/devicetree/bindings/iio/multiplexer/io-channel-mux.txt b/Documentation/devicetree/bindings/iio/multiplexer/io-channel-mux.txt
index 89647d714387..d2b3105dba67 100644
--- a/Documentation/devicetree/bindings/iio/multiplexer/io-channel-mux.txt
+++ b/Documentation/devicetree/bindings/iio/multiplexer/io-channel-mux.txt
@@ -17,7 +17,7 @@ For each non-empty string in the channels property, an io-channel will
 be created. The number of this io-channel is the same as the index into
 the list of strings in the channels property, and also matches the mux
 controller state. The mux controller state is described in
-../mux/mux-controller.txt
+../mux/mux-controller.yaml
 
 Example:
 	mux: mux-controller {
diff --git a/Documentation/devicetree/bindings/mtd/ti,am654-hbmc.txt b/Documentation/devicetree/bindings/mtd/ti,am654-hbmc.txt
index faa81c2e5da6..ccfd37b8a0ad 100644
--- a/Documentation/devicetree/bindings/mtd/ti,am654-hbmc.txt
+++ b/Documentation/devicetree/bindings/mtd/ti,am654-hbmc.txt
@@ -13,7 +13,7 @@ Optional properties:
 - mux-controls : phandle to the multiplexer that controls selection of
 		 HBMC vs OSPI inside Flash SubSystem (FSS). Default is OSPI,
 		 if property is absent.
-		 See Documentation/devicetree/bindings/mux/reg-mux.txt
+		 See Documentation/devicetree/bindings/mux/reg-mux.yaml
 		 for mmio-mux binding details
 
 Example:
diff --git a/Documentation/devicetree/bindings/mux/adi,adg792a.txt b/Documentation/devicetree/bindings/mux/adi,adg792a.txt
index 96b787a69f50..b0e5bf6903d8 100644
--- a/Documentation/devicetree/bindings/mux/adi,adg792a.txt
+++ b/Documentation/devicetree/bindings/mux/adi,adg792a.txt
@@ -5,7 +5,7 @@ Required properties:
 - #mux-control-cells : <0> if parallel (the three muxes are bound together
   with a single mux controller controlling all three muxes), or <1> if
   not (one mux controller for each mux).
-* Standard mux-controller bindings as described in mux-controller.txt
+* Standard mux-controller bindings as described in mux-controller.yaml
 
 Optional properties for ADG792G:
 - gpio-controller : if present, #gpio-cells below is required.
diff --git a/Documentation/devicetree/bindings/mux/adi,adgs1408.txt b/Documentation/devicetree/bindings/mux/adi,adgs1408.txt
index be6947f4d86b..453a38961c13 100644
--- a/Documentation/devicetree/bindings/mux/adi,adgs1408.txt
+++ b/Documentation/devicetree/bindings/mux/adi,adgs1408.txt
@@ -4,7 +4,7 @@ Required properties:
 - compatible : Should be one of
 	* "adi,adgs1408"
 	* "adi,adgs1409"
-* Standard mux-controller bindings as described in mux-controller.txt
+* Standard mux-controller bindings as described in mux-controller.yaml
 
 Optional properties for ADGS1408/1409:
 - gpio-controller : if present, #gpio-cells is required.
diff --git a/Documentation/devicetree/bindings/mux/gpio-mux.txt b/Documentation/devicetree/bindings/mux/gpio-mux.txt
deleted file mode 100644
index b8f746344d80..000000000000
--- a/Documentation/devicetree/bindings/mux/gpio-mux.txt
+++ /dev/null
@@ -1,69 +0,0 @@
-GPIO-based multiplexer controller bindings
-
-Define what GPIO pins are used to control a multiplexer. Or several
-multiplexers, if the same pins control more than one multiplexer.
-
-Required properties:
-- compatible : "gpio-mux"
-- mux-gpios : list of gpios used to control the multiplexer, least
-	      significant bit first.
-- #mux-control-cells : <0>
-* Standard mux-controller bindings as decribed in mux-controller.txt
-
-Optional properties:
-- idle-state : if present, the state the mux will have when idle. The
-	       special state MUX_IDLE_AS_IS is the default.
-
-The multiplexer state is defined as the number represented by the
-multiplexer GPIO pins, where the first pin is the least significant
-bit. An active pin is a binary 1, an inactive pin is a binary 0.
-
-Example:
-
-	mux: mux-controller {
-		compatible = "gpio-mux";
-		#mux-control-cells = <0>;
-
-		mux-gpios = <&pioA 0 GPIO_ACTIVE_HIGH>,
-			    <&pioA 1 GPIO_ACTIVE_HIGH>;
-	};
-
-	adc-mux {
-		compatible = "io-channel-mux";
-		io-channels = <&adc 0>;
-		io-channel-names = "parent";
-
-		mux-controls = <&mux>;
-
-		channels = "sync-1", "in", "out", "sync-2";
-	};
-
-	i2c-mux {
-		compatible = "i2c-mux";
-		i2c-parent = <&i2c1>;
-
-		mux-controls = <&mux>;
-
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		i2c@0 {
-			reg = <0>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			ssd1307: oled@3c {
-				/* ... */
-			};
-		};
-
-		i2c@3 {
-			reg = <3>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			pca9555: pca9555@20 {
-				/* ... */
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/mux/gpio-mux.yaml b/Documentation/devicetree/bindings/mux/gpio-mux.yaml
new file mode 100644
index 000000000000..0a7c8d64981a
--- /dev/null
+++ b/Documentation/devicetree/bindings/mux/gpio-mux.yaml
@@ -0,0 +1,92 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mux/gpio-mux.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: GPIO-based multiplexer controller bindings
+
+maintainers:
+  - Peter Rosin <peda@axentia.se>
+
+description: |+
+  Define what GPIO pins are used to control a multiplexer. Or several
+  multiplexers, if the same pins control more than one multiplexer.
+
+  The multiplexer state is defined as the number represented by the
+  multiplexer GPIO pins, where the first pin is the least significant
+  bit. An active pin is a binary 1, an inactive pin is a binary 0.
+
+properties:
+  compatible:
+    const: gpio-mux
+
+  mux-gpios:
+    description:
+      List of gpios used to control the multiplexer, least significant bit first.
+
+  '#mux-control-cells':
+    const: 0
+
+  idle-state:
+    default: -1
+
+required:
+  - compatible
+  - mux-gpios
+  - "#mux-control-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    mux: mux-controller {
+        compatible = "gpio-mux";
+        #mux-control-cells = <0>;
+
+        mux-gpios = <&pioA 0 GPIO_ACTIVE_HIGH>,
+              <&pioA 1 GPIO_ACTIVE_HIGH>;
+    };
+
+    adc-mux {
+        compatible = "io-channel-mux";
+        io-channels = <&adc 0>;
+        io-channel-names = "parent";
+
+        mux-controls = <&mux>;
+
+        channels = "sync-1", "in", "out", "sync-2";
+    };
+
+    i2c-mux {
+        compatible = "i2c-mux";
+        i2c-parent = <&i2c1>;
+
+        mux-controls = <&mux>;
+
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        i2c@0 {
+            reg = <0>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            ssd1307: oled@3c {
+                reg = <0x3c>;
+            };
+        };
+
+        i2c@3 {
+            reg = <3>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            pca9555: pca9555@20 {
+                reg = <0x20>;
+            };
+        };
+    };
+...
diff --git a/Documentation/devicetree/bindings/mux/mux-consumer.yaml b/Documentation/devicetree/bindings/mux/mux-consumer.yaml
new file mode 100644
index 000000000000..7af93298ab5c
--- /dev/null
+++ b/Documentation/devicetree/bindings/mux/mux-consumer.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mux/mux-consumer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Common multiplexer controller consumer bindings
+
+maintainers:
+  - Peter Rosin <peda@axentia.se>
+
+description: |
+  Mux controller consumers should specify a list of mux controllers that they
+  want to use with a property containing a 'mux-ctrl-list':
+
+    mux-ctrl-list ::= <single-mux-ctrl> [mux-ctrl-list]
+    single-mux-ctrl ::= <mux-ctrl-phandle> [mux-ctrl-specifier]
+    mux-ctrl-phandle : phandle to mux controller node
+    mux-ctrl-specifier : array of #mux-control-cells specifying the
+                         given mux controller (controller specific)
+
+  Mux controller properties should be named "mux-controls". The exact meaning of
+  each mux controller property must be documented in the device tree binding for
+  each consumer. An optional property "mux-control-names" may contain a list of
+  strings to label each of the mux controllers listed in the "mux-controls"
+  property.
+
+  mux-ctrl-specifier typically encodes the chip-relative mux controller number.
+  If the mux controller chip only provides a single mux controller, the
+  mux-ctrl-specifier can typically be left out.
+
+select: true
+
+properties:
+  mux-controls:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+
+  mux-control-names:
+    description:
+      Devices that use more than a single mux controller can use the
+      "mux-control-names" property to map the name of the requested mux
+      controller to an index into the list given by the "mux-controls" property.
+
+additionalProperties: true
+
+...
diff --git a/Documentation/devicetree/bindings/mux/mux-controller.txt b/Documentation/devicetree/bindings/mux/mux-controller.txt
deleted file mode 100644
index 4f47e4bd2fa0..000000000000
--- a/Documentation/devicetree/bindings/mux/mux-controller.txt
+++ /dev/null
@@ -1,157 +0,0 @@
-Common multiplexer controller bindings
-======================================
-
-A multiplexer (or mux) controller will have one, or several, consumer devices
-that uses the mux controller. Thus, a mux controller can possibly control
-several parallel multiplexers. Presumably there will be at least one
-multiplexer needed by each consumer, but a single mux controller can of course
-control several multiplexers for a single consumer.
-
-A mux controller provides a number of states to its consumers, and the state
-space is a simple zero-based enumeration. I.e. 0-1 for a 2-way multiplexer,
-0-7 for an 8-way multiplexer, etc.
-
-
-Consumers
----------
-
-Mux controller consumers should specify a list of mux controllers that they
-want to use with a property containing a 'mux-ctrl-list':
-
-	mux-ctrl-list ::= <single-mux-ctrl> [mux-ctrl-list]
-	single-mux-ctrl ::= <mux-ctrl-phandle> [mux-ctrl-specifier]
-	mux-ctrl-phandle : phandle to mux controller node
-	mux-ctrl-specifier : array of #mux-control-cells specifying the
-			     given mux controller (controller specific)
-
-Mux controller properties should be named "mux-controls". The exact meaning of
-each mux controller property must be documented in the device tree binding for
-each consumer. An optional property "mux-control-names" may contain a list of
-strings to label each of the mux controllers listed in the "mux-controls"
-property.
-
-Drivers for devices that use more than a single mux controller can use the
-"mux-control-names" property to map the name of the requested mux controller
-to an index into the list given by the "mux-controls" property.
-
-mux-ctrl-specifier typically encodes the chip-relative mux controller number.
-If the mux controller chip only provides a single mux controller, the
-mux-ctrl-specifier can typically be left out.
-
-Example:
-
-	/* One consumer of a 2-way mux controller (one GPIO-line) */
-	mux: mux-controller {
-		compatible = "gpio-mux";
-		#mux-control-cells = <0>;
-
-		mux-gpios = <&pioA 0 GPIO_ACTIVE_HIGH>;
-	};
-
-	adc-mux {
-		compatible = "io-channel-mux";
-		io-channels = <&adc 0>;
-		io-channel-names = "parent";
-
-		mux-controls = <&mux>;
-		mux-control-names = "adc";
-
-		channels = "sync", "in";
-	};
-
-Note that in the example above, specifying the "mux-control-names" is redundant
-because there is only one mux controller in the list. However, if the driver
-for the consumer node in fact asks for a named mux controller, that name is of
-course still required.
-
-	/*
-	 * Two consumers (one for an ADC line and one for an i2c bus) of
-	 * parallel 4-way multiplexers controlled by the same two GPIO-lines.
-	 */
-	mux: mux-controller {
-		compatible = "gpio-mux";
-		#mux-control-cells = <0>;
-
-		mux-gpios = <&pioA 0 GPIO_ACTIVE_HIGH>,
-			    <&pioA 1 GPIO_ACTIVE_HIGH>;
-	};
-
-	adc-mux {
-		compatible = "io-channel-mux";
-		io-channels = <&adc 0>;
-		io-channel-names = "parent";
-
-		mux-controls = <&mux>;
-
-		channels = "sync-1", "in", "out", "sync-2";
-	};
-
-	i2c-mux {
-		compatible = "i2c-mux";
-		i2c-parent = <&i2c1>;
-
-		mux-controls = <&mux>;
-
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		i2c@0 {
-			reg = <0>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			ssd1307: oled@3c {
-				/* ... */
-			};
-		};
-
-		i2c@3 {
-			reg = <3>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			pca9555: pca9555@20 {
-				/* ... */
-			};
-		};
-	};
-
-
-Mux controller nodes
---------------------
-
-Mux controller nodes must specify the number of cells used for the
-specifier using the '#mux-control-cells' property.
-
-Optionally, mux controller nodes can also specify the state the mux should
-have when it is idle. The idle-state property is used for this. If the
-idle-state is not present, the mux controller is typically left as is when
-it is idle. For multiplexer chips that expose several mux controllers, the
-idle-state property is an array with one idle state for each mux controller.
-
-The special value (-1) may be used to indicate that the mux should be left
-as is when it is idle. This is the default, but can still be useful for
-mux controller chips with more than one mux controller, particularly when
-there is a need to "step past" a mux controller and set some other idle
-state for a mux controller with a higher index.
-
-Some mux controllers have the ability to disconnect the input/output of the
-multiplexer. Using this disconnected high-impedance state as the idle state
-is indicated with idle state (-2).
-
-These constants are available in
-
-      #include <dt-bindings/mux/mux.h>
-
-as MUX_IDLE_AS_IS (-1) and MUX_IDLE_DISCONNECT (-2).
-
-An example mux controller node look like this (the adg972a chip is a triple
-4-way multiplexer):
-
-	mux: mux-controller@50 {
-		compatible = "adi,adg792a";
-		reg = <0x50>;
-		#mux-control-cells = <1>;
-
-		idle-state = <MUX_IDLE_DISCONNECT MUX_IDLE_AS_IS 2>;
-	};
diff --git a/Documentation/devicetree/bindings/mux/mux-controller.yaml b/Documentation/devicetree/bindings/mux/mux-controller.yaml
new file mode 100644
index 000000000000..736a84c3b6a5
--- /dev/null
+++ b/Documentation/devicetree/bindings/mux/mux-controller.yaml
@@ -0,0 +1,182 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mux/mux-controller.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Common multiplexer controller provider bindings
+
+maintainers:
+  - Peter Rosin <peda@axentia.se>
+
+description: |
+  A multiplexer (or mux) controller will have one, or several, consumer devices
+  that uses the mux controller. Thus, a mux controller can possibly control
+  several parallel multiplexers. Presumably there will be at least one
+  multiplexer needed by each consumer, but a single mux controller can of course
+  control several multiplexers for a single consumer.
+
+  A mux controller provides a number of states to its consumers, and the state
+  space is a simple zero-based enumeration. I.e. 0-1 for a 2-way multiplexer,
+  0-7 for an 8-way multiplexer, etc.
+
+
+  Mux controller nodes
+  --------------------
+
+  Mux controller nodes must specify the number of cells used for the
+  specifier using the '#mux-control-cells' property.
+
+  Optionally, mux controller nodes can also specify the state the mux should
+  have when it is idle. The idle-state property is used for this. If the
+  idle-state is not present, the mux controller is typically left as is when
+  it is idle. For multiplexer chips that expose several mux controllers, the
+  idle-state property is an array with one idle state for each mux controller.
+
+  The special value (-1) may be used to indicate that the mux should be left
+  as is when it is idle. This is the default, but can still be useful for
+  mux controller chips with more than one mux controller, particularly when
+  there is a need to "step past" a mux controller and set some other idle
+  state for a mux controller with a higher index.
+
+  Some mux controllers have the ability to disconnect the input/output of the
+  multiplexer. Using this disconnected high-impedance state as the idle state
+  is indicated with idle state (-2).
+
+  These constants are available in
+
+        #include <dt-bindings/mux/mux.h>
+
+  as MUX_IDLE_AS_IS (-1) and MUX_IDLE_DISCONNECT (-2).
+
+  An example mux controller node look like this (the adg972a chip is a triple
+  4-way multiplexer):
+
+    mux: mux-controller@50 {
+      compatible = "adi,adg792a";
+      reg = <0x50>;
+      #mux-control-cells = <1>;
+
+      idle-state = <MUX_IDLE_DISCONNECT MUX_IDLE_AS_IS 2>;
+    };
+
+select:
+  anyOf:
+    - properties:
+        $nodename:
+          pattern: '^mux-controller'
+    - required:
+        - '#mux-control-cells'
+
+properties:
+  $nodename:
+    pattern: '^mux-controller(@.*|-[0-9a-f]+)?$'
+
+  '#mux-control-cells':
+    enum: [ 0, 1 ]
+
+  idle-state:
+    $ref: /schemas/types.yaml#/definitions/int32
+    minimum: -2
+
+  idle-states:
+    description: |
+      Mux controller nodes can specify the state the mux should have when it is
+      idle. If the idle-state is not present, the mux controller is typically
+      left as is when it is idle. For multiplexer chips that expose several mux
+      controllers, the idle-state property is an array with one idle state for
+      each mux controller.
+
+      The special value (-1) may be used to indicate that the mux should be left
+      as is when it is idle. This is the default, but can still be useful for
+      mux controller chips with more than one mux controller, particularly when
+      there is a need to "step past" a mux controller and set some other idle
+      state for a mux controller with a higher index.
+
+      Some mux controllers have the ability to disconnect the input/output of the
+      multiplexer. Using this disconnected high-impedance state as the idle state
+      is indicated with idle state (-2).
+    $ref: /schemas/types.yaml#/definitions/int32-array
+    items:
+      minimum: -2
+
+additionalProperties: true
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    /* One consumer of a 2-way mux controller (one GPIO-line) */
+    mux: mux-controller {
+        compatible = "gpio-mux";
+        #mux-control-cells = <0>;
+
+        mux-gpios = <&pioA 0 GPIO_ACTIVE_HIGH>;
+    };
+
+    adc-mux {
+        compatible = "io-channel-mux";
+        io-channels = <&adc 0>;
+        io-channel-names = "parent";
+
+        mux-controls = <&mux>;
+        mux-control-names = "adc";
+
+        channels = "sync", "in";
+    };
+
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    /*
+     * Two consumers (one for an ADC line and one for an i2c bus) of
+     * parallel 4-way multiplexers controlled by the same two GPIO-lines.
+     */
+    mux2: mux-controller {
+        compatible = "gpio-mux";
+        #mux-control-cells = <0>;
+
+        mux-gpios = <&pioA 0 GPIO_ACTIVE_HIGH>,
+              <&pioA 1 GPIO_ACTIVE_HIGH>;
+    };
+
+    adc-mux {
+        compatible = "io-channel-mux";
+        io-channels = <&adc 0>;
+        io-channel-names = "parent";
+
+        mux-controls = <&mux2>;
+
+        channels = "sync-1", "in", "out", "sync-2";
+    };
+
+    i2c-mux {
+        compatible = "i2c-mux";
+        i2c-parent = <&i2c1>;
+
+        mux-controls = <&mux2>;
+
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        i2c@0 {
+            reg = <0>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            ssd1307: oled@3c {
+                reg = <0x3c>;
+            };
+        };
+
+        i2c@3 {
+            reg = <3>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            pca9555: pca9555@20 {
+                reg = <0x20>;
+            };
+        };
+    };
+...
diff --git a/Documentation/devicetree/bindings/mux/reg-mux.txt b/Documentation/devicetree/bindings/mux/reg-mux.txt
deleted file mode 100644
index 4afd7ba73d60..000000000000
--- a/Documentation/devicetree/bindings/mux/reg-mux.txt
+++ /dev/null
@@ -1,129 +0,0 @@
-Generic register bitfield-based multiplexer controller bindings
-
-Define register bitfields to be used to control multiplexers. The parent
-device tree node must be a device node to provide register r/w access.
-
-Required properties:
-- compatible : should be one of
-	"reg-mux" : if parent device of mux controller is not syscon device
-	"mmio-mux" : if parent device of mux controller is syscon device
-- #mux-control-cells : <1>
-- mux-reg-masks : an array of register offset and pre-shifted bitfield mask
-                  pairs, each describing a single mux control.
-* Standard mux-controller bindings as decribed in mux-controller.txt
-
-Optional properties:
-- idle-states : if present, the state the muxes will have when idle. The
-		special state MUX_IDLE_AS_IS is the default.
-
-The multiplexer state of each multiplexer is defined as the value of the
-bitfield described by the corresponding register offset and bitfield mask
-pair in the mux-reg-masks array.
-
-Example 1:
-The parent device of mux controller is not a syscon device.
-
-&i2c0 {
-	fpga@66 { // fpga connected to i2c
-		compatible = "fsl,lx2160aqds-fpga", "fsl,fpga-qixis-i2c",
-			     "simple-mfd";
-		reg = <0x66>;
-
-		mux: mux-controller {
-			compatible = "reg-mux";
-			#mux-control-cells = <1>;
-			mux-reg-masks = <0x54 0xf8>, /* 0: reg 0x54, bits 7:3 */
-					<0x54 0x07>; /* 1: reg 0x54, bits 2:0 */
-		};
-	};
-};
-
-mdio-mux-1 {
-	compatible = "mdio-mux-multiplexer";
-	mux-controls = <&mux 0>;
-	mdio-parent-bus = <&emdio1>;
-	#address-cells = <1>;
-	#size-cells = <0>;
-
-	mdio@0 {
-		reg = <0x0>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-	};
-
-	mdio@8 {
-		reg = <0x8>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-	};
-
-	..
-	..
-};
-
-mdio-mux-2 {
-	compatible = "mdio-mux-multiplexer";
-	mux-controls = <&mux 1>;
-	mdio-parent-bus = <&emdio2>;
-	#address-cells = <1>;
-	#size-cells = <0>;
-
-	mdio@0 {
-		reg = <0x0>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-	};
-
-	mdio@1 {
-		reg = <0x1>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-	};
-
-	..
-	..
-};
-
-Example 2:
-The parent device of mux controller is syscon device.
-
-syscon {
-	compatible = "syscon";
-
-	mux: mux-controller {
-		compatible = "mmio-mux";
-		#mux-control-cells = <1>;
-
-		mux-reg-masks = <0x3 0x30>, /* 0: reg 0x3, bits 5:4 */
-				<0x3 0x40>, /* 1: reg 0x3, bit 6 */
-		idle-states = <MUX_IDLE_AS_IS>, <0>;
-	};
-};
-
-video-mux {
-	compatible = "video-mux";
-	mux-controls = <&mux 0>;
-	#address-cells = <1>;
-	#size-cells = <0>;
-
-	ports {
-		/* inputs 0..3 */
-		port@0 {
-			reg = <0>;
-		};
-		port@1 {
-			reg = <1>;
-		};
-		port@2 {
-			reg = <2>;
-		};
-		port@3 {
-			reg = <3>;
-		};
-
-		/* output */
-		port@4 {
-			reg = <4>;
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/mux/reg-mux.yaml b/Documentation/devicetree/bindings/mux/reg-mux.yaml
new file mode 100644
index 000000000000..60d5746eb39d
--- /dev/null
+++ b/Documentation/devicetree/bindings/mux/reg-mux.yaml
@@ -0,0 +1,143 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mux/reg-mux.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Generic register bitfield-based multiplexer controller bindings
+
+maintainers:
+  - Peter Rosin <peda@axentia.se>
+
+description: |+
+  Define register bitfields to be used to control multiplexers. The parent
+  device tree node must be a device node to provide register r/w access.
+
+properties:
+  compatible:
+    enum:
+      - reg-mux   # parent device of mux controller is not syscon device
+      - mmio-mux  # parent device of mux controller is syscon device
+
+  reg: true
+
+  '#mux-control-cells':
+    const: 1
+
+  mux-reg-masks:
+    description: an array of register offset and pre-shifted bitfield mask
+      pairs, each describing a single mux control.
+
+  idle-states: true
+
+required:
+  - compatible
+  - mux-reg-masks
+  - '#mux-control-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    /* The parent device of mux controller is not a syscon device. */
+
+    #include <dt-bindings/mux/mux.h>
+
+    mux-controller {
+        compatible = "reg-mux";
+        #mux-control-cells = <1>;
+        mux-reg-masks =
+            <0x54 0xf8>, /* 0: reg 0x54, bits 7:3 */
+            <0x54 0x07>; /* 1: reg 0x54, bits 2:0 */
+    };
+
+    mdio-mux-1 {
+        compatible = "mdio-mux-multiplexer";
+        mux-controls = <&mux1 0>;
+        mdio-parent-bus = <&emdio1>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        mdio@0 {
+            reg = <0x0>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+        };
+
+        mdio@8 {
+            reg = <0x8>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+        };
+    };
+
+    mdio-mux-2 {
+        compatible = "mdio-mux-multiplexer";
+        mux-controls = <&mux1 1>;
+        mdio-parent-bus = <&emdio2>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        mdio@0 {
+            reg = <0x0>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+        };
+
+        mdio@1 {
+            reg = <0x1>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+        };
+    };
+
+  - |
+    /* The parent device of mux controller is syscon device. */
+
+    #include <dt-bindings/mux/mux.h>
+    syscon@1000 {
+        compatible = "fsl,imx7d-iomuxc-gpr", "fsl,imx6q-iomuxc-gpr", "syscon", "simple-mfd";
+        reg = <0x1000 0x100>;
+
+        mux2: mux-controller {
+            compatible = "mmio-mux";
+            #mux-control-cells = <1>;
+
+            mux-reg-masks =
+                <0x3 0x30>, /* 0: reg 0x3, bits 5:4 */
+                <0x3 0x40>; /* 1: reg 0x3, bit 6 */
+            idle-states = <MUX_IDLE_AS_IS>, <0>;
+        };
+    };
+
+    video-mux {
+        compatible = "video-mux";
+        mux-controls = <&mux2 0>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            /* inputs 0..3 */
+            port@0 {
+                reg = <0>;
+            };
+            port@1 {
+                reg = <1>;
+            };
+            port@2 {
+                reg = <2>;
+            };
+            port@3 {
+                reg = <3>;
+            };
+
+            /* output */
+            port@4 {
+                reg = <4>;
+            };
+        };
+    };
+...
diff --git a/Documentation/devicetree/bindings/net/mdio-mux-multiplexer.txt b/Documentation/devicetree/bindings/net/mdio-mux-multiplexer.txt
index 534e38058fe0..87fd0b4f654f 100644
--- a/Documentation/devicetree/bindings/net/mdio-mux-multiplexer.txt
+++ b/Documentation/devicetree/bindings/net/mdio-mux-multiplexer.txt
@@ -14,7 +14,7 @@ each child node of mdio bus multiplexer consumer device represent a mdio
 bus.
 
 for more information please refer
-Documentation/devicetree/bindings/mux/mux-controller.txt
+Documentation/devicetree/bindings/mux/mux-controller.yaml
 and Documentation/devicetree/bindings/net/mdio-mux.txt
 
 Example:
-- 
2.27.0

