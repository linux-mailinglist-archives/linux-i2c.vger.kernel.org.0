Return-Path: <linux-i2c+bounces-8368-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C999E8073
	for <lists+linux-i2c@lfdr.de>; Sat,  7 Dec 2024 16:32:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3E853166667
	for <lists+linux-i2c@lfdr.de>; Sat,  7 Dec 2024 15:32:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 090F61487DD;
	Sat,  7 Dec 2024 15:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bql9EqFg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0364822C6C5;
	Sat,  7 Dec 2024 15:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733585569; cv=none; b=BJvSRE7hXTdCRNoJBd4PlqyDuKzX1dsn/Gv0ZkE0NjaQviHRzycqdfniKEZE5IrIYqC4SgX+L2cWi3xIkzXFN16gXqVO1a8asnR2RsXgdpQ6iiFEZGDnp6nK4lmGdu38ryxMlQm/JnPPY93CbKoFx15VIAMNq0FlJz2UMqyNqlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733585569; c=relaxed/simple;
	bh=HITJkO4C+1Xfts44Opq+JqvwIAdjhW/wBeocDlkju2A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ek0Y8E6uz2snMaIfjuLBLj55VUafs3V+0AE/bqV5iLzLpAIt++WrgXtnbf6ZeLB9BaKM+vUqv1yTPX2yFVdyztaLl2ZYAtARyDdIIInp7WKKDTOmoDKkOfN0DFnJPs+QhcH4PvZIWY3jXsPhp3c7kSiWVQaquzTYpTtifrvkrNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bql9EqFg; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-724ffe64923so3569433b3a.2;
        Sat, 07 Dec 2024 07:32:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733585567; x=1734190367; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=RR+JpgVax5G2RsoNZyJ+XE9olJgyNl9WyKKPAvaNLnc=;
        b=Bql9EqFgWT2ROd0AOGoYeF31nQ4C6B6RGztOhGWl8x8P73iNOP7Ub2jfk5cv7uBbMu
         ENbvC0K4MAcmE30/VIuJe1iPYT3ChLR1wd7SfO0e3gifI+u3Q9Mdx/AMhkElEMBAYCbn
         MH9O6y/+0/Sr8LbfPDOfM9F8wtg3Y/7ZDjPlsO/RVN2fnUrnlqFhO1y0+IVl1xQwf8VT
         43csYopVT9XPxSQmALjIiMQIpN+MJv/QbnOGgebD5zEp64IWf/in5Rg/HuDkuOpb0CGp
         zXunivYno4Hma1scLNM89rd5Olx4QuemttYzudhhoEnBIf5eIYVrPQjFsyTZl7IUdwki
         RJmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733585567; x=1734190367;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RR+JpgVax5G2RsoNZyJ+XE9olJgyNl9WyKKPAvaNLnc=;
        b=LVq9SgL3NV+cdEOY2JKE4qgmpYx/lwQq0d69d0o3ec+mL4MpIMU+hjTQijVxM9yMuN
         x2fl6qQ3G4XFzzQTSBYo9/tKm2egXM5e9eucaQZQHl2Zx7qAmzXinwwSq6hdxl9xFPwo
         EePFdiMu/OeoPklHETn8hGvmpZ0DGHDalS68Df9jGUznfyf0GdNn+uSdxbxkvcTF/wGc
         WvxyJaT7EE+erbxkVeegz48SFVR74c9SvryGS0TZnvnik4YzBrAbqs8tj+nezJ9Qnzco
         sFp6joL5T+DSU73TIVXRiXn7o4k0LxjOxvtQ2bYL/C1FhguUj1xOwDqfkgjC1GXSLi+B
         W0EQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhfHvfGNK0Pco5Eb23ebMhPSHdscYJ7NFZFmCuCIemKhU1YmLegCkty23GARywyQqbbSnSJ7uOV0gXUQ==@vger.kernel.org, AJvYcCXA51FsDQN8fGYAISjy4+sZFY6w+6Bw/lY0PirghtYiuok+yQZV61irhnA2xgU5FUwdmZCiVV4NfGn6@vger.kernel.org
X-Gm-Message-State: AOJu0Ywtyp/GMFSpW84RV++X0X7eb1St1rw1xcgriJFWXbjt/ePs49rm
	TCO7F4/9sm+OyB8Q4/fqGsQSNlBnEBIrCvwv0wR71ToPZHpLw01Q6H+XBQ==
