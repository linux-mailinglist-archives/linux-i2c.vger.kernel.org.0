Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7414F6C9E34
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Mar 2023 10:41:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233008AbjC0Iku (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Mar 2023 04:40:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233137AbjC0Ike (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Mar 2023 04:40:34 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74FE865B4;
        Mon, 27 Mar 2023 01:36:59 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 8EE8E66030DD;
        Mon, 27 Mar 2023 09:36:57 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1679906218;
        bh=+C19HY45yz9Sl0OrylkeSlqeTXjPBT2+I9ZB7T/mxXQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=iCkzaO8nVU6WnBTUXzyCKVukOLkI82GT8Xd0xJOhAjor/YkqoLQhDcFJlsE7jmuUX
         hQsyXj+fJu+8CldDi59Z5/mnvbZHh+3H+T4U6E0YBCWN/G4lLiDg7FrCIb59NdLuuj
         EYcnjwwoKygQNg926uJ7dhLXWyLa4nZrhstKFoFIKsCgPS/z5eAKG04y7x12LARPlI
         HCDyIA3wDOxUvJSibEWGRBrefVyaABWfTunMawJWPMwqX+GMQVlagKB9vqWm7kXb1o
         9v+Xb+MbaVJjITHZEQiS3pJpG46zwvkbb1pm/Hk0aWc6L9bth6hETt4AYSI9oGGENr
         LN2CVQKjzppww==
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
Subject: [PATCH v2 05/17] arm64: dts: mediatek: mt6795: Add nodes for I2C controllers
Date:   Mon, 27 Mar 2023 10:36:35 +0200
Message-Id: <20230327083647.22017-6-angelogioacchino.delregno@collabora.com>
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

Add all four I2C controller nodes but keep them in disabled state as
usage is board-dependant.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt6795.dtsi | 60 ++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
index 26d640e1bfb6..ceb6fc948d8a 100644
--- a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
@@ -445,6 +445,66 @@ uart3: serial@11005000 {
 			status = "disabled";
 		};
 
+		i2c0: i2c@11007000 {
+			compatible = "mediatek,mt6795-i2c", "mediatek,mt8173-i2c";
+			reg = <0 0x11007000 0 0x70>, <0 0x11000100 0 0x80>;
+			interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_LOW>;
+			clock-div = <16>;
+			clocks = <&pericfg CLK_PERI_I2C0>, <&pericfg CLK_PERI_AP_DMA>;
+			clock-names = "main", "dma";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c1: i2c@11008000 {
+			compatible = "mediatek,mt6795-i2c", "mediatek,mt8173-i2c";
+			reg = <0 0x11008000 0 0x70>, <0 0x11000180 0 0x80>;
+			interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_LOW>;
+			clock-div = <16>;
+			clocks = <&pericfg CLK_PERI_I2C1>, <&pericfg CLK_PERI_AP_DMA>;
+			clock-names = "main", "dma";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c2: i2c@11009000 {
+			compatible = "mediatek,mt6795-i2c", "mediatek,mt8173-i2c";
+			reg = <0 0x11009000 0 0x70>, <0 0x11000200 0 0x80>;
+			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_LOW>;
+			clock-div = <16>;
+			clocks = <&pericfg CLK_PERI_I2C2>, <&pericfg CLK_PERI_AP_DMA>;
+			clock-names = "main", "dma";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c3: i2c@11010000 {
+			compatible = "mediatek,mt6795-i2c", "mediatek,mt8173-i2c";
+			reg = <0 0x11010000 0 0x70>, <0 0x11000280 0 0x80>;
+			interrupts = <GIC_SPI 87 IRQ_TYPE_LEVEL_LOW>;
+			clock-div = <16>;
+			clocks = <&pericfg CLK_PERI_I2C3>, <&pericfg CLK_PERI_AP_DMA>;
+			clock-names = "main", "dma";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c4: i2c@11011000 {
+			compatible = "mediatek,mt6795-i2c", "mediatek,mt8173-i2c";
+			reg = <0 0x11011000 0 0x70>, <0 0x11000300 0 0x80>;
+			interrupts = <GIC_SPI 88 IRQ_TYPE_LEVEL_LOW>;
+			clock-div = <16>;
+			clocks = <&pericfg CLK_PERI_I2C4>, <&pericfg CLK_PERI_AP_DMA>;
+			clock-names = "main", "dma";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		mmc0: mmc@11230000 {
 			compatible = "mediatek,mt6795-mmc";
 			reg = <0 0x11230000 0 0x1000>;
-- 
2.40.0

