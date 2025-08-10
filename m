Return-Path: <linux-i2c+bounces-12210-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C09B1FAE6
	for <lists+linux-i2c@lfdr.de>; Sun, 10 Aug 2025 17:47:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AEB7C189BF28
	for <lists+linux-i2c@lfdr.de>; Sun, 10 Aug 2025 15:47:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2E8C26FDB3;
	Sun, 10 Aug 2025 15:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="b9x3SSm8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE03AEAE7;
	Sun, 10 Aug 2025 15:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754840814; cv=none; b=SBAlEsh7LH12SwcfRvToB9zINKJ4qvMcpZUuce7QyP+XkrP+j7zioO+up2BIThocxdJuMG2FySum2Ic5pxpqULyuyn9cscpc04sEUbBlhyxkSirwyKELhbUTYTKpvN55KgcehM5PpvlN9jbypWSjqYUEHE9wuKx/7D1qr3C2wyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754840814; c=relaxed/simple;
	bh=Zh+Ko5DS4O61aek9Z2Wg3FGjKw3h4ORFD6vcr5gSzPg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A6g9YLZOf1lZLdEtNxlj4dJsJkSQrkp3C8PMrt3x8O8wdL7LIaz55aX1aPyTDiikzbJbamBobDbt7oxiNw4iAHjYg3Y/MnLGtPFt9JgREfM9FxoXForxEul72lsXgCQFctQoeRzKeyi+j6R+mQfOFuwnjJ+DZJ8cDkdBIc0scjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=b9x3SSm8; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1754840307; bh=Zh+Ko5DS4O61aek9Z2Wg3FGjKw3h4ORFD6vcr5gSzPg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=b9x3SSm8V/cxqVExjBH7FT23SHS6dubmfAvuQfSnedXCDCKWIZE6MntmIyvAxaNUy
	 OAN1dRiEAkVoonP4YgVsu1W3O6hTNjnOlek/iurYHVSvQNOvHE8My5CsY9y9fC3OZp
	 YWRqgEBgG6LwkUU2s6zFoZ6WOMVtcjsogaF3qItQ=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Sun, 10 Aug 2025 17:37:55 +0200
Subject: [PATCH 4/7] arm64: dts: qcom: msm8953: Re-sort tlmm pinctrl states
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250810-msm8953-cci-v1-4-e83f104cabfc@lucaweiss.eu>
References: <20250810-msm8953-cci-v1-0-e83f104cabfc@lucaweiss.eu>
In-Reply-To: <20250810-msm8953-cci-v1-0-e83f104cabfc@lucaweiss.eu>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=11071; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=Zh+Ko5DS4O61aek9Z2Wg3FGjKw3h4ORFD6vcr5gSzPg=;
 b=owEBbQKS/ZANAwAKAXLYQ7idTddWAcsmYgBomLztSzzf9/sPL5TZ646sOc9vGjRsCSfzQADjB
 9beQlPS6kaJAjMEAAEKAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCaJi87QAKCRBy2EO4nU3X
 Vg/lEACm+SQuSwNNeXGpjVxW+jlz/5ns+50udXaANEQPt6XT1xQcPDvNQmS60xLeUHZexhdoU9x
 WxV0YpKuCddxp3KCJhfyLTSbyeNOOIgDGxabpYEwmYpWtfBtsIGRx1pmLRPTuNUQpS9PKCK7TzJ
 iO3ofxQ55YhrC8LqID5ZN3CZaeZpY23zLJ5ZaF8lQ1Ccrf4jMpNcBQkHw7xE8a6sAyqKI27oLph
 aTaq5QFrycasOmvsyZJoiwYrOfechGzwmMcqJNlQIm1Tu5x2CUARanrTEfSUxhfRhQmqQ5W8gTo
 alBEr0cR9i/YjOpRQlyBrNf1Qy6Gm4ncrfnMGTXc3MLsGTc+VAwovXLEw68oX7z3/Xl+icABiBI
 fUAL4uWtzKOL2tKRv0olQoYcQJcsxPVzdRQ2nOt72YjU1m7O5Iv2RpTUp2JigF8yMnJ23PgYv3v
 tdoJeaZWnqfJlyvq7yShr3Z+f5ih/6mWuP8N1ND6BUojJxYNkIPCcyDptJzlEBNGbS0w8kniU0i
 /UPLJwWu4H6/5G9wNcaTEicN4t29fNl4TNssu+A2WGhqMJ6kiWlQZ4oDI3FGFSripEwklfdInf7
 nqQLSSHY5N394P4O2Nj8rgyF47S+JGO1AFpaHVa3Q+7BoIu0zR8ttZK+6AbjCF1px7e2KOeILVm
 K17H9Rlgn+Vytcg==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

