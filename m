Return-Path: <linux-i2c+bounces-11996-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A55B4B0E376
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Jul 2025 20:26:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CADD3170442
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Jul 2025 18:26:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 025FC27FD7D;
	Tue, 22 Jul 2025 18:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RXBK0vqN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1904426A0FD;
	Tue, 22 Jul 2025 18:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753208763; cv=none; b=N/oSyaUWZoRzz+9G9f/fNY+GC1khXIo1inbee5tpuyc+ajDE+m8hLsfyAAgWznPbH62JtH0so0x/t9oH643YJ8WJxAAmN6PfZ3RiKmbEF7Cr1p0e+XfZYuBfynEU1FcJDMeS3bgX7OHQYI9puxQU9X3exPq5zf1Ja4V7r/OZOuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753208763; c=relaxed/simple;
	bh=3uE/DEjZnz0d3CzX7I06ixM/K0tv8ZiqjHEnHOaxF0E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BCt6Fmia1vBShoO7yhiDxo7yF8qBEahWWkMYiUfJfp1UeB+XgDJzkuBZsihS+KAiLzfbWH1eADrSCi0/hxCVhgby26GvXq4IGotXbHNXl+4Zn8aBbTzn7ObhK+VomtNNlXId+FEV9H0nE3l2JH/a54ZN2rcd5rS1CO2OIl/MxV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RXBK0vqN; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4537edf2c3cso61374385e9.3;
        Tue, 22 Jul 2025 11:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753208760; x=1753813560; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eEq+TguBc2NWyFlubot3mJhOD+7d6fgYGY8U/M6u4bY=;
        b=RXBK0vqNMSeVwNj/XZYkbkKz6GCT3Q5eRvWANWbuORk1qvgaI857SvKIeX4mpSPGd2
         AivWPOUaRRLXIQugOfTskz8fFQ40q4TiYKty0ggYWPf5/fy+vvtgIC9SBBEpFIepKgaD
         Wlam/8wsPjnUhxBRZFQPWtivGmXGRbgeNOgGxhnONCFOZiD67cn/jHqeruapap9gBk4N
         P+WUCbXQ3CsC4bAI07prFYCTvo0UBWMfDEEBo7fFNIlObBwI475s90+CxP9fOBrrXTqm
         Bc5dSmImoH/ExX4GtW2+67+4pCTqQTetLH1scXPnAV4rbekQ8ITGOIkDw0EQHis+F/6L
         YJ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753208760; x=1753813560;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eEq+TguBc2NWyFlubot3mJhOD+7d6fgYGY8U/M6u4bY=;
        b=oeHe7LzSvXhGuD0rfnVQHFwC0jEY08DOxQderv0R4vkBKA6D4gMoUtgKMjRfrxsoGx
         Qb407vndPyr835h7v8AiNyj5cxsJ3UH7AMjQacBKMmz3vHXqS42p8arsHUB//9CGPbkX
         CpQAm+ZSX3I4V+bsXXNxk3w27R7tfncG8tiiNLEllWiaQavfn1EdWqWw84KY91vc2QKR
         RQbvQf4qTF9YIfhjiT0sKb7NQILvEpXKYySROUAotBXU32KZBIXyMZ3An+8ODTzlC89L
         E8lNxgJ5q9mBfynpHWAjN6ego5Q13Nexye2P1OoIycmbROroN0yBTlEI3eUJqci+rrve
         K/QQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZo5qjz0djPjzy2KL5wA+8uw+XTjYfvjn4cUpWNzz7SdcPJeRKArF+H7vyw+GEb+MntFcBID0JjyjMBkJo@vger.kernel.org, AJvYcCWaIh8zOzPPBOa/aI5qdVEP3Z5m0+PTjAs3/+tkZh1HqMvsr1mnV/jrRqRrMSE/JceTo/SGf2BJGy1c@vger.kernel.org
X-Gm-Message-State: AOJu0YzO8UCx4lmo0ken0V9xmy3owlAiDVRrG5oc3TuzQ6cn1A7mSLEE
	UPgf6IwDy7pJ9RPCWWrhJvkswNiB9XsUS/LHs4oXYrRq0u9tyucH2uuhzCY+2A==
X-Gm-Gg: ASbGncuHAEjeNIiwtzIU/EjiG6jso+BxORb5aPcdrVQpzvooj6f2//DXhgqvUUP8hBu
	zvLnlqvJk+fpUqbpadF3s/u5vp/yN/yeBlTHecGuVI5YjfOeUKmaZIbaDEmaY4W5VA+KhUrYn+t
	70+u3h74PBBhOF/INQamQvsi/m5/wG3hpb/apuHCrTd/JXulkFU8YZvtavL4EXcNZ04mt8gOo2N
	C+Rs2POyp3L2rQvSekaczmi6EbZuudhldh/t32GZm2cijIICJXbZspN2nUJRsjf6gzrUvsR5xom
	9k9r0YoJiaQ5E/z7sZSbam/btWzg/9FB1dfEA7KobRthjx0EGVmkUPqvMEECjuJ8vXFJNm0mBnY
	WDFnsyn8jkUBclCj8PL7karOCf+V1ma+COGc7n/xbwHQ1e2KWrBCEEYeIEt75qS0AZ8v7LHU7sA
	076iI9i9m5HVME6GJh0iXHLQ==
