Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A27416C83E6
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Mar 2023 18:56:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232168AbjCXR4u (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 24 Mar 2023 13:56:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232137AbjCXR4k (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 24 Mar 2023 13:56:40 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B62731CF50;
        Fri, 24 Mar 2023 10:56:22 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 610DB6603135;
        Fri, 24 Mar 2023 17:55:06 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1679680507;
        bh=2enXSm0ptY4CwPbz2HSp5qKZ+sl1iJxLWmqzjB76U+U=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JINiSdsrozBUJnWD6wki041qRowaEi6AaIVOYCGmgM4prCeWNheUAtTf7tTTSaPih
         p+8jOc5mJHarcjC7wD3ybEOsC2NndascA+7efOlnrub7cY8OJZ517vOk8Xw06CsiIb
         d31g6PMAhUYBBYeKE35mtLKusBHLQhUTkK8vd82lE6f4NiC46hYclYD3j9tewH/T/o
         jIXLllVcCrmhoj8hpLrtEggwIH0WSqi4TG7S/fAjH1iyA6i+LlEG3FPTwuSE9R3FNV
         PUVGLHoJ9tIu0r152qY/oFca4G8PVkV07CkWAVmxc0X5TfiW618/QyUPvY7F6OU76x
         HkrSSSQ55yFXQ==
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
Subject: [PATCH v1 07/18] dt-bindings: mailbox: mediatek,gce-mailbox: Add compatible for MT6795
Date:   Fri, 24 Mar 2023 18:54:45 +0100
Message-Id: <20230324175456.219954-8-angelogioacchino.delregno@collabora.com>
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

Add a compatible string for the MT6795 Helio X10 SoC which: this SoC
can use MT8173 bindings.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../mailbox/mediatek,gce-mailbox.yaml         | 20 +++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
index d383b2ab3ce8..cef9d7601398 100644
--- a/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
+++ b/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
@@ -16,14 +16,18 @@ description:
 
 properties:
   compatible:
-    enum:
-      - mediatek,mt6779-gce
-      - mediatek,mt8173-gce
-      - mediatek,mt8183-gce
-      - mediatek,mt8186-gce
-      - mediatek,mt8188-gce
-      - mediatek,mt8192-gce
-      - mediatek,mt8195-gce
+    oneOf:
+      - enum:
+          - mediatek,mt6779-gce
+          - mediatek,mt8173-gce
+          - mediatek,mt8183-gce
+          - mediatek,mt8186-gce
+          - mediatek,mt8188-gce
+          - mediatek,mt8192-gce
+          - mediatek,mt8195-gce
+      - items:
+          - const: mediatek,mt6795-gce
+          - const: mediatek,mt8173-gce
 
   "#mbox-cells":
     const: 2
-- 
2.40.0

