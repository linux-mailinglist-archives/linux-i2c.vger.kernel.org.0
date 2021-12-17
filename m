Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3FEE479212
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Dec 2021 17:57:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239466AbhLQQ5N (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Dec 2021 11:57:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239493AbhLQQ5K (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Dec 2021 11:57:10 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC669C06173E;
        Fri, 17 Dec 2021 08:57:09 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id j9so5350360wrc.0;
        Fri, 17 Dec 2021 08:57:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WboeJlq4Ag0dTLAKyPot7SLPdxAUZgDwzBIZKe1IUWo=;
        b=Qbqo3XauPx0m5BaAQDHLPcmptqRt7OFi3e4HMyjO3WLPLAQl+vPg2LfoBklW+OHnq2
         hETgiQh7SzUGII1mxotCRLpBmT8fvGU51ziUb9IEankr1VgTQR9Jz11TOuB8t1Gsyc3m
         Dq+q1QSnMgkb+AzJo7X3bBeWZtDJMnITpQmcfJYv52hYp7QwFk1uCUwyNlqLzPqqxD7c
         URcTAGWc5/WvjVHOFFKyttOMOohX+KqxgV9qjZwWeagFNoottmQ1/W4RMdH+EZaCUtxH
         VwZviWBNcVCLrQXCKUPLniJymHX6dsbjunDcy+vorN34dWu1J8Y1F45UJVaWFDsX4eyj
         94Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WboeJlq4Ag0dTLAKyPot7SLPdxAUZgDwzBIZKe1IUWo=;
        b=S0eJIj4Xt6dKpdwmtC8Q3taBSzLptd0Qj+td48Vve5YiChgQkotbENUCB+kJJDxa9Y
         qSJTEOD3mqaWuFj4DEb2JGNCpxQrqC+x8kuDg+NSzSYhN1NuFSzK2fmgnTpgeu2s/jnD
         u0RlXHeeOKYu8ewAxVh0fYdqH2DKhX9bk+kGEY7WtinWfHB499pInjF6fFLkl/vOCoxs
         QOAV4bPce+CZ3RoU7B7fdRxPsebVizj3ttAuDNOaBmdI/TJyb5FASw8vi+U5cjyN1hU0
         8YR+OknIeWJB1wHxSApso34wN8UCw7nJJWXeIJOYtaDKxN5+NSYcMikgxUYRwojOKOC7
         1nbA==
X-Gm-Message-State: AOAM532vFNEPirUzNAa5ZeR+ChXJGlJKh4GXQQFU/2CRikpiTUbQuAWV
        z6GFslE7agUwPz98b1ytQgk=
X-Google-Smtp-Source: ABdhPJy12D5WSDcI6loU/vkxHPUEnVX83xls4Ndy/OfZIesKwodgnaRUntC1UH6rui+31zWpc8JgtQ==
X-Received: by 2002:adf:9d4c:: with SMTP id o12mr3254714wre.283.1639760228366;
        Fri, 17 Dec 2021 08:57:08 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id e4sm6798987wrh.56.2021.12.17.08.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Dec 2021 08:57:07 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Wolfram Sang <wsa@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc:     Peter Rosin <peda@axentia.se>, Andrew Jeffery <andrew@aj.id.au>,
        Brendan Higgins <brendanhiggins@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Joel Stanley <joel@jms.id.au>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH 4/4] dt-bindings: i2c: i2c-mux-gpio: Convert to json-schema
Date:   Fri, 17 Dec 2021 17:56:58 +0100
Message-Id: <20211217165658.2650677-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211217165658.2650677-1-thierry.reding@gmail.com>
References: <20211217165658.2650677-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Convert the GPIO-based I2C mux bindings from the free-form text format
to json-schema.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../devicetree/bindings/i2c/i2c-mux-gpio.txt  |  80 --------------
 .../devicetree/bindings/i2c/i2c-mux-gpio.yaml | 103 ++++++++++++++++++
 2 files changed, 103 insertions(+), 80 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-mux-gpio.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-mux-gpio.yaml

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-gpio.txt b/Documentation/devicetree/bindings/i2c/i2c-mux-gpio.txt
deleted file mode 100644
index d4cf10582a26..000000000000
--- a/Documentation/devicetree/bindings/i2c/i2c-mux-gpio.txt
+++ /dev/null
@@ -1,80 +0,0 @@
-GPIO-based I2C Bus Mux
-
-This binding describes an I2C bus multiplexer that uses GPIOs to
-route the I2C signals.
-
-                                  +-----+  +-----+
-                                  | dev |  | dev |
-    +------------+                +-----+  +-----+
-    | SoC        |                   |        |
-    |            |          /--------+--------+
-    |   +------+ |  +------+    child bus A, on GPIO value set to 0
-    |   | I2C  |-|--| Mux  |
-    |   +------+ |  +--+---+    child bus B, on GPIO value set to 1
-    |            |     |    \----------+--------+--------+
-    |   +------+ |     |               |        |        |
-    |   | GPIO |-|-----+            +-----+  +-----+  +-----+
-    |   +------+ |                  | dev |  | dev |  | dev |
-    +------------+                  +-----+  +-----+  +-----+
-
-Required properties:
-- compatible: i2c-mux-gpio
-- i2c-parent: The phandle of the I2C bus that this multiplexer's master-side
-  port is connected to.
-- mux-gpios: list of gpios used to control the muxer
-* Standard I2C mux properties. See i2c-mux.yaml in this directory.
-* I2C child bus nodes. See i2c-mux.yaml in this directory.
-
-Optional properties:
-- idle-state: value to set the muxer to when idle. When no value is
-  given, it defaults to the last value used.
-
-For each i2c child node, an I2C child bus will be created. They will
-be numbered based on their order in the device tree.
-
-Whenever an access is made to a device on a child bus, the value set
-in the relevant node's reg property will be output using the list of
-GPIOs, the first in the list holding the least-significant value.
-
-If an idle state is defined, using the idle-state (optional) property,
-whenever an access is not being made to a device on a child bus, the
-GPIOs will be set according to the idle value.
-
-If an idle state is not defined, the most recently used value will be
-left programmed into hardware whenever no access is being made to a
-device on a child bus.
-
-Example:
-	i2cmux {
-		compatible = "i2c-mux-gpio";
-		#address-cells = <1>;
-		#size-cells = <0>;
-		mux-gpios = <&gpio1 22 0 &gpio1 23 0>;
-		i2c-parent = <&i2c1>;
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
diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-gpio.yaml b/Documentation/devicetree/bindings/i2c/i2c-mux-gpio.yaml
new file mode 100644
index 000000000000..6934a445e226
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/i2c-mux-gpio.yaml
@@ -0,0 +1,103 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/i2c-mux-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: GPIO-based I2C Bus Mux
+
+maintainers:
+  - Wolfram Sang <wsa@kernel.org>
+
+description: |
+  This binding describes an I2C bus multiplexer that uses GPIOs to route the I2C signals.
+
+                                  +-----+  +-----+
+                                  | dev |  | dev |
+    +------------+                +-----+  +-----+
+    | SoC        |                   |        |
+    |            |          /--------+--------+
+    |   +------+ |  +------+    child bus A, on GPIO value set to 0
+    |   | I2C  |-|--| Mux  |
+    |   +------+ |  +--+---+    child bus B, on GPIO value set to 1
+    |            |     |    \----------+--------+--------+
+    |   +------+ |     |               |        |        |
+    |   | GPIO |-|-----+            +-----+  +-----+  +-----+
+    |   +------+ |                  | dev |  | dev |  | dev |
+    +------------+                  +-----+  +-----+  +-----+
+
+  For each I2C child node, an I2C child bus will be created. They will be numbered based on their
+  order in the device tree.
+
+  Whenever an access is made to a device on a child bus, the value set in the relevant node's reg
+  property will be output using the list of GPIOs, the first in the list holding the least-
+  significant value.
+
+  If an idle state is defined, using the idle-state (optional) property, whenever an access is not
+  being made to a device on a child bus, the GPIOs will be set according to the idle value.
+
+  If an idle state is not defined, the most recently used value will be left programmed into
+  hardware whenever no access is being made to a device on a child bus.
+
+properties:
+  compatible:
+    const: i2c-mux-gpio
+
+  i2c-parent:
+    description: phandle of the I2C bus that this multiplexer's master-side port is connected to
+    $ref: "/schemas/types.yaml#/definitions/phandle"
+
+  mux-gpios:
+    description: list of GPIOs used to control the muxer
+    $ref: "/schemas/types.yaml#/definitions/phandle-array"
+
+  idle-state:
+    description: Value to set the muxer to when idle. When no value is given, it defaults to the
+      last value used.
+    $ref: "/schemas/types.yaml#/definitions/uint32"
+
+allOf:
+  - $ref: i2c-mux.yaml
+
+unevaluatedProperties: false
+
+required:
+  - compatible
+  - i2c-parent
+  - mux-gpios
+
+examples:
+  - |
+    i2cmux {
+      compatible = "i2c-mux-gpio";
+      #address-cells = <1>;
+      #size-cells = <0>;
+      mux-gpios = <&gpio1 22 0 &gpio1 23 0>;
+      i2c-parent = <&i2c1>;
+
+      i2c@1 {
+        reg = <1>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ssd1307: oled@3c {
+          compatible = "solomon,ssd1307fb-i2c";
+          reg = <0x3c>;
+          pwms = <&pwm 4 3000>;
+          reset-gpios = <&gpio2 7 1>;
+        };
+      };
+
+      i2c@3 {
+        reg = <3>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        pca9555: pca9555@20 {
+          compatible = "nxp,pca9555";
+          gpio-controller;
+          #gpio-cells = <2>;
+          reg = <0x20>;
+        };
+      };
+    };
-- 
2.34.1

