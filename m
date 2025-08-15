Return-Path: <linux-i2c+bounces-12306-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BEB5B27B04
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Aug 2025 10:30:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 59D1A5C8319
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Aug 2025 08:30:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6670B2C0F97;
	Fri, 15 Aug 2025 08:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="foXLnOzp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A9E24BBEB
	for <linux-i2c@vger.kernel.org>; Fri, 15 Aug 2025 08:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755246609; cv=none; b=n72gstjMCw7gRdvVgKUR0zJTIdqozkhGeUN9kFSHtcwgZlACmt/fvXZrXh187LTZwM27SzRKFTdQOM1OHx7IiL0UuNVlUIVjvkQqAs4E5L0t47DnsWej8qyR2v23BHGtTRb1u55hU9TigM9g/L2uV/UeK5+RoEvv8XWzZJa4FNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755246609; c=relaxed/simple;
	bh=xK2/sQuboR8RxHlU5a6vsg5CxWE9FmGx9avjyrBFlPE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G5Z4tqauUUL89tpbeRHKdP+9G442VAgImXN6u0wNVuQL1syXGGkk1g+mG8AYApNPgKQQO6UnG1lGPpNkaYfoxwE0JAE1/t46V2fqFtTV427CI8IeJaUGNYvljR9ZfG6psBklxdBnMOmTEmcHOZft+CwtnrXwASWJg2wqNtRk9ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=foXLnOzp; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3b9e4148134so905226f8f.2
        for <linux-i2c@vger.kernel.org>; Fri, 15 Aug 2025 01:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755246605; x=1755851405; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JajMyuBKXy9ESCn/BlvUni/IIWDRCCaEiDEiH+zh/Bk=;
        b=foXLnOzp5tk9bQ/OXCjRaaamM0k8ViSbD6hx9aGAV+quZ0I3RsQz2Mcsgactk9BC8d
         YBsEmWvTd+bh8MaGNkFZbxQxenT3Xs9NE9UXmXcQj0pNsQb3Xq9WEQpwSdncDWz8Dqn5
         Um8faARY2IMJENiUjcpBBvKaGXcuJYiPpOzxoGDeRkwQqeb8xkWWJYYK//7oy+slB3cl
         fHMkaR6Yy0HMeL5CY2P8o+I4sNnpNuvRHw4D1z/mzAAL7f2Wo2Xhka9J4Idfx6x64iD0
         UUSeS9pkr5j2R3fNXv5t2tpSHr21f82FcIUNxcHDc6x6o1EX2UF3iTJ9xQO7VfdOpUDI
         QPNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755246605; x=1755851405;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JajMyuBKXy9ESCn/BlvUni/IIWDRCCaEiDEiH+zh/Bk=;
        b=BigD0S/pHate/kWVWRhzAxGhNidwBU2o/3HpCHOsu/AIjCFdvNk0ebyvpBKhoGnyTo
         v8wRx5/pZDdOzkBcY+1Hl+i4ct90oabwonPwf6uqoydGnjqHJKrcQRlKDiUkneHxOF8G
         U0hH2fszCLTcaGQ4KKhEliqPemGjJloQG+evWlx/QIhb0d/dbQG5yIXxhBbE5uGdfFpV
         w1TgKhqJqb+RVvixFbVb9KrmwdwZ3KiFDEHWsuNZZstYyOWW4GHly+yuJSnAtXJhUeZC
         5FqOeAmD3nojt5EPR0Jr5xD0kZOpMhGcbrtKS4x8KDPQfyRqFk5B6LdreE3zLfmy4DCw
         D+hQ==
X-Gm-Message-State: AOJu0YwOTQcP0/r4jtp6Pez4iGB2cUTmsQG6ZfHJZH9NHpPckCT6cwwY
	GKNyNTaTgryZGAdshLCWSqzrc2F5kXVxHCx2zBzv0xZFXyGdHZU9zknJfI7el5QvNUo=
X-Gm-Gg: ASbGncsmSMcttarMgb9ixLL+8SLPSuy4gfAIy5JzIoVucvA36Ybnrwm+ynuVp4XdtOn
	H8669Y+8wyezuXhj7LQFcoE4usIo3ZbddKpFOeygA5LwU2HfFtEoxWDRcv2cJPaBz+19SeA/oGK
	1oS/FfkFOWpDKit6a49R3MP+kliZ6U/LwA2FTLVYoNor3Xjcl/w2CMHC3WWfD7jC35u6py1MW9n
	GeMnB4Y/92dQLaqjDnSzBHgYPqD9fD1SFUUDgSDMcenCkckcJfvDTN5TtoloxitvQTo6UGf3ijr
	b8ahO32PS1XzSjDM9N/L83s1lnRDjSEKcG7TTveai0pKtwA5QhrmXf8p+iyxG+D5p+iy2mIXrgx
	kHEribFpTNaPaLBcwadlzeURPAiY9bsvvjih6D6Fa8Ba+pIsqS8E6XnYShN1eUT8=
