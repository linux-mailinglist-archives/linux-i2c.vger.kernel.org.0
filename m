Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF8426C83D9
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Mar 2023 18:56:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231891AbjCXR4B (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 24 Mar 2023 13:56:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231888AbjCXRz6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 24 Mar 2023 13:55:58 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A576B1A676;
        Fri, 24 Mar 2023 10:55:24 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id B8C23660312F;
        Fri, 24 Mar 2023 17:55:03 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1679680504;
        bh=K0Zn+1zJOvMiVcMPpFQWTebyCIuwNTPLMAYftcNlQPQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=H0QTPx+iyIn435vWHAlLMr468WsGxAnYdsdmi47ETRYuK1LkfRrX5A6+G8NRmK8rf
         npzjmmyuClzcIORD6vKXpKfjWIVvCdQPGCc00n7sDi7X0zTAdkfghZFFnyNaJiuRmu
         kA1n836ZmRtxbXLGPwjq/wt+7kQvL9j5vHs1Wgup/6MTybPrG7VeHn+ZEWAs81XTq+
         QyyiLZpLOmPLaWD2lzbi1VcKl7fkDEAnIxfP2cW95S0pwTpXX0Sp4NmuSaRUHsKNk7
         BB7/bd1of1Bvv8hjkLgNX/koHH8FKzwySysSzq4wGwaOQekPaqxRBPZL1Kwhux+4f4
         tVSpxn5Kx3LSw==
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
        <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v1 04/18] dt-bindings: i2c: i2c-mt65xx: Add compatible for MT6795 Helio X10
Date:   Fri, 24 Mar 2023 18:54:42 +0100
Message-Id: <20230324175456.219954-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230324175456.219954-1-angelogioacchino.delregno@collabora.com>
References: <20230324175456.219954-1-angelogioacchino.delregno@collabora.com>
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

