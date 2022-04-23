Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97A4E50CA8A
	for <lists+linux-i2c@lfdr.de>; Sat, 23 Apr 2022 15:20:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235731AbiDWNXu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 23 Apr 2022 09:23:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235737AbiDWNXu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 23 Apr 2022 09:23:50 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A8BAD21F8D6;
        Sat, 23 Apr 2022 06:20:49 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.90,284,1643641200"; 
   d="scan'208";a="117760358"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 23 Apr 2022 22:20:49 +0900
Received: from localhost.localdomain (unknown [10.226.92.16])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 9F1A742AEAEF;
        Sat, 23 Apr 2022 22:20:45 +0900 (JST)
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
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] dt-bindings: i2c: renesas,riic: Document RZ/G2UL SoC
Date:   Sat, 23 Apr 2022 14:20:43 +0100
Message-Id: <20220423132043.139672-1-biju.das.jz@bp.renesas.com>
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
---
 Documentation/devicetree/bindings/i2c/renesas,riic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/renesas,riic.yaml b/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
index f4b235a87ac6..cdccce58c392 100644
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
-- 
2.25.1

