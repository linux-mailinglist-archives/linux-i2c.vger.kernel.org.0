Return-Path: <linux-i2c+bounces-10498-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6D4A94684
	for <lists+linux-i2c@lfdr.de>; Sun, 20 Apr 2025 05:03:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A2840175210
	for <lists+linux-i2c@lfdr.de>; Sun, 20 Apr 2025 03:03:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A43037160;
	Sun, 20 Apr 2025 03:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JFlATY3g"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1177F18052;
	Sun, 20 Apr 2025 03:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745118186; cv=none; b=qdR8MxCc732R2iwc5IgAhBJvzdtFcfIIYIgNdmsIBg5YzJVH2SDpoB+mKcA1TtxpbhIM90LRJcGdC4wdfmg+016krmYFQjDPycWlOKdDLOVoLop1E6glgu3D+BanL/sGEMRBPa13FI3n5CkUkpFGCVjCLgGaCJSUFjPd1lezJAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745118186; c=relaxed/simple;
	bh=wwhLBiokM1Z8yheA54bXN/5PgV/TibB6uZ2lGUuDc6k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BBcQTpqxpkb9PGAXCJIERGw6TPkz9NC6wNQ2xLXwVd2yUJYYDKIPm8P7Z+Tkw/zDNRVvVPV/5A/7DyoslT4s3kuChrd0UPsMDsdNi/4cisX0vXc5YD8FSBKTbeA0jAoT4x5jywWNT3emntZmihZaai73bkiU8xb+4IwHhZViV1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JFlATY3g; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-224100e9a5cso35325965ad.2;
        Sat, 19 Apr 2025 20:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745118183; x=1745722983; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=7G+KotcDrYlXxUONQiYmQ2ARwxf7KAhzxH5ydcTOOTE=;
        b=JFlATY3gDpSe2VXvq7Cbysh9UvmQLmb/L5w2+9vqDRqU/DbHCH/mKzOY2rAEIx3jmb
         eXDcI13gcL4owtHbnZBY33bSDuc823UaaQBrViFzclI0Ak42/0NTvwcWQ6dPj+ck3OU5
         lkdTmnukGTtrc+kv5OsYv1kAUGIGJSx5wXGgxU4+F9mr6baqrPWUPvzcMM0mXi+ZDBR7
         2xfsgEY6MKI7hp2BNYykE4mfvuhjREI9xBtRHNuZq2eyJdRvDdg3xlUkqdUt2+q/ZDRw
         044QN2nWYkltXQulG4AOMrQ2orRWWM2l/aXgTL/aAJNg03Se59odrgIsU+y8UYYEhgtn
         VSlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745118183; x=1745722983;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7G+KotcDrYlXxUONQiYmQ2ARwxf7KAhzxH5ydcTOOTE=;
        b=DLt3Bw6TbXK9Xbh/0W8JBnHo/qJiQHj3d+w8+KS4r0P31FJ5w2q3Fua3/js6nY/3aA
         abO2XBUORpK8PEPqx9dfHMN5uy57jzCAVgLKEcth1hskfW1gpCjs6BgqczcMbs5B8Ido
         tiyMvFFqNVm49DG5/4tinT0oZPODHtfUp+0zkBM17Hthw4K1z28FmhJ7YRtqYOaIO6ym
         PejfE3voouMY6zL5NnZpEPnD9LhtOUX9hi3e4BWUG2PoepRAvTSB5w9LwYvyxiFDMj2h
         0b2jPeiExpVL/Ppk2/YybBjj9kwkq+X9lG6r6Rs4Yt7u8aFeWaZADoLCZlc2B47hfimf
         ZQUg==
X-Forwarded-Encrypted: i=1; AJvYcCWwFH20lkAW/jAlnKXuMQ3MPmUmR1Tg5x74jocpU9boteTAWFlTn1L8SBiJ1iZihlXIcgOPmrjfm4U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu+oA6/vIImz3SbFmJBWAs4/c2CDZxM4/n49zhkGwMr6YQMqr1
	i7c3qiEsLjIj/6cVL1hjEsX4Ym9coaetUEP5hoSmxj1Rs3t6FX2O7o1rOw==
