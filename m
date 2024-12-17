Return-Path: <linux-i2c+bounces-8578-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7EC9F551C
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Dec 2024 18:54:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 48089174BD4
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Dec 2024 17:49:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E9E51FA260;
	Tue, 17 Dec 2024 17:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k7Uiu3M+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A751F8684;
	Tue, 17 Dec 2024 17:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734457358; cv=none; b=JXwxGQH+k8gE2ethZHaToE48U3MYcLgDnJWLzo3X3MZYU18tdP/qORB1yquunz3e1rq46SC1GjWdiNkcMVa8UkDr5OtILiNvzhChOZttZMHGcvUCK1ICeZ8Wfm5uNLdMngTqu5PzVA3wkFGXUGtTm/YPWDfW32MispiupgLyNGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734457358; c=relaxed/simple;
	bh=GTNIQUJPRw7t7GatnKHSMlEYz/YyeJ+Ed/C875PamEs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XE/dCYSALxC1NQEYyzn/RobfscRqmVMfoziPyzoEflK+LCTetbhE7jIwCW3q/YGBADjyflrxg0UoqHa0TZ0Qq5XhIaHwJTJt/Moz8u6HHvMwRRQcfRBIDZ7OdMy4voFv+KGC9xgkrgABUXJ4OSsxJLtLxvg8KjzQYCYh0fap9j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k7Uiu3M+; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-aa5f1909d6fso935946666b.3;
        Tue, 17 Dec 2024 09:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734457355; x=1735062155; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RX3Us/R+Ba73C0CkzYR3VNICfGaHFr1lgKKzTrGydJU=;
        b=k7Uiu3M+JLpB4h8CQj1mYHskMvEpxruU5q2Zxe1XHJvAW24V4IXcEmjaNuVXvW5VZK
         Eco0SEPMZY4V4W6s+/49hs1SPsIM70S1xxsHOwVKNOlcwFwh0S4AYrP7K8aoUmXJFQsT
         Wfmk2MTWHdsEsPMqCXekRly+VjgDqushUIRL+wMkj7z4iGbkH1c8btyMJtTkUGM90C2K
         JL4kiUtvYQS4S5MiQylUb0DDRXRupaYXM2or9is5uZR0U98SrZxM70oVj5vofqiTT7mE
         iGJipUnz2mwMo9fiYgyxOUAdY4kxwD4oDdDgpy/m9A7KIhz1hx7yuyJ2q0wAwvJdVJyW
         U9OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734457355; x=1735062155;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RX3Us/R+Ba73C0CkzYR3VNICfGaHFr1lgKKzTrGydJU=;
        b=sXdDcp09z1bQtX9HFJktlj+MidZDNkmmQRTZBHItadYB0tWVYE5bbHhlmcWlakoSHd
         xTKzxe4pPpPG8YFlue07PFmA2rw8lMDbb3bO/bljXBQWgregDc+xj3IXh4Vzfa4KrMqf
         dJlRFfZi8wByONNwvNDKuHKS9JkIGzYCRPfL8KIvnrXhDkW1rPu0PzFGPg4R/j1ykMq4
         laNnKRK1N1nPNIesx/dU/fs9Vb2L97CjdjriFy7gdfGaTptOAjY5i/QaFfcueAi2/2fB
         Uffn7gkqQlb8z/54HPl2h7XsRCMdjsE1lwmtUmhDOGuG8oE9tUSf+yrf9fojjehbCmOm
         drhg==
X-Forwarded-Encrypted: i=1; AJvYcCUG4absQp3wMzGttd8a7M7j83si+4V2q5M7st+fbyfV20DosAKCvlB6M/nwEfmZMCx783VEWqKGOhByb7VjBgXDD3Y=@vger.kernel.org, AJvYcCVUZzXWgjV34OTs8EfLVhhQaGi2/z38a03J46nLGF1auR4Qj7o4grjZENsl80J6eW1u9Qb0uRZmupjC@vger.kernel.org, AJvYcCWJKdYc8V1uuGYDcDxFpYWxmtByQvbw1n1UOfCJgX2KlpxOfugHeAU1quzU4DHQ+i7RSR3weMJN1cTTX3CP@vger.kernel.org
X-Gm-Message-State: AOJu0YxZqJw6axv/QgL+i3/8jmyU16p2YfgtEJBMeSM2dKRH4Rbj2GT0
	K4oLmB9r3bXPeK34qsa6AKZp/YT2yMPn0ICGOQX/dGlCeG1hC4oO
X-Gm-Gg: ASbGncuYlsp6C06F+hjoNE09Y8uSi3Z5HaRuzPWtqCpdBb/zx4LdaXvvJUlMNyJyaFo
	mclXFnAzY5pQFWCFWirUL2kVPMcckw/BkRYPa4KT2HXCthhDKGjpFzc1PuDuT6n87Ygpg5ZPwH8
	q47Pxr8wx7LFRZJoE8nPZeUky+dBqsw7GhrpH9BPVV7EDhMbJgzSojR6KyBL752DiCgfEtiFnHV
	C9pLsgrzWcx6Gd9h3n9sIud5v86gjgpR4cGnhJs860yCPUB2aam8pGfnEgATqLZYtw7
