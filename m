Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE0152180F8
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Jul 2020 09:20:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730260AbgGHHT6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Jul 2020 03:19:58 -0400
Received: from smtp2207-205.mail.aliyun.com ([121.197.207.205]:38475 "EHLO
        smtp2207-205.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730242AbgGHHT5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Jul 2020 03:19:57 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.768724|0.5862131;CH=green;DM=|SPAM|false|;DS=CONTINUE|ham_regular_dialog|0.0643047-0.000806366-0.934889;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03297;MF=frank@allwinnertech.com;NM=1;PH=DS;RN=33;RT=33;SR=0;TI=SMTPD_---.I-8lwqE_1594192774;
Received: from allwinnertech.com(mailfrom:frank@allwinnertech.com fp:SMTPD_---.I-8lwqE_1594192774)
          by smtp.aliyun-inc.com(10.147.40.26);
          Wed, 08 Jul 2020 15:19:46 +0800
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
Subject: [PATCH v3 01/16] dt-bindings: clk: sunxi-ccu: add compatible string for A100 CCU and R-CCU
Date:   Wed,  8 Jul 2020 15:19:27 +0800
Message-Id: <20200708071942.22595-2-frank@allwinnertech.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200708071942.22595-1-frank@allwinnertech.com>
References: <20200708071942.22595-1-frank@allwinnertech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This patch adds binding to a100's ccu clock and r-ccu clock.

Signed-off-by: Frank Lee <frank@allwinnertech.com>
---
 .../devicetree/bindings/clock/allwinner,sun4i-a10-ccu.yaml         | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/allwinner,sun4i-a10-ccu.yaml b/Documentation/devicetree/bindings/clock/allwinner,sun4i-a10-ccu.yaml
index 4d38212..3b45344 100644
--- a/Documentation/devicetree/bindings/clock/allwinner,sun4i-a10-ccu.yaml
+++ b/Documentation/devicetree/bindings/clock/allwinner,sun4i-a10-ccu.yaml
@@ -36,6 +36,8 @@ properties:
       - allwinner,sun9i-a80-ccu
       - allwinner,sun50i-a64-ccu
       - allwinner,sun50i-a64-r-ccu
+      - allwinner,sun50i-a100-ccu
+      - allwinner,sun50i-a100-r-ccu
       - allwinner,sun50i-h5-ccu
       - allwinner,sun50i-h6-ccu
       - allwinner,sun50i-h6-r-ccu
@@ -78,6 +80,7 @@ if:
         - allwinner,sun8i-a83t-r-ccu
         - allwinner,sun8i-h3-r-ccu
         - allwinner,sun50i-a64-r-ccu
+        - allwinner,sun50i-a100-r-ccu
         - allwinner,sun50i-h6-r-ccu
 
 then:
@@ -94,7 +97,9 @@ else:
   if:
     properties:
       compatible:
-        const: allwinner,sun50i-h6-ccu
+        enum:
+          - allwinner,sun50i-a100-ccu
+          - allwinner,sun50i-h6-ccu
 
   then:
     properties:
-- 
1.9.1

