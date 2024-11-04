Return-Path: <linux-i2c+bounces-7762-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 807019BB892
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Nov 2024 16:08:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A3E291C228B5
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Nov 2024 15:08:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F83B1BBBFC;
	Mon,  4 Nov 2024 15:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WBlbkZno"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F8B82B9A2;
	Mon,  4 Nov 2024 15:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730732891; cv=none; b=YathMAfJ+HAEr4Zn9U0sEs8qyhJdp9mPEV5U0yNKIJBAe8tgaL0uYDYYOSJGp5jlyyhhJO5T2T8GZF717l9UWX11Cda71vQyeB1CrhemA0RnEbXKPojTs1GREl15yv9ssobWThYV3lSgBiYO7jBN5mj2fxu9lfX1FCwMtqt2BSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730732891; c=relaxed/simple;
	bh=IsoBeoOuXvcoft0v4lHIDZ8sMTlBJsV7lMY+XpcmlMQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jte/2WosBEQRDglYNgJ64syM97RTp6z6H4OC6KM7iEc1ozhhlIGHGdqpUP9HE9OifzeWDEJGUsJFHIErnGR1fflonB7ojL0Lvvvk6QchA4IK76hAkQ2OQzPIRL+zT6iTqyekunPHd8lP8faIlE3Ms9Sj/PEpVP8+8cBCAIWh+RY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WBlbkZno; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-21116b187c4so28593155ad.3;
        Mon, 04 Nov 2024 07:08:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730732889; x=1731337689; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=DBB6jNpH4DxwaaTTUakWm0IRWPaKflm6p9RFhXcCmW0=;
        b=WBlbkZnoVKp6iDPdrhg5FfAdWXo08J6ktItzytK7C6qR4PIe+feXU62XM0H91PybX9
         9LaUiR2LCONoXuT/t3YsIhDeMjy9pR67RcI7BxQ55HAr/Lp2iL7A+8K4MzDoSNhmmWmq
         xS2D6yAFQBztBHYiXONTtBglPx1KzyBI+NsARWLLycie/QVzSXl/R8z/MLC0JyL0Z6Bh
         fMga8Shs+brvxO1MY1t3hha7WRCrGXGCFmAsHmakQk8H87IIXec+9+jAimjTk8aGp9CA
         8p1GnE6cM8ee4upg22vD/GxcBG/Lc5ykTRlJEYx3RVcfsCKAFDH3o19XEvRWQebTwVOo
         Nz4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730732889; x=1731337689;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DBB6jNpH4DxwaaTTUakWm0IRWPaKflm6p9RFhXcCmW0=;
        b=DHC49YY3uy5FnW9+ztZF2P6uILegB3wN7C+oWBEioI1L+4RpFP4e/x6tZ1XyV0/DYn
         oPqQuz5eb73xzuSLhzZXxnXXP0YyawMJ6g8qKo4BL7zpVOHo2N5/gYWkz31jIEl2vSuK
         g3Z2Rw4BpdRu3K/8OCugt75ckpbCkCMsoUMWDhgMMCrctWNqwzJ952vqrZSBQj0T2Pe8
         HnpZs5tHbCgc7qzu0vTVuaIOz1ipC/dDdEw1pUJiYrju9LfYX+2AgVxt6kai3hEWJ8HX
         aVOCBwvQqKa3b464UtNf/quyjgtLqLiLhx9d4SVBdQgCMaJnvcIuIOzWDQcxOoeEu/0a
         wJKw==
X-Forwarded-Encrypted: i=1; AJvYcCUGBRYdaZrgCdKtA3O1YNFXY7xNpBfEcOq8bE+5Oa8+zwnwjWrLKuWl0Vcg63vNX5IBM39q/KedRrrt6JsG@vger.kernel.org, AJvYcCWFro5CnVt8NdzkAskj+Tns+quUjiyeFrMc6hnYfnJldEThsBT4T8i6/OY/a85XK0BMKEthYRSW5Qpw@vger.kernel.org, AJvYcCWGIUtjefeVBIT64gWOtbC1tH8hbJX3M7En1Itt2KUdZW/6YlfZbKq7ptl0VU7wcSBpFGw0980JoGS8@vger.kernel.org, AJvYcCWfmptIG6Jm7vrAjkCde6qEcdTnq7i8X2VNsjlIrgwQ1ldHAI7duYEPdh0ZxLfB1mybqExbAK2PcuZa@vger.kernel.org, AJvYcCXKJBaoBaHsCArsExncFBGw9jHEUlCgoMr/0v16QntopvOh1CPu9Y4YVd1UqbdlORk2AyLlYJlFV9w6AmE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2dBgeV16AgzLW4FrxmGnxCEQJNGlEJaTeKc/s8ZmjlbBzdw/s
	AibNJ/tJKSlAanCF2YEILMsZynTZYN5RaMnTiLCEVPBmaSe/ZVjC
