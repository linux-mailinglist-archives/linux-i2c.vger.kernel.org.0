Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B3BE2C7274
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Nov 2020 23:09:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733170AbgK1VuI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 28 Nov 2020 16:50:08 -0500
Received: from mail.kernel.org ([198.145.29.99]:45766 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730883AbgK1SL4 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 28 Nov 2020 13:11:56 -0500
Received: from localhost.localdomain (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net [81.101.6.87])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0A524246DE;
        Sat, 28 Nov 2020 17:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606584953;
        bh=6qNyZ1RtQGHuKLMWge17BBB6zo62SDUtn3lfhDZJZAk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=vzSZqtyxwLzk+3Q2GF6+3WfEP7KYzBpUefXHLTXmRq7FjIZMG/k3GDDgGEF7z3xPr
         90LXvcn6jVEwivGKxPbedMN4v/bqddMc8wgorcrUfUpROlWTd2PmGbfxlMKTjIMR1b
         TfIljwhhINop5T409hmlhkkuFb96kut70UOtsPIs=
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v2 3/3] dt-bindings:iio:gyro:invensense,mpu3050: txt to yaml format conversion.
Date:   Sat, 28 Nov 2020 17:33:43 +0000
Message-Id: <20201128173343.390165-4-jic23@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201128173343.390165-1-jic23@kernel.org>
References: <20201128173343.390165-1-jic23@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Very similar to the mpu6050 binding.
Only unusual element is the i2c-gate section.
Example tweaked a little to include a real device behind the gate.

As Rob Herring suggested, dropped use of explicit i2c-gate yaml
binding in favour of just using the i2c-controller.yaml binding
directly.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Link: https://lore.kernel.org/r/20201031181801.742585-4-jic23@kernel.org
---
 .../iio/gyroscope/invensense,mpu3050.txt      | 45 ------------
 .../iio/gyroscope/invensense,mpu3050.yaml     | 70 +++++++++++++++++++
 2 files changed, 70 insertions(+), 45 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/gyroscope/invensense,mpu3050.txt b/Documentation/devicetree/bindings/iio/gyroscope/invensense,mpu3050.txt
deleted file mode 100644
index 233fe207aded..000000000000
--- a/Documentation/devicetree/bindings/iio/gyroscope/invensense,mpu3050.txt
+++ /dev/null
@@ -1,45 +0,0 @@
-Invensense MPU-3050 Gyroscope device tree bindings
-
-Required properties:
-  - compatible : should be "invensense,mpu3050"
-  - reg : the I2C address of the sensor
-
-Optional properties:
-  - interrupts : interrupt mapping for the trigger interrupt from the
-    internal oscillator. The following IRQ modes are supported:
-    IRQ_TYPE_EDGE_RISING, IRQ_TYPE_EDGE_FALLING, IRQ_TYPE_LEVEL_HIGH and
-    IRQ_TYPE_LEVEL_LOW. The driver should detect and configure the hardware
-    for the desired interrupt type.
-  - vdd-supply : supply regulator for the main power voltage.
-  - vlogic-supply : supply regulator for the signal voltage.
-  - mount-matrix : see iio/mount-matrix.txt
-
-Optional subnodes:
-  - The MPU-3050 will pass through and forward the I2C signals from the
-    incoming I2C bus, alternatively drive traffic to a slave device (usually
-    an accelerometer) on its own initiative. Therefore is supports a subnode
-    i2c gate node. For details see: i2c/i2c-gate.txt
-
-Example:
-
-mpu3050@68 {
-	compatible = "invensense,mpu3050";
-	reg = <0x68>;
-	interrupt-parent = <&foo>;
-	interrupts = <12 IRQ_TYPE_EDGE_FALLING>;
-	vdd-supply = <&bar>;
-	vlogic-supply = <&baz>;
-
-	/* External I2C interface */
-	i2c-gate {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		fnord@18 {
-			compatible = "fnord";
-			reg = <0x18>;
-			interrupt-parent = <&foo>;
-			interrupts = <13 IRQ_TYPE_EDGE_FALLING>;
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/iio/gyroscope/invensense,mpu3050.yaml b/Documentation/devicetree/bindings/iio/gyroscope/invensense,mpu3050.yaml
new file mode 100644
index 000000000000..7e2accc3d5ce
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/gyroscope/invensense,mpu3050.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/gyroscope/invensense,mpu3050.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Invensense MPU-3050 Gyroscope
+
+maintainers:
+  - Linus Walleij <linus.walleij@linaro.org>
+
+properties:
+  compatible:
+    const: invensense,mpu3050
+
+  reg:
+    maxItems: 1
+
+  vdd-supply: true
+
+  vlogic-supply: true
+
+  interrupts:
+    minItems: 1
+    description:
+      Interrupt mapping for the trigger interrupt from the internal oscillator.
+
+  mount-matrix: true
+
+  i2c-gate:
+    $ref: /schemas/i2c/i2c-controller.yaml
+    unevaluatedProperties: false
+    description: |
+      The MPU-3050 will pass through and forward the I2C signals from the
+      incoming I2C bus, alternatively drive traffic to a slave device (usually
+      an accelerometer) on its own initiative. Therefore is supports an
+      i2c-gate subnode.
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        gyroscope@68 {
+            compatible = "invensense,mpu3050";
+            reg = <0x68>;
+            interrupt-parent = <&foo>;
+            interrupts = <12 IRQ_TYPE_EDGE_FALLING>;
+            vdd-supply = <&bar>;
+            vlogic-supply = <&baz>;
+
+            i2c-gate {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                magnetometer@c {
+                    compatible = "ak,ak8975";
+                    reg = <0x0c>;
+                };
+            };
+        };
+    };
+...
-- 
2.29.2

