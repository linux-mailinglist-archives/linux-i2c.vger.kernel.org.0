Return-Path: <linux-i2c+bounces-1238-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BCEA8286A4
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Jan 2024 14:01:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F11F7B24DC5
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Jan 2024 13:01:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A98F38F95;
	Tue,  9 Jan 2024 12:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pC/BcBMY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40CB39FDA
	for <linux-i2c@vger.kernel.org>; Tue,  9 Jan 2024 12:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3368b9bbeb4so3002088f8f.2
        for <linux-i2c@vger.kernel.org>; Tue, 09 Jan 2024 04:58:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704805123; x=1705409923; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oaGDi0TjQr7Ub9IZJcZUMigpK3k/y+7+MgVg6Cn1eL0=;
        b=pC/BcBMYIhWTsStqZnIJ+IuXn3IWFerSRZ5sSr/NiuBfSTaE/2VfJO/DOXtWt3x9Z9
         UZ5nHgVQ7gT4iK4F9iNIGIZSxTMWeF/uMa+a8SpbXf5rvHU1vQMx8j0bKlOckcnFVbLJ
         WsX6V8MMtVtDb6rketEwQbaumufCsvWBU9veUwX0Tfu7ZU9g5Cwl6VXye6YmHercG+9f
         2hE4o0Odjx91AMOkrASc3QccERas79JOkYi+k1YZXKWW4kGG6ovxZ2sWnL+Rrw3oejVo
         M1byxpd3NkPH0wtKo+NUHqJJAxkY3vS1vPAnaow0xl9sygS6I0Y7iPCbnJzNilitDUwN
         4CpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704805123; x=1705409923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oaGDi0TjQr7Ub9IZJcZUMigpK3k/y+7+MgVg6Cn1eL0=;
        b=WUTAvdWRAmwlMmdHzgMC2wvxP9WzFpPBkeOblqhmTXrS8juxW8sonzdB3W0oYScsJb
         5zSOgUTnhGmI3xFq0kIWtfNWfdIWnkfS6N/ighIVSZj+HzsppISN4uzemZ7VK/0DhFXb
         7RWE/4ZcO5NTONYdas8VNInOMXXAZqZV3N0dQIxXIZhraFYaFYhhCENoNQnWXflyA2WD
         eF0BZ/P8Wcdl5BcMY3ZwMM7J0G9Y0GzdkdlnMC5ksuKFihDLcMUPhA6xBnTfMeyPb3Cl
         1iovkY+kNasYsD1NDjRg8RzaQnfuukmjwQ/Ogryyk5t62dSfMJJOFT54VKtq4v0UVgmN
         cSqA==
X-Gm-Message-State: AOJu0Yzh2J1CDMXHdGtl92LLtf8xGkLP20BiaeS5ViDobUwFmYB9FW8B
	XJucco8D0nKm9pYICMEzLZ7/1Ysjd9oceQ==
X-Google-Smtp-Source: AGHT+IGXM0B1+9MuwIA8MtMhZnmxjuNKArN4QKZBkCUKGYztf1jMYVytIdcENRsUzaSub8ZdLjr8Hg==
X-Received: by 2002:adf:b357:0:b0:337:6277:91e9 with SMTP id k23-20020adfb357000000b00337627791e9mr241460wrd.82.1704805123201;
        Tue, 09 Jan 2024 04:58:43 -0800 (PST)
Received: from ta2.c.googlers.com.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id cw16-20020a056000091000b0033753a61e96sm2351302wrb.108.2024.01.09.04.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 04:58:42 -0800 (PST)
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
Subject: [PATCH v3 10/12] arm64: dts: exynos: gs101: update USI UART to use peric0 clocks
Date: Tue,  9 Jan 2024 12:58:12 +0000
Message-ID: <20240109125814.3691033-11-tudor.ambarus@linaro.org>
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

Get rid of the dummy clock and start using the cmu_peric0 clocks
for the usi_uart and serial_0 nodes.

Tested the serial at 115200, 1000000 and 3000000 baudrates,
everthing went fine.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
v3: no change
v2: identify and use gate clocks instead of divider clocks

 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 2d1344a202a9..6aa25cc4676e 100644
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
@@ -367,7 +359,8 @@ usi_uart: usi@10a000c0 {
 			ranges;
 			#address-cells = <1>;
 			#size-cells = <1>;
-			clocks = <&dummy_clk>, <&dummy_clk>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_CLK_PERIC0_USI0_UART_CLK>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP1_IPCLK_0>;
 			clock-names = "pclk", "ipclk";
 			samsung,sysreg = <&sysreg_peric0 0x1020>;
 			samsung,mode = <USI_V2_UART>;
@@ -378,7 +371,8 @@ serial_0: serial@10a00000 {
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


