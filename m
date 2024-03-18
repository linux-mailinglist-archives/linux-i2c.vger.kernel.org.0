Return-Path: <linux-i2c+bounces-2389-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D770787EB9F
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Mar 2024 16:07:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 045231C211CB
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Mar 2024 15:07:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CA554F21D;
	Mon, 18 Mar 2024 15:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P2wOL8yA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D8D4F1FE;
	Mon, 18 Mar 2024 15:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710774417; cv=none; b=QxluAHnxm4D02rnrCqvarxBp6BfP1ycYcnlGqo55/K40h4vIYDZJlawquxlbhXCGm6s2ZiUzFlMBeU6HmLR3xpZ1gO/2GDlUTFGOG2pkpk+iq7GEycRH3kPTPiupKnVcQH1pzZG7Psvz5wu1UkViaby8dbiDi9c3Kz2LMKtdIHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710774417; c=relaxed/simple;
	bh=SgC2mW2vxp0vFPlgZBKa13e7UqzNpkW2LvsQ116+kWs=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=eJXPlB3GkCOM6K1jIeS7TIfl0cuPuOQWtlrHd6XAl36FeVj9dxB0vjJBQWndBFNgPPg8NnI7TPW6V+vQXe/7CkfgAOaBy5gbp8WHTFqG1tB7BWMTH9dnoPEJ6z/lQcHuLGDZrGs57xGun1SIAjgqiekp9uoxtOBOeKqhX+KFp5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P2wOL8yA; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6e6ee9e3cffso2648632b3a.1;
        Mon, 18 Mar 2024 08:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710774414; x=1711379214; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=/VvWitNIztWcjaqXApf9TAc9ZMsH6ahfMGiQBRxqCJM=;
        b=P2wOL8yAbAG7tt8/u/YNeFvQkYTCF6V1ceLW+9TED+A1zl4ceGIYJ/mMZE4zlkReOf
         wsKKcT66RM08hbXOVg9CEB53cXrJlliQA0SicZPVngIh6K5LWVkN20dYes7ZIYxuCRds
         skeYeFZgJo7PNKyY0+WXozSUkLjMQrHebs75L1r0jF0ZFaqA5KVWvXdFEhRyC41gF/xv
         AV82hiB0HCOi8uLtkaPCCUJWifKFqInCFr4MpTnxqrtyjKceNhYB/k6qL/bgrTvkAeng
         XqzJDUy/ScZ6gmkGBbsvIJqT9c77810sli6rpYr4fDgVjWsKEcL9nmj0a+vXLnfMHOvU
         p/xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710774414; x=1711379214;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/VvWitNIztWcjaqXApf9TAc9ZMsH6ahfMGiQBRxqCJM=;
        b=IfOgVBIyYxuIBh0dpfZ9iIOZqLI/FKtYqMlweAKaG953YyhgkJkVPDF89x1LmdrTEK
         FqHELZB4ExFZ73eglhqEZbqVNJ6VKxDRrosRW71jEab1vSRIn13VOlpE7L2KH4GAtNfC
         f9jk7GJpY5y64dyHMYOeoHSlLcEhf0/SRH6MJKjMidoQUK3GtfebbZj0j50Sf5PgaLM+
         52ny8JrkqiCrJtI4pGIvOrPE8fhfU7JG+R/LUhzdXFGEQ3aeWQYp2nTLQ5X/yqD4FYnv
         h3BFwewDuUqono2qFTqnsN/H1rzQzAoJOYfOkQ4GmHrsMDC/CFljC5N2BQw4+HMzVQCO
         X0kw==
