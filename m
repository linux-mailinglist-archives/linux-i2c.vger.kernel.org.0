Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1E93597875
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Aug 2022 23:00:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233797AbiHQU4c (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 17 Aug 2022 16:56:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241536AbiHQU4c (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 17 Aug 2022 16:56:32 -0400
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C52B2A74EA;
        Wed, 17 Aug 2022 13:56:30 -0700 (PDT)
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 1F3C8200259;
        Wed, 17 Aug 2022 22:56:29 +0200 (CEST)
Received: from smtp.na-rdc02.nxp.com (usphx01srsp001v.us-phx01.nxp.com [134.27.49.11])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id CC89020025B;
        Wed, 17 Aug 2022 22:56:28 +0200 (CEST)
Received: from right.am.freescale.net (right.am.freescale.net [10.81.116.134])
        by usphx01srsp001v.us-phx01.nxp.com (Postfix) with ESMTP id D3A264060D;
        Wed, 17 Aug 2022 13:56:26 -0700 (MST)
From:   Li Yang <leoyang.li@nxp.com>
To:     Oleksij Rempel <linux@rempel-privat.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>
Cc:     Li Yang <leoyang.li@nxp.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] dt-binding: i2c-imx: add SoC specific compatible strings for layerscape
Date:   Wed, 17 Aug 2022 15:56:22 -0500
Message-Id: <20220817205623.22104-1-leoyang.li@nxp.com>
X-Mailer: git-send-email 2.25.1.377.g2d2118b
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add chip specific compatible strings for layerscape platforms to make it
possible to do SoC specific fix-ups in the driver.

Signed-off-by: Li Yang <leoyang.li@nxp.com>
---
 Documentation/devicetree/bindings/i2c/i2c-imx.yaml | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-imx.yaml b/Documentation/devicetree/bindings/i2c/i2c-imx.yaml
index 01720e338b4c..85ee1282d6d2 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-imx.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-imx.yaml
@@ -18,6 +18,17 @@ properties:
       - const: fsl,imx1-i2c
       - const: fsl,imx21-i2c
       - const: fsl,vf610-i2c
+      - items:
+          - enum:
+              - fsl,ls1012a-i2c
+              - fsl,ls1021a-i2c
+              - fsl,ls1028a-i2c
+              - fsl,ls1043a-i2c
+              - fsl,ls1046a-i2c
+              - fsl,ls1088a-i2c
+              - fsl,ls208xa-i2c
+              - fsl,lx2160a-i2c
+          - const: fsl,vf610-i2c
       - items:
           - const: fsl,imx35-i2c
           - const: fsl,imx1-i2c
-- 
2.37.1

