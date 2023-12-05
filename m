Return-Path: <linux-i2c+bounces-618-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41FA9804DB4
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Dec 2023 10:23:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 77197B20D7A
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Dec 2023 09:23:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCB373F8EA;
	Tue,  5 Dec 2023 09:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fkbZaldq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E817F1B6
	for <linux-i2c@vger.kernel.org>; Tue,  5 Dec 2023 01:22:50 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-40c09dfa03cso23618785e9.2
        for <linux-i2c@vger.kernel.org>; Tue, 05 Dec 2023 01:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701768169; x=1702372969; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ic+lMCTjLKoS5KBhhnqOhZn1klxqPT1vX3hBzFZYLC4=;
        b=fkbZaldqKPC6zsr6QLYOouE3OP/CSXAcl9bQY6E5ccEpWK0p4Gfi3GlK6GINf/ypDG
         411FNVwteZQLcwWAP5vB34Tl9pny6QmDrKxW0Y8teCGY4eA4+QFxHGwdlwfR3Bp2re6n
         G3L+bAMl8kgDphrghyadrfXxeOYJR2f6w5JsSnm9sPYaEFTLbBWlEJrEyEIHInHXXRZr
         K9PlLMAHBVyYUKGbcstODy8vtPpZxKHVA2sT+nId7MPWPRZNgygrCU2wJyuW8RIpUL2E
         A0MOmS5OXZOZvx2MVDyTUe0RSLcUO71gU7Sdx+14JT0w7whF1lSC1a8r3gDQUu3tt31a
         ZylA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701768169; x=1702372969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ic+lMCTjLKoS5KBhhnqOhZn1klxqPT1vX3hBzFZYLC4=;
        b=lRmCIgB9F+FvIRcK8m21h1nyTuXpjSvSUt1BO4UtnN38wwVdCTx84aq5J3NbKKvuMB
         AAY8tNk9g/mnRTJbRdnevWhcbjivGhCc1kGyMIC7R5HtNQbm1YLOMGvPsG7crEkjZ4VZ
         K5Xk+UTayMiFCesrr1VYycmfl1qjC5K5kWUYlIuq2iZ5OQOOfHZstRVzSPFj0NbYSHKx
         2ow+EpEP1kXW00DbNr9+N9nM0Q1jjAsTWOjZo5rceSMIzKqdOP+O2GZo1ikP5lQzXWrf
         k70faYUINBUhJLZcGAuQ5RbkF0/y+oh11qCwsMEeEh/VXs//IKUCCjyjvK5Ci3xUbQks
         ebRw==
X-Gm-Message-State: AOJu0YwjZuhzyFgyvK7Gmqc2Kpzz/z0OICxJ9ZYnVrT0k1z8X1QBrizj
	yoSxatlo+Hbd96fwiF6oR/jQgA==
X-Google-Smtp-Source: AGHT+IHfoP0ThFOjNsS+ibdhONyg8AlmPEXQCpblukDPZWzThPMdS6QotAP5FclOjbMTSVPpJ94S6w==
X-Received: by 2002:a05:600c:a05:b0:40c:503:24de with SMTP id z5-20020a05600c0a0500b0040c050324demr254274wmp.88.1701768169249;
        Tue, 05 Dec 2023 01:22:49 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id g10-20020a05600c4eca00b0040596352951sm21692287wmq.5.2023.12.05.01.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 01:22:48 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-fsd@tesla.com,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 6/6] arm64: dts: fsd: add specific compatibles for Tesla FSD
