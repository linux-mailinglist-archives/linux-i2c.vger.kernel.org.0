Return-Path: <linux-i2c+bounces-1384-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 024A8832890
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Jan 2024 12:13:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1C3B51C233AB
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Jan 2024 11:13:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 716694E1D6;
	Fri, 19 Jan 2024 11:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Bsax9cj5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A894D592
	for <linux-i2c@vger.kernel.org>; Fri, 19 Jan 2024 11:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705662718; cv=none; b=f49N5B+mmasEtqlI/BclnUdE6NC2KkmtiKSg5G3/MQOTOoY+68kZxrACBw93pEURbCVORel9keQY0At7Sx7VZNTqq/I1+Ukni9V4Sk6+LzwmSomEmTPPuGAHeOWzIIqaVmhQ5ANr0x/bSiYGlcBUwX+srtSbcCLnIY54T8rXWiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705662718; c=relaxed/simple;
	bh=+Z9aKQjWJRg1t8puc2H7wIKhN59qiSCcrvi1W3ZMQJ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C0KK0dMtbSBLZCOAcSbusXdmabfDZ54z97q7oHgiTcKjmlq6rRU6OnJlNsg4CftRKff+11Ht3bXLJxrd75P9zaIQib2mUaQssvNkcoTtKS8mzWLq9uDf0CAwRkEgQEPSAhp3LMrP5eLEsWHpPuE3sIyA9Owv2oniBlHyEHACQGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Bsax9cj5; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-336c8ab0b20so568399f8f.1
        for <linux-i2c@vger.kernel.org>; Fri, 19 Jan 2024 03:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705662714; x=1706267514; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tDx9IJeu4q4vg7sxnjP3+o90/kYREKpXEiMwOte9XSc=;
        b=Bsax9cj537jCBdindCqwlsLm7YKFMR4zjAMKweP53fOK10AajxYubcGUpIKgfakUsW
         3oE2LMTL8W0w96ZraPq9fw55ZIJFnK99LhUh1yX61yhbNXp/4b70E6rcFIESSLbG2Ezb
         +cz6U2goQ7pP7yC/FpT8/Lij826zogV+RxNX4G7I8XEZgXvFxzvdXnJmrqJAJPUIe1pp
         hqloRsJARVokBXzKv4FEfcwmBfvnFKb2gQJ9hJuYeM24oLN2Ui1ItZfXnJXrwQZHtJqQ
         sYOStcVQ6+tBVqF+RegH+HcgpqyMtug49BcXSfJPFC3TgGvpIBGdNUIYu/Icgg/UHE0J
         SNZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705662714; x=1706267514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tDx9IJeu4q4vg7sxnjP3+o90/kYREKpXEiMwOte9XSc=;
        b=bIVqF0uzw2p8guK/RjEGbELvxNMxM95kZd91GIj/XXbSWBMCqQhSnb0dM4O1ykkS8L
         2L+5FZo/k/0au38EyBM/KXDjTDihQRq3YDArPN0VoTNMqS9eu/gUiuC5moeXnG2Flaib
         88X77jBr/7K6yEy5vCadnnn3EK37XP6CLWaMM0c1U4ALQFqSbykjOIFlSFHaVKIPXFNV
         V4EKatf0FooISymRUbxZ/u7o7g/a6/xgsV1nBduRNo10/DDrJwwAAyzHUxz4Ysil6Cl7
         iGYwnT3UUnDrIIVg/w45GO4jHcZB9QtFeB7kPXTprGRO2DpTN+R5inilCh6QBAKpj3P5
         PFbg==
X-Gm-Message-State: AOJu0YwLixOCZNyFkxIMkiunlaVbHqoyl+QsCTlDn0zYgDmFTXCBTQ3z
	xr9j8qtxlfpeOcuMk2k1VcOUQa9rVgc6thPc97YD6t/ALL0SQRlSJh9VOYlC1+vyGHzWIiJ9WxM
	7iM4=
X-Google-Smtp-Source: AGHT+IFa9EXNILXQkEvGWQUIOOA63etKevXkmw5q28slYY6iHwHtb/9wtgcuyorN42OKWTa9d7vFYg==
X-Received: by 2002:a05:6000:1010:b0:337:c642:7acf with SMTP id a16-20020a056000101000b00337c6427acfmr1422410wrx.108.1705662714705;
        Fri, 19 Jan 2024 03:11:54 -0800 (PST)
Received: from ta2.c.googlers.com.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id o10-20020a5d62ca000000b00337d4ce6ab4sm3341868wrv.20.2024.01.19.03.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 03:11:53 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: peter.griffin@linaro.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org
Cc: andi.shyti@kernel.org,
	alim.akhtar@samsung.com,
	s.nawrocki@samsung.com,
	tomasz.figa@gmail.com,
	cw00.choi@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	andre.draszik@linaro.org,
	semen.protsenko@linaro.org,
	willmcvicker@google.com,
	kernel-team@android.com,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v4 6/8] arm64: dts: exynos: gs101: update USI UART to use peric0 clocks
Date: Fri, 19 Jan 2024 11:11:30 +0000
Message-ID: <20240119111132.1290455-7-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
In-Reply-To: <20240119111132.1290455-1-tudor.ambarus@linaro.org>
References: <20240119111132.1290455-1-tudor.ambarus@linaro.org>
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

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
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
2.43.0.429.g432eaa2c6b-goog


