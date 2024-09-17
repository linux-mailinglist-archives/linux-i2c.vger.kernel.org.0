Return-Path: <linux-i2c+bounces-6813-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8A097AD3B
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Sep 2024 10:54:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2145B1F233EA
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Sep 2024 08:54:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 143E2166F16;
	Tue, 17 Sep 2024 08:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="fwRLNqf5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2AA1531DB;
	Tue, 17 Sep 2024 08:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726563203; cv=none; b=MHziCfq7wkPdRZG8jQtO+2unfchK9GLeQhUzke768sJsUNUFf/I9jKvtlH2nygIYuDeuQptDq0SNe9ziB277GE+En2mJiK1tj7yZGE4mjtcvXEErm1Zy9/ygZkvfkz4MDgmK73eXQcp1XzhVku7HbNbJ9k5AU6L0JZogsXxZXLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726563203; c=relaxed/simple;
	bh=XH+lCK7llcoA290mRx3gP5ZezkRnxv/iDZpXGCT3vsY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HYVAf2rn8oUbk6Gdyef0jiTGvlpptorU1HffESyUTFJi3zECv6PsZkyhRhfdh1gqKkDCTBFIpTNxdlvOJ0UGfIN4jRXGxXo0cIpxh91h2k7xGM6fRQbQzXfTBCuR/SK1pUGQDr0PT5GACjnCfEp+CsA2+dI7BIoxbjIhVV8c7uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=fwRLNqf5; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2E09824000A;
	Tue, 17 Sep 2024 08:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1726563199;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TjrKPmUGSuwPpCD0ZiBfH1qgP1RNlV3NW8vcSdl6R+w=;
	b=fwRLNqf51vYQMe1JZjA43nqoAMVK7IQ/1UkGOW7h3Mdwdwl9ktQEFnc8yVQnGdKzrTurb1
	uOrw3k1+ZLGGIogC8/233uPTItzaNUzLiyrsdoYTnJky4ojYoLzlNvPMXc7fjWjlnijdqt
	3lsp2YGjKhpG4MEOEN5GH/rou3vss9CdVKZeYFn0oXBAxJr0NyfF/yZ1XvxILjlYHH/wwP
	JuxKub3MQ+7qk3ntRU3kSQDPiO2fJ37hPbsA/zxNdVzEdX+DLuwtJ62UxSlDYvuZMiQ3H6
	LLCb4NGppydlE+VhsCSsPOX4XyRui3IkxGj5HRwNyeukvdqMv5ziQzQcBY8coA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 17 Sep 2024 10:53:05 +0200
Subject: [PATCH v4 1/8] dt-bindings: connector: add GE SUNH hotplug addon
 connector
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240917-hotplug-drm-bridge-v4-1-bc4dfee61be6@bootlin.com>
References: <20240917-hotplug-drm-bridge-v4-0-bc4dfee61be6@bootlin.com>
In-Reply-To: <20240917-hotplug-drm-bridge-v4-0-bc4dfee61be6@bootlin.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Derek Kiernan <derek.kiernan@amd.com>, 
 Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Saravana Kannan <saravanak@google.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Lee Jones <lee@kernel.org>, 
 Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>
Cc: Paul Kocialkowski <contact@paulk.fr>, 
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-i2c@vger.kernel.org, linux-fbdev@vger.kernel.org, 
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.1
X-GND-Sasl: luca.ceresoli@bootlin.com

Add bindings for the GE SUNH add-on connector. This is a physical,
hot-pluggable connector that allows to attach and detach at runtime an
add-on adding peripherals on non-discoverable busses.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changed in v4:
 - rename 'nobus-devices' to 'devices'
 - use 'additionalProperties: true' for the 'devices' node (nodes are added
   by overlays)
 - document GPIO polarity
 - add '|' for descriptions to preserve line breaks
 - remove powergood-gpios (removed in hardware design)
 - Omit "/" node, not needed and cause of warnings
 - remove reference to v2 examples from example comment
 - remove unneeded "addon_connector" label from example

Changed in v3:
 - change the layout to only add subnodes, not properties
 - add the 'nobus-devices' node description to hold devices not on any bus
 - add 'i2c-*' nodes for the I2C busses, using a i2c-parent phandle
 - and the 'dsi' node for the DSI bus
 - move the entire port@1 node to the overlay (not only the remote-endpoint
   property)
 - remove the overlay examples (Overlays in examples are not supported)
 - add more clarifying descriptions and comments for examples
 - some rewording

This patch was added in v2.
---
 .../connector/ge,sunh-addon-connector.yaml         | 177 +++++++++++++++++++++
 MAINTAINERS                                        |   5 +
 2 files changed, 182 insertions(+)

