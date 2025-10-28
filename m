Return-Path: <linux-i2c+bounces-13865-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02993C15F8D
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Oct 2025 17:54:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A7CF43B3399
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Oct 2025 16:48:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C28AA336EDA;
	Tue, 28 Oct 2025 16:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="Odrd5Fk1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D62125BEF1;
	Tue, 28 Oct 2025 16:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761670075; cv=none; b=H6ejXqmHrxk4X9Pwcv6bLLgX1hRzz3cJS7HKRiJxgmHtsBNH9ESNTRNsz5qdOzroSKulxnzkVvweQbsfJ/x3tkCgUUo6/PopOxK7ekss1lsnsN1fWtkLAsBpZvw0iqErSBG5JvqW4LtnIS77V78zFnaOQXbXvYLiQblNnPNuuF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761670075; c=relaxed/simple;
	bh=V+IfWvce/o4FPRxrzB8Oy/wcqBjaSEpXgKLk5iNy6oQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ndGrN57aomKKUPoolauICTs4X0WWXfvFq+M5zRhZTtTAAveHbODWh1JCDS6IZp8g1AUbGStL0z5RjamdxKEjkfezPklgxm4NmIMhpdGc2HhJAWNj3YSgd986RM9voJd0Kogp1zU8EKgbmr+2PpvbV1vgBlMmQA6BSCigYtW0EOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=Odrd5Fk1; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1761669689; bh=V+IfWvce/o4FPRxrzB8Oy/wcqBjaSEpXgKLk5iNy6oQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Odrd5Fk1lXjI3mCer/rnLCeFs3sC7VDqQiKlcUCpfpm+JF+Yql/9Mq+nM5cE64K6d
	 wCAPv2fc3z+qRz5KwxgiRw/1BycjvL+nVfunLCS0uRSMDoXENAh61aMSFEFEne/umc
	 +eoT10D3kyfmIroeSmj7G7PYE9zGCZF5+Jbl4S6w=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Tue, 28 Oct 2025 17:40:49 +0100
Subject: [PATCH v2 4/7] arm64: dts: qcom: msm8953: Re-sort tlmm pinctrl
 states
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251028-msm8953-cci-v2-4-b5f9f7135326@lucaweiss.eu>
References: <20251028-msm8953-cci-v2-0-b5f9f7135326@lucaweiss.eu>
In-Reply-To: <20251028-msm8953-cci-v2-0-b5f9f7135326@lucaweiss.eu>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca@lucaweiss.eu>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=14474; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=V+IfWvce/o4FPRxrzB8Oy/wcqBjaSEpXgKLk5iNy6oQ=;
 b=owEBbQKS/ZANAwAKAXLYQ7idTddWAcsmYgBpAPIxUvUJqgcZcpsyWCFVfEQsdbVq5IyQVNAbR
 unJcTsDUKqJAjMEAAEKAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCaQDyMQAKCRBy2EO4nU3X
 VvJUEACd5K6T/RO1ktP4DuEbLJikoOmgI049DsHzFE/m4Ev3m50sWD3qqr8T0fYnJzovhmZ9vZY
 GEnpnwKawus3HeJmocRcSoJPXx4KWR2Ik3YQ3ZCaYgXu/SJZyWhGGYPOlLRx/5Oio55WOdP+R+C
 o7qAiZvzZLsfuI+9D1zLVqJG95BrDAyTmbzOZYqWUUurpu6MTxNk2WHqfkba6lrbkolVk7ikDAs
 wo6CXL5L0SvKRJyhEseihYS8/qQ4+YfBV+Hp2aVtlxIbaaQnBMizLWm9UAJrmtZWlQ2p1Njb3AE
 29n3SPH09a9eOlVi60go5nawCh2lWOvJHrGx9I5x640m5ZZT8/gcBAnGowswN6My6muf2D2AovH
 y/EkFQxxjsPv4s/TrBns0bzI1L61UNTpzPYbVgCW46z9xUOgdb8mGE69k/V9RSXg8G6hl4O+6kX
 hmNerqBtt6kL6uktBMbLiHMUnMMWajQA9TFTE8G05X/6D06IrQpov40FUOD4Ty37qr2YY/gSkWG
 k0oI/fPCeqvgtC3xI6+VshZA6YTTN8LFAwd/SlQwHMZbA4RapoWvcqjZMhQ+R13SfZlKG55JBU3
 VUIbtI0Ba+zQWOkvNbKopSNUbrrx7c2thYVIJH64oEj7S+KE7XCLLt7a+LeJ2k85RW51FplSJU4
 WM0Ra5aKnVt6YVA==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

Follow the Devicetree Sources Coding Style and sort the pinctrl nodes by
the pins property. This makes it simpler to add new pinctrl states in
the future.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 arch/arm64/boot/dts/qcom/msm8953.dtsi | 611 +++++++++++++++++-----------------
 1 file changed, 305 insertions(+), 306 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8953.dtsi b/arch/arm64/boot/dts/qcom/msm8953.dtsi
