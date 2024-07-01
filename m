Return-Path: <linux-i2c+bounces-4565-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D32ED91E9E1
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Jul 2024 22:55:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 026901C22D42
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Jul 2024 20:55:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAA01171647;
	Mon,  1 Jul 2024 20:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xxd7qAB1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9E81366;
	Mon,  1 Jul 2024 20:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719867312; cv=none; b=nLczsWIruSbjSh9CA+nPZ/SBkWi9RDXhjIQHbl5sbOv48Nhr4te3u2T5NEjsOPp04QNqSdzKzhxeMEGfUCwsAlOBKdAVvj7CI6KVzV7MZ1sJ1yvTAtEcGB8zoW5sS+/nebO87Z1HpbiFbqapYT/TXCdBvkQfX1/Yih9xMasDlgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719867312; c=relaxed/simple;
	bh=9iU/SuQ4vqVaMWoX0kXfoE/0xZ+Gk8JOWIA1ckCrc+Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bruAn5y1YtqU+uhskOgVlv2fSlotWUxto8oNazNtw9mvkEMzyZ6NTM2JwPUuyBhj7VdxXSB+Irqnl32wcdmq+coT+Pb0zl4rMHLWwFUqzes4W3e6ysgl+1oGc3iWw8XlW+pJ+jwMlrvknnRFvOoVWUK9rTU/KICVzQpbpBHa0fA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xxd7qAB1; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1fa244db0b2so25439165ad.3;
        Mon, 01 Jul 2024 13:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719867310; x=1720472110; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=6UJIwGbjuTzPgeomLnpR1xA+Rn0/pJ0dpm2pj83ozJ0=;
        b=Xxd7qAB192F0tUKjC+CJds1YB0w3H8ivvNF8Ev/ZmRuXqWPojSxXKRnL03INbNh8Uc
         bvcLrsbSBgA596WyJ99sWabazc+ofPIMmYAgN+CG+XozZjBx1ExvAPTd5qEQcp250dns
         h8t3p5gBZNy5nMCn5jnYZq+cZDVfie39FVkWoqeoq+Scp3t6Zm+IVJE97boKKm/O1xpw
         EPRSrdMVdTqorwM9MHdF8swrVY0ncD475ZMklxy6eK+SOdKJgmB70knGMQg1RdnsTn2x
         8CiU3RkImrM48hjEvoQI1Cr2Amh456rDDMrR2gJYCxVWfJdgQKTyiaN84wv16s6eepfk
         h4gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719867310; x=1720472110;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6UJIwGbjuTzPgeomLnpR1xA+Rn0/pJ0dpm2pj83ozJ0=;
        b=W5G2BiXQzCJ01P3wIJc9OYl+JQjzMqYmgkFfKl5Od6rANTG15O2NlXeuLH2/MdeYvz
         YECZ2MN48ihS5g09xy+GsIbPlRlmGgNYZ/UnSiEyngHBBGXX/a1FfXWwyX08IlDvg+xw
         pipX3ctlcIGc9EuPwI8NddsdpDnzjF7YasvSjmXbBdLLnbTX33qXAqj1B22+/19ftvwz
         92XwrpXLbwhQv1DxInedRSFuz2p06plYCXqNdYWaLLegGsprW6BnmVVtGqouuGb1Jhs3
         yqnfI2xzXZknhJnxX+FXD70QXhkYbTTS9/QyKl7B745jEo9rxHCRVZ1Jz5EHa/EgSBtf
         HCWw==
X-Forwarded-Encrypted: i=1; AJvYcCUyEFebkY3njASs56Wi+7oY7nWqbXTRJvkYg70v+hUviElVf415ANA1dkH3/E1t2JeCyGXBnX3trBO+GjyPFdelBE5gjMGIGFCcdq5u+cFBG0cjAgnK99veSovSDTcYT9MmIVQDL2vNs3YCgCvbqtI4MXlldC0hgAuJzvXNJdS+Kp4DFpz7D2utLQvNVWL8tcLNbdwpHr89WwKh0yB+73HKcGrTE1Qlag05bOVfRBV+eU8UmdabMrx5LGeA
X-Gm-Message-State: AOJu0Ywx34sjnCMW4mM1GezdID7+d3e5YRPO2CT4b7JLR2LFgheKGoYg
	t64x416E+hrYSYlPsP6IwpQGy1tVsRqgGfaTarotqa19uVFfgJGT
X-Google-Smtp-Source: AGHT+IH1DSJx107Qouhvh0PH/Fmqi2sNgPmCJiRKRKC2jroMTT0wrj6cTJGw2lGN1457ey38ZAPb4Q==
X-Received: by 2002:a17:902:e5cb:b0:1f6:6ef0:dae4 with SMTP id d9443c01a7336-1fadbca5bc3mr37116305ad.32.1719867309716;
        Mon, 01 Jul 2024 13:55:09 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac10d1577sm69449055ad.56.2024.07.01.13.55.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jul 2024 13:55:08 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <fa977e3d-d73e-41b5-9f97-1329d09d9986@roeck-us.net>
