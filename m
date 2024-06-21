Return-Path: <linux-i2c+bounces-4223-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 13ED79128AF
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 16:59:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D4F01C23E0B
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 14:59:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3355481A7;
	Fri, 21 Jun 2024 14:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Oqz3vE+q"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98AEE3D388
	for <linux-i2c@vger.kernel.org>; Fri, 21 Jun 2024 14:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718981968; cv=none; b=fKPbhZBDKO1+6UTNcIFcMc0x0gcdIqHhEFCp5a2No85Q+6iyN9Yyx1hNGUya6ZwHaJmJqEgBSJQ6xOoHZlZgpJtmRe8xUiIRrcVFply4Q9AbAtQzit8WP6OQi9+A4nytIcI+ctfuepl89/8v0lU7MwHcxzI64W2XLBAkTUolOQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718981968; c=relaxed/simple;
	bh=WigRbV7KlBkMBfbFYkSADamOt1ilXsNtB7dVBf83LNY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KoO86BML1zG/1KVJovOAiWHCUMhVuskxG2qMhPyv/J5P39VPlA+pgO/kSS+LrqQho2jOWDjmT+W/sMjPXaGU6y11AppaoKxg5vOa5OHS4OQuRr46sIQk2a9q4HI/zrAF/2xjqdOLkNSE2/mwP6KDdqv0BWyse/VDNpZFjqcmaZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Oqz3vE+q; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5295eb47b48so2627849e87.1
        for <linux-i2c@vger.kernel.org>; Fri, 21 Jun 2024 07:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1718981965; x=1719586765; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7k2nQvFOjuZ7C6fH4GnT+p4Sp8E7d5ws7fWv5o6k/Os=;
        b=Oqz3vE+qdSCBS5G2ktOtuVfw0ca7Wwz4W9iT9RWEXnDtJzTcewhHrqfQLYmGO52FJt
         3uFL5BL38lcZmzy3HQ3SjX5jJV1uh8i+ZGx8Fsqge8UMPa5ELzJlgenSkqW28n/wRCuH
         UHbwgjYCStcegsoCPDIcbqSvFLBdYNwcbeDm1MWfNeWFpgz4hTr0UJgSnHJcY+xary2t
         xMKk013jxL9wAABlmnRD1OfSnaGThIv85m/1CUU2UkdPA1eDJ2kSAjNo2O8++b9ubCfx
         bIEJ0laLx7UzQdFCLQh5Z1Ri/bCeqJ1KIhEVNAD3fRpf9lHgVXTdCFNA+fj1g28n4J79
         W0zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718981965; x=1719586765;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7k2nQvFOjuZ7C6fH4GnT+p4Sp8E7d5ws7fWv5o6k/Os=;
        b=UNm8tyVckjmbPQ+HosOP9R556HXjGRaoP1SS29O8vR/yw75P0bsIjmCmfdJ0NnWjFT
         x5m7mm/77bEJUGg68S4JNSfBdfMnvQJfhd3sS7UpAiEh8ZEL40zsoRNTdg/u0P18Yx1L
         YQ36wlAMEqce33ZTKbw5PVB5op5pLVwS+G3Nd7UAwNn8SnUXGfYxbv9+Ocv80U+crjGZ
         YI8CtQXXSYdgzZfXkka4uTEAoN0cPJ8/mpKnGC3rMwPr0cAC3+zh3odti8HYoXKVxBVe
         7PaeFWW79L1AaKHYbbQ2s07bM/afCeV5vMAXx53b6N0QABqH3zyAMk/LggZNfRN6ANUY
         yl7w==
X-Forwarded-Encrypted: i=1; AJvYcCVk+pPnLDNES5QpGveKFYVFawht9NMRnVqq7FIhnMwzpjxTJYQ0Y0XIvBTVHFUl5JnNVA9+zBWYpw9W/GJZEENTGad+tw0EEQpe
X-Gm-Message-State: AOJu0YyNt/ClaP7yynp9OULZFTCn4aKr/ymk0h8Ogx7W6Z+w0XGoEDE0
	FPIDWnI6CVyScnswUQ4fWQ+3eFHrt8Zj+OxHtMFHlGrwJaiLRpqeGX9drZ6Y12s=
X-Google-Smtp-Source: AGHT+IFFbnXa5y83ipiFrBG70v4cTSICilZFHJK0nDg/PBcswmk/132r8UcGNAsTvy2hfDPzaalr3w==
X-Received: by 2002:a05:6512:214e:b0:52c:bc50:ff35 with SMTP id 2adb3069b0e04-52ccaa9739cmr4598189e87.57.1718981964604;
        Fri, 21 Jun 2024 07:59:24 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424817b6381sm30688365e9.28.2024.06.21.07.59.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jun 2024 07:59:24 -0700 (PDT)
Message-ID: <86843e15-6791-4214-8eca-720142820973@tuxon.dev>
Date: Fri, 21 Jun 2024 17:59:21 +0300
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/12] dt-bindings: i2c: renesas,riic: Document the
 R9A08G045 support