Date: Tue,  5 Dec 2023 10:22:29 +0100
Message-Id: <20231205092229.19135-7-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231205092229.19135-1-krzysztof.kozlowski@linaro.org>
References: <20231205092229.19135-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tesla FSD is a derivative of Samsung Exynos SoC, thus just like the
others it reuses several devices from older designs.  Historically we
kept the old (block's) compatible only.  This works fine and there is no
bug here, however guidelines expressed in
Documentation/devicetree/bindings/writing-bindings.rst state that:
1. Compatibles should be specific.
2. We should add new compatibles in case of bugs or features.

Add Tesla FSD compatible specific to be used with an existing fallback.
This will also help reviews of new code using existing DTS as template.
No functional impact on Linux drivers behavior.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

I propose to take the patch through Samsung SoC (me). See cover letter
for explanation.
---
 arch/arm64/boot/dts/tesla/fsd.dtsi | 32 +++++++++++++++---------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/tesla/fsd.dtsi b/arch/arm64/boot/dts/tesla/fsd.dtsi
index bb50a9f7db4a..9db162afc834 100644
--- a/arch/arm64/boot/dts/tesla/fsd.dtsi
+++ b/arch/arm64/boot/dts/tesla/fsd.dtsi
@@ -581,7 +581,7 @@ pdma1: dma-controller@14290000 {
 		};
 
 		serial_0: serial@14180000 {
-			compatible = "samsung,exynos4210-uart";
+			compatible = "tesla,fsd-uart", "samsung,exynos4210-uart";
 			reg = <0x0 0x14180000 0x0 0x100>;
 			interrupts = <GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH>;
 			dmas = <&pdma1 1>, <&pdma1 0>;
@@ -593,7 +593,7 @@ serial_0: serial@14180000 {
 		};
 
 		serial_1: serial@14190000 {
-			compatible = "samsung,exynos4210-uart";
+			compatible = "tesla,fsd-uart", "samsung,exynos4210-uart";
 			reg = <0x0 0x14190000 0x0 0x100>;
 			interrupts = <GIC_SPI 172 IRQ_TYPE_LEVEL_HIGH>;
 			dmas = <&pdma1 3>, <&pdma1 2>;
@@ -605,12 +605,12 @@ serial_1: serial@14190000 {
 		};
 
 		pmu_system_controller: system-controller@11400000 {
-			compatible = "samsung,exynos7-pmu", "syscon";
+			compatible = "tesla,fsd-pmu", "samsung,exynos7-pmu", "syscon";
 			reg = <0x0 0x11400000 0x0 0x5000>;
 		};
 
 		watchdog_0: watchdog@100a0000 {
-			compatible = "samsung,exynos7-wdt";
+			compatible = "tesla,fsd-wdt", "samsung,exynos7-wdt";
 			reg = <0x0 0x100a0000 0x0 0x100>;
 			interrupts = <GIC_SPI 471 IRQ_TYPE_LEVEL_HIGH>;
 			samsung,syscon-phandle = <&pmu_system_controller>;
@@ -619,7 +619,7 @@ watchdog_0: watchdog@100a0000 {
 		};
 
 		watchdog_1: watchdog@100b0000 {
-			compatible = "samsung,exynos7-wdt";
+			compatible = "tesla,fsd-wdt", "samsung,exynos7-wdt";
 			reg = <0x0 0x100b0000 0x0 0x100>;
 			interrupts = <GIC_SPI 472 IRQ_TYPE_LEVEL_HIGH>;
 			samsung,syscon-phandle = <&pmu_system_controller>;
@@ -628,7 +628,7 @@ watchdog_1: watchdog@100b0000 {
 		};
 
 		watchdog_2: watchdog@100c0000 {
-			compatible = "samsung,exynos7-wdt";
+			compatible = "tesla,fsd-wdt", "samsung,exynos7-wdt";
 			reg = <0x0 0x100c0000 0x0 0x100>;
 			interrupts = <GIC_SPI 473 IRQ_TYPE_LEVEL_HIGH>;
 			samsung,syscon-phandle = <&pmu_system_controller>;
@@ -637,7 +637,7 @@ watchdog_2: watchdog@100c0000 {
 		};
 
 		pwm_0: pwm@14100000 {
-			compatible = "samsung,exynos4210-pwm";
+			compatible = "tesla,fsd-pwm", "samsung,exynos4210-pwm";
 			reg = <0x0 0x14100000 0x0 0x100>;
 			samsung,pwm-outputs = <0>, <1>, <2>, <3>;
 			#pwm-cells = <3>;
@@ -647,7 +647,7 @@ pwm_0: pwm@14100000 {
 		};
 
 		pwm_1: pwm@14110000 {
-			compatible = "samsung,exynos4210-pwm";
+			compatible = "tesla,fsd-pwm", "samsung,exynos4210-pwm";
 			reg = <0x0 0x14110000 0x0 0x100>;
 			samsung,pwm-outputs = <0>, <1>, <2>, <3>;
 			#pwm-cells = <3>;
@@ -657,7 +657,7 @@ pwm_1: pwm@14110000 {
 		};
 
 		hsi2c_0: i2c@14200000 {
-			compatible = "samsung,exynos7-hsi2c";
+			compatible = "tesla,fsd-hsi2c", "samsung,exynos7-hsi2c";
 			reg = <0x0 0x14200000 0x0 0x1000>;
 			interrupts = <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
@@ -670,7 +670,7 @@ hsi2c_0: i2c@14200000 {
 		};
 
 		hsi2c_1: i2c@14210000 {
-			compatible = "samsung,exynos7-hsi2c";
+			compatible = "tesla,fsd-hsi2c", "samsung,exynos7-hsi2c";
 			reg = <0x0 0x14210000 0x0 0x1000>;
 			interrupts = <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
@@ -683,7 +683,7 @@ hsi2c_1: i2c@14210000 {
 		};
 
 		hsi2c_2: i2c@14220000 {
-			compatible = "samsung,exynos7-hsi2c";
+			compatible = "tesla,fsd-hsi2c", "samsung,exynos7-hsi2c";
 			reg = <0x0 0x14220000 0x0 0x1000>;
 			interrupts = <GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
@@ -696,7 +696,7 @@ hsi2c_2: i2c@14220000 {
 		};
 
 		hsi2c_3: i2c@14230000 {
-			compatible = "samsung,exynos7-hsi2c";
+			compatible = "tesla,fsd-hsi2c", "samsung,exynos7-hsi2c";
 			reg = <0x0 0x14230000 0x0 0x1000>;
 			interrupts = <GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
@@ -709,7 +709,7 @@ hsi2c_3: i2c@14230000 {
 		};
 
 		hsi2c_4: i2c@14240000 {
-			compatible = "samsung,exynos7-hsi2c";
+			compatible = "tesla,fsd-hsi2c", "samsung,exynos7-hsi2c";
 			reg = <0x0 0x14240000 0x0 0x1000>;
 			interrupts = <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
@@ -722,7 +722,7 @@ hsi2c_4: i2c@14240000 {
 		};
 
 		hsi2c_5: i2c@14250000 {
-			compatible = "samsung,exynos7-hsi2c";
+			compatible = "tesla,fsd-hsi2c", "samsung,exynos7-hsi2c";
 			reg = <0x0 0x14250000 0x0 0x1000>;
 			interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
@@ -735,7 +735,7 @@ hsi2c_5: i2c@14250000 {
 		};
 
 		hsi2c_6: i2c@14260000 {
-			compatible = "samsung,exynos7-hsi2c";
+			compatible = "tesla,fsd-hsi2c", "samsung,exynos7-hsi2c";
 			reg = <0x0 0x14260000 0x0 0x1000>;
 			interrupts = <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
@@ -748,7 +748,7 @@ hsi2c_6: i2c@14260000 {
 		};
 
 		hsi2c_7: i2c@14270000 {
-			compatible = "samsung,exynos7-hsi2c";
+			compatible = "tesla,fsd-hsi2c", "samsung,exynos7-hsi2c";
 			reg = <0x0 0x14270000 0x0 0x1000>;
 			interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
-- 
2.34.1


