Return-Path: <linux-i2c+bounces-2313-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1710C8775C0
	for <lists+linux-i2c@lfdr.de>; Sun, 10 Mar 2024 09:10:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 875501F21191
	for <lists+linux-i2c@lfdr.de>; Sun, 10 Mar 2024 08:10:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61D5A17550;
	Sun, 10 Mar 2024 08:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HSUpZ0mH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E85211CA9
	for <linux-i2c@vger.kernel.org>; Sun, 10 Mar 2024 08:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710058220; cv=none; b=a9GYFcKRLKY8sI+mKo/BneHYDzYmhCA2K6PP8W0cKR22R530A6wJIcBbHOefq5KHhFe44hAKH7l1ZJv4mJ3R3qZu7ZyN3hwGdtHjI2Xy/qVNDsU/c0VYpxPmEG2PycChACQj40xuFu9LncGi8B2hNgPXOa8OqtlR2jj5V4GxtFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710058220; c=relaxed/simple;
	bh=UCwEmjETmoCm85B0On7MNL8pdVmOSjUhQuvCBZzUoQc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pKbm3nnucFMbDobjrDdYz8lIlF9YVXVrkKBtDu3hPgR/rUrFqbU6RNNzKo0EjTvDUIwecqwrB2m9sJo3RVLVKwqRXJrGnVdAufcS5wjqZqaectzBARIl5jYOiMVDmm6DfufYPEVFt2tgY0S3FYugEuZrGzLnyXh0NbeSG4wmZAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HSUpZ0mH; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a44f2d894b7so436997366b.1
        for <linux-i2c@vger.kernel.org>; Sun, 10 Mar 2024 00:10:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710058216; x=1710663016; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c9y9ZYLb+jBcKKAOj7YLY8WijS5svlScNg86EMTi5/E=;
        b=HSUpZ0mHHoywlFniwdOZcTqE+PFXcveB1HstTNgtkww6vZArK2Rlg+LFs+jJ7qmqs2
         lA2huM7EVLWDUTg8KpaPicZcO6LmuxNkJ7X8XvDLbbH7W6ihzZk2z6c9zwrCX5tRaWGG
         Kd0+ByANvZMxzJWS1earfszHpes3c0/2+T9MOVhMRs5tFZqPwwa2lAGSrSXE4nOtnihI
         +P6PbRV4lSunEYux5uWZSui+zfF0cl2BUZX4bBXwqKdp9G+O6M6lfEU3n4yuRVg0S1BQ
         WQU5vO7ejJB7z184HKD4jxRLhmY0puGPzaeVuwegGOZprB4VxA+0hO5kLQz2uBbknvh+
         4+dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710058216; x=1710663016;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c9y9ZYLb+jBcKKAOj7YLY8WijS5svlScNg86EMTi5/E=;
        b=b8S1eKGIqAjEvY0rqigDBH9pQwrLYJQiDYmho93oJfZ3U+Gg0RPKbdS03EMkGM0NTO
         F6Bc8Av67DaBWYAMH6XWGY0hLgWeYAxcPGqBKqHz2QxliambfWULqZCuwWKMEzk36cF1
         hjb9LBwJsO1vz/VD52tRTyWcR++Fzq4f1MlCKLEJSadUmWTPz/4meDFVdl/Xamxc5fSL
         4vGRCY5oKIzbp/FLrFpFhhOZdzfx2uE9J/ng8tbfcHdTTRI2gf7OHJHIBOrAi+ylG7w6
         r/ijOTEZhml6UDkmz4uo713x+eVpH1+ax/JvoHzNf75zod1RIszyC5K4oO2FcgJ9RAz7
         Fcng==
X-Forwarded-Encrypted: i=1; AJvYcCX1CXKGpIN/YkAIFVkCE9QfEhRtTKXWEZZyLxUyjb7cCl6Kfn0nOawchFX92ajNd5DYWJNtqRh6hB9zAmjgHofrSQGO1CGvhMqS
X-Gm-Message-State: AOJu0Yxy7u/64mjj7d6IQALG4M+arE+DWPxhpf5hIFvwwAZwtWk2Pcv2
	/J3ElmfI0iZ5eCmXeCo3oxwhzOgwzaNjCh74PKFnbtEWqbbja4YwaqChBq02lSQ=
X-Google-Smtp-Source: AGHT+IGscwOy6b7NpMC647YhMZmh4GjQaNkjmdz6YrIYT9R2pIsAcSH26Am2wDG0nGIYVzLW+mMfug==
X-Received: by 2002:a17:906:1950:b0:a45:f773:603e with SMTP id b16-20020a170906195000b00a45f773603emr1890765eje.51.1710058216208;
        Sun, 10 Mar 2024 00:10:16 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id gt20-20020a1709072d9400b00a46025483c7sm1426683ejc.72.2024.03.10.00.10.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Mar 2024 00:10:15 -0800 (PST)
