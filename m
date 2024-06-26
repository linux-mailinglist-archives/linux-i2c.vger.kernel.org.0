Return-Path: <linux-i2c+bounces-4382-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB7291877A
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jun 2024 18:34:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D3A09B24FDE
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jun 2024 16:25:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 483DE18EFF6;
	Wed, 26 Jun 2024 16:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DjUTPaiz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E23D18E748;
	Wed, 26 Jun 2024 16:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719419117; cv=none; b=R7izLH5KnBq7WUkISwpxboDGogKX7OOGOT870QJvmfLQ5NwrbO8HuoGYhAoIbBKwmwyplovgwnC3+HHA1GLgHzrw2NJte9IVqxDhaHlX65KKMagmycRgDi9BsZ5Fncm4ZcfqR8uq/ICOtb0Ku1oVLfYQEVMxS+sEelzmKF0kcW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719419117; c=relaxed/simple;
	bh=ggR9OUkv6n9Uao5V1JPt4joQ1Y/bFJzJndk4jmqEBM8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O+xJ9bKAehiYqqcK7nufqwEVYPi/3NVTpgQ6bSONVWsb6YBEHekJL6nxNUAlad6UmfsLsPG7lIh04Jqvacuhet7roaIfLrVgdcZRj2/QlvK0ReCxtAL59cuTNDwaOWRZxdPb6QQWnt0rHAEa7Qp6Fp7sbiUAYDdb88eAF/GgUmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DjUTPaiz; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1f480624d0fso55123935ad.1;
        Wed, 26 Jun 2024 09:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719419114; x=1720023914; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=xKaHSHDAstECmX9YsonrrOznKMZQa6FFUjDl2vRb8lY=;
        b=DjUTPaiz7CTO1l+5JrBlnFDy34Pt92Dmgf1rQZK9zCYr7JkamFvlal5o0nYHL6T4xw
         DO3rJ+YtyNGvij0PCVPRKvoxyfEwmJTiu5QfoecNK1j7hn367xZ9ACn/NMF1/6mQckLA
         x/cgzjGb9+KFXLKBIksZDXzBu66kpP/NoT7nJc96I4imfVMNaxIDQoHYgOfPMJT8o/fe
         jd1ZoWiqK0T69oGmybztu7hnUyq8JDBytOVPK+KWzl3CeIt/rgAiVL4mhqYkLO1835HS
         FKzusLoapdhQQ6GgtG59VsuZO9EmC78ljXdxIROtqF9oC6j8RgJaQc/OA1myeiqiqxHw
         6NDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719419114; x=1720023914;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xKaHSHDAstECmX9YsonrrOznKMZQa6FFUjDl2vRb8lY=;
        b=rGCQ6cYTke0GoEii6JIM78JKa2k2x/FaCr7i4FC0D+emooIf6aUszNgg+fsIf1lKM9
         ZTyxZNXLVRW8y8JSkPMNgevu4HE6XwNDWhq5Z/LVkOzRXY3qFqEKgWeQ1f2eGxWKJaZg
         cyU9ZkbZ/INdpqJO8rNF/eD/nbEPcsXk/hBfK+mphhOTiQkkM6Cd7uyGA/HKEqq2ZTze
         dCR0W0q4NApHLVej52wXm1f81/JCRuQAXmBv+qcPaXH7ENAy/fogVE1kKzyucEGIVhdx
         Zoabeqjtx5oD0ruKVkCCcRvX5S6guqQkGt/ddVBRtQ13EI6GdyxdhQNQ8xuKqM4Cf8dN
         OBCw==
X-Forwarded-Encrypted: i=1; AJvYcCUbqbJKcaKH5WMtc/XtbyQhGZAZRHQ4B1qVS/XPBlY7X7UQFEGae8fPDeUEk/iplC2z7Sqirse33zsG7V4uXHDqlUuqikgS2H5cNfQ9jmDjVbSEtiQLXzsfNVVIcFS7pqCcU2erLJ2gOKHbePp17rKlkn1Gwci45VVrWlJErzvDNTWVJiRU1gVP5XVtRTCL0Q9ga2y/Dy7+5Z3ryM2bDoI=
X-Gm-Message-State: AOJu0YyCWxDqxbkK54yPJ1eQa1H77+vJb+Y7wbQs0yRRTbV/9qR+V8Ij
	HWR2UL2ypqGuT6+rPyld5hAoIEnjWVyD4glL9mfeeQI7cC3mxu/e
