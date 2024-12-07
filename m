Return-Path: <linux-i2c+bounces-8371-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2B09E8262
	for <lists+linux-i2c@lfdr.de>; Sat,  7 Dec 2024 22:52:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 629BF2818D5
	for <lists+linux-i2c@lfdr.de>; Sat,  7 Dec 2024 21:52:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1A3E15442A;
	Sat,  7 Dec 2024 21:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Etgrf03q"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA97C28F5;
	Sat,  7 Dec 2024 21:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733608324; cv=none; b=t8Iwi814fm6RF6dcJ5Yib9p/VR43FSMwbftpZ4Np/XTtZfGveGlDqd0f2udYD7QbpwwLzTYPwrbWSDXcuGZ8TnqXxeQSTMQ5LvNdxJVwpnZD4h2vpKGzgxdQUeP3BX36Tfy/LbW05JTkVkFWc8PE7T7WX9aJ12wbaXXu0BU/IqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733608324; c=relaxed/simple;
	bh=GE1X2Ca0WwBARx8F2w97JAt4zOFvg95dKYbSc9c4DRY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QtEPyeZomLIFcSF5swwSHw5kv0fbcKClFyiG6Za8xnhOdd2UVQPfqJg69rdYitVrme6uH1dwiZv8GkWwPsgS8iW+2Q7gn/Z0Mb15IKNb27KcTeN+jE9z1Gn4IROd2voKj/A/rozWKd17C2xe/rDqyXixACTGvoLTb8qbYfkAXYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Etgrf03q; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-215936688aeso29158355ad.1;
        Sat, 07 Dec 2024 13:52:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733608322; x=1734213122; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=zAj6gtJfioS4xK7LHPGlCxzVIIF5H0+uZSsS6TYVe1o=;
        b=Etgrf03quRb5GvOmJcDauWl8iT4qB5oGNLl1A9MHWEqxLNsAyYcXNBkEklHjAotR6M
         wYC74jUGCtDUXhGjaz5xBp546daNEzxpsSQU3sJFJymcUGOGerxuH1qbzwEPECk25b8N
         T2pg9PGQNmvB+YkPl2EnIgDlthqFR7F9gv1txw4y5Ur9vLyt8c3SlznZdJ6hyxNUqPCR
         H5mO3LmoXKV9hc7DlBfZsyKRLs4tAKMJBc+TTNIlBUsH7/2MUblNBuaTU9HUZJuZ4B98
         TTimpDKM4y64nTDw7ctUM83WYNqYg8XuLKVsyjdfwIAfK/iYA7GDh3fgSjzP5GV0mI63
         NBqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733608322; x=1734213122;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zAj6gtJfioS4xK7LHPGlCxzVIIF5H0+uZSsS6TYVe1o=;
        b=B0pQsNm7me5n//buuDxgqYsKgogJgjKax4cV4fGK4Xt2nendvMybDLlPDyLNud7FrP
         +94QOdF8bsUWFTEwTvYqK4VWjLect56JJHUySI3G9MSxlHgiAC57qGHyqMUxXhCS5tH3
         WRy+83Qe5eOmN3BpJHlTXhhG3sYsz5bwU7SUFZ6Gpp6Y83Xedf17FuTTKVw+pxkjkPz+
         4CrEZRYPmQw9s/f0SWwG3C4DTPxyYZK6eDqARAYtpQvUNx+1FWYnVMJmFAvlIXGwdCOx
         gvITvfTO+ZRtfJuwmi2oArMLQVPdTEPuBHtx6Rlm8olfQ6W5M5hXUJ/tO3kTqT8OnrPI
         eUgw==
X-Forwarded-Encrypted: i=1; AJvYcCUBKeAlk/4A0UCZOf6k4rf48bdulg1qhlSxMFUDyHKczHc1e11ghrPkod5zyLOWURVr7aKTt6gHlSj9wg==@vger.kernel.org, AJvYcCUpiNRrJs9CdJ/krGlIHUfc76AQ/8V6G0dAgNaEzqr8VeasdxOS6HyroYhuNsTl8TPnqA6Z67j2sSPe@vger.kernel.org
X-Gm-Message-State: AOJu0YwZzkZ77JF/vBmIBhYSA5qHOD5jt3hT28UhmwaBFPKVyVzWxxaI
	JKLjF4HaaeBdgjQBAEgsh5HMW+xy22itl8wS0Fa4bejcFEUX/RNu
X-Gm-Gg: ASbGnctsezCxdCEFXXdRIi2X+55vs81GdsIFeR9/CU+sh1U1WaShldjuBCGPfHOfO/A
	b5iq3ZaLQ6Dc2XEMrGEIRHzHSOdErG8ZXs4ySCSHvn42VjSlMHiUaq4iU2w0UtEPhSvtweJBysf
	+DE5oCRhFpUeG6N4Oqwupm1cNceGE0UoyxmBMhdwptIxbYbPe4qTH7p0Pw4bed+DnULE/Vuavwn
	FvoHMQFaUjA0y/FMPdVveAiUcXsLcygUzTxEgILiY6kVmNHEQ+6gPO3kDnPhYuRDKQULv2SULGH
	06OpLxqONxB23oGfAWDRw9o=
