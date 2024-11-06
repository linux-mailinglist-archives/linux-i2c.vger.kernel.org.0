Return-Path: <linux-i2c+bounces-7859-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE3F9BF5E2
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2024 19:59:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C34BD1F2322A
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2024 18:59:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4B17209667;
	Wed,  6 Nov 2024 18:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YDEQFr09"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A73208219;
	Wed,  6 Nov 2024 18:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730919556; cv=none; b=IOhFFzPmH8m568JdniAi8CKai5dqi/83kAlQQYpIwu2EYVPxMuuDzBnoK0U9q2VwjuFnwWBf4JouCK2+Cn63Kly2nWxlz7wDkqxsCez9nMSrv/hnap1zUjdmj9aprvcgTGblESgy/x9NpLiwr9sylEegVh7zGndeVSqZHxVTg8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730919556; c=relaxed/simple;
	bh=ZcQWDCYqgh/2NASXV5Ud4ArvZhZ16Y5ijanglWE3cZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TAiEDP1MJQyacQrUzsyguDGEiAyMmCsDWa6wR6HhxDUKeLnTEq7VPCetkSA7xbSy8LJ/6sLfsnmTm9jkt4/bzbwnrxZnViL8z1VVWH59B6Vg/mIU42h1Vgktzu2BgxfCjMkhVCyNP/cUI0iL/w6FNaKbQYyvgY7C5lUcnDmQAxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YDEQFr09; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-71e5a62031aso57387b3a.1;
        Wed, 06 Nov 2024 10:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730919554; x=1731524354; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hsKGfmQriIXowPQeA7kxtjSVb0+d4T2VXufIl2Gh+dk=;
        b=YDEQFr09jEQfZd/99qosCxoZ/d/g4JA/0dQVXoL8FRs1wl96TmXb3U+Ub+A+nAOeit
         9H3rSo5cO92mbQJMfudLurEJ3uZwJhgPo5FI7monxnasH3KVBc4Aym26k2RK7DmVzNMH
         8mrkknfnu1Se4e3DR5By2K6OdkQKI8wSlCMGjtOdE0iNjdvI2mvkT2k2S8PQJHkNsMcQ
         PIvyQ6uAqgXjKLd1m2bLhp+S9tbi11byU1/Y4/Ud/ijgAcGiDc1QuxfoYub2Ka0ZwPc3
         1hzZGxanCLMlrca1DJT+wfvjx9o+1zrT5DmcDqjGMH73Lq/NSTMp5wkQgpt0p9rbkgNp
         HoTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730919554; x=1731524354;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hsKGfmQriIXowPQeA7kxtjSVb0+d4T2VXufIl2Gh+dk=;
        b=oTXuhyjTly3Izta44xabPJExUEqfQ7+68pdb/G+XgGDGYI9TXudCPlT2rgxmAIIDsJ
         993ku/DzGqbCaroD+V6QZNAlplfiglpwTIYjLrObvM8WDFa9Wt1sGhq4HL4RZuawnOgO
         GM+YS7rx0+Ci30oYza/6WDll3I40Xpe0e5FLgBGaj4ztO/DubDart46La8za/Z3jbTvW
         M0AGnJAT3phzB7jLLe9vepoFYH2UvOfXT36gzWirHO2ygt0ZKPGiTyowJPuXMdoamqc1
         WdLrHwD5IwcTgE7wkvjAlbovj16MgoCV2TCavY9BA28kJJ8Hg+eMs00RTUiftRrBVbtQ
         0LWA==
X-Forwarded-Encrypted: i=1; AJvYcCUIc3GYYVsQTQdWr74Hi5Xsoi1dwTjU/4rJH34QKOVH10d8ESv5XMjM05yaa4AHhhxDoeVxsX+/FMcS@vger.kernel.org, AJvYcCUW3nsa6/LYtBICblpbdfFOuqmM3p9oYsAGrkuzBRcuhFH9AV2HHeQ4AE/tgZmoAchJhdVJ/doRLkTJFqc=@vger.kernel.org, AJvYcCVLD7D/XhWtcKbD+fqdZB1gXPuwGliX2eEdIGzxCLsmBPkKdtr4sJ4LCJj3FgIbpaN9P4ZbDBeBq/n/u2dI@vger.kernel.org, AJvYcCX7mbRf1Cem1AUXU7ae4K1aigRbuSOjO6lqNHXM9beVpuyxAq7kimSWiw6I/bK5gsVZFhbKAhEcwGfN@vger.kernel.org, AJvYcCXRBwmNaV89yRvd6rfT//OkynGByc9zuhY51GBCiJFu35uo+GZqik+4B3/hn43shOHx4RmIH3JyJ0Ha@vger.kernel.org
X-Gm-Message-State: AOJu0YwoZS9JG9u0XxcdzpoFoAgr/1PibguHsd3eKZwx8Qf32L2dLrf3
	Z2TkMoZy2qH7ikIr4NzJrmjIQFp3YcKDRBaa/k2q2944Kpjznrfk
