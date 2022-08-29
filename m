Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 336C55A566D
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Aug 2022 23:47:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229533AbiH2Vrp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Aug 2022 17:47:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229521AbiH2Vro (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 29 Aug 2022 17:47:44 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 4AF7085F81;
        Mon, 29 Aug 2022 14:47:43 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.93,273,1654527600"; 
   d="scan'208";a="132991546"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 30 Aug 2022 06:47:42 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 150D0400297E;
        Tue, 30 Aug 2022 06:47:38 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Chris Brandt <chris.brandt@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] dt-bindings: i2c: renesas,riic: Fix 'unevaluatedProperties' warnings
Date:   Mon, 29 Aug 2022 22:47:30 +0100
Message-Id: <20220829214730.5752-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

With 'unevaluatedProperties' support implemented, there's a number of
warnings when running dtbs_check:

arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dtb: i2c@10058000: Unevaluated properties are not allowed ('resets' was unexpected)
	From schema: Documentation/devicetree/bindings/i2c/renesas,riic.yaml

The main problem is that bindings schema marks resets as a required
property for RZ/G2L (and alike) SoC's but resets property is not part
of schema. So to fix this just add a resets property with maxItems
set to 1.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 Documentation/devicetree/bindings/i2c/renesas,riic.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/renesas,riic.yaml b/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
index bb1f3c7e0e6a..2291a7cd619b 100644
--- a/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
+++ b/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
@@ -60,6 +60,9 @@ properties:
   power-domains:
     maxItems: 1
 
+  resets:
+    maxItems: 1
+
 required:
   - compatible
   - reg
-- 
2.25.1

