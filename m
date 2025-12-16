Return-Path: <linux-i2c+bounces-14571-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 268E4CC2E84
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Dec 2025 13:48:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 788A1300DB9E
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Dec 2025 12:48:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1237C393786;
	Tue, 16 Dec 2025 12:48:16 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB4E393761;
	Tue, 16 Dec 2025 12:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765889295; cv=none; b=p4O6MB3LivnnK2MUfNP/zINgzuCSZXNAJE8UA1Oxpy82ukNsDLQjlW/iiLadApf7g2xoGEeifu3c1r9UWpVTT24rZhlMwlRxblUfGHIpF7m+UANxW3AlPzAzdPHfapkmaPmzUkOzg3obra0NGN0QZUSAVKyc2hm7KGWGPiC/+fA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765889295; c=relaxed/simple;
	bh=Tw2fk9ppgh2OasQKxSKeyaRTdpsM6Gy9JZYA5AN5GGU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CS+3Sirk4RnZeUafOdaV+ATQk+Hqb4rLMlfiPhqUyy2hPyaGv2ExS5tn/ymSsJCfYLifccuFaRBBvig9N7iGCtJ4UMOwoL2dsQRrnUsmhjcZSxIycrwQ+1KmmBZEP6SWJCBTCZjdGRlKec6NaMOOW1RJsNwgcYncRJ+I1jiKqJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0C43C4CEF1;
	Tue, 16 Dec 2025 12:48:12 +0000 (UTC)
Message-ID: <57203b54-982d-4900-bdbf-ebaf3f05e369@nxsw.ie>
Date: Tue, 16 Dec 2025 12:48:10 +0000
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sm7225-fairphone-fp4: Add camera
 fixed regulators
To: Luca Weiss <luca.weiss@fairphone.com>,
 Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20251210-fp4-cam-prep-v1-0-0eacbff271ec@fairphone.com>
 <rmgLrxnSeIR_2rrs0F7r5Qjef-PYKAg7T8A0cl2sSKk985A41TyFHiQtpv97ww-OuKZXXMo04GBZaFndip0TAg==@protonmail.internalid>
 <20251210-fp4-cam-prep-v1-3-0eacbff271ec@fairphone.com>
From: Bryan O'Donoghue <bod.linux@nxsw.ie>
Content-Language: en-US
In-Reply-To: <20251210-fp4-cam-prep-v1-3-0eacbff271ec@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/12/2025 01:05, Luca Weiss wrote:
> Add multiple fixed regulators that are found on the phone, which provide
> power to the cameras.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>   arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts | 40 +++++++++++++++++++++++
>   1 file changed, 40 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
> index c2f856a56b2b..0cfb24e3941d 100644
> --- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
> +++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
> @@ -246,6 +246,46 @@ active-config0 {
>   			};
>   		};
>   	};
> +
> +	vreg_32m_cam_dvdd_1p05: regulator-32m-cam-dvdd-1p05 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "32M_CAM_DVDD_1P05";
> +		regulator-min-microvolt = <1050000>;
> +		regulator-max-microvolt = <1050000>;
> +		gpio = <&pm6150l_gpios 2 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		vin-supply = <&vreg_s8e>;
> +	};
> +
> +	vreg_48m_ois_avdd0_1p8: regulator-48m-ois-avdd0-1p8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "48M_OIS_AVDD0_1P8";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		gpio = <&pm6150l_gpios 4 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		vin-supply = <&vreg_bob>;
> +	};
> +
> +	vreg_48m_uw_avdd0_1p8: regulator-48m-uw-avdd0-1p8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "48M_UW_AVDD0_1P8";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		gpio = <&pm6150l_gpios 3 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		vin-supply = <&vreg_bob>;
> +	};
> +
> +	vreg_ois_2p8: regulator-ois-2p8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "OIS_2P8";
> +		regulator-min-microvolt = <2800000>;
> +		regulator-max-microvolt = <2800000>;
> +		gpio = <&tlmm 72 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		vin-supply = <&vreg_bob>;
> +	};
>   };
> 
>   &adsp {
> 
> --
> 2.52.0
> 
> 

LGTM: 
https://www.fairphone.com/wp-content/uploads/2022/09/FP4_Information-for-repairers-and-recyclers.pdf

Reviewed-by: Bryan O'Donoghue <bod@kernel.org>

---
bod