X-Google-Smtp-Source: AGHT+IE4F1gTMJ87/HyLHM0OKKoQSygLkRslMekBU/I70HJ61Ovis6kXvkAxp5EKTn2Giy7ovgH1aQ==
X-Received: by 2002:a17:902:f54c:b0:1f6:225e:67a1 with SMTP id d9443c01a7336-1fa2413cddemr129709585ad.56.1719419114302;
        Wed, 26 Jun 2024 09:25:14 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9eb32b9edsm101435165ad.118.2024.06.26.09.25.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jun 2024 09:25:13 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <05b7ac27-2faf-4038-9d96-ec82dbdd8c94@roeck-us.net>
Date: Wed, 26 Jun 2024 09:25:11 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] hwmon: add MP5920 driver
To: Alex Vdovydchenko <keromvp@gmail.com>, Jean Delvare <jdelvare@suse.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
Cc: Alex Vdovydchenko <xzeol@yahoo.com>, linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org
References: <20240626142439.1407175-1-xzeol@yahoo.com>
 <20240626142439.1407175-3-xzeol@yahoo.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20240626142439.1407175-3-xzeol@yahoo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/26/24 07:24, Alex Vdovydchenko wrote:
> Add support for MPS Hot-Swap controller mp5920. This driver exposes
> telemetry and limits value readings and writtings.

limit

writings

> 

Is there a patch 1/2 and/or a summary patch ?

> Signed-off-by: Alex Vdovydchenko <xzeol@yahoo.com>
> ---
>   Documentation/hwmon/index.rst  |  1 +
>   Documentation/hwmon/mp5920.rst | 91 +++++++++++++++++++++++++++++++++
>   drivers/hwmon/pmbus/Kconfig    |  9 ++++
>   drivers/hwmon/pmbus/Makefile   |  1 +
>   drivers/hwmon/pmbus/mp5920.c   | 93 ++++++++++++++++++++++++++++++++++
>   5 files changed, 195 insertions(+)
>   create mode 100644 Documentation/hwmon/mp5920.rst
>   create mode 100644 drivers/hwmon/pmbus/mp5920.c
> 
> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
> index e92a3d5c7..9eba7e402 100644
> --- a/Documentation/hwmon/index.rst
> +++ b/Documentation/hwmon/index.rst
> @@ -168,6 +168,7 @@ Hardware Monitoring Kernel Drivers
>      mp2975
>      mp2993
>      mp5023
> +   mp5920
>      mp5990
>      mp9941
>      mpq8785
> diff --git a/Documentation/hwmon/mp5920.rst b/Documentation/hwmon/mp5920.rst
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/hwmon/mp5920.rst
> @@ -0,0 +1,91 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +Kernel driver mp5920
> +====================
> +
> +Supported chips:
> +
> +  * MPS MP5920
> +
> +    Prefix: 'mp5920'
> +
> +  * Datasheet
> +
> +    Publicly available at the MPS website : https://www.monolithicpower.com/en/mp5920.html
> +
> +Authors:
> +
> +	Tony Ao <tony_ao@wiwynn.com>
> +	Alex Vdovydchenko <xzeol@yahoo.com>
> +
> +Description
> +-----------
> +
> +This driver implements support for Monolithic Power Systems, Inc. (MPS)
> +MP5920 Hot-Swap Controller.
> +
> +Device compliant with:
> +
> +- PMBus rev 1.3 interface.
> +
> +Device supports direct and linear format for reading input voltage,
> +output voltage, output current, input power and temperature.
> +
> +The driver exports the following attributes via the 'sysfs' files
> +for input voltage:
> +
> +**in1_input**
> +
> +**in1_label**
> +
> +**in1_rated_max**
> +
> +**in1_rated_min**
> +
> +**in1_crit**
> +
> +**in1_alarm**
> +
> +The driver provides the following attributes for output voltage:
> +
> +**in2_input**
> +
> +**in2_label**
> +
> +**in2_rated_max**
> +
> +**in2_rated_min**
> +
> +**in2_alarm**
> +
> +The driver provides the following attributes for output current:
> +
> +**curr1_input**
> +
> +**curr1_label**
> +
> +**curr1_crit**
> +
> +**curr1_alarm**
> +
> +**curr1_rated_max**
> +
> +The driver provides the following attributes for input power:
> +
> +**power1_input**
> +
> +**power1_label**
> +
> +**power1_max**
> +
> +**power1_rated_max**
> +
> +The driver provides the following attributes for temperature:
> +
> +**temp1_input**
> +
> +**temp1_max**
> +
> +**temp1_crit**
> +
> +**temp1_alarm**
> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> --- a/drivers/hwmon/pmbus/Kconfig
> +++ b/drivers/hwmon/pmbus/Kconfig
> @@ -371,6 +371,15 @@ config SENSORS_MP5023
>   	  This driver can also be built as a module. If so, the module will
>   	  be called mp5023.
>   
> +config SENSORS_MP5920
> +	tristate "MPS MP5920"
> +	help
> +	  If you say yes here you get hardware monitoring support for Monolithic
> +	  MP5920.
> +
> +	  This driver can also be built as a module. If so, the module will
> +	  be called mp5920.
> +
>   config SENSORS_MP5990
>   	tristate "MPS MP5990"
>   	help
> diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
> --- a/drivers/hwmon/pmbus/Makefile
> +++ b/drivers/hwmon/pmbus/Makefile
> @@ -39,6 +39,7 @@ obj-$(CONFIG_SENSORS_MP2888)	+= mp2888.o
>   obj-$(CONFIG_SENSORS_MP2975)	+= mp2975.o
>   obj-$(CONFIG_SENSORS_MP2993)	+= mp2993.o
>   obj-$(CONFIG_SENSORS_MP5023)	+= mp5023.o
> +obj-$(CONFIG_SENSORS_MP5920)	+= mp5920.o
>   obj-$(CONFIG_SENSORS_MP5990)	+= mp5990.o
>   obj-$(CONFIG_SENSORS_MP9941)	+= mp9941.o
>   obj-$(CONFIG_SENSORS_MPQ7932)	+= mpq7932.o
> diff --git a/drivers/hwmon/pmbus/mp5920.c b/drivers/hwmon/pmbus/mp5920.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/mp5920.c
> @@ -0,0 +1,95 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Hardware monitoring driver for MP5920 and compatible chips.
> + *
> + * Copyright (c) 2019 Facebook Inc.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
> + * GNU General Public License for more details.