diff --git a/Documentation/devicetree/bindings/connector/ge,sunh-addon-connector.yaml b/Documentation/devicetree/bindings/connector/ge,sunh-addon-connector.yaml
new file mode 100644
index 000000000000..68d7d7d7cf7e
--- /dev/null
+++ b/Documentation/devicetree/bindings/connector/ge,sunh-addon-connector.yaml
@@ -0,0 +1,177 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/connector/ge,sunh-addon-connector.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: GE SUNH hotplug add-on connector
+
+maintainers:
+  - Luca Ceresoli <luca.ceresoli@bootlin.com>
+
+description: |
+  Represent the physical connector present on GE SUNH devices that allows
+  to attach and detach at runtime an add-on adding peripherals on
+  non-discoverable busses. Peripherals on the add-on include I2C sensors
+  and a video bridge controlled via I2C.
+
+  The connector has status GPIOs to notify the connection status to the CPU
+  and a reset GPIO to allow the CPU to reset all the peripherals on the
+  add-on. It also has I2C busses and a 4-lane MIPI DSI bus.
+
+  Different add-on models can be connected, each having different
+  peripherals. For this reason each add-on has a model ID stored in a
+  non-volatile memory, which is accessed in the same way on all add-ons.
+
+  Add-on removal can happen at any moment under user control and without
+  prior notice to the CPU, making all of its components not usable
+  anymore. Later on, the same or a different add-on model can be connected.
+
+properties:
+  compatible:
+    const: ge,sunh-addon-connector
+
+  reset-gpios:
+    description: An output GPIO to reset the peripherals on the
+      add-on. Active low.
+    maxItems: 1
+
+  plugged-gpios:
+    description: An input GPIO that is asserted if and only if an add-on is
+      physically connected. Active low.
+    maxItems: 1
+
+  devices:
+    description: |
+      A container for devices not accessible via any data bus. Common use
+      cases include fixed and GPIO regulators, simple video panels and LED
+      or GPIO backlight devices. When not hot-pluggable, nodes such devices
+      are children of the root node.
+
+      This node should not be present in the connector description in the
+      base device tree. It should be added by overlays along with a subnode
+      per device.
+
+    type: object
+    additionalProperties: true
+
+  dsi:
+    type: object
+    additionalProperties: false
+
+    properties:
+      ports:
+        $ref: /schemas/graph.yaml#/properties/ports
+
+        description: |
+          OF graph bindings modeling the MIPI DSI bus across the connector. The
+          connector splits the video pipeline in a fixed part and a removable
+          part.
+
+          The fixed part of the video pipeline includes all components up to
+          the display controller and 0 or more bridges. The removable part
+          includes any bridges and any other components up to the panel.
+
+        properties:
+          port@0:
+            $ref: /schemas/graph.yaml#/properties/port
+            description:
+              The last point of the non-removable part of the MIPI DSI bus
+              line. The remote-endpoint sub-node must point to the last
+              non-removable video component of the video pipeline.
+
+          port@1:
+            $ref: /schemas/graph.yaml#/properties/port
+            description:
+              The first point of the removable part of the MIPI DSI bus
+              line.  The remote-endpoint sub-node must point to the first
+              video pipeline component on the add-on. As it describes the
+              hot-pluggable hardware, the endpoint node cannot be filled
+              until an add-on is detected, so this node needs to be added
+              by a device tree overlay at runtime.
+
+        required:
+          - port@0
+          # port@1 is added by the overlay for any add-on using the DSI lines
+
+    required:
+      - ports
+
+patternProperties:
+  '^i2c-(dbat|gp|btp)$':
+    description:
+      An I2C bus that goes through the connector. The adapter (and possibly
+      some clients) are on the fixed side. Add-ons that have any clients on
+      this bus have to be added by the add-on overlay, inside this node.
+
+    $ref: /schemas/i2c/i2c-controller.yaml#
+    unevaluatedProperties: false
+    type: object
+
+    properties:
+      i2c-parent:
+        $ref: /schemas/types.yaml#/definitions/phandle
+        description:
+          Phandle pointing to the I2C bus controller on the fixed side that
+          drives this bus
+
+required:
+  - compatible
+  - i2c-dbat
+  - i2c-gp
+  - i2c-btp
+  - dsi
+
+unevaluatedProperties: false
+
+examples:
+  # This is the description of the connector as it should appear in the
+  # main DTS describing the "main" board up to the connector. This is
+  # supposed to be used together with the overlays that describe the add-on
+  # components.
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    addon-connector {
+        compatible = "ge,sunh-addon-connector";
+        reset-gpios = <&gpio1 1 GPIO_ACTIVE_LOW>;
+        plugged-gpios = <&gpio1 2 GPIO_ACTIVE_LOW>;
+        powergood-gpios = <&gpio1 3 GPIO_ACTIVE_HIGH>;
+
+        i2c-dbat {
+            i2c-parent = <&i2c5_ch2>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+            // device subnodes to be added by overlays
+        };
+
+        i2c-gp {
+            i2c-parent = <&i2c4>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+            // device subnodes to be added by overlays
+        };
+
+        i2c-btp {
+            i2c-parent = <&i2c3>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+            // device subnodes to be added by overlays
+        };
+
+        dsi {
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+
+                    endpoint {
+                        remote-endpoint = <&previous_bridge_out>;
+                    };
+                };
+
+                // port@1 to be added by overlay
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index cc40a9d9b8cd..b939284d1350 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10270,6 +10270,11 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/iio/pressure/honeywell,mprls0025pa.yaml
 F:	drivers/iio/pressure/mprls0025pa*
 
+HOTPLUG CONNECTOR FOR GE SUNH ADDONS
+M:	Luca Ceresoli <luca.ceresoli@bootlin.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/connector/ge,sunh-addon-connector.yaml
+
 HP BIOSCFG DRIVER
 M:	Jorge Lopez <jorge.lopez2@hp.com>
 L:	platform-driver-x86@vger.kernel.org

-- 
2.34.1


