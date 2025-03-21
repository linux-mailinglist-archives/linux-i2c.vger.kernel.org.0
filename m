Return-Path: <linux-i2c+bounces-9973-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECC9A6C0F6
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Mar 2025 18:11:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 285D01B60180
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Mar 2025 17:10:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 596E722D7A2;
	Fri, 21 Mar 2025 17:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lZXwNoL6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59510229B26;
	Fri, 21 Mar 2025 17:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742577004; cv=none; b=OxlFEDSYxUSd4V5dTlinKdr3cJ1I0zpkIPx6Ksu5ppVQAyzZDaFkqotFvZtrx5Kspap65b+gsTDLGiLgaJdCawP7aCRVKbvyweqr+hqJVRjxICScaNQMosmPS3fFIRvG3FRcS5NgTTAEol2Avb22f290RDVgzfZNnC7jvKvgDzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742577004; c=relaxed/simple;
	bh=Jf9O7KjMNA7NxwmRd31l+c7sfUh3Eaqc9SV8oiR4vQw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oUKziZW3TrYz3fKULWQTqZMvuxFcThJb/U7lGXUXarFVWD85YQmAnypHC2Es3I9/oiO7WYtRP2PoCmv/xT565tHVJekXdd5a/WdbW7bnBVbbdYbU7ZhgES9ntUA8FYTlkZwc9q7Gd7K+F2ka8iz9mL0+6Efyr5zZFJqRMVywTGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lZXwNoL6; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2260c915749so32383875ad.3;
        Fri, 21 Mar 2025 10:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742577001; x=1743181801; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=uztsJ7JzvIY981dArFAH0tUKF80EDOKJKLoCf65usL8=;
        b=lZXwNoL65BjTcm6hc2GdLqorjndqIDKzzaYLHmlWmjmhVscRGC95MGHZ6xmLm2Ju4R
         4AFzkFoAk66Xyg0o/K/dmQfIzervYu2o+G82LqvkI9Nw3x1nRX77TiRsjETGXiFSrvIU
         vB+tNte/8V9D1RVGIP7eGGw/KfxQ3v0BXiZVS2UImiBaRSn6QY8XbTNS6kfL4v/pZMd+
         qDj3PQpvXysvoMfe8vTe1vTkCgtq7N4oOnakZuDyefXZguPI4+QxxF9+tVtK8XtEAWkW
         JvIGgyaJUtKh4vFwxBXJATpaL4KslAECg43p5DjIQUhvtxJlc+Vo/qgj7/C4uB3TBne9
         h7jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742577001; x=1743181801;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uztsJ7JzvIY981dArFAH0tUKF80EDOKJKLoCf65usL8=;
        b=ee7aOAkms3Nc7m2To+k2qWeGCh9C5jxJoKbJ3zt6bXIqEU/MEPD/uKag22JOdQjmnH
         0ygULqFO9iAkhIYxWkMAY8x2442BoFzRRkxv82qRCz3t5gmEbGQjrENC1PBZQIF+KS0i
         ybFkILQATgrYHFOv3RLkK27NX2DLmFJOTLzdwGLQybK2vuzTgeM7rJquGfYwTltT2BOL
         xjgGLaWOCNZjSJAwIk7yzfjsmNnTsdxga9aRyprEuPbq5UJtzaxviaAcferIce0myV7S
         l19aMVpsCF2G9EC39AEF4wGZ99c9myRTcCazKV6pngOx8MalL4g+AkdCmNkclhPi0fKy
         bjTQ==
X-Forwarded-Encrypted: i=1; AJvYcCU07vQ1HYTILz3qU0Wkt+Ty+N5ItBaSNtThrBwocKIEFH1+DOqMqcA/j2PAcXU2TJKH8q7u8iPTvjzFx7M=@vger.kernel.org, AJvYcCWM9VD9+AS6FB0fyo24EzU/bYWn/MMY9MF3AyC8DTGWJdypbJJ6i6dkekUpnACl4J9xM2nM6kuGnfo9@vger.kernel.org, AJvYcCWbdaPKTkt9jbrNmrNJ07hl6xf/r+JQijwpAaJUqHZN11i16nMBf2fY9KOG9sU4OSpiZqeVd45Y3JRXFsAZ@vger.kernel.org, AJvYcCXf6iQjVLvwgcZNHXnrvmn3MhYkOWq+XbSCLMqtDUMW/CnJeCAGB4OmydpWqqacqOvbZ2+Uzma+Sck5@vger.kernel.org, AJvYcCXpoQi/n3Hij5KDOFG0PKmbNf+KRBn2c8IVmhMMXhWmH0+hJ5lIstqlG+pmkCHpmV0LO7Nn7Z8Ignkn@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9t1e167A55df+4DpEsc2wKK2Lk+0ImRsNGM9RABaSc1KaYaZs
	6IlTtZHOAzfKyvM1t7eGB5sNf3RpwUFAE03WtuDZIm9ul2Tlsl1/