X-Google-Smtp-Source: AGHT+IHAqWSFDvzHQIOduCsUpmspjhngGLOJQKPUKmq1WoKmuHM4jph1VFwpq4KQI+Zz/eniI62sMQ==
X-Received: by 2002:a05:600c:4e05:b0:456:18d4:5f7b with SMTP id 5b1f17b1804b1-4562efbc588mr253820605e9.9.1753208760148;
        Tue, 22 Jul 2025 11:26:00 -0700 (PDT)
Received: from ?IPV6:2001:9e8:f139:9a32:d493:4cd5:1f24:fef4? ([2001:9e8:f139:9a32:d493:4cd5:1f24:fef4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca253f9sm14331507f8f.6.2025.07.22.11.25.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jul 2025 11:25:59 -0700 (PDT)
Message-ID: <7b0c1f38-51f9-46a7-8e38-1fbeb189133c@gmail.com>
Date: Tue, 22 Jul 2025 20:25:58 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] dt-bindings: i2c: realtek,rtl9301-i2c: extend for
 RTL9310 support
Content-Language: en-GB
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-i2c@vger.kernel.org,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Markus Stockhausen <markus.stockhausen@gmx.de>
References: <20250712194255.7022-1-jelonek.jonas@gmail.com>
 <20250712194255.7022-3-jelonek.jonas@gmail.com>
 <20250714-magnificent-powerful-nuthatch-afcc01@krzk-bin>
 <0a2a0fa6-ee82-40be-b62d-847a4ef04626@gmail.com>
 <df947cbe-e207-4619-957f-0c961c6d7139@kernel.org>
From: Jonas Jelonek <jelonek.jonas@gmail.com>
In-Reply-To: <df947cbe-e207-4619-957f-0c961c6d7139@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Krzysztoof,

On 21.07.2025 09:02, Krzysztof Kozlowski wrote:
>>>> +    minimum: 1
>>>> +    maximum: 2
>>>> +
>>>>  patternProperties:
>>>> -  '^i2c@[0-7]$':
>>>> +  '^i2c@([0-9]|1[0-1])$':
>>>>      $ref: /schemas/i2c/i2c-controller.yaml
>>>>      unevaluatedProperties: false
>>>>  
>>> As mentioned last time, missing constraints.
>>>
>>> How did you solve this:
>>>
>>> "you should clearly narrow this per variant"?
>>>
>>> See example schema. It has EXACTLY this case.
>>>
>>> https://elixir.bootlin.com/linux/v5.19/source/Documentation/devicetree/bindings/example-schema.yaml#L212
>>>
>>> You also need to narrow the number of children.
>> I missed that from your previous review by mistake, sorry for that.
>>
>> I managed to narrow it per variant whether 'realtek,mst-id' is required or not.
>> But I'm not really able to do the same for the different regex patterns or the
>> number of children. Although I'm trying to follow various examples,
>> dt_binding_check just fails not taking the regex patterns into account.
>>
>> Since you have a lot of expertise on that and I obviously fail to find
>> documentation that helps me to do that properly, could you give me some hints
>> on how that has to look? I'd really appreciate this.
>
> So in your if:then: block where you narrow mst-id, you add on same level
> as properties:
>
> patternProperties:
>   YOUR_REGEX: false

How I thought of narrowing that in the first place was to make mst-id required
for RTL9310 but optional for RTL9300. In terms of describing the hardware, this
is valid for RTL9300 too (but there's no need for the driver or anything else to
know that).

But I don't mind if you'd rather have it only defined in the 'then' block, or
just disallowed for RTL9300, effectively forbidding the usage for RTL9300.

Either way, it seems I'm still doing it wrong with the regex. Adding as you
suggested:

if:
    properties:
        compatible:
            contains:
                const: realtek,rtl9301-i2c
then:
    patternProperties:
        '^i2c@([0-9]|1[0-1])$': false

breaks validation of the RTL9300 example. Probably I don't see how this
is expected to look like in a working state.

Doing it like the following, very verbose and redundant but at least obvious to
me what it should achieve:

if:
    ...
then:
    patternProperties:
        '^i2c@([0-9]|1[0-1])$':
            ...
else:
    patternProperties:
        '^i2c@[0-7]$':
            ....

breaks validation of both example. To be honest I don't know why.

>
> Best regards,
> Krzysztof

Best regards,
Jonas Jelonek

