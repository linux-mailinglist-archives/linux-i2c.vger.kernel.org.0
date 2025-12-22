Return-Path: <linux-i2c+bounces-14677-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5972ECD5CAA
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Dec 2025 12:20:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6269B303A8C1
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Dec 2025 11:19:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A9DD3161A1;
	Mon, 22 Dec 2025 11:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KRJhjtXG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28986315D2B
	for <linux-i2c@vger.kernel.org>; Mon, 22 Dec 2025 11:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766402380; cv=none; b=unMGlBNcrS9vxPdJTaRQDinqWswmZSJNjxI9refgE3RiOKRKJ+9Ob7/SWE+M+fyKHQxoSD2iwhb0obh/9PYUPXNywlgcsZ4odHm78/k8D4i2rfQCjza6Qtvl0TJiXmzIfZKTl2l0VinKgNE3L9NQHlH3ep4tJs9aEOEoq3kwAmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766402380; c=relaxed/simple;
	bh=NYySMlRB1fJNBjIZgFY+gQqMAE3gSi8WFM84eavaktQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lorNcVETrEyKPjSCO2b4Kun9n8WF2jGNSZfF7/qBqEFEekJbRlwqTgKxXrN6ks1Xk0bOgbFyhwb/6NPN1H+RrdRimy4vneRtrWkwNp1FGzWG9VgLii05s+Y9p9+JEoX2rHVlRuvijxmWhjcRgGX8TCFBMaVuDAjv4JqwKjM0m1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KRJhjtXG; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-598ed017e4cso295763e87.0
        for <linux-i2c@vger.kernel.org>; Mon, 22 Dec 2025 03:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766402376; x=1767007176; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+nCdSVdtRzhabw5OEkxzKxb9YUm3JF1zKMZaKA3BdGo=;
        b=KRJhjtXGkj8awhLFIZkPDoPUQ/JYNo4ux2GN0K1rTruCXdjlmmNp2NBmLolb5XR+j/
         kHxjOM494mOeIkApxuoO/O1XS7158ngk8P7+LXkE+BX+5QycKz5TLH0U89sxN2ne9/Vi
         1MjhvmwYgt/WrKlrOkDVYQhFbdsyVUr5oF5y9N0zOFA/cTn9Y88z5cu6kV39aA738sHv
         EevVYaqXdnMA8jxL/o0/OOJ2wuAvSjgT4858OOISiLMmDTKN2zX0T9EvJf5nuPJ2vx3C
         VoZV1hj+ZBHCn8KRgroQHao3ar9lDfNQwDlP0kruubcTSvsSCfluOce42N/kbqVUOIzs
         sASA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766402376; x=1767007176;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+nCdSVdtRzhabw5OEkxzKxb9YUm3JF1zKMZaKA3BdGo=;
        b=xDLkaZKIWOjfC0EspXeTxr03tTvrQrd66cwYN2vpNwOdE77sC/PqPFEq4s2lB0zonC
         6Ool+vlv4xlB+YtnOyXHREzLFyNUM78JCHn71XD4YvAxdMrBNjJLskgyGUWewO+fI7Ep
         7XZzpIWoSPtN7jgFbKkbQXcyyZl1vI3FkGf4t/QBiFa53vYyUpYuRTwxPtEJMUIhwB9g
         QVZzzmcNb1w0+79MdUE2zEFNQM4VrP2ORhCNuuEUtdILMqviJ82hKVRiOx5/3BTZ6Pso
         EOQrgRP/rkItOl0377Nc8bLW7TAuhleWV9J/0ObHQZX3x/Bd83hD7djnElzmyuwjG5Gy
         KATQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrkfgxXTz/seP0aj0Au2ueuovaXDZctKMnuRb37vTPIJfekbpJXcT8iBy8IPllhlS1mV1Un6tv0x4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIwvJdmIqn6RUOn0TKO274Ftmlj/u2yzZf4iSweAU7TWPUMonf
	ScneMbMmhpgEgwogUrF8AvxD2gZAmiJ2UVOSkqc0U/UZ1YP0UEV2PEZPBoD5MNBaGB8=
X-Gm-Gg: AY/fxX7cWs+hxQWm+FjSMc1BK6yiMuNu8DeW8sZigAJjGx0aPo5fRtyJM3e6NTB9DOr
	bf7yTMXWHVQtn2qqmAoTno/G2AUJWHz9WSlZwVlqY/OK/HR+30siTdO9aryQgvf4wlZz/cH1VPv
	4R4EyqJQ/V8KqKaOSeXYkp66CPXL69kWwIN361a9FQtwadZPE4hdQha61gmF/AZD0WREGqZvB4L
	XIs6YMZNi7XAWg2iFtL/jzUlPj32uUNxgStfEq5FqsxS2AwrkOZmLx17GmJuv5GaX22j9hLf7iv
	V6u5QBpSS/2ZssAmLfcpKpC+P6IRPmKirzNhhR4JWkQk815/K1lhRjlzZz9OaMYPgEVPHJTWgRt
	etmlLZE5VZ6+8R11ONC+m6r9QNhFjWYhll5M4UkHLAsV6Pw9bNpt3U7h1tF+xJMUZIaroGRZpI6
	RzY1kvowoDGIaNBNwDz5UdoPamjCtexL87T3Nj2yhWlIjXROHRVUszne0rWKEYpaRmBg==
