Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F618264CC6
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Sep 2020 20:24:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725945AbgIJSYT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Sep 2020 14:24:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:48340 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726967AbgIJSXU (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 10 Sep 2020 14:23:20 -0400
Received: from localhost.localdomain (unknown [194.230.155.174])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7FF6D21D81;
        Thu, 10 Sep 2020 18:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599762178;
        bh=0+4BtmXAZbE5k3p38TKuOUALJVc0fCCWYd18jiZfWcE=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=YpG/iiN0YrhNodZWuLQomcfhe0WK2mpRKuKKG1UXRtNAtAe2YTOT1HZvTNMki7L6q
         tkAdYyPTqZmuyaVeeikUH1LlljwAjgzJxkEVQSLjEjxPidCbFkh80NRWfnyUE1semH
         feazf3IZNc/VzUDKHyW76qrrQybozwqAq3l4pFa0=
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
Subject: [PATCH v3 3/4] dt-bindings: i2c: imx: Add properties and use unevaluatedProperties
Date:   Thu, 10 Sep 2020 20:22:43 +0200
Message-Id: <20200910182244.5815-3-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200910182244.5815-1-krzk@kernel.org>
References: <20200910182244.5815-1-krzk@kernel.org>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Additional properties actually might appear (e.g. power-domains) so
describe all typical properties, reference generic i2c schema and use
unevaluatedProperties to fix dtbs_check warnings like:

  arch/arm64/boot/dts/freescale/imx8mn-evk.dt.yaml: i2c@30a20000:
    '#address-cells', '#size-cells', 'pmic@25' do not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v2:
1. None

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

