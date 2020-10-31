Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A425F2A196C
	for <lists+linux-i2c@lfdr.de>; Sat, 31 Oct 2020 19:20:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728216AbgJaSUP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 31 Oct 2020 14:20:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:47344 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727967AbgJaSUP (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 31 Oct 2020 14:20:15 -0400
Received: from localhost.localdomain (cpc149474-cmbg20-2-0-cust94.5-4.cable.virginm.net [82.4.196.95])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B5A1E206E3;
        Sat, 31 Oct 2020 18:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604168414;
        bh=jbJQIsNnmVBL/hC0vfUaWlEmHz/8T8FVXPn5z06RA3w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=J7IOWt6PAHkN+iznkuGVNVy5FV0MNErDNX0ktTn4O02fu4z/TRS3v3lhw6qySRroU
         gYcNbTJjRvsfNpQn25qsWg7WpghII4fwK6F13q2njXCSYq57yt3KPttxRHyvbBczWR
         urKn5Ii3Km+k90wT/NFqnYNG1WGyHjNUX2kmfy7k=
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-iio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Peter Rosin <peda@axentia.se>, Wolfram Sang <wsa@the-dreams.de>
Subject: [PATCH 1/3] dt-bindings:i2c:i2c-gate: txt to yaml conversion
Date:   Sat, 31 Oct 2020 18:17:59 +0000
Message-Id: <20201031181801.742585-2-jic23@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201031181801.742585-1-jic23@kernel.org>
References: <20201031181801.742585-1-jic23@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Needed to reference from the invensense,mpu6050 yaml binding.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Peter Rosin <peda@axentia.se>
Cc: Wolfram Sang <wsa@the-dreams.de>
---
 .../devicetree/bindings/i2c/i2c-gate.txt      | 41 ---------------
 .../devicetree/bindings/i2c/i2c-gate.yaml     | 52 +++++++++++++++++++
 2 files changed, 52 insertions(+), 41 deletions(-)

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
index 000000000000..29aa0690ed9a
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/i2c-gate.yaml
@@ -0,0 +1,52 @@
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
+properties:
+  $nodename:
+    const: i2c-gate
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^[a-zA-Z][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+$":
+    type: object
+    description: |
+      Child nodes for i2c devices behind the gate.
+
+required:
+  - "#address-cells"
+  - "#size-cells"
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
2.28.0

