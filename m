Return-Path: <linux-i2c+bounces-3791-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B458FB4BA
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Jun 2024 16:04:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C32B1F21898
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Jun 2024 14:04:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A89B615E83;
	Tue,  4 Jun 2024 14:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SflAVlWR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5AB8EAD0;
	Tue,  4 Jun 2024 14:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717509854; cv=none; b=GLgcw8qU5qJWgi4/cm4KpT8Gd3mB1cnITfBrFAl/i/AZXvuKE1Ty7lYewEry9Zlg0wNhCKRKXO0uM0ksf+dII26cxhzGl6Q6JJbKYPJsIE43us2Mz49aTwW0dY2JEPiixfcOiaM+4KlEvvCeGu1kKJ47VIzrZy+DHjEQ7JegIvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717509854; c=relaxed/simple;
	bh=Bg9cYDKfqeyVraGOEmALsA6FDhsosdOhScbKmJPxU/E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XCUp1cPSQAvzE/qoJV+CxdVAUmU/VyVFQ2plTFPXYqkzucMUr8YnUFFrht6lMKFRTDvg0mFsL0T8Hy87+qGSE5za7Fn8DFHmQPISfkMtuodUFwS0DfdW3cLZEGEz0xyP8Fgnl8gB6csdsFUoaDIRvpFL+4QKML/0jJ0Lwfxrcf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SflAVlWR; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1f63642ab8aso33295065ad.3;
        Tue, 04 Jun 2024 07:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717509852; x=1718114652; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=enPaUgUcC9yOTfYy7j3r26WSWSOC6BIEXxvXIakH3m0=;
        b=SflAVlWRtVd6e+k1RHCG70qUuOrC1M3QVV+9q49RfDlIpGX7TnRyA4PwS5FS3T2eGn
         axY5ogN/hsNoLjRurKd28r3bDajZ89RSxdxvegh9Xmw5/+1VO0yDkX3/kLA6tGtU4lmA
         h/PAS40Yg16yQptb92PCyxMaa4c0Csd8CZYloBIOvcqUgYRZsv+2btODKShTQ0b9pCfo
         AyMNDVF/6Bv6EzJQIUVv4616vX3M3hsLjNRmnkwRiZfD/257Y4RFyCADemmwOsXWXc0d
         PAumyo0AjsyiBgnjF1/mWxLR5ZbMJbwkXDUHyfqfZht7OIGiL+IdrmIDeXCcSaBfYPTn
         3oJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717509852; x=1718114652;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=enPaUgUcC9yOTfYy7j3r26WSWSOC6BIEXxvXIakH3m0=;
        b=Y2czIa1r8X94ZQ0zA0trmk5p6yGyzytQgnItz+dWqYYdrXAQhHQi7KIfEdGn0AGz72
         xfuquzTJywH84uUO2o4rKzVE675BQuEjoXEo8o2gB0ZfhxKrZESlAqsCVN1RyiyLHQ6r
         EkbeO6cBK7MUtEz8xDmqeY8yhQPlvqbGepz0tCQXkG1OW28tKQ3HWtF6sV5ZeplI2uUC
         qQSBFdVAziC+xAMkzyfojtgbRt3urKwhDXWs2aQZtT1IsuKLsubgb5J0l6bgch0tSs+u
         hHxyBg9b8WzHDQ6YBNp5dswPZfy05o8516NetefUYDMJ3YY3XpNmGs6VdmZDAxaLil3M
         jftA==
X-Forwarded-Encrypted: i=1; AJvYcCUfHJvenzLFv60REKiDz8XrCv9LyHAJYAnfmXNcjHxmsrxki/Drf8YgKY27Gt6DHETFqmT1kPN93FyYGu3Eycy2rpynOF97QSc73o+33Td7FUyMEU/W3AJ8LBHcTZE4PKt7jl/S2HA1uwLOqKfRw3fKQUxhiBwlgkbc/bSaIBwL3JYjDw==
X-Gm-Message-State: AOJu0Yw4xwUVeUNeA0dOabVBNzu9I/VWo7u10j/9EpbA3nUr1eeAbA9U
	K6dtkEOZdHQt4z+KH+WMTohm0e/DZHF6yclXm2JOIgmzV8g3KOxs
