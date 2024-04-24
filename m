Return-Path: <linux-i2c+bounces-3109-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 579558B0D6F
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Apr 2024 16:58:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B1211C249EB
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Apr 2024 14:58:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BBCB15F31F;
	Wed, 24 Apr 2024 14:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lbswhj58"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7426B15ECFE;
	Wed, 24 Apr 2024 14:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713970723; cv=none; b=VZyC5Njw79pf2LrZOHggv8/MQl8StkVgXcpbo+4rBgN1Ob53YiAIE9JoHf2io/kLkTVtNqc7UWlnbkTjZ1YxXTeTFqLdGUcfI2E1FKzXmKOw5TE+uYmnf92hkrs/gyfzIKdMTfGM3PL725MfVpXfIgjj/lZsRL0fTVvpuAXbwnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713970723; c=relaxed/simple;
	bh=wj+MmZtf5+VASW9gIjSu3qcMMHPCxn+8ARLhlwlyrFY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ZQZEhClng0yVk0FDYI50/lWZP5EUBJb1PoE/QCPDYm0KtgouI6df34N6i1JHoFPr/NX3YJc+qaqQtNjnyKkpIn8Jx79jkj7bcCvAUAJr8EfJxoOtBr7LM5d6nzNcCBLikq0BkXXvztnsksj5LIqYd8H+hY5iTcxvtny19Md2cBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lbswhj58; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1e83a2a4f2cso40334285ad.1;
        Wed, 24 Apr 2024 07:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713970721; x=1714575521; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=BqCRomP2j+KXQnk5cDEaaIseDhvWGvZmbsLHr51E5oU=;
        b=lbswhj58K38wqZPJIWbBs/CPjMY+pNmwIqUwMRcqA0VNwx+w7mydTbNkyzJwqRE56M
         8HUOjLQgCNy9upYSTVOtaOVQiBZ9cC4Ir8hlKGzNsc9/dmXyS/W41Y83TOrMYbcZbR5N
         T9QJ6XdgohjsCMvoMWTnUHZNOCp7YTrDAVedJCu5XqtNmhrbaaNdfOrP2oWfWpzvOjh7
         JrabfBb1/KjPijEFiIla9nVOUFlXvGGGABPSE2XJDZnL1iR34XBI62RrBov0HBIpXxbK
         L/Bdl56jYDwGIiYras3A5A3BYwRX9EhTZ4cpHtaFk1Qy6KojTjllSb3qUoq7wwcw4R/d
         H+dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713970721; x=1714575521;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BqCRomP2j+KXQnk5cDEaaIseDhvWGvZmbsLHr51E5oU=;
        b=p8ExgPDszKwOs2Dq9HjJ/stKzOBVtUdL/NsytbyWvMYExK8qTH1zoupF90+8qkC19t
         Wa78LljjU/0fuSypZpI9kOeQ7Q0EHwr/Vqj1NfurBkGSMM1HT/YLK4A+coTiYxoppHWN
         a0mHqrF8R/KTu96CoSk8J7mwElS1qyAWCVpqAPgOOuqky2sH0eHV6vaPheYAMOmXedA9
         RxOe7Rq0s1T5zTy2zzJfUBkGcDl8mf6PSgGG1Rp0MZg+bER8/umXPiucORUojXfBUs6m
         TT+LXhrWXHwD4vG9/YofbOKDN/Ol5/6gXkRx9B/vJTZG4v4jnSlXROKJW9oaP5Vt+Egb
         CKTw==
X-Forwarded-Encrypted: i=1; AJvYcCWGO/o5IbamLHpJOvVhrm8FD8arOwWZnlRFlgxOk00TLf9/r36FDJRK5h7yK7o6IsZ3OOngQk134e3kSU0MFPNEy63e+baDDlgrbCCRs4/zT86daCVChI1HNqJTErFkwe7E8g3FiRk0TGoxLyHDiraiY+DY0JnwSvcicpvGWSMBwcJoUHkDfpHVLT6Dztp+librkJDiLM8NrXustbZhRP/uZQ9/twX9cEe03NGjipM5kdHwLKrJ8jh69Ww4
X-Gm-Message-State: AOJu0YyOi1MWtX5b1HHYYjo02RSchZ48JE0sYbTNoyLBlL6Hl+QoQu4T
	nRftRetyWMVoGW9pxVvJ3smbZYVFUqV0aaeg3DSUtrJSabdvVJdR
