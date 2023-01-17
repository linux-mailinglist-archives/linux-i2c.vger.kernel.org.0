Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1976A66D8A8
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Jan 2023 09:50:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236255AbjAQIuH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Jan 2023 03:50:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236241AbjAQIt6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 17 Jan 2023 03:49:58 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D92FE1E9C1
        for <linux-i2c@vger.kernel.org>; Tue, 17 Jan 2023 00:49:55 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id c10-20020a05600c0a4a00b003db0636ff84so975787wmq.0
        for <linux-i2c@vger.kernel.org>; Tue, 17 Jan 2023 00:49:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UgoXPu1A6G8aOhAjG7a8w9p9zygyaf4s9I2TGoeTltI=;
        b=br0AnOeqEeTM0zui1xtg65KTyJzkss2Hnbj0igYV+z0AGaL3ZPigHUjl7LH+iLh9s1
         UOB99NxhPyHnEsOZVigJagAIQdCNDM2VGavpVH2lMZ3z+yD6qwJEyMoveeDWBxbUqK1F
         ZKd6b348eIeht3C4jJGN/IKf7ngNYLfIvhM+kYHnXHC3NiJwyEm8Fr6ePhAtv0EJDw9+
         0lLq1byDElzyt9jUJUycc2iMsgzJFGfmU80f3gJS/4PvmB58O80F1a2Pi/2l5im6rhd8
         MA+/y6l65ytx5H5LPYhF4dATSTXFK61F+/PKAoEaAe0AOW9chItrcYys7vlS4nVfIBrg
         pn4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UgoXPu1A6G8aOhAjG7a8w9p9zygyaf4s9I2TGoeTltI=;
        b=s4epMSUBkxgkvUOrIqKKqFJPiGKBzjSJc3P2qZArwN8IxtpBjnYjDWuYqGTttjDNBB
         XdAwHeq12L6K1Gp0impDGBRmkT1xaJZHsIR3St8TqJIZ7vD/Q2wSU1wzDTGFD2x7sVTz
         To9azhpvjquOPG8uIi1tPyViJRkDJx1agUOJYJ8wScTUcZN91vNQ2fHVEoyAx8EAvsmv
         Y3RSOXKS339eW12d5BD3+2RSQ12xPIZE23wkJanDz/8rD5HzEHgVpTIiYfYNXfFAMHJn
         hQegFdGoM488YFazNaH+Dq8qCbpWwCSfrAg6n3l8GT1F33e2gsxyjUWy161kR0F9JpgP
         q8Aw==
X-Gm-Message-State: AFqh2krZtUvgY8SUUPCAJSl6W9DxzrJr75AJS9eeEcGoq9UBl5uHRjgN
        zWUpIY7YLVtGq0peSGEmw6I7kGAxJcfsFeh9
X-Google-Smtp-Source: AMrXdXuDwjuQIJ9bVydfzGqKXubMAUmMY5yYYHElltf5Pc0ST63jYYv8z3loNVA4Fd2I2eGFzTk8WQ==
X-Received: by 2002:a05:600c:4928:b0:3da:909f:1f6b with SMTP id f40-20020a05600c492800b003da909f1f6bmr2465111wmp.1.1673945394216;
        Tue, 17 Jan 2023 00:49:54 -0800 (PST)
