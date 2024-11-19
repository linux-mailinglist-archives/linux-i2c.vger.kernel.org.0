Return-Path: <linux-i2c+bounces-8048-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D4EFC9D2862
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Nov 2024 15:42:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 70E091F22AC8
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Nov 2024 14:42:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B42881CF28C;
	Tue, 19 Nov 2024 14:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZPDAM1sq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EDCA1CEAAF
	for <linux-i2c@vger.kernel.org>; Tue, 19 Nov 2024 14:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732027363; cv=none; b=haCX84Vk6UWYwsgT0fMPHTMGlP+GpXsvrRFH1vrmQITwdq9F5Ur0/2TL3+ji5NfpG+ijJfZ8B/R8TRaCxZNMzmqQAmI2jVKIQkgcurRt8JhGBpCR5TjMWB/rip06WYIv9LWsFGOG439LGIJJbECfP33lH46qNNQg/yJazVYQznA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732027363; c=relaxed/simple;
	bh=R1ajexPdvIphNIra9AbXXEdtkHIsL7C7g6E/2DMe70c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FLUA4yLT86kMiEW+TFr5XZpQHuND8xJwwo3AizjCMcqqHl+uN5Y26eYGeVJPHzP5RBVo6TxCTH34zbzBvkOyEKqLX9CskUbHc+0y9296oNta8a8Hi8jTiwuNkNp8+NwsmbocbHPXhIltmsLeQGe36gNVfOu4yq1yNtzPl359eww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZPDAM1sq; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-539f1d96668so688078e87.3
        for <linux-i2c@vger.kernel.org>; Tue, 19 Nov 2024 06:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732027360; x=1732632160; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SurX9BN/DC6DwAYMxE7Q/YA36Hgd/kBmE7ViWjyPVZI=;
        b=ZPDAM1sqMNXQF9A57xk1j8DmXzgOKHe50RQA8z8svMZD1z/Fe74FTqsm/RDOoj8A3K
         IJF6pTgm2ORmMMpWNFuAIXIpVJUjqDr8SrZL39wkku5MBkKzy/RYTCdECcI5niPaQMuT
         oDAkCWSA2DP6hV4PeRCbj6qLdow/Lh9eeLM97CYaE4d5GZSr13SqpqTRAtRUolF+Cm3r
         Hh1C07KHsajzwbnpwtmOZkWKQ21IUj69WqlnaKEIkuuzJEkj60FDlEAmbc6SWBZF7vx8
         Koy/Thy8dKE5W9msT8N7pvcC/Jp0wLKaUYxBlMd7mkkno4uzDZU6ZdRc+5/elqZuw07k
         kBEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732027360; x=1732632160;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SurX9BN/DC6DwAYMxE7Q/YA36Hgd/kBmE7ViWjyPVZI=;
        b=nUCrW5Gj+gpJaI4mdm8v5HKc768tUJAPvyrmUvn/p4jG+QpKAWmyMVZaZIaLjKmpe/
         KJ4IWbQwJyq/a0QHWwA3LtqjYmjNEW/1KyTJWaG9sm6jbuTgyD/eC9WXw+kglaqjTLpP
         5USuke18XkmrN5JEzKoV84ge6VeJmq8cPsx7LikWrlfEZOTdNfI7VLgFdTmJjpkivKfO
         vqTOAjmQg9cChZdqsPgJx45EgCXpO3pZ1hmvLAr4CgQVRV+zAcVabUhQFq8WyQEMsolV
         tsGekbxPuoTWER2r7F97dLay68PIpeo+PYf+4nRBMQm29PYSy6ROM8qOAHsIFJSEXEhq
         hKuw==
X-Gm-Message-State: AOJu0YyF2UExJ0HmPFjQBUFhqO/0dlCEtMwyMy8RIABuYgbN+tr9UbYc
	B8IdY985c7c0sGcVvwXvLwA71f9pyyxonqqKgX+1uVHuOXkCXKcZkmr2KsIuuIQ=
X-Google-Smtp-Source: AGHT+IH6JYGkb1+ne7m5ZidGIkGxvPbPnmcyh3tZvzx/YGyvq8DGZAWthS85I5lGqDqBX/Teybn7UA==
X-Received: by 2002:a05:6512:3404:b0:535:4144:e682 with SMTP id 2adb3069b0e04-53dab3aedf3mr2250335e87.11.1732027359788;
        Tue, 19 Nov 2024 06:42:39 -0800 (PST)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dbd46735bsm310929e87.161.2024.11.19.06.42.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Nov 2024 06:42:38 -0800 (PST)
Message-ID: <c6f08190-0358-4dcf-8c6c-3ff440f6efbc@linaro.org>
Date: Tue, 19 Nov 2024 16:42:36 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] arm64: dts: qcom: x1e80100: Add CCI definitions
Content-Language: en-US
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
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org
References: <20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v1-0-54075d75f654@linaro.org>
 <20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v1-5-54075d75f654@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v1-5-54075d75f654@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bryan,

On 11/19/24 15:10, Bryan O'Donoghue wrote:
> Add in 2 CCI busses. One bus has two CCI bus master pinouts:
> cci_i2c_scl0 = gpio101
> cci_i2c_sda0 = gpio102
> cci_i2c_scl1 = gpio103
> cci_i2c_sda1 = gpio104
> 
> A second bus has a single CCI bus master pinout:
> cci_i2c_scl2 = gpio105
> cci_i2c_sda2 = gpio106
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/x1e80100.dtsi | 162 +++++++++++++++++++++++++++++++++
>   1 file changed, 162 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> index 5119cf64b461eb517e9306869ad0ec1b2cae629e..c19754fdc7e0fa4f674ce19f813db77fe2615cf3 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> @@ -4648,6 +4648,88 @@ usb_1_ss1_dwc3_ss: endpoint {
>   			};
>   		};
>   
> +		cci0: cci@ac15000 {
> +			compatible = "qcom,x1e80100-cci", "qcom,msm8996-cci";
> +			reg = <0 0x0ac15000 0 0x1000>;
> +
> +			interrupts = <GIC_SPI 460 IRQ_TYPE_EDGE_RISING>;
> +
> +			clocks = <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
> +				 <&camcc CAM_CC_SLOW_AHB_CLK_SRC>,
> +				 <&camcc CAM_CC_CPAS_AHB_CLK>,
> +				 <&camcc CAM_CC_CCI_0_CLK>;
> +			clock-names = "camnoc_axi",
> +				      "slow_ahb_src",
> +				      "cpas_ahb",
> +				      "cci";

cpas_ahb clock is a child of slow_ahb_src clock, please follow the
newly introduced scheme, and exclude slow_ahb_src clock from the list.

> +
> +			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +
> +			pinctrl-0 = <&cci0_default>;
> +			pinctrl-1 = <&cci0_sleep>;
> +			pinctrl-names = "default", "sleep";
> +
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			status = "disabled";
> +
> +			cci0_i2c0: i2c-bus@0 {
> +				reg = <0>;
> +				clock-frequency = <1000000>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +
> +			cci0_i2c1: i2c-bus@1 {
> +				reg = <1>;
> +				clock-frequency = <1000000>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +		};
> +

--
Best wishes,
Vladimir