X-Google-Smtp-Source: AGHT+IELqL/OYTBYFMKKpWyzTxsQH2QVHDHpPYQodRl8lZ9PEaUxgBceVpm5bknl0arSGS1Dc1h/8w==
X-Received: by 2002:a17:902:e849:b0:1e4:32ba:1ef with SMTP id t9-20020a170902e84900b001e432ba01efmr3024385plg.13.1713970720597;
        Wed, 24 Apr 2024 07:58:40 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id n6-20020a170903110600b001e668c1060bsm11995475plh.122.2024.04.24.07.58.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Apr 2024 07:58:39 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <430da9c0-f865-43e5-b9f0-935f8b68763e@roeck-us.net>
Date: Wed, 24 Apr 2024 07:58:37 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] hwmon: (pmbus) Add support for Infineon XDP710
To: Peter Yin <peteryin.openbmc@gmail.com>, patrick@stwcx.xyz,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>,
 Patrick Rudolph <patrick.rudolph@9elements.com>,
 Michal Simek <michal.simek@amd.com>, Marek Vasut <marex@denx.de>,
 Bjorn Helgaas <bhelgaas@google.com>, Lukas Wunner <lukas@wunner.de>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-i2c@vger.kernel.org
References: <20240424095604.3425857-1-peteryin.openbmc@gmail.com>
 <20240424095604.3425857-2-peteryin.openbmc@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20240424095604.3425857-2-peteryin.openbmc@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/24/24 02:55, Peter Yin wrote:
> Add support for xdp710 device from Infineon vendor.

Drop "vendor". Maybe "Add support for Infineon XDP710.".

> This is a Hot-Swap Controller.
> 
> Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
> ---
>   drivers/hwmon/pmbus/Kconfig  |   9 ++
>   drivers/hwmon/pmbus/Makefile |   1 +
>   drivers/hwmon/pmbus/xdp710.c | 155 +++++++++++++++++++++++++++++++++++
>   3 files changed, 165 insertions(+)
>   create mode 100644 drivers/hwmon/pmbus/xdp710.c
> 
> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> index 557ae0c414b0..d72bdecf758a 100644
> --- a/drivers/hwmon/pmbus/Kconfig
> +++ b/drivers/hwmon/pmbus/Kconfig
> @@ -511,6 +511,15 @@ config SENSORS_UCD9200
>   	  This driver can also be built as a module. If so, the module will
>   	  be called ucd9200.
>   
> +config SENSORS_XDP710
> +	tristate "Infineon XDP710 family"
> +	help
> +	  If you say yes here you get hardware monitoring support for Infineon
> +	  XDP710 device.
> +
Drop "device"

> +	  This driver can also be built as a module. If so, the module will
> +	  be called xdp710.
> +
>   config SENSORS_XDPE152
>   	tristate "Infineon XDPE152 family"
>   	help
> diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
> index f14ecf03ad77..4fe630793721 100644
> --- a/drivers/hwmon/pmbus/Makefile
> +++ b/drivers/hwmon/pmbus/Makefile
> @@ -51,6 +51,7 @@ obj-$(CONFIG_SENSORS_TPS53679)	+= tps53679.o
>   obj-$(CONFIG_SENSORS_TPS546D24)	+= tps546d24.o
>   obj-$(CONFIG_SENSORS_UCD9000)	+= ucd9000.o
>   obj-$(CONFIG_SENSORS_UCD9200)	+= ucd9200.o
> +obj-$(CONFIG_SENSORS_XDP710)	+= xdp710.o
>   obj-$(CONFIG_SENSORS_XDPE122)	+= xdpe12284.o
>   obj-$(CONFIG_SENSORS_XDPE152)	+= xdpe152c4.o
>   obj-$(CONFIG_SENSORS_ZL6100)	+= zl6100.o
> diff --git a/drivers/hwmon/pmbus/xdp710.c b/drivers/hwmon/pmbus/xdp710.c
> new file mode 100644
> index 000000000000..3ed324bd0db6
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/xdp710.c
> @@ -0,0 +1,155 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Driver for Infineon XDP710 Hot-Swap Controller
> + */
> +
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/bitops.h>

Include files in alphabetic order, please.

> +#include "pmbus.h"
> +
> +#define XDP710_REG_CFG		(0xD3)
> +#define XDP710_V_SNS_CFG	(0xD4)
> +#define XDP710_CS_RNG		(0xD5)

Unnecessary ( )

