Return-Path: <linux-i2c+bounces-1244-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9F9828CBE
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Jan 2024 19:39:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 927DEB24973
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Jan 2024 18:39:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C53C03C684;
	Tue,  9 Jan 2024 18:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k7C13vRk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03CCF3C46E
	for <linux-i2c@vger.kernel.org>; Tue,  9 Jan 2024 18:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a277339dcf4so359242166b.2
        for <linux-i2c@vger.kernel.org>; Tue, 09 Jan 2024 10:39:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704825540; x=1705430340; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xWMnZYLmBfzNCS7tCYTR50/IYbDDleSQcKnB4iWLl3w=;
        b=k7C13vRkDcY0puSH/eYizYMjl8sHLaipBJPAVdgFoxoyB2OMKO2FFJoIk+wOdQuO1E
         yfLf/WQaDRGIJSrxHEvjuMFns8ZcNbilakivKGcX5w017N/AGjruwOqlIJHzVBJUoOzC
         nptHLd6DjxMyFeAY/f4qeuqQEZahGclrMVf9z6z92Tc4Z4iAKOeccQuMYBTWFGrn4rtL
         Y740Gi/xUQ9eFbMvf9yIXNzIsTlU9naaW80BNNXrSqYSGP3YV2d/9zdKXC3SLkkHz4oe
         CM37c9fnG4MCjPX3xhvgUZosVVGnDPuMBhGL/CzQBi+VXhfAM2zEYeVURUPpmNoR8HYZ
         JP3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704825540; x=1705430340;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xWMnZYLmBfzNCS7tCYTR50/IYbDDleSQcKnB4iWLl3w=;
        b=wvKaeI3TxpiNOEBb3Ywji1V7za45z6h43a+8qHiFGt2UikfAt/avd0GX6M+jMkQ978
         S/G6ITj9ly8nRHkYtchPz5EX/thnq1D9R38vXx9YKCdSp9Y2Ooi/HRdYrVt/ivtvpMkI
         eUzXPfh2SeMVwrpv/+63VH9qUIo+CNbLFkuZmw9mDFIfJHwPkT9cT1YZnbKHRLCfzVkm
         D+d+duRGQyxsqKuT3ewG8F8f7EOiQdTmcESNGCXszMYm68FNOhpZJeywDg6QZOZT++n2
         Y08tgsMnOQ/vflFYXcqrT0bfuXFNf8xEk8f9bxbLfOsZzQUYIO+xEUpjYoEz1er3yabd
         rIuw==
X-Gm-Message-State: AOJu0Yyg4hZVImxfcHepiBi3ef/5KkCjiosZWbZsrSUUA6VKlvM5RTBg
	lfPKqR26llvj9A1yW6NxJ5yZWs9V38ykRQ==
X-Google-Smtp-Source: AGHT+IEIh4HS+duMVRV9ASXLLmyfVTxjsJsJDphoxw3Ee34vR9nfgfG5Ih8P/GMcWU6kmfQPtq3Xkg==
X-Received: by 2002:a17:907:b025:b0:a2b:2e02:583d with SMTP id fu37-20020a170907b02500b00a2b2e02583dmr646369ejc.113.1704825540196;
        Tue, 09 Jan 2024 10:39:00 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.112])
        by smtp.gmail.com with ESMTPSA id h21-20020a170906399500b00a26af2e4d58sm1310590eje.1.2024.01.09.10.38.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jan 2024 10:38:58 -0800 (PST)
Message-ID: <ddd31326-8901-476f-949f-2d1291ba07a0@linaro.org>
Date: Tue, 9 Jan 2024 19:38:56 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/12] dt-bindings: clock: google,gs101-clock: add
 PERIC0 clock management unit
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>
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
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <38523622-4963-44a5-a5d6-64896ae47e09@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/01/2024 17:12, Tudor Ambarus wrote:
> 
> 
> On 1/9/24 15:01, Krzysztof Kozlowski wrote:
>> On 09/01/2024 12:58, Tudor Ambarus wrote:
>>>
>>>
>>> On 1/9/24 11:09, Krzysztof Kozlowski wrote:
>>>> On 09/01/2024 05:03, Rob Herring wrote:
>>>>> On Thu, Dec 28, 2023 at 12:57:54PM +0000, Tudor Ambarus wrote:
>>>>>> Add dt-schema documentation for the Connectivity Peripheral 0 (PERIC0)
>>>>>> clock management unit.
>>>>>>
>>>>>> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
>>>>>> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>>>>>> ---
>>>>>> v2:
>>>>>> - fix comments as per Sam's suggestion and collect his R-b tag
>>>>>> - Rob's suggestion of renaming the clock-names to just "bus" and "ip"
>>>>>>   was not implemented as I felt it affects readability in the driver
>>>>>>   and consistency with other exynos clock drivers. I will happily update
>>>>>>   the names in the -rc phase if someone else has a stronger opinion than
>>>>>>   mine. 
>>>>>
>>>>> I'll defer to Krzysztof.
>>>>
>>>> I miss the point why clock-names cannot be fixed now. This is the name
>>>> of property, not the input clock name.
>>>
>>> They can be fixed now. I've just aired the fixes at:
>>> https://lore.kernel.org/linux-arm-kernel/20240109114908.3623645-1-tudor.ambarus@linaro.org/
>>>
>>> Preparing v3 for this patch set to include the updated names here too.
>>
>> I think I was not that clear enough. I did not get your current patchset
>> - so PERIC0 clock controller - cannot use new naming.
>>
> 
> Ok, I understand that the fixes from
> https://lore.kernel.org/linux-arm-kernel/20240109114908.3623645-1-tudor.ambarus@linaro.org/
> 
> are NACK-ed and I shall use the full clock-names in this patch set as
> well, thus "dout_cmu_peric0_bus", and "dout_cmu_peric0_ip". I don't mind
> changing them back, will send a v4 using the full clock names.

They are not rejected, it is just independent thing. At least looks like
independent.

> Out of curiosity, why can't we change the names? All gs101 patches are
> for v6.8, thus they haven't made a release yet. We still have the -rc
> phase where we can fix things.

We can change. I would not bother that much with doing that, because I
sent already them to arm-soc. That means I need to consider this as
fixes and I just did not want to deal with it.

The question is quite different for a new clock controller - peric0.
What parts of driver readability is affected by using "bus" name?

Best regards,
Krzysztof


