Return-Path: <linux-i2c+bounces-9766-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B21A2A5917C
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Mar 2025 11:44:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6DE793AA79F
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Mar 2025 10:44:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40AF9226CFE;
	Mon, 10 Mar 2025 10:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YpT5XZiE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234A422687B
	for <linux-i2c@vger.kernel.org>; Mon, 10 Mar 2025 10:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741603485; cv=none; b=mNKPCf81Tj/U0ACvjjVVOmIJog3KWHmXG7fnHSfLMc5dNuv5+icTdNEapSbktUUsTX+iofSobHFypCfUbYR/HnoyB9X9rV8FyNXhuCYwUZ8rhnkmBlarsLg3u9CVIlpw0IIMBzfF2BFESbU0GgMYnDTMyGpbg7958GuqZi8qRD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741603485; c=relaxed/simple;
	bh=W86R7IVl5vFPfAm4qhmA/ZOkcKxfvO+ui47zCi/gQsk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lZ+SDfuRs0AMjQu5DXOjrno8+9yAg+fYwqyZnV1uD0nmUd5RRZpAnZTk5/S7mORFSb2HiIrNNr8PL2u9mcBj4OO2uyYFnZBb5BNZqV4QpJlZt8IxvyQ+OZCnfu+oQN11b7AAl2VwFA8RBR2pqfz5YnEeypabJ+DU3MTGIhwMWWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YpT5XZiE; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54958954c63so611454e87.1
        for <linux-i2c@vger.kernel.org>; Mon, 10 Mar 2025 03:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741603481; x=1742208281; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5/dNvTB+PA3fGtHYrb54pNt4vjI9qtq4wZH4Xt7vLdk=;
        b=YpT5XZiEl2mh8tlu5ET2x0G0bC0U5fo7MYPtCCO8ogiGfJThFid47vj2d9waChGNQI
         EqfL87Fda2Dcv0VhqUqV/1menUCJKDas2TN0UjSbsRLAy6LMeQlYSnkaUH3rDC95q7nx
         28uNUkN9R8oRoCUJA0dTSmIdbpxHaa3LlbDkwi4dCRC2pnWWEZcC7RNVL3qDZntdnoZd
         ujURdkvBt665qP8XIB9pbQdbWvY7ixJ5VYxn4Wboq5ScHjgEH8MXv/msbBn9WxOMKaA5
         bTxNIEFKgblpJ8zWP9ZHuLDpl9mR1xE5FXDRqyq0A42GK2qDbczGwcnuoVSUXEe/GjyU
         X5PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741603481; x=1742208281;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5/dNvTB+PA3fGtHYrb54pNt4vjI9qtq4wZH4Xt7vLdk=;
        b=gKfncui32olzULdrcNY3KzfwMYzMCqFdGUkb8FG0h3ivRcJCpS5uzakGi0xsHL6XZQ
         pTgGSsKbTSBfqqZAQN4PzRBEY+45STfrYUxcQFKpC2FSluWZH9GuYx+KVDX+m5WVZw2F
         XtOnp010ZOvK0ZUpZCzYwe3n1SP0jssWHEAJKcIDnlm8ttqRONONl8M6+M7gwbEYqxhA
         7pU0nrhv1TaYOAP+CzUwaVfNLWKOysU9gWZZJYN0gpQ8FgIV+zCUAID+CmI89fpJtaWA
         k6MOoLErgAM0hwj3U4MkmsjGVVyVnEoP9/p9+3A4nAvxrrV2/ldyWS+XIfsDGTyUHFAe
         38bg==
X-Gm-Message-State: AOJu0Yzso141TtF6j3LryCCm9AUJ3TxqVYXprzLCBPGO8dK+rIkF5E/y
	7wV9y7HjbRGy0pbzp6qA4K3DELyUhCtRtytcMStXoQLWNwAxYEvuUFfXzPWN3kk=