Content-Language: en-US
To: Biju Das <biju.das.jz@bp.renesas.com>,
 Chris Brandt <Chris.Brandt@renesas.com>,
 "andi.shyti@kernel.org" <andi.shyti@kernel.org>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "magnus.damm@gmail.com" <magnus.damm@gmail.com>,
 "mturquette@baylibre.com" <mturquette@baylibre.com>,
 "sboyd@kernel.org" <sboyd@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240621112303.1607621-1-claudiu.beznea.uj@bp.renesas.com>
 <20240621112303.1607621-9-claudiu.beznea.uj@bp.renesas.com>
 <TY3PR01MB11346105D3D3DD46AEF8CD44986C92@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <0bc78e5e-de37-4ff6-ac74-571f615b97f9@tuxon.dev>
 <TY3PR01MB1134602C189C6C63C6187840886C92@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <b5a3ef7c-8509-4065-ab0f-efb5a7e5fcbb@tuxon.dev>
 <TY3PR01MB11346D9CF89F7ED9B6A49C61586C92@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <e381e1c0-2e23-4734-a55f-cab6c21f8c5b@tuxon.dev>
 <TY3PR01MB113468EF895A0EBED5DBD975D86C92@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <871c563d-daa5-4be4-b114-9a8072e4edd0@tuxon.dev>
 <TY3PR01MB113462C6C427DD4581086430D86C92@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <TY3PR01MB113462C6C427DD4581086430D86C92@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 21.06.2024 17:37, Biju Das wrote:
> 
> 
>> -----Original Message-----
>> From: claudiu beznea <claudiu.beznea@tuxon.dev>
>> Sent: Friday, June 21, 2024 3:31 PM
>> To: Biju Das <biju.das.jz@bp.renesas.com>; Chris Brandt <Chris.Brandt@renesas.com>;
>> andi.shyti@kernel.org; robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org;
>> geert+renesas@glider.be; magnus.damm@gmail.com; mturquette@baylibre.com; sboyd@kernel.org;
>> p.zabel@pengutronix.de; wsa+renesas@sang-engineering.com
>> Cc: linux-renesas-soc@vger.kernel.org; linux-i2c@vger.kernel.org; devicetree@vger.kernel.org;
>> linux-kernel@vger.kernel.org; linux-clk@vger.kernel.org; Claudiu Beznea
>> <claudiu.beznea.uj@bp.renesas.com>
>> Subject: Re: [PATCH 08/12] dt-bindings: i2c: renesas,riic: Document the R9A08G045 support
>>
>>
>>
>> On 21.06.2024 17:06, Biju Das wrote:
>>> Hi Claudiu,
>>>
>>>> -----Original Message-----
>>>> From: claudiu beznea <claudiu.beznea@tuxon.dev>
>>>> Sent: Friday, June 21, 2024 2:30 PM
>>>> Subject: Re: [PATCH 08/12] dt-bindings: i2c: renesas,riic: Document
>>>> the R9A08G045 support
>>>>
>>>>
>>>>
>>>> On 21.06.2024 16:10, Biju Das wrote:
>>>>>
>>>>>
>>>>>> -----Original Message-----
>>>>>> From: claudiu beznea <claudiu.beznea@tuxon.dev>
>>>>>> Sent: Friday, June 21, 2024 2:06 PM
>>>>>  Subject: Re: [PATCH 08/12] dt-bindings: i2c: renesas,riic: Document
>>>>> the R9A08G045 support
>>>>>>
>>>>>>
>>>>>>
>>>>>> On 21.06.2024 15:56, Biju Das wrote:
>>>>>>>
>>>>>>> Hi claudiu,
>>>>>>>
>>>>>>>> -----Original Message-----
>>>>>>>> From: claudiu beznea <claudiu.beznea@tuxon.dev>
>>>>>>>> Sent: Friday, June 21, 2024 1:55 PM
>>>>>>>> Subject: Re: [PATCH 08/12] dt-bindings: i2c: renesas,riic:
>>>>>>>> Document the R9A08G045 support
>>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>>> On 21.06.2024 15:34, Biju Das wrote:
>>>>>>>>> Hi Claudiu,
>>>>>>>>>
>>>>>>>>>> -----Original Message-----
>>>>>>>>>> From: Claudiu <claudiu.beznea@tuxon.dev>
>>>>>>>>>> Sent: Friday, June 21, 2024 12:23 PM
>>>>>>>>>> Subject: [PATCH 08/12] dt-bindings: i2c: renesas,riic: Document
>>>>>>>>>> the
>>>>>>>>>> R9A08G045 support
>>>>>>>>>>
>>>>>>>>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>>>>>>>>
>>>>>>>>>> Document the Renesas RZ/G3S (R9A08G045) RIIC IP. This is
>>>>>>>>>> compatible with the version available on Renesas RZ/V2H
>>>>>>>>>> (R9A09G075). Most of the IP variants that the RIIC driver is
>>>>>>>>>> working with supports fast mode
>>>> plus.
>>>>>>>>>> However, it happens that on the same SoC to have IP
>>>>>>>>>> instatiations that support fast mode plus as well as IP
>>>>>>>>>> instantiation that doesn't support it. For this, introduced the renesas,riic-no-fast-
>> mode-plus property.
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: Claudiu Beznea
>>>>>>>>>> <claudiu.beznea.uj@bp.renesas.com>
>>>>>>>>>> ---
>>>>>>>>>>  Documentation/devicetree/bindings/i2c/renesas,riic.yaml | 8
>>>>>>>>>> ++++++++
>>>>>>>>>>  1 file changed, 8 insertions(+)
>>>>>>>>>>
>>>>>>>>>> diff --git
>>>>>>>>>> a/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
>>>>>>>>>> b/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
>>>>>>>>>> index 91ecf17b7a81..c0964edbca69 100644
>>>>>>>>>> --- a/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
>>>>>>>>>> +++ b/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
>>>>>>>>>> @@ -25,6 +25,10 @@ properties:
>>>>>>>>>>                - renesas,riic-r9a07g054  # RZ/V2L
>>>>>>>>>>            - const: renesas,riic-rz      # RZ/A or RZ/G2L
>>>>>>>>>>
>>>>>>>>>> +      - items:
>>>>>>>>>> +          - const: renesas,riic-r9a08g045   # RZ/G3S
>>>>>>>>>> +          - const: renesas,riic-r9a09g057
>>>>>>>>>> +
>>>>>>>>>>        - const: renesas,riic-r9a09g057   # RZ/V2H(P)
>>>>>>>>>>
>>>>>>>>>>    reg:
>>>>>>>>>> @@ -66,6 +70,10 @@ properties:
>>>>>>>>>>    resets:
>>>>>>>>>>      maxItems: 1
>>>>>>>>>>
>>>>>>>>>> +  renesas,riic-no-fast-mode-plus:
>>>>>>>>>> +    description: specifies if fast mode plus is not supported
>>>>>>>>>> +    type: Boolean
>>>>>>>>>
>>>>>>>>> Can't this info, as part of device data?? Based on frequency and
>>>>>>>>> device data is enough to derive this info??
>>>>>>>>
>>>>>>>> We can't rely completely on device data because on RZ/G3S we have
>>>>>>>> 2 RIIC channels that support fast mode plus and 2 that doesn't support it.
>>>>>>>
>>>>>>> Can't array of bits for this channels won't help??
>>>>>>
>>>>>> Can you give an example? I'm not sure I understand how you would
>>>>>> prefer me to use the array of bits.
>>>>>
>>>>> struct riic_of_data {
>>>>> 	u8 regs[RIIC_REG_END];
>>>>> 	u16 fast_mode_info info; /* 1 means fast mode plus supported,
>>>>> starting with channel 0*/ };
>>>>>
>>>>> .info = 0x3, means channel 0 and 1 has fast mode plus supported
>>>>> .info = 0x0, none of the channel supported fast mode plus.
>>>>
>>>> If I understand the proposal correctly, a match b/w struct
>>>> riic_of_data::info bit + frequency and the nodes in device tree is
>>>> still needed, right? As the RZ/G3S RIIC channels are using the same compatible.
>>>> W/o a match how I cannot detect in the driver who is, e.g., channel 1
>>>> that supports FMP w/o hardcoding some RIIC channel data in the driver (e.g. RIIC channel
>> address)?
>>>
>>> bit array gives the capability info on various channels.
>>>
>>> If someone define fast_mode_plus frequency in DT node and channel is
>>> not fast_mode_plus(from the capability info) then you should return error.
>>>
>>> Here you need to use SoC specific compatible as each SoC has different capabilities.
>>
>> And I would add, as it is in this case: there are multiple instantiation of the RIIC in RZ/G3S SoC.
>> RIIC 0 and 1 supports FMP, RIIC 2 and 3 does not.
>>
>> For all RIICs (0, 1, 2, 3) we use the same compatible (as all are part of the same SoC). How to do
>> the match b/w DT RIIC channel and driver with the solution you propose w/o hardcoding some RIIC
>> channel data in the driver?
> 
> .info =0x3, so you know from the capability, for this soc, bus 0 and 1 supports FMP.

I understand this part. What I don't understand is: when probing the driver
for, e.g., bus 0, how do I know I probe the driver for bus 0? compatible is
the same for all buses.

> 
> Cheers,
> Biju
> 
> 
>>
>>>
>>> Cheers,
>>> Biju
>>>
>>>
>>>>
>>>> Also, for future SoCs that will suffer the same symptom but for
>>>> different channels (and channels with different addresses) the driver
>>>> will have to be adapted to match b/w the channel bit in struct riic_of_data::info and channel
>> node from DT.
>>>>
>>>>>
>>>>> Cheers,
>>>>> Biju

