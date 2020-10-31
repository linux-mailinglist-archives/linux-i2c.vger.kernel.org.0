Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B28292A196F
	for <lists+linux-i2c@lfdr.de>; Sat, 31 Oct 2020 19:20:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728224AbgJaSUR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 31 Oct 2020 14:20:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:47402 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727967AbgJaSUR (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 31 Oct 2020 14:20:17 -0400
Received: from localhost.localdomain (cpc149474-cmbg20-2-0-cust94.5-4.cable.virginm.net [82.4.196.95])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B119B20709;
        Sat, 31 Oct 2020 18:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604168416;
        bh=gfl1n+x4WbQDsrGohgRC0WCtr5ijNKHsIMlJA0UxVe4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Brepfq6Uj7dYMC7nt5hp2NcJ2NywXysRiXpLMqS6SWXied/SlgCtS6UEmLARQAuru
         FT3LaD6LSjyr0SFthw/CWKqF0cl+jpCyrddfGuFc4BGa2hXEXZrRHvGwUL2hjYF0YF
         dyoIlNMU2JCWVXLYkKMZqtBTA0ck/skcFcI078X8=
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-iio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Jean-Baptiste Maneyrol <jmaneyrol@invensense.com>,
        Wolfram Sang <wsa@the-dreams.de>, Peter Rosin <peda@axentia.se>
Subject: [PATCH 2/3] dt-bindings:iio:imu:invensense,mpu6050: txt to yaml conversion
Date:   Sat, 31 Oct 2020 18:18:00 +0000
Message-Id: <20201031181801.742585-3-jic23@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201031181801.742585-1-jic23@kernel.org>
References: <20201031181801.742585-1-jic23@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Relies on the patch to convert i2c-gate over to yaml.

2 prior examples combinded into one as a single example can show
all of the binding elements as long as the right part is selected.

I don't know if there is a simple way to exclude i2c-gate if the
master interface is SPI.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Jean-Baptiste Maneyrol <jmaneyrol@invensense.com>
Cc: Wolfram Sang <wsa@the-dreams.de>
Cc: Peter Rosin <peda@axentia.se>
---
 .../bindings/iio/imu/inv_mpu6050.txt          |  67 -----------
 .../bindings/iio/imu/invensense,mpu6050.yaml  | 105 ++++++++++++++++++
 2 files changed, 105 insertions(+), 67 deletions(-)

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
index 000000000000..f640d161773c
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/imu/invensense,mpu6050.yaml
@@ -0,0 +1,105 @@
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
+    $ref: "../../i2c/i2c-gate.yaml"
+    unevaluatedProperties: false
+    description: |
+      These devices also support an auxiliary i2c bus.  This is
+      simple enough to be described using the i2c-gate binding.
+      Only possible if using an I2C interface to the host.
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
2.28.0