X-Gm-Gg: ASbGnctyUZIeZLPZmgzTxQsrWrjqUSHYQqhfqOyKHWDYScdz+Ts8QChBjztWHRkNhkq
	r5DyMoG5KZ8U4abWPPej38WsfVQymJEdWKEw8+7zzuKYpen4nqzbBE4L6TW1bnpeksMd772W6e4
	coPrCSAC/fcPoRqjNPvuXfTW2uX2/vNwRMDH12lyQZ4rhR+jdZMu2HkpSs2c4jtUmy9IsLMCyE6
	hPR9SyIIq8NssKQfIKooWvQ134xTTwjQTL8oGofhaLbgyB1rNoW7eQ6ylDSECNtaoPz8W/S35yj
	1a69OP1k72Qh7sInQAf6V2OaS05Cortj4SaiEGqVBaSiea8hKqzrBXMJEEUf9PPGGSpWRv37+81
	DdsPVerORKV8f+owWyw==
X-Google-Smtp-Source: AGHT+IHtcpZdirGnF20GsQ/Lw15UUPPEPMY1zNwB4lkIWMtRuLnEhyFubklIvJ0hyQuY5L2tiR7fGQ==
X-Received: by 2002:a17:902:dacd:b0:220:d257:cdbd with SMTP id d9443c01a7336-22780e2a4c4mr69685285ad.48.1742577001190;
        Fri, 21 Mar 2025 10:10:01 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-227811d968asm19491495ad.162.2025.03.21.10.09.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Mar 2025 10:10:00 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <ab329813-2903-4bd1-8734-ab36466650c2@roeck-us.net>
Date: Fri, 21 Mar 2025 10:09:59 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: pmbus: add lt3074
To: "Encarnacion, Cedric justine" <Cedricjustine.Encarnacion@analog.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <20250225-upstream-lt3074-v2-0-18ad10ba542e@analog.com>
 <20250225-upstream-lt3074-v2-1-18ad10ba542e@analog.com>
 <20250226-gentle-spicy-jacamar-2dd36a@krzk-bin>
 <20250226145931.GA2314060-robh@kernel.org>
 <3f7b031d-7b83-4a00-996d-aabb26278b67@roeck-us.net>
 <20250227-sceptical-phenomenal-wolverine-56e3cf@krzk-bin>
 <dbd9cc84-a0b6-4323-b343-6e80aaaf2d14@roeck-us.net>
 <PH0PR03MB69385BEFFD04ECF850311E988EDE2@PH0PR03MB6938.namprd03.prod.outlook.com>
 <15ce883f-444c-4b27-a48d-b17e3df5895d@roeck-us.net>
 <PH0PR03MB693831397416C4247F8BA58D8ED92@PH0PR03MB6938.namprd03.prod.outlook.com>
 <PH0PR03MB6938087B8F2EDB9899DD0F1D8EDB2@PH0PR03MB6938.namprd03.prod.outlook.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <PH0PR03MB6938087B8F2EDB9899DD0F1D8EDB2@PH0PR03MB6938.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/21/25 09:53, Encarnacion, Cedric justine wrote:
