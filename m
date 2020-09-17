Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5358726E531
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Sep 2020 21:15:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726652AbgIQTOm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Sep 2020 15:14:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:35624 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726599AbgIQTNd (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 17 Sep 2020 15:13:33 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.191])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7FC50206C9;
        Thu, 17 Sep 2020 19:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600370009;
        bh=S2cd1mTZZBuFhAywOxVG6MpC2f1HBymLfjDK2WX2YT8=;
        h=From:To:Subject:Date:From;
        b=Q/H3ZQ7SI/cEqiFDlrehdSzRxjS4CVgvQMrj7wxBeeffD1ftOTwBEzEVnbQ0WeVec
         TM26Vd+B+vz5g4Hy+/Groz1h9CfPgEivpZHdqItjqdV3f0z0kT5bkHoXBzjoGwVJBQ
         Vcg7I++dsOw7Rhujse7PIhB/S0SAh7aChPiuLtB0=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Wolfram Sang <wolfram@the-dreams.de>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/4] dt-bindings: i2c: imx-lpi2c: Add properties and use unevaluatedProperties
Date:   Thu, 17 Sep 2020 21:13:18 +0200
Message-Id: <20200917191321.28741-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Additional properties actually might appear (e.g. power-domains) so
describe all typical properties, reference generic i2c schema and use
unevaluatedProperties to fix dtbs_check warnings like:

  arch/arm64/boot/dts/freescale/imx8qxp-ai_ml.dt.yaml: i2c@5a800000:
    'assigned-clock-rates', 'assigned-clocks', 'clock-names', 'power-domains' do not match any of the regexes: 'pinctrl-[0-9]+'

  arch/arm64/boot/dts/freescale/imx8qxp-colibri-eval-v3.dt.yaml: i2c@5a800000:
    'touchscreen@2c' does not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v3:
1. Drop address/size cells
2. Set maxItems to power domains to 1

Changes since v2:
1. Add assigned-clock-parents

Changes since v1:
1. Add more properties and include /schemas/i2c/i2c-controller.yaml#
---
 .../devicetree/bindings/i2c/i2c-imx-lpi2c.yaml | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml b/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
index ac0bc5dd64d6..bf68489eecd1 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
@@ -9,6 +9,9 @@ title: Freescale Low Power Inter IC (LPI2C) for i.MX
 maintainers:
   - Anson Huang <Anson.Huang@nxp.com>
 
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
 properties:
   compatible:
     enum:
@@ -22,23 +25,34 @@ properties:
   interrupts:
     maxItems: 1
 
+  assigned-clock-parents: true
+  assigned-clock-rates: true
+  assigned-clocks: true
+  clock-frequency: true
+
+  clock-names:
+    maxItems: 1
+
   clocks:
     maxItems: 1
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
   - interrupts
   - clocks
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
     #include <dt-bindings/clock/imx7ulp-clock.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
 
-    lpi2c7@40a50000 {
+    i2c@40a50000 {
         compatible = "fsl,imx7ulp-lpi2c";
         reg = <0x40A50000 0x10000>;
         interrupt-parent = <&intc>;
-- 
2.17.1