This blob is unnecessary; it is covered by the SPDX license reference above.

> + */
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/init.h>
> +#include <linux/jiffies.h>

Not needed or used.

> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include "pmbus.h"
> +
> +static struct pmbus_driver_info mp5920_info = {
> +	pages = 1,
> +	format[PSC_VOLTAGE_IN] = direct,
> +	format[PSC_VOLTAGE_OUT] = direct,
> +	format[PSC_CURRENT_OUT] = direct,
> +	format[PSC_POWER] = direct,
> +	format[PSC_TEMPERATURE] = direct,
> +	m[PSC_VOLTAGE_IN] = 2266,
> +	b[PSC_VOLTAGE_IN] = 0,
> +	R[PSC_VOLTAGE_IN] = -1,
> +	m[PSC_VOLTAGE_OUT] = 2266,
> +	b[PSC_VOLTAGE_OUT] = 0,
> +	R[PSC_VOLTAGE_OUT] = -1,
> +	m[PSC_CURRENT_OUT] = 546,
> +	b[PSC_CURRENT_OUT] = 0,
> +	R[PSC_CURRENT_OUT] = -2,
> +	m[PSC_POWER] = 5840,
> +	b[PSC_POWER] = 0,
> +	R[PSC_POWER] = -3,
> +	m[PSC_TEMPERATURE] = 1067,
> +	b[PSC_TEMPERATURE] = 20500,
> +	R[PSC_TEMPERATURE] = -2,
> +	func[0] = PMBUS_HAVE_VIN  | PMBUS_HAVE_VOUT |
> +		PMBUS_HAVE_IOUT | PMBUS_HAVE_POUT |
> +		PMBUS_HAVE_TEMP,
> +};
> +
> +static int mp5920_probe(struct i2c_client *client)
> +{
> +	struct device *dev =  &client->dev;
> +	int chip_id;
> +
> +	if (!i2c_check_functionality(client->adapter,
> +				     I2C_FUNC_SMBUS_READ_WORD_DATA))
> +		return -ENODEV;
> +
> +	chip_id = i2c_smbus_read_word_data(client, PMBUS_MFR_ID);
> +	if (chip_id < 0) {
> +		dev_err(dev, "Failed to read MFR ID");
> +		return chip_id;
> +	}

What is the point of reading the chip ID without doing anything with it ?

> +
> +	return pmbus_do_probe(client, &mp5920_info);
> +}
> +
> +static const struct of_device_id mp5920_of_match[] = {
> +	{ .compatible = "mps,mp5920" },
> +	{}
> +};
> +
> +static const struct i2c_device_id mp5920_id[] = {
> +	{"mp5920", 0},
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, mp5920_id);
> +
> +static struct i2c_driver mp5920_driver = {
> +	.driver = {
> +		.name = "mp5920",
> +		.of_match_table = mp5920_of_match,
> +	},
> +	.probe = mp5920_probe,
> +	.id_table = mp5920_id,
> +};
> +module_i2c_driver(mp5920_driver);
> +
> +MODULE_AUTHOR("Tony Ao <tony_ao@wiwynn.com>");
> +MODULE_AUTHOR("Alex Vdovydchenko <xzeol@yahoo.com>");
> +MODULE_DESCRIPTION("PMBus driver for MP5920 HSC");
> +MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS(PMBUS);


