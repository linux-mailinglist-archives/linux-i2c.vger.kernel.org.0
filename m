Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 69EB74C5F29
	for <lists+linux-i2c@lfdr.de>; Sun, 27 Feb 2022 22:48:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230410AbiB0Vse (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 27 Feb 2022 16:48:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230058AbiB0Vse (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 27 Feb 2022 16:48:34 -0500
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 702DD3FBFC;
        Sun, 27 Feb 2022 13:47:53 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.90,142,1643641200"; 
   d="scan'208";a="111722441"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 28 Feb 2022 06:47:52 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 0208C40061AC;
        Mon, 28 Feb 2022 06:47:49 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Brandt <chris.brandt@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Subject: [PATCH] dt-bindings: i2c: renesas,riic: Document RZ/V2L SoC
Date:   Sun, 27 Feb 2022 21:47:47 +0000
Message-Id: <20220227214747.24819-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Document RZ/V2L I2C bindings. RZ/V2L I2C is identical to one found on
the RZ/G2L SoC. No driver changes are required as RZ/G2L compatible
string "renesas,riic-rz" will be used as a fallback.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
DTSI changes have been posted as part of series [0].

[0] https://patchwork.kernel.org/project/linux-renesas-soc/
patch/20220227203744.18355-6-prabhakar.mahadev-lad.rj@bp.renesas.com/
---
 Documentation/devicetree/bindings/i2c/renesas,riic.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/renesas,riic.yaml b/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
index 402fd125e010..f4b235a87ac6 100644
--- a/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
+++ b/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
@@ -20,6 +20,7 @@ properties:
           - renesas,riic-r7s72100   # RZ/A1H
           - renesas,riic-r7s9210    # RZ/A2M
           - renesas,riic-r9a07g044  # RZ/G2{L,LC}
+          - renesas,riic-r9a07g054  # RZ/V2L
       - const: renesas,riic-rz      # RZ/A or RZ/G2L
 
   reg:
@@ -75,6 +76,7 @@ if:
       contains:
         enum:
           - renesas,riic-r9a07g044
+          - renesas,riic-r9a07g054
 then:
   required:
     - resets
-- 
2.17.1

