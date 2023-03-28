Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 026386CBA03
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Mar 2023 11:05:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232371AbjC1JFH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 Mar 2023 05:05:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230444AbjC1JFF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 28 Mar 2023 05:05:05 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 583D04EE8
        for <linux-i2c@vger.kernel.org>; Tue, 28 Mar 2023 02:05:03 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id v1so11355469wrv.1
        for <linux-i2c@vger.kernel.org>; Tue, 28 Mar 2023 02:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1679994302;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JqhIf7wHsvu3kZClALu/ZsQ43yPjSHEDO4Bh0IFxfIc=;
        b=kSTUngGbd0x2rICWSwKqHBDxwwZwUqBr3JtNVGGONj1jRj24D0rImM/g4be0T0YjZs
         USUb/3lv0YOjsBdcXat/eGnwpOTfONZTF3QmR8nHEYJDy5U88VuFIlQQFSsFXss46b9v
         ZH2HDy37IJp25e1Xvkwdr7U3PtpMZsuaqtZwnP7/pbZAUXT/YYkNSFxD4FP0nqijM3ZH
         IC3iUQz8UlBAa/MiMBO6QaYzO024AQB7hkbciheNCcrF5HsyabyjrB7Hv1Gknp9W0UlT
         0jPPmAVi39YZa8SDWOX9SRnDZFm/hMKJiR+VHLaAg02zmTfHAj32vjJi7d0DHN6oCns+
         tOaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679994302;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JqhIf7wHsvu3kZClALu/ZsQ43yPjSHEDO4Bh0IFxfIc=;
        b=fr8dgNP1Jym529nrvIl0DfJpegLzZT2jNNnf0xObusI7CTptmcA0fJZV7rcSSVAdyn
         NpwzIwyYanMzHjgrREhCMn+YurSMr8/8gVEtPmPNcYSLDVvKkPnw6Nb9FbineguHLKoH
         6IAnCtdjifBrCGf+a7Jp467wGIVkQKNfFvCx1pyEHiUC2CfGCn9e2CwlvO1zGwgu4ztv
         MIcu4b5mp/UrpIm7xsd79at0hLGWZdzRQPCQdQNXY7p+LLzn/pbM69varOaBbxKdsMx/
         ZP+plsMq7LRK5zPYI2vopOc8eW23r9+w8q+dNdgjoCuaBMFWqJJfBejoNKR7j28hOcz4
         5PlA==
X-Gm-Message-State: AAQBX9c5o+B56UIec6siIXCNO9ns68zh8bUgyMPWdVX3xc3cOJGHB7zb
        6FACxnFJ2BXF/eVwsvgjVV8R8A==
X-Google-Smtp-Source: AKy350byL89JIjiOjxqBRHMtLnvi9g0Z+r/G3kxD/7mZHnJZ8HQ3SBI70fCbQHE89decSsBspr6HIw==
X-Received: by 2002:adf:f6c9:0:b0:2ce:a612:e3a5 with SMTP id y9-20020adff6c9000000b002cea612e3a5mr11695132wrp.50.1679994301835;
        Tue, 28 Mar 2023 02:05:01 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id j10-20020adff00a000000b002d1bfe3269esm27102109wro.59.2023.03.28.02.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 02:05:01 -0700 (PDT)
From:   Alexandre Mergnat <amergnat@baylibre.com>
Date:   Tue, 28 Mar 2023 11:04:47 +0200
Subject: [PATCH v6 1/2] arm64: dts: mediatek: add i2c support for mt8365
 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221122-mt8365-i2c-support-v6-1-e1009c8afd53@baylibre.com>
