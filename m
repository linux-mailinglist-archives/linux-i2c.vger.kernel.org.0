Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9DFF1187CBB
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Mar 2020 10:41:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726704AbgCQJla (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Mar 2020 05:41:30 -0400
Received: from v6.sk ([167.172.42.174]:50944 "EHLO v6.sk"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727332AbgCQJla (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 17 Mar 2020 05:41:30 -0400
Received: from localhost (v6.sk [IPv6:::1])
        by v6.sk (Postfix) with ESMTP id 3F0D861096;
        Tue, 17 Mar 2020 09:41:27 +0000 (UTC)
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
Subject: [PATCH 28/28] dt-bindings: usb: Convert ehci-mv to json-schema
Date:   Tue, 17 Mar 2020 10:39:22 +0100
Message-Id: <20200317093922.20785-29-lkundrak@v3.sk>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200317093922.20785-1-lkundrak@v3.sk>
References: <20200317093922.20785-1-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

A straightforward conversion of the ehci-mv binding to DT schema format
using json-schema.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 .../devicetree/bindings/usb/ehci-mv.txt       | 23 -------
 .../bindings/usb/marvell,pxau2o-ehci.yaml     | 60 +++++++++++++++++++
 2 files changed, 60 insertions(+), 23 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/usb/ehci-mv.txt
 create mode 100644 Documentation/devicetree/bindings/usb/marvell,pxau2o-ehci.yaml

diff --git a/Documentation/devicetree/bindings/usb/ehci-mv.txt b/Documentation/devicetree/bindings/usb/ehci-mv.txt
deleted file mode 100644
index 335589895763e..0000000000000
--- a/Documentation/devicetree/bindings/usb/ehci-mv.txt
+++ /dev/null
@@ -1,23 +0,0 @@
-* Marvell PXA/MMP EHCI controller.
-
-Required properties:
-
-- compatible: must be "marvell,pxau2o-ehci"
-- reg: physical base addresses of the controller and length of memory mapped region
-- interrupts: one EHCI controller interrupt should be described here
-- clocks: phandle list of usb clocks
-- clock-names: should be "USBCLK"
-- phys: phandle for the PHY device
-- phy-names: should be "usb"
-
-Example:
-
-	ehci0: usb-ehci@d4208000 {
-		compatible = "marvell,pxau2o-ehci";
-		reg = <0xd4208000 0x200>;
-		interrupts = <44>;
-		clocks = <&soc_clocks MMP2_CLK_USB>;
-		clock-names = "USBCLK";
-		phys = <&usb_otg_phy>;
-		phy-names = "usb";
-	};
diff --git a/Documentation/devicetree/bindings/usb/marvell,pxau2o-ehci.yaml b/Documentation/devicetree/bindings/usb/marvell,pxau2o-ehci.yaml
new file mode 100644
index 0000000000000..189025ef1e92e
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/marvell,pxau2o-ehci.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
+# Copyright 2019,2020 Lubomir Rintel <lkundrak@v3.sk>
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/marvell,pxau2o-ehci.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Marvell PXA/MMP EHCI bindings
+
+maintainers:
+  - Lubomir Rintel <lkundrak@v3.sk>
+
+allOf:
+  - $ref: usb-hcd.yaml#
+
+properties:
+  compatible:
+    const: marvell,pxau2o-ehci
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
+  clock-names:
+    const: USBCLK
+
+  phys:
+    maxItems: 1
+
+  phy-names:
+    const: usb
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - phys
+  - phy-names
+
+examples:
+  - |
+    #include <dt-bindings/clock/marvell,mmp2.h>
+    usb@d4208000 {
+        compatible = "marvell,pxau2o-ehci";
+        reg = <0xd4208000 0x200>;
+        interrupts = <44>;
+        clocks = <&soc_clocks MMP2_CLK_USB>;
+        clock-names = "USBCLK";
+        phys = <&usb_otg_phy>;
+        phy-names = "usb";
+    };
+
+...
-- 
2.25.1