X-Google-Smtp-Source: AGHT+IEqSyvW/mSb1we8S0LUc8yKCY25Y+BXTkXFjO8wXMooRwSNcx5m3sT6eslbfzllHtbFmcKE6Q==
X-Received: by 2002:a17:903:2348:b0:212:996:3559 with SMTP id d9443c01a7336-21614d2e567mr120128485ad.5.1733608322144;
        Sat, 07 Dec 2024 13:52:02 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21631118cedsm12914285ad.150.2024.12.07.13.51.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Dec 2024 13:52:01 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <28e42a85-4985-4cfc-b152-43506c118a6b@roeck-us.net>
Date: Sat, 7 Dec 2024 13:51:58 -0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: Initialize i2c_device_id structures by name
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
 George Joseph <george.joseph@fairview5.com>,
 Juerg Haefliger <juergh@proton.me>, Riku Voipio <riku.voipio@iki.fi>,
 =?UTF-8?Q?Carsten_Spie=C3=9F?= <mail@carsten-spiess.de>,
 Zev Weiss <zev@bewilderbeest.net>,
 Eric Tremblay <etremblay@distech-controls.com>,
 Greg KH <gregkh@linuxfoundation.org>, Peter Zijlstra <peterz@infradead.org>,
 Grant Peltier <grantpeltier93@gmail.com>,
 Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh@kernel.org>,
 Mariel Tinaco <Mariel.Tinaco@analog.com>,
 Peter Yin <peteryin.openbmc@gmail.com>, Potin Lai <potin.lai.pt@gmail.com>,
 Konstantin Aladyshev <aladyshev22@gmail.com>,
 Patrick Rudolph <patrick.rudolph@9elements.com>,
 Eddie James <eajames@linux.ibm.com>, Lakshmi Yadlapati
 <lakshmiy@us.ibm.com>, linux-i2c@vger.kernel.org
References: <20241205152833.1788679-2-u.kleine-koenig@baylibre.com>
 <89b8d605-c5ac-490f-977d-76315d6d5f46@roeck-us.net>
 <3qfvfqjp53yhfaf327rqyxzrrxrataawubetwcipv5dmrplsez@pe2ressulfxp>
 <403cc23e-db63-4091-932d-0ec82a32c52b@roeck-us.net>
 <Z1SXnV93Q_1iqM6q@smile.fi.intel.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <Z1SXnV93Q_1iqM6q@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/7/24 10:44, Andy Shevchenko wrote:
> On Sat, Dec 07, 2024 at 07:32:43AM -0800, Guenter Roeck wrote:
>> On 12/7/24 01:13, Uwe Kleine-König wrote:
>>> Hello Guenter,
>>>
>>> [dropped Jose Ramon San Buenaventura from Cc: who's address bounced]
>>>
>>> On Thu, Dec 05, 2024 at 08:27:15AM -0800, Guenter Roeck wrote:
>>>> On Thu, Dec 05, 2024 at 04:28:33PM +0100, Uwe Kleine-König wrote:
>>>>> I intend to change the definition of struct i2c_device_id to look as
>>>>> follows:
>>>>>
>>>>>           struct i2c_device_id {
>>>>>                  char name[I2C_NAME_SIZE];
>>>>>                  /* Data private to the driver */
>>>>>                  union {
>>>>>                          kernel_ulong_t driver_data;
>>>>>                          const void *driver_data_ptr;
>>>>>                  };
>>>>>           };
>>>>>
>>>>> That the initializers for these structures also work with this new
>>>>> definition, they must use named members.
>>>>>
>>>>> The motivation for that change is to be able to drop many casts from
>>>>> pointer to kernel_ulong_t. So once the definition is updated,
>>>>> initializers that today use:
>>>>>
>>>>> 	{"adp4000", (kernel_ulong_t)&pmbus_info_one},
>>>>>
>>>>> can be changed to
>>>>>
>>>>>           { .name = "adp4000", .driver_data_ptr = &pmbus_info_one },
>>>>>
>>>>
>>>> How about introducing a macro for that instead, similar to I3C_DEVICE() ?
>>>
>>> OK, for now we'd have then:
>>>
>>> 	#define I2C_DEVICE_ID_PTR(_name, _driver_data_ptr)	\
>>> 		{ .name = (_name), .driver_data = (kernel_ulong_t)_driver_data_ptr }
>>>
>>> 	#define I2C_DEVICE_ID_ULONG(_name, _driver_data)	\
>>> 		{ .name = (_name), .driver_data = _driver_data }
>>>
>>> plus maybe:
>>>
>>> 	#define I2C_DEVICE_ID(_name)	\
>>> 		{ .name = (_name) }
>>>
>>> for the drivers that don't need driver data?
>>>
>>
>> Something like that, though I'd even hide the parameter type and just have
>>
>> 	#define I2C_DEVICE_ID_DATA(_name, _data)	\
>> 		{ .name = (_name), .driver_data = (kernel_ulong_t)_data }
>>
>> 	#define I2C_DEVICE_ID(_name)	\
>> 		{ .name = (_name) }
> 
> It's better, if we go this way, to keep this in sync with above by changing as
> 
> 	#define I2C_DEVICE_ID(_name)	I2C_DEVICE_ID_DATA(_name, 0)
> 

Makes sense.

Thanks,
Guenter


