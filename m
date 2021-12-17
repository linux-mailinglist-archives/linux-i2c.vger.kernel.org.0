Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E52C1479213
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Dec 2021 17:57:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239456AbhLQQ5M (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Dec 2021 11:57:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239474AbhLQQ5G (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Dec 2021 11:57:06 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97558C061574;
        Fri, 17 Dec 2021 08:57:05 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id c4so5225155wrd.9;
        Fri, 17 Dec 2021 08:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BeGSgH0/1iusSqCBkWLZ3ou7TLl45XgxZ6rP3jBePhQ=;
        b=qBb2Bw1SZ2wAnHidarVZVyFMCC+sP5ZLYdmRA3a9QEW5emyw2oMTRFzXhZ/YHGM3dJ
         4NOv//gbN4/EenJmXBVYs2O1mlJsQDrJq1jBXclwhcKPNt7b+EEDT/RMCVXIHiBgfM/M
         l1t1fuK1toWGl4dYc3rvwqnEJD3qzHO5S0ESp0QiMZT7rG08V2i07DUq0uCDqz0KC1Wr
         hMcMxDVn9vLCmmEgqKk1AvvZWI2pOlTgvJxNeCHaBTQyuymmv97ClyM0k/OD9mbnvGXq
         bEiWcBZpgyKjiMzNbKncYZodSl1k6GSCNoS1aykl9CEidv1w+hRLiWYgEQbqv2R7Cvsu
         uMsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BeGSgH0/1iusSqCBkWLZ3ou7TLl45XgxZ6rP3jBePhQ=;
        b=UtuMgpHixip1Zgs5uVtqoZ98uYKyVnO7ReGFBdKAhwsFZQDq5iulBSsSrR1N2hxVXQ
         Rl5vwFY66Xnq3YZsbGLBBZbJ0yB9INMQ+WMy+BOoSRtQV7Br7/WqPMnWnfvj9M+X/swF
         owduykmgzlPjzzNODeEfUVRSqj7dfnGB8YvLDq4624J+qD3SykZgvdk9d6nOHspu5PSv
         Jx9TeZseMFlJqY6tqX7FXWAUgwk1kGfUlmY7uoDwyiwH4gxd4ntGW60uLqbnKGlsxKf1
         DfV4zsx9Q9f+s3UnhKMbvJQZwojFFtkBK+Nn5ZaVlVcfnqrj8jjkmvGyp2yKbseLwYdc
         mf3Q==
X-Gm-Message-State: AOAM533/laPyL2eIEcZ5wfdVBTG2NIhkWjkXgQkBXlM73+4a1QourPkc
        sQEJBhrtz9Yz89tTy0y56lk=
X-Google-Smtp-Source: ABdhPJxtTLtWv6hh2DO/WkAyrYehzrLr2jS7YVKAoEPzsLwNwp6dzvwYqVem2SQXww+CPJLNWGP6zg==
X-Received: by 2002:a05:6000:1869:: with SMTP id d9mr3221391wri.416.1639760223705;
        Fri, 17 Dec 2021 08:57:03 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id a10sm12434423wmq.27.2021.12.17.08.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Dec 2021 08:57:02 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Wolfram Sang <wsa@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc:     Peter Rosin <peda@axentia.se>, Andrew Jeffery <andrew@aj.id.au>,
        Brendan Higgins <brendanhiggins@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Joel Stanley <joel@jms.id.au>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH 2/4] dt-bindings: i2c: i2c-mux-pinctrl: Convert to json-schema
Date:   Fri, 17 Dec 2021 17:56:56 +0100
Message-Id: <20211217165658.2650677-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211217165658.2650677-1-thierry.reding@gmail.com>
References: <20211217165658.2650677-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Convert the pinctrl-based I2C mux bindings from the free-form text
format to json-schema.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../bindings/i2c/i2c-mux-pinctrl.txt          |  93 ----------------
 .../bindings/i2c/i2c-mux-pinctrl.yaml         | 103 ++++++++++++++++++
 2 files changed, 103 insertions(+), 93 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-mux-pinctrl.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-mux-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-pinctrl.txt b/Documentation/devicetree/bindings/i2c/i2c-mux-pinctrl.txt
deleted file mode 100644
index 997a287ed3f6..000000000000
--- a/Documentation/devicetree/bindings/i2c/i2c-mux-pinctrl.txt
+++ /dev/null
@@ -1,93 +0,0 @@
-Pinctrl-based I2C Bus Mux
-
-This binding describes an I2C bus multiplexer that uses pin multiplexing to
-route the I2C signals, and represents the pin multiplexing configuration
-using the pinctrl device tree bindings.
-
-                                 +-----+  +-----+
-                                 | dev |  | dev |
-    +------------------------+   +-----+  +-----+
-    | SoC                    |      |        |
-    |                   /----|------+--------+
-    |   +---+   +------+     | child bus A, on first set of pins
-    |   |I2C|---|Pinmux|     |
-    |   +---+   +------+     | child bus B, on second set of pins
-    |                   \----|------+--------+--------+
-    |                        |      |        |        |
-    +------------------------+  +-----+  +-----+  +-----+
-                                | dev |  | dev |  | dev |
-                                +-----+  +-----+  +-----+
-
-Required properties:
-- compatible: i2c-mux-pinctrl
-- i2c-parent: The phandle of the I2C bus that this multiplexer's master-side
-  port is connected to.
-
-Also required are:
-
-* Standard pinctrl properties that specify the pin mux state for each child
-  bus. See ../pinctrl/pinctrl-bindings.txt.
-
-* Standard I2C mux properties. See i2c-mux.yaml in this directory.
-
-* I2C child bus nodes. See i2c-mux.yaml in this directory.
-
-For each named state defined in the pinctrl-names property, an I2C child bus
-will be created. I2C child bus numbers are assigned based on the index into
-the pinctrl-names property.
-
-The only exception is that no bus will be created for a state named "idle". If
-such a state is defined, it must be the last entry in pinctrl-names. For
-example:
-
-	pinctrl-names = "ddc", "pta", "idle"  ->  ddc = bus 0, pta = bus 1
-	pinctrl-names = "ddc", "idle", "pta"  ->  Invalid ("idle" not last)
-	pinctrl-names = "idle", "ddc", "pta"  ->  Invalid ("idle" not last)
-
-Whenever an access is made to a device on a child bus, the relevant pinctrl
-state will be programmed into hardware.
-
-If an idle state is defined, whenever an access is not being made to a device
-on a child bus, the idle pinctrl state will be programmed into hardware.
-
-If an idle state is not defined, the most recently used pinctrl state will be
-left programmed into hardware whenever no access is being made of a device on
-a child bus.
-
-Example:
-
-	i2cmux {
-		compatible = "i2c-mux-pinctrl";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		i2c-parent = <&i2c1>;
-
-		pinctrl-names = "ddc", "pta", "idle";
-		pinctrl-0 = <&state_i2cmux_ddc>;
-		pinctrl-1 = <&state_i2cmux_pta>;
-		pinctrl-2 = <&state_i2cmux_idle>;
-
-		i2c@0 {
-			reg = <0>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			eeprom {
-				compatible = "eeprom";
-				reg = <0x50>;
-			};
-		};
-
-		i2c@1 {
-			reg = <1>;
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			eeprom {
-				compatible = "eeprom";
-				reg = <0x50>;
-			};
-		};
-	};
-
diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-pinctrl.yaml b/Documentation/devicetree/bindings/i2c/i2c-mux-pinctrl.yaml
new file mode 100644
index 000000000000..2e3d555eb96c
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/i2c-mux-pinctrl.yaml
@@ -0,0 +1,103 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/i2c-mux-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Pinctrl-based I2C Bus Mux
+
+maintainers:
+  - Wolfram Sang <wsa@kernel.org>
+
+description: |
+  This binding describes an I2C bus multiplexer that uses pin multiplexing to route the I2C
+  signals, and represents the pin multiplexing configuration using the pinctrl device tree
+  bindings.
+
+                                 +-----+  +-----+
+                                 | dev |  | dev |
+    +------------------------+   +-----+  +-----+
+    | SoC                    |      |        |
+    |                   /----|------+--------+
+    |   +---+   +------+     | child bus A, on first set of pins
+    |   |I2C|---|Pinmux|     |
+    |   +---+   +------+     | child bus B, on second set of pins
+    |                   \----|------+--------+--------+
+    |                        |      |        |        |
+    +------------------------+  +-----+  +-----+  +-----+
+                                | dev |  | dev |  | dev |
+                                +-----+  +-----+  +-----+
+
+  For each named state defined in the pinctrl-names property, an I2C child bus will be created.
+  I2C child bus numbers are assigned based on the index into the pinctrl-names property.
+
+  The only exception is that no bus will be created for a state named "idle". If such a state is
+  defined, it must be the last entry in pinctrl-names. For example:
+
+    pinctrl-names = "ddc", "pta", "idle"  ->  ddc = bus 0, pta = bus 1
+    pinctrl-names = "ddc", "idle", "pta"  ->  Invalid ("idle" not last)
+    pinctrl-names = "idle", "ddc", "pta"  ->  Invalid ("idle" not last)
+
+  Whenever an access is made to a device on a child bus, the relevant pinctrl state will be
+  programmed into hardware.
+
+  If an idle state is defined, whenever an access is not being made to a device on a child bus,
+  the idle pinctrl state will be programmed into hardware.
+
+  If an idle state is not defined, the most recently used pinctrl state will be left programmed
+  into hardware whenever no access is being made of a device on a child bus.
+
+properties:
+  compatible:
+    const: i2c-mux-pinctrl
+
+  i2c-parent:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: The phandle of the I2C bus that this multiplexer's master-side port is connected
+      to.
+
+allOf:
+  - $ref: i2c-mux.yaml
+
+unevaluatedProperties: false
+
+required:
+  - compatible
+  - i2c-parent
+
+examples:
+  - |
+    i2cmux {
+      compatible = "i2c-mux-pinctrl";
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      i2c-parent = <&i2c1>;
+
+      pinctrl-names = "ddc", "pta", "idle";
+      pinctrl-0 = <&state_i2cmux_ddc>;
+      pinctrl-1 = <&state_i2cmux_pta>;
+      pinctrl-2 = <&state_i2cmux_idle>;
+
+      i2c@0 {
+        reg = <0>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        eeprom@50 {
+          compatible = "atmel,24c02";
+          reg = <0x50>;
+        };
+      };
+
+      i2c@1 {
+        reg = <1>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        eeprom@50 {
+          compatible = "atmel,24c02";
+          reg = <0x50>;
+        };
+      };
+    };
-- 
2.34.1

