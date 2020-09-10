Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84A51264CC5
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Sep 2020 20:24:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726872AbgIJSYR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Sep 2020 14:24:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:48288 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726932AbgIJSXI (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 10 Sep 2020 14:23:08 -0400
Received: from localhost.localdomain (unknown [194.230.155.174])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A26B12076C;
        Thu, 10 Sep 2020 18:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599762171;
        bh=vf3/2Ah6EEIFVEDc7rxh6WIcbRaV1jukW6ZgpYx8MBo=;
        h=From:To:Subject:Date:From;
        b=caAhTjA9m8qhS3qW41xW8P4YOygLHEsgNjo92qujXNQh1nEIfRkaitJKpBmvnV0Cm
         R4dtxtAua/TxQUqL0No+5urrSdnWeJgs7LaMeI3IgA8i8aMfgbhhAfRPjJPYQqfxlO
         KfWnyEMuySfAPdcMbbnQAyKI8jTwy90xALgnfkCo=
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
Subject: [PATCH v3 1/4] dt-bindings: i2c: imx-lpi2c: Add properties and use unevaluatedProperties
Date:   Thu, 10 Sep 2020 20:22:41 +0200
Message-Id: <20200910182244.5815-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-i2c-owner@vger.kernel.org
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

Changes since v2:
1. Add assigned-clock-parents

Changes since v1:
1. Add more properties and include /schemas/i2c/i2c-controller.yaml#
---
 .../bindings/i2c/i2c-imx-lpi2c.yaml           | 20 +++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml b/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
index ac0bc5dd64d6..918535b33384 100644
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
@@ -16,29 +19,42 @@ properties:
       - fsl,imx8qxp-lpi2c
       - fsl,imx8qm-lpi2c
 
+  '#address-cells': true
+  '#size-cells': true
+
   reg:
     maxItems: 1
 
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

