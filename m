Return-Path: <linux-i2c+bounces-4318-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D38915788
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jun 2024 22:05:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 41DF92823CF
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jun 2024 20:05:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C36EA19FA95;
	Mon, 24 Jun 2024 20:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fv8xUNAp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E806E19D08F;
	Mon, 24 Jun 2024 20:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719259528; cv=none; b=aJ6B8cy9HTsF8yIE+MSfN2mN3j10vMQFdo7neytNM8sy7hl9s49YP83ksWjVq1+xpMUZsLWgTtTgN7zrNfhNk+VJWfQQZF0OGdSeZ68Fi0IsEgIq8n7VWwIe5k/HJiUgWF+lYoiIhifsNMyo6wa4xmtOJfKH+No/jMig3/hECu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719259528; c=relaxed/simple;
	bh=MyuLxVa9djGmJjwYX9q2rqv9NPBaa87X9GdSAeU8RdQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=nxI0hfjZCBMqkAMdrN68AwzV+HKBP3U6l+6RFp8BLhfmfCBBMwVkaJp8Y2Ul4GjT9OcgC95YdGyEKFZlpWt1vSosVIn0TVHznB8sp4ABFvEJZ4dwXNkM3qjv4olBzZ77so90ED+SvJ0pbVApaB1vNhcifQb5uYsFT6gQoYdaY0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fv8xUNAp; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a7241b2fe79so242654066b.1;
        Mon, 24 Jun 2024 13:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719259525; x=1719864325; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZSb7Ej4Ntq/nF2qlOXQSXh23B09xXPUbc9p3HR70r/g=;
        b=Fv8xUNApPXw4WYwvkq3pVoDmN0J17KRxTFpMODzavzHT6QwkgoPAjMZmDx2G2wJG2v
         m4AjTz/BDbqSgi8q0kEPgnrrcmiynyvk/9mV4OLcknQhmG/7VcdeELn7Ni2GMO7wMe8/
         eKBjS/57Y11XTj/QBysOMWdz9YGB4cS2rl10tjKUp8IrYf44wzMoCi1/uMn4SB7uwLqb
         DkwclW1xN14591/KBfiUtYkb16zuoOGdSZbY6Iavdu+nlVEOUMBf1LGoo1M/TqPp6lVp
         i6LFGt3Ey3jsBNudnthZifw7uw31W3xAcaqM9gAlgstyHbKbizcE+LSmJHqGmc3b2a/b
         JG8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719259525; x=1719864325;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZSb7Ej4Ntq/nF2qlOXQSXh23B09xXPUbc9p3HR70r/g=;
        b=jjKci6FUPhpsD3yP/eVUT29T5u/1SJm4xIQYgFWfgCTuS/jQb/FsFMGQagJ/4e5ipv
         ewY9e2eYXEyQAz5wp+7K9fg9zaSxZrX6aSrHwVDslBBCkxui4jFJ1VI7K2DKvk7TbiDL
         6oXceLBXMvnO5z+v6UKuRR4kZ8mwBBLOBoNZHfaCOCDHAawGGEtWYe4x8lygEIvVC8uY
         u1lwFRLZTTbwboTveAMHPX/rw150npbgHGv5C0nXqvqJPae3ihoXpd8LLXvMLFDfKTbg
         6JuiuqW/+mDahzZm/FOoJxDXia/kF5Qzu3ZRv4m9Brhf1Y+pzJPW4XtJHisez73cMdDG
         MHtQ==
X-Forwarded-Encrypted: i=1; AJvYcCVq/Co5Ko7VjRCt7bui8iaLD/PZ3+ZGx+6JpafuSJzXj/7laq+pkzYLDQjzvqCaxrmztCzq2B8kvHPmqEkUEM/SmY5zPHC418DWpEtSsfmYin1BH1kSX3fjFK2MLxgmI4loMO4CmK4fHWqUTDRXjZ/nAwFGNfoTQ56KrWbX8UlwAg3VHkHHGhsu/zhjscc3HhymtoscDk2cTV6DuxoQQ6H+
X-Gm-Message-State: AOJu0YxVeVYZvrE9FYxz/s37cT1I3u78F8mcRQ2A+ddmCVeoI9HiM4RL
	66YqFO9Em+APumOOHTai4dAbUhMZEJcoF0UjLpUexPlq/DWw71GO
X-Google-Smtp-Source: AGHT+IEJRX6HByuxz940DKiakW8YDHAVFH4n++RFvUajH74pVeumXtNekgcQOaQlowfS4l15IQeGtw==
X-Received: by 2002:a17:907:c98a:b0:a6f:d082:a2c1 with SMTP id a640c23a62f3a-a7242d2ab88mr360503066b.71.1719259524873;
        Mon, 24 Jun 2024 13:05:24 -0700 (PDT)
