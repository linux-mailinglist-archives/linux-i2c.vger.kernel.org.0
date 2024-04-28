Return-Path: <linux-i2c+bounces-3277-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EB34C8B4D35
	for <lists+linux-i2c@lfdr.de>; Sun, 28 Apr 2024 19:27:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EE7E7B212E8
	for <lists+linux-i2c@lfdr.de>; Sun, 28 Apr 2024 17:27:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09BF073501;
	Sun, 28 Apr 2024 17:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D7QAeBkA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7721EB45;
	Sun, 28 Apr 2024 17:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714325233; cv=none; b=UdtKBMcwOgEM6fM9Y0V9f4t/t+WsB5TE5ioOARlUeRq4ULomchyNgFujPH7Tbk9kUBcw4kWEveoGiBO4JN9tJRHS0g0aAc/rHWmGz4Qn+OcHPPnB2kHZhUU6AJsp9slcAt0i28CKQ1Guzp89z8Pee8K/u17FhlnWiU3wLAZG7e8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714325233; c=relaxed/simple;
	bh=M3F90mdVr3tGo2no1WTzvSAVRjgKAuQEvaGgDaruVKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BzKANr2+FMsF1+9tjB9HfikxUbRI19ode0g4WtNQHJPTBaUXwuHBHCZXReFBRTwZBn+inDg7Dx2pOvSkoff2xmzuxhbMZnmNZ+DSYGyVyT/ImchyhRGPRVvtGcgAlo3V6POaYrrJlpebeyirud4FrxCsrLwN4fGib4qm0xYWs0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D7QAeBkA; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-5d4d15ec7c5so2979254a12.1;
        Sun, 28 Apr 2024 10:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714325231; x=1714930031; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C2knqG68Gw3E1+Yz7J083d0kVRWJTtEFT+L1mHqaNus=;
        b=D7QAeBkAWiYwQ9l5IS73gAcMX2iPLl/MhOcLxGpNw0197X5mNCf+O6n54cHRy/Mxjw
         Tt1/AseLWc0W9IbS86Lw4VkxiGYLZR3ZQNGOcNb8iQOLnJB5Gtlz5WDAMRhRQOyys4mO
         YKNEws7hJu5L3pfZa5wpwo4T1mujAb9esiPCtR7fPJalgGALo2DeBGEPmrmPQgW+nTf8
         gXjO3M6mR2steCWKhmB0nm2cime81EqPoBpEybwOaOverJg0/YLn18gDYBg+SZCAS2Az
         vTkBYOja68LfKf4AIHBER+SCZXVwrsWRBESrflQfNUzPDKgiLEMq5humR1WcsKhnZhs7
         DImg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714325231; x=1714930031;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C2knqG68Gw3E1+Yz7J083d0kVRWJTtEFT+L1mHqaNus=;
        b=RVLPPgUWtFP2ceMms2Aij1ZvZywN7V4cLIeg42QiHvsC3Gp0YWKIkTnfjVH5waTurT
         PSTVeGG34rkUDBL7f7pV6gQhuVZog+sn01IDL1W1lZjtdsJnys6BbWq5x/6ynB/PLRF8
         wL15/srvEVTsAyQzo/tlj4T9WnngDb8nHyGd8Uoh/fKBOuye+EIM9EmpwD3XQxasikTT
         drvCRs/045pVNiGhROvRxt/oEwL5IlA4FDKryOz1FtBcibeMw4p0jAlQSfUdg28TTTk7
         I7MacOTF31UJniKa2HRSo9NZMY4wLbF+jcQyFpCNY/XE41oTV3Yf/wy8HopkWofbjmu6
         d6Lg==
X-Forwarded-Encrypted: i=1; AJvYcCVi0Calbwdy/UHSw8q9PV+rQdCwFGakzoTBmLK6li3tmFc68+kQJROimy1hXyFsPKUhBNSVOM1GLXLSpnUaAjskbqiOb/8PanjEOwB4am1F1U3KaCXKuZw22f9YQ3f+c31zfm5a2IrdHaSVe3Ecc/DlcZgYa0LuW5mxoW9y/+X/CNtsCLuRMZlvdTzcxo3o1zVWqBDCvYhgRfEiZFpOYXJtEZx6AqGHW7iY+v/4d3wL9rb7+YgAHIi97zLN
X-Gm-Message-State: AOJu0YzqiPTj/f/ymhhVlho+TfZ6L90keODWK/jAOaj0wHoSUtjkUe12
	7cJm2tnFGoeknK46R5O1mECkiNckefIZFqImgRngOcZNo+JsHD9d
