Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D3546C9E22
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Mar 2023 10:40:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233196AbjC0Ikr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Mar 2023 04:40:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233080AbjC0Ikd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Mar 2023 04:40:33 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C75B51BFE;
        Mon, 27 Mar 2023 01:36:55 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id C635C6602087;
        Mon, 27 Mar 2023 09:36:53 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1679906214;
        bh=DtLoKecTBQhhvopNsM7M95mpXjvK5USiGMoYC7Oej4w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=AMQLNfpdiOHJBlTfeyPx2aMe1IDW9rlMZzONNCG9rvabvwE11ZiBibQDljIzz/M7/
         ECOT/PqeHbC8yLfrD1QmcU3bu5nGG8gtMKKPonEPnsQ0OW9AqSEXder+q2PGv+nBp3
         di4YRaq6FdxJHAlQn9MKhzTjri+SvUxTXMUE5d3e9aeZKRMgt81uqSUaD12Exsp5Br
         FkL0OtV7FZV+zXP8xeVVj2P0qbe9dlu9LM//1vroUY1CRReZsFnF/rCwq/kWtJVcUq
         JshW+0eQ9eTKnTJrNGhwFKGxUrU0azqXWyyFyp3pYwx0gensR7wKdxWyc0Q9SiFo83
         l7UZYfM7dnLCw==
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
Subject: [PATCH v2 01/17] arm64: dts: mediatek: mt6795: Add Frequency Hopping Controller node
Date:   Mon, 27 Mar 2023 10:36:31 +0200
Message-Id: <20230327083647.22017-2-angelogioacchino.delregno@collabora.com>
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

Add FHCTL node but keep it disabled as the PLL clocks that should be
handled through FHCTL and the Spread Spectrum Clocking parameters are
board specific.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt6795.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
index b3fc76d837a9..4d2119751572 100644
--- a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
@@ -310,6 +310,12 @@ systimer: timer@10200670 {
 			clock-names = "clk13m";
 		};
 
+		fhctl: clock-controller@10209f00 {
+			compatible = "mediatek,mt6795-fhctl";
+			reg = <0 0x10209f00 0 0x100>;
+			status = "disabled";
+		};
+
 		gic: interrupt-controller@10221000 {
 			compatible = "arm,gic-400";
 			#interrupt-cells = <3>;
-- 
2.40.0

