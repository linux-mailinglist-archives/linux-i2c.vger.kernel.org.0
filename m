Return-Path: <linux-i2c+bounces-3813-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AAFE08FD064
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2024 16:05:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F1651F21CC9
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2024 14:05:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA12810A36;
	Wed,  5 Jun 2024 14:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RcaDeQPj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5991125BA;
	Wed,  5 Jun 2024 14:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717596296; cv=none; b=NAoC5M5A7fR3HusF5tu9bTvwJDDRuN+mGWE2LuokXb9f6ciD1dIiQFuLSZmvEewp324NG65jKHUTqG8RTEd33IUWQHdbUD8I9lkHu9G7XvvTBctLBpPKouv3XuR39OLlK6fgds5UxPhbpuHvLzIBxm2lZLpfOryHJc5hw6yBhjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717596296; c=relaxed/simple;
	bh=p8+UBElJvT76w9HMbNMCxRJfanMU1vkZtUGBQHCIF4U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y1zBeCgfNuSShX9oPR9t7dSI0xaPyupp9OdoTOvYNQBliPhvMmw7otuJu3v3CneUrDQs0hKj9MGdDrhyrfdjWJLBDk6kzLTswoqnXDJNeb29AXxDRKBKVJOrogYlhjBWJY8QD8f2Brt64a9lIa10LS4Zvqc6vYPwA6yZzGppsrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RcaDeQPj; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-6c5a6151ff8so1871789a12.2;
        Wed, 05 Jun 2024 07:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717596294; x=1718201094; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=kOf2pXDoP6bXL3TDZ1k6BJtZjPCNkpQOe/d8aTG5sDs=;
        b=RcaDeQPjEflfOVOaMSprhlqTRrhRSSo5wDJvgJy23QTwgyH90DpoEtTGkhVvNBofRr
         kUUNzD6Th1PyH8uWNwt/Zl5zWoOhDzxCuf8cx/1MjbWipOnLMyWG8fgtXRADq8yUSMCf
         h/pbZmppS/ffOzda1oM+ZXfzF4PK2645RaAD0vLXAx0VBFWvHX8bgmnllYKliKbhg5Ty
         h33f3JHiH8j1d3WsBbChAZbTPXycCXpallU8lPia32lATaXZ1JYzR/j0Z8VUuNAzcEFK
         6Vuu/8njD2aoPsAAbPfdFxQ3Yx0aMVSx3LFy51RUOFCystKxtbyLeFDGl2+gRdQSyzUN
         486w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717596294; x=1718201094;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kOf2pXDoP6bXL3TDZ1k6BJtZjPCNkpQOe/d8aTG5sDs=;
        b=dAQmUiAGIXDPI5em/ynQD+cf8JGc1edy9rBPFssASG17ZCszpt0QrMZiJDoGw4HMdD
         QXA76Rm9Ta8yH8inBSD8EwHc8DK+AcU7r0lPM6DPlNTiGcMA7IIM7ZVdoqzAv6Rvooea
         9LFCuhx3YI9/QHSQGDuRytuU8HA3tsFhSLzpCW5p/DcmFCx6h3IozVmTFIsknkXgrfpN
         SO+a6tyZ13Ei2qlJw9G1eANhNzKKho9PMBk58dHKiRKH2ACJeRtnqvYi80FOQk7Er1VZ
         DgYEMeyo7V+IpqTkorFUc/jZ/zHZEW6QeJG5Ak1fFrpS4Nc091SWQ6NiMsPl+HcO6Mll
         e6aQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgaFTxUnXbCB6aI+tX47z1a+w1WYHwsn967bXG4vqyupmsYNMemTnA4jUWozdWvzOV4ROO/efD3EgDqLTfJjgFo0pSRufcpq7rwyZXv0LWPqwSrurux6VtHHj6tXf27Iicw+4lbKqRKrXklt1dkBWthKi3KqkMZH2goTV7rrJTN+mDmg==
X-Gm-Message-State: AOJu0Yyip+VUeZWTKPBpTJtUjua8Wzzq0HSjbm2Xd11jrKglquW4xkYl
	JgJTsSzbvv7PZYG6tkPdBloiZBeZq5CwTHKI9kDCxDdGtLS3iF3WlW8tWQ==
X-Google-Smtp-Source: AGHT+IH3wRuBV8148bcuq9f24RSdMLZTS4091K407OpaKZLOI9bMIWh/vMLerG0uzmiR26BwklynMg==
X-Received: by 2002:a17:90a:cf03:b0:2c1:aefa:1e7f with SMTP id 98e67ed59e1d1-2c27daf6705mr2374303a91.3.1717596293650;
        Wed, 05 Jun 2024 07:04:53 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c2806ccf77sm1527234a91.51.2024.06.05.07.04.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jun 2024 07:04:52 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <b83f47cd-2b4f-4681-8f3e-d6123cbf48ce@roeck-us.net>
Date: Wed, 5 Jun 2024 07:04:51 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4a 6/6] hwmon: (spd5118) Add configuration option for
 auto-detection
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 =?UTF-8?Q?Ren=C3=A9_Rebe?= <rene@exactcode.de>, Armin Wolf <W_Armin@gmx.de>,
 Stephen Horvath <s.horvath@outlook.com.au>
