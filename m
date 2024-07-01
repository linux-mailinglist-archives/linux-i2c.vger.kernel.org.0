Return-Path: <linux-i2c+bounces-4564-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFAD91E979
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Jul 2024 22:20:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C47A4283D32
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Jul 2024 20:20:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63A5D171090;
	Mon,  1 Jul 2024 20:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=t-8ch.de header.i=@t-8ch.de header.b="HmhKNPOw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C81D316DC09;
	Mon,  1 Jul 2024 20:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719865168; cv=none; b=bgghWvS8BbnyGKGoo2F6n2M2YRJCreQuYT6hrOwoRfPn4nbr3tD3+X5oUgbxOuSvyUD54TQvNRjycYoJPAxxOCi9OCy3JcLkDwRCN0oabC/FR10mwEW+lUGsxpYyH8lzfoW64B795nhaimze7iMdRa+2X1IGA/MukTz1r0gkkA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719865168; c=relaxed/simple;
	bh=gsKQ77e1tlADzSbnSWiat/0iNCi3m7GzGXe9fFjYSxw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D+0CbKPvGjUP2qnUm9+uu+eLrrO0sv53rB1O1V8LzP00yG81Rx8WaimPf0ExYPxCGnCY6gj9qiephR59CuhI/b0SWJRxtdBC9H+fkcLSqcdVY7rKaIBzqTNysiZpIpHUoUyiDztzoxik4H7zkd7OVS/UFw1dGGt9QtOJYhM/iTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=t-8ch.de; spf=pass smtp.mailfrom=t-8ch.de; dkim=pass (1024-bit key) header.d=t-8ch.de header.i=@t-8ch.de header.b=HmhKNPOw; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=t-8ch.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=t-8ch.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
	t=1719865160; bh=gsKQ77e1tlADzSbnSWiat/0iNCi3m7GzGXe9fFjYSxw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HmhKNPOw6kk47KVdSlUqCTWVHjPceoEI5XQ9sarwSj19N6N5/+0cl2WMaLyI79VKy
	 5Z3GlA0BYk/uhO8L3pVZ44VUeACuM1eG/6o+Oy8NvtJBp5bM9tQAy4wFtT6NFZEj7t
	 h1txDjOmR0xz40Xoe3JU76H+aBwe1OJlRGBbhyek=
Date: Mon, 1 Jul 2024 22:19:19 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To: Alex Vdovydchenko <keromvp@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sean Anderson <sean.anderson@linux.dev>, Guenter Roeck <linux@roeck-us.net>, 
	Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>, 
	Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org, 
	Alex Vdovydchenko <xzeol@yahoo.com>
Subject: Re: [PATCH v3 2/2] hwmon: add MP5920 driver
Message-ID: <4fe460c7-4299-4e01-90f8-6720b7558ced@t-8ch.de>
References: <20240701145603.1507516-1-xzeol@yahoo.com>
 <20240701145603.1507516-3-xzeol@yahoo.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240701145603.1507516-3-xzeol@yahoo.com>

On 2024-07-01 17:56:01+0000, Alex Vdovydchenko wrote:
> Add support for MPS Hot-Swap controller mp5920. This driver exposes
> telemetry and limit value readings and writings.
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
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/mp5920.c
> @@ -0,0 +1,82 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include "pmbus.h"
> +
> +static struct pmbus_driver_info mp5920_info = {
> +	.pages = 1,
> +	.format[PSC_VOLTAGE_IN] = direct,
> +	.format[PSC_VOLTAGE_OUT] = direct,
> +	.format[PSC_CURRENT_OUT] = direct,
> +	.format[PSC_POWER] = direct,
> +	.format[PSC_TEMPERATURE] = direct,
> +	.m[PSC_VOLTAGE_IN] = 2266,
> +	.b[PSC_VOLTAGE_IN] = 0,
> +	.R[PSC_VOLTAGE_IN] = -1,
> +	.m[PSC_VOLTAGE_OUT] = 2266,
> +	.b[PSC_VOLTAGE_OUT] = 0,
> +	.R[PSC_VOLTAGE_OUT] = -1,
> +	.m[PSC_CURRENT_OUT] = 546,
> +	.b[PSC_CURRENT_OUT] = 0,
> +	.R[PSC_CURRENT_OUT] = -2,
> +	.m[PSC_POWER] = 5840,
> +	.b[PSC_POWER] = 0,
> +	.R[PSC_POWER] = -3,
> +	.m[PSC_TEMPERATURE] = 1067,
> +	.b[PSC_TEMPERATURE] = 20500,
> +	.R[PSC_TEMPERATURE] = -2,
> +	.func[0] = PMBUS_HAVE_VIN  | PMBUS_HAVE_VOUT |
> +		PMBUS_HAVE_IOUT | PMBUS_HAVE_POUT |
> +		PMBUS_HAVE_TEMP,
> +};
> +
> +static int mp5920_probe(struct i2c_client *client)
> +{
> +	struct device *dev =  &client->dev;
> +	int ret;
> +	u8 buf[I2C_SMBUS_BLOCK_MAX + 1];
> +
> +	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL, buf);

If you do keep a custom call to i2c_smbus_read_block_data(),
then you probably should also keep the call to i2c_check_functionality().

> +	if (ret < 0) {
> +		dev_err(dev, "Failed to read PMBUS_MFR_MODEL\n");
> +		return ret;
> +	}

If you use dev_err_probe() that would be shorter:

if (ret < 0)
	return dev_err_probe(dev, ret, "Failed to read PMBUS_MFR_MODEL\n");

> +	if (ret != 6 || strncmp(buf, "MP5920", 6)) {
> +		buf[ret] = '\0';
> +		dev_err(dev, "Model '%s' not supported\n", buf);

The manual 0-byte termination and the size + 1 can be avoided by using

dev_err_probe(dev, -ENODEV, "Model '%.*s' not supported\n", sizeof(buf), buf);

> +		return -ENODEV;
> +	}
> +
> +	return pmbus_do_probe(client, &mp5920_info);
> +}
> +
> +static const struct of_device_id mp5920_of_match[] = {
> +	{ .compatible = "mps,mp5920" },
> +	{ }
> +};
> +
> +MODULE_DEVICE_TABLE(of, mp5920_of_match);
> +
> +static const struct i2c_device_id mp5920_id[] = {
> +	{ "mp5920" },
> +	{ }
> +};
> +
> +MODULE_DEVICE_TABLE(i2c, mp5920_id);
> +
> +static struct i2c_driver mp5920_driver = {
> +	.driver = {
> +			.name = "mp5920",
> +			},

Borked indentation.
You can also use the shorter variant:
	.driver.name = "mp5920",

Where did the .driver.of_match_table go?

> +	.probe = mp5920_probe,
> +	.id_table = mp5920_id,
> +};
> +
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
> 

