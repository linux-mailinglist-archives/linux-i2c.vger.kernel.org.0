Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29B087E5458
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Nov 2023 11:47:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344613AbjKHKrp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Nov 2023 05:47:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344668AbjKHKqw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Nov 2023 05:46:52 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA8282D77
        for <linux-i2c@vger.kernel.org>; Wed,  8 Nov 2023 02:44:56 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-40838915cecso49177975e9.2
        for <linux-i2c@vger.kernel.org>; Wed, 08 Nov 2023 02:44:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699440295; x=1700045095; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OiAO0adnMyNF0SV0wXdB73+0Srf6bBOK8Pyx7Wvcg2U=;
        b=y0oFPVgAkbxHaAB1H7XF/QyrTxLpStfUN9vHee+oQAr63Y1WKDUP5UH+WJg76AeLu6
         piTgwWF3IuL7S4ui2js9VqDPGcT0lc1OsVaec1zRo+5JXV4g2RUVxO7iWHb7v0k6yh6Z
         /K2s+uJmeTYM/bQnS1QDPrAkPGJ7+vCMUjCyQzIy5k2NEOorc2X+oQ4hy2Nkk047NBGo
         Z/DQIyRobDVXjY6W7SpUFety9odU832+XP1X3gI+9QpfvPLTpN7BoZtMbhzt30lPquMe
         UQTxFyzjcFKnB4O6WxC1lOZlEu0sj5UuTr3OPUkmM8IC1DgbXeyREVGoI331OzXwF6oU
         eMSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699440295; x=1700045095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OiAO0adnMyNF0SV0wXdB73+0Srf6bBOK8Pyx7Wvcg2U=;
        b=JipgTi1w4LvEKKdvwArDgmJpYy38V8Z8BGYWVNWMvZN/ku1M7jUK3cTaAl81jog8RS
         1DJCE/H7lDFENDc0PDJzYQCznxOwMCetQsQJE517U8xS09qcAeIlUPBS/KWe2Tzfevfl
         7JVBCSsor8WlfzJbo65LtivKOUMNmvygcoe2jRCzMxi6UfbhurAfLeLs/LKF7KT9ASJm
         VWLVQ8gokENQcqhCsmgZGVpc/ytbzCMBW9BKgFfGQVCGMVByrLb9tFbTwEBhUzhS+iqB
         tf6bDEaL7eAYXFz65jC+u9rM/t6ym0a7kOh4cVsLIVjUSvm+dSqNb7jMQaepeHeWrh7O
         41jQ==
X-Gm-Message-State: AOJu0YxNiNusMyZsaxCD/HTSILSN4/96h+mU2DEw1bVzlNwL4pwASK/o
        5VjWKcc4aeKuaAr2l7YMnyhjeQ==
