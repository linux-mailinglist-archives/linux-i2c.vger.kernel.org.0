Return-Path: <linux-i2c+bounces-7817-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 844A79BDDF4
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2024 05:31:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9011C1C2266E
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2024 04:31:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA993176FA4;
	Wed,  6 Nov 2024 04:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gVI4xOzQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A5776035;
	Wed,  6 Nov 2024 04:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730867511; cv=none; b=euABFfzFrCRZTSYpy4tYCOq2SYGv3aSeMK3YjieqJRV6QoMZITIUMAj+Jd4ktmkvoMlRahM4dxQaD2GMCQjYYLqwFVEfxX4HOycUaY0ym6dZDo+s4Ijmty39JKEML2mkcUd9kGL+nRaGiApkADIts2ADrlgltXY1HlMh9mMT7H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730867511; c=relaxed/simple;
	bh=BFBhWaVJ1NjTVIuUBgpSEuRZGb9akHwornbYVvqwOls=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SCpCdgi9fqqAkTWWhI3wxGxYuy1ECZoY6YRGPgVEtQXxdZzReZthCFihhGnkOf1ua5kD8mzli3RctA74vQQ1/s/wHuS1Ps5qdIYFK3DZtCJYsIonQT1lS9YDN66fCT3oaMhSgWWwMu1fJZZnvLk3KQDc5qpzjUWLtfQTtj0t8Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gVI4xOzQ; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2e2ad9825a7so4563873a91.0;
        Tue, 05 Nov 2024 20:31:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730867509; x=1731472309; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=42QNibVxGN8majzaOkdnUDSaQ6NUZm9iELyp49h2R9Y=;
        b=gVI4xOzQESCkymBEUJ0XXeZgjM86jNCrbBJEFZrw5S4sLyYIpEBf6ccDsiUr5deb/G
         0uxvDn+Q3ZUl1nH5KzAnaNO4sv00OMqSrH/0q1WA+rVYIyJouAF/Zgmxel5SMpgPJztm
         6ZIBNGlF3DXpWJv6uacokC4yv6mJQHWzvBjDAVUkydGLk94gy7TMXroe3UuV0FSYA2A+
         B1/jjQHiHtijzmKunexDKBXBi3DO/bhNgeOhg/tnpK+qSBdz+n1jHGuWML2IAI1GClYU
         Lp7cObvDO7fRIUvzNWXDSdvpK5kcUFMRtH/5qeOYmKd8d8ZLK0sacLKii2b3FF4iKQaT
         sTBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730867509; x=1731472309;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=42QNibVxGN8majzaOkdnUDSaQ6NUZm9iELyp49h2R9Y=;
        b=f3o3xvpyf9I2Imy9JZtyWTUCPXDjsy4Vp7xELpWzOfsrdxyRUCgG2h4eOM/k0t5H/I
         fMlx/9+1bP4jRgo58e1i5J0GOLO2PjqbmgXvkM2Ty+MeijvVNRZD1E7X13TDbEaUrkHJ
         recW+0rrZr7bn7BGFaMTIwi/oEw4isQSKIyHehCOYmKwmNRyfPdQbCGsYa6ia6ZubKsv
         pHAsAysjvmBbIfsVLUrVVoNL5MQh+7euJ60ePM/reWoH7w5nKYRI8qe1bQ012MvwcA/0
         q1rjFS1kManfvDnf4dQCXAk8jwU8ZYtHw5J90XLJzRxA/tZf8krcoEHo/ly5fVPvJvMA
         kz3w==
X-Forwarded-Encrypted: i=1; AJvYcCUohup/RpMWSO4wVXXz1QTzaybpOu5lYP4TQy7sZ6PxCNdvoBfVHBP0SEbzlXGRTSgl81v3Pzmdonl7@vger.kernel.org, AJvYcCWCZKzBpY5ipLewX/++sPH/EJ1x8HC1cv4vUx7N7DHE3e6d3HMt+eMy4OimKbBOg8M+AKS9wMpVS2BOPhk=@vger.kernel.org, AJvYcCWG/EcVlhXG46lH7dITW8vvvmZbL9GW6SS5/1PzxKahcaPadDrGRh1pc6lWFSu2jqMHy8HBf8zRKQ9O@vger.kernel.org, AJvYcCXVQK0jhXTI/TEqqLBZVuplvmcOcjPOGzCjl4r1irX87NBUJ4Xt88hX5OywCdI2WPXmuMYlqx7GOqau@vger.kernel.org, AJvYcCXojAn7GfhIylIpSSm0AyLsxHO/KVHx2hhTcbMgLisZcx6jzNBLbKVZdtaR4NMW9JVOIuOwad/b6TrAhQnb@vger.kernel.org
X-Gm-Message-State: AOJu0YzyAvEUpv0acMWCgtM+s1l3QD2meJqWm2j1vgI7VQTs5KyKyNX3
	lGCG0mqnUjviKG1zumgxBK4xtc4n0hF/bNRJ/yuBmG5gR4nedU2o
