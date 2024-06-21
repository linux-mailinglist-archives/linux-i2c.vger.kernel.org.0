Return-Path: <linux-i2c+bounces-4215-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F57912654
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 15:06:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D4F401C21895
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 13:06:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B43C2142620;
	Fri, 21 Jun 2024 13:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="VJPbVqyh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD29153BE6
	for <linux-i2c@vger.kernel.org>; Fri, 21 Jun 2024 13:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718975172; cv=none; b=SeOv13TSc9mQXSoGvfkFdOPqjXmjujuFX0h34teRT+R/5gqo1yxtj6Z5RsCiCdnGb24aiXz0ynHiLQ7q1R8EVPWr5pjWvc0QvQznvk/4v0aCftPYvpe+BVH6PYlRBaGCM2wa3iT+vDj1psOYc8Cau43kSjpdiVD7SuIS9SylBM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718975172; c=relaxed/simple;
	bh=ecepSflotEsDaYe0vYyujtYj08BaRh2BO7y9YSwjKP0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WntSaol3Mu85d6sNQnIp8ii60ncbduQlLLbe8pEsUOtU5nG0CDvfPmZYzte9Q6trxEg/eAwElm4X+DImKjUtlStQNOeXQe/kBj+11BUD1Gg0ZOEX/mv5DLO5pSt+EQeXUjudquAYW/Tbw+iXAGlbiVZ42i92/shXp/lfDlm0x+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=VJPbVqyh; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2ebe785b234so20871301fa.1
        for <linux-i2c@vger.kernel.org>; Fri, 21 Jun 2024 06:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1718975168; x=1719579968; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bIGxGr2DfVtUVvxkMCQXW8GR27lMFtnZISEUl68lRTU=;
        b=VJPbVqyhfxAF++Av1rrAgnfKEYJoHtcHHABsnV2YC1EA0Z1A4dg4vTBzB9wht6S4Nd
         h9sFUHhvqkDqVqUAeMj+pAgHnSwwzNa8fyDFF5dd8sVfQ/aUKmqXjol+CSSin+thHEe7
         rBSvzu8nUakndoPPWaq65ewtnJ6q4dG+5TGvodICLdr5KIPD/+jhAnU/KkL0/9JflTSg
         cEYRuM832JlMY+AjCj3zz8j7U6VFwFEm5Ndb4rfRsxR4C70LESGN95KRzoLcjuPc6n2q
         LAI0phqfRkgZywREnEjfnuhmvLnQQ29gk6fwgeOwIwmXIlK+9P0J6EWAqCdDIjHDYWAw
         cqAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718975168; x=1719579968;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bIGxGr2DfVtUVvxkMCQXW8GR27lMFtnZISEUl68lRTU=;
        b=mSv5m1Qm8OqaPqBG56PnOnIyJCfnjXlCn7QAGfWbKVuEDY0LhqqO3NJPR9bn7yeubc
         TbsaA5YQwRFLZPNtVLvVThMPgwVR7RVsGXLZETiD+kvQteHY4YSmDDSoFWE73UHB9udj
         FA3+H77lzEuYXwqxojvKHXQPcnsIvyJvbNlPU4fdO3MZcGRcvHUfR+nNcm92VU2duD/T
         2fs6oZ4bQ3sfYv1uUavaCg0zLPo4DutEXW1k475hdHTkQRvdkNV0WOTQ8ZZANLjaG2Ev
         UQ6wIUXLxRLYdaFV+Ihk+SqFNTPDDBilzLdDVYk9gCQ3JLqicU48Umlhr3hfixgPspFL
         J9ww==
X-Forwarded-Encrypted: i=1; AJvYcCXar/OtaDTBz3kFlzYq/YECp82/Z8d/GyOx9/bsxgTC1j6YSjyB2i0tcO1MWewhFGUZ/zYUX0FlOV23YTxin70ZHm05V9GrVPOA
X-Gm-Message-State: AOJu0YxTv6RXzvQJl3mn97Tt+1tCWSfT2xcDcyhfWZ6NnBeyESCNJp/o
	9m/7/9prF9QiJKB7CcAbQUDCXyDuapp0TOIych0au/Buc9F/XTE3HJeU9h1UDnk=
