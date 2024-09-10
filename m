Return-Path: <linux-i2c+bounces-6486-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59129973A0B
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 16:37:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 798A5B22B86
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 14:37:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1FF8194C88;
	Tue, 10 Sep 2024 14:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E+UaYLZU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10B2193078;
	Tue, 10 Sep 2024 14:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725979034; cv=none; b=OP0ekHNib1g5JLyKgleAUvbAkyzDUyd3xtNZXiGzRPU2DW+p9sQguyg2cQhD3o7CojGjX1cUxH5ZicqIZLz9ky0cpfyqFYduoEDZPleoJAMjjpiJgOMuiumHA2xEskMYbhrgXn+B7RsgDepSOQb4sch0fr++pTUiw69h5EpnIv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725979034; c=relaxed/simple;
	bh=UkpEjcVnV1c3yZo6STeTEZ1UskKk1O/pKERDH/fZHlA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NWTISt7jdEy8aiBoVcFNMikRkDnsFet1VWs+d85jRg+219FZbqM7S9HysRevE4CYGtIR2zO7X8312r3b0uMlc4EbvjpyLnXlYXsT2Rw3tLaVPFsNvaYmE0QcD1ho625S4cPCvyyJvSLIOGdHuTwvvGG4cNoKJml+7VAKNSgzhsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E+UaYLZU; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-7163489149eso4583566a12.1;
        Tue, 10 Sep 2024 07:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725979032; x=1726583832; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=7wxEWPWCpurTRGWlhmSAUwm6pvFdDON4ZVSHeESZ+AY=;
        b=E+UaYLZU70HgrWl9akYf1H4befroRswVMnU0Ao3CnBsqFnaXOvfPekL0oqPnWhFCRa
         Ihrxa8Cqbq4MSbgjQmlB5XNE/kZtgu/jaPVn5UAB6Ekl5umwhgRkdTqIgP0r+fGo84qi
         pJjzrK2s7fFyEJy60txzViNLJZKFwhD729Vfeh5+bl1ntLC1Zefdk4dqnDqcUdgAzV4B
         5TWFSWg3YFAgXtIRGUdtVnPIszrI/eDb93u4AkXzniDMbYHYnksBnJXcdA0mD1rAh04o
         XYfRoEDV2VzduNOo7kwKglJa7kZ4qSaXoMgsVqDNG7tBcZ06NMFgWnox2IdOHfTP6+Hu
         y+7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725979032; x=1726583832;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7wxEWPWCpurTRGWlhmSAUwm6pvFdDON4ZVSHeESZ+AY=;
        b=GRi9U2OyrcnQd1gBv5p0PeTvMi89O3UKPjRmQpzVuuwfl2oLYVvSSorhtiCgo79dWG
         xenTwtF3dwvhDMYQGmhnyYrOy1wJ+cgCzWVE3XppP0m/FV9Yt5QFcIMttOIuB64Cdo+L
         iBlVaFFF+0nTmLrnchIQnTSqODz3eU5nRoPXRUMhlgwCJDSbUNKdp+jHJfF0pBxfLAFm
         omN7WCWQE4j/KQuBmNb607lDL5AbI17U/WL7lmKBbN1KxFVmdvKEInC9g8+bcu5DXLCH
         psnZ4NBF3TukUPr81TVuVZKNIWMuk5ah5bN4T65FERDLP09YRs7G+T3oaXo2NZO9BlMa
         sqXg==
X-Forwarded-Encrypted: i=1; AJvYcCUjhBTvjH5wmZSrxtj/CgP5MhemYigmfQXOVhyOml/s0y8KMC+xCPqqRdCEUYp9bUvIpeZ8b0UcG1wy8B0=@vger.kernel.org, AJvYcCUms7ULJCC6DeqF9w0yjR6xNiSt8wDgYF6yHUx/6Co3mTN77/SEiFpeS/vv03iIA0VhEK0RAyWPPepl@vger.kernel.org, AJvYcCVPkMzz/Qt3W1fWaXf07b/RXslpYqTcrUOPvo90ZVcgwg/uytdRbawrIVVVb3+7kIllc9njxLkQ3m2Pm/J/@vger.kernel.org, AJvYcCWbM86hG4sWqQ6hCCZ5rx8CB9yMnAfsh9bhgnYnS0eQO6g6tfQmmD46Y+LLaBzucN851w1b7RHerlJU@vger.kernel.org, AJvYcCXQP2fB4RuvAZQd+FuyQov7kvqHiB9APTsrcjuv1dtvNYeIAmZErxglr/qZL+18B9IDZtQxjfqIwM5V@vger.kernel.org
X-Gm-Message-State: AOJu0YxuZgSwBHX4Ff98XTZrUZ1VwZ1LiwqbarhhzX5hK6OZ6xar9PE1
	zmVg4FwhncOOQYl0aILf6BeKgwqyDFDUOZZLP6GgjuefB/40UP51
