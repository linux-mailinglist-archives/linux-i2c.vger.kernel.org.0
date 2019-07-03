Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C6535E168
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Jul 2019 11:53:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726598AbfGCJxq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 3 Jul 2019 05:53:46 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:47399 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726305AbfGCJxq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 3 Jul 2019 05:53:46 -0400
X-Originating-IP: 185.94.189.188
Received: from localhost (unknown [185.94.189.188])
        (Authenticated sender: maxime.ripard@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 915F01C0640;
        Wed,  3 Jul 2019 09:53:40 +0000 (UTC)
From:   Maxime Ripard <maxime.ripard@bootlin.com>
To:     Wolfram Sang <wsa@the-dreams.de>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Gregory Clement <gregory.clement@bootlin.com>
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        Maxime Ripard <maxime.ripard@bootlin.com>
Subject: [PATCH 1/2] dt-bindings: i2c: mv64xxx: Fix the example compatible
Date:   Wed,  3 Jul 2019 11:53:37 +0200
Message-Id: <20190703095338.11266-1-maxime.ripard@bootlin.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

One example has a compatible that isn't a valid combination according to
the binding, and now that the examples are validated as well, this
generates a warning.

Let's fix this.

Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
---
 Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml b/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
index 9a5654ef5670..001f2b7abad0 100644
--- a/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
@@ -105,7 +105,7 @@ examples:
 
   - |
     i2c@11000 {
-        compatible = "marvell,mv78230-i2c", "marvell,mv64xxx-i2c";
+        compatible = "marvell,mv78230-i2c";
         reg = <0x11000 0x100>;
         interrupts = <29>;
         clock-frequency = <100000>;
-- 
2.21.0

