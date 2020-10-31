Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 021C92A1972
	for <lists+linux-i2c@lfdr.de>; Sat, 31 Oct 2020 19:20:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728234AbgJaSUT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 31 Oct 2020 14:20:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:47448 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727967AbgJaSUT (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 31 Oct 2020 14:20:19 -0400
Received: from localhost.localdomain (cpc149474-cmbg20-2-0-cust94.5-4.cable.virginm.net [82.4.196.95])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DBAAF206F9;
        Sat, 31 Oct 2020 18:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604168418;
        bh=tskoch4DLlTeJ2sYv4chlZZnXQWrFh+JhKivYGYdftQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=o8TzeA3J0YA7LuH4SJ+rpZyvgCGcGk6H+Gz1+QTBs31Ox0Muqfq3E9Y8k2ebiY+NY
         gWpQKLHvMxyD1aI6uJKsz+iYWzTn5cjOzI3Q+aaxTrSsDl0puuRGtDnYG6976pGbfu
         EdZ9rnskK+4G8fH52Z/5qai/AEqUQzKUTxNcrj8E=
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-iio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 3/3] dt-bindings:iio:gyro:invensense,mpu3050: txt to yaml format conversion.
Date:   Sat, 31 Oct 2020 18:18:01 +0000
Message-Id: <20201031181801.742585-4-jic23@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201031181801.742585-1-jic23@kernel.org>
References: <20201031181801.742585-1-jic23@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Very similar to the mpu6050 binding.
Only unusual element is the i2c-gate section.
Example tweaked a little to include a real device behind the gate.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
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
index 000000000000..b0a476afb656
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
+    $ref: "../../i2c/i2c-gate.yaml"
+    unevaluatedProperties: false
+    description: |
+      The MPU-3050 will pass through and forward the I2C signals from the
+      incoming I2C bus, alternatively drive traffic to a slave device (usually
+      an accelerometer) on its own initiative. Therefore is supports a subnode
+      i2c gate node.
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
2.28.0