Received: from ?IPV6:2a01:c23:c07d:2d00:ad78:a407:846a:969b? (dynamic-2a01-0c23-c07d-2d00-ad78-a407-846a-969b.c23.pool.telefonica.de. [2a01:c23:c07d:2d00:ad78:a407:846a:969b])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a7248825d4bsm217402866b.207.2024.06.24.13.05.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jun 2024 13:05:24 -0700 (PDT)
Message-ID: <9183dfda-d3f3-4fa1-9a4b-c6edeb30482d@gmail.com>
Date: Mon, 24 Jun 2024 22:06:16 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/6] i2c: smbus: Support DDR5 SPD EEPROMs
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Guenter Roeck <linux@roeck-us.net>, Armin Wolf <W_Armin@gmx.de>,
 linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, =?UTF-8?Q?Ren=C3=A9_Rebe?=
 <rene@exactcode.de>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?=
 <linux@weissschuh.net>, Stephen Horvath <s.horvath@outlook.com.au>
References: <20240604040237.1064024-1-linux@roeck-us.net>
 <20240604040237.1064024-6-linux@roeck-us.net>
 <c939b0c7-2c8c-4cf1-8d5c-9309ce0b371a@gmx.de>
 <txliuvufu6muqucno2uex2q6xvnveozpjzahx7zryqlvvvzrs7@flv2zztine6r>
 <a7e38754-ff1a-4e15-99b2-4785827efc83@roeck-us.net>
 <ib6p4ivqdn56l3jzzarsoeijjhwak33bmqvj2qiddbhxdqzchk@txl4gdslx4gq>
 <79f406ae-cfc9-48bb-9c80-20f998c40b69@roeck-us.net>
 <veggn7y6qeeqx2dsmjykktudpwifnt5xzxcx5ulfglkgtq574p@f5dzhj4otjgl>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <veggn7y6qeeqx2dsmjykktudpwifnt5xzxcx5ulfglkgtq574p@f5dzhj4otjgl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.06.2024 18:19, Wolfram Sang wrote:
> 
> CCing Heiner...
> 
>>>>> Yes, maybe this could be simplified to "(LP)DDR memory types"
>>>>>
>>>>
>>>> I rephrased it to "Only works for (LP)DDR memory types up to DDR5".
>>>
>>> Thanks!
>>>
>>>> How about "Only works on systems with 1 to 8 memory slots" ?
>>>
>>> This is a question for Heiner. I'd think it is is still correct, but I
>>> don't know exactly.
>>>
>>
>> My interpretation was that it should work if the DIMMs are connected to
>> multiplexed I2C busses, but probably not if they are connected to
>> different adapters. The error message in that case is a bit misleading,
>> though, because it claims that "More than 8 memory slots on a single bus",
>> which isn't necessarily the case. For example, it should be perfectly valid
>> to have up to 24 DIMMs in this system.
>>
>> i2c-0/name:SMBus PIIX4 adapter port 0 at 0b00
>> i2c-1/name:SMBus PIIX4 adapter port 2 at 0b00
>> i2c-2/name:SMBus PIIX4 adapter port 1 at 0b20
>>
>> ... but I guess that is a question for someone with such a system to answer.
>>
>> Ultimately the handling of systems with more than 8 memory slots will need
>> to be updated at some point. On my systems, with 'i2c: piix4: Register SPDs'
>> applied, I see
>>
>> i2c i2c-0: 4/4 memory slots populated (from DMI)
>>     [my system is running 6.6.y which still generates that message]
>> i2c i2c-0: Successfully instantiated SPD at 0x50
>> i2c i2c-0: Successfully instantiated SPD at 0x51
>> i2c i2c-0: Successfully instantiated SPD at 0x52
>> i2c i2c-0: Successfully instantiated SPD at 0x53
>> i2c i2c-1: 4/4 memory slots populated (from DMI)
>> i2c i2c-2: 4/4 memory slots populated (from DMI)
>>
>> meaning the function is called for each adapter (which makes sense).
>> However, the code counting the DIMMs doesn't really take the adapter
>> into account, meaning adapters 1 and 2 are still probed even though
>> all DIMMs were already instantiated from adapter 0.
>>
>> On a system with more than 8 DIMMs connected to different piix4 adapters
>> (without mux) we'd probably see something like
>>
>> i2c i2c-0: More than 8 memory slots on a single bus, contact i801 maintainer ...
>> i2c i2c-1: More than 8 memory slots on a single bus, contact i801 maintainer ...
>> i2c i2c-2: More than 8 memory slots on a single bus, contact i801 maintainer ...
>>
>> which wouldn't be very helpful. I think the main problem may be that
>> the i801 driver implements sub-adapters as muxes, but the piix4 driver
>> doesn't do (or need) that. The message is also i801 centric which doesn't
>> apply anymore after 'i2c: piix4: Register SPDs' is applied.
>>
>> However, I would not want to even try changing that code without access
>> to a system using piix4 and supporting more than 8 memory slots.
>>
>> Thanks,
>> Guenter
>>
>>

It seems Intel systems never have more than one i801 SMBUS adapter,
therefore systems with more than 8 memory slots have to use muxing.
The current code was developed for the Intel use case, and therefore
doesn't consider that a system may have dedicated SMBUS controllers
per 8 memory slots. So support for this scenario has to be added.