X-Google-Smtp-Source: AGHT+IHG6rXVDFwm4UcyLMcVXxwbRdXpaDtRZ7anYDuhGOjHa+Jxpgfj++Ls2RbGHfZqkr4a/1NHfQ==
X-Received: by 2002:a17:90a:4e0a:b0:2cc:ef14:89e3 with SMTP id 98e67ed59e1d1-2e8f1071ca9mr41122947a91.15.1730867508805;
        Tue, 05 Nov 2024 20:31:48 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e99a54eddesm427187a91.13.2024.11.05.20.31.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Nov 2024 20:31:48 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <d016c2e5-2ebe-45cb-a62e-25f8b8d3a1b9@roeck-us.net>
Date: Tue, 5 Nov 2024 20:31:46 -0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] hwmon: pmbus: add driver for ltp8800-1a,
 ltp8800-4a, and ltp8800-2
To: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-hwmon@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
 Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Peter Yin <peteryin.openbmc@gmail.com>,
 Noah Wang <noahwang.wang@outlook.com>, Marek Vasut <marex@denx.de>,
 Lukas Wunner <lukas@wunner.de>
References: <20241106030918.24849-1-cedricjustine.encarnacion@analog.com>
 <20241106030918.24849-3-cedricjustine.encarnacion@analog.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20241106030918.24849-3-cedricjustine.encarnacion@analog.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/5/24 19:09, Cedric Encarnacion wrote:
> LTP8800-1A 54V, 150A DC/DC µModule Regulator with PMBus Interface
> LTP8800-4A 54V, 200A DC/DC µModule Regulator with PMBus Interface
> LTP8800-2 54V, 135A DC/DC μModule Regulator with PMBus Interface
> 
> The LTP8800 is a family of step-down μModule regulators that provides
> microprocessor core voltage from 54V power distribution architecture. It
> features telemetry monitoring of input/output voltage, input current,
> output power, and temperature over PMBus.
> 
> Signed-off-by: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>
> ---
>   Documentation/hwmon/index.rst   |  1 +
>   Documentation/hwmon/ltp8800.rst | 91 +++++++++++++++++++++++++++++++++
>   MAINTAINERS                     |  2 +
>   drivers/hwmon/pmbus/Kconfig     | 18 +++++++
>   drivers/hwmon/pmbus/Makefile    |  1 +
>   drivers/hwmon/pmbus/ltp8800.c   | 63 +++++++++++++++++++++++
>   6 files changed, 176 insertions(+)
>   create mode 100644 Documentation/hwmon/ltp8800.rst
>   create mode 100644 drivers/hwmon/pmbus/ltp8800.c
> 
> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
> index 55f1111594b2..8e6799824859 100644
> --- a/Documentation/hwmon/index.rst
> +++ b/Documentation/hwmon/index.rst
> @@ -136,6 +136,7 @@ Hardware Monitoring Kernel Drivers
>      ltc4261
>      ltc4282
>      ltc4286
> +   ltp8800
>      max127
>      max15301
>      max16064
> diff --git a/Documentation/hwmon/ltp8800.rst b/Documentation/hwmon/ltp8800.rst
> new file mode 100644
> index 000000000000..bbe1b4a7c827
> --- /dev/null
> +++ b/Documentation/hwmon/ltp8800.rst
> @@ -0,0 +1,91 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +Kernel driver ltp8800
> +=====================
> +
> +Supported chips:
> +
> +  * Analog Devices LTP8800-1A, LTP8800-2, LTP8800-4A
> +
> +    Prefix: 'ltp8800'
> +
> +    Addresses scanned: -
> +
> +    Datasheet: https://www.analog.com/media/en/technical-documentation/data-sheets/ltp8800-1a.pdf
> +
> +         https://www.analog.com/media/en/technical-documentation/data-sheets/ltp8800-2.pdf
> +
> +         https://www.analog.com/media/en/technical-documentation/data-sheets/ltp8800-4a.pdf
> +
> +Authors:
> +    - Cedric Encarnacion <cedricjustine.encarnacion@analog.com>
> +
> +
> +Description
> +-----------
> +
> +The LTP8800 is a family of step-down μModule regulators that provides
> +microprocessor core voltage from 54V power distribution architecture. LTP8800
> +features telemetry monitoring of input/output voltage, input current, output
> +power, and temperature over PMBus.
> +
> +The driver is a client driver to the core PMBus driver. Please see
> +Documentation/hwmon/pmbus.rst for details on PMBus client drivers.
> +
> +Usage Notes
> +-----------
> +
> +This driver does not auto-detect devices. You will have to instantiate the
> +devices explicitly. Please see Documentation/i2c/instantiating-devices.rst for
> +details.
> +
> +Platform data support
> +---------------------
> +
> +The driver supports standard PMBus driver platform data. Please see
> +Documentation/hwmon/pmbus.rst for details.
> +
> +Sysfs Attributes
> +----------------
> +
> +======================= ===========================
> +curr1_label		"iin"
> +curr1_input		Measured input current
> +curr1_crit		Critical maximum current
> +curr1_crit_alarm	Current critical high alarm
> +
> +curr2_label		"iout1"
> +curr2_input		Measured output current
> +curr2_lcrit		Critical minimum current
> +curr2_crit		Critical maximum current
> +curr2_max		Maximum output current
> +curr2_alarm		Current alarm
> +
> +in1_label		"vin"
> +in1_input		Measured input voltage
> +in1_lcrit		Critical minimum input voltage
> +in1_lcrit_alarm		Input voltage critical low alarm
> +in1_crit		Critical maximum input voltage
> +in1_crit_alarm		Input voltage critical high alarm
> +
> +in2_label		"vout1"
> +in2_input		Measured output voltage
> +in2_lcrit		Critical minimum output voltage
> +in2_lcrit_alarm		Output voltage critical low alarm
> +in2_crit		Critical maximum output voltage
> +in2_crit_alarm		Output voltage critical high alarm
> +in2_max			Maximum output voltage
> +in2_max_alarm		Output voltage high alarm
> +in2_min			Minimum output voltage
> +in2_min_alarm		Output voltage low alarm
> +
> +power1_label		"pout1"
> +power1_input		Measured output power
> +power1_crit		Critical maximum output power
> +
> +temp1_input		Measured temperature
> +temp1_lcrit		Critical low temperature
> +temp1_lcrit_alarm		Chip temperature critical low alarm
> +temp1_crit		Critical high temperature
> +temp1_crit_alarm		Chip temperature critical high alarm
> +======================= ===========================
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6ca691500fb7..a5d1bd61fc2c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13559,6 +13559,8 @@ LTP8800 HARDWARE MONITOR DRIVER
>   M:	Cedric Encarnacion <cedricjustine.encarnacion@analog.com>
>   L:	linux-hwmon@vger.kernel.org
>   S:	Supported
> +F:	Documentation/hwmon/ltp8800.rst
> +F:	drivers/hwmon/pmbus/ltp8800.c
>   
>   LYNX 28G SERDES PHY DRIVER
>   M:	Ioana Ciornei <ioana.ciornei@nxp.com>
> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> index f6d352841953..264c73275d86 100644
> --- a/drivers/hwmon/pmbus/Kconfig
> +++ b/drivers/hwmon/pmbus/Kconfig
> @@ -247,6 +247,24 @@ config SENSORS_LTC4286
>   	  If you say yes here you get hardware monitoring support for Analog
>   	  Devices LTC4286.
>   
> +config SENSORS_LTP8800
> +	tristate "Analog Devices LTP8800 and compatibles"
> +	help
> +	  If you say yes here you get hardware monitoring support for Analog
> +	  Devices LTP8800-1A, LTP8800-4A, and LTP8800-2.
> +
> +	  This driver can also be built as a module. If so, the module will
> +	  be called ltp8800.
> +
> +config SENSORS_LTP8800_REGULATOR
> +	bool "Regulator support for LTP8800 and compatibles"
> +	depends on SENSORS_LTP8800 && REGULATOR
> +	help
> +	  If you say yes here you get regulator support for Analog Devices
> +	  LTP8800-1A, LTP8800-4A, and LTP8800-2. LTP8800 is a family of DC/DC
> +	  µModule regulators that can provide microprocessor power from 54V
> +	  power distribution architecture.
> +
>   config SENSORS_MAX15301
>   	tristate "Maxim MAX15301"
>   	help
> diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
> index d00bcc758b97..aa5bbdb4a806 100644
> --- a/drivers/hwmon/pmbus/Makefile
> +++ b/drivers/hwmon/pmbus/Makefile
> @@ -26,6 +26,7 @@ obj-$(CONFIG_SENSORS_LT7182S)	+= lt7182s.o
>   obj-$(CONFIG_SENSORS_LTC2978)	+= ltc2978.o
>   obj-$(CONFIG_SENSORS_LTC3815)	+= ltc3815.o
>   obj-$(CONFIG_SENSORS_LTC4286)	+= ltc4286.o
> +obj-$(CONFIG_SENSORS_LTP8800)	+= ltp8800.o
>   obj-$(CONFIG_SENSORS_MAX15301)	+= max15301.o
>   obj-$(CONFIG_SENSORS_MAX16064)	+= max16064.o
>   obj-$(CONFIG_SENSORS_MAX16601)	+= max16601.o
> diff --git a/drivers/hwmon/pmbus/ltp8800.c b/drivers/hwmon/pmbus/ltp8800.c
> new file mode 100644
> index 000000000000..d57f8c058a89
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/ltp8800.c
> @@ -0,0 +1,63 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Hardware monitoring driver for Analog Devices LTP8800
> + *
> + * Copyright (C) 2024 Analog Devices, Inc.
> + */
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/mod_devicetable.h>
> +#include "pmbus.h"
> +
> +static const struct regulator_desc ltp8800_reg_desc[] = {
> +	PMBUS_REGULATOR("vout", 0),

Ah, sorry, I didn't realize this earlier. This needs to use "PMBUS_REGULATOR_ONE("vout")"
since there is only a single regulator (which needs to be named "vout" and not "vout0").

Thanks,
Guenter

> +};
> +
> +static struct pmbus_driver_info ltp8800_info = {
> +	.pages = 1,
> +	.format[PSC_VOLTAGE_IN] = linear,
> +	.format[PSC_VOLTAGE_OUT] = linear,
> +	.format[PSC_CURRENT_IN] = linear,
> +	.format[PSC_TEMPERATURE] = linear,
> +	.func[0] = PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
> +		   PMBUS_HAVE_VIN | PMBUS_HAVE_STATUS_INPUT |
> +		   PMBUS_HAVE_IIN | PMBUS_HAVE_IOUT |
> +		   PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP |
> +		   PMBUS_HAVE_POUT,
> +#if IS_ENABLED(CONFIG_SENSORS_LTP8800_REGULATOR)
> +	.num_regulators = 1,
> +	.reg_desc = ltp8800_reg_desc,
> +#endif
> +};
> +
> +static int ltp8800_probe(struct i2c_client *client)
> +{
> +	return pmbus_do_probe(client, &ltp8800_info);
> +}
> +
> +static const struct i2c_device_id ltp8800_id[] = {
> +	{"ltp8800", 0},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(i2c, ltp8800_id);
> +
> +static const struct of_device_id ltp8800_of_match[] = {
> +	{ .compatible = "adi,ltp8800"},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, ltp8800_of_match);
> +
> +static struct i2c_driver ltp8800_driver = {
> +	.driver = {
> +		.name = "ltp8800",
> +		.of_match_table = ltp8800_of_match,
> +	},
> +	.probe = ltp8800_probe,
> +	.id_table = ltp8800_id,
> +};
> +module_i2c_driver(ltp8800_driver);
> +
> +MODULE_AUTHOR("Cedric Encarnacion <cedricjustine.encarnacion@analog.com>");
> +MODULE_DESCRIPTION("Analog Devices LTP8800 HWMON PMBus Driver");
> +MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS(PMBUS);


