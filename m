Return-Path: <linux-i2c+bounces-8568-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AE92F9F484E
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Dec 2024 11:04:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 86F997A0461
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Dec 2024 10:04:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A28E1DF274;
	Tue, 17 Dec 2024 10:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GwIYUmO6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B9A189521;
	Tue, 17 Dec 2024 10:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734429864; cv=none; b=Z3gfqudRwzijTEb2d/QRPLUVup6QsDpyajwGPfyyWfYQ52OblFUkP8Oc5h2faEVzrHQ6e5hr+d3ScC9ZybU7CeDmlaCly/3rTb10/aYcd2AGiJU5LsfdqZJYhmGA7Hmedkeu9AWV27fW8RBBcgHB1SD9BDKYbmjnL1IQyMbFDSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734429864; c=relaxed/simple;
	bh=Invtadyl/B6DpvSzM33P8HmnrJ1jB0ElzQuvHi1ZYrk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T+L7cdJnY3i96TZ5zJvfv5wPBq6YhLHKjpElAdz90XTqtAZvbjNVME5xkzbc8eBs7j0/NdlzoeYole37fk9ONZsYDhNhNjYyQDwobz5k4m+ERIuaN2MBzaIj5MoI7baOS2xxHE16YIKm0Yxr5bxJy1/7vXamcDI2H1z2iUYIJXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GwIYUmO6; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4361fe642ddso53884055e9.2;
        Tue, 17 Dec 2024 02:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734429861; x=1735034661; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iYrLrg3M5tgHoTzQrdp8f9Dfp9oiWl/aUFmJid3JjVg=;
        b=GwIYUmO6Gt0866GfDcu9F7CwN+ryRaxdnfRJAcxGnoXIJKRzQmn75++/E7vWuMMVyP
         d2Ih8efgwdkTpxLox6cILoQ0Xs4jyAjNadPu/f5Z/+e2jTeCVrQXs5aOgONvmsN5iY5I
         JKWIFo22BEi03Y9ORH4kphvKapJMDknaFAeGeyBte1BbDFmIIyYQTwzhOc8Ex+LAQEBI
         MmRf6gSuwvFOrCkmR7Xvj2JLjNCAKM5c0TJzpNMV1JS59PpphzPLxnwUv//oc9d+n9OI
         niCg2IRU2N0dvg04u9qyYa9TDix1zGdtObpFdpNtJpHijyJ9eGwdQa0LN83mlbsILWzN
         P0mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734429861; x=1735034661;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iYrLrg3M5tgHoTzQrdp8f9Dfp9oiWl/aUFmJid3JjVg=;
        b=RoQkATQE2nAfKt/YXLhsJdW2kVsaJWeNvQhlNvrekBe8DpE30mpNq/Viem1xUXSaUS
         QKtZEhK+WcPFRwMFJKgfR4gF876jyA9GRongFFl51sZ1B3DlNQN4pha1WNxEIxgAH+BE
         CyBjl3cvY3aUl7RSoBPXSEDSGbgKdP+kLTuK+phYXzLSdu2CxfDoW2oAlJGqkh3JSk6i
         Ut+TO7ixXGqH6KMfFByecRNhrwrBQeub9dbFiyZ+hyjaY6IWe1g+lSY6XYbUc91lrE19
         GPfIgtLa5yCPJqC7TuEAQpUnihpIxYa61GqI5+lXpdSSer5fuCVNEaB9+HVauVtRk2wM
         rQMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUumzqyzk0EGTSA2L+im+XbLVrH/mA0oBN9qYt+EduIDPz2ahE/LdhSndCc8BcfosAXF3gYcOmkxvr0@vger.kernel.org, AJvYcCUvC03fVqIjVwVImlkaaPEzF9Xmo2RyrV3SQPVKZoVjOBBfAbT6uLaJYkwf4J4qYa8fOMdI2V3tk0YJejLQvdao1Zo=@vger.kernel.org, AJvYcCVWEbX2T/bvZIn8s2VhZAaGIJF8fHdMWgOwp+EPjlRTf9AHUxuo2/Vb1MO2M7nK+U3f3QuYNC+V7cw8ROfw@vger.kernel.org
X-Gm-Message-State: AOJu0YyECBPPhLaMt1865Sp16cq/i/063+AXmiKMaihaREH9y/QH8UN7
	TZWs8aUrxMLBUUkh48jfa4/tD9r9pLw9AQI7tBviQDXve0NsvoYvwp2ryw==
X-Gm-Gg: ASbGnctoTOWeQGN2XeJTlsULf3KDRC+72Rffo7nm1qpf6Vkk1MR2sypeTdYuAr+tWHy
	Vn8PY2kh+r7I5bpowaGcY4ytjI8uVtMUD4dTI1C8ScSt0AeLnpiP4PZCTAg5g5IRaIL5YvZ9hjb
	G3baGvty1Q2yM7tBeERw+apFocGBQp8AgoT+7fgWTeZ/oapvTUw6DKCxzb0191HFH2Ur5CuydMj
	fVKJ4ITQrPV2Ykx8QyPFxKIr4P7cA/3mgfa/DodAvWEMU9/NtYuhcePtg9W8Uj0THpqxoBMx+Mr
	wIcMg+9GnF5FSPa7xWVpzA==
X-Google-Smtp-Source: AGHT+IErqPnymSh1uEMNFLA6EU4DTN3bB21g37HvGXd0a+FwRC+Ivd5Be09XHezjPdYkMyJH1U4RHA==
X-Received: by 2002:a5d:5f88:0:b0:385:e37a:2a58 with SMTP id ffacd0b85a97d-38880ac2841mr14909475f8f.1.1734429860764;
        Tue, 17 Dec 2024 02:04:20 -0800 (PST)
Received: from [172.16.20.173] (62-73-104-42.ip.btc-net.bg. [62.73.104.42])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c8046c71sm10530914f8f.65.2024.12.17.02.04.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2024 02:04:20 -0800 (PST)
Message-ID: <d8d0a1c8-f2b4-425a-858b-610ae7291ebc@gmail.com>
Date: Tue, 17 Dec 2024 12:04:08 +0200
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
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <56c5788a-2d49-4abb-af4b-65a11bdc4094@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/17/24 11:43, Krzysztof Kozlowski wrote:
> On 17/12/2024 10:31, Ivaylo Ivanov wrote:
>> On 12/17/24 11:26, Krzysztof Kozlowski wrote:
>>> On 17/12/2024 10:08, Ivaylo Ivanov wrote:
>>>>>>>>        - items:
>>>>>>>>            - enum:
>>>>>>>> @@ -94,9 +95,28 @@ allOf:
>>>>>>>>          - clock-names
>>>>>>>>  
>>>>>>>>      else:
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
> clock, but not I2C.

That's weird. Don't we need the clock enabled in order for the
USIv1's HSI2C to work?

Best regards,
Ivo

>  The PCLK is used for HSI2C iPCLK.
>
>
> Best regards,
> Krzysztof


