Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA07F2180EB
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Jul 2020 09:20:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730314AbgGHHUK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Jul 2020 03:20:10 -0400
Received: from smtp2207-205.mail.aliyun.com ([121.197.207.205]:47088 "EHLO
        smtp2207-205.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730244AbgGHHUK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Jul 2020 03:20:10 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.5077057|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.00542553-0.000588226-0.993986;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03307;MF=frank@allwinnertech.com;NM=1;PH=DS;RN=33;RT=33;SR=0;TI=SMTPD_---.I-8lwqE_1594192774;
Received: from allwinnertech.com(mailfrom:frank@allwinnertech.com fp:SMTPD_---.I-8lwqE_1594192774)
          by smtp.aliyun-inc.com(10.147.40.26);
          Wed, 08 Jul 2020 15:20:02 +0800
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
Subject: [PATCH v3 07/16] dt-bindings: thermal: sun8i: Add binding for A100's THS controller
Date:   Wed,  8 Jul 2020 15:19:33 +0800
Message-Id: <20200708071942.22595-8-frank@allwinnertech.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200708071942.22595-1-frank@allwinnertech.com>
References: <20200708071942.22595-1-frank@allwinnertech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add a binding for A100's ths controller.

Signed-off-by: Frank Lee <frank@allwinnertech.com>
Reviewed-by: Yangtao Li <tiny.windzz@gmail.com>
---
 .../devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml       | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml b/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
index 8736926..9d40fc7 100644
--- a/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
+++ b/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
@@ -17,6 +17,7 @@ properties:
       - allwinner,sun8i-h3-ths
       - allwinner,sun8i-r40-ths
       - allwinner,sun50i-a64-ths
+      - allwinner,sun50i-a100-ths
       - allwinner,sun50i-h5-ths
       - allwinner,sun50i-h6-ths
 
@@ -61,7 +62,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: allwinner,sun50i-h6-ths
+            enum:
+              - allwinner,sun50i-a100-ths
+              - allwinner,sun50i-h6-ths
 
     then:
       properties:
@@ -103,6 +106,7 @@ allOf:
               - const: allwinner,sun8i-h3-ths
               - const: allwinner,sun8i-r40-ths
               - const: allwinner,sun50i-a64-ths
+              - const: allwinner,sun50i-a100-ths
               - const: allwinner,sun50i-h5-ths
               - const: allwinner,sun50i-h6-ths
 
-- 
1.9.1

