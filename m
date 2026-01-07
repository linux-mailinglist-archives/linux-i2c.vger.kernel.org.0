Return-Path: <linux-i2c+bounces-14947-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C859ACFBF97
	for <lists+linux-i2c@lfdr.de>; Wed, 07 Jan 2026 05:33:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 99BCF30935E4
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Jan 2026 04:28:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDC8324501B;
	Wed,  7 Jan 2026 04:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mIk2hFqY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B634239E60
	for <linux-i2c@vger.kernel.org>; Wed,  7 Jan 2026 04:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767760115; cv=none; b=PI1cskgkzpa514gPZ0gxRN4oK5QtowzFsqAMrqVL9RpeMEfbb6/Da3lGfL6gZ19e8X6Exf/HQU/OqTEpn3uv4/t1rrDoS7OBF27Qa5cPjo/NicDqa6vK4sXNQPzlv1frtCcxGG7mgCgBGse+Ug5vl8Pd75GsFcnoeWuDlwWkyxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767760115; c=relaxed/simple;
	bh=srOqe4eFRPtpweRyP1S1bgmYqoSW0uhY2pL3ISZa9eg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bZpjQRaqIU1C1HgkDK1LN8JJiS7JMp0B10MIW/pqYVY2RlrjgRlRGAj+U8XEbbNEXEyNaDk4d6qWxZ4h2xHSpAyBamKQKwpDgmyJjR5xGsndkOSJGiRYD1377E0fOAwK3xPQ+MIv2mSPpOz+Dp3GPtSBiyXfOguxiKOFC2LTeqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mIk2hFqY; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-382fa1044f1so1171351fa.0
        for <linux-i2c@vger.kernel.org>; Tue, 06 Jan 2026 20:28:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767760111; x=1768364911; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FE+2YmvPFSDvLHiA5oySCSRiMBW6t3izoKb4GQ+6LTE=;
        b=mIk2hFqY/xt8bmgZ5ySVYY8RRIdD9cbapUpc3kOq+JraXWC0I6Ph2DwucqWFJWAznd
         r9AV4k6jvlhVhhBwa4Ms0RI2h06Ideulxq3Qs4rHgFIBaV+CVUaxF3yidVtxbAIMktlr
         lyxdiZE6s5OBJ92qRvt7W5A8DuotlPMMViCHSeDdB/Ki+/25QlTDrnc6jnPZIdmLCKA+
         gITFsQ62RKLvPoA5jQuM26e7V/E5bNp2VJU5OAMil1zJbhmHoNxjNVjpVeg6kbS71jD3
         IOU+p7FoIq3qaY4V5x4gQCBoU0KAivBSFaIBZWBtxsSiAm6P7TEJuKZ1P6UWDk+APME0
         qDcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767760111; x=1768364911;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FE+2YmvPFSDvLHiA5oySCSRiMBW6t3izoKb4GQ+6LTE=;
        b=UrNsVQhAyx7x0Rf/mr6wGVWsUm2E/9YYyioiL1QnSwtw/wc2gtNOVPCabdQqHIGC91
         yboQXhymvFwyD0VR3IX6gvpvXOU4HvSydoZgT+flqKX1XmYThvLV5GJg7NpwFlZNCmpb
         eVdlqRKxbCdOPUux6th95kyCRz89F4xqAZ8y2ZGABOFgImsEx52s7XDIVA7wbJ3KGWIM
         jBfqQYLJF351+B+hbMbtNlWMbFktxQUvzHWmrdzGLoR2Ec80WlfateFEptB/qriQurDy
         iEbuk0T09Uifsqxl97ozBOtq5A3Nhm8eNWhPFUQtHGv6Ia4FNPfJkUoJ8kOaWy3wV8KO
         e69w==
X-Gm-Message-State: AOJu0Yxw5IGwxS2r/Fnf6uywyttnYCoxvMQcn2rWdyVADEFz9+YH0Cdy
	8uDslsOaPGO4BXlW7M4Gjy46p0C8Bh9TkrRnnP7I40us25fut2VjX4GtRAm4FHKjF1w=
X-Gm-Gg: AY/fxX5nfsrzzD4K3gd2S7/ZJESr5huHa/6wzxcTB85QZ0a2DCgnIpSFE4tyk2RKeAh
	i6eUOcEV9zlCpO18pb7sLCMzlirVWe5kBQ/NaaFY7BuW6Op/HZYWA+D9ruDxC5izY3Ol8ineU7E
	he26z99ysEL7e4WMiU9IWnqFv9/OV1fwewR44t4eBJy5IHTx0drL+pCRD6vJINbyOJ6zJnFNgIS
	kAbGtn2D2k9ZA2FfSfexdHN8kiRPX3AMp5hq2MgqQQIXh8fqPNqXLEpJ65QBLcDvKe0CU1bN8pR
	gsUUz9bjX2rw52kx/8vr+nqT5IrE1MmnWCpRdW9kRrMRd4+RsZmBZ52BJD/XMMH6vk4M7iS7kmw
	uTD2aiXitaZkvcroR+PM/bjeN0vS7GLib+6+6UAejUk3jtBjUcOs0i/+qNl9mTabH3M7WGu5L3z
	LLpgxMhTuFN5Xgh+Te4jmM/WGzSrX8kr4EBEHTCJAmWsstvhv5lfONPshPiD7TBYBIUQ==
