Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA6106C9E29
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Mar 2023 10:40:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233338AbjC0Ikt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Mar 2023 04:40:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233094AbjC0Ike (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Mar 2023 04:40:34 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9328C97;
        Mon, 27 Mar 2023 01:36:58 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 9585D66030B4;
        Mon, 27 Mar 2023 09:36:56 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1679906217;
        bh=/m1OL7UsMbNu+kNMCfRtbpy2xlvb5EHGi2lUhT8JrpU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LatL6xXd23iT/+dxp3yRnUFr1btzJX414Q9COH/8qxalSOFYNnD0YL7GSHZUgmJCI
         EgSoHyTgPdr2aoM6Lke3roF3riLHZxxztopPljTNYWggdPmzp1xzrnaC/eLpOqVCDH
         pvpmBUntRPgNxxyHWLVJXtoVdvp7MNZ9pmbE2qH4UZIe+ah4U4gkDRWkVgwCQtZNZs
         2xMJ/Iyyo9IFWhyqmZmM77EKFAgE5tLorwp0wuGHZO30f92tmrONxnPAp15m1w+Ij1
         hO0qX71X/x9BTXkqQj916ymZ5tPBypN6vASbQUiCGrEexs0LF3SvHu2MIkkXuhbKHU
         24U8Qmuab1tAw==
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
To:     matthias.bgg@gmail.com
Cc:     qii.wang@mediatek.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, jassisinghbrar@gmail.com,
        houlong.wei@mediatek.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, kernel@collabora.com,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v2 04/17] dt-bindings: i2c: i2c-mt65xx: Add compatible for MT6795 Helio X10
Date:   Mon, 27 Mar 2023 10:36:34 +0200
Message-Id: <20230327083647.22017-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230327083647.22017-1-angelogioacchino.delregno@collabora.com>
References: <20230327083647.22017-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The MT6795 SoC uses the same I2C controller parameters as MT8173:
add a new compatible string for it.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
index 72ae2e01cf22..685da4df688d 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
@@ -45,6 +45,10 @@ properties:
           - enum:
               - mediatek,mt8365-i2c
           - const: mediatek,mt8168-i2c
+      - items:
+          - enum:
+              - mediatek,mt6795-i2c
+          - const: mediatek,mt8173-i2c
       - items:
           - enum:
               - mediatek,mt8195-i2c
-- 
2.40.0

