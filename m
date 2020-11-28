Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BD4A2C7286
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Nov 2020 23:09:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733189AbgK1VuJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 28 Nov 2020 16:50:09 -0500
Received: from mail.kernel.org ([198.145.29.99]:45758 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733178AbgK1SL4 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 28 Nov 2020 13:11:56 -0500
Received: from localhost.localdomain (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net [81.101.6.87])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D090C246DC;
        Sat, 28 Nov 2020 17:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606584951;
        bh=9BQlSLMXU7WdE/+S3iVfiYVyMzHTfy7TaP9dxoF6nXA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fRbd+QL5mVVzD0mfqm5tQa6u3F4IhPx1HnjVILbZzWMHVD/9cNQc3BXzG2zEpeeRd
         eGCGO5rhUh9oI3xjVmAE1bcrgOScWYzq0/U8RI52FeK9odPQOoMMtKm27+wwuq4Anh
         A3OZKBlauFexuvI3hXdZrabpbUzMxyqpwurHEilY=
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Rob Herring <robh@kernel.org>,
        Jean-Baptiste Maneyrol <jmaneyrol@invensense.com>,
        Wolfram Sang <wsa@the-dreams.de>
Subject: [PATCH v2 2/3] dt-bindings:iio:imu:invensense,mpu6050: txt to yaml conversion
Date:   Sat, 28 Nov 2020 17:33:42 +0000
Message-Id: <20201128173343.390165-3-jic23@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201128173343.390165-1-jic23@kernel.org>
References: <20201128173343.390165-1-jic23@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Jonathan Cameron <Jonathan.Cameron@huawei.com>

As Rob Herring suggested, this no long requires the explicit
i2c-gate binding, but instead just used i2c-controller.yaml
directly.

2 prior examples combinded into one as a single example can show
all of the binding elements as long as the right part is selected.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Cc: Jean-Baptiste Maneyrol <jmaneyrol@invensense.com>
Cc: Wolfram Sang <wsa@the-dreams.de>
Cc: Peter Rosin <peda@axentia.se>
Link: https://lore.kernel.org/r/20201031181801.742585-3-jic23@kernel.org
---
 .../bindings/iio/imu/inv_mpu6050.txt          |  67 ------------
 .../bindings/iio/imu/invensense,mpu6050.yaml  | 103 ++++++++++++++++++
 2 files changed, 103 insertions(+), 67 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/imu/inv_mpu6050.txt b/Documentation/devicetree/bindings/iio/imu/inv_mpu6050.txt
deleted file mode 100644
index f2f64749e818..000000000000
--- a/Documentation/devicetree/bindings/iio/imu/inv_mpu6050.txt
+++ /dev/null
@@ -1,67 +0,0 @@
-InvenSense MPU-6050 Six-Axis (Gyro + Accelerometer) MEMS MotionTracking Device
-
-http://www.invensense.com/mems/gyro/mpu6050.html
-
-Required properties:
- - compatible : should be one of
-		"invensense,mpu6000"
-		"invensense,mpu6050"
- 		"invensense,mpu6500"
-		"invensense,mpu6515"
-		"invensense,mpu9150"
-		"invensense,mpu9250"
-		"invensense,mpu9255"
-		"invensense,icm20608"
-		"invensense,icm20609"
-		"invensense,icm20689"
-		"invensense,icm20602"
-		"invensense,icm20690"
-		"invensense,iam20680"
- - reg : the I2C address of the sensor
- - interrupts: interrupt mapping for IRQ. It should be configured with flags
-   IRQ_TYPE_LEVEL_HIGH, IRQ_TYPE_EDGE_RISING, IRQ_TYPE_LEVEL_LOW or
-   IRQ_TYPE_EDGE_FALLING.
-
-  Refer to interrupt-controller/interrupts.txt for generic interrupt client node
-  bindings.
-
-Optional properties:
- - vdd-supply: regulator phandle for VDD supply
- - vddio-supply: regulator phandle for VDDIO supply
- - mount-matrix: an optional 3x3 mounting rotation matrix
- - i2c-gate node.  These devices also support an auxiliary i2c bus.  This is
-   simple enough to be described using the i2c-gate binding. See
-   i2c/i2c-gate.txt for more details.
-
-Example:
-	mpu6050@68 {
-		compatible = "invensense,mpu6050";
-		reg = <0x68>;
-		interrupt-parent = <&gpio1>;
-		interrupts = <18 IRQ_TYPE_EDGE_RISING>;
-		mount-matrix = "-0.984807753012208",  /* x0 */
-		               "0",                   /* y0 */
-		               "-0.173648177666930",  /* z0 */
-		               "0",                   /* x1 */
-		               "-1",                  /* y1 */
-		               "0",                   /* z1 */
-		               "-0.173648177666930",  /* x2 */
-		               "0",                   /* y2 */
-		               "0.984807753012208";   /* z2 */
-	};
-
-
-	mpu9250@68 {
-		compatible = "invensense,mpu9250";
-		reg = <0x68>;
-		interrupt-parent = <&gpio3>;
-		interrupts = <21 IRQ_TYPE_LEVEL_HIGH>;
-		i2c-gate {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			ax8975@c {
-				compatible = "ak,ak8975";
-				reg = <0x0c>;
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/iio/imu/invensense,mpu6050.yaml b/Documentation/devicetree/bindings/iio/imu/invensense,mpu6050.yaml
new file mode 100644
index 000000000000..9268b6ca2afe
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/imu/invensense,mpu6050.yaml
@@ -0,0 +1,103 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/imu/invensense,mpu6050.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: InvenSense MPU-6050 Six-Axis (Gyro + Accelerometer) MEMS MotionTracking Device
+
+maintainers:
+  - Jean-Baptiste Maneyrol <jmaneyrol@invensense.com>
+
+description: |
+  These devices support both I2C and SPI bus interfaces.
+
+properties:
+  compatible:
+    enum:
+      - invensense,iam20680
+      - invensense,icm20608
+      - invensense,icm20609
+      - invensense,icm20689
+      - invensense,icm20602
+      - invensense,icm20690
+      - invensense,mpu6000
+      - invensense,mpu6050
+      - invensense,mpu6500
+      - invensense,mpu6515
+      - invensense,mpu9150
+      - invensense,mpu9250
+      - invensense,mpu9255
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  spi-max-frequency: true
+
+  vdd-supply: true
+  vddio-supply: true
+
+  mount-matrix: true
+
+  i2c-gate:
+    $ref: /schemas/i2c/i2c-controller.yaml
+    unevaluatedProperties: false
+    description: |
+      These devices also support an auxiliary i2c bus via an i2c-gate.
+
+allOf:
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - invensense,mpu9150
+                - invensense,mpu9250
+                - invensense,mpu9255
+    then:
+      properties:
+        i2c-gate: false
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        imu@68 {
+            compatible = "invensense,mpu9250";
+            reg = <0x68>;
+            interrupt-parent = <&gpio3>;
+            interrupts = <21 IRQ_TYPE_LEVEL_HIGH>;
+            mount-matrix = "-0.984807753012208",  /* x0 */
+                           "0",                   /* y0 */
+                           "-0.173648177666930",  /* z0 */
+                           "0",                   /* x1 */
+                           "-1",                  /* y1 */
+                           "0",                   /* z1 */
+                           "-0.173648177666930",  /* x2 */
+                           "0",                   /* y2 */
+                           "0.984807753012208";   /* z2 */
+            i2c-gate {
+                #address-cells = <1>;
+                #size-cells = <0>;
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

