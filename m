Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CA6B36D8BE
	for <lists+linux-i2c@lfdr.de>; Wed, 28 Apr 2021 15:51:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239994AbhD1NuW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 28 Apr 2021 09:50:22 -0400
Received: from lucky1.263xmail.com ([211.157.147.134]:42134 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239993AbhD1NuW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 28 Apr 2021 09:50:22 -0400
Received: from localhost (unknown [192.168.167.172])
        by lucky1.263xmail.com (Postfix) with ESMTP id C5E33C8534;
        Wed, 28 Apr 2021 21:49:29 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [58.22.7.114])
        by smtp.263.net (postfix) whith ESMTP id P18449T140669284767488S1619617767656401_;
        Wed, 28 Apr 2021 21:49:29 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <fdb70710ded8ccf7590ab29759c3b864>
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
Subject: [PATCH v3 06/10] dt-bindings: gpio: change items restriction of clock for rockchip,gpio-bank
Date:   Wed, 28 Apr 2021 21:49:26 +0800
Message-Id: <20210428134926.22318-1-cl@rock-chips.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210428134759.22076-1-cl@rock-chips.com>
References: <20210428134759.22076-1-cl@rock-chips.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Liang Chen <cl@rock-chips.com>

The clock property need 2 items on some rockchip chips.

Signed-off-by: Liang Chen <cl@rock-chips.com>
---
 Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml b/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
index d993e002cebe..7b3fd2975c74 100644
--- a/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
+++ b/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
@@ -22,7 +22,8 @@ properties:
     maxItems: 1
 
   clocks:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
 
   gpio-controller: true
 
-- 
2.17.1



