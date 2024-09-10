Return-Path: <linux-i2c+bounces-6507-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B6011973D1F
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 18:23:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DAD4A1C246F9
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 16:23:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF6371A255E;
	Tue, 10 Sep 2024 16:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hesH5Srn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9EA31A0B07;
	Tue, 10 Sep 2024 16:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725985364; cv=none; b=N+IngZzjGBdn+6oj0mOP7ZwV20b1WEZ0iL91jxFtA3kcE4eNJqhNm0WxFMU2xA9fjH6jZryNfhJ4sAs0TU6qT7Htj8pqYIT6IMaPssc5OXI/WD1EwYm0S0MUQ2jIb5hHQM7nN6RuOQElsc5V8TCOg88gNwqEznmPYLb6lQsiR8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725985364; c=relaxed/simple;
	bh=Cu0tHFi2z1xFrlj3fMLlfd/9LD0kAEWE0FfE41xTXO8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=doJ3W1Z0+qkHqR6fo4w/3+5y3vDGLlB3KZhhvImcc1CtJvEm1TYbMGFEWHYYaFsNjlr6UXLcA9E2BHWtGf53uis/mDeaFVK994ox99moBvQ6Fu+k1beoDKZmKB9o8I0xTPB2P0xv+O7fsrD4cX/+l3JuQ8oGbVg9DcLGsji/Nxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hesH5Srn; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-205909afad3so11694815ad.2;
        Tue, 10 Sep 2024 09:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725985362; x=1726590162; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=55ZQ0zMk8pubb4P7cpXj0dotZqmGCpuGi3knOaeuJhY=;
        b=hesH5SrnqeSnCbmApHODdpv9BeyWSpxVoAmbcPx/Yi9b4XQ7nqhTaQPuYYCF6Vni6/
         lvnq97qsm1VlAWkZoJDQjdUtnjjPuZy+8JGC6MrN3OjmU6fIXsnfH3xyA3anzusP0iev
         r8vczFqFVd7UoiFEsXARmAPi6PMa4ErJ5XL6KoAf8xUWstDl0n5/0AIzHXrkOyO0ftoK
         dydOB9Yu38yK+keNhiAh9lJnU76D8mbIQ68YjyxbwUpl2jnXtTVDSiiYz74bV3+i8r6s
         ysIprCD1dgncZgiECucp6QXBSE0SYbDK6vDEkENmDlomyM/tqFFsanahwTCquQcY5DhW
         oBHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725985362; x=1726590162;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=55ZQ0zMk8pubb4P7cpXj0dotZqmGCpuGi3knOaeuJhY=;
        b=tG40r/uDBoiMVSwXmutx2pObiYoz3lY/nSYH4gC7Qt7ITVNwfrRxv41W3nra2cb33I
         vcKI3baAqJjHyP7awtC7BihKCdGe5RtSy6lhdkPCACBE3BSdqCy3ubNn5lhxBCiMe/8p
         7fVx6I7ta5bp/1jWfHnEH0WwUMRv5UxdsG4emjj6epFTBXNtil7JQoJiKpINqgiuuj5+
         gaQ6PumHj2+zgGFGrD/fEnaEx6f6JaZkvtI1NBD2zsozEpDnwZNMs+sVzAoBHAjzDuVP
         uFjHDa0oZZoWlem6ukJY851sA3yn4paP6rRVC+Avpj7/Czw26cAiEtrKo19HWrXv8mF+
         2Tew==
X-Forwarded-Encrypted: i=1; AJvYcCUowQsU4tsDH08v0KUn/UFfw+chZ+01Qo6nKAZydLK7KV6d1S2SaYiSfoNyzK7fTlj4xIlgeeQefp2v@vger.kernel.org, AJvYcCVWn67AdqiH0912cXDbEUx+FKQij89q/cWM7jIdHZo/kzmuefNs9Lj9tNqLXGWOuZwZ5UG/r6sGlrJJ@vger.kernel.org, AJvYcCVaaoSRNxzx/TRgfI+dnvQ2qZXNEbADqsS42FRARNvXwrIDOcq2VYM+ZzB+mkrqwP/5i1KtR3ycJ/+sJZXR@vger.kernel.org, AJvYcCW9VYnge4KXY7nDxGkJH22zBL5iGYsJpCQTzkck/fDgyNuzpIgrGTkkvXgF2+K37u65/o9QSV4iWWHF6qg=@vger.kernel.org, AJvYcCWuBcye8SNMf01V3sXI0aofkaTXmF2jacNh+KJj0+6v5BsRJb5nenBR8nP9lsJOFaHZHJkhKJ8u7S3y@vger.kernel.org
X-Gm-Message-State: AOJu0YxhD+lRu9c4Dniw1SKX9rscEnhV98zx1lGNU+l0ahvnH260Jx9K
	QWGHvCUrAyDqNRw4NnIxCqLrayYI2QDPIkcnX/B/zNJSwKl75fFB