X-Google-Smtp-Source: AGHT+IFHwXMzFpo+8uZ8eDR6Lk00sHETgxWpEEajBWiAtPVohEtLXk0F+nt4In8Dh7Nww7AyT8N4jw==
X-Received: by 2002:a05:6512:3a84:b0:592:f383:3aad with SMTP id 2adb3069b0e04-59a17df4092mr2238574e87.8.1766402376164;
        Mon, 22 Dec 2025 03:19:36 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a186280bcsm3119201e87.90.2025.12.22.03.19.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 03:19:35 -0800 (PST)
Message-ID: <cfb8f192-b327-4bb9-993e-a28184571712@linaro.org>
Date: Mon, 22 Dec 2025 13:19:34 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: talos-evk-camera: Add DT overlay
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20251222-sm6150_evk-v1-0-4d260a31c00d@oss.qualcomm.com>
 <20251222-sm6150_evk-v1-3-4d260a31c00d@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20251222-sm6150_evk-v1-3-4d260a31c00d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/22/25 10:44, Wenmeng Liu wrote:
> Enable IMX577 via CCI on Taloss EVK Core Kit.
> 
> The Talos EVK board does not include a camera sensor
> by default, this overlay reflects the possibility of
> attaching an optional camera sensor.
> For this reason, the camera sensor configuration is
> placed in talos-evk-camera.dtso, rather than
> modifying the base talos-evk.dts.
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/Makefile              |  2 +
>   arch/arm64/boot/dts/qcom/talos-evk-camera.dtso | 64 ++++++++++++++++++++++++++
>   arch/arm64/boot/dts/qcom/talos.dtsi            | 21 +++++++++

Please split QCS615 MCLK definitions change into a separate commit.

>   3 files changed, 87 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 60121f133078b2754f98e6f45a3db4031b478cc8..b1d85b1f4a94714f2a5c976d162482d70ae920f2 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -325,7 +325,9 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-qrd.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-mtp.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-qrd.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk.dtb
> +talos-evk-camera-dtbs		:= talos-evk.dtb talos-evk-camera.dtbo
>   talos-evk-lvds-auo,g133han01-dtbs	:= talos-evk.dtb talos-evk-lvds-auo,g133han01.dtbo
> +dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-camera.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-lvds-auo,g133han01.dtb
>   x1e001de-devkit-el2-dtbs	:= x1e001de-devkit.dtb x1-el2.dtbo
>   dtb-$(CONFIG_ARCH_QCOM)	+= x1e001de-devkit.dtb x1e001de-devkit-el2.dtb
> diff --git a/arch/arm64/boot/dts/qcom/talos-evk-camera.dtso b/arch/arm64/boot/dts/qcom/talos-evk-camera.dtso
> new file mode 100644
> index 0000000000000000000000000000000000000000..ae1a02295b4dc48212aad40980a329ff458fe69a
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/talos-evk-camera.dtso
> @@ -0,0 +1,64 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.

Please add a missing year of the change.

> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/clock/qcom,qcs615-camcc.h>
> +#include <dt-bindings/gpio/gpio.h>
> +
> +&camss {
> +	vdd-csiphy-1p2-supply = <&vreg_l11a>;
> +	vdd-csiphy-1p8-supply = <&vreg_l12a>;
> +
> +	status = "okay";
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		port@1 {
> +			reg = <1>;
> +
> +			csiphy1_ep: endpoint {
> +				clock-lanes = <7>;

Please remove 'clock-lanes' property.

> +				data-lanes = <0 1 2 3>;
> +				remote-endpoint = <&imx577_ep1>;
> +			};
> +		};
> +	};
> +};
> +
> +&cci {
> +	status = "okay";
> +};
> +
> +&cci_i2c1 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	camera@1a {
> +		compatible = "sony,imx577";
> +		reg = <0x1a>;
> +
> +		reset-gpios = <&tlmm 29 GPIO_ACTIVE_LOW>;
> +		pinctrl-0 = <&cam2_default>;
> +		pinctrl-names = "default";
> +
> +		clocks = <&camcc CAM_CC_MCLK2_CLK>;
> +		assigned-clocks = <&camcc CAM_CC_MCLK2_CLK>;
> +		assigned-clock-rates = <24000000>;
> +
> +		avdd-supply = <&vreg_s4a>;

Just one voltage supply?

> +
> +		port {
> +			imx577_ep1: endpoint {
> +				link-frequencies = /bits/ 64 <600000000>;
> +				data-lanes = <1 2 3 4>;
> +				remote-endpoint = <&csiphy1_ep>;
> +			};
> +		};
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
> index ebb1807f0222c075d4207163ed4359a55616d903..3626312f138f2e8f1888eb6aa43fa474cdee884f 100644
> --- a/arch/arm64/boot/dts/qcom/talos.dtsi
> +++ b/arch/arm64/boot/dts/qcom/talos.dtsi
> @@ -1550,6 +1550,27 @@ tlmm: pinctrl@3100000 {
>   			#interrupt-cells = <2>;
>   			wakeup-parent = <&pdc>;
>   
> +			cam0_default: cam0-default-state {
> +				pins = "gpio28";
> +				function = "cam_mclk";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};
> +
> +			cam1_default: cam1-default-state {
> +				pins = "gpio29";
> +				function = "cam_mclk";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};
> +
> +			cam2_default: cam2-default-state {
> +				pins = "gpio30";
> +				function = "cam_mclk";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};
> +

Please add to the list another pad with MCLK function, which is GPIO31.

>   			cci_default: cci0-default-state {
>   				cci_i2c0_default: cci-i2c0-default-pins {
>   					/* SDA, SCL */
> 

-- 
Best wishes,
Vladimir

