Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 683F77E543B
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Nov 2023 11:46:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344681AbjKHKqx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Nov 2023 05:46:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344698AbjKHKqL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Nov 2023 05:46:11 -0500
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BE9A2D43
        for <linux-i2c@vger.kernel.org>; Wed,  8 Nov 2023 02:44:45 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2c509d5ab43so96584041fa.0
        for <linux-i2c@vger.kernel.org>; Wed, 08 Nov 2023 02:44:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699440284; x=1700045084; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7XOwiwLlGWwzo1fcvarNrGntQNCjtIurlLTEmeobqNc=;
        b=lgNZh7eF1oYI+7b9o6FGSGvMUlXLvDONG0cRJ2HEICmIWSoDV+LOKLI7rkoENSlhsq
         kst2PwV/8A1u7aKY7n/5hmEqzs3auvjdZBaJ3mf81XwYmAnh00/eDmhAxudDjv4CPlf9
         Ok6fHo6Xh7GZUK2xJ2yqHrUdJ5+R2bcdQrTETGdYxnHpN3eBxTqSl94zIlRj3Llt2MoM
         VIKpznou1Mi6hpU8eZEkvqn2Ql3a+pkb8NPxZuxf/eDly41Gioc+sBYX54xoAh8iXAHm
         UDE/1llaIbUgTgNiq0kABZYw5US87oyvoYhQSPZGUdm/Du1VCbmkEdFsI/Nyv0MGppel
         40TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699440284; x=1700045084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7XOwiwLlGWwzo1fcvarNrGntQNCjtIurlLTEmeobqNc=;
        b=TMC0bPro8gjT1CmuGmIOVXSytU9epWv+cimqxcsVm6HqDuXufz5vf8nCRDLKcUL/7B
         8GyMtAKmZi1IzFACVcsYfBm74G1nQfB0JRZOnmAjkIUP515n5Xv0a2DAAtU9AAbddatH
         7SDDN2N2E6YZDqUc8XqXjX0/ripSCpU9eRPBKIqcFhU9WjjnQoNDUROsXYQMBpsqHiin
         5x12nScAyPDCAku4a+ffqeG6vvf7/JUfB006EpAJkEEFrDM73uWRar2BR3f06Z2Gj2OK
         DBeLlaqoCwyuM5q8etIpGa0AbmUI5HhzGseUwGkW9/azyOg/8zvwAsM4+3rzKh630WZA
         s7rg==
X-Gm-Message-State: AOJu0YyngX2Q78f/IISOQfYcXQbetvDqytJWerSOMCUH1FIIjwZQiJ1c
        FAERiwSKYu2YtGp6Yu2oIIO40Q==
X-Google-Smtp-Source: AGHT+IESbxPeUCLTeikJQNGFmHnmOFAutizNUwXBUkuj+xWOb/MCfuu55UDgW62Bg1GWmoNi31nsiQ==
X-Received: by 2002:a2e:9545:0:b0:2c5:b583:f167 with SMTP id t5-20020a2e9545000000b002c5b583f167mr1212517ljh.34.1699440283774;
        Wed, 08 Nov 2023 02:44:43 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id fj12-20020a05600c0c8c00b004094c5d92bdsm19377377wmb.31.2023.11.08.02.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 02:44:43 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Lee Jones <lee@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaehoon Chung <jh80.chung@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-pwm@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 13/17] arm64: dts: exynos5433: add specific compatibles to several blocks
