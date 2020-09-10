Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5079264CED
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Sep 2020 20:30:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726443AbgIJSaV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Sep 2020 14:30:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:48360 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726973AbgIJSXZ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 10 Sep 2020 14:23:25 -0400
Received: from localhost.localdomain (unknown [194.230.155.174])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9852B21D90;
        Thu, 10 Sep 2020 18:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599762181;
        bh=tBuZCR5xiv1qjye1QG9PxK9ZNp+DEVBnbx0PDmvTlWo=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=w3cgk1iB7ZLIrA0yy4zGNS3HxFo56zh1fZWmQFAAtzadkDP21Fiv0SnhiZh+0WMJA
         AmzINdUfkal+hH3DceZI9B/uinG7Q+7UzDAwX+m29jbmdXd3siLtVhFF43ymTIka8/
         Z+2utdvl4stghrFkNMjpUThswNFuPfs9H28bTn5E=
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
Subject: [PATCH v3 4/4] dt-bindings: i2c: imx: Fix i.MX 7 compatible matching
Date:   Thu, 10 Sep 2020 20:22:44 +0200
Message-Id: <20200910182244.5815-4-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200910182244.5815-1-krzk@kernel.org>
References: <20200910182244.5815-1-krzk@kernel.org>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The i.MX 7 DTSes use two compatibles so update the binding to fix
dtbs_check warnings like:

  arch/arm/boot/dts/imx7d-cl-som-imx7.dt.yaml: i2c@30a20000:
    compatible: ['fsl,imx7d-i2c', 'fsl,imx21-i2c'] is not valid under any of the given schemas (Possible causes of the failure):

  arch/arm/boot/dts/imx7d-cl-som-imx7.dt.yaml: i2c@30a20000:
    compatible: ['fsl,imx7d-i2c', 'fsl,imx21-i2c'] is too long

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 Documentation/devicetree/bindings/i2c/i2c-imx.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-imx.yaml b/Documentation/devicetree/bindings/i2c/i2c-imx.yaml
index 19c9daba6e9f..3a0fbeea7aaf 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-imx.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-imx.yaml
@@ -21,6 +21,9 @@ properties:
       - items:
           - const: fsl,imx35-i2c
           - const: fsl,imx1-i2c
+      - items:
+          - const: fsl,imx7d-i2c
+          - const: fsl,imx21-i2c
       - items:
           - enum:
               - fsl,imx25-i2c
-- 
2.17.1