>> -----Original Message-----
>> From: Encarnacion, Cedric justine
>> Sent: Wednesday, March 19, 2025 12:10 PM
>> To: Guenter Roeck <linux@roeck-us.net>; Krzysztof Kozlowski <krzk@kernel.org>
>> Cc: Rob Herring <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>;
>> Conor Dooley <conor+dt@kernel.org>; Jean Delvare <jdelvare@suse.com>;
>> Jonathan Corbet <corbet@lwn.net>; Delphine CC Chiu
>> <Delphine_CC_Chiu@wiwynn.com>; devicetree@vger.kernel.org; linux-
>> kernel@vger.kernel.org; linux-hwmon@vger.kernel.org; linux-
>> doc@vger.kernel.org; linux-i2c@vger.kernel.org
>> Subject: RE: [PATCH v2 1/2] dt-bindings: hwmon: pmbus: add lt3074
>>
>>> -----Original Message-----
>>> From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
>>> Sent: Tuesday, March 18, 2025 11:17 PM
>>> To: Encarnacion, Cedric justine
>>> <Cedricjustine.Encarnacion@analog.com>;
>>> Krzysztof Kozlowski <krzk@kernel.org>
>>> Cc: Rob Herring <robh@kernel.org>; Krzysztof Kozlowski
>>> <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Jean Delvare
>>> <jdelvare@suse.com>; Jonathan Corbet <corbet@lwn.net>; Delphine CC
>>> Chiu <Delphine_CC_Chiu@wiwynn.com>; devicetree@vger.kernel.org; linux-
>>> kernel@vger.kernel.org; linux-hwmon@vger.kernel.org; linux-
>>> doc@vger.kernel.org; linux-i2c@vger.kernel.org
>>> Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: pmbus: add lt3074
>>>
>>> [External]
>>>
>>> On 3/18/25 03:03, Encarnacion, Cedric justine wrote:
>>>>> -----Original Message-----
>>>>> From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
>>>>> Sent: Friday, February 28, 2025 12:33 AM
>>>>> To: Krzysztof Kozlowski <krzk@kernel.org>
>>>>> Cc: Rob Herring <robh@kernel.org>; Encarnacion, Cedric justine
>>>>> <Cedricjustine.Encarnacion@analog.com>; Krzysztof Kozlowski
>>>>> <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Jean
>>>>> Delvare <jdelvare@suse.com>; Jonathan Corbet <corbet@lwn.net>;
>>>>> Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>;
>>>>> devicetree@vger.kernel.org; linux- kernel@vger.kernel.org;
>>>>> linux-hwmon@vger.kernel.org; linux- doc@vger.kernel.org;
>>>>> linux-i2c@vger.kernel.org
>>>>> Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: pmbus: add lt3074
>>>>>
>>>>> diff --git a/drivers/hwmon/pmbus/pmbus.h
>>>>> b/drivers/hwmon/pmbus/pmbus.h index ddb19c9726d6..289767e5d599
>>>>> 100644
>>>>> --- a/drivers/hwmon/pmbus/pmbus.h
>>>>> +++ b/drivers/hwmon/pmbus/pmbus.h
>>>>> @@ -512,7 +512,6 @@ int pmbus_regulator_init_cb(struct
>>>>> regulator_dev
>>> *rdev,
>>>>>    	{							\
>>>>>    		.name = (_name),				\
>>>>>    		.of_match = of_match_ptr(_name),		\
>>>>> -		.regulators_node = of_match_ptr("regulators"),	\
>>>>>    		.ops = &pmbus_regulator_ops,			\
>>>>>    		.type = REGULATOR_VOLTAGE,			\
>>>>>    		.owner = THIS_MODULE,				\
>>>>>
>>>>> Maybe someone can check if that works.
>>>>>
>>>>> Thanks,
>>>>> Guenter
>>>>
>>>> I'd like to follow up on this one. As of this writing, my
>>>> understanding is that the dt-binding should not expect regulators
>>>> subnodes for simple devices like this. There is already a similar
>>>> binding as mentioned in this thread particularly
>>>> "dt-bindings/regulator/infineon,ir38060". I think a binding without
>>>> the subnodes should still work with or without the change above.
>>>
>>> Interesting. I am not sure if it really works, though. I looked into
>>> the regulator code, and I don't immediately see the code path it would
>>> take.
>>>
>>>> With this, I'd like to know what the specific next steps are to
>>>> continue this patch series.
>>>
>>> Can you try on hardware using a devicetree file which doesn't have the
>>> regulators node ? If the current code works, just submit an updated
>>> (simplified) .yaml file and we should be good. If not, I have an
>>> untested patch series introducing another macro which doesn't set the
>>> regulators node.
>>
>> Okay. I'll test this and get back to you.
> 
> The "simplified" dt file (without the regulators node) does not work with
> the current regulator_desc macro. I have also tried simply removing the
> regulators_node setting from the regulator_desc macro, and it does not
> work too. of_match looks for a certain regulator name in dt, and it seems
> like it must handle NULL cases as well as suggested previously. I would
> appreciate if this would be also verified on other ends. For now, I think I'll
> wait for another macro to be introduced in pmbus to support this kind of
> bindings.
> 

Figured. As it turns out, there is also a patch series pending which tries
to fix the problem for ir38060 by changing its bindings.

I'll dig up my patch series to add a new macro and send it out as RFT.

Thanks,
Guenter


