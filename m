Return-Path: <linux-i2c+bounces-1245-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D98D9829441
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jan 2024 08:26:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F24721C25689
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jan 2024 07:26:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A05A39AFB;
	Wed, 10 Jan 2024 07:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OAas/FW3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A391A39859
	for <linux-i2c@vger.kernel.org>; Wed, 10 Jan 2024 07:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3367a304091so3546418f8f.3
        for <linux-i2c@vger.kernel.org>; Tue, 09 Jan 2024 23:26:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704871559; x=1705476359; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3OiOLhRr/v/UoX6M5hASdWKUoK8n0S9t0J6jvZFucNA=;
        b=OAas/FW3fsdbePoaO8FMoctN5Z/GFK/mmquIdXpthWjUb9jDyC4Vz16kjhhm6CEvEs
         zwS4EHfc3zMsf8Lil256/5eHixzvJwiZoMx7LZ/Ijau9m1yqe+gQNhlxssQ7qSRf0h35
         LWJ3o8WQ2+KGRDuylDJ9BdJJHuS+lPmS71r37J3cggczHFwvvZl9ikw6KnejlUINtaOr
         vWtM952hwAxXzHAIQOFmR28TYyWYVNAiKsfjRE3Wm+5jJUKAVTqKbopgdH9ec0Lz2w6s
         8KYIS95MqJxkEvsmAn0Yk1thscAOeiGoTzqbmKhC71w8haKXGYy1Fma8+J9DJUAxaGFl
         OPQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704871559; x=1705476359;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3OiOLhRr/v/UoX6M5hASdWKUoK8n0S9t0J6jvZFucNA=;
        b=cVp/4oXhBeGl/U4sMEMSg9re9wSJqVIrchZK/r8a2uvAunRFauKhfAbRIxW3oMLddj
         joH3tquoBAui758pUvQjhiVpguQYZs0dcrGXRV2tEEG6shw4T+Q/Lqr7M+rIY26fQTGk
         /E9Hb9GYSi6jcu03gjDYkMtBV9sKYRdZoWMrE8tShci+ArLQnl9aav6lZ2bTEpeMfS45
         O005P/fKJXQzgVCdQbMqxu8MGSuEjtNErbaeVRaJFNPwaIDuGMmw7ZaD1qcpx6EIkaA+
         GUUXtVLO+6whMLVpd2G2huLJhfXF82BOhH2unEKK3G/qugJmie3lwdsYJbTVWYKs4Ybn
         Gfew==
X-Gm-Message-State: AOJu0YwAikF2PgsTXX/9zGYdK7sbDxkDBYrqKYEzlIOq3YJsBx/KjOjb
	eFTmwExjGJSgbJt4pQlM86YLe7zTRWyQHw==
X-Google-Smtp-Source: AGHT+IE1O/Q18uyQ9bgM0s5oBgheZhm9Raon+NZw5D/zhrfsAJdZYSoWCcIqwTEWmKfgCMrEQYnWfw==
X-Received: by 2002:adf:f107:0:b0:336:ca90:3a1a with SMTP id r7-20020adff107000000b00336ca903a1amr195607wro.114.1704871558869;
        Tue, 09 Jan 2024 23:25:58 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id z16-20020a5d4d10000000b0033686e8f02dsm4125387wrt.45.2024.01.09.23.25.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jan 2024 23:25:58 -0800 (PST)
Message-ID: <e35ebe97-1349-4c37-afa5-54c131a9dcbb@linaro.org>
Date: Wed, 10 Jan 2024 07:25:56 +0000
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/12] dt-bindings: clock: google,gs101-clock: add
 PERIC0 clock management unit
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh@kernel.org>
Cc: peter.griffin@linaro.org, krzysztof.kozlowski+dt@linaro.org,
 mturquette@baylibre.com, sboyd@kernel.org, conor+dt@kernel.org,
 andi.shyti@kernel.org, alim.akhtar@samsung.com, gregkh@linuxfoundation.org,
 jirislaby@kernel.org, s.nawrocki@samsung.com, tomasz.figa@gmail.com,
 cw00.choi@samsung.com, arnd@arndb.de, semen.protsenko@linaro.org,
 andre.draszik@linaro.org, saravanak@google.com, willmcvicker@google.com,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-serial@vger.kernel.org, kernel-team@android.com