X-Google-Smtp-Source: AGHT+IH1Ib7JxgEc1eSGZtFyWf2tTYGgcf74Lsyr61lZXegk54IuRLnhDyMaRxbklMZRhejOXvkwBQ==
X-Received: by 2002:a17:902:dac9:b0:205:968b:31ab with SMTP id d9443c01a7336-207521f92famr1523725ad.58.1725985361875;
        Tue, 10 Sep 2024 09:22:41 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20710f20c4esm50616715ad.237.2024.09.10.09.22.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Sep 2024 09:22:40 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <fb35a523-4f8c-4fee-a17a-d2b332fc2f77@roeck-us.net>
Date: Tue, 10 Sep 2024 09:22:38 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] hwmon: (pmbus/core) add POWER_GOOD signal limits
 support
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Jean Delvare <jdelvare@suse.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20240909-tps25990-v1-0-39b37e43e795@baylibre.com>
 <20240909-tps25990-v1-2-39b37e43e795@baylibre.com>
 <d76290e0-f5e7-4192-92b8-94f260270fe3@roeck-us.net>
 <1j8qw0t3ej.fsf@starbuckisacylon.baylibre.com>
 <08b6d9af-51b7-4eda-a4f6-62b688665fd9@roeck-us.net>
 <1jr09rsgda.fsf@starbuckisacylon.baylibre.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <1jr09rsgda.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/10/24 08:00, Jerome Brunet wrote:
> On Tue 10 Sep 2024 at 07:37, Guenter Roeck <linux@roeck-us.net> wrote:
> 
>> On 9/9/24 23:43, Jerome Brunet wrote:
>>> On Mon 09 Sep 2024 at 11:16, Guenter Roeck <linux@roeck-us.net> wrote:
>>>
>>>> On 9/9/24 08:39, Jerome Brunet wrote:
>>>>> Add support for POWER_GOOD_ON and POWER_GOOD_OFF standard PMBus commands.
>>>>> For PMBus devices that offer a POWER_GOOD signal, these commands are used
>>>>> for setting the output voltage at which a power good signal should be
>>>>> asserted and negated.
>>>>> Power Good signals are device and manufacturer specific. Many factors
>>>>> other
>>>>> than output voltage may be used to determine whether or not the POWER_GOOD
>>>>> signal is to be asserted. PMBus device users are instructed to consult the
>>>>> device manufacturer’s product literature for the specifics of the device
>>>>> they are using.
>>>>> Note that depending on the choice of the device manufacturer that a
>>>>> device
>>>>> may drive a POWER_GOOD signal high or low to indicate that the signal is
>>>>> asserted.
>>>>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>>>>> ---
>>>>>     drivers/hwmon/pmbus/pmbus.h      | 3 +++
>>>>>     drivers/hwmon/pmbus/pmbus_core.c | 6 ++++++
>>>>>     2 files changed, 9 insertions(+)
>>>>> diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
>>>>> index 5d5dc774187b..e322d2dd9fb7 100644
>>>>> --- a/drivers/hwmon/pmbus/pmbus.h
>>>>> +++ b/drivers/hwmon/pmbus/pmbus.h
>>>>> @@ -78,6 +78,9 @@ enum pmbus_regs {
>>>>>     	PMBUS_IIN_OC_FAULT_LIMIT	= 0x5B,
>>>>>     	PMBUS_IIN_OC_WARN_LIMIT		= 0x5D,
>>>>>     +	PMBUS_POWER_GOOD_ON		= 0x5E,
>>>>> +	PMBUS_POWER_GOOD_OFF		= 0x5F,
>>>>> +
>>>>>     	PMBUS_POUT_OP_FAULT_LIMIT	= 0x68,
>>>>>     	PMBUS_POUT_OP_WARN_LIMIT	= 0x6A,
>>>>>     	PMBUS_PIN_OP_WARN_LIMIT		= 0x6B,
>>>>> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
>>>>> index 0ea6fe7eb17c..94ddf0166770 100644
>>>>> --- a/drivers/hwmon/pmbus/pmbus_core.c
>>>>> +++ b/drivers/hwmon/pmbus/pmbus_core.c
>>>>> @@ -1768,6 +1768,12 @@ static const struct pmbus_limit_attr vout_limit_attrs[] = {
>>>>>     		.attr = "crit",
>>>>>     		.alarm = "crit_alarm",
>>>>>     		.sbit = PB_VOLTAGE_OV_FAULT,
>>>>> +	}, {
>>>>> +		.reg = PMBUS_POWER_GOOD_ON,
>>>>> +		.attr = "good_on",
>>>>> +	}, {
>>>>> +		.reg = PMBUS_POWER_GOOD_OFF,
>>>>> +		.attr = "good_off",
>>>>>     	}, {
>>>>>     		.reg = PMBUS_VIRT_READ_VOUT_AVG,
>>>>>     		.update = true,
>>>>>
>>>>
>>>> Those attributes are not hardware monitoring attributes and therefore not
>>>> acceptable. In general I am not sure if they should be configurable in the
>>>> first place, but definitely not from the hardware monitoring subsystem.
>>>> Maybe the regulator subsystem callbacks set_over_voltage_protection and
>>>> set_under_voltage_protection would be appropriate (with severity
>>>> REGULATOR_SEVERITY_PROT), but that should be discussed with regulator
>>>> subsystem maintainers.
>>> According to PMBUS spec, there is no protection associated with that
>>> command. It just tells when the output voltage is considered good, when
>>> it is not. What it does after that really depends the device, it may
>>> drive a pin for example (or an LED indicator in my case).
>>>
>>
>> It is much more likely that it connects to the reset signal on the board,
>> or it enables/disables power to parts of the board.
> 
> That's not what PMBus spec says about it:
> 
> """
> 15.32. POWER_GOOD Signal Limits
> For PMBus devices that offer a POWER_GOOD signal, these commands are used for
> setting the output voltage at which a power good signal should be asserted and negated.
> Power Good signals will be device and manufacturer specific. Many factors other than
> output voltage may be used to determine whether or not the POWER_GOOD signal is to
> be asserted. PMBus device users are instructed to consult the device manufacturer’s
> product literature for the specifics of the device they are using.
> """
> 
> It's only supposed to have an effect on the power_good signal, not the
> reset. I guess someone could wire that signal to a reset. Same could be
> done with the alert or the fault one, I suppose
> 

It doesn't say anything about the _use_ of that signal. The PMBus specification
says "Power Good signals will be device and manufacturer specific", and that
is exactly what it is. TPS25990 specifically states that the signal indicates
that it is ok for downstream chips to draw power, which is a very typical use.
The ability to connect it it to an LED does not reflect its core use.

>>
>>> It is very similar to 'crit' or other limits in that sense,
>>> I think. I don't really get why such property is not OK in hwmon then
>>> and why it should not be configurable, if the other limits are ?
>>>
>>
>> Its use is for hardware control, not monitoring, even if it may be connected
>> to a status LED. MAX15301, for example, groups the command under "Voltage
>> Sequencing Commands".
>>
>> On top of that, the voltages are value/hysteresis values. The "off" voltage
>> is lower than the "on" voltage.
>>
>> TPS25990 doesn't even support the command according to its datasheet, so I am
>> at loss about your use case in the context of this patch series (the PGOOD pin
>> on this chip signals to the downstream load that it is ok to draw
>> power).
> 
> It does support GOOD_OFF, althought TI renamed the register to
> VOUT_PGTH (Section 8.3.14.7.1.52, p87):
> 
> """
> VOUT_PGTH is a standard PMBus® command for setting or reading an 8-bit
> output voltage threshold at which Power Good (PGOOD) is be de-asserted.
> """
> 
Ah yes, typical for PMBus chips :-(. Why use standard register/command names
if one can rename them. It actually also states that pgood is asserted first
when the voltage reaches VOUT_PGTH + 250mV, so even with this chip it is
really a hysteresis.

> Same as the PMBus spec. Changing the value through this command does
> affect the signal as intented. How the signal is depends on the
> implementation. It just drives an LED on the EVM.
> 
Yes, but that doesn't make it a hardware _monitoring_ attribute.

Guenter