X-Google-Smtp-Source: AGHT+IFjIUHzuO2MBnqXBKlI2P4aoVJoD6xBmuIZQ/ueNl9n5qqJbUqwItJ883MoEIIeh9jzL5p2ug==
X-Received: by 2002:a17:906:4fc7:b0:aab:c78c:a7ed with SMTP id a640c23a62f3a-aabf1cf01e1mr22140966b.49.1734457355131;
        Tue, 17 Dec 2024 09:42:35 -0800 (PST)
Received: from [192.168.31.111] ([194.39.226.133])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aab96005f73sm467420566b.4.2024.12.17.09.42.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2024 09:42:34 -0800 (PST)
Message-ID: <685eb8ab-2767-43da-80d0-ec77ff779d86@gmail.com>
Date: Tue, 17 Dec 2024 19:42:32 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] dt-bindings: i2c: exynos5: Add
 samsung,exynos8895-hsi2c compatible
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
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
Content-Language: en-US
From: Markuss Broks <markuss.broks@gmail.com>
In-Reply-To: <56c5788a-2d49-4abb-af4b-65a11bdc4094@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Krzysztof,

On 12/17/24 11:43 AM, Krzysztof Kozlowski wrote:
> On 17/12/2024 10:31, Ivaylo Ivanov wrote:
>> On 12/17/24 11:26, Krzysztof Kozlowski wrote:
>>> On 17/12/2024 10:08, Ivaylo Ivanov wrote:
>>>>>>>>         - items:
>>>>>>>>             - enum:
>>>>>>>> @@ -94,9 +95,28 @@ allOf:
>>>>>>>>           - clock-names
>>>>>>>>   
>>>>>>>>       else:
>>>>>>>> -      properties:
>>>>>>>> -        clocks:
>>>>>>>> -          maxItems: 1
>>>>>>>> +      if:
>>>>>>>> +        properties:
>>>>>>>> +          compatible:
>>>>>>>> +            contains:
>>>>>>>> +              enum:
>>>>>>>> +                - samsung,exynos8895-hsi2c
>>>>>>>> +
>>>>>>>> +      then:
>>>>>>>> +        properties:
>>>>>>>> +          clocks:
>>>>>>> Missing minItems
>>>>>>>
>>>>>>>> +            maxItems: 2
>>>>>>>> +
>>>>>>>> +          clock-names:
>>>>>>> Ditto
>>>>>>>
>>>>>>>> +            maxItems: 2
>>>>>>>> +
>>>>>>>> +        required:
>>>>>>>> +          - clock-names
>>>>>>> I don't understand why do you need second, same branch in if, basically
>>>>>> Because, as I stated in the commit message, we have HSI2C controllers
>>>>>> both implemented in USIv1 blocks and outside. These that are a part of
>>>>> On Exynos8895? Where? With the same compatible?
>>>> hsi2c_0 which has a clock from BUSC and hsi2c_1 to hsi2c_4 which use clocks
>>>> from PERIC1 (CLK_GOUT_PERIC1_HSI2C_CAM{0,1,2,3}_IPCLK). Why would
>>>> they need a different compatible though? It's functionally the same i2c design
>>>> as the one implemented in USIv1 blocks.
>>> If one block is part of USI and other not, they might not be the same
>>> I2C blocks, even if interface is similar. If they were the same or even
>>> functionally the same, they would have the same clock inputs. However
>> I see, so in such case I should make samsung,exynos8895-hsi2c-nonusi or
>> something like that?
>>
>>> user manual also suggests that there is only one clock, not two (for
>>> both cases), so they could be functionally equivalent but then number of
>>> clocks looks incorrect.
>> That'd be weird. Both according to downstream and upstream clk driver,
>> for the USI-implemented i2cs we have a pclk and an sclk_usi.
> Something is not precise here, as usually with Samsung clock topology.
>
> First, the non-USI instances have the IPCLK as well, e.g. things like
> PERIC1_UID_HSI2C_CAM1_IPCLKPORT_iPCLK
>
> USI have BLK_PERIC0_UID_USI03_IPCLKPORT_i_SCLK_USI, but that's USI
> clock, not HSI2C in USI. Datasheet mentions this is UART and SPI special
> clock, but not I2C. The PCLK is used for HSI2C iPCLK.

In USI, USI PCLK is used for the internal AMBA APB bus clock and the 
IPCLK signal is used for the peripheral controller blocks (i2c/spi/uart).

So perhaps we have it described incorrectly, and the hsi2c controllers 
(at least on E8895) should take only one clock input (IPCLK), and USI 
block should take the PCLK input.


>
>
> Best regards,
> Krzysztof
>

- Markuss