X-Google-Smtp-Source: AGHT+IEqxF6cQijW4ECigSDx+3+M10m8yd167msij/oEGUdxXWEYagAH3B736atxjGFlwKDWDwqLiw==
X-Received: by 2002:a05:6512:3d1c:b0:59b:1d24:7db7 with SMTP id 2adb3069b0e04-59b6ebd30d8mr228697e87.0.1767760111195;
        Tue, 06 Jan 2026 20:28:31 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65d5dd1fsm1012485e87.48.2026.01.06.20.28.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 20:28:29 -0800 (PST)
Message-ID: <663e3d61-1be3-4342-9dc0-a07d2b9c238e@linaro.org>
Date: Wed, 7 Jan 2026 06:28:27 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: talos: Add CCI definitions
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20260106-sm6150_evk-v2-0-bb112cb83d74@oss.qualcomm.com>
 <20260106-sm6150_evk-v2-2-bb112cb83d74@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260106-sm6150_evk-v2-2-bb112cb83d74@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/6/26 11:39, Wenmeng Liu wrote:
> Qualcomm Talos SoC contains single controller,
> containing 2 I2C hosts.
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/talos.dtsi | 72 +++++++++++++++++++++++++++++++++++++
>   1 file changed, 72 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
> index e1dfaff9b6bf8641b19a685e74d60ad4e1e99d41..461a39968d928260828993ff3549aa15fd1870df 100644
> --- a/arch/arm64/boot/dts/qcom/talos.dtsi
> +++ b/arch/arm64/boot/dts/qcom/talos.dtsi
> @@ -1549,6 +1549,42 @@ tlmm: pinctrl@3100000 {
>   			#interrupt-cells = <2>;
>   			wakeup-parent = <&pdc>;
>   
> +			cci_default: cci0-default-state {
> +				cci_i2c0_default: cci-i2c0-default-pins {
> +					/* SDA, SCL */
> +					pins = "gpio32", "gpio33";
> +					function = "cci_i2c";
> +					drive-strength = <2>;
> +					bias-pull-up;
> +				};
> +
> +				cci_i2c1_default: cci-i2c1-default-pins {
> +					/* SDA, SCL */
> +					pins = "gpio34", "gpio35";
> +					function = "cci_i2c";
> +					drive-strength = <2>;
> +					bias-pull-up;
> +				};
> +			};
> +
> +			cci_sleep: cci-sleep-state {
> +				cci_i2c0_sleep: cci-i2c0-sleep-state {
> +					/* SDA, SCL */
> +					pins = "gpio32", "gpio33";
> +					function = "cci_i2c";
> +					drive-strength = <2>;
> +					bias-pull-down;
> +				};
> +
> +				cci_i2c1_sleep: cci-i2c1-sleep-state {
> +					/* SDA, SCL */
> +					pins = "gpio34", "gpio35";
> +					function = "cci_i2c";
> +					drive-strength = <2>;
> +					bias-pull-down;
> +				};
> +			};
> +
>   			qup_i2c1_data_clk: qup-i2c1-data-clk-state {
>   				pins = "gpio4", "gpio5";
>   				function = "qup0";
> @@ -3785,6 +3821,42 @@ videocc: clock-controller@ab00000 {
>   			#power-domain-cells = <1>;
>   		};
>   
> +		cci: cci@ac4a000 {
> +			compatible = "qcom,sm6150-cci", "qcom,msm8996-cci";
> +
> +			reg = <0x0 0x0ac4a000  0x0 0x4000>;
> +			interrupts = <GIC_SPI 460 IRQ_TYPE_EDGE_RISING>;
> +			power-domains = <&camcc TITAN_TOP_GDSC>;
> +			clocks = <&camcc CAM_CC_SOC_AHB_CLK>,
> +				 <&camcc CAM_CC_CPAS_AHB_CLK>,
> +				 <&camcc CAM_CC_CCI_CLK>;
> +			clock-names = "soc_ahb",
> +				      "cpas_ahb",
> +				      "cci";
> +			pinctrl-0 = <&cci_default>;
> +			pinctrl-1 = <&cci_sleep>;
> +			pinctrl-names = "default", "sleep";
> +
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			status = "disabled";
> +
> +			cci_i2c0: i2c-bus@0 {
> +				reg = <0>;
> +				clock-frequency = <1000000>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +
> +			cci_i2c1: i2c-bus@1 {
> +				reg = <1>;
> +				clock-frequency = <1000000>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +		};
> +
>   		camss: isp@acb3000 {
>   			compatible = "qcom,sm6150-camss";
>   
> 

After making the changes asked by Dmitry

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

