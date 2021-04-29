Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D68836E6CF
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Apr 2021 10:17:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239916AbhD2INs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 29 Apr 2021 04:13:48 -0400
Received: from lucky1.263xmail.com ([211.157.147.130]:49606 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238725AbhD2INq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 29 Apr 2021 04:13:46 -0400
Received: from localhost (unknown [192.168.167.105])
        by lucky1.263xmail.com (Postfix) with ESMTP id B4954D1851;
        Thu, 29 Apr 2021 16:12:58 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [58.22.7.114])
        by smtp.263.net (postfix) whith ESMTP id P13444T140177666209536S1619683974411618_;
        Thu, 29 Apr 2021 16:12:56 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <61ba5ba6df5bef1f82f3c643a513639b>
X-RL-SENDER: cl@rock-chips.com
X-SENDER: cl@rock-chips.com
X-LOGIN-NAME: cl@rock-chips.com
X-FST-TO: heiko@sntech.de
X-RCPT-COUNT: 30
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
        jamie@jamieiles.com, linux-watchdog@vger.kernel.org, maz@kernel.org
Subject: [PATCH v4 05/10] dt-bindings: pwm: rockchip: add description for rk3568
Date:   Thu, 29 Apr 2021 16:12:52 +0800
Message-Id: <20210429081252.17711-1-cl@rock-chips.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210429081151.17558-1-cl@rock-chips.com>
References: <20210429081151.17558-1-cl@rock-chips.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Liang Chen <cl@rock-chips.com>

add "rockchip,rk3568-pwm", "rockchip,rk3328-pwm" for pwm nodes on
a rk3568 platform to pwm-rockchip.yaml.

Signed-off-by: Liang Chen <cl@rock-chips.com>
---
 Documentation/devicetree/bindings/pwm/pwm-rockchip.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pwm/pwm-rockchip.yaml b/Documentation/devicetree/bindings/pwm/pwm-rockchip.yaml
index 5596bee70509..81a54a4e8e3e 100644
--- a/Documentation/devicetree/bindings/pwm/pwm-rockchip.yaml
+++ b/Documentation/devicetree/bindings/pwm/pwm-rockchip.yaml
@@ -29,6 +29,7 @@ properties:
           - enum:
               - rockchip,px30-pwm
               - rockchip,rk3308-pwm
+              - rockchip,rk3568-pwm
           - const: rockchip,rk3328-pwm
 
   reg:
-- 
2.17.1



