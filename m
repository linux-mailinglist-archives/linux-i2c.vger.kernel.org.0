Return-Path: <linux-i2c+bounces-8041-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6029D2696
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Nov 2024 14:12:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C23B428690C
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Nov 2024 13:12:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28ECA1CF7BB;
	Tue, 19 Nov 2024 13:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uPlsHAla"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35CEB1CEAD7
	for <linux-i2c@vger.kernel.org>; Tue, 19 Nov 2024 13:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732021844; cv=none; b=oNcjXejnIYJvCzbbnRe9Ut5cibC2SfDOABFamm87iRL5fA7zkqKQExQOr+x1YefbeAF6NqCDwS4ASI6CAtvgMFgydskYTonS4IOv5qNebLCMzRsb6Wo/2BmpCU67W37vtvGSifzsshUHvWAe2CqTBiA+5YP9auQz1JuwpBLh4aQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732021844; c=relaxed/simple;
	bh=S+AOgaqkoMYsCw3Vt8ZDBxvRAXQkyH2Lf9EIxJbbmko=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kQsRpJeOT8wWRjqlARSa2gaxxpI0qH28xtAqynayNje5OGC960k8f9WbnOjkff8EQSkUqGbWKZAp9E39ZuB6/hHwhybnKjKf7ToMBXer/dvaecvWGyePja+pF/d2qagLtnTEPKSKLZfSy7xA7WjQwFjwREcnMcFXsAjI0k8RlZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uPlsHAla; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-431695fa98bso7551655e9.3
        for <linux-i2c@vger.kernel.org>; Tue, 19 Nov 2024 05:10:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732021840; x=1732626640; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ccB7TnGbNzqTuAgdPFN2wgaThIqMR+r7WsBqH4IcD2c=;
        b=uPlsHAlasxuSQrELcCzp3lW1wgDxwtYrlWnJ6OdaNqHjFOdRXgXCFkQ10bhthCOmny
         DVXaitKX/BY5H27RYhUgqjSM5YFOtptusK1iseRHuLCckkk9e6tXzsIXpEcI5wIGrv6u
         ZfKRPJSBlYX6nI/N8XAJZg2GthwI6XvQ5sUCGj4CijoqNXfyi6xbXEpyE+94sy5mEnxR
         30C8kMUbSRkpNmIsXjxB5yyhRHHDf/7732i+Rj6eAmJXARJflqlJE8wEjPLBB2BgRRxg
         DfhgzcjCpeBVfvTNkEc2lpqOLOAgAEplCdpegPinhKf7IEkuafwWxne+Csfis7V5tTDY
         hEHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732021840; x=1732626640;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ccB7TnGbNzqTuAgdPFN2wgaThIqMR+r7WsBqH4IcD2c=;
        b=GXkNevxTDjyBJmlAzCn7lhdZM8XwcjjtkvkXhZy4JhQbQF33yCtuhpkJfvxjwlD057
         So9mZ6fpPP2xDRAEzRHxMOGwNm8SmgbjcX8sfJvygLsfhlhR3fRYHjs5evr1Lr/YLnin
         8xXgnsfTuhWFGjz9bRylVY6OFQrQbltru4gFhw8afCLJTtKywzjBLr0fsGgkrNsbkm9C
         DPQQobarZkc2XZCwlpWUWKbRiCG7426e8NKQjwTUKn/S5rkPSdLzg7mpt5Eif8XT0HqB
         /W8NENNNF2k1AasQYFFRE5nuFeyOPTTxk2CbaUc5tEADOgLfJxPhG/GbKW74kWQ9TJpq
         Ckrw==
X-Gm-Message-State: AOJu0Yy1Hc5UcsU74EFMoGAmNeEmXg6qLZE1/HD1YEI2/MADno39ZM9B
	MR/jOLo36sxjEglEExocmhBgNbQ9oGkgdMdbV5JZ4osrhGaM1JcxeZ3xG3NpqDA=
X-Google-Smtp-Source: AGHT+IH2T5B6S5t9PHOAZro3H4++keA2dPf3lp56WAtTQX5G/bD1GXjTC23YiZ07lkaWoxzMALUMeg==
X-Received: by 2002:a05:600c:808b:b0:430:5760:2fe with SMTP id 5b1f17b1804b1-432e9fc3f2amr76354065e9.22.1732021840569;
        Tue, 19 Nov 2024 05:10:40 -0800 (PST)
Received: from [127.0.1.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432dab76dafsm192016185e9.10.2024.11.19.05.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2024 05:10:40 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Tue, 19 Nov 2024 13:10:34 +0000
Subject: [PATCH 5/6] arm64: dts: qcom: x1e80100: Add CCI definitions
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v1-5-54075d75f654@linaro.org>
References: <20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v1-0-54075d75f654@linaro.org>
In-Reply-To: <20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v1-0-54075d75f654@linaro.org>
To: Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Jagadeesh Kona <quic_jkona@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15-dev-355e8

Add in 2 CCI busses. One bus has two CCI bus master pinouts:
cci_i2c_scl0 = gpio101
cci_i2c_sda0 = gpio102
cci_i2c_scl1 = gpio103
cci_i2c_sda1 = gpio104

A second bus has a single CCI bus master pinout:
cci_i2c_scl2 = gpio105
cci_i2c_sda2 = gpio106

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 162 +++++++++++++++++++++++++++++++++
 1 file changed, 162 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 5119cf64b461eb517e9306869ad0ec1b2cae629e..c19754fdc7e0fa4f674ce19f813db77fe2615cf3 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -4648,6 +4648,88 @@ usb_1_ss1_dwc3_ss: endpoint {
 			};
 		};
 
