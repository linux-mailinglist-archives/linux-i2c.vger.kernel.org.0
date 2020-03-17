Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71905187CCF
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Mar 2020 10:41:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727241AbgCQJlS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Mar 2020 05:41:18 -0400
Received: from v6.sk ([167.172.42.174]:50830 "EHLO v6.sk"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727229AbgCQJlR (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 17 Mar 2020 05:41:17 -0400
Received: from localhost (v6.sk [IPv6:::1])
        by v6.sk (Postfix) with ESMTP id 129226109D;
        Tue, 17 Mar 2020 09:41:15 +0000 (UTC)
From:   Lubomir Rintel <lkundrak@v3.sk>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Brown <broonie@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-media@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-usb@vger.kernel.org,
        Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH 25/28] dt-bindings: rtc: Convert sa1100-rtc to json-schema
Date:   Tue, 17 Mar 2020 10:39:19 +0100
Message-Id: <20200317093922.20785-26-lkundrak@v3.sk>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200317093922.20785-1-lkundrak@v3.sk>
References: <20200317093922.20785-1-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Convert the sa1100-rtc binding to DT schema format using json-schema.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 .../devicetree/bindings/rtc/sa1100-rtc.txt    | 17 ------
 .../devicetree/bindings/rtc/sa1100-rtc.yaml   | 55 +++++++++++++++++++
 2 files changed, 55 insertions(+), 17 deletions(-)
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
index 0000000000000..53a8b72df9f34
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/sa1100-rtc.yaml
@@ -0,0 +1,55 @@
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
+  - devicetree@vger.kernel.org
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
+    maxItems: 2
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
2.25.1