References: <20231228125805.661725-1-tudor.ambarus@linaro.org>
 <20231228125805.661725-2-tudor.ambarus@linaro.org>
 <20240109040315.GA2619804-robh@kernel.org>
 <f695f2c0-2d4e-484c-9faa-7d8b28362541@linaro.org>
 <8a55e1d9-c102-4cdf-8f23-edc40889cf6d@linaro.org>
 <ea02d7ca-62e2-4d46-8495-ed6e515625a1@linaro.org>
 <38523622-4963-44a5-a5d6-64896ae47e09@linaro.org>
 <ddd31326-8901-476f-949f-2d1291ba07a0@linaro.org>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <ddd31326-8901-476f-949f-2d1291ba07a0@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 1/9/24 18:38, Krzysztof Kozlowski wrote:
> On 09/01/2024 17:12, Tudor Ambarus wrote:
>>
>>
>> On 1/9/24 15:01, Krzysztof Kozlowski wrote:
>>> On 09/01/2024 12:58, Tudor Ambarus wrote:
>>>>
>>>>
>>>> On 1/9/24 11:09, Krzysztof Kozlowski wrote:
>>>>> On 09/01/2024 05:03, Rob Herring wrote:
>>>>>> On Thu, Dec 28, 2023 at 12:57:54PM +0000, Tudor Ambarus wrote:
>>>>>>> Add dt-schema documentation for the Connectivity Peripheral 0 (PERIC0)
>>>>>>> clock management unit.
>>>>>>>
>>>>>>> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
>>>>>>> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>>>>>>> ---
>>>>>>> v2:
>>>>>>> - fix comments as per Sam's suggestion and collect his R-b tag
>>>>>>> - Rob's suggestion of renaming the clock-names to just "bus" and "ip"
>>>>>>>   was not implemented as I felt it affects readability in the driver
>>>>>>>   and consistency with other exynos clock drivers. I will happily update
>>>>>>>   the names in the -rc phase if someone else has a stronger opinion than
>>>>>>>   mine. 
>>>>>>
>>>>>> I'll defer to Krzysztof.
>>>>>
>>>>> I miss the point why clock-names cannot be fixed now. This is the name
>>>>> of property, not the input clock name.
>>>>
>>>> They can be fixed now. I've just aired the fixes at:
>>>> https://lore.kernel.org/linux-arm-kernel/20240109114908.3623645-1-tudor.ambarus@linaro.org/
>>>>
>>>> Preparing v3 for this patch set to include the updated names here too.
>>>
>>> I think I was not that clear enough. I did not get your current patchset
>>> - so PERIC0 clock controller - cannot use new naming.
>>>
>>
>> Ok, I understand that the fixes from
>> https://lore.kernel.org/linux-arm-kernel/20240109114908.3623645-1-tudor.ambarus@linaro.org/
>>
>> are NACK-ed and I shall use the full clock-names in this patch set as
>> well, thus "dout_cmu_peric0_bus", and "dout_cmu_peric0_ip". I don't mind
>> changing them back, will send a v4 using the full clock names.
> 
> They are not rejected, it is just independent thing. At least looks like
> independent.

The datasheet is not so verbose, but as I understand, CMU_MISC and
CMU_PERIC0 are clock domains of the same clock controller, thus I think
they should be treated the same. We should either get rid of the name of
the block in the clock names or keep it, but be consistent across all
the clock domains.
> 
>> Out of curiosity, why can't we change the names? All gs101 patches are
>> for v6.8, thus they haven't made a release yet. We still have the -rc
>> phase where we can fix things.
> 
> We can change. I would not bother that much with doing that, because I
> sent already them to arm-soc. That means I need to consider this as
> fixes and I just did not want to deal with it.
> 
> The question is quite different for a new clock controller - peric0.
> What parts of driver readability is affected by using "bus" name?
> 

As Peter pointed out, if keeping the shorter names, one would have to
cross reference with the device tree in order to determine which clock
is used, its type, whether it's a gate or a divider. Whereas if we keep
the full name, one can see what's the clock about with a glance. The
full name coincides with the clock names that are defined in the clock
driver, thus one can grep for the full name from the device tree and hit
the clock definition from the clock driver.

The cons of keeping the full name is that keeping the name of the block
in the DT's clock name is just redundant. Rob was clear and said that
including the block name in the -names is a pattern we don't want.

In what concerns my personal preference, I like the full name. At the
same time, I see Rob's point, and if that turns out to be a rule, let's
respect it. So I'm fine with both, but let's be consistent across the
driver and have the same clock name scheme for all the clock domains,
otherwise it will just look weird.

Thanks,
ta