Message-ID: <2974085a-d9b4-4a66-b60f-c02a06a74647@linaro.org>
Date: Sun, 10 Mar 2024 09:10:13 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] dt-bindings: i2c: renesas,riic: Document R9A09G057
 support
Content-Language: en-US
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Chris Brandt <chris.brandt@renesas.com>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240308172726.225357-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240308172726.225357-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <7082ed3b-d6d0-4228-b7a6-7c0e0e46b8e2@linaro.org>
 <CA+V-a8tM29h10DULurMJtBZBnLK_ZF7pH_Y0bhZTvWO0O7-G-Q@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <CA+V-a8tM29h10DULurMJtBZBnLK_ZF7pH_Y0bhZTvWO0O7-G-Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/03/2024 00:28, Lad, Prabhakar wrote:
> Hi Krzysztof,
> 
> Thank you for the review.
> 
> On Sat, Mar 9, 2024 at 12:00 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 08/03/2024 18:27, Prabhakar wrote:
>>> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>>>
>>> Document support for the I2C Bus Interface (RIIC) available in the
>>> Renesas RZ/V2H (R9A09G057) SoC.
>>>
>>> The RIIC interface in the Renesas RZ/V2H differs from RZ/A in a
>>> couple of ways:
>>> - Register offsets for the RZ/V2H SoC differ from those of the RZ/A SoC.
>>> - RZ/V2H register access is 8-bit, whereas RZ/A supports 8/16/32-bit.
>>> - RZ/V2H has some bit differences in the slave address register.
>>>
>>> To accommodate these differences in the existing driver, a new compatible
>>> string "renesas,riic-r9a09g057" is added.
>>>
>>> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>>> Reviewed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
>>
>> I have doubts this are true reviews. What did it even show? Why this
>> review did not point problem with generic compatible?
>>
> As mentioned in path#1 these are "real"!
> 
>>> ---
>>>  .../devicetree/bindings/i2c/renesas,riic.yaml | 21 ++++++++++++-------
>>>  1 file changed, 13 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/i2c/renesas,riic.yaml b/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
>>> index 63ac5fe3208d..2a7125688647 100644
>>> --- a/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
>>> +++ b/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
>>> @@ -15,14 +15,19 @@ allOf:
>>>
>>>  properties:
>>>    compatible:
>>> -    items:
>>> -      - enum:
>>> -          - renesas,riic-r7s72100   # RZ/A1H
>>> -          - renesas,riic-r7s9210    # RZ/A2M
>>> -          - renesas,riic-r9a07g043  # RZ/G2UL and RZ/Five
>>> -          - renesas,riic-r9a07g044  # RZ/G2{L,LC}
>>> -          - renesas,riic-r9a07g054  # RZ/V2L
>>> -      - const: renesas,riic-rz      # generic RIIC compatible
>>> +    oneOf:
>>> +      - items:
>>> +          - enum:
>>> +              - renesas,riic-r7s72100   # RZ/A1H
>>> +              - renesas,riic-r7s9210    # RZ/A2M
>>> +              - renesas,riic-r9a07g043  # RZ/G2UL and RZ/Five
>>> +              - renesas,riic-r9a07g044  # RZ/G2{L,LC}
>>> +              - renesas,riic-r9a07g054  # RZ/V2L
>>> +          - const: renesas,riic-rz      # generic RIIC compatible
>>> +
>>> +      - items:
>>> +          - enum:
>>> +              - renesas,riic-r9a09g057  # RZ/V2H(P)
>>
>> No, that does not look right. If you added generic compatible for all
>> RIIC then how can you add a new RIIC compatible which does not follow
>> generic one?
>>
> The generic compatible above which was added previously was for the
> RZ/(A) SoCs and not for all the RIICs. The RZ/G2L family was also

No, it said: "generic RIIC compatible". It did not say "RIIC RZ/A". It
said RIIC RZ

> compatible hence they fallback to the generic RZ one.

riic-r9a09g057 is also RIIC RZ, isn't it?

> 
>> This shows the ridiculousness of these generic compatibles. They are
>> generic till you figure out the truth: oh crap, it's not generic.
>>
> Sorry I lack skills to predict the future of upcoming IP blocks which
> fit in the SoC.

So don't use generic compatibles as fallbacks. That's the point.

> 
>> Stop adding generic compatibles when they are not generic.
>>
> BTW I am not adding a generic compatible string here and instead
> adding a SoC specific string. Anyway DT maintainers "should not" have
> been accepting the generic compatibles from day 1 for any binding at
> all.

How can we know that you do not understand the meaning of compatibles? I
assume you do, so we ack your patches. In the same time *MULTIPLE* times
Rob said, and later me as well, people should use SoC specific
compatibles mostly.

> 
> Is there a guideline where you can point me to please for when to add
> generic and when not to.

Guideline is: Don't use generic compatible at all, because you cannot
give it any meaning, based on this patch.

Best regards,
Krzysztof