X-Google-Smtp-Source: AGHT+IG+OuQXOInv0hxhYMn5CM696EiVv8dRR1LoB+4lm8OEQdDhYosPpUxZEDavQa4HFPHpOSZbEA==
X-Received: by 2002:a17:903:22c8:b0:20c:b090:c87 with SMTP id d9443c01a7336-2111af6b706mr183688035ad.29.1730732888510;
        Mon, 04 Nov 2024 07:08:08 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211057087dasm62416555ad.85.2024.11.04.07.08.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2024 07:08:07 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <8af73d65-cc16-4219-892d-d49f0d5581e7@roeck-us.net>
Date: Mon, 4 Nov 2024 07:08:05 -0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] hwmon: (pmbus/core) add wp module param
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
 Patrick Rudolph <patrick.rudolph@9elements.com>,
 Naresh Solanki <naresh.solanki@9elements.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20241024-tps25990-v3-0-b6a6e9d4b506@baylibre.com>
 <20241024-tps25990-v3-3-b6a6e9d4b506@baylibre.com>
 <47164712-876e-4bb8-a4fa-4b3d91f2554b@roeck-us.net>
 <1jjzdj5qyy.fsf@starbuckisacylon.baylibre.com>
 <fa79de78-aed9-4cd3-bff9-310f2b4a32c9@roeck-us.net>
 <1jfro783na.fsf@starbuckisacylon.baylibre.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <1jfro783na.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/4/24 06:39, Jerome Brunet wrote:
> On Mon 04 Nov 2024 at 06:18, Guenter Roeck <linux@roeck-us.net> wrote:
> 
>> On 11/4/24 00:43, Jerome Brunet wrote:
>>
>>>>> +/*
>>>>> + * PMBus write protect forced mode:
>>>>> + * PMBus may come up with a variety of write protection configuration.
>>>>> + * 'pmbus_wp' may be used if a particular write protection is necessary.
>>>>> + * The ability to actually alter the protection may also depend on the chip
>>>>> + * so the actual runtime write protection configuration may differ from
>>>>> + * the requested one. pmbus_core currently support the following value:
>>>>> + * - 0: write protection removed
>>>>> + * - 1: write protection fully enabled, including OPERATION and VOUT_COMMAND
>>>>> + *      registers. Chips essentially become read-only with this.
>>>>
>>>> Would it be desirable to also suppport the ability to set the output voltage
>>>> but not limits (PB_WP_VOUT) ?
>>> I was starting simple, it is doable sure.
>>> It is not something I will be able to test on actual since does not
>>> support that.
>>> Do you want me to add "2: write protection enable execpt for
>>> VOUT_COMMAND." ?
>>>
>>
>> Please add it. I have a number of PMBus test boards and will be able to test it.
>>
>> Thee are three options, though. Per specification:
> 
> Any preference for the value mapped to each mode ? Using the one from
> the spec does not seem practical (32768, 16384, 8192).
> 
> The bit number, maybe (7, 6, 5) ?
> 
> or just by order strongest locking ?
> 
>>
>> 1000 0000 Disable all writes except to the WRITE_PROTECT command
> 
> 3
> 
>> 0100 0000 Disable all writes except to the WRITE_PROTECT, OPERATION and
>>            PAGE commands
> 
> 2
> 
>> 0010 0000 Disable all writes except to the WRITE_PROTECT, OPERATION,
>>            PAGE, ON_OFF_CONFIG and VOUT_COMMAND commands
> 
> 1 ?
> 

Bit number does not make sense since those are just commands which happen
to use individual bits. Also, module parameters should as much as possible
be abstract and not reflect HW 1:1. Strongest locking as you suggested as
second option makes more sense, since 0 means "no locking".

Thanks,
Guenter


