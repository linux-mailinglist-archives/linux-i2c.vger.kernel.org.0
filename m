Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0EDA25DCF3
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Sep 2020 17:14:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730344AbgIDPOU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Sep 2020 11:14:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:58042 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730204AbgIDPOT (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 4 Sep 2020 11:14:19 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.106])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CF1DE2074D;
        Fri,  4 Sep 2020 15:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599232458;
        bh=B8VIGNVugApvS63IRKs5y0LcQBmAErxWczKo8XZhL3E=;
        h=From:To:Cc:Subject:Date:From;
        b=efxZLcTDb6RMP3WaE8v3lLXhlKq8jt9P1CXm0IaKely0oz6qj5SBOBAYHe+VH3XrW
         vY+p0Uo4NaTk+lFAuinT0pCEEDV5of23YNjJNu34lm4AcUq6FbMJToXdE7Dhzgz5YH
         Tej/UJJCsDloL9dtc9Btpbla0q/U4825nrFY8WWw=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Wolfram Sang <wolfram@the-dreams.de>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v2 1/4] dt-bindings: i2c: imx-lpi2c: Add properties and use unevaluatedProperties
Date:   Fri,  4 Sep 2020 17:14:08 +0200
Message-Id: <20200904151411.18973-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Additional properties actually might appear (e.g. power-domains) so
describe all typical and use unevaluatedProperties to fix dtbs_check
warnings like:

  arch/arm64/boot/dts/freescale/imx8qxp-ai_ml.dt.yaml: i2c@5a800000:
    'assigned-clock-rates', 'assigned-clocks', 'clock-names', 'power-domains' do not match any of the regexes: 'pinctrl-[0-9]+'

  arch/arm64/boot/dts/freescale/imx8qxp-colibri-eval-v3.dt.yaml: i2c@5a800000:
    'touchscreen@2c' does not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v1:
1. Add more properties and include /schemas/i2c/i2c-controller.yaml#
---
 .../bindings/i2c/i2c-imx-lpi2c.yaml           | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml b/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
index ac0bc5dd64d6..e5cfd08faa07 100644
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
@@ -16,29 +19,41 @@ properties:
       - fsl,imx8qxp-lpi2c
       - fsl,imx8qm-lpi2c
 
+  '#address-cells': true
+  '#size-cells': true
+
   reg:
     maxItems: 1
 
   interrupts:
     maxItems: 1
 
+  assigned-clock-rates: true
+  assigned-clocks: true
+  clock-frequency: true
+
+  clock-names:
+    maxItems: 1
+
   clocks:
     maxItems: 1
 
+  power-domains: true
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