X-Google-Smtp-Source: AGHT+IE506n25Z0t8xaGhA3yHFxx+slBeHL7vIYGbh4uqQS+PSxor1sPH7ygIWcp2SIB2GxbGH6iQQ==
X-Received: by 2002:a17:903:1c8:b0:1f4:9ce1:6e78 with SMTP id d9443c01a7336-1f63701a46fmr140371635ad.19.1717509851781;
        Tue, 04 Jun 2024 07:04:11 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f63236d26dsm83563705ad.103.2024.06.04.07.04.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jun 2024 07:04:10 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <d0678374-025a-4000-8110-5fe2e917a8e4@roeck-us.net>
Date: Tue, 4 Jun 2024 07:04:09 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/6] hwmon: (spd5118) Add configuration option for
 auto-detection
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 =?UTF-8?Q?Ren=C3=A9_Rebe?= <rene@exactcode.de>, Armin Wolf <W_Armin@gmx.de>,
 Stephen Horvath <s.horvath@outlook.com.au>
References: <20240604040237.1064024-1-linux@roeck-us.net>
 <20240604040237.1064024-7-linux@roeck-us.net>
 <452386bd-8238-4fac-ad6d-6a8f096ecc35@t-8ch.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <452386bd-8238-4fac-ad6d-6a8f096ecc35@t-8ch.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/3/24 21:37, Thomas Weißschuh wrote:
> On 2024-06-03 21:02:37+0000, Guenter Roeck wrote:
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
>> v4: New patch
>>
>>   drivers/hwmon/Kconfig   | 18 ++++++++++++++++++
>>   drivers/hwmon/spd5118.c |  4 +++-
>>   2 files changed, 21 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
>> index 7a84e7637b51..0bb1bdee3e43 100644
>> --- a/drivers/hwmon/Kconfig
>> +++ b/drivers/hwmon/Kconfig
>> @@ -2185,6 +2185,7 @@ config SENSORS_SPD5118
>>   	tristate "SPD5118 Compliant Temperature Sensors"
>>   	depends on I2C
>>   	select REGMAP_I2C
>> +	select SENSORS_SPD5118_DETECT if !DMI
>>   	help
>>   	  If you say yes here you get support for SPD5118 (JEDEC JESD300)
>>   	  compliant temperature sensors. Such sensors are found on DDR5 memory
>> @@ -2193,6 +2194,23 @@ config SENSORS_SPD5118
>>   	  This driver can also be built as a module. If so, the module
>>   	  will be called spd5118.
>>   
>> +config SENSORS_SPD5118_DETECT
>> +	bool "Enable detect function"
>> +	depends on SENSORS_SPD5118
>> +	default y
>> +	help
>> +	  If enabled, the driver auto-detects if a chip in the SPD address
>> +	  range is compliant to the SPD51888 standard and auto-instantiates
>> +	  if that is the case. If disabled, SPD5118 compliant devices have
>> +	  to be instantiated by other means. On systems with DMI support
>> +	  this will typically be done from DMI DDR detection code in the
>> +	  I2C SMBus subsystem.
>> +	  Disabling the detect function will speed up boot time and reduce
>> +	  the risk of mis-detecting SPD5118 compliant devices. In general
>> +	  it should only be enabled if necessary.
>> +
>> +	  If unsure, say Y.
> 
> The combination of
> 
> "In general it should only be enabled if necessary."
> 
> and
> 
> "default y" / "If unsure, say Y."
> 
> looks weird.
> 

Yes, I know. I just couldn't find a better wording.

> 
> Also right now it is not possible to disable detection on non-DMI
> configurations. But when using OF, custom kernel code or userspace
> instantiation then neither DMI nor CONFIG_DETECT are necessary.
> 

That is a good point.

> The following would support those usecases, too:
> 
> config SENSORS_SPD5118_DETECT
> 	bool "Enable detect function"
> 	depends on SENSORS_SPD5118
> 	default !DMI
> 
> (And no "select SENSORS_SPD5118_DETECT if !DMI")
> 

I don't think "default !DMI" would be a good idea because DMI
is supported by multiple architectures, but only two X86 specific
controllers call i2c_register_spd().

"default !DMI || !X86" might work, though. I think I'll use that.

I'll rephrase the text and drop the "select".

Thanks,
Guenter