X-Forwarded-Encrypted: i=1; AJvYcCXDaooKtIh/XCX87rVDG/povdrCx0gZak5U6UUxoqWZUzvQjCOuicpEWbryVfHN0SGs2dkJQzHcWBlhNiNEOdJWV84+e5r4LYzHdx8AKFap0Vg8ENaupzv2XP/jc5w1XKqhmcFG3IHTk/dZdsrHqaRNVR7FCvX607v5DWolnvBv4pxkFQYs7Dzj3ogGj/3Jbl/4pN6rSg3wzWruAdVHFi8ZhRYZaknyLz2C+eLraMw2DryW7V5TF8ucsRqF
X-Gm-Message-State: AOJu0Yw0O0dCv84sdyJ9mNlbRanoyPVO/E+zCMo+jqbHUw0rBLiHdK2j
	TCE1TwWeV3WSj+x1hQ3R2+IHT7pazUg/xpfu4uhIrVbH3XcZ/LO8n8tQtyep
X-Google-Smtp-Source: AGHT+IEZh5DK4VKGxJP7LbvfWh5bqcsV+iIJ1iWRMpK8MO74vsguPBSvmqbStW9ptmvLG4PVzh/loQ==
X-Received: by 2002:a05:6a20:d492:b0:1a3:639a:d546 with SMTP id im18-20020a056a20d49200b001a3639ad546mr5584811pzb.7.1710774414073;
        Mon, 18 Mar 2024 08:06:54 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id it16-20020a056a00459000b006e5667793d4sm7992384pfb.66.2024.03.18.08.06.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Mar 2024 08:06:53 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <a41480a8-057f-4865-84af-6e0e45003222@roeck-us.net>
Date: Mon, 18 Mar 2024 08:06:51 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] hwmon: pmbus: adp1050 : Add driver support
Content-Language: en-US
To: Radu Sabau <radu.sabau@analog.com>, Jean Delvare <jdelvare@suse.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20240318112140.385244-1-radu.sabau@analog.com>
 <20240318112140.385244-3-radu.sabau@analog.com>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20240318112140.385244-3-radu.sabau@analog.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/18/24 04:21, Radu Sabau wrote:
> Add support for ADP1050 Digital Controller for Isolated Power Supplies
> with PMBus interface Voltage, Current and Temperature Monitor.
> 
> The ADP1050 implements several features to enable a robust
> system of parallel and redundant operation for customers who
> require high availability. The device can measure voltage,
> current and temperature that can be used in different
> techniques to identify and safely shut down an erroneous
> power supply in parallel operation mode.
> 
> Signed-off-by: Radu Sabau <radu.sabau@analog.com>
> ---
>   Documentation/hwmon/adp1050.rst |  69 ++++++++++++++++++++
>   Documentation/hwmon/index.rst   |   1 +
>   drivers/hwmon/pmbus/Kconfig     |  10 +++
>   drivers/hwmon/pmbus/Makefile    |   1 +
>   drivers/hwmon/pmbus/adp1050.c   | 111 ++++++++++++++++++++++++++++++++
>   5 files changed, 192 insertions(+)
>   create mode 100644 Documentation/hwmon/adp1050.rst
>   create mode 100644 drivers/hwmon/pmbus/adp1050.c
> 
> diff --git a/Documentation/hwmon/adp1050.rst b/Documentation/hwmon/adp1050.rst
> new file mode 100644
> index 000000000000..e3e5bb650a51
> --- /dev/null
> +++ b/Documentation/hwmon/adp1050.rst
> @@ -0,0 +1,69 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +Kernel driver adp1050
> +=====================
> +
> +Supported chips:
> +
> +  * Analog Devices ADP1050
> +
> +    Prefix: 'adp1050'
> +
> +    Addresses scanned: I2C 0x70 - 0x77
> +
> +    Datasheet: https://www.analog.com/media/en/technical-documentation/data-
> +sheets/ADP1050.pdf
> +
> +Authors:
> +
> +  - Radu Sabau <radu.sabau@analog.com>
> +
> +
> +Description
> +-----------
> +
> +This driver supprts hardware monitoring for Analog Devices ADP1050 Digital
> +Controller for Isolated Power Supply with PMBus interface.
> +
> +The ADP1050 is an advanced digital controller with a PMBus™
> +interface targeting high density, high efficiency dc-to-dc power
> +conversion used to monitor system temperatures, voltages and currents.
> +Through the PMBus interface, the device can monitor input/output voltages,
> +input current and temperature.
> +
> +Usage Notes
> +-----------
> +
> +This driver does not auto-detect devices. You will have to instantiate
> +the devices explicitly.
> +Please see Documentation/i2c/instantiating-devices.rst for details.
> +
> +The vin scale monitor value and iin scale monitor value can be
> +configured by a device tree property;see
> +Documentation/devicetree/bindings/hwmon/pmbus/adi,adp1050.yaml for details
> +
> +Platform data support
> +---------------------
> +
> +The driver supports standard PMBus driver platform data.
> +
> +Sysfs Attributes
> +----------------
> +
> +================= ========================================
> +in1_label         "vin"
> +in1_input         Measured input voltage
> +in1_alarm	  Input voltage alarm
> +in2_label	  "vout1"
> +in2_input	  Measured output voltage
> +in2_crit	  Critical maximum output voltage
> +in2_crit_alarm    Output voltage high alarm
> +in2_lcrit	  Critical minimum output voltage
> +in2_lcrit_alarm	  Output voltage critical low alarm
> +curr1_label	  "iin"
> +curr1_input	  Measured input current.
> +curr1_alarm	  Input current alarm
> +temp1_input       Measured temperature
> +temp1_crit	  Critical high temperature
> +temp1_crit_alarm  Chip temperature critical high alarm
> +================= ========================================
> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
> index 1ca7a4fe1f8f..9a4fd576e6f6 100644
> --- a/Documentation/hwmon/index.rst
> +++ b/Documentation/hwmon/index.rst
> @@ -33,6 +33,7 @@ Hardware Monitoring Kernel Drivers
>      adm1266
>      adm1275
>      adm9240
> +   adp1050
>      ads7828
>      adt7410
>      adt7411
> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> index 557ae0c414b0..38e794d83cc3 100644
> --- a/drivers/hwmon/pmbus/Kconfig
> +++ b/drivers/hwmon/pmbus/Kconfig
> @@ -57,6 +57,16 @@ config SENSORS_ADM1275
>   	  This driver can also be built as a module. If so, the module will
>   	  be called adm1275.
>   
> +config SENSORS_ADP1050
> +	tristate "Analog Devices ADP1050 digital controller for Power Supplies"
> +	help
> +	  If you say yes here you get hardware monitoring support for Analog
> +	  Devices ADP1050 digital controller for isolated power supply with
> +	  PMBus interface.
> +
> +	  This driver can also be built as a module. If so, the module will
> +	  be called adp1050.
> +
>   config SENSORS_BEL_PFE
>   	tristate "Bel PFE Compatible Power Supplies"
>   	help
> diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
> index f14ecf03ad77..95a8dea5e5ed 100644
> --- a/drivers/hwmon/pmbus/Makefile
> +++ b/drivers/hwmon/pmbus/Makefile
> @@ -8,6 +8,7 @@ obj-$(CONFIG_SENSORS_PMBUS)	+= pmbus.o
>   obj-$(CONFIG_SENSORS_ACBEL_FSG032) += acbel-fsg032.o
>   obj-$(CONFIG_SENSORS_ADM1266)	+= adm1266.o
>   obj-$(CONFIG_SENSORS_ADM1275)	+= adm1275.o
> +obj-$(CONFIG_SENSORS_ADP1050)	+= adp1050.o
>   obj-$(CONFIG_SENSORS_BEL_PFE)	+= bel-pfe.o
>   obj-$(CONFIG_SENSORS_BPA_RS600)	+= bpa-rs600.o
>   obj-$(CONFIG_SENSORS_DELTA_AHE50DC_FAN) += delta-ahe50dc-fan.o
> diff --git a/drivers/hwmon/pmbus/adp1050.c b/drivers/hwmon/pmbus/adp1050.c
> new file mode 100644
> index 000000000000..53198d858156
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/adp1050.c
> @@ -0,0 +1,111 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Hardware monitoring driver for Analog Devices ADP1050
> + *
> + * Copyright (C) 2024 Analog Devices, Inc.
> + */
> +#include <linux/bits.h>
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include "pmbus.h"
> +
> +#define ADP1050_CHIP_PASSWORD		0xD7
> +
> +#define ADP1050_VIN_SCALE_MONITOR	0xD8
> +#define ADP1050_IIN_SCALE_MONITOR	0xD9
> +
> +static struct pmbus_driver_info adp1050_info = {
> +	.pages = 1,
> +	.format[PSC_VOLTAGE_IN] = linear,
> +	.format[PSC_VOLTAGE_OUT] = linear,
> +	.format[PSC_CURRENT_IN] = linear,
> +	.format[PSC_TEMPERATURE] = linear,
> +	.func[0] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
> +		| PMBUS_HAVE_VIN | PMBUS_HAVE_STATUS_INPUT
> +		| PMBUS_HAVE_IIN | PMBUS_HAVE_TEMP
> +		| PMBUS_HAVE_STATUS_TEMP,
> +};
> +
> +static int adp1050_probe(struct i2c_client *client)
> +{
> +	u32 vin_scale_monitor, iin_scale_monitor;
> +	int ret;
> +
> +	if (!i2c_check_functionality(client->adapter,
> +				     I2C_FUNC_SMBUS_WRITE_WORD_DATA))
> +		return -ENODEV;
> +
> +	/* Unlock CHIP's password in order to be able to read/write to it's
> +	 * VIN_SCALE and IIN_SCALE registers.
> +	*/
> +	ret = i2c_smbus_write_word_data(client, ADP1050_CHIP_PASSWORD, 0xFFFF);
> +	if (ret < 0) {
> +		dev_err_probe(&client->dev, "Device can't be unlocked.\n");
> +		return ret;
> +	}
> +

> +	ret = i2c_smbus_write_word_data(client, ADP1050_CHIP_PASSWORD, 0xFFFF);
> +	if (ret < 0) {
> +		dev_err_probe(&client->dev, "Device couldn't be unlocked.\n");
> +		return ret;
> +	}
> +

The datasheet says that the factory default password is 0xffff. What if it isn't ?
Refusing to instantiate the chip because it can't be unlocked seems a bit extreme.
After all, the password _can_ be changed.

> +	/* If adi,vin-scale-monitor isn't set or is set to 0 means that the
> +	 * VIN monitor isn't used, therefore 0 is used as scale in order
> +	 * for the readings to return 0.
> +	*/
> +	if (device_property_read_u32(&client->dev, "adi,vin-scale-monitor",
> +				     &vin_scale_monitor))
> +		vin_scale_monitor = 0;
> +
> +	/* If adi,iin-scale-monitor isn't set or is set to 0 means that the
> +	 * IIN monitor isn't used, therefore 0 is used as scale in order
> +	 * for the readings to return 0.
> +	*/
> +	if (device_property_read_u32(&client->dev, "adi,iin-scale-monitor",
> +				     &iin_scale_monitor))
> +		iin_scale_monitor = 0;
> +

I don't think the "-monitor" extensions in those property names
add any value.

> +	ret = i2c_smbus_write_word_data(client, ADP1050_VIN_SCALE_MONITOR,
> +					vin_scale_monitor);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = i2c_smbus_write_word_data(client, ADP1050_IIN_SCALE_MONITOR,
> +					iin_scale_monitor);
> +	if (ret < 0)
> +		return ret;
> +

If vin and iin monitoring is disabled on purpose, why still set
PMBUS_HAVE_VIN and PMBUS_HAVE_IIN above ? Reporting input values as 0
if the values are explicitly not monitored does not make sense to me.

I am puzzled about this to start with. Unless I am missing something,
the data sheet has no indication that VIN monitoring and/or IIN monitoring
is actually turned off if iin_scale/vin_scale are set to 0. Why support
the option to disable them ? That doesn't make sense to me. Please explain
how/when this makes sense. Please also explain why chip support is made
to depend on devicetree support. Register values may have been be set by
rommon/bios or (much more likely) by manufacturing, or users could just
want to keep the chip default. Why force-override it or even force-disable
it ?

Thanks,
Guenter