References: <20221122-mt8365-i2c-support-v6-0-e1009c8afd53@baylibre.com>
In-Reply-To: <20221122-mt8365-i2c-support-v6-0-e1009c8afd53@baylibre.com>
To:     Qii Wang <qii.wang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        Fabien Parent <fparent@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2696; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=751COW4mlyt6NiZw3ZmEVilTCKVZTkOYnz6i1pHU/mc=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkIq27A//D5eTADCDZW5waqfVl8NWE1cZPKo7QzgiC
 QRY+qwWJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZCKtuwAKCRArRkmdfjHURdKcD/
 9dklIQyjq2bmzwRR1bmW/+ucAFmmdbP+ueL5/JvJgO2UYTKs0dAUjRvVeAlRUimE/+1PRxlG9vmw6R
 W2HSHcsx2m0stXGqwqLUeSGoO7VO61cHl3CD4ksm1sw8BIXkGee+9guQwuCpvm+G43Qik20amAVn4k
 76j5WjfNGANer3cuTkBqFfcI2EpUy8G51UfKyfoBvHmy543aR0A8gccs4fptpVkcYqS7QF3q0xku9V
 Tb7icnO+irswsZGNe90mnAdzUPWf4cDlcLPH2AnddCHJ8F1jpeM804/cxzzi5zs51IL7hkg54TvkB8
 4e+1jWeV64d5BxhUL+rcnRE0S9AsovOq+X+Nc7Vfr7sLnjTMCwojclLcQ9I03fRNJ5fAGs1x5uMzfR
 V8DSU3Xgzt5BcFjDbFjHIJf31Y9UgMWLexRz41gJcaiudvPPK0B9gjsEij78LnLoQD5O40Au45+hpv
 nDJOX7PHM5GrzSw0aowSIFZQVmmAb1I7JqHZqmUh4UijJf/czUMi95xVmQ6neBEAhwc0/2qy1g7f0J
 B5vqq34XX/Iyr08yVdl2oU/TW0V5AM6uA4gnsVQuBwMnCSc1QnDhuRbtf/7tdU5TDpvtaxomYodWa0
 IE9TZtRb0iZR3iJBvgH+rRojySvGge/iZb2iWhmSnG8LnJfQRT3RZuD3Jniw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

There are four I2C master channels in MT8365 with a same HW architecture.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365.dtsi | 48 ++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
index 15ac4c1f0966..b70f4d256f63 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
@@ -282,6 +282,42 @@ pwm: pwm@11006000 {
 			clock-names = "top", "main", "pwm1", "pwm2", "pwm3";
 		};
 
+		i2c0: i2c@11007000 {
+			compatible = "mediatek,mt8365-i2c", "mediatek,mt8168-i2c";
+			reg = <0 0x11007000 0 0xa0>, <0 0x11000080 0 0x80>;
+			interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_LOW>;
+			clock-div = <1>;
+			clocks = <&infracfg CLK_IFR_I2C0_AXI>, <&infracfg CLK_IFR_AP_DMA>;
+			clock-names = "main", "dma";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c1: i2c@11008000 {
+			compatible = "mediatek,mt8365-i2c", "mediatek,mt8168-i2c";
+			reg = <0 0x11008000 0 0xa0>, <0 0x11000100 0 0x80>;
+			interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_LOW>;
+			clock-div = <1>;
+			clocks = <&infracfg CLK_IFR_I2C1_AXI>, <&infracfg CLK_IFR_AP_DMA>;
+			clock-names = "main", "dma";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c2: i2c@11009000 {
+			compatible = "mediatek,mt8365-i2c", "mediatek,mt8168-i2c";
+			reg = <0 0x11009000 0 0xa0>, <0 0x11000180 0 0x80>;
+			interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_LOW>;
+			clock-div = <1>;
+			clocks = <&infracfg CLK_IFR_I2C2_AXI>, <&infracfg CLK_IFR_AP_DMA>;
+			clock-names = "main", "dma";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		spi: spi@1100a000 {
 			compatible = "mediatek,mt8365-spi", "mediatek,mt7622-spi";
 			reg = <0 0x1100a000 0 0x100>;
@@ -295,6 +331,18 @@ spi: spi@1100a000 {
 			status = "disabled";
 		};
 
+		i2c3: i2c@1100f000 {
+			compatible = "mediatek,mt8365-i2c", "mediatek,mt8168-i2c";
+			reg = <0 0x1100f000 0 0xa0>, <0 0x11000200 0 0x80>;
+			interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_LOW>;
+			clock-div = <1>;
+			clocks = <&infracfg CLK_IFR_I2C3_AXI>, <&infracfg CLK_IFR_AP_DMA>;
+			clock-names = "main", "dma";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		ssusb: usb@11201000 {
 			compatible = "mediatek,mt8365-mtu3", "mediatek,mtu3";
 			reg = <0 0x11201000 0 0x2e00>, <0 0x11203e00 0 0x0100>;

-- 
2.25.1

