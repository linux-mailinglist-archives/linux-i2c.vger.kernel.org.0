Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42AA67E5454
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Nov 2023 11:47:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344755AbjKHKra (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Nov 2023 05:47:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344721AbjKHKqd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Nov 2023 05:46:33 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0003A2D66
        for <linux-i2c@vger.kernel.org>; Wed,  8 Nov 2023 02:44:52 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2c54c8934abso94890261fa.0
        for <linux-i2c@vger.kernel.org>; Wed, 08 Nov 2023 02:44:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699440291; x=1700045091; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lIuqvMhs71eYXo16i4dI05JAYajmCjaEEymf+9xK3uE=;
        b=rADoHBqy9B2NFpmm2AD4YnRymXXK9o5+c3/zb16DXCRz8m9rJpetZ0kOl5HTryzP3W
         Qq7xXOsipMKDhz6yeI8JSrSgCZGQvBJ8zqpsCt1k7PLeNZ72VxlaGYGanHXhNJt3UecG
         68kx/i4PfwmrljAHhoC7qNvjmXB2OgrR3kbzP/eyDvVZBHg818XZNPOTvGFJ6E+IKUb4
         +QSF3f53HPdanFosHDv3LaYmIdHPcnLARj4nHi+z1oaUzZ/q8vw4hlBMSuwswvZ/b2Z0
         37+qIy8lw6nCBi2kQNqn9xplqKoK6Qz5AJC/CvypQ5mjEqnj8+RPsOWF4e5heOHS3pML
         +cqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699440291; x=1700045091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lIuqvMhs71eYXo16i4dI05JAYajmCjaEEymf+9xK3uE=;
        b=CyKrZ3z8KTTZ1kQsZ7p4v1J5hthskE7Gmgn80J2Yg7wnVmmlvIzP32B7AUgXd5B/1z
         mgmZNYQ//G1IQHG1mL3JrdGJ9DCsNhG9AhR9QH2a6s3PYCenY8ny7HmYpckOB7A/9MZP
         noPKgeHhGozNwObkcFUaNy6IlSbvIQ12fZATOkFVYkn2Uzfgh5+/aHwLQYeJAcyPR9Ii
         bGfGLHQIb6RFK+kTY/UOSWnK6ezLE3i5Iqukgrlk1b0cXDJN3ftdlbi+OJY86O1T5H2j
         QWPXHFefUqBPo51WC1opRySDazE5v73Npw3lyCEZkTUAvymMGeVhsETeztTe2RqAMfFR
         Yl7w==
X-Gm-Message-State: AOJu0YyUZ9AW9+h2Ok5sJRqFZOiWkeBru6HSjwkcdIUBhGydhkXk46Xy
        4hKovDVjZ1njFBRAva8FIKwRhg==
X-Google-Smtp-Source: AGHT+IEpjzXW4St54OwBArdFNLWFpsjL9lIlOCbh2aFklEgTq0PSNZVUVbpEosKWvcHE/nb/BmMPDA==
X-Received: by 2002:a2e:bb01:0:b0:2b6:a804:4cc with SMTP id v1-20020a2ebb01000000b002b6a80404ccmr995286lje.53.1699440291307;
        Wed, 08 Nov 2023 02:44:51 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id fj12-20020a05600c0c8c00b004094c5d92bdsm19377377wmb.31.2023.11.08.02.44.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 02:44:50 -0800 (PST)
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
Subject: [PATCH 15/17] arm64: dts: exynos7885: add specific compatibles to several blocks
Date:   Wed,  8 Nov 2023 11:43:41 +0100
Message-Id: <20231108104343.24192-16-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
References: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Exynos7885 reuses several devices from older designs, thus historically
we kept the old (block's) compatible only.  This works fine and there is
no bug here, however guidelines expressed in
Documentation/devicetree/bindings/writing-bindings.rst state that:
1. Compatibles should be specific.
2. We should add new compatibles in case of bugs or features.

Add compatibles specific to Exynos7885 in front of all old-SoC-like
compatibles.  This will also help reviews of new code using existing
DTS as template.  No functional impact on Linux drivers behavior.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/exynos/exynos7885.dtsi | 45 ++++++++++++++--------
 1 file changed, 30 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos7885.dtsi b/arch/arm64/boot/dts/exynos/exynos7885.dtsi
index d69fc2392bd0..008228fb319a 100644
--- a/arch/arm64/boot/dts/exynos/exynos7885.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos7885.dtsi
@@ -172,7 +172,8 @@ soc: soc@0 {
 		ranges = <0x0 0x0 0x0 0x20000000>;
 
 		chipid@10000000 {
-			compatible = "samsung,exynos850-chipid";
+			compatible = "samsung,exynos7885-chipid",
+				     "samsung,exynos850-chipid";
 			reg = <0x10000000 0x24>;
 		};
 
@@ -264,7 +265,8 @@ pinctrl_alive: pinctrl@11cb0000 {
 			reg = <0x11cb0000 0x1000>;
 
 			wakeup-interrupt-controller {
-				compatible = "samsung,exynos7-wakeup-eint";
+				compatible = "samsung,exynos7885-wakeup-eint",
+					     "samsung,exynos7-wakeup-eint";
 				interrupt-parent = <&gic>;
 				interrupts = <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>;
 			};
@@ -289,12 +291,14 @@ pinctrl_dispaud: pinctrl@148f0000 {
 		};
 
 		pmu_system_controller: system-controller@11c80000 {
-			compatible = "samsung,exynos7-pmu", "syscon";
+			compatible = "samsung,exynos7885-pmu",
+				     "samsung,exynos7-pmu", "syscon";
 			reg = <0x11c80000 0x10000>;
 		};
 
 		mmc_0: mmc@13500000 {
-			compatible = "samsung,exynos7-dw-mshc-smu";
+			compatible = "samsung,exynos7885-dw-mshc-smu",
+				     "samsung,exynos7-dw-mshc-smu";
 			reg = <0x13500000 0x2000>;
 			interrupts = <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
@@ -307,7 +311,8 @@ mmc_0: mmc@13500000 {
 		};
 
 		serial_0: serial@13800000 {
-			compatible = "samsung,exynos5433-uart";
+			compatible = "samsung,exynos7885-uart",
+				     "samsung,exynos5433-uart";
 			reg = <0x13800000 0x100>;
 			interrupts = <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>;
 			pinctrl-names = "default";
@@ -320,7 +325,8 @@ serial_0: serial@13800000 {
 		};
 
 		serial_1: serial@13810000 {
-			compatible = "samsung,exynos5433-uart";
+			compatible = "samsung,exynos7885-uart",
+				     "samsung,exynos5433-uart";
 			reg = <0x13810000 0x100>;
 			interrupts = <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>;
 			pinctrl-names = "default";
@@ -333,7 +339,8 @@ serial_1: serial@13810000 {
 		};
 
 		serial_2: serial@13820000 {
-			compatible = "samsung,exynos5433-uart";
+			compatible = "samsung,exynos7885-uart",
+				     "samsung,exynos5433-uart";
 			reg = <0x13820000 0x100>;
 			interrupts = <GIC_SPI 279 IRQ_TYPE_LEVEL_HIGH>;
 			pinctrl-names = "default";
@@ -346,7 +353,8 @@ serial_2: serial@13820000 {
 		};
 
 		i2c_0: i2c@13830000 {
-			compatible = "samsung,s3c2440-i2c";
+			compatible = "samsung,exynos7885-i2c",
+				     "samsung,s3c2440-i2c";
 			reg = <0x13830000 0x100>;
 			interrupts = <GIC_SPI 248 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
@@ -359,7 +367,8 @@ i2c_0: i2c@13830000 {
 		};
 
 		i2c_1: i2c@13840000 {
-			compatible = "samsung,s3c2440-i2c";
+			compatible = "samsung,exynos7885-i2c",
+				     "samsung,s3c2440-i2c";
 			reg = <0x13840000 0x100>;
 			interrupts = <GIC_SPI 249 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
@@ -372,7 +381,8 @@ i2c_1: i2c@13840000 {
 		};
 
 		i2c_2: i2c@13850000 {
-			compatible = "samsung,s3c2440-i2c";
+			compatible = "samsung,exynos7885-i2c",
+				     "samsung,s3c2440-i2c";
 			reg = <0x13850000 0x100>;
 			interrupts = <GIC_SPI 250 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
@@ -385,7 +395,8 @@ i2c_2: i2c@13850000 {
 		};
 
 		i2c_3: i2c@13860000 {
-			compatible = "samsung,s3c2440-i2c";
+			compatible = "samsung,exynos7885-i2c",
+				     "samsung,s3c2440-i2c";
 			reg = <0x13860000 0x100>;
 			interrupts = <GIC_SPI 251 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
@@ -398,7 +409,8 @@ i2c_3: i2c@13860000 {
 		};
 
 		i2c_4: i2c@13870000 {
-			compatible = "samsung,s3c2440-i2c";
+			compatible = "samsung,exynos7885-i2c",
+				     "samsung,s3c2440-i2c";
 			reg = <0x13870000 0x100>;
 			interrupts = <GIC_SPI 252 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
@@ -411,7 +423,8 @@ i2c_4: i2c@13870000 {
 		};
 
 		i2c_5: i2c@13880000 {
-			compatible = "samsung,s3c2440-i2c";
+			compatible = "samsung,exynos7885-i2c",
+				     "samsung,s3c2440-i2c";
 			reg = <0x13880000 0x100>;
 			interrupts = <GIC_SPI 253 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
@@ -424,7 +437,8 @@ i2c_5: i2c@13880000 {
 		};
 
 		i2c_6: i2c@13890000 {
-			compatible = "samsung,s3c2440-i2c";
+			compatible = "samsung,exynos7885-i2c",
+				     "samsung,s3c2440-i2c";
 			reg = <0x13890000 0x100>;
 			interrupts = <GIC_SPI 254 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
@@ -437,7 +451,8 @@ i2c_6: i2c@13890000 {
 		};
 
 		i2c_7: i2c@11cd0000 {
-			compatible = "samsung,s3c2440-i2c";
+			compatible = "samsung,exynos7885-i2c",
+				     "samsung,s3c2440-i2c";
 			reg = <0x11cd0000 0x100>;
 			interrupts = <GIC_SPI 255 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
-- 
2.34.1