index 76317c578349..7884a3ed8aef 100644
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
@@ -559,6 +573,297 @@ uart_console_sleep: uart-console-sleep-state {
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
+			spi_3_default: spi-3-default-state {
+				cs-pins {
+					pins = "gpio10";
+					function = "blsp_spi3";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				spi-pins {
+					pins = "gpio8", "gpio9", "gpio11";
+					function = "blsp_spi3";
+					drive-strength = <12>;
+					bias-disable;
+				};
+			};
+
+			spi_3_sleep: spi-3-sleep-state {
+				cs-pins {
+					pins = "gpio10";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				spi-pins {
+					pins = "gpio8", "gpio9", "gpio11";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
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
+			spi_5_default: spi-5-default-state {
+				cs-pins {
+					pins = "gpio18";
+					function = "blsp_spi5";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				spi-pins {
+					pins = "gpio16", "gpio17", "gpio19";
+					function = "blsp_spi5";
+					drive-strength = <12>;
+					bias-disable;
+				};
+			};
+
+			spi_5_sleep: spi-5-sleep-state {
+				cs-pins {
+					pins = "gpio18";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				spi-pins {
+					pins = "gpio16", "gpio17", "gpio19";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
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
+			spi_6_default: spi-6-default-state {
+				cs-pins {
+					pins = "gpio22";
+					function = "blsp_spi6";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				spi-pins {
+					pins = "gpio20", "gpio21", "gpio23";
+					function = "blsp_spi6";
+					drive-strength = <12>;
+					bias-disable;
+				};
+			};
+
+			spi_6_sleep: spi-6-sleep-state {
+				cs-pins {
+					pins = "gpio22";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				spi-pins {
+					pins = "gpio20", "gpio21", "gpio23";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
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
+			spi_7_default: spi-7-default-state {
+				cs-pins {
+					pins = "gpio136";
+					function = "blsp_spi7";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				spi-pins {
+					pins = "gpio135", "gpio137", "gpio138";
+					function = "blsp_spi7";
+					drive-strength = <12>;
+					bias-disable;
+				};
+			};
+
+			spi_7_sleep: spi-7-sleep-state {
+				cs-pins {
+					pins = "gpio136";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				spi-pins {
+					pins = "gpio135", "gpio137", "gpio138";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
 			sdc1_clk_on: sdc1-clk-on-state {
 				pins = "sdc1_clk";
 				bias-disable;
@@ -640,312 +945,6 @@ sdc2_data_off: sdc2-data-off-state {
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
-				cs-pins {
-					pins = "gpio10";
-					function = "blsp_spi3";
-					drive-strength = <2>;
-					bias-disable;
-				};
-
-				spi-pins {
-					pins = "gpio8", "gpio9", "gpio11";
-					function = "blsp_spi3";
-					drive-strength = <12>;
-					bias-disable;
-				};
-			};
-
-			spi_3_sleep: spi-3-sleep-state {
-				cs-pins {
-					pins = "gpio10";
-					function = "gpio";
-					drive-strength = <2>;
-					bias-disable;
-				};
-
-				spi-pins {
-					pins = "gpio8", "gpio9", "gpio11";
-					function = "gpio";
-					drive-strength = <2>;
-					bias-pull-down;
-				};
-			};
-
-			spi_5_default: spi-5-default-state {
-				cs-pins {
-					pins = "gpio18";
-					function = "blsp_spi5";
-					drive-strength = <2>;
-					bias-disable;
-				};
-
-				spi-pins {
-					pins = "gpio16", "gpio17", "gpio19";
-					function = "blsp_spi5";
-					drive-strength = <12>;
-					bias-disable;
-				};
-			};
-
-			spi_5_sleep: spi-5-sleep-state {
-				cs-pins {
-					pins = "gpio18";
-					function = "gpio";
-					drive-strength = <2>;
-					bias-disable;
-				};
-
-				spi-pins {
-					pins = "gpio16", "gpio17", "gpio19";
-					function = "gpio";
-					drive-strength = <2>;
-					bias-pull-down;
-				};
-			};
-
-			spi_6_default: spi-6-default-state {
-				cs-pins {
-					pins = "gpio22";
-					function = "blsp_spi6";
-					drive-strength = <2>;
-					bias-disable;
-				};
-
-				spi-pins {
-					pins = "gpio20", "gpio21", "gpio23";
-					function = "blsp_spi6";
-					drive-strength = <12>;
-					bias-disable;
-				};
-			};
-
-			spi_6_sleep: spi-6-sleep-state {
-				cs-pins {
-					pins = "gpio22";
-					function = "gpio";
-					drive-strength = <2>;
-					bias-disable;
-				};
-
-				spi-pins {
-					pins = "gpio20", "gpio21", "gpio23";
-					function = "gpio";
-					drive-strength = <2>;
-					bias-pull-down;
-				};
-			};
-
-			spi_7_default: spi-7-default-state {
-				cs-pins {
-					pins = "gpio136";
-					function = "blsp_spi7";
-					drive-strength = <2>;
-					bias-disable;
-				};
-
-				spi-pins {
-					pins = "gpio135", "gpio137", "gpio138";
-					function = "blsp_spi7";
-					drive-strength = <12>;
-					bias-disable;
-				};
-			};
-
-			spi_7_sleep: spi-7-sleep-state {
-				cs-pins {
-					pins = "gpio136";
-					function = "gpio";
-					drive-strength = <2>;
-					bias-disable;
-				};
-
-				spi-pins {
-					pins = "gpio135", "gpio137", "gpio138";
-					function = "gpio";
-					drive-strength = <2>;
-					bias-pull-down;
-				};
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
2.51.2