Date: Mon, 1 Jul 2024 13:55:06 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] hwmon: add MP5920 driver
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas@t-8ch.de>,
 Alex Vdovydchenko <keromvp@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sean Anderson <sean.anderson@linux.dev>,
 Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
 Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
 Alex Vdovydchenko <xzeol@yahoo.com>
References: <20240701145603.1507516-1-xzeol@yahoo.com>
 <20240701145603.1507516-3-xzeol@yahoo.com>
 <4fe460c7-4299-4e01-90f8-6720b7558ced@t-8ch.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <4fe460c7-4299-4e01-90f8-6720b7558ced@t-8ch.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/1/24 13:19, Thomas Weißschuh wrote:
> On 2024-07-01 17:56:01+0000, Alex Vdovydchenko wrote:
>> Add support for MPS Hot-Swap controller mp5920. This driver exposes
>> telemetry and limit value readings and writings.
>>
>> Signed-off-by: Alex Vdovydchenko <xzeol@yahoo.com>
>> ---
>>   Documentation/hwmon/index.rst  |  1 +
>>   Documentation/hwmon/mp5920.rst | 91 +++++++++++++++++++++++++++++++++
>>   drivers/hwmon/pmbus/Kconfig    |  9 ++++
>>   drivers/hwmon/pmbus/Makefile   |  1 +
>>   drivers/hwmon/pmbus/mp5920.c   | 93 ++++++++++++++++++++++++++++++++++
>>   5 files changed, 195 insertions(+)
>>   create mode 100644 Documentation/hwmon/mp5920.rst
>>   create mode 100644 drivers/hwmon/pmbus/mp5920.c
>>
>> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
>> index e92a3d5c7..9eba7e402 100644
>> --- a/Documentation/hwmon/index.rst
>> +++ b/Documentation/hwmon/index.rst
>> @@ -168,6 +168,7 @@ Hardware Monitoring Kernel Drivers
>>      mp2975
>>      mp2993
>>      mp5023
>> +   mp5920
>>      mp5990
>>      mp9941
>>      mpq8785
>> --- /dev/null
>> +++ b/Documentation/hwmon/mp5920.rst
>> @@ -0,0 +1,91 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +
>> +Kernel driver mp5920
>> +====================
>> +
>> +Supported chips:
>> +
>> +  * MPS MP5920
>> +
>> +    Prefix: 'mp5920'
>> +
>> +  * Datasheet
>> +
>> +    Publicly available at the MPS website : https://www.monolithicpower.com/en/mp5920.html
>> +
>> +Authors:
>> +
>> +	Tony Ao <tony_ao@wiwynn.com>
>> +	Alex Vdovydchenko <xzeol@yahoo.com>
>> +
>> +Description
>> +-----------
>> +
>> +This driver implements support for Monolithic Power Systems, Inc. (MPS)
>> +MP5920 Hot-Swap Controller.
>> +
>> +Device compliant with:
>> +
>> +- PMBus rev 1.3 interface.
>> +
>> +Device supports direct and linear format for reading input voltage,
>> +output voltage, output current, input power and temperature.
>> +
>> +The driver exports the following attributes via the 'sysfs' files
>> +for input voltage:
>> +
>> +**in1_input**
>> +
>> +**in1_label**
>> +
>> +**in1_rated_max**
>> +
>> +**in1_rated_min**
>> +
>> +**in1_crit**
>> +
>> +**in1_alarm**
>> +
>> +The driver provides the following attributes for output voltage:
>> +
>> +**in2_input**
>> +
>> +**in2_label**
>> +
>> +**in2_rated_max**
>> +
>> +**in2_rated_min**
>> +
>> +**in2_alarm**
>> +
>> +The driver provides the following attributes for output current:
>> +
>> +**curr1_input**
>> +
>> +**curr1_label**
>> +
>> +**curr1_crit**
>> +
>> +**curr1_alarm**
>> +
>> +**curr1_rated_max**
>> +
>> +The driver provides the following attributes for input power:
>> +
>> +**power1_input**
>> +
>> +**power1_label**
>> +
>> +**power1_max**
>> +
>> +**power1_rated_max**
>> +
>> +The driver provides the following attributes for temperature:
>> +
>> +**temp1_input**
>> +
>> +**temp1_max**
>> +
>> +**temp1_crit**
>> +
>> +**temp1_alarm**
>> --- a/drivers/hwmon/pmbus/Kconfig
>> +++ b/drivers/hwmon/pmbus/Kconfig
>> @@ -371,6 +371,15 @@ config SENSORS_MP5023
>>   	  This driver can also be built as a module. If so, the module will
>>   	  be called mp5023.
>>   
>> +config SENSORS_MP5920
>> +	tristate "MPS MP5920"
>> +	help
>> +	  If you say yes here you get hardware monitoring support for Monolithic
>> +	  MP5920.
>> +
>> +	  This driver can also be built as a module. If so, the module will
>> +	  be called mp5920.
>> +
>>   config SENSORS_MP5990
>>   	tristate "MPS MP5990"
>>   	help
>> --- a/drivers/hwmon/pmbus/Makefile
>> +++ b/drivers/hwmon/pmbus/Makefile
>> @@ -39,6 +39,7 @@ obj-$(CONFIG_SENSORS_MP2888)	+= mp2888.o
>>   obj-$(CONFIG_SENSORS_MP2975)	+= mp2975.o
>>   obj-$(CONFIG_SENSORS_MP2993)	+= mp2993.o
>>   obj-$(CONFIG_SENSORS_MP5023)	+= mp5023.o
>> +obj-$(CONFIG_SENSORS_MP5920)	+= mp5920.o
>>   obj-$(CONFIG_SENSORS_MP5990)	+= mp5990.o
>>   obj-$(CONFIG_SENSORS_MP9941)	+= mp9941.o
>>   obj-$(CONFIG_SENSORS_MPQ7932)	+= mpq7932.o
>> --- /dev/null
>> +++ b/drivers/hwmon/pmbus/mp5920.c
>> @@ -0,0 +1,82 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +#include <linux/i2c.h>
>> +#include <linux/module.h>
>> +#include <linux/of_device.h>
>> +#include "pmbus.h"
>> +
>> +static struct pmbus_driver_info mp5920_info = {
>> +	.pages = 1,
>> +	.format[PSC_VOLTAGE_IN] = direct,
>> +	.format[PSC_VOLTAGE_OUT] = direct,
>> +	.format[PSC_CURRENT_OUT] = direct,
>> +	.format[PSC_POWER] = direct,
>> +	.format[PSC_TEMPERATURE] = direct,
>> +	.m[PSC_VOLTAGE_IN] = 2266,
>> +	.b[PSC_VOLTAGE_IN] = 0,
>> +	.R[PSC_VOLTAGE_IN] = -1,
>> +	.m[PSC_VOLTAGE_OUT] = 2266,
>> +	.b[PSC_VOLTAGE_OUT] = 0,
>> +	.R[PSC_VOLTAGE_OUT] = -1,
>> +	.m[PSC_CURRENT_OUT] = 546,
>> +	.b[PSC_CURRENT_OUT] = 0,
>> +	.R[PSC_CURRENT_OUT] = -2,
>> +	.m[PSC_POWER] = 5840,
>> +	.b[PSC_POWER] = 0,
>> +	.R[PSC_POWER] = -3,
>> +	.m[PSC_TEMPERATURE] = 1067,
>> +	.b[PSC_TEMPERATURE] = 20500,
>> +	.R[PSC_TEMPERATURE] = -2,
>> +	.func[0] = PMBUS_HAVE_VIN  | PMBUS_HAVE_VOUT |
>> +		PMBUS_HAVE_IOUT | PMBUS_HAVE_POUT |
>> +		PMBUS_HAVE_TEMP,
>> +};
>> +
>> +static int mp5920_probe(struct i2c_client *client)
>> +{
>> +	struct device *dev =  &client->dev;
>> +	int ret;
>> +	u8 buf[I2C_SMBUS_BLOCK_MAX + 1];
>> +
>> +	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL, buf);
> 
> If you do keep a custom call to i2c_smbus_read_block_data(),
> then you probably should also keep the call to i2c_check_functionality().
> 
>> +	if (ret < 0) {
>> +		dev_err(dev, "Failed to read PMBUS_MFR_MODEL\n");
>> +		return ret;
>> +	}
> 
> If you use dev_err_probe() that would be shorter:
> 
> if (ret < 0)
> 	return dev_err_probe(dev, ret, "Failed to read PMBUS_MFR_MODEL\n");
> 
>> +	if (ret != 6 || strncmp(buf, "MP5920", 6)) {
>> +		buf[ret] = '\0';
>> +		dev_err(dev, "Model '%s' not supported\n", buf);
> 
> The manual 0-byte termination and the size + 1 can be avoided by using
> 
> dev_err_probe(dev, -ENODEV, "Model '%.*s' not supported\n", sizeof(buf), buf);
> 
>> +		return -ENODEV;
>> +	}
>> +
>> +	return pmbus_do_probe(client, &mp5920_info);
>> +}
>> +
>> +static const struct of_device_id mp5920_of_match[] = {
>> +	{ .compatible = "mps,mp5920" },
>> +	{ }
>> +};
>> +
>> +MODULE_DEVICE_TABLE(of, mp5920_of_match);
>> +
>> +static const struct i2c_device_id mp5920_id[] = {
>> +	{ "mp5920" },
>> +	{ }
>> +};
>> +
>> +MODULE_DEVICE_TABLE(i2c, mp5920_id);
>> +
>> +static struct i2c_driver mp5920_driver = {
>> +	.driver = {
>> +			.name = "mp5920",
>> +			},
> 
> Borked indentation.
> You can also use the shorter variant:
> 	.driver.name = "mp5920",
> 
> Where did the .driver.of_match_table go?
> 

I personally prefer the longer version, but, yes,
.driver.of_match_table disappeared. Good catch.

Thanks,
Guenter


