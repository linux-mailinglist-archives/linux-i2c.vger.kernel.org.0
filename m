Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2599E6B8787
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Mar 2023 02:20:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229684AbjCNBUi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 13 Mar 2023 21:20:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229880AbjCNBUh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 13 Mar 2023 21:20:37 -0400
Received: from fudo.makrotopia.org (fudo.makrotopia.org [IPv6:2a07:2ec0:3002::71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EA4C5A1BC;
        Mon, 13 Mar 2023 18:20:37 -0700 (PDT)
Received: from local
        by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
         (Exim 4.96)
        (envelope-from <daniel@makrotopia.org>)
        id 1pbtL7-0005j2-0i;
        Tue, 14 Mar 2023 02:20:33 +0100
Date:   Tue, 14 Mar 2023 01:18:55 +0000
From:   Daniel Golle <daniel@makrotopia.org>
To:     linux-i2c@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Qii Wang <qii.wang@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 2/2] dt-bindings: i2c: i2c-mt65xx: add binding for MT7981 SoC
Message-ID: <f4c351b344113434987b4ffe22db9b51d82a27ae.1678756608.git.daniel@makrotopia.org>
References: <cover.1678756608.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1678756608.git.daniel@makrotopia.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add binding documentation for the I2C controllers found in the
MediaTek MT7981 SoC.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
index 72ae2e01cf22..5ae6769483d7 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
@@ -23,6 +23,7 @@ properties:
       - const: mediatek,mt6577-i2c
       - const: mediatek,mt6589-i2c
       - const: mediatek,mt7622-i2c
+      - const: mediatek,mt7981-i2c
       - const: mediatek,mt7986-i2c
       - const: mediatek,mt8168-i2c
       - const: mediatek,mt8173-i2c
-- 
2.39.2

