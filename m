Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3B821FC1AE
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Jun 2020 00:35:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726599AbgFPWej (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 Jun 2020 18:34:39 -0400
Received: from v6.sk ([167.172.42.174]:48642 "EHLO v6.sk"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726557AbgFPWei (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 16 Jun 2020 18:34:38 -0400
Received: from localhost (v6.sk [IPv6:::1])
        by v6.sk (Postfix) with ESMTP id 1E58561638;
        Tue, 16 Jun 2020 22:34:06 +0000 (UTC)
From:   Lubomir Rintel <lkundrak@v3.sk>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH v3 4/5] dt-bindings: rtc: Convert sa1100-rtc to json-schema
Date:   Wed, 17 Jun 2020 00:33:52 +0200
Message-Id: <20200616223353.993567-5-lkundrak@v3.sk>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200616223353.993567-1-lkundrak@v3.sk>
References: <20200616223353.993567-1-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Convert the sa1100-rtc binding to DT schema format using json-schema.
While add that, add clocks and resets that are actually used.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>

---
Changes since v1:
- Remove interrupts/maxItems
- Mention clocks and resets in the patch description
- Add default GPL-2.0-only license tag
- Fill in maintainers from MAINTAINERS file

 .../devicetree/bindings/rtc/sa1100-rtc.txt    | 17 ------
 .../devicetree/bindings/rtc/sa1100-rtc.yaml   | 57 +++++++++++++++++++
 2 files changed, 57 insertions(+), 17 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/rtc/sa1100-rtc.txt
 create mode 100644 Documentation/devicetree/bindings/rtc/sa1100-rtc.yaml

diff --git a/Documentation/devicetree/bindings/rtc/sa1100-rtc.txt b/Documentation/devicetree/bindings/rtc/sa1100-rtc.txt
deleted file mode 100644
index 968ac820254bb..0000000000000
--- a/Documentation/devicetree/bindings/rtc/sa1100-rtc.txt
+++ /dev/null
@@ -1,17 +0,0 @@
-* Marvell Real Time Clock controller
-
-Required properties:
-- compatible: should be "mrvl,sa1100-rtc"
-- reg: physical base address of the controller and length of memory mapped
-  region.
-- interrupts: Should be two. The first interrupt number is the rtc alarm
-  interrupt and the second interrupt number is the rtc hz interrupt.
-- interrupt-names: Assign name of irq resource.
-
-Example:
-	rtc: rtc@d4010000 {
-		compatible = "mrvl,mmp-rtc";
-		reg = <0xd4010000 0x1000>;
-		interrupts = <5>, <6>;
-		interrupt-names = "rtc 1Hz", "rtc alarm";
-	};
diff --git a/Documentation/devicetree/bindings/rtc/sa1100-rtc.yaml b/Documentation/devicetree/bindings/rtc/sa1100-rtc.yaml
new file mode 100644
index 0000000000000..482e5af215b3d
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/sa1100-rtc.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/sa1100-rtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Marvell Real Time Clock controller bindings
+
+allOf:
+  - $ref: rtc.yaml#
+
+maintainers:
+  - Alessandro Zummo <a.zummo@towertech.it>
+  - Alexandre Belloni <alexandre.belloni@bootlin.com>
+  - Rob Herring <robh+dt@kernel.org>
+
+properties:
+  compatible:
+    enum:
+      - mrvl,sa1100-rtc
+      - mrvl,mmp-rtc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  interrupts:
+    minItems: 2
+
+  interrupt-names:
+    items:
+      - const: 'rtc 1Hz'
+      - const: 'rtc alarm'
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+
+additionalProperties: false
+
+examples:
+  - |
+    rtc: rtc@d4010000 {
+        compatible = "mrvl,mmp-rtc";
+        reg = <0xd4010000 0x1000>;
+        interrupts = <5>, <6>;
+        interrupt-names = "rtc 1Hz", "rtc alarm";
+    };
+
+...
-- 
2.26.2

