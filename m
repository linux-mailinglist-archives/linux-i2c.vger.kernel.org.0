Return-Path: <linux-i2c+bounces-4383-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A08B591878A
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jun 2024 18:37:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C43991C20847
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jun 2024 16:37:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC03A18F2F0;
	Wed, 26 Jun 2024 16:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=t-8ch.de header.i=@t-8ch.de header.b="e3DY8tAe"
X-Original-To: linux-i2c@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4BA18C33D;
	Wed, 26 Jun 2024 16:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719419866; cv=none; b=IL+E72qw3M2uL7AzdpXN6xak5Sr2zur/gZXB3OgpHLCVqbPKFTZd9nCAFpltySUVEy05u4JCpRIZfD3Aex2RQwhCz3/iY9OQr0HSJyeHoH2CbMnFLY0S/VG5qV8HWwWmbVeNKm28NlBFrIRIz+D3D03+ioSJ0RA445rLlQxR+ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719419866; c=relaxed/simple;
	bh=pXoBfOlm+vXOvkm5WzoBB8e7MhFEuX6jxo6GpxgQ6r8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A8tE59pYIq566rZln4Qg5TZpgYKf2LtUdaEqmiMmY/svsnqw6YqA/xKTUP01kuv2yG9XEvHRV9m2YUj/9BMHX+XfMLMlX24Wt0ZQr8rrWK0xDDRLjWsTePfFicMPbJtYk6PYf10v6n/+bI2zd3gE0+kOW10xjD/WQ0gnGdl2WNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=t-8ch.de; spf=pass smtp.mailfrom=t-8ch.de; dkim=pass (1024-bit key) header.d=t-8ch.de header.i=@t-8ch.de header.b=e3DY8tAe; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=t-8ch.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=t-8ch.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
	t=1719419861; bh=pXoBfOlm+vXOvkm5WzoBB8e7MhFEuX6jxo6GpxgQ6r8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e3DY8tAe4K3IdjFVDBiPpOVhlFvg9YwTAkMYuUnPBnFXUy82oLXHvcjlBF78G7nmZ
	 BeM5agWz4CSjuxSGI9AvkH6jbHCb+SbYDftRqlkja8zBcfrS09wYngVGUXso1cHGZv
	 zPsf95jr8Uc/e1+qvD/RUQTVw7w1unAqduW8rEYo=
Date: Wed, 26 Jun 2024 18:37:41 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To: Alex Vdovydchenko <keromvp@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
	Jonathan Corbet <corbet@lwn.net>, Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, 
	Alex Vdovydchenko <xzeol@yahoo.com>, linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: add MP5920 driver
Message-ID: <89bc56c2-36af-483c-b04a-73f5c6423b48@t-8ch.de>
References: <20240626142439.1407175-1-xzeol@yahoo.com>
 <20240626142439.1407175-3-xzeol@yahoo.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240626142439.1407175-3-xzeol@yahoo.com>

On 2024-06-26 17:24:34+0000, Alex Vdovydchenko wrote:
> Add support for MPS Hot-Swap controller mp5920. This driver exposes
> telemetry and limits value readings and writtings.
> 
> Signed-off-by: Alex Vdovydchenko <xzeol@yahoo.com>
> ---
>  Documentation/hwmon/index.rst  |  1 +
>  Documentation/hwmon/mp5920.rst | 91 +++++++++++++++++++++++++++++++++
>  drivers/hwmon/pmbus/Kconfig    |  9 ++++
>  drivers/hwmon/pmbus/Makefile   |  1 +
>  drivers/hwmon/pmbus/mp5920.c   | 93 ++++++++++++++++++++++++++++++++++
>  5 files changed, 195 insertions(+)
>  create mode 100644 Documentation/hwmon/mp5920.rst
>  create mode 100644 drivers/hwmon/pmbus/mp5920.c
> 
> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
> index e92a3d5c7..9eba7e402 100644
> --- a/Documentation/hwmon/index.rst
> +++ b/Documentation/hwmon/index.rst
> @@ -168,6 +168,7 @@ Hardware Monitoring Kernel Drivers
>     mp2975
>     mp2993
>     mp5023
> +   mp5920
>     mp5990
>     mp9941
>     mpq8785
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
>  	  This driver can also be built as a module. If so, the module will
>  	  be called mp5023.
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
>  config SENSORS_MP5990
>  	tristate "MPS MP5990"
>  	help
> diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
> --- a/drivers/hwmon/pmbus/Makefile
> +++ b/drivers/hwmon/pmbus/Makefile
> @@ -39,6 +39,7 @@ obj-$(CONFIG_SENSORS_MP2888)	+= mp2888.o
>  obj-$(CONFIG_SENSORS_MP2975)	+= mp2975.o
>  obj-$(CONFIG_SENSORS_MP2993)	+= mp2993.o
>  obj-$(CONFIG_SENSORS_MP5023)	+= mp5023.o
> +obj-$(CONFIG_SENSORS_MP5920)	+= mp5920.o
>  obj-$(CONFIG_SENSORS_MP5990)	+= mp5990.o
>  obj-$(CONFIG_SENSORS_MP9941)	+= mp9941.o
>  obj-$(CONFIG_SENSORS_MPQ7932)	+= mpq7932.o
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
> + */
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/init.h>
> +#include <linux/jiffies.h>
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

Already checked by pmbus_do_probe().

> +
> +	chip_id = i2c_smbus_read_word_data(client, PMBUS_MFR_ID);
> +	if (chip_id < 0) {
> +		dev_err(dev, "Failed to read MFR ID");
> +		return chip_id;
> +	}
> +
> +	return pmbus_do_probe(client, &mp5920_info);
> +}
> +
> +static const struct of_device_id mp5920_of_match[] = {
> +	{ .compatible = "mps,mp5920" },
> +	{}
> +};

MODULE_DEVICE_TABLE(of, mp5920_of_match);

> +
> +static const struct i2c_device_id mp5920_id[] = {
> +	{"mp5920", 0},
> +	{ }

Inconsistent style between sentinels of both device tables.

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
> -- 
> 2.43.0
> 