Received: from [127.0.1.1] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id i14-20020a05600c354e00b003d1d5a83b2esm45040928wmq.35.2023.01.17.00.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 00:49:53 -0800 (PST)
From:   Alexandre Mergnat <amergnat@baylibre.com>
Date:   Tue, 17 Jan 2023 09:49:40 +0100
Subject: [PATCH 2/4] arm64: dts: mediatek: add i2c support for mt8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221122-mt8365-i2c-support-v1-2-4aeb7c54c67b@baylibre.com>
References: <20221122-mt8365-i2c-support-v1-0-4aeb7c54c67b@baylibre.com>
In-Reply-To: <20221122-mt8365-i2c-support-v1-0-4aeb7c54c67b@baylibre.com>
To:     Rob Herring <robh+dt@kernel.org>, Qii Wang <qii.wang@mediatek.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     linux-i2c@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Fabien Parent <fparent@baylibre.com>,
        linux-arm-kernel@lists.infradead.org,
        Alexandre Mergnat <amergnat@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2508; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=pLPRl4jPAYZIqf1fe/JXLH5pg1d46bBPCeqWhQgjHKU=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBjxmEucJi1q1NdT5HmNXnp5kIxA1c+e049A9ok+evg
 5QXuV6uJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCY8ZhLgAKCRArRkmdfjHURVrmD/
 4gskZjdw09f2tZ7bUHTkY/CVV7XUZSvc78gwOs2ISy6/sqNimRoXdAbaoO1qZEnZA8x73UFSv2cnNi
 +5FANiQKHS47maGYzC2OIaMnxsmhy8KvLsvsmgt45YoEb8t0LW5Erq8eYEWlB0qW4XzcfMloK2DZBo
 NkTlDS65SDy2FvvGJOyhmSXS0RGUzjnFz2AXv9ATc30Ne3VCoWdMn8t4kdESqovn4qWcxpAspbEX9S
 /vb/CeAquacvmUw90GvgcmZ7lOYWMlir36wYnHRrvpkEEwkhT9ibp4fRljjS9AHD9HvsJBV8aBvlJr
 nq9BkyYFSpmpnJhvDrmDiYlPjJ/uLM8urevXr95JSLe9hL03WuS/NcVgft99n081xCJ6da44ERbDrN
 MwcIeb0Qp78Guz6iICSbmkr0IChMmfZTeSm06oWPL63yLAzA2IbFCqIbe0H0a9CEW8c6k3VVMZAF7X
 5AhvgKdFJyHKaKlHpkl98w02jfFPRIKSKve0BN3Do0GwmfgicJSDded41vqU9vJ6gMPOvWe7wqVqsg
 Jllv4HfdHSwJFNwsONhbi+jbEPMzxFIFHdxK7A5GyS23UawCdMu9yeth4hWlSN7TO0zd4otLV69q52
 VqcBsbxU2S3VwSZLVsv5piHR5MIGFrontdbYQKgIiU5nwWCzvRK2LU7+0sfw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

There are four I2C master channels in MT8365 with a same HW architecture.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365.dtsi | 60 ++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
index a32f2b7507be..3c2819bd32af 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
@@ -282,6 +282,66 @@ pwm: pwm@11006000 {
 			clock-names = "top", "main", "pwm1", "pwm2", "pwm3";
 		};
 
+		i2c0: i2c@11007000 {
+			compatible = "mediatek,mt8365-i2c",
+				     "mediatek,mt8168-i2c";
+			reg = <0 0x11007000 0 0xa0>,
+			      <0 0x11000080 0 0x80>;
+			interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_LOW>;
+			clock-div = <1>;
+			clocks = <&infracfg CLK_IFR_I2C0_AXI>,
+				 <&infracfg CLK_IFR_AP_DMA>;
+			clock-names = "main", "dma";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c1: i2c@11008000 {
+			compatible = "mediatek,mt8365-i2c",
+				     "mediatek,mt8168-i2c";
+			reg = <0 0x11008000 0 0xa0>,
+			      <0 0x11000100 0 0x80>;
+			interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_LOW>;
+			clock-div = <1>;
+			clocks = <&infracfg CLK_IFR_I2C1_AXI>,
+				 <&infracfg CLK_IFR_AP_DMA>;
+			clock-names = "main", "dma";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c2: i2c@11009000 {
+			compatible = "mediatek,mt8365-i2c",
+				     "mediatek,mt8168-i2c";
+			reg = <0 0x11009000 0 0xa0>,
+			      <0 0x11000180 0 0x80>;
+			interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_LOW>;
+			clock-div = <1>;
+			clocks = <&infracfg CLK_IFR_I2C2_AXI>,
+				 <&infracfg CLK_IFR_AP_DMA>;
+			clock-names = "main", "dma";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c3: i2c@1100f000 {
+			compatible = "mediatek,mt8365-i2c",
+				     "mediatek,mt8168-i2c";
+			reg = <0 0x1100f000 0 0xa0>,
+			      <0 0x11000200 0 0x80>;
+			interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_LOW>;
+			clock-div = <1>;
+			clocks = <&infracfg CLK_IFR_I2C3_AXI>,
+				 <&infracfg CLK_IFR_AP_DMA>;
+			clock-names = "main", "dma";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		spi: spi@1100a000 {
 			compatible = "mediatek,mt8365-spi", "mediatek,mt7622-spi";
 			reg = <0 0x1100a000 0 0x100>;

-- 
b4 0.10.1
