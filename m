Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7386950E1D2
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Apr 2022 15:32:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237187AbiDYNfH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 25 Apr 2022 09:35:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242111AbiDYNfE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 25 Apr 2022 09:35:04 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 306BEBA8;
        Mon, 25 Apr 2022 06:32:00 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.90,288,1643641200"; 
   d="scan'208";a="119093272"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 25 Apr 2022 22:31:59 +0900
Received: from localhost.localdomain (unknown [10.226.93.95])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 90EEC40065CF;
        Mon, 25 Apr 2022 22:31:55 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2] dt-bindings: i2c: renesas,riic: Document RZ/G2UL SoC
Date:   Mon, 25 Apr 2022 14:31:52 +0100
Message-Id: <20220425133152.176949-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Document RZ/G2UL I2C bindings. RZ/G2UL I2C is identical to one found on
the RZ/G2L SoC. No driver changes are required as RZ/G2L compatible
string "renesas,riic-rz" will be used as a fallback.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v1->v2:
 * Added Reset property required on RZ/G2UL SoC
 * Added Ack from Krzysztof Kozlowski
 * Added Rb tag from Geert
---
 Documentation/devicetree/bindings/i2c/renesas,riic.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/renesas,riic.yaml b/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
index f4b235a87ac6..2f315489aaae 100644
--- a/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
+++ b/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
@@ -19,6 +19,7 @@ properties:
       - enum:
           - renesas,riic-r7s72100   # RZ/A1H
           - renesas,riic-r7s9210    # RZ/A2M
+          - renesas,riic-r9a07g043  # RZ/G2UL
           - renesas,riic-r9a07g044  # RZ/G2{L,LC}
           - renesas,riic-r9a07g054  # RZ/V2L
       - const: renesas,riic-rz      # RZ/A or RZ/G2L
@@ -75,6 +76,7 @@ if:
     compatible:
       contains:
         enum:
+          - renesas,riic-r9a07g043
           - renesas,riic-r9a07g044
           - renesas,riic-r9a07g054
 then:
-- 
2.25.1

