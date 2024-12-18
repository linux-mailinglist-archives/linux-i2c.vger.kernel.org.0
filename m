Return-Path: <linux-i2c+bounces-8594-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF869F61CD
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Dec 2024 10:34:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 552C218961DE
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Dec 2024 09:34:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAE9C19E7D1;
	Wed, 18 Dec 2024 09:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l6vFYHHl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D780218A922;
	Wed, 18 Dec 2024 09:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734514237; cv=none; b=fZJDi3jjeVeOQnqKm05E07ALjYzIqoTAiHlTZYPRdN1ow39TU9xK15RI28nYj2TeO6/tBywfw2gVrBSEL6S7fDouQwj8jgjiUYL+ALh+cX2xLuqHDI1G7bHIUkSpKCNlECNSy/64VBNe+sxhDk5+vREY/MUcCamCnOA1iklWiWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734514237; c=relaxed/simple;
	bh=2u5AvduS53aH61XHS5hE64R7bDjGY9Qpt6igT29ruPQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=knYVaPDh5k2O3w1jGiSgPLf53t3La+DePcTepHE7mlAWT8JCy94E46HavPeIiILS7SPi0EWI4yV7BvQW3d2kbuvudJI81/idJ3fLTcyuSNswfGD8f6wCkOegDBERfTuXVXbzwdeU7C/wi5ZNLI7Ivm9/+ySRRDuapQhCB2gGS8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l6vFYHHl; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-436202dd730so44657305e9.2;
        Wed, 18 Dec 2024 01:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734514234; x=1735119034; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7yIxUyzE0LOIsBKtNq4apc0rEHKbhmq8n178/AyuNO4=;
        b=l6vFYHHlxDP0VIlhsJ/5MDNAXdfS/3c1tE76wJCk58TPP4phcqmvzmjRue6HyooeTv
         iLgk0fE+Ugydbc80FHlETqVjhrrCnMUnXi81yRLP+hRCN9VypFURh+0Ye8PLXlTAKE1U
         GD05B+3SdcAbENaZrqfdcg60R4XToEZC1KO7hXzqSvvDNfUyYbpaUN7DDl6w+PdTCCkM
         XtdQ4WGw9qcMY0UAFVEzaWc31nJRc6QPa8RyCHgik4M8vngFnN1IC6pi7jnm5GeiNuZl
         dEGfwwtzwSzVR8P5GEyCsPv/xaAgmt+Y5L2a1xPXw5a2ldNc0S2LYoMPaHUerHeEX1Wv
         BwWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734514234; x=1735119034;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7yIxUyzE0LOIsBKtNq4apc0rEHKbhmq8n178/AyuNO4=;
        b=PszxfaTBhgCqDwD2Q/kH+iSI6ThJySpdNPJUhhH83+mR2VEwsDwMl6K8Z3d+0MJl0b
         SRZFxbyp84e7aqst4qsmSrM9nJ8H8qo1gDsAS1CYQWYQNymD/N/IOrXBhCSQkfb3AfPz
         Nlv6+Bz7nVfXMDvmjpqgi0rqmOmqxCSZ0UVLko8h4Mk/KamfOf6uD6CWLQltfTu7W9Uo
         JjAWJeioDcuWaBPMKx808SYniTkd8+zNLMelST2Muy+ZoAeT7uiEnxazX9HtQ17rbeZZ
         /mq/ZVfqmO0fW1vKcZmflIYCrE/u6TuBBwrlBD51YkcnKBBDP5Xj6MtnDcJeIxQQ2QOG
         vHJQ==
X-Forwarded-Encrypted: i=1; AJvYcCViUPV0g0Wysk14vXkLzck5l8m7WgTjVnWH27HADVEzC39nirMv6LvrJrD6jfHckzNkjTiTsFugZR+RmPyK@vger.kernel.org, AJvYcCVtCIJ+ylOiEpYtgYEFreUjWvUnrobP92zSy2MiTLOEXP7JMyh7QqNsZbBcBzfjy89Ll88p9nPag3UciCGZGfyyAO0=@vger.kernel.org, AJvYcCXC9HGe49pYQFLJSuDin2M5uLYpVSUbWZYyuRhhkT3bRMMyUCojROMZ1zwEB+O7yu9aXJwWzWhJKEVS@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+qPjtKe1SK90foqQBgiWIlHNvhaZzM9K9/jqb9XgpgatWKKWw
	loA/fU+xbIeS5PVEpybEO+HIUW654MO0ZIhs9PoBdgh56xlaLaM8
X-Gm-Gg: ASbGnctvNutQDy8+04TiODDZAm5wZJMGC7aqUZuLUScJX+U5OlrdctNMNZzj3mbm0/j
	oTEx9xOONUE8EtJYC5ciiVrpi3G1YeO90qZM7OzVZiz3G7in2mUBkq7m82guUS1/i+WNW03a3h8
	Vepd0iUhko6rY5uVfg7UtXJFUcjQd9XFKdCGkpzFQWac+3nUR6pHT0NG1O3gz9FeXaj/u3jwyO+
	QqExUaTGiJ94mPubOu72S1+Esl3JmKgS0nqTtMLK6qqfOR4bA+SWwMfmRXlSueMFUHYmzCYlOP/
	Svt4+oGziMaqGWpKnQSDng==
