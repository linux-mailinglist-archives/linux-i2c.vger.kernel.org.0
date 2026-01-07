Return-Path: <linux-i2c+bounces-14948-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1E9CFBFA6
	for <lists+linux-i2c@lfdr.de>; Wed, 07 Jan 2026 05:34:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C81EA30DE06D
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Jan 2026 04:29:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BE7624DCF9;
	Wed,  7 Jan 2026 04:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cn6yA1Fp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BEEC21D3F2
	for <linux-i2c@vger.kernel.org>; Wed,  7 Jan 2026 04:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767760141; cv=none; b=lArs3P22N/v1yF90SMQI0YPb720vbkAoTys33ql0XGl7RFrBDwNZJjVR9+/CaFJOtOYgefHjLGBWzErU5xAsdCZiAUpY/aCw3FD62F0TMbd8PZa2B2FGXbBvblWg5RDJtdILjH1BOFCS9K4TAOG7lqSlW08U6G0P4BMr9KaIrjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767760141; c=relaxed/simple;
	bh=haiB8Tt+8pZM04gZvK2wNWt/dPyIDOm+drx3AQALCHg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ascuPf39ZeRWv7fLtTQLd7mODfx+qFQnLECGW74B56rAvq2GchUhihZLR8Cvp+L6EUqSEVvuUmkvdHctVQ5Oj9t3Q78L4ZUcspLGBWQrxCJ0djixsffKcY3iR4fu9fSFO78fom7WB8bzWVfDgCa4chzhOnKpBz3wxdPAk8Z0xfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cn6yA1Fp; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-59b72c87109so2076e87.3
        for <linux-i2c@vger.kernel.org>; Tue, 06 Jan 2026 20:28:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767760136; x=1768364936; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jvcoTCO8VwPdehmxlS2rnFhrCL/5WSs/bRyMtF/vO1w=;
        b=cn6yA1FpWam7e5OM4uK9jnnosDnNZJ8FZokv+Cyfp1+skVKgMpy+8j2XTj0A3h+OrW
         /X5pYeQcC4uIwCgN1kSVBkc2OTjLqsX73g3MYGe7OOH0Q8+iqlfJgSIl24vYmuOB8kVM
         VoyNxHC0pHAec2kZe1TMwS4XjRjyXGw25dIGqPJfpaSRzaaVrHPgCrRU+Qe9YGg/im9f
         CkmVgz1MkMh2L/H/fcMZQazdZrdGaB8U/0EWZTNl6Gkvm6dG4w0d565B1L3/GBQzmi5G
         DJEj+D3mPljwqJE/pR3NCJywS7/9AG+qE0N6NcVET75MscbHBGbJY+ir8JelrmC2LbVn
         YBJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767760136; x=1768364936;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jvcoTCO8VwPdehmxlS2rnFhrCL/5WSs/bRyMtF/vO1w=;
        b=Xgkqle/MKFnsw/tY03t1Ypixh9KinpOZUSPURCwCFzWM+Qsn8cKtgCQSkpqz9XkCKg
         Nk6cxCEgZQS9SXh8tvMdOoCe8dcGGldPPXmwCCimOLaXh/W/uB1fLRRaUrnMBYNzTS9T
         K00hEC7RNX4m3kaLtNn1yzjrqhFm7goJsHJ9NsqAywTr9YpKZjlw2LJupfRpfyi97xGY
         W7XWhjb3xe+VJK1ciw0WisGSXMumQloMjDXdPz9f6VDTkAlaX/JxTHqNresce2r9u07d
         xnMYrwL1O6hGJyqP563nBspGDaiTPJyDIEI6n/YTDDmtWVCnRBbY2ew3tSFBvaCKh8IF
         kPEw==
X-Gm-Message-State: AOJu0YyhoAlYP2VtgjbP2oYimfYsszDYNPIG6inXGTfoCsv6AZJ0/luO
	LKQARr5wM84hbm0eX3DSb7buWIVEA4yzBax/tP2p4lCXK2VIxIxr+yG87U/czXY9pO4hWZM0MDm
	E0/l+
X-Gm-Gg: AY/fxX6eCR0VOPXeDfFRkFrtNGqonrspx6voMScdLWvzcP83DuNHOROX1EDvgeziTGj
	l8lSh3p5oCCG5D11N9onsKqXXQC1YagKyRYp3gC95BDdIpJDzWjg0WG9Ra2J6nCdtLfOxiQiH/8
	GweXMVV2H/pQ9opCm5pNoM0zS6ARQewfMyAFxjMvZ2yilkVvVTHM//akuac4lnYfcaGTHWdSUdY
	3i5ac5yHjDMzwpeL2QMWk3dGpHu/ks7uGgVmMOAj/PA+dyh1y1atV3tckG0TMZB7kZ/tQDVv0c9
	AjHsVzU51CUmrnXYK7RosFXK35oUei2qMClKhyjxLX5y/ZhhHxcgbO79Yr7m0b7s3PWq4sGIQkK
	kyX4z5+Rt2HFGRzhc1hwHQVXF/GvzIrM2Q0sZjFO2CC7L5/eZU2nXNy98wHJjZt0zADN/U4M+iD
	qmn4938GejDAV2g3vRqujG4VCJ2ng+PFNjE3iD9Ku9PrjWBxU0qHzv8yppbuGE+upe7g==
X-Google-Smtp-Source: AGHT+IF9hWgMq5ozizyKkYLFKj41duoqsihD4rtshBdk9J75mRrvbI9bzZFNP1DazvK48vDl2rVU5g==
X-Received: by 2002:a05:6512:3b25:b0:59b:7291:9cd8 with SMTP id 2adb3069b0e04-59b72919e55mr25847e87.7.1767760136292;
        Tue, 06 Jan 2026 20:28:56 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b6f3caba8sm271002e87.8.2026.01.06.20.28.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 20:28:55 -0800 (PST)
Message-ID: <b0b629d5-33de-41c1-90d5-b64cc29e5511@linaro.org>
Date: Wed, 7 Jan 2026 06:28:53 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: talos: Add camera MCLK pinctrl
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
 <20260106-sm6150_evk-v2-3-bb112cb83d74@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260106-sm6150_evk-v2-3-bb112cb83d74@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/6/26 11:39, Wenmeng Liu wrote:
> Define pinctrl definitions to enable camera master clocks on Talos.
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/talos.dtsi | 28 ++++++++++++++++++++++++++++
>   1 file changed, 28 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
> index 461a39968d928260828993ff3549aa15fd1870df..880fa10a2db993a82d31faf868195944128237c9 100644
> --- a/arch/arm64/boot/dts/qcom/talos.dtsi
> +++ b/arch/arm64/boot/dts/qcom/talos.dtsi
> @@ -1549,6 +1549,34 @@ tlmm: pinctrl@3100000 {
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
> +			cam3_default: cam3-default-state {
> +				pins = "gpio31";
> +				function = "cam_mclk";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};
> +
>   			cci_default: cci0-default-state {
>   				cci_i2c0_default: cci-i2c0-default-pins {
>   					/* SDA, SCL */
> 

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