X-Gm-Gg: ASbGncsTU7uDyCBrKA1ALavn0A3mWo/a14i5JumiKsvBglpJvFPs3MISsMvy7yFv7x6
	bhxAx510pJOu76r3fY25tjvwbjRSg04oRNQnG+3JnRP9dn4qB35GjDEUfUmpgRmWbxmfHLAU6DT
	XO6/VtVxAFSEhV9bZ58Itufh2se3zumKPSr8viqCJAB+XIF1NnnBU4QN3LhUUvfjuXjXgezyoyM
	tB84vfHnFHTm8MPWm/6FvDCAybLtcuS+qpVXLcsCsXb/iJHMVpaRUh046DhbsemRdHPI7F6osQZ
	sFBF+uesMKxQdyXZOyhZow4=
X-Google-Smtp-Source: AGHT+IEd42+GUjdRzNJTe8ov3IKpElwin0jd2vV5IpB3M3M8A4wRxvhK2NitelrDWguF+ffBT+6ySg==
X-Received: by 2002:a05:6a20:6a1b:b0:1e0:be48:177d with SMTP id adf61e73a8af0-1e1870aea0fmr12572133637.3.1733585567200;
        Sat, 07 Dec 2024 07:32:47 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fd413c315esm467775a12.34.2024.12.07.07.32.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Dec 2024 07:32:46 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <403cc23e-db63-4091-932d-0ec82a32c52b@roeck-us.net>
Date: Sat, 7 Dec 2024 07:32:43 -0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: Initialize i2c_device_id structures by name
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
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
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Konstantin Aladyshev <aladyshev22@gmail.com>,
 Patrick Rudolph <patrick.rudolph@9elements.com>,
 Eddie James <eajames@linux.ibm.com>, Lakshmi Yadlapati
 <lakshmiy@us.ibm.com>, linux-i2c@vger.kernel.org
References: <20241205152833.1788679-2-u.kleine-koenig@baylibre.com>
 <89b8d605-c5ac-490f-977d-76315d6d5f46@roeck-us.net>
 <3qfvfqjp53yhfaf327rqyxzrrxrataawubetwcipv5dmrplsez@pe2ressulfxp>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <3qfvfqjp53yhfaf327rqyxzrrxrataawubetwcipv5dmrplsez@pe2ressulfxp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/7/24 01:13, Uwe Kleine-König wrote:
> Hello Guenter,
> 
> [dropped Jose Ramon San Buenaventura from Cc: who's address bounced]
> 
> On Thu, Dec 05, 2024 at 08:27:15AM -0800, Guenter Roeck wrote:
>> On Thu, Dec 05, 2024 at 04:28:33PM +0100, Uwe Kleine-König wrote:
>>> I intend to change the definition of struct i2c_device_id to look as
>>> follows:
>>>
>>>          struct i2c_device_id {
>>>                 char name[I2C_NAME_SIZE];
>>>                 /* Data private to the driver */
>>>                 union {
>>>                         kernel_ulong_t driver_data;
>>>                         const void *driver_data_ptr;
>>>                 };
>>>          };
>>>
>>> That the initializers for these structures also work with this new
>>> definition, they must use named members.
>>>
>>> The motivation for that change is to be able to drop many casts from
>>> pointer to kernel_ulong_t. So once the definition is updated,
>>> initializers that today use:
>>>
>>> 	{"adp4000", (kernel_ulong_t)&pmbus_info_one},
>>>
>>> can be changed to
>>>
>>>          { .name = "adp4000", .driver_data_ptr = &pmbus_info_one },
>>>
>>
>> How about introducing a macro for that instead, similar to I3C_DEVICE() ?
> 
> OK, for now we'd have then:
> 
> 	#define I2C_DEVICE_ID_PTR(_name, _driver_data_ptr)	\
> 		{ .name = (_name), .driver_data = (kernel_ulong_t)_driver_data_ptr }
> 
> 	#define I2C_DEVICE_ID_ULONG(_name, _driver_data)	\
> 		{ .name = (_name), .driver_data = _driver_data }
> 
> plus maybe:
> 
> 	#define I2C_DEVICE_ID(_name)	\
> 		{ .name = (_name) }
> 
> for the drivers that don't need driver data?
> 

Something like that, though I'd even hide the parameter type and just have

	#define I2C_DEVICE_ID_DATA(_name, _data)	\
		{ .name = (_name), .driver_data = (kernel_ulong_t)_data }

	#define I2C_DEVICE_ID(_name)	\
		{ .name = (_name) }

where I2C_DEVICE_ID_DATA() would accept any type.

> When all drivers are converted accordingly, we could change the
> definition of i2c_device_id in a commit that only touches i2c core
> things to introduce the stronger type checking.

The stronger type checking would not be possible with that, though.
Does that really add value ? I personally prefer the opaque style where
driver users can provide (almost) any type they want/need.

Thanks,
Guenter

