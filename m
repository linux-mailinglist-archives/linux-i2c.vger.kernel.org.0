Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A67C5E16B
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Jul 2019 11:53:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726305AbfGCJxw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 3 Jul 2019 05:53:52 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:57897 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726434AbfGCJxv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 3 Jul 2019 05:53:51 -0400
X-Originating-IP: 185.94.189.188
Received: from localhost (unknown [185.94.189.188])
        (Authenticated sender: maxime.ripard@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id E628A2011B;
        Wed,  3 Jul 2019 09:53:45 +0000 (UTC)
From:   Maxime Ripard <maxime.ripard@bootlin.com>
To:     Wolfram Sang <wsa@the-dreams.de>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Gregory Clement <gregory.clement@bootlin.com>
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        Maxime Ripard <maxime.ripard@bootlin.com>
Subject: [PATCH 2/2] dt-bindings: i2c: sun6i-p2wi: Fix the binding example
Date:   Wed,  3 Jul 2019 11:53:38 +0200
Message-Id: <20190703095338.11266-2-maxime.ripard@bootlin.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190703095338.11266-1-maxime.ripard@bootlin.com>
References: <20190703095338.11266-1-maxime.ripard@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Even though the binding claims that the frequency can go up to 6MHz, the
common i2c binding sets a limit at 3MHz, which then triggers a warning.

Since the only SoC that uses that bus uses a frequency of 100kHz, and that
this bus hasn't been found in an SoC for something like 5 years, let's just
fix the example to have a frequency within the acceptable range for i2c.

Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
---
 .../devicetree/bindings/i2c/allwinner,sun6i-a31-p2wi.yaml       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/allwinner,sun6i-a31-p2wi.yaml b/Documentation/devicetree/bindings/i2c/allwinner,sun6i-a31-p2wi.yaml
index 1804abe24f14..f9d526b7da01 100644
--- a/Documentation/devicetree/bindings/i2c/allwinner,sun6i-a31-p2wi.yaml
+++ b/Documentation/devicetree/bindings/i2c/allwinner,sun6i-a31-p2wi.yaml
@@ -51,7 +51,7 @@ examples:
         reg = <0x01f03400 0x400>;
         interrupts = <0 39 4>;
         clocks = <&apb0_gates 3>;
-        clock-frequency = <6000000>;
+        clock-frequency = <100000>;
         resets = <&apb0_rst 3>;
         #address-cells = <1>;
         #size-cells = <0>;
-- 
2.21.0