Date:   Wed,  8 Nov 2023 11:43:39 +0100
Message-Id: <20231108104343.24192-14-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
References: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Exynos5433 reuses several devices from older designs, thus historically
we kept the old (block's) compatible only.  This works fine and there is
no bug here, however guidelines expressed in
Documentation/devicetree/bindings/writing-bindings.rst state that:
1. Compatibles should be specific.
2. We should add new compatibles in case of bugs or features.

Add compatibles specific to Exynos5433 in front of all old-SoC-like
compatibles.  This will also help reviews of new code using existing
DTS as template.  No functional impact on Linux drivers behavior.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/exynos/exynos5433.dtsi | 60 ++++++++++++++--------
 1 file changed, 39 insertions(+), 21 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index 91ae0462a706..7fbbec04bff0 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -361,7 +361,8 @@ soc: soc@0 {
 		ranges = <0x0 0x0 0x0 0x18000000>;
 
 		chipid@10000000 {
-			compatible = "samsung,exynos4210-chipid";
+			compatible = "samsung,exynos5433-chipid",
+				     "samsung,exynos4210-chipid";
 			reg = <0x10000000 0x100>;
 		};
 
@@ -850,7 +851,8 @@ pinctrl_alive: pinctrl@10580000 {
 			reg = <0x10580000 0x1a20>, <0x11090000 0x100>;
 
 			wakeup-interrupt-controller {
-				compatible = "samsung,exynos7-wakeup-eint";
+				compatible = "samsung,exynos5433-wakeup-eint",
+					     "samsung,exynos7-wakeup-eint";
 				interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
 			};
 		};
@@ -1546,7 +1548,7 @@ spi_4: spi@14d00000 {
 		};
 
 		adc: adc@14d10000 {
-			compatible = "samsung,exynos7-adc";
+			compatible = "samsung,exynos5433-adc", "samsung,exynos7-adc";
 			reg = <0x14d10000 0x100>;
 			interrupts = <GIC_SPI 438 IRQ_TYPE_LEVEL_HIGH>;
 			clock-names = "adc";
@@ -1556,7 +1558,7 @@ adc: adc@14d10000 {
 		};
 
 		i2s1: i2s@14d60000 {
-			compatible = "samsung,exynos7-i2s";
+			compatible = "samsung,exynos5433-i2s", "samsung,exynos7-i2s";
 			reg = <0x14d60000 0x100>;
 			dmas = <&pdma0 31>, <&pdma0 30>;
 			dma-names = "tx", "rx";
@@ -1571,7 +1573,7 @@ i2s1: i2s@14d60000 {
 		};
 
 		pwm: pwm@14dd0000 {
-			compatible = "samsung,exynos4210-pwm";
+			compatible = "samsung,exynos5433-pwm", "samsung,exynos4210-pwm";
 			reg = <0x14dd0000 0x100>;
 			interrupts = <GIC_SPI 416 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 417 IRQ_TYPE_LEVEL_HIGH>,
@@ -1586,7 +1588,8 @@ pwm: pwm@14dd0000 {
 		};
 
 		hsi2c_0: i2c@14e40000 {
-			compatible = "samsung,exynos7-hsi2c";
+			compatible = "samsung,exynos5433-hsi2c",
+				     "samsung,exynos7-hsi2c";
 			reg = <0x14e40000 0x1000>;
 			interrupts = <GIC_SPI 428 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
@@ -1599,7 +1602,8 @@ hsi2c_0: i2c@14e40000 {
 		};
 
 		hsi2c_1: i2c@14e50000 {
-			compatible = "samsung,exynos7-hsi2c";
+			compatible = "samsung,exynos5433-hsi2c",
+				     "samsung,exynos7-hsi2c";
 			reg = <0x14e50000 0x1000>;
 			interrupts = <GIC_SPI 429 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
@@ -1612,7 +1616,8 @@ hsi2c_1: i2c@14e50000 {
 		};
 
 		hsi2c_2: i2c@14e60000 {
-			compatible = "samsung,exynos7-hsi2c";
+			compatible = "samsung,exynos5433-hsi2c",
+				     "samsung,exynos7-hsi2c";
 			reg = <0x14e60000 0x1000>;
 			interrupts = <GIC_SPI 430 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
@@ -1625,7 +1630,8 @@ hsi2c_2: i2c@14e60000 {
 		};
 
 		hsi2c_3: i2c@14e70000 {
-			compatible = "samsung,exynos7-hsi2c";
+			compatible = "samsung,exynos5433-hsi2c",
+				     "samsung,exynos7-hsi2c";
 			reg = <0x14e70000 0x1000>;
 			interrupts = <GIC_SPI 431 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
@@ -1638,7 +1644,8 @@ hsi2c_3: i2c@14e70000 {
 		};
 
 		hsi2c_4: i2c@14ec0000 {
-			compatible = "samsung,exynos7-hsi2c";
+			compatible = "samsung,exynos5433-hsi2c",
+				     "samsung,exynos7-hsi2c";
 			reg = <0x14ec0000 0x1000>;
 			interrupts = <GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
@@ -1651,7 +1658,8 @@ hsi2c_4: i2c@14ec0000 {
 		};
 
 		hsi2c_5: i2c@14ed0000 {
-			compatible = "samsung,exynos7-hsi2c";
+			compatible = "samsung,exynos5433-hsi2c",
+				     "samsung,exynos7-hsi2c";
 			reg = <0x14ed0000 0x1000>;
 			interrupts = <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
@@ -1664,7 +1672,8 @@ hsi2c_5: i2c@14ed0000 {
 		};
 
 		hsi2c_6: i2c@14ee0000 {
-			compatible = "samsung,exynos7-hsi2c";
+			compatible = "samsung,exynos5433-hsi2c",
+				     "samsung,exynos7-hsi2c";
 			reg = <0x14ee0000 0x1000>;
 			interrupts = <GIC_SPI 426 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
@@ -1677,7 +1686,8 @@ hsi2c_6: i2c@14ee0000 {
 		};
 
 		hsi2c_7: i2c@14ef0000 {
-			compatible = "samsung,exynos7-hsi2c";
+			compatible = "samsung,exynos5433-hsi2c",
+				     "samsung,exynos7-hsi2c";
 			reg = <0x14ef0000 0x1000>;
 			interrupts = <GIC_SPI 427 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
@@ -1690,7 +1700,8 @@ hsi2c_7: i2c@14ef0000 {
 		};
 
 		hsi2c_8: i2c@14d90000 {
-			compatible = "samsung,exynos7-hsi2c";
+			compatible = "samsung,exynos5433-hsi2c",
+				     "samsung,exynos7-hsi2c";
 			reg = <0x14d90000 0x1000>;
 			interrupts = <GIC_SPI 443 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
@@ -1703,7 +1714,8 @@ hsi2c_8: i2c@14d90000 {
 		};
 
 		hsi2c_9: i2c@14da0000 {
-			compatible = "samsung,exynos7-hsi2c";
+			compatible = "samsung,exynos5433-hsi2c",
+				     "samsung,exynos7-hsi2c";
 			reg = <0x14da0000 0x1000>;
 			interrupts = <GIC_SPI 444 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
@@ -1716,7 +1728,8 @@ hsi2c_9: i2c@14da0000 {
 		};
 
 		hsi2c_10: i2c@14de0000 {
-			compatible = "samsung,exynos7-hsi2c";
+			compatible = "samsung,exynos5433-hsi2c",
+				     "samsung,exynos7-hsi2c";
 			reg = <0x14de0000 0x1000>;
 			interrupts = <GIC_SPI 445 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
@@ -1729,7 +1742,8 @@ hsi2c_10: i2c@14de0000 {
 		};
 
 		hsi2c_11: i2c@14df0000 {
-			compatible = "samsung,exynos7-hsi2c";
+			compatible = "samsung,exynos5433-hsi2c",
+				     "samsung,exynos7-hsi2c";
 			reg = <0x14df0000 0x1000>;
 			interrupts = <GIC_SPI 446 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
@@ -1820,7 +1834,8 @@ usbhost_dwc3: usb@0 {
 		};
 
 		mshc_0: mmc@15540000 {
-			compatible = "samsung,exynos7-dw-mshc-smu";
+			compatible = "samsung,exynos5433-dw-mshc-smu",
+				     "samsung,exynos7-dw-mshc-smu";
 			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -1833,7 +1848,8 @@ mshc_0: mmc@15540000 {
 		};
 
 		mshc_1: mmc@15550000 {
-			compatible = "samsung,exynos7-dw-mshc-smu";
+			compatible = "samsung,exynos5433-dw-mshc-smu",
+				     "samsung,exynos7-dw-mshc-smu";
 			interrupts = <GIC_SPI 226 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -1846,7 +1862,8 @@ mshc_1: mmc@15550000 {
 		};
 
 		mshc_2: mmc@15560000 {
-			compatible = "samsung,exynos7-dw-mshc-smu";
+			compatible = "samsung,exynos5433-dw-mshc-smu",
+				     "samsung,exynos7-dw-mshc-smu";
 			interrupts = <GIC_SPI 227 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -1897,7 +1914,8 @@ adma: dma-controller@11420000 {
 			};
 
 			i2s0: i2s@11440000 {
-				compatible = "samsung,exynos7-i2s";
+				compatible = "samsung,exynos5433-i2s",
+					     "samsung,exynos7-i2s";
 				reg = <0x11440000 0x100>;
 				dmas = <&adma 0>, <&adma 2>;
 				dma-names = "tx", "rx";
-- 
2.34.1

