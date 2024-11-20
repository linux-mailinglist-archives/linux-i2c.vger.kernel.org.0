Return-Path: <linux-i2c+bounces-8090-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E8C9D3E6C
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Nov 2024 16:03:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6D97B1F2455D
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Nov 2024 15:03:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5B531C1F0A;
	Wed, 20 Nov 2024 14:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZBRL9r9X"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F201BDA84;
	Wed, 20 Nov 2024 14:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732114443; cv=none; b=dca5kFboJfFV/FpSDSFkOJ3eoscQUZ/iGcazdle33dNvncpHNtHd2KrcjGuupFpLG7Lt9IMZ02+ao1Hl/v2bNtEztXeprYZGMU47tn6dN4At/Atic2jUgJat1CvrX3YSJr0r0XgMSJmahqymKxiLs4NZRPRuVBqxD7+KzlvrWF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732114443; c=relaxed/simple;
	bh=w/qHOXWGR2K5CW5roNgYOh4+z3UBJ/xM5PUliSS86aQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mw2WfaTanAc1WkW4QqALPHHIgbEta3tFPUgw2/TB9LiI20yWBI1XR5wlUopkwVB+sXVqQUY2UzJNL0dXkAm3PBuyfRalu3fX44aevngb6Iu1lhfYSvJwWl/TjkEy2DopEmqyTB7XDbFEmd6aqt0v+gUsKxsnELQ9vsIHZRVfSok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZBRL9r9X; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-21271dc4084so6335365ad.2;
        Wed, 20 Nov 2024 06:54:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732114441; x=1732719241; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=4HOLlXKlpo9etvsYTVy5j+/b27rCxEh6rId0n16/9CI=;
        b=ZBRL9r9XHk1X2hOWYTj1DLNfpZnCss8KsWFCk+Uuo74HEYFE73KdAfh2ymizHWFeKI
         0mZKzj1LXxosS198lxp7UByR79e9jibbJmBFxi0TEDuOfl3LaQXxMXHM9hvwRp0COeA9
         rP07PGCWCKI8h7Ru+fTsZZd9huBFcUXdmuVE2vZWxu81bp7e9aNmcFWQKCl3/TwUfByA
         RPBI0Uh+JBxh0nU8t/hqQ7F9HCUVGFuoHUWx3yLRnAheIGNe9k/dHjStzk8hI8Iyog6c
         tVsX+o2X+wJYtoZo8LOrrO/w09XRtk9bPPYieczjYHQq0ZRW8JJyMRkgPn6LRh3r9dYg
         EqQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732114441; x=1732719241;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4HOLlXKlpo9etvsYTVy5j+/b27rCxEh6rId0n16/9CI=;
        b=MvGBDvuBomH+OR7k5d3tOi4Ur44Nu7OrHNJZ+OszZZEJ+XHGPYrRjUxGEfoBClAHmG
         t79LB33EpbIWn+gFkM3Aq8XHucU//fo5v3GOlpJSopay0pawkV17Z5iMNZgFYxYDdgWV
         OL2zoL00SQkuYcWBdwM6MdXK6B7VaM1RuVwf36mFZ5EiXu4zQdqM1TnkjWy3RV2sCCYq
         qRCw/kaCLLam5IDl5zcjtiRqWipPYc9ExTwHNAup92nxB5YYjZq8FpI18/4xRsnfy6LM
         109NK52YVly4EHew5rdeE0UeB5bkKYnHkreKUunmjN5Hfie3/VeUlGswDrnIbe8Qy+DR
         X3UQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhlrfzqeHzLXZuEfqOKqc0IwiBr4Id3r7b0igtmjEtlaSsLJ2gaTgupaekQkWZ+u2HWWMIpVZ9hrlFWqi3@vger.kernel.org, AJvYcCWo9EJmrcDAkmYVAIuRJhj6rZqFQTofQx0/jogw9fRhukyde61dvAnDLohPyL9V493coaBrQTHtkIU=@vger.kernel.org, AJvYcCXTazctrTOQxAHGZn1blnyFzArlvh1SoEY28Wx0VGVukLyGOSTLUrWLgYA+4/yZNWE46Oxce+Fhc4Kl@vger.kernel.org, AJvYcCXWYZPHG1cZRFsgz8j++kQYCPYRNPbuOWxJOGJGWXHgZLlQzslrtuj4DK8uTNtdqB3EXexU746igbqU3Fw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwM9TNlQEvuYjISsMErIMQNuUFBHF7LTtX6WlTE0ldtywXbK5OY
	cz6qfjoaUoJoQPREHcz5rcXdKpOI7wCRmc035k6gvYe4lYiT6pJUYDWxuw==
