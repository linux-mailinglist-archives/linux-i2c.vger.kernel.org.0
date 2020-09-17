Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5287126E522
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Sep 2020 21:13:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726617AbgIQTNv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Sep 2020 15:13:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:35658 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726601AbgIQTNd (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 17 Sep 2020 15:13:33 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.191])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E2F2120717;
        Thu, 17 Sep 2020 19:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600370012;
        bh=A/uMnrmFPfOUhuVZrjcN5jtWMleeKX1dCE3yow2l3Dg=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=uff9Xqlb4mYfVzoyyuCqC9QcoseahCfDlECpTE8unQ3yqSfbrYsSP9iFUAtb60EpR
         OgbVWlNlGssoWh1WkgVZE9yajxYzh3nvxxqA2NeFKlUiC+kvRTtdlUqPeAyfmaNN4E
         wXCqik0O0udqzt7CtalfuWjlHmwZhv8TRzVMsXaM=
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
Subject: [PATCH v4 2/4] dt-bindings: i2c: imx-lpi2c: Fix i.MX 8QXP compatible matching
Date:   Thu, 17 Sep 2020 21:13:19 +0200
Message-Id: <20200917191321.28741-2-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200917191321.28741-1-krzk@kernel.org>
References: <20200917191321.28741-1-krzk@kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The i.MX 8QXP DTSes use two compatibles so update the binding to fix
dtbs_check warnings like:

  arch/arm64/boot/dts/freescale/imx8qxp-mek.dt.yaml: i2c@5a820000:
    compatible: ['fsl,imx8qxp-lpi2c', 'fsl,imx7ulp-lpi2c'] is too long

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 .../devicetree/bindings/i2c/i2c-imx-lpi2c.yaml        | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml b/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
index bf68489eecd1..29b9447f3b84 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml
@@ -14,10 +14,13 @@ allOf:
 
 properties:
   compatible:
-    enum:
-      - fsl,imx7ulp-lpi2c
-      - fsl,imx8qxp-lpi2c
-      - fsl,imx8qm-lpi2c
+    oneOf:
+      - enum:
+          - fsl,imx7ulp-lpi2c
+          - fsl,imx8qm-lpi2c
+      - items:
+          - const: fsl,imx8qxp-lpi2c
+          - const: fsl,imx7ulp-lpi2c
 
   reg:
     maxItems: 1
-- 
2.17.1

