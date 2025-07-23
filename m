Return-Path: <linux-i2c+bounces-12001-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 962D2B0EC50
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Jul 2025 09:49:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 56654188D836
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Jul 2025 07:49:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 651132777E0;
	Wed, 23 Jul 2025 07:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iuq1nuUK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24BF2E3702;
	Wed, 23 Jul 2025 07:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753256964; cv=none; b=uVl9Vm076XqLk8cVhzB3pBqsuytfpKcwTR7ShX4GIEiUZ4opLPZB5gVwYz0Y1jVrvc32+i/PzFTcGPgL+WvCalOPlhcSHIx25TuK4z0FOXuF2PGFcy4Fjy6GHDv+WlX6MP4LzMRuvHJE0oALBu7Rc7DrHX034fqouV9KgeZBrTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753256964; c=relaxed/simple;
	bh=t33Xe0LodeXf28QXyDk1B6s3zfFjXaGS/8TEr/GeTb8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tubD4jVL0J2UKIO2GWIJFQDeSpiOXx71gzUCFjlSytkYlqi85EPkzPAHBOgTj3Jaj+j1jV0MG+0dmgObiWW6Xeg3nqZv945YqAqTCuZZBdHD6chcYT2PCbG+Sgbz3iKhJbIfl5g10bETrqZEc3zixCnlZR8VSFkH6vRc6W9V+kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iuq1nuUK; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4563a57f947so2957425e9.1;
        Wed, 23 Jul 2025 00:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753256961; x=1753861761; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=faEjMwHjWyh8miZKgX8FfWhLCg9wJUhaMh5yhviPXOU=;
        b=iuq1nuUKsLlKMhTlejZB4B1PrpUiUZBRAB+30ADWpsCYQFpTKJZnSy1lMiQOdDPAUK
         uYJYD65KyROyPDlW2JwUITz3dTRFOZAInIcwby2SbO5WtdswPtl0ULbYZCgmYARAUQbM
         KL+x9sH06JKOhZpTDr0pKAjLN/TqZ08lbuYy60P1pGX+iYyOYkEoyeLTwnvAGooZVjno
         EfU2DMm1WxtZ/Le2MAziTDE7wNkVJr12kh5SstRvuz9fAnWkbVISlE1op7xZMOp+Hc7J
         LYG1usuxJaPkaWzxBj6aUCkWjf008+gVYDL1Fo3bENOY2xwekZtLwK5eTQ7aHeuhViU1
         irGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753256961; x=1753861761;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=faEjMwHjWyh8miZKgX8FfWhLCg9wJUhaMh5yhviPXOU=;
        b=dYfrSPcv3eVirsJjGpiD3GhToXHng15tqVqpka3vwAGVCQJFdE4YSoJvaZhyvhAJv3
         dC5FxgW+YKIicFPaFaokXb9OUlro0TzHzRs73wPE4QUb/N8tuG+4U7wHhSX8sW5Yly0K
         rJgW4zn+TB13u1HAvVq0s3ZrLN9Z1W5uOGZuAbqcPstfrbrW6lxsBZjEIn0dNx54WBUA
         4Iq/710wTww88EXLtxUN2l0RKmecvlcVZcKm7Z6N/Pp6ZUUDcvXHrLcyJeEW7jrrOujZ
         KrQk+w26vhIOPWLU9g0THEvzFA+hnio06sciVX2YeEaF28Yu58GLQ9+k8yVfJWrL1x8h
         r5gA==
X-Forwarded-Encrypted: i=1; AJvYcCUvNS5SybDpwIXAOUDHNjZd6E8RZWRdA8KnQ2yjsy+WgD2Ld0U7rns67MXLQIzLYNOy68SFcNZXPjCr@vger.kernel.org, AJvYcCV44BRw7Uo0fp9PQW5i8jJrXG7qr5BQk0zCFcyRF2xyCkQdaNmhtQ68Y4JFwdjP6AVu+agAVrVhSKxpHhzY@vger.kernel.org
X-Gm-Message-State: AOJu0YwdoXcnwSeAduQjzzkvD1K7KOwDtelA2d048eP34UYrAm910uGV
	hQGF012GUq/co1CMDNojcGIxKqFQ365UOiNcGzolOLLbMT5Kp3/b7i6y0h5nPw==