X-Google-Smtp-Source: AGHT+IFMjHNlMfI+x+SLTi21K9VV//VF9yXBQvAS9XyT4BRmKii2VKYmn0LzJzdq1styizIpZ4+txQ==
X-Received: by 2002:a05:600c:46d1:b0:405:49aa:d578 with SMTP id q17-20020a05600c46d100b0040549aad578mr1455335wmo.37.1699440295256;
        Wed, 08 Nov 2023 02:44:55 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id fj12-20020a05600c0c8c00b004094c5d92bdsm19377377wmb.31.2023.11.08.02.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 02:44:54 -0800 (PST)
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
Subject: [PATCH 16/17] arm64: dts: exynos850: add specific compatibles to several blocks
Date:   Wed,  8 Nov 2023 11:43:42 +0100
Message-Id: <20231108104343.24192-17-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
References: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Exynos850 reuses several devices from older designs, thus historically
we kept the old (block's) compatible only.  This works fine and there is
no bug here, however guidelines expressed in
Documentation/devicetree/bindings/writing-bindings.rst state that:
1. Compatibles should be specific.
2. We should add new compatibles in case of bugs or features.

Add compatibles specific to Exynos850 in front of all old-SoC-like
compatibles.  This will also help reviews of new code using existing
DTS as template.  No functional impact on Linux drivers behavior.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/exynos/exynos850.dtsi | 34 +++++++++++++----------
 1 file changed, 20 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
index 53104e65b9c6..df5ea43ebcad 100644
--- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
@@ -396,7 +396,7 @@ pinctrl_aud: pinctrl@14a60000 {
 		};
 
 		rtc: rtc@11a30000 {
-			compatible = "samsung,s3c6410-rtc";
+			compatible = "samsung,exynos850-rtc", "samsung,s3c6410-rtc";
 			reg = <0x11a30000 0x100>;
 			interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>;
@@ -406,7 +406,8 @@ rtc: rtc@11a30000 {
 		};
 
 		mmc_0: mmc@12100000 {
-			compatible = "samsung,exynos7-dw-mshc-smu";
+			compatible = "samsung,exynos850-dw-mshc-smu",
+				     "samsung,exynos7-dw-mshc-smu";
 			reg = <0x12100000 0x2000>;
 			interrupts = <GIC_SPI 452 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
@@ -419,7 +420,7 @@ mmc_0: mmc@12100000 {
 		};
 
 		i2c_0: i2c@13830000 {
-			compatible = "samsung,s3c2440-i2c";
+			compatible = "samsung,exynos850-i2c", "samsung,s3c2440-i2c";
 			reg = <0x13830000 0x100>;
 			interrupts = <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
@@ -432,7 +433,7 @@ i2c_0: i2c@13830000 {
 		};
 
 		i2c_1: i2c@13840000 {
-			compatible = "samsung,s3c2440-i2c";
+			compatible = "samsung,exynos850-i2c", "samsung,s3c2440-i2c";
 			reg = <0x13840000 0x100>;
 			interrupts = <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
@@ -445,7 +446,7 @@ i2c_1: i2c@13840000 {
 		};
 
 		i2c_2: i2c@13850000 {
-			compatible = "samsung,s3c2440-i2c";
+			compatible = "samsung,exynos850-i2c", "samsung,s3c2440-i2c";
 			reg = <0x13850000 0x100>;
 			interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
@@ -458,7 +459,7 @@ i2c_2: i2c@13850000 {
 		};
 
 		i2c_3: i2c@13860000 {
-			compatible = "samsung,s3c2440-i2c";
+			compatible = "samsung,exynos850-i2c", "samsung,s3c2440-i2c";
 			reg = <0x13860000 0x100>;
 			interrupts = <GIC_SPI 199 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
@@ -471,7 +472,7 @@ i2c_3: i2c@13860000 {
 		};
 
 		i2c_4: i2c@13870000 {
-			compatible = "samsung,s3c2440-i2c";
+			compatible = "samsung,exynos850-i2c", "samsung,s3c2440-i2c";
 			reg = <0x13870000 0x100>;
 			interrupts = <GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
@@ -485,7 +486,7 @@ i2c_4: i2c@13870000 {
 
 		/* I2C_5 (also called CAM_PMIC_I2C in TRM) */
 		i2c_5: i2c@13880000 {
-			compatible = "samsung,s3c2440-i2c";
+			compatible = "samsung,exynos850-i2c", "samsung,s3c2440-i2c";
 			reg = <0x13880000 0x100>;
 			interrupts = <GIC_SPI 201 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
@@ -499,7 +500,7 @@ i2c_5: i2c@13880000 {
 
 		/* I2C_6 (also called MOTOR_I2C in TRM) */
 		i2c_6: i2c@13890000 {
-			compatible = "samsung,s3c2440-i2c";
+			compatible = "samsung,exynos850-i2c", "samsung,s3c2440-i2c";
 			reg = <0x13890000 0x100>;
 			interrupts = <GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
@@ -640,7 +641,8 @@ usi_hsi2c_0: usi@138a00c0 {
 			status = "disabled";
 
 			hsi2c_0: i2c@138a0000 {
-				compatible = "samsung,exynosautov9-hsi2c";
+				compatible = "samsung,exynos850-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
 				reg = <0x138a0000 0xc0>;
 				interrupts = <GIC_SPI 193 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <1>;
@@ -668,7 +670,8 @@ usi_hsi2c_1: usi@138b00c0 {
 			status = "disabled";
 
 			hsi2c_1: i2c@138b0000 {
-				compatible = "samsung,exynosautov9-hsi2c";
+				compatible = "samsung,exynos850-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
 				reg = <0x138b0000 0xc0>;
 				interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <1>;
@@ -696,7 +699,8 @@ usi_hsi2c_2: usi@138c00c0 {
 			status = "disabled";
 
 			hsi2c_2: i2c@138c0000 {
-				compatible = "samsung,exynosautov9-hsi2c";
+				compatible = "samsung,exynos850-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
 				reg = <0x138c0000 0xc0>;
 				interrupts = <GIC_SPI 195 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <1>;
@@ -738,7 +742,8 @@ usi_cmgp0: usi@11d000c0 {
 			status = "disabled";
 
 			hsi2c_3: i2c@11d00000 {
-				compatible = "samsung,exynosautov9-hsi2c";
+				compatible = "samsung,exynos850-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
 				reg = <0x11d00000 0xc0>;
 				interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <1>;
@@ -778,7 +783,8 @@ usi_cmgp1: usi@11d200c0 {
 			status = "disabled";
 
 			hsi2c_4: i2c@11d20000 {
-				compatible = "samsung,exynosautov9-hsi2c";
+				compatible = "samsung,exynos850-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
 				reg = <0x11d20000 0xc0>;
 				interrupts = <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <1>;
-- 
2.34.1