X-Google-Smtp-Source: AGHT+IEZFoWPsAlfTT3V+IhDTECeoYtWfll6jrHbODouSvgIJ4dfIJeUW6C6/EWEry0+DZUolpxgdw==
X-Received: by 2002:a05:6a00:a2a:b0:710:6e83:cd5e with SMTP id d2e1a72fcca58-720c9680ee1mr31083022b3a.0.1730919553668;
        Wed, 06 Nov 2024 10:59:13 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc2e9316sm12477525b3a.148.2024.11.06.10.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 10:59:12 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 6 Nov 2024 10:59:11 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Patrick Rudolph <patrick.rudolph@9elements.com>,
	Naresh Solanki <naresh.solanki@9elements.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-i2c@vger.kernel.org, Vaishnav Achath <vaishnav.a@ti.com>
Subject: Re: [PATCH v4 7/7] hwmon: (pmbus/tps25990): add initial support
Message-ID: <df0db75a-b5e1-4bd8-8a59-de85b0a77fa5@roeck-us.net>
References: <20241105-tps25990-v4-0-0e312ac70b62@baylibre.com>
 <20241105-tps25990-v4-7-0e312ac70b62@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241105-tps25990-v4-7-0e312ac70b62@baylibre.com>

On Tue, Nov 05, 2024 at 06:58:44PM +0100, Jerome Brunet wrote:
> Add initial support for the Texas Instruments TPS25990 eFuse.
> This adds the basic PMBUS telemetry support for the device.
> 
> Tested-by: Vaishnav Achath <vaishnav.a@ti.com>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  Documentation/hwmon/index.rst    |   1 +
>  Documentation/hwmon/tps25990.rst | 148 ++++++++++++++
>  MAINTAINERS                      |   2 +
>  drivers/hwmon/pmbus/Kconfig      |  17 ++
>  drivers/hwmon/pmbus/Makefile     |   1 +
>  drivers/hwmon/pmbus/tps25990.c   | 428 +++++++++++++++++++++++++++++++++++++++
>  6 files changed, 597 insertions(+)
> 
> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
> index 55f1111594b2e9ada4a881e5d4d8884f33256d1f..1a3cb0a59f7210b8a5e972a8015658b983834cd2 100644
> --- a/Documentation/hwmon/index.rst
> +++ b/Documentation/hwmon/index.rst
> @@ -236,6 +236,7 @@ Hardware Monitoring Kernel Drivers
>     tmp464
>     tmp513
>     tps23861
> +   tps25990
>     tps40422
>     tps53679
>     tps546d24
> diff --git a/Documentation/hwmon/tps25990.rst b/Documentation/hwmon/tps25990.rst
> new file mode 100644
> index 0000000000000000000000000000000000000000..ed9e74d43e2c2f070d3abe987d93bcdfcf2162ec
> --- /dev/null
> +++ b/Documentation/hwmon/tps25990.rst
> @@ -0,0 +1,148 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +Kernel driver tps25990
> +======================
> +
> +Supported chips:
> +
> +  * TI TPS25990
> +
> +    Prefix: 'tps25990'
> +
> +  * Datasheet
> +
> +    Publicly available at Texas Instruments website: https://www.ti.com/lit/gpn/tps25990
> +
> +Author:
> +
> +	Jerome Brunet <jbrunet@baylibre.com>
> +
> +Description
> +-----------
> +
> +This driver implements support for TI TPS25990 eFuse.
> +This is an integrated, high-current circuit protection and power
> +management device with PMBUS interface
> +
> +Device compliant with:
> +
> +- PMBus rev 1.3 interface.
> +
> +Device supports direct format for reading input voltages,
> +output voltage, input current, input power and temperature.
> +
> +Due to the specificities of the chip, all history reset attributes
> +are tied together. Resetting the history of a sensor, resets the
> +history of all the sensors.
> +
> +The driver exports the following attributes via the 'sysfs' files
> +for input current:
> +
> +**curr1_average**
> +
> +**curr1_crit**
> +
> +**curr1_crit_alarm**
> +
> +**curr1_highest**
> +
> +**curr1_input**
> +
> +**curr1_label**
> +
> +**curr1_max**
> +
> +**curr1_max_alarm**
> +
> +**curr1_reset_history**
> +
> +The driver provides the following attributes for main input voltage:
> +
> +**in1_average**
> +
> +**in1_crit**
> +
> +**in1_crit_alarm**
> +
> +**in1_highest**
> +
> +**in1_input**
> +
> +**in1_label**
> +
> +**in1_lcrit**
> +
> +**in1_lcrit_alarm**
> +
> +**in1_lowest**
> +
> +**in1_max**
> +
> +**in1_max_alarm**
> +
> +**in1_min**
> +
> +**in1_min_alarm**
> +
> +**in1_reset_history**
> +
> +The driver provides the following attributes for auxiliary input voltage:
> +
> +**in2_input**
> +
> +**in2_label**
> +
> +The driver provides the following attributes for output voltage:
> +
> +**in3_average**
> +
> +**in3_input**
> +
> +**in3_label**
> +
> +**in3_lowest**
> +
> +**in3_min**
> +
> +**in3_min_alarm**
> +
> +**in3_reset_history**
> +
> +The driver provides the following attributes for input power:
> +
> +**power1_alarm**
> +
> +**power1_average**
> +
> +**power1_input**
> +
> +**power1_input_highest**
> +
> +**power1_label**
> +
> +**power1_max**
> +
> +**power1_reset_history**
> +
> +The driver provides the following attributes for temperature:
> +
> +**temp1_average**
> +
> +**temp1_crit**
> +
> +**temp1_crit_alarm**
> +
> +**temp1_highest**
> +
> +**temp1_input**
> +
> +**temp1_max**
> +
> +**temp1_max_alarm**
> +
> +**temp1_reset_history**
> +
> +The driver provides the following attributes for sampling:
> +
> +**samples**
> +
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4f21d7d2ce992f14d8c533f0c8742edb22a0db3f..10a65cd5c84e56cf876ee5eb06336b5bc8ff991c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22816,6 +22816,8 @@ M:	Jerome Brunet <jbrunet@baylibre.com>
>  L:	linux-hwmon@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml
> +F:	Documentation/hwmon/tps25990.rst
> +F:	drivers/hwmon/pmbus/tps25990.c
>  
>  TEXAS INSTRUMENTS TPS23861 PoE PSE DRIVER
>  M:	Robert Marko <robert.marko@sartura.hr>
> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> index f6d3528419536a68011d67a4a239c0cba1bbf475..22418a05ced0c4d7025a243134f231c54c741371 100644
> --- a/drivers/hwmon/pmbus/Kconfig
> +++ b/drivers/hwmon/pmbus/Kconfig
> @@ -510,6 +510,23 @@ config SENSORS_TDA38640_REGULATOR
>  	  If you say yes here you get regulator support for Infineon
>  	  TDA38640 as regulator.
>  
> +config SENSORS_TPS25990
> +	tristate "TI TPS25990"
> +	help
> +	  If you say yes here you get hardware monitoring support for TI
> +	  TPS25990.
> +
> +	  This driver can also be built as a module. If so, the module will
> +	  be called tps25990.
> +
> +config SENSORS_TPS25990_REGULATOR
> +	bool "Regulator support for TPS25990 and compatibles"
> +	depends on SENSORS_TPS25990 && REGULATOR
> +	default SENSORS_TPS25990
> +	help
> +	  If you say yes here you get regulator support for Texas Instruments
> +	  TPS25990.
> +
>  config SENSORS_TPS40422
>  	tristate "TI TPS40422"
>  	help
> diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
> index d00bcc758b97200b80158e33b0ac41e6e5ac3231..3d3183f8d2a7060eb513f54f4f0a78ba37c09393 100644
> --- a/drivers/hwmon/pmbus/Makefile
> +++ b/drivers/hwmon/pmbus/Makefile
> @@ -51,6 +51,7 @@ obj-$(CONFIG_SENSORS_PXE1610)	+= pxe1610.o
>  obj-$(CONFIG_SENSORS_Q54SJ108A2)	+= q54sj108a2.o
>  obj-$(CONFIG_SENSORS_STPDDC60)	+= stpddc60.o
>  obj-$(CONFIG_SENSORS_TDA38640)	+= tda38640.o
> +obj-$(CONFIG_SENSORS_TPS25990)	+= tps25990.o
>  obj-$(CONFIG_SENSORS_TPS40422)	+= tps40422.o
>  obj-$(CONFIG_SENSORS_TPS53679)	+= tps53679.o
>  obj-$(CONFIG_SENSORS_TPS546D24)	+= tps546d24.o
> diff --git a/drivers/hwmon/pmbus/tps25990.c b/drivers/hwmon/pmbus/tps25990.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..db59638f6c626f2467b859f023523276cfb6c3a5
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/tps25990.c
> @@ -0,0 +1,428 @@
> +// SPDX-License-Identifier: GPL-2.0
> +//
> +// Copyright (c) 2024 BayLibre, SAS.
> +// Author: Jerome Brunet <jbrunet@baylibre.com>
> +
> +#include <linux/bitfield.h>
> +#include <linux/debugfs.h>
> +#include <linux/err.h>
> +#include <linux/hwmon-sysfs.h>
> +#include <linux/i2c.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +
> +#include "pmbus.h"
> +
> +#define TPS25990_READ_VAUX		0xd0
> +#define TPS25990_READ_VIN_MIN		0xd1
> +#define TPS25990_READ_VIN_PEAK		0xd2
> +#define TPS25990_READ_IIN_PEAK		0xd4
> +#define TPS25990_READ_PIN_PEAK		0xd5
> +#define TPS25990_READ_TEMP_AVG		0xd6
> +#define TPS25990_READ_TEMP_PEAK		0xd7
> +#define TPS25990_READ_VOUT_MIN		0xda
> +#define TPS25990_READ_VIN_AVG		0xdc
> +#define TPS25990_READ_VOUT_AVG		0xdd
> +#define TPS25990_READ_IIN_AVG		0xde
> +#define TPS25990_READ_PIN_AVG		0xdf
> +#define TPS25990_VIREF			0xe0
> +#define TPS25990_PK_MIN_AVG		0xea
> +#define  PK_MIN_AVG_RST_PEAK		BIT(7)
> +#define  PK_MIN_AVG_RST_AVG		BIT(6)
> +#define  PK_MIN_AVG_RST_MIN		BIT(5)
> +#define  PK_MIN_AVG_AVG_CNT		GENMASK(2, 0)
> +#define TPS25990_MFR_WRITE_PROTECT	0xf8
> +#define  TPS25990_UNLOCKED		BIT(7)
> +
> +#define TPS25990_8B_SHIFT		2
> +#define TPS25990_VIN_OVF_NUM		525100
> +#define TPS25990_VIN_OVF_DIV		10163
> +#define TPS25990_VIN_OVF_OFF		155
> +#define TPS25990_IIN_OCF_NUM		953800
> +#define TPS25990_IIN_OCF_DIV		129278
> +#define TPS25990_IIN_OCF_OFF		157
> +
> +#define PK_MIN_AVG_RST_MASK		(PK_MIN_AVG_RST_PEAK | \
> +					 PK_MIN_AVG_RST_AVG  | \
> +					 PK_MIN_AVG_RST_MIN)
> +
> +/*
> + * Arbitrary default Rimon value: 1kOhm
> + * This correspond to an overcurrent limit of 55A, close to the specified limit
> + * of un-stacked TPS25990 and makes further calculation easier to setup in
> + * sensor.conf, if necessary
> + */
> +#define TPS25990_DEFAULT_RIMON		1000000000
> +
> +static void tps25990_set_m(int *m, u32 rimon)
> +{
> +	u64 val = ((u64)*m) * rimon;
> +
> +	/* Make sure m fits the s32 type */
> +	*m = DIV_ROUND_CLOSEST_ULL(val, 1000000);
> +}
> +
> +static int tps25990_mfr_write_protect_set(struct i2c_client *client,
> +					  u8 protect)
> +{
> +	/*
> +	 * The chip has a single protection mode, set it regardless of
> +	 * the specific protection requested
> +	 */
> +	return pmbus_write_byte_data(client, -1, TPS25990_MFR_WRITE_PROTECT,
> +				     protect ? 0x0 : 0xa2);

After some thought, I think it would be better to reject all protect values
other than 0 (no write protection) and PB_WP_ALL because that is what the chip
supports. Something like

	if (protect & ~PB_WP_ALL)
		return -ENXIO;		// or -EINVAL ? Not really sure.

Thanks,
Guenter