X-Gm-Gg: ASbGncszhxKyYY5EZlhfcwdMMv2DbhwTSOqilLRzJJ+oOe1t10OxVXtLqNX3+ZluZl3
	b5gjbZCSObXykxb95ejL3FX5ETIlAcFX93SueAjAXfV019aJmaGw8iPMXdX/Z509JxA6Zw+3Nmz
	ZoEXYqZNW3UxSutKhR0ABMPsCkbu2lU0ur+eSwjhdkYysCj7RkpjlKXwHz4PvOAUTb7RqYijh54
	IcC7Q+qD2ih6ixH1FsOaKDuIUjZXrdnfRUU4xnFXmCmCjx3b9+Yf42INYo6QKUuU9viW5gO4iiO
	Rs72qCDSlWYeXRN4mgvl98jr6I01g9drqLsnjtAN9Z59QiJjtagcUcFKcr+pXUyn8ISOmczgHwq
	qm+d8IZvodYZgNQ==
X-Google-Smtp-Source: AGHT+IGeWgsVXuOMBv77p/O2rhdZiC/B1BNZ4LVNb1V13DA6IZa1+hDU/vavvjL3mWf8BCW3FKp2Og==
X-Received: by 2002:a17:902:f788:b0:223:4816:3e9e with SMTP id d9443c01a7336-22c5357ecfamr103278295ad.13.1745118183014;
        Sat, 19 Apr 2025 20:03:03 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50bf6b72sm40820425ad.103.2025.04.19.20.03.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Apr 2025 20:03:02 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <00baca6f-8046-46ae-a68c-525472562be7@roeck-us.net>
Date: Sat, 19 Apr 2025 20:03:01 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: PMBus memory overflow
To: Matt Corallo <yalbrymrb@mattcorallo.com>
Cc: linux-hwmon@vger.kernel.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Linux I2C <linux-i2c@vger.kernel.org>
References: <985cd95f-155b-4b8a-9fe7-59938d0c2b8f@mattcorallo.com>
 <9e01e3ec-3ac5-4d83-a065-d00d568b9cc7@roeck-us.net>
 <e030f44f-11ee-4739-b9d3-c22883bbbf02@mattcorallo.com>
 <336f298f-497f-4dd9-97ee-50b81221be06@roeck-us.net>
 <1b1eccff-a306-4e17-a6bf-fd3203c61605@mattcorallo.com>
 <1edc8396-535d-4cdf-bbb7-11d559d4c257@roeck-us.net>
 <cfc2b3c8-3f94-407a-a4d5-e7d81686eb2d@mattcorallo.com>
 <84258b48-03b5-4129-bed5-f8200996f2eb@roeck-us.net>
 <fcfd78d2-238d-4b68-b6ec-5ee809c4ef08@mattcorallo.com>
 <eb5796e8-de76-4e91-9192-65b9af7a4d49@roeck-us.net>
 <284466fd-39e8-419e-8af5-41dbabb788af@roeck-us.net>
 <d5abeb59-8286-425c-9f78-cd60b0e26ada@mattcorallo.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <d5abeb59-8286-425c-9f78-cd60b0e26ada@mattcorallo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/19/25 19:29, Matt Corallo wrote:
> 
> 
> On 4/19/25 6:49 PM, Guenter Roeck wrote:
>> On 4/19/25 15:38, Guenter Roeck wrote:
>>> On 4/19/25 12:29, Matt Corallo wrote:
>>>
>>>> Hmm, doesn't seem to trigger it at least with pmbus_peek.c, the following diff still doesn't hit the too big prints:
>>>>
>>>
>>> Only idea I have at this point is to either enable smbus tracing in the kernel
>>> or (better) to add test code into i2c_smbus_read_block_data() to see what
>>> exactly triggers the problem.
>>>
>>
>> You could try this:
>>
>> diff --git a/drivers/i2c/i2c-core-smbus.c b/drivers/i2c/i2c-core-smbus.c
>> index e73afbefe222..b2856f88431d 100644
>> --- a/drivers/i2c/i2c-core-smbus.c
>> +++ b/drivers/i2c/i2c-core-smbus.c
>> @@ -233,6 +233,9 @@ s32 i2c_smbus_read_block_data(const struct i2c_client *client, u8 command,
>>          if (status)
>>                  return status;
>>
>> +       if (data.block[0] > I2C_SMBUS_BLOCK_MAX)
>> +               return -E2BIG;
>> +
>>          memcpy(values, &data.block[1], data.block[0]);
>>          return data.block[0];
>>
>> and maybe temporarily dump the entire buffer if that is seen.
>>
>> diff --git a/drivers/i2c/i2c-core-smbus.c b/drivers/i2c/i2c-core-smbus.c
>> index e73afbefe222..3dcb8b6b2427 100644
>> --- a/drivers/i2c/i2c-core-smbus.c
>> +++ b/drivers/i2c/i2c-core-smbus.c
>> @@ -233,6 +233,12 @@ s32 i2c_smbus_read_block_data(const struct i2c_client *client, u8 command,
>>          if (status)
>>                  return status;
>>
>> +       if (data.block[0] > I2C_SMBUS_BLOCK_MAX) {
>> +               print_hex_dump_bytes("Bad SMBus block data: ", DUMP_PREFIX_NONE,
>> +                                    data.block, I2C_SMBUS_BLOCK_MAX);
>> +               return -E2BIG;
>> +       }
>> +
>>          memcpy(values, &data.block[1], data.block[0]);
>>          return data.block[0];
>>   }
>>
>> If that doesn't trigger I am going to be really puzzled.
> 
> With this patch the device works fine. With debug enabled I see:
> 
> [  273.730583] i2c-core: driver [pmbus] registered
> [  276.585423] pmbus 1-0058: probe
> [  278.925878] Bad SMBus block data: ff ff b8 ff ff ff ff ff ff ff ff ff ff ff ff ff  ................
> [  278.925881] Bad SMBus block data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  ................
> [  278.937859] Bad SMBus block data: ff ff da ff ff ff ff ff ff ff ff ff ff ff ff ff  ................
> [  278.937861] Bad SMBus block data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  ................
> [  280.353885] i2c i2c-1: client [pmbus] registered with bus id 1-0058
> [  280.353888] i2c i2c-1: new_device: Instantiated device pmbus at 0x58

Great, thanks for confirming. So the two problems are:

- The cp2112 driver does not validate the first data byte (the length field) when
   receiving SMBus block data from connected devices.
- The I2C (SMBus) core does not validate the first data byte before copying
   the data buffer.

Copying the I2C subsystem mailing list and the I2C maintainer.

Wolfram, what do you suggest ? Fixing the cp2112 driver is obviously necessary, but
I do wonder if a check such as the one above would be appropriate as well, possibly
even combined with a WARN_ONCE().

Thanks,
Guenter

> matt@psu-kern:~$ sensors
> pmbus-i2c-1-58
> Adapter: CP2112 SMBus Bridge on hidraw1
> vin:         123.00 V  (crit min =  -0.50 V, min =  -0.50 V)  ALARM (MIN)
>                         (max =  -0.50 V, crit max =  -0.50 V)
> vcap:        -500.00 mV
> vout1:        12.05 V  (crit min = +128.00 V, min = +128.00 V)
>                         (max = +128.00 V, crit max = +128.00 V)
> fan1:        5304 RPM
> fan2:          -1 RPM
> fan3:           FAULT  ALARM
> fan4:           FAULT  ALARM
> temp1:        +27.0°C  (low  =  -0.5°C, high =  -0.5°C)
>                         (crit low =  -0.5°C, crit =  -0.5°C)
> temp2:        +32.0°C  (low  =  -0.5°C, high =  -0.5°C)
>                         (crit low =  -0.5°C, crit =  -0.5°C)
> temp3:         -0.5°C  (low  =  -0.5°C, high =  -0.5°C)
>                         (crit low =  -0.5°C, crit =  -0.5°C)
> pin:         102.00 W  (max =   1.60 kW)
> pout1:        88.00 W  (max =   0.00 W, crit = -500.00 mW)
>                         (cap = -500.00 mW)
> iin:         988.00 mA (max =  -0.01 A, crit max =  -0.50 A)
> iout1:         7.39 A  (crit min =  -0.50 A, max =  -0.50 A)
>                         (crit max =  -0.50 A)