X-Google-Smtp-Source: AGHT+IEzEZHfG4HSbJtR65LMHcgNXMLcbF1KDaFaigAXcFwvOQ9KCFWFHvxuNW2zkIvNGyAdChuUrQ==
X-Received: by 2002:a2e:7d0b:0:b0:2ec:140c:8985 with SMTP id 38308e7fff4ca-2ec3cfe99dfmr60423631fa.36.1718975168436;
        Fri, 21 Jun 2024 06:06:08 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.70])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57d3042cca2sm929189a12.36.2024.06.21.06.06.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jun 2024 06:06:07 -0700 (PDT)
Message-ID: <b5a3ef7c-8509-4065-ab0f-efb5a7e5fcbb@tuxon.dev>
Date: Fri, 21 Jun 2024 16:06:05 +0300
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
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <TY3PR01MB1134602C189C6C63C6187840886C92@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 21.06.2024 15:56, Biju Das wrote:
> 
> Hi claudiu,
> 
>> -----Original Message-----
>> From: claudiu beznea <claudiu.beznea@tuxon.dev>
>> Sent: Friday, June 21, 2024 1:55 PM
>> Subject: Re: [PATCH 08/12] dt-bindings: i2c: renesas,riic: Document the R9A08G045 support
>>
>>
>>
>> On 21.06.2024 15:34, Biju Das wrote:
>>> Hi Claudiu,
>>>
>>>> -----Original Message-----
>>>> From: Claudiu <claudiu.beznea@tuxon.dev>
>>>> Sent: Friday, June 21, 2024 12:23 PM
>>>> Subject: [PATCH 08/12] dt-bindings: i2c: renesas,riic: Document the
>>>> R9A08G045 support
>>>>
>>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>>
>>>> Document the Renesas RZ/G3S (R9A08G045) RIIC IP. This is compatible
>>>> with the version available on Renesas RZ/V2H (R9A09G075). Most of the
>>>> IP variants that the RIIC driver is working with supports fast mode plus.
>>>> However, it happens that on the same SoC to have IP instatiations
>>>> that support fast mode plus as well as IP instantiation that doesn't
>>>> support it. For this, introduced the renesas,riic-no-fast- mode-plus property.
>>>>
>>>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>> ---
>>>>  Documentation/devicetree/bindings/i2c/renesas,riic.yaml | 8 ++++++++
>>>>  1 file changed, 8 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
>>>> b/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
>>>> index 91ecf17b7a81..c0964edbca69 100644
>>>> --- a/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
>>>> +++ b/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
>>>> @@ -25,6 +25,10 @@ properties:
>>>>                - renesas,riic-r9a07g054  # RZ/V2L
>>>>            - const: renesas,riic-rz      # RZ/A or RZ/G2L
>>>>
>>>> +      - items:
>>>> +          - const: renesas,riic-r9a08g045   # RZ/G3S
>>>> +          - const: renesas,riic-r9a09g057
>>>> +
>>>>        - const: renesas,riic-r9a09g057   # RZ/V2H(P)
>>>>
>>>>    reg:
>>>> @@ -66,6 +70,10 @@ properties:
>>>>    resets:
>>>>      maxItems: 1
>>>>
>>>> +  renesas,riic-no-fast-mode-plus:
>>>> +    description: specifies if fast mode plus is not supported
>>>> +    type: Boolean
>>>
>>> Can't this info, as part of device data?? Based on frequency and
>>> device data is enough to derive this info??
>>
>> We can't rely completely on device data because on RZ/G3S we have 2 RIIC channels that support fast
>> mode plus and 2 that doesn't support it.
> 
> Can't array of bits for this channels won't help??

Can you give an example? I'm not sure I understand how you would prefer me
to use the array of bits.

Thank you,
Claudiu Beznea

> Based on the bit info, you have that details and check against frequency defined in DT.
> 
> Cheers,
> Biju