X-Gm-Gg: ASbGnctHwxWO5OohEN3YqDnwrJZFjE4px6Ogt0zXSzcfJhvAHt4dvX0L5rUKcYlXjfF
	PVS7QcwvIxUNwSRshKDrXUa1Y7W2rxLQ08Zdk2koi+nxeDzDZAlGDcG4xOI3FWyM4XsEUsgYOFN
	Yc/QoRcMBWJrh18RO4BGe1esuyqyJik5j34DOpQoT0GiLacCt+S8OCXl8u8CiZ49/zqBDWSahLr
	bSnaxHkYFFFqhNySUxzKlqgkdDDUyAxNVETr4tP03JL8U3c1FCA9dLyp6FKgdz09b/bMriuq2Uc
	olXHyX1qKquDApxyOFZABeYF43hDAMEQaSSR/DiJmRfB36Nm8mQRZAwnG6EWuqAS808vB+xhyBh
	1W7jvu1cR4wskb2xVcVEysTBSwVRHVjvoig==
X-Google-Smtp-Source: AGHT+IGkvmrK54Y77DiLpPeyH9HX5ppOK5F0WcDiedCMulR61NdC/bj3JYvNA4VroVbjFSvPxhCb7Q==
X-Received: by 2002:a05:6512:114f:b0:549:9044:94b0 with SMTP id 2adb3069b0e04-54998e25595mr1026427e87.4.1741603479687;
        Mon, 10 Mar 2025 03:44:39 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5498b0bd08asm1407721e87.124.2025.03.10.03.44.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Mar 2025 03:44:39 -0700 (PDT)
Message-ID: <57222e16-0760-4832-ac15-0bd5ffe21077@linaro.org>
Date: Mon, 10 Mar 2025 12:44:25 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] arm64: dts: qcom: x1e80100: Add CAMCC block
 definition
Content-Language: ru-RU
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Jagadeesh Kona <quic_jkona@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v4-0-c2964504131c@linaro.org>
 <20250119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v4-2-c2964504131c@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20250119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v4-2-c2964504131c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Bryan.

On 1/19/25 02:54, Bryan O'Donoghue wrote:
> Add the CAMCC block for x1e80100. The x1e80100 CAMCC block is an iteration
> of previous CAMCC blocks with the exception of having two required
> power-domains not just one.
> 
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/x1e80100.dtsi | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> index 9d38436763432..10035bcfa89bb 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> @@ -5,6 +5,7 @@
>   
>   #include <dt-bindings/clock/qcom,rpmh.h>
>   #include <dt-bindings/clock/qcom,sc8280xp-lpasscc.h>
> +#include <dt-bindings/clock/qcom,x1e80100-camcc.h>
>   #include <dt-bindings/clock/qcom,x1e80100-dispcc.h>
>   #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
>   #include <dt-bindings/clock/qcom,x1e80100-gpucc.h>
> @@ -5109,6 +5110,21 @@ usb_1_ss1_dwc3_ss: endpoint {
>   			};
>   		};
>   
> +		camcc: clock-controller@ade0000 {
> +			compatible = "qcom,x1e80100-camcc";
> +			reg = <0 0x0ade0000 0 0x20000>;
> +			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
> +				 <&bi_tcxo_div2>,
> +				 <&bi_tcxo_ao_div2>,
> +				 <&sleep_clk>;
> +			power-domains = <&rpmhpd RPMHPD_MXC>,
> +					<&rpmhpd RPMHPD_MMCX>;
> +			required-opps = <&rpmhpd_opp_low_svs>;

Since I believe here is the error in the device tree bindings, it makes
sense to fix it before adding the clock controller into the platform dtsi
file, please review the proposed change:

https://lore.kernel.org/all/20250304143152.1799966-1-vladimir.zapolskiy@linaro.org/

> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +			#power-domain-cells = <1>;
> +		};
> +
>   		mdss: display-subsystem@ae00000 {
>   			compatible = "qcom,x1e80100-mdss";
>   			reg = <0 0x0ae00000 0 0x1000>;
> 

--
Best wishes,
Vladimir