Follow the Devicetree Sources Coding Style and sort the pinctrl nodes by
the pins property. This makes it simpler to add new pinctrl states in
the future.

Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 arch/arm64/boot/dts/qcom/msm8953.dtsi | 439 +++++++++++++++++-----------------
 1 file changed, 219 insertions(+), 220 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8953.dtsi b/arch/arm64/boot/dts/qcom/msm8953.dtsi
index c5205d09c442e45e4a0cc3e6d8ff7d9d7bda0034..c8a1a91f033320645395e5aa216c0112746a9a8e 100644
--- a/arch/arm64/boot/dts/qcom/msm8953.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8953.dtsi
@@ -545,6 +545,20 @@ tlmm: pinctrl@1000000 {
 			interrupt-controller;
 			#interrupt-cells = <2>;
 
+			i2c_1_default: i2c-1-default-state {
+				pins = "gpio2", "gpio3";
+				function = "blsp_i2c1";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			i2c_1_sleep: i2c-1-sleep-state {
+				pins = "gpio2", "gpio3";
+				function = "gpio";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			uart_console_active: uart-console-active-state {
 				pins = "gpio4", "gpio5";
 				function = "blsp_uart2";
@@ -559,6 +573,211 @@ uart_console_sleep: uart-console-sleep-state {
 				bias-pull-down;
 			};
 
+			i2c_2_default: i2c-2-default-state {
+				pins = "gpio6", "gpio7";
+				function = "blsp_i2c2";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			i2c_2_sleep: i2c-2-sleep-state {
+				pins = "gpio6", "gpio7";
+				function = "gpio";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			i2c_3_default: i2c-3-default-state {
+				pins = "gpio10", "gpio11";
+				function = "blsp_i2c3";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			i2c_3_sleep: i2c-3-sleep-state {
+				pins = "gpio10", "gpio11";
+				function = "gpio";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			spi_3_default: spi-3-default-state {
+				pins = "gpio10", "gpio11";
+				function = "blsp_spi3";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			spi_3_sleep: spi-3-sleep-state {
+				pins = "gpio10", "gpio11";
+				function = "gpio";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			i2c_4_default: i2c-4-default-state {
+				pins = "gpio14", "gpio15";
+				function = "blsp_i2c4";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			i2c_4_sleep: i2c-4-sleep-state {
+				pins = "gpio14", "gpio15";
+				function = "gpio";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			uart_5_default: uart-5-default-state {
+				pins = "gpio16", "gpio17", "gpio18", "gpio19";
+				function = "blsp_uart5";
+				drive-strength = <16>;
+				bias-disable;
+			};
+
+			uart_5_sleep: uart-5-sleep-state {
+				pins = "gpio16", "gpio17", "gpio18", "gpio19";
+				function = "gpio";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			i2c_5_default: i2c-5-default-state {
+				pins = "gpio18", "gpio19";
+				function = "blsp_i2c5";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			i2c_5_sleep: i2c-5-sleep-state {
+				pins = "gpio18", "gpio19";
+				function = "gpio";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			spi_5_default: spi-5-default-state {
+				pins = "gpio18", "gpio19";
+				function = "blsp_spi5";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			spi_5_sleep: spi-5-sleep-state {
+				pins = "gpio18", "gpio19";
+				function = "gpio";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			i2c_6_default: i2c-6-default-state {
+				pins = "gpio22", "gpio23";
+				function = "blsp_i2c6";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			i2c_6_sleep: i2c-6-sleep-state {
+				pins = "gpio22", "gpio23";
+				function = "gpio";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			spi_6_default: spi-6-default-state {
+				pins = "gpio22", "gpio23";
+				function = "blsp_spi6";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			spi_6_sleep: spi-6-sleep-state {
+				pins = "gpio22", "gpio23";
+				function = "gpio";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			wcnss_pin_a: wcnss-active-state {
+				wcss-wlan2-pins {
+					pins = "gpio76";
+					function = "wcss_wlan2";
+					drive-strength = <6>;
+					bias-pull-up;
+				};
+
+				wcss-wlan1-pins {
+					pins = "gpio77";
+					function = "wcss_wlan1";
+					drive-strength = <6>;
+					bias-pull-up;
+				};
+
+				wcss-wlan0-pins {
+					pins = "gpio78";
+					function = "wcss_wlan0";
+					drive-strength = <6>;
+					bias-pull-up;
+				};
+
+				wcss-wlan-pins {
+					pins = "gpio79", "gpio80";
+					function = "wcss_wlan";
+					drive-strength = <6>;
+					bias-pull-up;
+				};
+			};
+
+			gpio_key_default: gpio-key-default-state {
+				pins = "gpio85";
+				function = "gpio";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			i2c_8_default: i2c-8-default-state {
+				pins = "gpio98", "gpio99";
+				function = "blsp_i2c8";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			i2c_8_sleep: i2c-8-sleep-state {
+				pins = "gpio98", "gpio99";
+				function = "gpio";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			sdc2_cd_on: cd-on-state {
+				pins = "gpio133";
+				function = "gpio";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			sdc2_cd_off: cd-off-state {
+				pins = "gpio133";
+				function = "gpio";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			i2c_7_default: i2c-7-default-state {
+				pins = "gpio135", "gpio136";
+				function = "blsp_i2c7";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			i2c_7_sleep: i2c-7-sleep-state {
+				pins = "gpio135", "gpio136";
+				function = "gpio";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			sdc1_clk_on: sdc1-clk-on-state {
 				pins = "sdc1_clk";
 				bias-disable;
@@ -640,226 +859,6 @@ sdc2_data_off: sdc2-data-off-state {
 				bias-pull-up;
 				drive-strength = <2>;
 			};
-
-			sdc2_cd_on: cd-on-state {
-				pins = "gpio133";
-				function = "gpio";
-				drive-strength = <2>;
-				bias-pull-up;
-			};
-
-			sdc2_cd_off: cd-off-state {
-				pins = "gpio133";
-				function = "gpio";
-				drive-strength = <2>;
-				bias-disable;
-			};
-
-			gpio_key_default: gpio-key-default-state {
-				pins = "gpio85";
-				function = "gpio";
-				drive-strength = <2>;
-				bias-pull-up;
-			};
-
-			i2c_1_default: i2c-1-default-state {
-				pins = "gpio2", "gpio3";
-				function = "blsp_i2c1";
-				drive-strength = <2>;
-				bias-disable;
-			};
-
-			i2c_1_sleep: i2c-1-sleep-state {
-				pins = "gpio2", "gpio3";
-				function = "gpio";
-				drive-strength = <2>;
-				bias-disable;
-			};
-
-			i2c_2_default: i2c-2-default-state {
-				pins = "gpio6", "gpio7";
-				function = "blsp_i2c2";
-				drive-strength = <2>;
-				bias-disable;
-			};
-
-			i2c_2_sleep: i2c-2-sleep-state {
-				pins = "gpio6", "gpio7";
-				function = "gpio";
-				drive-strength = <2>;
-				bias-disable;
-			};
-
-			i2c_3_default: i2c-3-default-state {
-				pins = "gpio10", "gpio11";
-				function = "blsp_i2c3";
-				drive-strength = <2>;
-				bias-disable;
-			};
-
-			i2c_3_sleep: i2c-3-sleep-state {
-				pins = "gpio10", "gpio11";
-				function = "gpio";
-				drive-strength = <2>;
-				bias-disable;
-			};
-
-			i2c_4_default: i2c-4-default-state {
-				pins = "gpio14", "gpio15";
-				function = "blsp_i2c4";
-				drive-strength = <2>;
-				bias-disable;
-			};
-
-			i2c_4_sleep: i2c-4-sleep-state {
-				pins = "gpio14", "gpio15";
-				function = "gpio";
-				drive-strength = <2>;
-				bias-disable;
-			};
-
-			i2c_5_default: i2c-5-default-state {
-				pins = "gpio18", "gpio19";
-				function = "blsp_i2c5";
-				drive-strength = <2>;
-				bias-disable;
-			};
-
-			i2c_5_sleep: i2c-5-sleep-state {
-				pins = "gpio18", "gpio19";
-				function = "gpio";
-				drive-strength = <2>;
-				bias-disable;
-			};
-
-			i2c_6_default: i2c-6-default-state {
-				pins = "gpio22", "gpio23";
-				function = "blsp_i2c6";
-				drive-strength = <2>;
-				bias-disable;
-			};
-
-			i2c_6_sleep: i2c-6-sleep-state {
-				pins = "gpio22", "gpio23";
-				function = "gpio";
-				drive-strength = <2>;
-				bias-disable;
-			};
-
-			i2c_7_default: i2c-7-default-state {
-				pins = "gpio135", "gpio136";
-				function = "blsp_i2c7";
-				drive-strength = <2>;
-				bias-disable;
-			};
-
-			i2c_7_sleep: i2c-7-sleep-state {
-				pins = "gpio135", "gpio136";
-				function = "gpio";
-				drive-strength = <2>;
-				bias-disable;
-			};
-
-			i2c_8_default: i2c-8-default-state {
-				pins = "gpio98", "gpio99";
-				function = "blsp_i2c8";
-				drive-strength = <2>;
-				bias-disable;
-			};
-
-			i2c_8_sleep: i2c-8-sleep-state {
-				pins = "gpio98", "gpio99";
-				function = "gpio";
-				drive-strength = <2>;
-				bias-disable;
-			};
-
-			spi_3_default: spi-3-default-state {
-				pins = "gpio10", "gpio11";
-				function = "blsp_spi3";
-				drive-strength = <2>;
-				bias-disable;
-			};
-
-			spi_3_sleep: spi-3-sleep-state {
-				pins = "gpio10", "gpio11";
-				function = "gpio";
-				drive-strength = <2>;
-				bias-disable;
-			};
-
-			spi_5_default: spi-5-default-state {
-				pins = "gpio18", "gpio19";
-				function = "blsp_spi5";
-				drive-strength = <2>;
-				bias-disable;
-			};
-
-			spi_5_sleep: spi-5-sleep-state {
-				pins = "gpio18", "gpio19";
-				function = "gpio";
-				drive-strength = <2>;
-				bias-disable;
-			};
-
-			spi_6_default: spi-6-default-state {
-				pins = "gpio22", "gpio23";
-				function = "blsp_spi6";
-				drive-strength = <2>;
-				bias-disable;
-			};
-
-			spi_6_sleep: spi-6-sleep-state {
-				pins = "gpio22", "gpio23";
-				function = "gpio";
-				drive-strength = <2>;
-				bias-disable;
-			};
-
-			uart_5_default: uart-5-default-state {
-				pins = "gpio16", "gpio17", "gpio18", "gpio19";
-				function = "blsp_uart5";
-				drive-strength = <16>;
-				bias-disable;
-			};
-
-			uart_5_sleep: uart-5-sleep-state {
-				pins = "gpio16", "gpio17", "gpio18", "gpio19";
-				function = "gpio";
-				drive-strength = <2>;
-				bias-disable;
-			};
-
-			wcnss_pin_a: wcnss-active-state {
-
-				wcss-wlan2-pins {
-					pins = "gpio76";
-					function = "wcss_wlan2";
-					drive-strength = <6>;
-					bias-pull-up;
-				};
-
-				wcss-wlan1-pins {
-					pins = "gpio77";
-					function = "wcss_wlan1";
-					drive-strength = <6>;
-					bias-pull-up;
-				};
-
-				wcss-wlan0-pins {
-					pins = "gpio78";
-					function = "wcss_wlan0";
-					drive-strength = <6>;
-					bias-pull-up;
-				};
-
-				wcss-wlan-pins {
-					pins = "gpio79", "gpio80";
-					function = "wcss_wlan";
-					drive-strength = <6>;
-					bias-pull-up;
-				};
-			};
 		};
 
 		gcc: clock-controller@1800000 {

-- 
2.50.1


