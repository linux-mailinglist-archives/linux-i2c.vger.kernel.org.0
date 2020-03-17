Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D809A187D0A
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Mar 2020 10:42:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726921AbgCQJkd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Mar 2020 05:40:33 -0400
Received: from v6.sk ([167.172.42.174]:50412 "EHLO v6.sk"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726905AbgCQJkc (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 17 Mar 2020 05:40:32 -0400
Received: from localhost (v6.sk [IPv6:::1])
        by v6.sk (Postfix) with ESMTP id F2DE56108E;
        Tue, 17 Mar 2020 09:40:28 +0000 (UTC)
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
Subject: [PATCH 14/28] dt-bindings: arm: l2x0: Tauros 3 is PL310 compatible
Date:   Tue, 17 Mar 2020 10:39:08 +0100
Message-Id: <20200317093922.20785-15-lkundrak@v3.sk>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200317093922.20785-1-lkundrak@v3.sk>
References: <20200317093922.20785-1-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The validation is unhappy about mmp3-dell-ariel declaring its
marvell,tauros3-cache node to be compatible with arm,pl310-cache:

  mmp3-dell-ariel.dt.yaml: cache-controller@d0020000: compatible:
       Additional items are not allowed ('arm,pl310-cache' was unexpected)
  mmp3-dell-ariel.dt.yaml: cache-controller@d0020000: compatible:
       ['marvell,tauros3-cache', 'arm,pl310-cache'] is too long

Let's allow this -- Tauros 3 is designed to be compatible with PL310.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 .../devicetree/bindings/arm/l2c2x0.yaml       | 45 ++++++++++---------
 1 file changed, 24 insertions(+), 21 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/l2c2x0.yaml b/Documentation/devicetree/bindings/arm/l2c2x0.yaml
index 913a8cd8b2c00..7e39088a9bed2 100644
--- a/Documentation/devicetree/bindings/arm/l2c2x0.yaml
+++ b/Documentation/devicetree/bindings/arm/l2c2x0.yaml
@@ -29,27 +29,30 @@ allOf:
 
 properties:
   compatible:
-    enum:
-      - arm,pl310-cache
-      - arm,l220-cache
-      - arm,l210-cache
-        # DEPRECATED by "brcm,bcm11351-a2-pl310-cache"
-      - bcm,bcm11351-a2-pl310-cache
-        # For Broadcom bcm11351 chipset where an
-        # offset needs to be added to the address before passing down to the L2
-        # cache controller
-      - brcm,bcm11351-a2-pl310-cache
-        # Marvell Controller designed to be
-        # compatible with the ARM one, with system cache mode (meaning
-        # maintenance operations on L1 are broadcasted to the L2 and L2
-        # performs the same operation).
-      - marvell,aurora-system-cache
-        # Marvell Controller designed to be
-        # compatible with the ARM one with outer cache mode.
-      - marvell,aurora-outer-cache
-        # Marvell Tauros3 cache controller, compatible
-        # with arm,pl310-cache controller.
-      - marvell,tauros3-cache
+    oneOf:
+      - enum:
+        - arm,pl310-cache
+        - arm,l220-cache
+        - arm,l210-cache
+          # DEPRECATED by "brcm,bcm11351-a2-pl310-cache"
+        - bcm,bcm11351-a2-pl310-cache
+          # For Broadcom bcm11351 chipset where an
+          # offset needs to be added to the address before passing down to the L2
+          # cache controller
+        - brcm,bcm11351-a2-pl310-cache
+          # Marvell Controller designed to be
+          # compatible with the ARM one, with system cache mode (meaning
+          # maintenance operations on L1 are broadcasted to the L2 and L2
+          # performs the same operation).
+        - marvell,aurora-system-cache
+          # Marvell Controller designed to be
+          # compatible with the ARM one with outer cache mode.
+        - marvell,aurora-outer-cache
+      - items:
+         # Marvell Tauros3 cache controller, compatible
+         # with arm,pl310-cache controller.
+        - const: marvell,tauros3-cache
+        - const: arm,pl310-cache
 
   cache-level:
     const: 2
-- 
2.25.1

