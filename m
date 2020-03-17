Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BAD20187CB4
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Mar 2020 10:41:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727319AbgCQJl0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Mar 2020 05:41:26 -0400
Received: from v6.sk ([167.172.42.174]:50908 "EHLO v6.sk"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727278AbgCQJlZ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 17 Mar 2020 05:41:25 -0400
Received: from localhost (v6.sk [IPv6:::1])
        by v6.sk (Postfix) with ESMTP id 42B8B61094;
        Tue, 17 Mar 2020 09:41:23 +0000 (UTC)
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
Subject: [PATCH 27/28] dt-bindings: timer: Convert mrvl,mmp-timer to json-schema
Date:   Tue, 17 Mar 2020 10:39:21 +0100
Message-Id: <20200317093922.20785-28-lkundrak@v3.sk>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200317093922.20785-1-lkundrak@v3.sk>
References: <20200317093922.20785-1-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

A straightforward conversion of the mrvl,mmp-timer binding to DT schema
format using json-schema.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 .../bindings/timer/mrvl,mmp-timer.txt         | 17 --------
 .../bindings/timer/mrvl,mmp-timer.yaml        | 43 +++++++++++++++++++
 2 files changed, 43 insertions(+), 17 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/timer/mrvl,mmp-timer.txt
 create mode 100644 Documentation/devicetree/bindings/timer/mrvl,mmp-timer.yaml

diff --git a/Documentation/devicetree/bindings/timer/mrvl,mmp-timer.txt b/Documentation/devicetree/bindings/timer/mrvl,mmp-timer.txt
deleted file mode 100644
index b8f02c6635219..0000000000000
--- a/Documentation/devicetree/bindings/timer/mrvl,mmp-timer.txt
+++ /dev/null
@@ -1,17 +0,0 @@
-* Marvell MMP Timer controller
-
-Required properties:
-- compatible : Should be "mrvl,mmp-timer".
-- reg : Address and length of the register set of timer controller.
-- interrupts : Should be the interrupt number.
-
-Optional properties:
-- clocks : Should contain a single entry describing the clock input.
-
-Example:
-	timer0: timer@d4014000 {
-		compatible = "mrvl,mmp-timer";
-		reg = <0xd4014000 0x100>;
-		interrupts = <13>;
-		clocks = <&coreclk 2>;
-	};
diff --git a/Documentation/devicetree/bindings/timer/mrvl,mmp-timer.yaml b/Documentation/devicetree/bindings/timer/mrvl,mmp-timer.yaml
new file mode 100644
index 0000000000000..ebee0b862d493
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/mrvl,mmp-timer.yaml
@@ -0,0 +1,43 @@
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/timer/mrvl,mmp-timer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Marvell MMP Timer bindings
+
+maintainers:
+  - devicetree@vger.kernel.org
+
+properties:
+  $nodename:
+    pattern: '^timer@[a-f0-9]+$'
+
+  compatible:
+    const: mrvl,mmp-timer
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    timer@d4014000 {
+        compatible = "mrvl,mmp-timer";
+        reg = <0xd4014000 0x100>;
+        interrupts = <13>;
+        clocks = <&coreclk 2>;
+    };
+
+...
-- 
2.25.1

