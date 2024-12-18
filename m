Return-Path: <linux-i2c+bounces-8593-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 871049F6152
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Dec 2024 10:22:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 371B91895C3F
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Dec 2024 09:22:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6335F1925A2;
	Wed, 18 Dec 2024 09:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F8+dU9op"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17BBB1494C3;
	Wed, 18 Dec 2024 09:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734513747; cv=none; b=FmRWxsr2YnwPb8Sz7/kFUmb/9PTQ7+KXn18QI8QJJMDpD6n06mH0UkEQ8wmFqdAjH05J/H1zrWkjYfzKpQLUgjmGeG4Gdl1Lsd42ZESCUTdwIcPnZjMFpGrTRibWQ+JKq/FH4wRPkfvBoniRYutFQTpnI2niRpli+5KOJV71LGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734513747; c=relaxed/simple;
	bh=bG/W66dEi/LFJfO8SPmj2MLLiUu+QmDsy4zds5+lgr4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WgHfFPo702D7WES0W6CUGWuIgD9jZ5yUpHvVx74XAyV4lEvLLKizvVyvXwujlBwhy7p+PGsnGfcPYQqc0K9vHhKhHMCIZU34VSwY3tn5wTW+P++UxCjDjeYnhDWBIOCq/S7ljC1AppYyDHn7oIU7M5tZ/XSM/Bv3w6Fxu9v0Gy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F8+dU9op; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47A48C4CECE;
	Wed, 18 Dec 2024 09:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734513746;
	bh=bG/W66dEi/LFJfO8SPmj2MLLiUu+QmDsy4zds5+lgr4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=F8+dU9opxtu9EWSBN6gpRvf3iDnEOKI0E2uH3R1IrKUHewRcKvPTF4cy7bv9vUtVH
	 WwRDSIgjhYPffP48cvBd7SklG5n2Px2TzENThGJd0dYg4eByUkVbsr7nBss/ntVusM
	 33mHAcHNUxmpseLlIvRQYD7SKve/YLfCQ0QlfQmEaqCktBttddmXHND6EVX07NJ6WG
	 5IBz01ldNXNeQ3f3PduLnO6NoTT6Yvi3+R2suRLREFxS6sr52/a2yaKg+ub+anUPF1
	 iGz/N358Tbz+VpmMs+p5XmuXP2LqnPSKfGPjrEIaViNZ22BOyJDcOgWISFH+MZ580X
	 7PIxF0vhPFKsA==
Message-ID: <3fb8ba3f-3016-4823-bf48-130f173c8f66@kernel.org>
Date: Wed, 18 Dec 2024 10:22:21 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] dt-bindings: i2c: exynos5: Add
 samsung,exynos8895-hsi2c compatible
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241214220419.723100-1-ivo.ivanov.ivanov1@gmail.com>
 <20241214220419.723100-2-ivo.ivanov.ivanov1@gmail.com>
 <0ebc12ed-fe91-4c8a-a626-b735b0eeecf1@kernel.org>
 <007559c5-f566-4625-99b7-e761a916fba3@gmail.com>
 <cccca881-dd59-43c0-9072-dcd91d01671d@kernel.org>
 <6e93d59d-71e5-4c09-862f-55b5504121aa@gmail.com>
 <69fd1dbc-a29f-488c-a30f-7e5ea8f01a23@kernel.org>
 <17fbfcdd-8b79-4907-a4c8-798da0ef0526@gmail.com>
 <56c5788a-2d49-4abb-af4b-65a11bdc4094@kernel.org>
 <d8d0a1c8-f2b4-425a-858b-610ae7291ebc@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <d8d0a1c8-f2b4-425a-858b-610ae7291ebc@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/12/2024 11:04, Ivaylo Ivanov wrote:
> On 12/17/24 11:43, Krzysztof Kozlowski wrote:
>> On 17/12/2024 10:31, Ivaylo Ivanov wrote:
>>> On 12/17/24 11:26, Krzysztof Kozlowski wrote:
>>>> On 17/12/2024 10:08, Ivaylo Ivanov wrote:
>>>>>>>>>        - items:
>>>>>>>>>            - enum:
>>>>>>>>> @@ -94,9 +95,28 @@ allOf:
>>>>>>>>>          - clock-names
>>>>>>>>>  
>>>>>>>>>      else:
>>>>>>>>> -      properties:
>>>>>>>>> -        clocks:
>>>>>>>>> -          maxItems: 1
>>>>>>>>> +      if:
>>>>>>>>> +        properties:
>>>>>>>>> +          compatible:
>>>>>>>>> +            contains:
>>>>>>>>> +              enum:
>>>>>>>>> +                - samsung,exynos8895-hsi2c
>>>>>>>>> +
>>>>>>>>> +      then:
>>>>>>>>> +        properties:
>>>>>>>>> +          clocks:
>>>>>>>> Missing minItems
>>>>>>>>
>>>>>>>>> +            maxItems: 2
>>>>>>>>> +
>>>>>>>>> +          clock-names:
>>>>>>>> Ditto
>>>>>>>>
>>>>>>>>> +            maxItems: 2
>>>>>>>>> +
>>>>>>>>> +        required:
>>>>>>>>> +          - clock-names
>>>>>>>> I don't understand why do you need second, same branch in if, basically
>>>>>>> Because, as I stated in the commit message, we have HSI2C controllers
>>>>>>> both implemented in USIv1 blocks and outside. These that are a part of
>>>>>> On Exynos8895? Where? With the same compatible?
>>>>> hsi2c_0 which has a clock from BUSC and hsi2c_1 to hsi2c_4 which use clocks
>>>>> from PERIC1 (CLK_GOUT_PERIC1_HSI2C_CAM{0,1,2,3}_IPCLK). Why would
>>>>> they need a different compatible though? It's functionally the same i2c design
>>>>> as the one implemented in USIv1 blocks.
>>>> If one block is part of USI and other not, they might not be the same
>>>> I2C blocks, even if interface is similar. If they were the same or even
>>>> functionally the same, they would have the same clock inputs. However
>>> I see, so in such case I should make samsung,exynos8895-hsi2c-nonusi or
>>> something like that?
>>>
>>>> user manual also suggests that there is only one clock, not two (for
>>>> both cases), so they could be functionally equivalent but then number of
>>>> clocks looks incorrect.
>>> That'd be weird. Both according to downstream and upstream clk driver,
>>> for the USI-implemented i2cs we have a pclk and an sclk_usi.
>> Something is not precise here, as usually with Samsung clock topology.
>>
>> First, the non-USI instances have the IPCLK as well, e.g. things like
>> PERIC1_UID_HSI2C_CAM1_IPCLKPORT_iPCLK
>>
>> USI have BLK_PERIC0_UID_USI03_IPCLKPORT_i_SCLK_USI, but that's USI
>> clock, not HSI2C in USI. Datasheet mentions this is UART and SPI special
>> clock, but not I2C.
> 
> That's weird. Don't we need the clock enabled in order for the
> USIv1's HSI2C to work?
The clock goes to USI, so it is enabled, no?

Best regards,
Krzysztof

