Return-Path: <linux-i2c+bounces-1050-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 096FA81F883
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Dec 2023 14:01:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 68920286B7E
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Dec 2023 13:01:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8EFC111BD;
	Thu, 28 Dec 2023 12:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rzIo1duA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4852610974
	for <linux-i2c@vger.kernel.org>; Thu, 28 Dec 2023 12:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-40d5aef534eso19650715e9.0
        for <linux-i2c@vger.kernel.org>; Thu, 28 Dec 2023 04:58:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703768300; x=1704373100; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fJqndlg00hz3kS0K9Xt/wzcgwz2RWYotM3QsJXJKxvc=;
        b=rzIo1duAxnP8EkArIztf8NaFeYQyVzaCFyqiOHwzDnvmL4l6j3bX2yfcL1SdwvfuYR
         R7ccEfhXp0bIyJsnyKRtocDRnhhslmCllhuhCBGgy1R/yIzvD/UX1++KTRo+i5T9HUUg
         Hc7Wp32lBdo5mJ98/Yga6oazzscaOYXJZq1vYBYi+uVXb+JHaV/6Mg/Q3FAWWcDcrd9Z
         RW6h6hebPFpTeTLZqLOQLMoH9CthW0n6vOASz7EGpaiABlpz0izIduwluhvNCFFrKJ/F
         eoweHjqIxIYGzQMqONqa/LAwH7ZqWOIP3QW5SGBmNOpVguvVBcr1dkZCFGglVYOaYKoY
         v/Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703768300; x=1704373100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fJqndlg00hz3kS0K9Xt/wzcgwz2RWYotM3QsJXJKxvc=;
        b=pC985rSqScy5bYQ81+5w0gy6DxXSBQaugUKEDA7P0aHBsF+9MGsIJSPfLcuR3iG+aL
         GdE+HPt4ce8pwFx9Q6Ac5Y4jU4xP5xKRSuaHQHqyhJAVkWBZ9yDYX2G4EkTpxhPixTdX
         1zy5i4N4mT6/2EFLzopdOZw9bM/diZL0E0LXSnIl1oOELlGxv4cwjjmu9YrQWH4eX9n7
         yO3NXvZI0E0TRSkDk3uMuFUrfKCibXant+VWZZ6xrJZ0WSk61Nb8Yk6ikNNKcBQGxnGT
         RSBI8P1TGKKA66QcO1B59qC6SiDhEiqZwqaBEoJ0yiPBb+H5zOeXzTDrD+1rczzF7l9S
         fq1w==
X-Gm-Message-State: AOJu0YzQLpUOB9r0eP/hpHu4Xwi+pA20R5YteeIa0vc2LzEZMhQyCLgU
	rvfOkWF2XkYPocLbainArGxhl+X7FO9PYQ==
X-Google-Smtp-Source: AGHT+IHl5TUZZLgMiTlie5qagsHCRsc5xzAp7JZjoJ6yG5wP+nbvBqQhFQDOaktrnm5ijLKALVeCGA==
X-Received: by 2002:a05:600c:2192:b0:40d:71c1:9985 with SMTP id e18-20020a05600c219200b0040d71c19985mr81689wme.29.1703768300597;
        Thu, 28 Dec 2023 04:58:20 -0800 (PST)
Received: from ta2.c.googlers.com.com (216.131.76.34.bc.googleusercontent.com. [34.76.131.216])
        by smtp.gmail.com with ESMTPSA id h9-20020a05600c350900b0040d5aca25f1sm8615807wmq.17.2023.12.28.04.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Dec 2023 04:58:20 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: peter.griffin@linaro.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	conor+dt@kernel.org,
	andi.shyti@kernel.org,
	alim.akhtar@samsung.com,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	s.nawrocki@samsung.com,
	tomasz.figa@gmail.com,
	cw00.choi@samsung.com,
	arnd@arndb.de,
	semen.protsenko@linaro.org
Cc: andre.draszik@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-serial@vger.kernel.org,
	kernel-team@android.com,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v2 10/12] arm64: dts: exynos: gs101: update USI UART to use peric0 clocks
Date: Thu, 28 Dec 2023 12:58:03 +0000
Message-ID: <20231228125805.661725-11-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20231228125805.661725-1-tudor.ambarus@linaro.org>
References: <20231228125805.661725-1-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Get rid of the dummy clock and start using the cmu_peric0 clocks
for the usi_uart and serial_0 nodes.

Tested the serial at 115200, 1000000 and 3000000 baudrates,
everthing went fine.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
v2: identify and use gate clocks instead of divider clocks

 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index c693791ae584..0e5b1b490b0b 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -180,14 +180,6 @@ HERA_CPU_SLEEP: cpu-hera-sleep {
 		};
 	};
 
-	/* TODO replace with CCF clock */
-	dummy_clk: clock-3 {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <12345>;
-		clock-output-names = "pclk";
-	};
-
 	/* ect node is required to be present by bootloader */
 	ect {
 	};
@@ -369,7 +361,8 @@ usi_uart: usi@10a000c0 {
 			ranges;
 			#address-cells = <1>;
 			#size-cells = <1>;
-			clocks = <&dummy_clk>, <&dummy_clk>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_CLK_PERIC0_USI0_UART_CLK>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP1_IPCLK_0>;
 			clock-names = "pclk", "ipclk";
 			samsung,sysreg = <&sysreg_peric0 0x1020>;
 			samsung,mode = <USI_V2_UART>;
@@ -380,7 +373,8 @@ serial_0: serial@10a00000 {
 				reg = <0x10a00000 0xc0>;
 				interrupts = <GIC_SPI 634
 					      IRQ_TYPE_LEVEL_HIGH 0>;
-				clocks = <&dummy_clk 0>, <&dummy_clk 0>;
+				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_CLK_PERIC0_USI0_UART_CLK>,
+					 <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP1_IPCLK_0>;
 				clock-names = "uart", "clk_uart_baud0";
 				samsung,uart-fifosize = <256>;
 				status = "disabled";
-- 
2.43.0.472.g3155946c3a-goog


