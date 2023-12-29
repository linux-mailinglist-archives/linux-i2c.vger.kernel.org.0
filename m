Return-Path: <linux-i2c+bounces-1070-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F5D81FE03
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Dec 2023 09:04:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E8B93B20E81
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Dec 2023 08:04:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84B0A7472;
	Fri, 29 Dec 2023 08:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oIzOOtvL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BECF66AA8
	for <linux-i2c@vger.kernel.org>; Fri, 29 Dec 2023 08:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-336897b6bd6so6478031f8f.2
        for <linux-i2c@vger.kernel.org>; Fri, 29 Dec 2023 00:04:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703837065; x=1704441865; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0VWBP1TVQ7NQgud/UujhhMlQGKCoT87k5cfBJC4USCo=;
        b=oIzOOtvLX8oxOgl/kB564knQV/hbgkwMOwaJO2aVa7wgYIPpEClXudNixvSPtV6SaH
         NrUXUDEeCG3cRZNH+zSfxK05qr4rkUJmjn0viGUbAE63tdS98HEQfhYpiYFblH7RzjiZ
         4AOGZNqIqrGjS+sSL4Zkf7utLvqLgSyBUIJOwZ0nrG76WEWx6XDQ6M1jElU+mpSDyH5n
         7CppcQPlEOV1VbIFKCF78EZ3GyUmTIqOBndylxLsGDoQR/+u++oHRshpIFGnqnupxS51
         QgMHO1Guth+gZueg+IvQed9GNVWcAD67L3qmOpKvKV+Wufg5rouHF1RyRztWBC+uIoZM
         xneg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703837065; x=1704441865;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0VWBP1TVQ7NQgud/UujhhMlQGKCoT87k5cfBJC4USCo=;
        b=MkeIcJs8L72I1thk6pJar/Qfes/kbXnSJE9QtEaqNnxzRRo2mBvvcFi41TBtl1Yz30
         u1wmXYbF8rn79+3Lp8m22IJcJIbOlIjO9bkzLGG0CRKexn/AqU9LRueXWaDM4FWNwXms
         R2sq55hv2S5N4Zx4EUOUPV+lc8h13QBPvWxw/hu3/42L8W4RB1swnjJ1zam/L1QqgZUl
         Rn60Vhg0I2cgHu1ppkZQG58KhHVQXVNE5zLm1DPZi57GKnzr9tP/inTsxaxsk6Bo7hBz
         oeKXI4OhhAI7upeZyyI5raIiQ0ITcv69rQQG1ah5Mtw5G/Zk0Lattt60qzwgfYMusXSd
         wEzg==
X-Gm-Message-State: AOJu0Yw4AA8TR0pO4SPrT5DPf/uDpVOHt8xq4iVnL/azLiiX9HX4LzMs
	lujVHCt5jrT3TkKSoMb1ST5SfyE6b0H39A==
X-Google-Smtp-Source: AGHT+IH9Rs1zXW90kwlrJC3ECsTBcBWiMXn1x3xfOgBLp2MCsAomAneZT6yIkeYVWtcDHWBCYYJ7vg==
X-Received: by 2002:a05:6000:100b:b0:336:8d4f:6b1b with SMTP id a11-20020a056000100b00b003368d4f6b1bmr6064936wrx.131.1703837064908;
        Fri, 29 Dec 2023 00:04:24 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id d5-20020adffbc5000000b00336e69fbc32sm7218151wrs.102.2023.12.29.00.04.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Dec 2023 00:04:24 -0800 (PST)
Message-ID: <387303b4-d912-480c-a50c-9f9efa386ef3@linaro.org>
Date: Fri, 29 Dec 2023 08:04:21 +0000
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/12] arm64: dts: exynos: gs101: define USI8 with I2C
 configuration
Content-Language: en-US
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 peter.griffin@linaro.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
 sboyd@kernel.org, conor+dt@kernel.org, andi.shyti@kernel.org,
 alim.akhtar@samsung.com, gregkh@linuxfoundation.org, jirislaby@kernel.org,
 s.nawrocki@samsung.com, tomasz.figa@gmail.com, cw00.choi@samsung.com,
 arnd@arndb.de, semen.protsenko@linaro.org
Cc: saravanak@google.com, willmcvicker@google.com,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-serial@vger.kernel.org, kernel-team@android.com
References: <20231228125805.661725-1-tudor.ambarus@linaro.org>
 <20231228125805.661725-12-tudor.ambarus@linaro.org>
 <a40b5d0dc3e151fede14aa00bcb853d1eeb8824b.camel@linaro.org>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <a40b5d0dc3e151fede14aa00bcb853d1eeb8824b.camel@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 12/28/23 14:04, André Draszik wrote:
> Hi Tudor,

Hi!

> 
> On Thu, 2023-12-28 at 12:58 +0000, Tudor Ambarus wrote:
>> [...]
>>
>> diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
>> index 0e5b1b490b0b..c6ae33016992 100644
>> --- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
>> +++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
>> @@ -354,6 +354,35 @@ pinctrl_peric0: pinctrl@10840000 {
>>  			interrupts = <GIC_SPI 625 IRQ_TYPE_LEVEL_HIGH 0>;
>>  		};
>>  
>> +		usi8: usi@109700c0 {
>> +			compatible = "google,gs101-usi",
>> +				     "samsung,exynos850-usi";
>> +			reg = <0x109700c0 0x20>;
>> +			ranges;
>> +			#address-cells = <1>;
>> +			#size-cells = <1>;
>> +			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_7>,
>> +				 <&cmu_peric0 CLK_GOUT_PERIC0_CLK_PERIC0_USI8_USI_CLK>;
>> +			clock-names = "pclk", "ipclk";
> 
> Given the clock-names, shouldn't the clock indices be the other way around? Also see below.

You're right, they should have been the other way around! Didn't make
any difference at testing because the usi driver uses
clk_bulk_prepare_enable(), what matters is the order of clocks in the
i2c node, and those are fine.

> 
>> +			samsung,sysreg = <&sysreg_peric0 0x101c>;
>> +			status = "disabled";
>> +
>> +			hsi2c_8: i2c@10970000 {
>> +				compatible = "google,gs101-hsi2c",
>> +					     "samsung,exynosautov9-hsi2c";
>> +				reg = <0x10970000 0xc0>;
>> +				interrupts = <GIC_SPI 642 IRQ_TYPE_LEVEL_HIGH 0>;
>> +				#address-cells = <1>;
>> +				#size-cells = <0>;
>> +				pinctrl-names = "default";
>> +				pinctrl-0 = <&hsi2c8_bus>;
>> +				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_7>,
>> +					 <&cmu_peric0 CLK_GOUT_PERIC0_CLK_PERIC0_USI8_USI_CLK>;
>> +				clock-names = "hsi2c", "hsi2c_pclk";
> 
> Here, pclk == CLK_GOUT_PERIC0_CLK_PERIC0_USI8_USI_CLK (which is correct, I believe), whereas
> above pclk == CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_7
> 

Indeed, I'll reverse the order for the USI clocks and do some more
testing. Thanks!
ta

