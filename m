Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B47166ADEF6
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Mar 2023 13:41:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229927AbjCGMl1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Mar 2023 07:41:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229699AbjCGMlU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Mar 2023 07:41:20 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FA777B985
        for <linux-i2c@vger.kernel.org>; Tue,  7 Mar 2023 04:41:18 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id q16so11986021wrw.2
        for <linux-i2c@vger.kernel.org>; Tue, 07 Mar 2023 04:41:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678192876;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y2OOo+pfMehtdt61ClnrNN4eJg07+4uqh4vAlRtdVDM=;
        b=t+iCrtVwYmXqVdAOWAa7/XjG7gzjZ1vHvBnEMS2znGVTMyY/buNzrsP8/TIwW0iy5A
         zjpZ/Lvp96EimEV4FcrjOQkEgmoYTtNy41KE4E0PDzFmlPUwLxzCPIVixOpiCDf+Mqo3
         yblCliPsP5zKKFVn+L22jzucDeSuNs+7PUw8/EbKnbjwLciA6/wzNYulZ4vJsZOzEauF
         bvmrKczEh5fWp+1N0BPnhTsomwoelVr5vpPM/mzppRF9eKGHgEHG2AT3ghasCGIccV3p
         UlFp/JXPaHa87Qe7fW8/uZDcV4CGp4zCzgDEUMI8KMLlT6lpcN1BIkZg8cR7+vM3OKkZ
         aFlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678192876;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y2OOo+pfMehtdt61ClnrNN4eJg07+4uqh4vAlRtdVDM=;
        b=k92fmRBEAGcLp2zdvzK/Wp3pwPN7gn7wjsexYBLf3UeyOD/2VD6WO2+j6a0/fsl7EL
         zuPItuKrIfNe8OzKAtde0FlfpyxDbVQGoSIe9USphpoefMN/8ZB6TcNLQG6x3mx/haNs
         CWBebnwebEwhaYU8Kwr/ZOwy4GRFH0R6TJAaGOy+modtjZzttttmkBoceb8aGT4FSVgh
         /lKhgS6O67AtmeBxGbZyA13q7bl8c/D1tiIQLS3qGwL2cv987w4jxU/fj3xAmeCd5JP8
         eMYbLLRx2AqwEwwEB2YGqi/snN2ZtZV0RCW4tVG7bkXcWjMaSw4/6lVwSuSmiU40MgfS
         WTdw==
X-Gm-Message-State: AO0yUKX5HFztTQWVe8HfHv1h6OEJzWiYdZz+kfKunFQqZ+LqT+oBdGC1
        /+fdthNDyRkzKHLmhn3BmDGX/A==
X-Google-Smtp-Source: AK7set/+NNqSqU0bfdG9m+kpc/KOAP/7Ta2xFg2yAgQeYkWjx5v4TAuJO8pie/okaqgvHEAPq6s30w==
X-Received: by 2002:a5d:5746:0:b0:2c9:5dd8:2978 with SMTP id q6-20020a5d5746000000b002c95dd82978mr9414849wrw.59.1678192876653;
        Tue, 07 Mar 2023 04:41:16 -0800 (PST)
Received: from [127.0.1.1] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id w9-20020a05600018c900b002c5a1bd5280sm12434670wrq.95.2023.03.07.04.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 04:41:16 -0800 (PST)
From:   Alexandre Mergnat <amergnat@baylibre.com>
Date:   Tue, 07 Mar 2023 13:41:07 +0100
Subject: [PATCH v4 1/2] arm64: dts: mediatek: add i2c support for mt8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221122-mt8365-i2c-support-v4-1-885ad3301d5a@baylibre.com>
References: <20221122-mt8365-i2c-support-v4-0-885ad3301d5a@baylibre.com>
In-Reply-To: <20221122-mt8365-i2c-support-v4-0-885ad3301d5a@baylibre.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Qii Wang <qii.wang@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        devicetree@vger.kernel.org,
        Alexandre Mergnat <amergnat@baylibre.com>,
        Fabien Parent <fparent@baylibre.com>,
        Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2699; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=u+MtjyWPgh4jPQn4QvtpwirJ4T/DfAOJHsOpg52IJ9U=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkBzDqCiWuVUZenZTJHFBYtVy0B5IyQnJXC+uVZ9IP
 OirqWTuJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZAcw6gAKCRArRkmdfjHURT4AD/
 9wYMx1vHjoOrKmlL7xjPDPSTvpxLJZf/NXsVj37zs7wt+ueBvxUem49Dxy1ChEA0UEip6Tt0x8r4tR
 Kd7nC8peqX2AoLfK7HFkiQ1QL8y1r1WC/IRQZofDQAwri2iN2TcTCaxKBiRttPQikbRycbw6xoR1Rq
 YvotJdmNGUOzxpi0lIURHfkWFSBG/2eNJRAr5cRXrxv1PkgXl7nGSNSNQU10P2pkXTA3+oE2FqxizR
 GGQNhUqN0PSzwnC3PsZomQgFCLnh+jj+yWgk3Ju6jSiDPdWFMYygAH7XiFtSNH6FrlODYqSDUZbiaC
 w3rRYdc25p47Q5W9d48jNpVvVguNx793pdG1Xqig5iYkGOID8+dJkza1mqQDSU/DB+R7PHt2WWxSNu
 kZlpVXSqgijHOqbYEE9jiKLSClpqHuKE10iODGIaYpQfVpCiNXNf+Ejz+iWdvuxguul+ta23esEnMU
 DVx9B5rcigh3xVI3nUOfybn8GqU+MCjHma5+m/bLOmIMHA4Ih3dh6PwT+laGOen53v/mH+jN9R1mLu
 XRcnvzSsk9v+FSW0b+yMeR8+6+mo4kRxtMhSbFho1HDCtbDdtGhcTf3fbHuI9/CfwNwnbAZgwnObPp
 bcLHAx37v+aHN4V1Q4UX8jT4Xe4WFNMj0yiu90hzQaqkKmUG//rn7BJlxAvg==
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
b4 0.10.1
