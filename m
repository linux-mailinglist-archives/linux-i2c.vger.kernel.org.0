Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 318B2256741
	for <lists+linux-i2c@lfdr.de>; Sat, 29 Aug 2020 13:48:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728067AbgH2LbD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 29 Aug 2020 07:31:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:47908 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728089AbgH2La1 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 29 Aug 2020 07:30:27 -0400
Received: from localhost.localdomain (unknown [194.230.155.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AF91F20E65;
        Sat, 29 Aug 2020 11:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598699892;
        bh=XbS00cGM7FWW3OaLpUHfAbAx2qWn7eq/QxFzyvyD3oE=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=YKqbY9CKJYBZRazouF05mCPzF5D4bmOANdigV1PvouyabuS3dxZy4VR1NbBLxjunf
         wpUJg42+kEh1NO8bPevSRlsZRnLvyZLDPZKpwx/KseQ+nqaq1LoIbnMuIlRyuKHG+d
         EqALPxHH/2IRs6nV6Y1dth7WwF3OWmr3/p6ygSjc=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Anson Huang <Anson.Huang@nxp.com>,
        Wolfram Sang <wolfram@the-dreams.de>,
        Dong Aisheng <aisheng.dong@nxp.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: [PATCH 2/7] dt-bindings: mailbox: fsl,mu: Fix i.MX 8QXP compatible matching
Date:   Sat, 29 Aug 2020 13:17:55 +0200
Message-Id: <20200829111800.2786-2-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200829111800.2786-1-krzk@kernel.org>
References: <20200829111800.2786-1-krzk@kernel.org>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The Mailbox on i.MX 8QXP (fsl,imx8qxp-mu) can also be compatible with
fsl,imx8-mu-scu (for fast IPC) so adjust the compatibles to fix
dtbs_check warnings like:

  arch/arm64/boot/dts/freescale/imx8qxp-mek.dt.yaml: mailbox@5d1f0000:
    compatible: ['fsl,imx8-mu-scu', 'fsl,imx8qxp-mu', 'fsl,imx6sx-mu']
    is not valid under any of the given schemas (Possible causes of the failure):

  arch/arm64/boot/dts/freescale/imx8qxp-mek.dt.yaml: mailbox@5d1f0000:
    compatible: ['fsl,imx8-mu-scu', 'fsl,imx8qxp-mu', 'fsl,imx6sx-mu'] is too long

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 Documentation/devicetree/bindings/mailbox/fsl,mu.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mailbox/fsl,mu.yaml b/Documentation/devicetree/bindings/mailbox/fsl,mu.yaml
index 8a3470b64d06..7ed096360be2 100644
--- a/Documentation/devicetree/bindings/mailbox/fsl,mu.yaml
+++ b/Documentation/devicetree/bindings/mailbox/fsl,mu.yaml
@@ -38,8 +38,9 @@ properties:
           - const: fsl,imx6sx-mu
       - description: To communicate with i.MX8 SCU with fast IPC
         items:
-          - const: fsl,imx8qxp-mu
           - const: fsl,imx8-mu-scu
+          - const: fsl,imx8qxp-mu
+          - const: fsl,imx6sx-mu
 
   reg:
     maxItems: 1
-- 
2.17.1