References: <20240604040237.1064024-7-linux@roeck-us.net>
 <20240605021907.4125716-1-linux@roeck-us.net>
 <85236eae-f5a2-408c-9bbf-fe547b0c32d5@t-8ch.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <85236eae-f5a2-408c-9bbf-fe547b0c32d5@t-8ch.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/5/24 02:22, Thomas Weißschuh wrote:
> On 2024-06-04 19:19:07+0000, Guenter Roeck wrote:
>> With SPD5118 chip detection for the most part handled by the i2c-smbus
>> core using DMI information, the spd5118 driver no longer needs to
>> auto-detect spd5118 compliant chips.
>>
>> Auto-detection by the driver is still needed on systems with no DMI support
>> or on systems with more than eight DIMMs and can not be removed entirely.
>> However, it affects boot time and introduces the risk of mis-identifying
>> chips. Add configuration option to be able to disable it on systems where
>> chip detection is handled outside the driver.
>>
>> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>> ---
>> Sent as v4a to avoid resending the entire series.
>>
>> v4a:
>>      Do not auto-select SENSORS_SPD5118_DETECT if DMI is disabled
>>      Modify help text of SENSORS_SPD5118_DETECT
>>      Default SENSORS_SPD5118_DETECT to y if (!DMI || !X86)
>>       
>> v4: New patch
>>
>>   drivers/hwmon/Kconfig   | 19 +++++++++++++++++++
>>   drivers/hwmon/spd5118.c |  4 +++-
>>   2 files changed, 22 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
>> index 7a84e7637b51..d5eced417fc3 100644
>> --- a/drivers/hwmon/Kconfig
>> +++ b/drivers/hwmon/Kconfig
>> @@ -2193,6 +2193,25 @@ config SENSORS_SPD5118
>>   	  This driver can also be built as a module. If so, the module
>>   	  will be called spd5118.
>>   
>> +config SENSORS_SPD5118_DETECT
>> +	bool "Enable detect function"
>> +	depends on SENSORS_SPD5118
>> +	default (!DMI || !X86)
>> +	help
>> +	  If enabled, the driver auto-detects if a chip in the SPD address
>> +	  range is compliant to the SPD51888 standard and auto-instantiates
>> +	  if that is the case. If disabled, SPD5118 compliant devices have
>> +	  to be instantiated by other means. On X86 systems with DMI support
>> +	  this will typically be done from DMI DDR detection code in the
>> +	  I2C SMBus subsystem. Devicetree based systems will instantiate
>> +	  attached devices if the DIMMs are listed in the devicetree file.
>> +
>> +	  Disabling the detect function will speed up boot time and reduce
>> +	  the risk of mis-detecting SPD5118 compliant devices. However, it
>> +	  may result in missed DIMMs under some circumstances.
>> +
>> +	  If unsure, say Y.
>> +
>>   config SENSORS_TC74
>>   	tristate "Microchip TC74"
>>   	depends on I2C
>> diff --git a/drivers/hwmon/spd5118.c b/drivers/hwmon/spd5118.c
>> index 5cb5e52c0a38..19d203283a21 100644
>> --- a/drivers/hwmon/spd5118.c
>> +++ b/drivers/hwmon/spd5118.c
>> @@ -313,7 +313,7 @@ static bool spd5118_vendor_valid(u8 bank, u8 id)
>>   }
>>   
>>   /* Return 0 if detection is successful, -ENODEV otherwise */
>> -static int spd5118_detect(struct i2c_client *client, struct i2c_board_info *info)
>> +static int __maybe_unused spd5118_detect(struct i2c_client *client, struct i2c_board_info *info)
>>   {
>>   	struct i2c_adapter *adapter = client->adapter;
>>   	int regval;
>> @@ -647,7 +647,9 @@ static struct i2c_driver spd5118_driver = {
>>   	},
>>   	.probe		= spd5118_probe,
>>   	.id_table	= spd5118_id,
>> +#ifdef CONFIG_SENSORS_SPD5118_DETECT
>>   	.detect		= spd5118_detect,
>> +#endif
>>   	.address_list	= normal_i2c,
>>   };
> 
> For the if-deffery I proposed something during the last review,
> I'm not sure if you saw it. If you did, please ignore this comment:
> 

I missed that, sorry (and I hope I didn't miss anything else).

> 
> .address_list is also only needed with CONFIG_SENSORS_SPD5118_DETECT.
> 
> If you use
> 
> .detect         = IS_ENABLED(CONFIG_SENSORS_SPD5118_DETECT) ?  spd5118_detect : NULL,
> .address_list   = IS_ENABLED(CONFIG_SENSORS_SPD5118_DETECT) ?  normal_i2c : NULL,
> 
> then the need for __maybe_unused goes away and type checking is a tiny
> bit better.

It does let me drop the #ifdef, so I agree it is a bit better.
I made that change, but I'll wait for a couple of days before sending
the updated version to give others time for additional feedback.

Thanks,
Guenter