+		cci0: cci@ac15000 {
+			compatible = "qcom,x1e80100-cci", "qcom,msm8996-cci";
+			reg = <0 0x0ac15000 0 0x1000>;
+
+			interrupts = <GIC_SPI 460 IRQ_TYPE_EDGE_RISING>;
+
+			clocks = <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
+				 <&camcc CAM_CC_SLOW_AHB_CLK_SRC>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_0_CLK>;
+			clock-names = "camnoc_axi",
+				      "slow_ahb_src",
+				      "cpas_ahb",
+				      "cci";
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			pinctrl-0 = <&cci0_default>;
+			pinctrl-1 = <&cci0_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci0_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci0_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		cci1: cci@ac16000 {
+			compatible = "qcom,x1e80100-cci", "qcom,msm8996-cci";
+			reg = <0 0x0ac16000 0 0x1000>;
+
+			interrupts = <GIC_SPI 271 IRQ_TYPE_EDGE_RISING>;
+
+			clocks = <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
+				 <&camcc CAM_CC_SLOW_AHB_CLK_SRC>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_1_CLK>;
+			clock-names = "camnoc_axi",
+				      "slow_ahb_src",
+				      "cpas_ahb",
+				      "cci";
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			pinctrl-0 = <&cci1_default>;
+			pinctrl-1 = <&cci1_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci1_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci1_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		camcc: clock-controller@ade0000 {
 			compatible = "qcom,x1e80100-camcc";
 			reg = <0 0x0ade0000 0 0x20000>;
@@ -5272,6 +5354,86 @@ tlmm: pinctrl@f100000 {
 			gpio-ranges = <&tlmm 0 0 239>;
 			wakeup-parent = <&pdc>;
 
+			cci0_default: cci0-default-state {
+				cci0_i2c0_default: cci0-i2c0-default-pins {
+					/* cci_i2c_sda0, cci_i2c_scl0 */
+					pins = "gpio101", "gpio102";
+					function = "cci_i2c";
+
+					bias-pull-up;
+					drive-strength = <2>; /* 2 mA */
+				};
+
+				cci0_i2c1_default: cci0-i2c1-default-pins {
+					/* cci_i2c_sda1, cci_i2c_scl1 */
+					pins = "gpio103", "gpio104";
+					function = "cci_i2c";
+
+					bias-pull-up;
+					drive-strength = <2>; /* 2 mA */
+				};
+			};
+
+			cci0_sleep: cci0-sleep-state {
+				cci0_i2c0_sleep: cci0-i2c0-sleep-pins {
+					/* cci_i2c_sda0, cci_i2c_scl0 */
+					pins = "gpio101", "gpio102";
+					function = "cci_i2c";
+
+					drive-strength = <2>; /* 2 mA */
+					bias-pull-down;
+				};
+
+				cci0_i2c1_sleep: cci0-i2c1-sleep-pins {
+					/* cci_i2c_sda1, cci_i2c_scl1 */
+					pins = "gpio103", "gpio104";
+					function = "cci_i2c";
+
+					drive-strength = <2>; /* 2 mA */
+					bias-pull-down;
+				};
+			};
+
+			cci1_default: cci1-default-state {
+				cci1_i2c0_default: cci1-i2c0-default-pins {
+					/* cci_i2c_sda2, cci_i2c_scl2 */
+					pins = "gpio105","gpio106";
+					function = "cci_i2c";
+
+					bias-pull-up;
+					drive-strength = <2>; /* 2 mA */
+				};
+
+				cci1_i2c1_default: cci1-i2c1-default-pins {
+					/* aon_cci_i2c_sda3, aon_cci_i2c_scl3 */
+					pins = "gpio235","gpio236";
+					function = "aon_cci";
+
+					bias-pull-up;
+					drive-strength = <2>; /* 2 mA */
+				};
+			};
+
+			cci1_sleep: cci1-sleep-state {
+				cci1_i2c0_sleep: cci1-i2c0-sleep-pins {
+					/* cci_i2c_sda2, cci_i2c_scl2 */
+					pins = "gpio105","gpio106";
+					function = "cci_i2c";
+
+					bias-pull-down;
+					drive-strength = <2>; /* 2 mA */
+				};
+
+				cci1_i2c1_sleep: cci1-i2c1-sleep-pins {
+					/* aon_cci_i2c_sda3, aon_cci_i2c_scl3 */
+					pins = "gpio235","gpio236";
+					function = "aon_cci";
+
+					bias-pull-down;
+					drive-strength = <2>; /* 2 mA */
+				};
+			};
+
 			qup_i2c0_data_clk: qup-i2c0-data-clk-state {
 				/* SDA, SCL */
 				pins = "gpio0", "gpio1";

-- 
2.45.2