X-Google-Smtp-Source: AGHT+IH6BHDtxDki2/fJTwfcRFDg2YRitQJxCzC/GAWvq48MmAeyra1tafJyjDtDGVdg3mMlF+gFGw==
X-Received: by 2002:a05:6000:26d0:b0:3b7:89c2:463c with SMTP id ffacd0b85a97d-3bb68734babmr758441f8f.29.1755246605489;
        Fri, 15 Aug 2025 01:30:05 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3bb653f657fsm1098135f8f.29.2025.08.15.01.30.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Aug 2025 01:30:04 -0700 (PDT)
Message-ID: <3caf5615-a813-42a0-b77a-695f250ea01d@linaro.org>
Date: Fri, 15 Aug 2025 09:30:03 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: lemans-evk-camera: Add DT
 overlay
To: Wenmeng Liu <quic_wenmliu@quicinc.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, vladimir.zapolskiy@linaro.org,
 todor.too@gmail.com
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20250815-rb8_camera-v2-0-6806242913ed@quicinc.com>
 <20250815-rb8_camera-v2-3-6806242913ed@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250815-rb8_camera-v2-3-6806242913ed@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/08/2025 08:07, Wenmeng Liu wrote:
> Enable IMX577 via CCI1 on Lemans EVK.
> 
> Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
> ---
>   arch/arm64/boot/dts/qcom/Makefile               |   4 +
>   arch/arm64/boot/dts/qcom/lemans-evk-camera.dtso | 105 ++++++++++++++++++++++++
>   2 files changed, 109 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 94a84770b0802a9dc0c56ce6c59eea20967a5d89..7efd113143013c6e9d211597a4c2defd44497c83 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -30,6 +30,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp449.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp453.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp454.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk.dtb
> +
> +lemans-evk-camera-dtbs	:= lemans-evk.dtb lemans-evk-camera.dtbo
> +
> +dtb-$(CONFIG_ARCH_QCOM) += lemans-evk-camera.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= msm8216-samsung-fortuna3g.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-acer-a1-724.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-alcatel-idol347.dtb
> diff --git a/arch/arm64/boot/dts/qcom/lemans-evk-camera.dtso b/arch/arm64/boot/dts/qcom/lemans-evk-camera.dtso
> new file mode 100644
> index 0000000000000000000000000000000000000000..4600d5441cce4507734b2fdcdbffc1ad7c67c32d
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/lemans-evk-camera.dtso
> @@ -0,0 +1,105 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2024-2025 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +/*
> + * Camera Sensor overlay on top of leman evk core kit.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/clock/qcom,sa8775p-camcc.h>
> +#include <dt-bindings/gpio/gpio.h>
> +
> +&{/} {
> +	vreg_cam1_1p8: vreg_cam1_1p8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg_cam1_1p8";
> +		startup-delay-us = <10000>;
> +		enable-active-high;
> +		gpio = <&pmm8654au_0_gpios 8 GPIO_ACTIVE_HIGH>;
> +	};
> +};
> +
> +&camcc {
> +	status = "okay";
> +};
> +
> +&camss {
> +	vdda-pll-supply = <&vreg_l1c>;
> +	vdda-phy-supply = <&vreg_l4a>;
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
> +				data-lanes = <0 1 2 3>;
> +				remote-endpoint = <&imx577_ep1>;
> +			};
> +		};
> +	};
> +};
> +
> +&cci1 {
> +	pinctrl-0 = <&cci1_0_default>;
> +	pinctrl-1 = <&cci1_0_sleep>;
> +
> +	status = "okay";
> +};
> +
> +&cci1_i2c0 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	camera@1a {
> +		compatible = "sony,imx577";
> +		reg = <0x1a>;
> +
> +		reset-gpios = <&tlmm 133 GPIO_ACTIVE_LOW>;
> +		pinctrl-0 = <&cam1_default>;
> +		pinctrl-names = "default";
> +
> +		clocks = <&camcc CAM_CC_MCLK1_CLK>;
> +		assigned-clocks = <&camcc CAM_CC_MCLK1_CLK>;
> +		assigned-clock-rates = <24000000>;
> +
> +		dovdd-supply = <&vreg_s4a>;
> +		avdd-supply = <&vreg_cam1_1p8>;
> +
> +		port {
> +			imx577_ep1: endpoint {
> +				clock-lanes = <7>;
> +				link-frequencies = /bits/ 64 <600000000>;
> +				data-lanes = <0 1 2 3>;
> +				remote-endpoint = <&csiphy1_ep>;
> +			};
> +		};
> +	};
> +};
> +
> +&tlmm {
> +	cam1_default: cam1-default-state {
> +		mclk-pins {
> +			pins = "gpio73";
> +			function = "cam_mclk";
> +			drive-strength = <2>;
> +			bias-disable;
> +		};
> +
> +		rst-pins {
> +			pins = "gpio133";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-disable;
> +		};
> +	};
> +};
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

