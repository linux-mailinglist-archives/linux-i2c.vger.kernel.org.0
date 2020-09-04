Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2DD525DCF6
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Sep 2020 17:14:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730818AbgIDPO2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Sep 2020 11:14:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:58120 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730810AbgIDPO0 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 4 Sep 2020 11:14:26 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.106])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 44EA12083B;
        Fri,  4 Sep 2020 15:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599232465;
        bh=QObkU0u+XxwdXI0uOYUZhtZoK+D6oD3sSDt3c2H/8Hw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Xsj3YgjfVGkn0kyMs67VdhLiCGnQxtGmk11M0ccYUeiHybELkNFbBPlnpK7ejVfXS
         BVW9DBEoFYPgEPKpoh0uUoIPp1dU1YmkSpqLkZ7w8wJVyKsGxuFagYzZdnpVeCInLv
         yHLZolemz5LFHah7t6BK6xoTgWzYSi0zBGbNaxHU=
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
Subject: [PATCH v2 3/4] dt-bindings: i2c: imx: Add properties and use unevaluatedProperties
Date:   Fri,  4 Sep 2020 17:14:10 +0200
Message-Id: <20200904151411.18973-3-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200904151411.18973-1-krzk@kernel.org>
References: <20200904151411.18973-1-krzk@kernel.org>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Additional properties actually might appear (e.g. power-domains) so
describe all typical and use unevaluatedProperties to fix dtbs_check
warnings like:

  arch/arm64/boot/dts/freescale/imx8mn-evk.dt.yaml: i2c@30a20000:
    '#address-cells', '#size-cells', 'pmic@25' do not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v1:
1. Add more properties and include /schemas/i2c/i2c-controller.yaml#
---
 Documentation/devicetree/bindings/i2c/i2c-imx.yaml | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-imx.yaml b/Documentation/devicetree/bindings/i2c/i2c-imx.yaml
index 810536953177..19c9daba6e9f 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-imx.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-imx.yaml
@@ -9,6 +9,9 @@ title: Freescale Inter IC (I2C) and High Speed Inter IC (HS-I2C) for i.MX
 maintainers:
   - Wolfram Sang <wolfram@the-dreams.de>
 
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
 properties:
   compatible:
     oneOf:
@@ -38,6 +41,9 @@ properties:
               - fsl,imx8mp-i2c
           - const: fsl,imx21-i2c
 
+  '#address-cells': true
+  '#size-cells': true
+
   reg:
     maxItems: 1
 
@@ -75,7 +81,7 @@ required:
   - interrupts
   - clocks
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.17.1