X-Google-Smtp-Source: AGHT+IGA5KRMCKQk9h6H7yQfzLwOECAdjUcuI1nRvjroVn8aEWm1sUmZ9/g7y0HJZwmO51Ekl42PZw==
X-Received: by 2002:a05:600c:3551:b0:436:1c0c:bfb6 with SMTP id 5b1f17b1804b1-43655405852mr15127885e9.27.1734514233755;
        Wed, 18 Dec 2024 01:30:33 -0800 (PST)
Received: from [172.16.20.173] (62-73-104-42.ip.btc-net.bg. [62.73.104.42])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b42757sm14388525e9.39.2024.12.18.01.30.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2024 01:30:33 -0800 (PST)
Message-ID: <80d33e99-6a04-4985-b704-42d731313d9f@gmail.com>
Date: Wed, 18 Dec 2024 11:30:31 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] dt-bindings: i2c: exynos5: Add
 samsung,exynos8895-hsi2c compatible
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>, Andi Shyti
 <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
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
 <3fb8ba3f-3016-4823-bf48-130f173c8f66@kernel.org>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <3fb8ba3f-3016-4823-bf48-130f173c8f66@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/18/24 11:22, Krzysztof Kozlowski wrote:
> On 17/12/2024 11:04, Ivaylo Ivanov wrote:
>> On 12/17/24 11:43, Krzysztof Kozlowski wrote:
>>> On 17/12/2024 10:31, Ivaylo Ivanov wrote:
>>>> On 12/17/24 11:26, Krzysztof Kozlowski wrote:
>>>>> On 17/12/2024 10:08, Ivaylo Ivanov wrote:
>>>>>>>>>>        - items:
>>>>>>>>>>            - enum:
>>>>>>>>>> @@ -94,9 +95,28 @@ allOf:
>>>>>>>>>>          - clock-names
>>>>>>>>>>  
>>>>>>>>>>      else:
>>>>>>>>>> -      properties:
>>>>>>>>>> -        clocks:
>>>>>>>>>> -          maxItems: 1
>>>>>>>>>> +      if:
>>>>>>>>>> +        properties:
>>>>>>>>>> +          compatible:
>>>>>>>>>> +            contains:
>>>>>>>>>> +              enum:
>>>>>>>>>> +                - samsung,exynos8895-hsi2c
>>>>>>>>>> +
>>>>>>>>>> +      then:
>>>>>>>>>> +        properties:
>>>>>>>>>> +          clocks:
>>>>>>>>> Missing minItems
>>>>>>>>>
>>>>>>>>>> +            maxItems: 2
>>>>>>>>>> +
>>>>>>>>>> +          clock-names:
>>>>>>>>> Ditto
>>>>>>>>>
>>>>>>>>>> +            maxItems: 2
>>>>>>>>>> +
>>>>>>>>>> +        required:
>>>>>>>>>> +          - clock-names
>>>>>>>>> I don't understand why do you need second, same branch in if, basically
>>>>>>>> Because, as I stated in the commit message, we have HSI2C controllers
>>>>>>>> both implemented in USIv1 blocks and outside. These that are a part of
>>>>>>> On Exynos8895? Where? With the same compatible?
>>>>>> hsi2c_0 which has a clock from BUSC and hsi2c_1 to hsi2c_4 which use clocks
>>>>>> from PERIC1 (CLK_GOUT_PERIC1_HSI2C_CAM{0,1,2,3}_IPCLK). Why would
>>>>>> they need a different compatible though? It's functionally the same i2c design
>>>>>> as the one implemented in USIv1 blocks.
>>>>> If one block is part of USI and other not, they might not be the same
>>>>> I2C blocks, even if interface is similar. If they were the same or even
>>>>> functionally the same, they would have the same clock inputs. However
>>>> I see, so in such case I should make samsung,exynos8895-hsi2c-nonusi or
>>>> something like that?
>>>>
>>>>> user manual also suggests that there is only one clock, not two (for
>>>>> both cases), so they could be functionally equivalent but then number of
>>>>> clocks looks incorrect.
>>>> That'd be weird. Both according to downstream and upstream clk driver,
>>>> for the USI-implemented i2cs we have a pclk and an sclk_usi.
>>> Something is not precise here, as usually with Samsung clock topology.
>>>
>>> First, the non-USI instances have the IPCLK as well, e.g. things like
>>> PERIC1_UID_HSI2C_CAM1_IPCLKPORT_iPCLK
>>>
>>> USI have BLK_PERIC0_UID_USI03_IPCLKPORT_i_SCLK_USI, but that's USI
>>> clock, not HSI2C in USI. Datasheet mentions this is UART and SPI special
>>> clock, but not I2C.
>> That's weird. Don't we need the clock enabled in order for the
>> USIv1's HSI2C to work?
> The clock goes to USI, so it is enabled, no?

Yes, and as Markuss said:
"USI PCLK is used for the internal AMBA APB bus clock and the IPCLK
signal is used for the peripheral controller blocks (i2c/spi/uart)."

So perhaps referencing the USI PCLK in the hsi2c driver for USIv2, as
well as USIv1, is a wrong approach and should be dropped/fixed?

Best regards,
Ivo

>
> Best regards,
> Krzysztof


