Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8215B2C7272
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Nov 2020 23:09:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730883AbgK1VuI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 28 Nov 2020 16:50:08 -0500
Received: from mail.kernel.org ([198.145.29.99]:45768 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733189AbgK1SL4 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 28 Nov 2020 13:11:56 -0500
Received: from localhost.localdomain (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net [81.101.6.87])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E83BD246D4;
        Sat, 28 Nov 2020 17:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606584949;
        bh=QhRj1M5XcWGqykhdQbuDQTyYKfBpV6BiehQdm55EpYY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NgXLvdP9hQsAygC60erbFKdh3q1fLabcxnyrUZiExsMm+yU2KKMN+B3u7qx9NuEV0
         4gA9xVq1jeD50SDUHAss2LZnHSgrixivxeZLe0PEtsXqP6onMgN3An4xg0c2gp7uIs
         4P15f1ZTk3NpzrvD7GeM53eB+SVO06uhoyuRgB3U=
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Wolfram Sang <wsa@the-dreams.de>
Subject: [PATCH v2 1/3] dt-bindings:i2c:i2c-gate: txt to yaml conversion
Date:   Sat, 28 Nov 2020 17:33:41 +0000
Message-Id: <20201128173343.390165-2-jic23@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201128173343.390165-1-jic23@kernel.org>
References: <20201128173343.390165-1-jic23@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Jonathan Cameron <Jonathan.Cameron@huawei.com>

This file provides very little in the way of actual schema but
does provide a convenient intro to what an i2c-gate node actually
represents.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Peter Rosin <peda@axentia.se>
Cc: Wolfram Sang <wsa@the-dreams.de>
Link: https://lore.kernel.org/r/20201031181801.742585-2-jic23@kernel.org
---
 .../devicetree/bindings/i2c/i2c-gate.txt      | 41 -------------------
 .../devicetree/bindings/i2c/i2c-gate.yaml     | 39 ++++++++++++++++++
 2 files changed, 39 insertions(+), 41 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-gate.txt b/Documentation/devicetree/bindings/i2c/i2c-gate.txt
deleted file mode 100644
index 1846d236e656..000000000000
--- a/Documentation/devicetree/bindings/i2c/i2c-gate.txt
+++ /dev/null
@@ -1,41 +0,0 @@
-An i2c gate is useful to e.g. reduce the digital noise for RF tuners connected
-to the i2c bus. Gates are similar to arbitrators in that you need to perform
-some kind of operation to access the i2c bus past the arbitrator/gate, but
-there are no competing masters to consider for gates and therefore there is
-no arbitration happening for gates.
-
-Common i2c gate properties.
-
-- i2c-gate child node
-
-Required properties for the i2c-gate child node:
-- #address-cells = <1>;
-- #size-cells = <0>;
-
-Optional properties for i2c-gate child node:
-- Child nodes conforming to i2c bus binding
-
-
-Example :
-
-	/*
-	   An Invensense mpu9150 at address 0x68 featuring an on-chip Asahi
-	   Kasei ak8975 compass behind a gate.
-	 */
-
-	mpu9150@68 {
-		compatible = "invensense,mpu9150";
-		reg = <0x68>;
-		interrupt-parent = <&gpio1>;
-		interrupts = <18 1>;
-
-		i2c-gate {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			ax8975@c {
-				compatible = "ak,ak8975";
-				reg = <0x0c>;
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/i2c/i2c-gate.yaml b/Documentation/devicetree/bindings/i2c/i2c-gate.yaml
new file mode 100644
index 000000000000..66472f12a7e2
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/i2c-gate.yaml
@@ -0,0 +1,39 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/i2c-gate.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Common i2c gate properties
+
+maintainers:
+  - Peter Rosin <peda@axentia.se>
+
+description: |
+  An i2c gate is useful to e.g. reduce the digital noise for RF tuners connected
+  to the i2c bus. Gates are similar to arbitrators in that you need to perform
+  some kind of operation to access the i2c bus past the arbitrator/gate, but
+  there are no competing masters to consider for gates and therefore there is
+  no arbitration happening for gates.
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml
+
+properties:
+  $nodename:
+    const: i2c-gate
+
+additionalProperties: true
+
+examples:
+  - |
+    i2c-gate {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        ak8975@c {
+            compatible = "ak,ak8975";
+            reg = <0x0c>;
+        };
+    };
+...
+
-- 
2.29.2