X-Google-Smtp-Source: AGHT+IGff4uxAmUuN7rp3lgTDUwD1S2cxrw0rAlGwQ6nIZgm/GuJQjCDiiezJw0yCXKaJTKzcyO66Q==
X-Received: by 2002:a05:6a20:dc95:b0:1a9:86dd:177b with SMTP id ky21-20020a056a20dc9500b001a986dd177bmr9404831pzb.44.1714325231432;
        Sun, 28 Apr 2024 10:27:11 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r30-20020a638f5e000000b005f7f51967e9sm16073440pgn.27.2024.04.28.10.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Apr 2024 10:27:10 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 28 Apr 2024 10:27:09 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Yin <peteryin.openbmc@gmail.com>
Cc: patrick@stwcx.xyz, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>,
	Patrick Rudolph <patrick.rudolph@9elements.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Ninad Palsule <ninad@linux.ibm.com>,
	Fabio Estevam <festevam@denx.de>, Lukas Wunner <lukas@wunner.de>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 1/2] hwmon: (pmbus) Add support for Infineon XDP710
Message-ID: <b72919f4-4b54-4452-bc3b-979aa8f8d7d3@roeck-us.net>
References: <20240425153608.4003782-1-peteryin.openbmc@gmail.com>
 <20240425153608.4003782-2-peteryin.openbmc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240425153608.4003782-2-peteryin.openbmc@gmail.com>

On Thu, Apr 25, 2024 at 11:36:01PM +0800, Peter Yin wrote:
> Add support for Infineon XDP710.This is a Hot-Swap Controller.
> 
> Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>

Applied, after "s/microOhmRsense/micro_ohm_rsense/g"

Guenter

