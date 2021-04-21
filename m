Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80D133665C9
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Apr 2021 08:59:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236422AbhDUHA0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 21 Apr 2021 03:00:26 -0400
Received: from lucky1.263xmail.com ([211.157.147.134]:43668 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229536AbhDUHAZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 21 Apr 2021 03:00:25 -0400
Received: from localhost (unknown [192.168.167.235])
        by lucky1.263xmail.com (Postfix) with ESMTP id 3FF27C7AC3;
        Wed, 21 Apr 2021 14:59:34 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [58.22.7.114])
        by smtp.263.net (postfix) whith ESMTP id P2750T140649152108288S1618988366606986_;
        Wed, 21 Apr 2021 14:59:33 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <4b8ad35dd1c107ba03dab44c0d2305af>
X-RL-SENDER: cl@rock-chips.com
X-SENDER: cl@rock-chips.com
X-LOGIN-NAME: cl@rock-chips.com
X-FST-TO: heiko@sntech.de
X-RCPT-COUNT: 25
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
        cl@rock-chips.com
Subject: [PATCH v1 3/5] dt-bindings: mmc: rockchip-dw-mshc: add description for rk3568
Date:   Wed, 21 Apr 2021 14:59:19 +0800
Message-Id: <20210421065921.23917-4-cl@rock-chips.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210421065921.23917-1-cl@rock-chips.com>
References: <20210421065921.23917-1-cl@rock-chips.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Liang Chen <cl@rock-chips.com>

add "rockchip,rk3568-dwcmshc", "snps,dwcmshc-sdhci" for mmc nodes on
a rk3568 platform to rockchip-dw-mshc.yaml.

Signed-off-by: Liang Chen <cl@rock-chips.com>
---
 Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml b/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml
index 3762f1c8de96..2a6c1cee4887 100644
--- a/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml
+++ b/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml
@@ -27,6 +27,8 @@ properties:
       - const: rockchip,rk2928-dw-mshc
       # for Rockchip RK3288
       - const: rockchip,rk3288-dw-mshc
+      # for Rockchip RK3568
+      - const: rockchip,rk3568-dwcmshc
       - items:
           - enum:
             # for Rockchip PX30
@@ -41,6 +43,8 @@ properties:
               - rockchip,rk3328-dw-mshc
             # for Rockchip RK3368
               - rockchip,rk3368-dw-mshc
+            # for Rockchip RK3568
+              - rockchip,rk3568-dw-mshc
             # for Rockchip RK3399
               - rockchip,rk3399-dw-mshc
             # for Rockchip RV1108
-- 
2.17.1



