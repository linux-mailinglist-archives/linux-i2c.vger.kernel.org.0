Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6846D2180C4
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Jul 2020 09:20:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730278AbgGHHUB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Jul 2020 03:20:01 -0400
Received: from smtp2207-205.mail.aliyun.com ([121.197.207.205]:48860 "EHLO
        smtp2207-205.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730244AbgGHHUA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Jul 2020 03:20:00 -0400
X-Alimail-AntiSpam: AC=SUSPECT;BC=0.6548809|-1;BR=01201311R181b1;CH=blue;DM=|SUSPECT|false|;DS=CONTINUE|ham_system_inform|0.0515633-0.00127515-0.947162;FP=0|0|0|0|0|-1|-1|-1;HT=e01l07381;MF=frank@allwinnertech.com;NM=1;PH=DS;RN=33;RT=33;SR=0;TI=SMTPD_---.I-8lwqE_1594192774;
Received: from allwinnertech.com(mailfrom:frank@allwinnertech.com fp:SMTPD_---.I-8lwqE_1594192774)
          by smtp.aliyun-inc.com(10.147.40.26);
          Wed, 08 Jul 2020 15:19:51 +0800
From:   Frank Lee <frank@allwinnertech.com>
To:     robh+dt@kernel.org, mripard@kernel.org, wens@csie.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        gregory.clement@bootlin.com, tglx@linutronix.de,
        jason@lakedaemon.net, maz@kernel.org,
        srinivas.kandagatla@linaro.org, linus.walleij@linaro.org,
        anarsoul@gmail.com, tiny.windzz@gmail.com, rui.zhang@intel.com,
        daniel.lezcano@linaro.org, amit.kucheria@verdurent.com,
        lee.jones@linaro.org, p.zabel@pengutronix.de, clabbe@baylibre.com,
        icenowy@aosc.io, megous@megous.com, stefan@olimex.com,
        bage@linutronix.de
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-pm@vger.kernel.org, huangshuosheng@allwinnertech.com,
        liyong@allwinnertech.com, Frank Lee <frank@allwinnertech.com>
Subject: [PATCH v3 03/16] dt-bindings: pinctrl: sunxi: Add A100 pinctrl bindings
Date:   Wed,  8 Jul 2020 15:19:29 +0800
Message-Id: <20200708071942.22595-4-frank@allwinnertech.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200708071942.22595-1-frank@allwinnertech.com>
References: <20200708071942.22595-1-frank@allwinnertech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add device tree binding Documentation details for A100 pinctrl driver,
whic has an r pin controller and a pin controller with more irq lines.

Signed-off-by: Frank Lee <frank@allwinnertech.com>
---
 .../pinctrl/allwinner,sun4i-a10-pinctrl.yaml       | 74 +++++++++++++---------
 1 file changed, 44 insertions(+), 30 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
index bfefd09..226aba0 100644
--- a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
@@ -48,6 +48,8 @@ properties:
       - allwinner,sun9i-a80-r-pinctrl
       - allwinner,sun50i-a64-pinctrl
       - allwinner,sun50i-a64-r-pinctrl
+      - allwinner,sun50i-a100-pinctrl
+      - allwinner,sun50i-a100-r-pinctrl
       - allwinner,sun50i-h5-pinctrl
       - allwinner,sun50i-h6-pinctrl
       - allwinner,sun50i-h6-r-pinctrl
@@ -59,7 +61,7 @@ properties:
 
   interrupts:
     minItems: 1
-    maxItems: 5
+    maxItems: 7
     description:
       One interrupt per external interrupt bank supported on the
       controller, sorted by bank number ascending order.
@@ -144,75 +146,87 @@ allOf:
   # FIXME: We should have the pin bank supplies here, but not a lot of
   # boards are defining it at the moment so it would generate a lot of
   # warnings.
-
   - if:
       properties:
         compatible:
           enum:
-            - allwinner,sun9i-a80-pinctrl
+            - allwinner,sun50i-a100-pinctrl
 
     then:
       properties:
         interrupts:
-          minItems: 5
-          maxItems: 5
+          minItems: 7
+          maxItems: 7
 
     else:
       if:
         properties:
           compatible:
             enum:
-              - allwinner,sun6i-a31-pinctrl
-              - allwinner,sun6i-a31s-pinctrl
-              - allwinner,sun50i-h6-pinctrl
+              - allwinner,sun9i-a80-pinctrl
 
       then:
         properties:
           interrupts:
-            minItems: 4
-            maxItems: 4
+            minItems: 5
+            maxItems: 5
 
       else:
         if:
           properties:
             compatible:
               enum:
-                - allwinner,sun8i-a23-pinctrl
-                - allwinner,sun8i-a83t-pinctrl
-                - allwinner,sun50i-a64-pinctrl
-                - allwinner,sun50i-h5-pinctrl
-                - allwinner,suniv-f1c100s-pinctrl
+                - allwinner,sun6i-a31-pinctrl
+                - allwinner,sun6i-a31s-pinctrl
+                - allwinner,sun50i-h6-pinctrl
 
         then:
           properties:
             interrupts:
-              minItems: 3
-              maxItems: 3
+              minItems: 4
+              maxItems: 4
 
         else:
           if:
             properties:
               compatible:
                 enum:
-                  - allwinner,sun6i-a31-r-pinctrl
-                  - allwinner,sun8i-a33-pinctrl
-                  - allwinner,sun8i-h3-pinctrl
-                  - allwinner,sun8i-v3-pinctrl
-                  - allwinner,sun8i-v3s-pinctrl
-                  - allwinner,sun9i-a80-r-pinctrl
-                  - allwinner,sun50i-h6-r-pinctrl
+                  - allwinner,sun8i-a23-pinctrl
+                  - allwinner,sun8i-a83t-pinctrl
+                  - allwinner,sun50i-a64-pinctrl
+                  - allwinner,sun50i-h5-pinctrl
+                  - allwinner,suniv-f1c100s-pinctrl
 
           then:
             properties:
               interrupts:
-                minItems: 2
-                maxItems: 2
+                minItems: 3
+                maxItems: 3
 
           else:
-            properties:
-              interrupts:
-                minItems: 1
-                maxItems: 1
+            if:
+              properties:
+                compatible:
+                  enum:
+                    - allwinner,sun6i-a31-r-pinctrl
+                    - allwinner,sun8i-a33-pinctrl
+                    - allwinner,sun8i-h3-pinctrl
+                    - allwinner,sun8i-v3-pinctrl
+                    - allwinner,sun8i-v3s-pinctrl
+                    - allwinner,sun9i-a80-r-pinctrl
+                    - allwinner,sun50i-h6-r-pinctrl
+
+            then:
+              properties:
+                interrupts:
+                  minItems: 2
+                  maxItems: 2
+
+            else:
+              properties:
+                interrupts:
+                  minItems: 1
+                  maxItems: 1
 
 additionalProperties: false
 
-- 
1.9.1

