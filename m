Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C422536A636
	for <lists+linux-i2c@lfdr.de>; Sun, 25 Apr 2021 11:42:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230015AbhDYJnT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 25 Apr 2021 05:43:19 -0400
Received: from lucky1.263xmail.com ([211.157.147.132]:58844 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229849AbhDYJnO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 25 Apr 2021 05:43:14 -0400
Received: from localhost (unknown [192.168.167.225])
        by lucky1.263xmail.com (Postfix) with ESMTP id 03FCAF345D;
        Sun, 25 Apr 2021 17:42:28 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [58.22.7.114])
        by smtp.263.net (postfix) whith ESMTP id P3565T140663333058304S1619343740259115_;
        Sun, 25 Apr 2021 17:42:27 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <b34712a409caeea03319e7029cda6d55>
X-RL-SENDER: cl@rock-chips.com
X-SENDER: cl@rock-chips.com
X-LOGIN-NAME: cl@rock-chips.com
X-FST-TO: heiko@sntech.de
X-RCPT-COUNT: 29
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
From:   <cl@rock-chips.com>
To:     heiko@sntech.de
Cc:     robh+dt@kernel.org, jagan@amarulasolutions.com, wens@csie.org,
        uwe@kleine-koenig.org, mail@david-bauer.net, jbx6244@gmail.com,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        jensenhuang@friendlyarm.com, michael@amarulasolutions.com,
        cnsztl@gmail.com, devicetree@vger.kernel.org,
        ulf.hansson@linaro.org, linux-mmc@vger.kernel.org,
        gregkh@linuxfoundation.org, linux-serial@vger.kernel.org,
        linux-i2c@vger.kernel.org, jay.xu@rock-chips.com,
        shawn.lin@rock-chips.com, david.wu@rock-chips.com,
        zhangqing@rock-chips.com, huangtao@rock-chips.com,
        cl@rock-chips.com, wim@linux-watchdog.org, linux@roeck-us.net,
        jamie@jamieiles.com, linux-watchdog@vger.kernel.org
Subject: [PATCH v2 3/7] dt-bindings: mmc: rockchip-dw-mshc: add description for rk3568
Date:   Sun, 25 Apr 2021 17:42:12 +0800
Message-Id: <20210425094216.25724-4-cl@rock-chips.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210425094216.25724-1-cl@rock-chips.com>
References: <20210425094216.25724-1-cl@rock-chips.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Liang Chen <cl@rock-chips.com>

add "rockchip,rk3568-dwcmshc", "snps,dwcmshc-sdhci" for mmc nodes on
a rk3568 platform to rockchip-dw-mshc.yaml.

Signed-off-by: Liang Chen <cl@rock-chips.com>
---
 .../devicetree/bindings/mmc/rockchip-dw-mshc.yaml        | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml b/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml
index 3762f1c8de96..eaa3b0ef24f6 100644
--- a/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml
+++ b/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml
@@ -29,21 +29,14 @@ properties:
       - const: rockchip,rk3288-dw-mshc
       - items:
           - enum:
-            # for Rockchip PX30
               - rockchip,px30-dw-mshc
-            # for Rockchip RK3036
               - rockchip,rk3036-dw-mshc
-            # for Rockchip RK322x
               - rockchip,rk3228-dw-mshc
-            # for Rockchip RK3308
               - rockchip,rk3308-dw-mshc
-            # for Rockchip RK3328
               - rockchip,rk3328-dw-mshc
-            # for Rockchip RK3368
               - rockchip,rk3368-dw-mshc
-            # for Rockchip RK3399
               - rockchip,rk3399-dw-mshc
-            # for Rockchip RV1108
+              - rockchip,rk3568-dw-mshc
               - rockchip,rv1108-dw-mshc
           - const: rockchip,rk3288-dw-mshc
 
-- 
2.17.1