X-Google-Smtp-Source: AGHT+IEHnslxU/kP3WqplqUKzYOZiiVO4SaK1nWy2kQgIqC7IrGUX0lv9ml1DhEp/SJdvYtq55rVZA==
X-Received: by 2002:a17:903:230c:b0:202:38d8:173 with SMTP id d9443c01a7336-2074c612f58mr15293745ad.29.1725979032013;
        Tue, 10 Sep 2024 07:37:12 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20710e34f73sm49669315ad.86.2024.09.10.07.37.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Sep 2024 07:37:11 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <08b6d9af-51b7-4eda-a4f6-62b688665fd9@roeck-us.net>
Date: Tue, 10 Sep 2024 07:37:09 -0700
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
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <1j8qw0t3ej.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/9/24 23:43, Jerome Brunet wrote:
> On Mon 09 Sep 2024 at 11:16, Guenter Roeck <linux@roeck-us.net> wrote:
> 
>> On 9/9/24 08:39, Jerome Brunet wrote:
>>> Add support for POWER_GOOD_ON and POWER_GOOD_OFF standard PMBus commands.
>>> For PMBus devices that offer a POWER_GOOD signal, these commands are used
>>> for setting the output voltage at which a power good signal should be
>>> asserted and negated.
>>> Power Good signals are device and manufacturer specific. Many factors
>>> other
>>> than output voltage may be used to determine whether or not the POWER_GOOD
>>> signal is to be asserted. PMBus device users are instructed to consult the
>>> device manufacturer’s product literature for the specifics of the device
>>> they are using.
>>> Note that depending on the choice of the device manufacturer that a
>>> device
>>> may drive a POWER_GOOD signal high or low to indicate that the signal is
>>> asserted.
>>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>>> ---
>>>    drivers/hwmon/pmbus/pmbus.h      | 3 +++
>>>    drivers/hwmon/pmbus/pmbus_core.c | 6 ++++++
>>>    2 files changed, 9 insertions(+)
>>> diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
>>> index 5d5dc774187b..e322d2dd9fb7 100644
>>> --- a/drivers/hwmon/pmbus/pmbus.h
>>> +++ b/drivers/hwmon/pmbus/pmbus.h
>>> @@ -78,6 +78,9 @@ enum pmbus_regs {
>>>    	PMBUS_IIN_OC_FAULT_LIMIT	= 0x5B,
>>>    	PMBUS_IIN_OC_WARN_LIMIT		= 0x5D,
>>>    +	PMBUS_POWER_GOOD_ON		= 0x5E,
>>> +	PMBUS_POWER_GOOD_OFF		= 0x5F,
>>> +
>>>    	PMBUS_POUT_OP_FAULT_LIMIT	= 0x68,
>>>    	PMBUS_POUT_OP_WARN_LIMIT	= 0x6A,
>>>    	PMBUS_PIN_OP_WARN_LIMIT		= 0x6B,
>>> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
>>> index 0ea6fe7eb17c..94ddf0166770 100644
>>> --- a/drivers/hwmon/pmbus/pmbus_core.c
>>> +++ b/drivers/hwmon/pmbus/pmbus_core.c
>>> @@ -1768,6 +1768,12 @@ static const struct pmbus_limit_attr vout_limit_attrs[] = {
>>>    		.attr = "crit",
>>>    		.alarm = "crit_alarm",
>>>    		.sbit = PB_VOLTAGE_OV_FAULT,
>>> +	}, {
>>> +		.reg = PMBUS_POWER_GOOD_ON,
>>> +		.attr = "good_on",
>>> +	}, {
>>> +		.reg = PMBUS_POWER_GOOD_OFF,
>>> +		.attr = "good_off",
>>>    	}, {
>>>    		.reg = PMBUS_VIRT_READ_VOUT_AVG,
>>>    		.update = true,
>>>
>>
>> Those attributes are not hardware monitoring attributes and therefore not
>> acceptable. In general I am not sure if they should be configurable in the
>> first place, but definitely not from the hardware monitoring subsystem.
>> Maybe the regulator subsystem callbacks set_over_voltage_protection and
>> set_under_voltage_protection would be appropriate (with severity
>> REGULATOR_SEVERITY_PROT), but that should be discussed with regulator
>> subsystem maintainers.
> 
> According to PMBUS spec, there is no protection associated with that
> command. It just tells when the output voltage is considered good, when
> it is not. What it does after that really depends the device, it may
> drive a pin for example (or an LED indicator in my case).
> 

It is much more likely that it connects to the reset signal on the board,
or it enables/disables power to parts of the board.

> It is very similar to 'crit' or other limits in that sense,
> I think. I don't really get why such property is not OK in hwmon then
> and why it should not be configurable, if the other limits are ?
> 

Its use is for hardware control, not monitoring, even if it may be connected
to a status LED. MAX15301, for example, groups the command under "Voltage
Sequencing Commands".

On top of that, the voltages are value/hysteresis values. The "off" voltage
is lower than the "on" voltage.

TPS25990 doesn't even support the command according to its datasheet, so I am
at loss about your use case in the context of this patch series (the PGOOD pin
on this chip signals to the downstream load that it is ok to draw power).

Guenter