> ---
>  Documentation/hwmon/index.rst  |   1 +
>  Documentation/hwmon/xdp710.rst |  83 +++++++++++++++++++++
>  drivers/hwmon/pmbus/Kconfig    |   9 +++
>  drivers/hwmon/pmbus/Makefile   |   1 +
>  drivers/hwmon/pmbus/xdp710.c   | 132 +++++++++++++++++++++++++++++++++
>  5 files changed, 226 insertions(+)
>  create mode 100644 Documentation/hwmon/xdp710.rst
>  create mode 100644 drivers/hwmon/pmbus/xdp710.c
> 
> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
> index 1ca7a4fe1f8f..b2546925fb15 100644
> --- a/Documentation/hwmon/index.rst
> +++ b/Documentation/hwmon/index.rst
> @@ -250,6 +250,7 @@ Hardware Monitoring Kernel Drivers
>     wm831x
>     wm8350
>     xgene-hwmon
> +   xdp710
>     xdpe12284
>     xdpe152c4
>     zl6100
> diff --git a/Documentation/hwmon/xdp710.rst b/Documentation/hwmon/xdp710.rst
> new file mode 100644
> index 000000000000..083891f27818
> --- /dev/null
> +++ b/Documentation/hwmon/xdp710.rst
> @@ -0,0 +1,83 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +Kernel driver xdp710
> +====================
> +
> +Supported chips:
> +
> +  * Infineon XDP710
> +
> +    Prefix: 'xdp710'
> +
> +  * Datasheet
> +
> +    Publicly available at the Infineon website : https://www.infineon.com/dgdl/Infineon-XDP710-001-DataSheet-v01_00-EN.pdf?fileId=8ac78c8c8412f8d301848a5316290b97
> +
> +Author:
> +
> +	Peter Yin <peteryin.openbmc@gmail.com>
> +
> +Description
> +-----------
> +
> +This driver implements support for Infineon XDP710 Hot-Swap Controller.
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
> +**in1_max**
> +
> +**in1_max_alarm**
> +
> +**in1_min**
> +
> +**in1_min_alarm**
> +
> +The driver provides the following attributes for output voltage:
> +
> +**in2_input**
> +
> +**in2_label**
> +
> +**in2_alarm**
> +
> +The driver provides the following attributes for output current:
> +
> +**curr1_input**
> +
> +**curr1_label**
> +
> +**curr1_alarm**
> +
> +**curr1_max**
> +
> +The driver provides the following attributes for input power:
> +
> +**power1_input**
> +
> +**power1_label**
> +
> +**power1_alarm**
> +
> +The driver provides the following attributes for temperature:
> +
> +**temp1_input**
> +
> +**temp1_max**
> +
> +**temp1_max_alarm**
> +
> +**temp1_crit**
> +
> +**temp1_crit_alarm**
> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> index 557ae0c414b0..c775128c2ea7 100644
> --- a/drivers/hwmon/pmbus/Kconfig
> +++ b/drivers/hwmon/pmbus/Kconfig
> @@ -511,6 +511,15 @@ config SENSORS_UCD9200
>  	  This driver can also be built as a module. If so, the module will
>  	  be called ucd9200.
>  
> +config SENSORS_XDP710
> +	tristate "Infineon XDP710 family"
> +	help
> +	  If you say yes here you get hardware monitoring support for Infineon
> +	  XDP710.
> +
> +	  This driver can also be built as a module. If so, the module will
> +	  be called xdp710.
> +
>  config SENSORS_XDPE152
>  	tristate "Infineon XDPE152 family"
>  	help
> diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
> index f14ecf03ad77..4fe630793721 100644
> --- a/drivers/hwmon/pmbus/Makefile
> +++ b/drivers/hwmon/pmbus/Makefile
> @@ -51,6 +51,7 @@ obj-$(CONFIG_SENSORS_TPS53679)	+= tps53679.o
>  obj-$(CONFIG_SENSORS_TPS546D24)	+= tps546d24.o
>  obj-$(CONFIG_SENSORS_UCD9000)	+= ucd9000.o
>  obj-$(CONFIG_SENSORS_UCD9200)	+= ucd9200.o
> +obj-$(CONFIG_SENSORS_XDP710)	+= xdp710.o
>  obj-$(CONFIG_SENSORS_XDPE122)	+= xdpe12284.o
>  obj-$(CONFIG_SENSORS_XDPE152)	+= xdpe152c4.o
>  obj-$(CONFIG_SENSORS_ZL6100)	+= zl6100.o
> diff --git a/drivers/hwmon/pmbus/xdp710.c b/drivers/hwmon/pmbus/xdp710.c
> new file mode 100644
> index 000000000000..a00f79cda5e5
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/xdp710.c
> @@ -0,0 +1,132 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Driver for Infineon XDP710 Hot-Swap Controller
> + */
> +
> +#include <linux/bitops.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include "pmbus.h"
> +
> +#define XDP710_REG_CFG		0xD3
> +#define XDP710_V_SNS_CFG	0xD4
> +#define XDP710_CS_RNG		0xD5
> +
> +/*
> + * The table to map configuration register values
> + * to sense resistor values
> + */
> +const int microOhmRsense[] = {
> +	200, 250, 300, 330, 400, 470, 500, 600,
> +	670, 700, 750, 800, 900, 1000, 1100, 1200,
> +	1250, 1300, 1400, 1500, 1600, 1700, 1800, 1900,
> +	2000, 2100, 2200, 2300, 2400, 2500, 2600, 2700,
> +	2800, 3000, 3100, 3200, 3300, 3400, 3500, 3600,
> +	3700, 3800, 3900, 4000, 4100, 4200, 4300, 4400,
> +	4500, 4600, 4700, 4800, 4900, 5000, 5500, 6000,
> +	6500, 7000, 7500, 8000, 8500, 9000, 9500, 10000
> +};
> +
> +static struct pmbus_driver_info xdp710_info = {
> +	.pages = 1,
> +	.format[PSC_VOLTAGE_IN] = direct,
> +	.format[PSC_VOLTAGE_OUT] = direct,
> +	.format[PSC_CURRENT_OUT] = direct,
> +	.format[PSC_POWER] = direct,
> +	.format[PSC_TEMPERATURE] = direct,
> +	.m[PSC_VOLTAGE_IN] = 4653,
> +	.b[PSC_VOLTAGE_IN] = 0,
> +	.R[PSC_VOLTAGE_IN] = -2,
> +	.m[PSC_VOLTAGE_OUT] = 4653,
> +	.b[PSC_VOLTAGE_OUT] = 0,
> +	.R[PSC_VOLTAGE_OUT] = -2,
> +	.m[PSC_CURRENT_OUT] = 23165,
> +	.b[PSC_CURRENT_OUT] = 0,
> +	.R[PSC_CURRENT_OUT] = -2,
> +	.m[PSC_POWER] = 4211,
> +	.b[PSC_POWER] = 0,
> +	.R[PSC_POWER] = -2,
> +	.m[PSC_TEMPERATURE] = 52,
> +	.b[PSC_TEMPERATURE] = 14321,
> +	.R[PSC_TEMPERATURE] = -1,
> +	.func[0] =
> +		PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_PIN |
> +		PMBUS_HAVE_TEMP | PMBUS_HAVE_IOUT |
> +		PMBUS_HAVE_STATUS_INPUT | PMBUS_HAVE_STATUS_TEMP,
> +};
> +
> +static int xdp710_probe(struct i2c_client *client)
> +{
> +	struct pmbus_driver_info *info;
> +	u8 cs_rng;
> +	u8 vtlm_rng;
> +	int rsense;
> +	int ret;
> +	int m = 0;
> +
> +	info = devm_kmemdup(&client->dev, &xdp710_info, sizeof(*info),
> +			    GFP_KERNEL);
> +	if (!info)
> +		return -ENOMEM;
> +
> +	ret = i2c_smbus_read_word_data(client, XDP710_CS_RNG);
> +	if (ret < 0) {
> +		dev_err(&client->dev, "Can't get CS_RNG");
> +		return ret;
> +	}
> +	cs_rng = (ret >> 6) & GENMASK(1, 0);
> +
> +	ret = i2c_smbus_read_word_data(client, XDP710_V_SNS_CFG);
> +	if (ret < 0) {
> +		dev_err(&client->dev, "Can't get V_SNS_CFG");
> +		return ret;
> +	}
> +	vtlm_rng = ret & GENMASK(1, 0);
> +
> +	ret = i2c_smbus_read_word_data(client, XDP710_REG_CFG);
> +	if (ret < 0) {
> +		dev_err(&client->dev, "Can't get REG_CFG");
> +		return ret;
> +	}
> +	ret &= GENMASK(5, 0);
> +	rsense = microOhmRsense[ret];
> +
> +	info->m[PSC_VOLTAGE_IN] <<= vtlm_rng;
> +	info->m[PSC_VOLTAGE_OUT] <<= vtlm_rng;
> +
> +	m = info->m[PSC_CURRENT_OUT];
> +	info->m[PSC_CURRENT_OUT] = DIV_ROUND_CLOSEST(m * rsense >> cs_rng,
> +						     1000);
> +
> +	m = info->m[PSC_POWER];
> +	info->m[PSC_POWER] = DIV_ROUND_CLOSEST(m * rsense >> cs_rng, 1000);
> +
> +	return pmbus_do_probe(client, info);
> +}
> +
> +static const struct of_device_id xdp710_of_match[] = {
> +	{ .compatible = "infineon,xdp710" },
> +	{}
> +};
> +
> +static const struct i2c_device_id xdp710_id[] = {
> +	{"xdp710", 0},
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, xdp710_id);
> +
> +static struct i2c_driver xdp710_driver = {
> +	.driver = {
> +		   .name = "xdp710",
> +		   .of_match_table = xdp710_of_match,
> +	},
> +	.probe = xdp710_probe,
> +	.id_table = xdp710_id,
> +};
> +module_i2c_driver(xdp710_driver);
> +
> +MODULE_AUTHOR("Peter Yin <peter.yin@quantatw.com>");
> +MODULE_DESCRIPTION("PMBus driver for XDP710 HSC");
> +MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS(PMBUS);

