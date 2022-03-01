Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BFFF64C8BFE
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Mar 2022 13:50:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233723AbiCAMvg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Mar 2022 07:51:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233451AbiCAMvg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Mar 2022 07:51:36 -0500
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0F073931BA;
        Tue,  1 Mar 2022 04:50:54 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.90,146,1643641200"; 
   d="scan'208";a="111989007"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 01 Mar 2022 21:50:54 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id EE83A4000931;
        Tue,  1 Mar 2022 21:50:51 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Brandt <chris.brandt@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        linux-i2c@vger.kernel.org
Subject: [PATCH v2] dt-bindings: i2c: renesas,riic: Document RZ/V2L SoC
Date:   Tue,  1 Mar 2022 12:50:46 +0000
Message-Id: <20220301125046.17737-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Document RZ/V2L I2C bindings. RZ/V2L I2C is identical to one found on the
RZ/G2L and RZ/A SoC's. No driver changes are required as the generic
compatible string "renesas,riic-rz" will be used as a fallback.

While at it, drop the comment "# RZ/A or RZ/G2L" for "renesas,riic-rz"
compatible string as this will avoid changing the line for every new
SoC addition.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v1->v2
* Included Ack and RB tags
* Dropped the comment from generic string as suggested by Geert.

v1:
https://patchwork.kernel.org/project/linux-renesas-soc/patch/
20220227214747.24819-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
---
 Documentation/devicetree/bindings/i2c/renesas,riic.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/renesas,riic.yaml b/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
index 402fd125e010..26d523f3f420 100644
--- a/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
+++ b/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
@@ -20,7 +20,8 @@ properties:
           - renesas,riic-r7s72100   # RZ/A1H
           - renesas,riic-r7s9210    # RZ/A2M
           - renesas,riic-r9a07g044  # RZ/G2{L,LC}
-      - const: renesas,riic-rz      # RZ/A or RZ/G2L
+          - renesas,riic-r9a07g054  # RZ/V2L
+      - const: renesas,riic-rz
 
   reg:
     maxItems: 1
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

