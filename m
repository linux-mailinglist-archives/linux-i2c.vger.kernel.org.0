Return-Path: <linux-i2c+bounces-1074-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0770E81FFEB
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Dec 2023 15:21:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B646E28283A
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Dec 2023 14:21:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22A1411721;
	Fri, 29 Dec 2023 14:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uQmNVloQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C26E1173E
	for <linux-i2c@vger.kernel.org>; Fri, 29 Dec 2023 14:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3368b1e056eso6205723f8f.3
        for <linux-i2c@vger.kernel.org>; Fri, 29 Dec 2023 06:21:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703859693; x=1704464493; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MG3HGnk+BEY3fgKeHZy+ZsbJ2eMQ1iNRXHfdIpsUof4=;
        b=uQmNVloQiNNo+TC5Z08DEa3UlhrAC5IE39l9ly948vrhIBu8KTylsXYDzweU6XF2n7
         W9SIom8Octv1Aa8mSL0wleJ9tTcUb97/6KKFxxYJ4XcskN3XDh3ZO2obqm70fIaAxUn4
         wQKLPeT+vzSpScnRmOF1qPOZ/XnLHpYQsjBNcj00Yr3qXBz7lRV9c/yIFJfClTDbDSNr
         kb9yz0MvuypR6Os4yvbrzBPwyyzBGK0X9EW492N+FFnjrf0+6eW/8hgXmlqa1WI18rfQ
         /S3HMVCAe1JkbpwCYbTJSRTGws6xvKxDW72T0sMXYapNVyzP3o/fb7GcP97FOcsMzA5X
         mOvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703859693; x=1704464493;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MG3HGnk+BEY3fgKeHZy+ZsbJ2eMQ1iNRXHfdIpsUof4=;
        b=BtRQMgAv84V/EjxJjl6OHdhmLTU2yWB9j7/WKjzokJZcfqUJvxjoaCBCcRaYPJpQjl
         ZAE4xhbOFuTnS37wWpJ5dI1l4AcL1mD9n9Lr/5FDQcuhP8OW+CkU1RUmeCDgr3foLA0M
         Lj1b3zDmH3E+VgZTgXy3qOoPUHfpym7CX1B7XJbVMv4+/++QGfa1ZnovdPBnonmx41s1
         W3cMmZJX8sEteYqwebHYARKiMYmW5H2iBR+Sn8i/tqdYv1K96P1JmsgorqmJjDovsQrq
         A/JDXUbOi4SPIQ5hNh0Mo6P1ahoGqtqYwBbR6ypUVyt9p+HKqXfdpKn4Q8m/H8lfC6kf
         HaUg==
X-Gm-Message-State: AOJu0Yz9MyOgMc82FpCmhvxrVNjLmZQVx8/WSHuYjEjECPe7EXABUgUL
	AtC/3YXAyVXSBemmY63qReYBGLGApk9FIg==
X-Google-Smtp-Source: AGHT+IHHSmzI1khJPusslQIOZi/UTnGxpSbZZWIOL6Cyu++MYhCAOXe1NlWHeIFyJUobv1chd8b+aA==
X-Received: by 2002:adf:e790:0:b0:333:41a0:ef39 with SMTP id n16-20020adfe790000000b0033341a0ef39mr5897583wrm.105.1703859693054;
        Fri, 29 Dec 2023 06:21:33 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id a18-20020a5d5712000000b003368f9ec9e0sm17131785wrv.42.2023.12.29.06.21.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Dec 2023 06:21:32 -0800 (PST)
Message-ID: <d1b17379-84b0-465b-a30c-1a1e62d3c86a@linaro.org>
Date: Fri, 29 Dec 2023 14:21:29 +0000
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/12] arm64: dts: exynos: gs101: define USI8 with I2C
 configuration
From: Tudor Ambarus <tudor.ambarus@linaro.org>
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
 <387303b4-d912-480c-a50c-9f9efa386ef3@linaro.org>
Content-Language: en-US
In-Reply-To: <387303b4-d912-480c-a50c-9f9efa386ef3@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 12/29/23 08:04, Tudor Ambarus wrote:
> 
> 
> On 12/28/23 14:04, André Draszik wrote:
>> Hi Tudor,
> 
> Hi!
> 
>>
>> On Thu, 2023-12-28 at 12:58 +0000, Tudor Ambarus wrote:
>>> [...]
>>>
>>> diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
>>> index 0e5b1b490b0b..c6ae33016992 100644
>>> --- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
>>> +++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
>>> @@ -354,6 +354,35 @@ pinctrl_peric0: pinctrl@10840000 {
>>>  			interrupts = <GIC_SPI 625 IRQ_TYPE_LEVEL_HIGH 0>;
>>>  		};
>>>  
>>> +		usi8: usi@109700c0 {
>>> +			compatible = "google,gs101-usi",
>>> +				     "samsung,exynos850-usi";
>>> +			reg = <0x109700c0 0x20>;
>>> +			ranges;
>>> +			#address-cells = <1>;
>>> +			#size-cells = <1>;
>>> +			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_7>,
>>> +				 <&cmu_peric0 CLK_GOUT_PERIC0_CLK_PERIC0_USI8_USI_CLK>;
>>> +			clock-names = "pclk", "ipclk";
>>
>> Given the clock-names, shouldn't the clock indices be the other way around? Also see below.
> 
> You're right, they should have been the other way around! Didn't make
> any difference at testing because the usi driver uses
> clk_bulk_prepare_enable(), what matters is the order of clocks in the
> i2c node, and those are fine.
> 
>>
>>> +			samsung,sysreg = <&sysreg_peric0 0x101c>;
>>> +			status = "disabled";
>>> +
>>> +			hsi2c_8: i2c@10970000 {
>>> +				compatible = "google,gs101-hsi2c",
>>> +					     "samsung,exynosautov9-hsi2c";
>>> +				reg = <0x10970000 0xc0>;
>>> +				interrupts = <GIC_SPI 642 IRQ_TYPE_LEVEL_HIGH 0>;
>>> +				#address-cells = <1>;
>>> +				#size-cells = <0>;
>>> +				pinctrl-names = "default";
>>> +				pinctrl-0 = <&hsi2c8_bus>;
>>> +				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_7>,
>>> +					 <&cmu_peric0 CLK_GOUT_PERIC0_CLK_PERIC0_USI8_USI_CLK>;
>>> +				clock-names = "hsi2c", "hsi2c_pclk";
>>
>> Here, pclk == CLK_GOUT_PERIC0_CLK_PERIC0_USI8_USI_CLK (which is correct, I believe), whereas
>> above pclk == CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_7
>>
> 
> Indeed, I'll reverse the order for the USI clocks and do some more
> testing. Thanks!

FYI, I reversed the order of the USI clocks, tested again with the
eeprom at 100 KHz and 10KHz, everything went fine. I'll wait for some
other feedback and probably submit a v3 next week.

Cheers,
ta

