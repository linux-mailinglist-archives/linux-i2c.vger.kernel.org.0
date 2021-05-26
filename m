Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B1DF391F99
	for <lists+linux-i2c@lfdr.de>; Wed, 26 May 2021 20:49:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235732AbhEZSuc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 May 2021 14:50:32 -0400
Received: from mail-ot1-f46.google.com ([209.85.210.46]:42815 "EHLO
        mail-ot1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233560AbhEZSu0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 26 May 2021 14:50:26 -0400
Received: by mail-ot1-f46.google.com with SMTP id n3-20020a9d74030000b029035e65d0a0b8so1961792otk.9;
        Wed, 26 May 2021 11:48:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NUv3HY5Qq3devlXxPwSWcFNHs0zXCFYyGR/SmlCxD/4=;
        b=tj97cDRrKKp/2FQUJYRgYzYbiq9RUSZyJ14Ij9pyjB6x6ZJhhXIjK+OF0XTMRTwaze
         Tdlux5+2fFv//IZ7uc5AWfIM/4gy+DUHnO31DB91YnD31KfL2Ttsx62tqYMh2hKBo88A
         QWlYZK7nc4PKHHScMVdW6wxVJfV4qHXCU1PwSi0CUyHKjyof6LEcCQo/QD8cOBuZL4T6
         9yJBPDSLtuAKOVBYFhjH4nZ2W3iKpxLRbH7E1GD3COiS4Od/6UWvlH0fbXMdS7sr+PQH
         qpDixol9ZUsS6sXHoal1nVECJVQKYQMvlFTlfVTexBK5wrLQgMJxzx0axXSX2J4vw5yi
         p0GA==
X-Gm-Message-State: AOAM531V8WxfCzZT1ybGLNhrpxF0y/XCK8dnnuQFPUA3vZNjOZeWhuai
        vy2/pI8t7Qwe/aUsbBYaFnoCXXqXxA==
X-Google-Smtp-Source: ABdhPJxdrrxZf5jhSx6JCFfPitKZYaitgdqLfoq5cUybptpyokb8nJxhvgCGjhgOiCrcS0rIycek9Q==
X-Received: by 2002:a9d:73d8:: with SMTP id m24mr3473683otk.269.1622054932752;
        Wed, 26 May 2021 11:48:52 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.googlemail.com with ESMTPSA id x65sm7224otb.59.2021.05.26.11.48.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 11:48:52 -0700 (PDT)
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
Subject: [PATCH v2 5/6] dt-bindings: i2c: i2c-mux-pca954x: Convert to DT schema
Date:   Wed, 26 May 2021 13:48:38 -0500
Message-Id: <20210526184839.2937899-6-robh@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210526184839.2937899-1-robh@kernel.org>
References: <20210526184839.2937899-1-robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Convert the i2c-mux-pca954x binding to DT schema format.

Add the missing compatible for 'nxp,pca9645' which is already in use.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
v2:
 - Add 'nxp,pca9645'
 - Fix compatible sorting
---
 .../bindings/i2c/i2c-mux-pca954x.txt          |  74 ------------
 .../bindings/i2c/i2c-mux-pca954x.yaml         | 110 ++++++++++++++++++
 2 files changed, 110 insertions(+), 74 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.txt b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.txt
deleted file mode 100644
index 9f3f3eb67e87..000000000000
--- a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.txt
+++ /dev/null
@@ -1,74 +0,0 @@
-* NXP PCA954x I2C bus switch
-
-The driver supports NXP PCA954x and PCA984x I2C mux/switch devices.
-
-Required Properties:
-
-  - compatible: Must contain one of the following.
-    "nxp,pca9540",
-    "nxp,pca9542",
-    "nxp,pca9543",
-    "nxp,pca9544",
-    "nxp,pca9545",
-    "nxp,pca9546", "nxp,pca9846",
-    "nxp,pca9547", "nxp,pca9847",
-    "nxp,pca9548", "nxp,pca9848",
-    "nxp,pca9849"
-
-  - reg: The I2C address of the device.
-
-  The following required properties are defined externally:
-
-  - Standard I2C mux properties. See i2c-mux.txt in this directory.
-  - I2C child bus nodes. See i2c-mux.txt in this directory.
-
-Optional Properties:
-
-  - reset-gpios: Reference to the GPIO connected to the reset input.
-  - idle-state: if present, overrides i2c-mux-idle-disconnect,
-    Please refer to Documentation/devicetree/bindings/mux/mux-controller.yaml
-  - i2c-mux-idle-disconnect: Boolean; if defined, forces mux to disconnect all
-    children in idle state. This is necessary for example, if there are several
-    multiplexers on the bus and the devices behind them use same I2C addresses.
-  - interrupts: Interrupt mapping for IRQ.
-  - interrupt-controller: Marks the device node as an interrupt controller.
-  - #interrupt-cells : Should be two.
-    - first cell is the pin number
-    - second cell is used to specify flags.
-    See also Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
-
-Example:
-
-	i2c-switch@74 {
-		compatible = "nxp,pca9548";
-		#address-cells = <1>;
-		#size-cells = <0>;
-		reg = <0x74>;
-
-		interrupt-parent = <&ipic>;
-		interrupts = <17 IRQ_TYPE_LEVEL_LOW>;
-		interrupt-controller;
-		#interrupt-cells = <2>;
-
-		i2c@2 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <2>;
-
-			eeprom@54 {
-				compatible = "atmel,24c08";
-				reg = <0x54>;
-			};
-		};
-
-		i2c@4 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <4>;
-
-			rtc@51 {
-				compatible = "nxp,pcf8563";
-				reg = <0x51>;
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
new file mode 100644
index 000000000000..9f1726d0356b
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
@@ -0,0 +1,110 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP PCA954x I2C bus switch
+
+maintainers:
+  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+
+description:
+  The binding supports NXP PCA954x and PCA984x I2C mux/switch devices.
+
+allOf:
+  - $ref: /schemas/i2c/i2c-mux.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - nxp,pca9540
+          - nxp,pca9542
+          - nxp,pca9543
+          - nxp,pca9544
+          - nxp,pca9545
+          - nxp,pca9546
+          - nxp,pca9547
+          - nxp,pca9548
+          - nxp,pca9846
+          - nxp,pca9847
+          - nxp,pca9848
+          - nxp,pca9849
+      - items:
+          - const: nxp,pca9646
+          - const: nxp,pca9546
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  "#interrupt-cells":
+    const: 2
+
+  interrupt-controller: true
+
+  reset-gpios:
+    maxItems: 1
+
+  i2c-mux-idle-disconnect:
+    type: boolean
+    description: Forces mux to disconnect all children in idle state. This is
+      necessary for example, if there are several multiplexers on the bus and
+      the devices behind them use same I2C addresses.
+
+  idle-state:
+    description: if present, overrides i2c-mux-idle-disconnect
+    $ref: /schemas/mux/mux-controller.yaml#/properties/idle-state
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        i2c-mux@74 {
+            compatible = "nxp,pca9548";
+            #address-cells = <1>;
+            #size-cells = <0>;
+            reg = <0x74>;
+
+            interrupt-parent = <&ipic>;
+            interrupts = <17 IRQ_TYPE_LEVEL_LOW>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
+
+            i2c@2 {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                reg = <2>;
+
+                eeprom@54 {
+                    compatible = "atmel,24c08";
+                    reg = <0x54>;
+                };
+            };
+
+            i2c@4 {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                reg = <4>;
+
+                rtc@51 {
+                    compatible = "nxp,pcf8563";
+                    reg = <0x51>;
+                };
+            };
+        };
+    };
+...
-- 
2.27.0