X-Gm-Gg: ASbGncvT49sWcrD3njrdIzvqqQZIKr1Uvjb9wlULEJoHlbBy64IAwdkxm33i2LFrYIr
	aNevRTL3DmknN9jEhz5P3HCaNMYivIyfHP2MPMKhW1TuSuJ5dKmjfe0iiU1fnvsf4pr4Hfc2MNC
	aSggtqYugHdbfUfA2LLvkfUPhc+Wxt035s5EhYx88YhR01B+cBjlm2Cmon7gMjtODUHS7P74WoI
	y94jPBFMgwDiRqNa4omNHD2rW/TmFrPUOcYam97L4J9yBDrwwcIXiUTma/a6a10VZ6/crkhC8hi
	46G0szOQwjoM3a2vnkwUIakEAPc4eKiS4EDzsgJfWY59QJ+1vYIuTWaIabnUK0HzwASHcJ+ljVb
	hAkjjhjBmaW55J3+BY9kwq5y0NGoRl5lO3VxKQIdCg8+js2dWHJv486xmJFBsJ3HDOUK3SPoD2L
	c8I2eqIRbx14cPITkdfctt1Q==
X-Google-Smtp-Source: AGHT+IFjXxMVisRBxWYSkdUXrjH5I90NtEBb71HNP7ZTo9z7Kvkjy0pL4qlC3dKGPLO71KIVa1h75g==
X-Received: by 2002:a05:6000:22c2:b0:3b7:67e4:5d2b with SMTP id ffacd0b85a97d-3b7694beeffmr1409179f8f.9.1753256960749;
        Wed, 23 Jul 2025 00:49:20 -0700 (PDT)
Received: from ?IPV6:2001:9e8:f100:5932:215e:8027:91ea:348d? ([2001:9e8:f100:5932:215e:8027:91ea:348d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca2bb48sm15644549f8f.24.2025.07.23.00.49.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jul 2025 00:49:20 -0700 (PDT)
Message-ID: <e5d4e059-1274-46fe-8719-139f388fd975@gmail.com>
Date: Wed, 23 Jul 2025 09:49:18 +0200
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
 <7b0c1f38-51f9-46a7-8e38-1fbeb189133c@gmail.com>
 <3515f1dd-bed2-4f54-97fb-194850440e14@kernel.org>
From: Jonas Jelonek <jelonek.jonas@gmail.com>
In-Reply-To: <3515f1dd-bed2-4f54-97fb-194850440e14@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Kryzysztof,

On 23.07.2025 08:22, Krzysztof Kozlowski wrote:
> On 22/07/2025 20:25, Jonas Jelonek wrote:
>>>> Since you have a lot of expertise on that and I obviously fail to find
>>>> documentation that helps me to do that properly, could you give me some hints
>>>> on how that has to look? I'd really appreciate this.
>>> So in your if:then: block where you narrow mst-id, you add on same level
>>> as properties:
>>>
>>> patternProperties:
>>>   YOUR_REGEX: false
>> How I thought of narrowing that in the first place was to make mst-id required
>> for RTL9310 but optional for RTL9300. In terms of describing the hardware, this
>> is valid for RTL9300 too (but there's no need for the driver or anything else to
>> know that).
>>
>> But I don't mind if you'd rather have it only defined in the 'then' block, or
>> just disallowed for RTL9300, effectively forbidding the usage for RTL9300.
>>
>> Either way, it seems I'm still doing it wrong with the regex. Adding as you
>> suggested:
>>
>> if:
>>     properties:
>>         compatible:
>>             contains:
>>                 const: realtek,rtl9301-i2c
>> then:
>>     patternProperties:
>>         '^i2c@([0-9]|1[0-1])$': false
>>
>> breaks validation of the RTL9300 example. Probably I don't see how this
>> is expected to look like in a working state.
> RTL9300 has 8 controllers, so why are you disallowing them? We talk here
> only about new stuff. Why would you change EXISTING behavior when adding
> something new?
>
> You need pattern matching redundant children for existing device.
>

It wasn't my intention to disallow that, but I'm struggling with these specifics
of the dt-bindings to accomplish what is requested. Anyway, I think your comment
gave me a good hint to solve that now.

if:
    properties:
        compatible:
            contains:
                const: realtek,rtl9301-i2c
then:
    patternProperties:
        '^i2c@([8-9]|1[0-1])$': false

This seems to do the trick, dt_binding_check is fine with this. Is this how you
intended it to look like?


Talking about 'not changing existing behaviour', is it fine to allow the mst-id
property for the existing RTL9300 too or should that really only be allowed for
what I add here now?

> Best regards,
> Krzysztof

Best regards,
Jonas Jelonek