> +
> +struct xdp710_data {
> +	struct pmbus_driver_info info;
> +	u8 cs_rng;
> +	u8 vtlm_rng;
> +	int rsense;

I don't see those values used outside the probe function,
meaning it is unnecessary to keep them in struct xdp710_data.

> +};
> +
> +/*
> + * 0x00 to 0x09
> + * 0x0A to 0x13
> + * 0x14 to 0x1D
> + * 0x1E to 0x27
> + * 0x28 to 0x32
> + * 0x33 to 0x3F

Pointless comment. Who is supposed to understand what it means ?
Besides, if it does mean what I think it is (matching lines of values
in the array below), it is wrong and misleading. The last line in
the array starts at index 0x32 (50) and ends at 0x3b (59).

I more useful comment would be something like "table to map configuration
register values to sense resistor values" or similar.

> + */
> +const int microOhmRsense[] = {
> +	200, 250, 300, 330, 400, 470, 500, 600, 670, 700,
> +	750, 800, 900, 1000, 1100, 1200, 1250, 1300, 1400, 1500,
> +	1600, 1700, 1800, 1900, 2000, 2100, 2200, 2300, 2400, 2500,
> +	2600, 2700, 2800, 3000, 3100, 3200, 3300, 3400, 3500, 3600,
> +	3800, 3900, 4000, 4200, 4300, 4500, 4700, 4800, 4900, 5000,
> +	5500, 6000, 6500, 7000, 7500, 8000, 8500, 9000, 9500, 10000

This array has only 60 entries. The configuration register field
is 6 bits wide. This means that configuration register values
of 0x3c..0x3f will access values beyond the end of the array.

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
> +	struct xdp710_data *data;
> +	int ret;
> +	int m = 0;
> +
> +	data = devm_kzalloc(&client->dev, sizeof(struct xdp710_data),
> +			    GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	memcpy(&data->info, &xdp710_info, sizeof(*info));
> +	info = &data->info;
> +
> +	/*
> +	 * Read CS_RNG Value
> +	 */

Those comments are pointless and similar to

	x = 5; /* add 5 to x */

> +	ret = i2c_smbus_read_word_data(client, XDP710_CS_RNG);
> +	if (ret < 0) {
> +		dev_err(&client->dev,
> +			"Can't get CS_RNG. Setting the CS_RNG to 0");

If this is an error, abort the probe function and return it.
If not, don't use dev_err().

> +		ret = 0;
> +	}
> +	data->cs_rng = (ret >> 6) & GENMASK(1, 0);
> +
> +	/*
> +	 * Read V_SNS_CFG Value
> +	 */
> +	ret = i2c_smbus_read_word_data(client, XDP710_V_SNS_CFG);
> +	if (ret < 0) {
> +		dev_err(&client->dev,
> +			"Can't get V_SNS_CFG. Setting the V_SNS_CFG to 0");

Same as above.

> +		ret = 0;
> +	}
> +	data->vtlm_rng = ret & GENMASK(1, 0);
> +
> +	/*
> +	 * Read RSNS_CFG Value
> +	 */
> +	ret = i2c_smbus_read_word_data(client, XDP710_REG_CFG);
> +	if (ret < 0) {
> +		dev_err(&client->dev,
> +			"Can't get REG_CFG, Setting the Rsense to 0.33mohm");

And again. Overall, I do think that those errors should be treated as fatal.
I don't see a reason for ignoring them. If accessing the chip fails on that
level, it probably fails entirely. If you want to assign defaults after
smbus errors, please explain in detail in a comment why this makes sense
and doesn't mean that the chip is not accessible.

> +		ret = 3;
> +	}
> +	ret &= GENMASK(5, 0);
> +	data->rsense = microOhmRsense[(u8)ret];

Unnecessary type cast.

> +
> +	info->m[PSC_VOLTAGE_IN] <<= data->vtlm_rng;
> +	info->m[PSC_VOLTAGE_OUT] <<= data->vtlm_rng;
> +
> +	m = info->m[PSC_CURRENT_OUT];
> +	info->m[PSC_CURRENT_OUT] = ((m >> (data->cs_rng)) *
> +				   (data->rsense)) / 1000;

Unnecessary () around data->cs_rng and data->rsense and around
the multiplication.

	info->m[PSC_CURRENT_OUT] = (m >> data->cs_rng) * data->rsense / 1000;

However, it seems to me that the right shift will result in accuracy
loss. Something like
	info->m[PSC_CURRENT_OUT] = ((m * rsense) >> data->cs_rng) / 1000;
might avoid that.

> +
> +	m = info->m[PSC_POWER];
> +	info->m[PSC_POWER] = ((m >> (data->cs_rng)) *
> +			     (data->rsense)) / 1000;

Unnecessary () around data->cs_rng and data->rsense and around
the multiplication.

Your call, but DIV_ROUND_CLOSEST() might result in better accuracy.

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


