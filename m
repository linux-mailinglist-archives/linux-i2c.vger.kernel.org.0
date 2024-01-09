Return-Path: <linux-i2c+bounces-1239-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 038978286AB
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Jan 2024 14:02:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 871AEB24F92
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Jan 2024 13:01:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81BA13B2BE;
	Tue,  9 Jan 2024 12:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zel1JUE5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B773AC24
	for <linux-i2c@vger.kernel.org>; Tue,  9 Jan 2024 12:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-40d5336986cso38056995e9.1
        for <linux-i2c@vger.kernel.org>; Tue, 09 Jan 2024 04:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704805125; x=1705409925; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ndzvAtIphV3/MRhlh+roY7v2JbqJAf5pGogAL74MKKE=;
        b=zel1JUE5ru8qcQGqnsj4tTRAdM9+TD4SX1nq7G6N1BrAlOgzeSRB0TDM9UgQqJCZA3
         /9fNpwg5zfffOhhRTWolPNIeJmY203tvrfXe90brvA1zUKIrRNARMoHD04DYpwx+y8RX
         SYnc9HX0+G3jVRT5NRF4+64GMWmO91tGkIZZjRzA3KcHgh5usePeqU4rmeMOQL0mC1Eh
         380cO9ot9brLmLcAVrlOEs8m0uJlACq3MMRWvyaKevi+PwWIZHB4IkSrgb5rOLeKQs9U
         THwoVqS/9KsZdjl19UgjgHLaKUOI5jffGrKRcmjckGg3jpIKnmma0vxYfYL8h8kqupZm
         64NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704805125; x=1705409925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ndzvAtIphV3/MRhlh+roY7v2JbqJAf5pGogAL74MKKE=;
        b=Iz4qV/E8pYb2typviM44F6+QZqRvZK9TbEanqdTIjKvlwrdqPSwU47x0bCh6cEDk9i
         I9or+nf6R2ArQuklKUafrQbZMMzG5CU9DUIW8T2D8G62uOvTTh1AjKd7RQoT3e/cpDoB
         PA0cgL9en2f016+GdAhINaBA/UhfISJNeGrhy5bt63drIzlNTbY+dl0+CGECLpSEv5ud
         VsgwoKYtzK5PNnKj4p20rEIajkZOFEs9CMpYPe8nHZ6BNxOPR/VM0M/6wspJPYZ/VDWp
         3gQEGEs0TQQFDuwvnNTVetnLVfprGD3JaRGF4W1u/Cvb6C2EGocf6qkJPQYeArpc0g4G
         ev3Q==
X-Gm-Message-State: AOJu0YxV8Taum3zi7wosY3nGdp56S5/Rj+r6HRKCQwlK9yje6jG7UMgw
	iA/UBFUjKTLDHRM2SeHxzYjmhBG4VUnzaw==
X-Google-Smtp-Source: AGHT+IEXrqUo3X98KfIVdC+0JSNna7+jX0vhQXoPTaTb9u2LAvTigz3QPZnlngtgAikkgNuhljk1Dw==
X-Received: by 2002:a05:600c:4f09:b0:40e:5057:91f2 with SMTP id l9-20020a05600c4f0900b0040e505791f2mr401494wmq.115.1704805125039;
        Tue, 09 Jan 2024 04:58:45 -0800 (PST)
Received: from ta2.c.googlers.com.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id cw16-20020a056000091000b0033753a61e96sm2351302wrb.108.2024.01.09.04.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 04:58:43 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: peter.griffin@linaro.org,
	krzysztof.kozlowski+dt@linaro.org,
	gregkh@linuxfoundation.org
Cc: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh+dt@kernel.org,
	conor+dt@kernel.org,
	andi.shyti@kernel.org,
	alim.akhtar@samsung.com,
	jirislaby@kernel.org,
	s.nawrocki@samsung.com,
	tomasz.figa@gmail.com,
	cw00.choi@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-serial@vger.kernel.org,
	andre.draszik@linaro.org,
	kernel-team@android.com,
	willmcvicker@google.com,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v3 11/12] arm64: dts: exynos: gs101: define USI8 with I2C configuration
Date: Tue,  9 Jan 2024 12:58:13 +0000
Message-ID: <20240109125814.3691033-12-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20240109125814.3691033-1-tudor.ambarus@linaro.org>
References: <20240109125814.3691033-1-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

USI8 I2C is used to communicate with an eeprom found on the battery
connector. Define USI8 in I2C configuration.

USI8 CONFIG register comes with a 0x0 reset value, meaning that USI8
doesn't have a default protocol (I2C, SPI, UART) at reset. Thus the
selection of the protocol is intentionally left for the board dts file.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
v3: reorder usi8 clock order (thanks Andre'!). Did not make any
difference at testing as the usi driver treats the clocks in bulk.
v2:
- identify and use gate clocks instead of dividers
- move cells and pinctrl properties from dts to dtsi
- move IRQ type constant on the previous line

 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 29 ++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 6aa25cc4676e..f14a24628d04 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -352,6 +352,35 @@ pinctrl_peric0: pinctrl@10840000 {
 			interrupts = <GIC_SPI 625 IRQ_TYPE_LEVEL_HIGH 0>;
 		};
 
+		usi8: usi@109700c0 {
+			compatible = "google,gs101-usi",
+				     "samsung,exynos850-usi";
+			reg = <0x109700c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_CLK_PERIC0_USI8_USI_CLK>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_7>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric0 0x101c>;
+			status = "disabled";
+
+			hsi2c_8: i2c@10970000 {
+				compatible = "google,gs101-hsi2c",
+					     "samsung,exynosautov9-hsi2c";
+				reg = <0x10970000 0xc0>;
+				interrupts = <GIC_SPI 642 IRQ_TYPE_LEVEL_HIGH 0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&hsi2c8_bus>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_7>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_CLK_PERIC0_USI8_USI_CLK>;
+				clock-names = "hsi2c", "hsi2c_pclk";
+				status = "disabled";
+			};
+		};
+
 		usi_uart: usi@10a000c0 {
 			compatible = "google,gs101-usi",
 				     "samsung,exynos850-usi";
-- 
2.43.0.472.g3155946c3a-goog