X-Google-Smtp-Source: AGHT+IHHp9YR2PhXujmQ76MKwqjnaa2KpsLMbdRvFrp29j6GuCt0xPzB8n87MCQy+VAomjc5MEWhjw==
X-Received: by 2002:a17:903:2312:b0:20c:ee32:7597 with SMTP id d9443c01a7336-2126ca4ea95mr32956435ad.8.1732114441133;
        Wed, 20 Nov 2024 06:54:01 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2125bec05acsm27038395ad.32.2024.11.20.06.53.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Nov 2024 06:54:00 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <4cfb8bd8-4ce7-4474-b7c0-0fd2693ce34f@roeck-us.net>
Date: Wed, 20 Nov 2024 06:53:58 -0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] hwmon: (pmbus/adp1050): add support for adp1051,
 adp1055 and ltp8800
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Cedric Encarnacion <cedricjustine.encarnacion@analog.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Radu Sabau <radu.sabau@analog.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
References: <20241120035826.3920-1-cedricjustine.encarnacion@analog.com>
 <20241120035826.3920-3-cedricjustine.encarnacion@analog.com>
 <Zz3plZOyMcxn54_h@smile.fi.intel.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <Zz3plZOyMcxn54_h@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/20/24 05:52, Andy Shevchenko wrote:
> On Wed, Nov 20, 2024 at 11:58:26AM +0800, Cedric Encarnacion wrote:
> 
> I would start the commit message with the plain English sentence that describes
> the list given below. E.g., "Introduce support for the following components:".
> 
>>      ADP1051: 6 PWM for I/O Voltage, I/O Current, Temperature
>>      ADP1055: 6 PWM for I/O Voltage, I/O Current, Power, Temperature
>>      LTP8800-1A/-2/-4A: 150A/135A/200A DC/DC µModule Regulator
>>
>> The LTP8800 is a family of step-down μModule regulators that provides
>> microprocessor core voltage from 54V power distribution architecture.
>> LTP8800 features telemetry monitoring of input/output voltage, input
>> current, output power, and temperature over PMBus.
> 
> ...
> 
>>     - Radu Sabau <radu.sabau@analog.com>
>>   
>> -
>>   Description
>>   -----------
> 
> Stray change.
> 
> ...
> 
>> -This driver supprts hardware monitoring for Analog Devices ADP1050 Digital
>> -Controller for Isolated Power Supply with PMBus interface.
>> +This driver supports hardware monitoring for Analog Devices ADP1050, ADP1051, and
>> +ADP1055 Digital Controller for Isolated Power Supply with PMBus interface.
>>   
>> -The ADP1050 is an advanced digital controller with a PMBus™
>> +The ADP105X is an advanced digital controller with a PMBus™
> 
> Can we use small x to make it more visible that it's _not_ the part of the
> name, but a glob-like placeholder?
> 

As mentioned in my other reply, I'd rather not have a placeholder in the first
place.

>>   interface targeting high density, high efficiency dc-to-dc power
>>   conversion used to monitor system temperatures, voltages and currents.
> 
> ...
> 
>> +#if IS_ENABLED(CONFIG_SENSORS_ADP1050_REGULATOR)
> 
> Why? Is the data type undefined without this?
> 

Look into other drivers. That is how it is implemented there,
and not really the point. One has to know about an alternative to use it.

>> +static const struct regulator_desc adp1050_reg_desc[] = {
>> +	PMBUS_REGULATOR_ONE("vout"),
>> +};
>> +#endif /* CONFIG_SENSORS_ADP1050_REGULATOR */
> 
> Note, this can be dropped anyway in order to use PTR_IF() below, if required.
> 

FWIW, PTR_IF() isn't widely used, and I for my part was not aware that
it exists.

> ...
> 
>> +#if IS_ENABLED(CONFIG_SENSORS_ADP1050_REGULATOR)
>> +	.num_regulators = 1,
>> +	.reg_desc = adp1050_reg_desc,
>> +#endif
> 
> Ditto, are the fields not defined without the symbol?
> 

They are, but they must be 0/NULL. PTR_IF() would be an alternative.
It is a bit odd to use it for a non-pointer, but it is type-agnostic,
so using it should be ok to avoid the #ifdefs. We should maybe adopt
that mechanism for other PMBus drivers.

> ...
> 
>>   static int adp1050_probe(struct i2c_client *client)
>>   {
>> -	return pmbus_do_probe(client, &adp1050_info);
>> +	const struct pmbus_driver_info *info;
>> +
>> +	info = device_get_match_data(&client->dev);
> 
> Why not i2c_get_match_data()?
> 
>> +	if (!info)
>> +		return -ENODEV;
>> +
>> +	return pmbus_do_probe(client, info);
>>   }
> 
> ...
> 
>>   static const struct i2c_device_id adp1050_id[] = {
>> -	{"adp1050"},
>> +	{ .name = "adp1050", .driver_data = (kernel_ulong_t)&adp1050_info},
> 
> Please, split this patch to at least two:
> 1) Introduce chip_info;

That would really be "Use driver data to point to chip info".

> 2) add new devices.
> 

I don't really care much about separating those two (after all, they are
related), but adding regulator support to the driver is a major change
and should be a separate patch. On top of that, it isn't even mentioned
in the patch description.

Thanks,
Guenter


