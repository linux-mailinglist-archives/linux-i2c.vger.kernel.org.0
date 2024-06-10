Return-Path: <linux-i2c+bounces-3958-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F213C90268E
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jun 2024 18:21:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7ECBB28B4E6
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jun 2024 16:21:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3CB2143896;
	Mon, 10 Jun 2024 16:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fNLFCYg0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF195142E8D;
	Mon, 10 Jun 2024 16:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718036471; cv=none; b=s+SNnai0YZZqIXR3r6nHsaqyDSTI0vsePwsDT25CTThpPzhWMCv8+Hzzf9HyN3W3yXLlPrfz09jDd0wTCAv5LkYxdiBDZJPGpd89hRniA0DwcfciV0wH93Li2lM9bGzt6ZHdwnAfUEMJ/2Lsk85cv4cATDv0hd8fb0qlXHAF6oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718036471; c=relaxed/simple;
	bh=yyHRulbBJaVZZ4XOx0I26lk8GT8Um4Jq+YMmX7aZpmM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kw9Y9mIQeDIBE6jMTRpMxObpELZnxBAOzNwuBLbGrHSpg9zx+Tk4o2otJLedvrbhOj6FVtnpS51xDEREqFjxMCEqKU3hXoUl6TwWOhZDpXfjDgjl0RJdGZfGd+4KFfH6guLRajtkv0cLVt1TyYExMOUFGScVFaIv2gvOjqoeywI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fNLFCYg0; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7043102dcc1so1555774b3a.2;
        Mon, 10 Jun 2024 09:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718036469; x=1718641269; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=9YBy+4sYTK4ntsC36I0MjqWOPjaLvyrKt7aPLW0U1VI=;
        b=fNLFCYg0g9OBj2DthbywljYD77kxni/9+AmSUOu6WCH+sHwEAiFXnc6+p5LgwCGv16
         w/jw8a4s1RZvZHAtI3yBaVISvwClKvmQ9kUPTCKdVcUePxOEbVB653E6xJC2j5CersIz
         pXAHnEkD96sGydEV2g9ZXDPxkJ1Eq1m1pV0UdrwvFRZg5/bhcIh2usnsr7sirfaXy1Ue
         cJaO883HPdhrrUNV5Vu5vIzycDRq8a3HWg/XjlExjL2Sg7G1hMSiszrBYXHAQcyC7lGn
         nCsKtE+wIdHv3YYxYifOi/ccayy+y/eoS/G5QzW1D4V1xR0zsz2WNRfT+jvz5KsTqISx
         Uiiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718036469; x=1718641269;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9YBy+4sYTK4ntsC36I0MjqWOPjaLvyrKt7aPLW0U1VI=;
        b=jTxJjUJD/sUrASQwBB9xLVfIsZ45ABSPwNwD/MunKQ8LZb8hnUOkngLQ3ECz57t0r6
         Tpn7tftVSrPx4CCgpZCoc43ywcrn42alA6GH3Ht/8oktGf5kCaV64RWB26VGv80oijec
         DeGhPCt2MTb4YWlqmULEk/45f0hSy6Biyp2O402j4YYE15ds0y6IGejrB7ZbQmy9Jc4L
         xzf7VvW0d99NWZXmE5+GxsxRfEyUXFQEPd9EvRpSVlKRT529TK+hvVYrSQFk32GttLap
         XQGdlRkRFKfdB8BavzEflb56QbtjAVOW31aocMaIqwMR8IGOxVMAZFTYAPS3Jh1YYyQU
         m4+A==
X-Forwarded-Encrypted: i=1; AJvYcCXrNq8fpZ4d3t3rJ3ARO3agCkIQU0sJKLkpJxFLUNSwH9dt5CUghzOVZp72EN/2dlcAhd/WeUxmZXTz50ERkzaTIWJqwNXvl7zCk1i5rtoR6yqZ0BCEs4UkX8ozuo2KPi/ttVBRhwebcozbcJMk3RASEM0XAdk93szPo7P9Ba/SOmUfTZtrl8T97HqRg6oD5X4rnyRQMMhgMFLpQAiVWfKI8sNTtEbtthAAfqd5N85P6sskz9FRK45f2m1k
X-Gm-Message-State: AOJu0Yycfh2e9+bZrxoE7HAYgK3kC15YMXqrghVzP6Myb1m4IV3IxGp7
	m67lpv3oXr0tJZDatHLHdKhlZGkfysEqz49ZFPRjxKaVm9Yebz7O
X-Google-Smtp-Source: AGHT+IFVFUToJdRftAHuDDEhr/XNrc1E0LRF4/u93yJjM/aIU4aKbxZ1LR0te7UL6bFFFhKJnrDWXw==
X-Received: by 2002:a05:6a00:228a:b0:6f3:368d:6f64 with SMTP id d2e1a72fcca58-7040c62917cmr12893399b3a.2.1718036469123;
        Mon, 10 Jun 2024 09:21:09 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6de265a2ce3sm5646259a12.61.2024.06.10.09.21.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jun 2024 09:21:08 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <2670a170-e638-4094-b9fe-064adb470b66@roeck-us.net>
Date: Mon, 10 Jun 2024 09:21:06 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] hwmon: add MP2993 driver
To: Noah Wang <noahwang.wang@outlook.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, jdelvare@suse.com
Cc: corbet@lwn.net, Delphine_CC_Chiu@Wiwynn.com, peteryin.openbmc@gmail.com,
 javier.carrasco.cruz@gmail.com, patrick.rudolph@9elements.com,
 bhelgaas@google.com, lukas@wunner.de, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20240607090544.466833-1-noahwang.wang@outlook.com>
 <SEYPR04MB6482D8AB26453B7DF4E98441FAFB2@SEYPR04MB6482.apcprd04.prod.outlook.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <SEYPR04MB6482D8AB26453B7DF4E98441FAFB2@SEYPR04MB6482.apcprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/7/24 02:05, Noah Wang wrote:
> Add support for MPS VR controller mp2993. This driver exposes
> telemetry and limit value readings and writtings.
> 
> Signed-off-by: Noah Wang <noahwang.wang@outlook.com>
> ---
>   Documentation/hwmon/index.rst  |   1 +
>   Documentation/hwmon/mp2993.rst | 150 ++++++++++++++++++
>   MAINTAINERS                    |   7 +
>   drivers/hwmon/pmbus/Kconfig    |   9 ++
>   drivers/hwmon/pmbus/Makefile   |   1 +
>   drivers/hwmon/pmbus/mp2993.c   | 269 +++++++++++++++++++++++++++++++++
>   6 files changed, 437 insertions(+)
>   create mode 100644 Documentation/hwmon/mp2993.rst
>   create mode 100644 drivers/hwmon/pmbus/mp2993.c
> 
> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
> index 03d313af469a..9d9d55b889f2 100644
> --- a/Documentation/hwmon/index.rst
> +++ b/Documentation/hwmon/index.rst
> @@ -166,6 +166,7 @@ Hardware Monitoring Kernel Drivers
>      mp2856
>      mp2888
>      mp2975
> +   mp2993
>      mp5023
>      mp5990
>      mpq8785
> diff --git a/Documentation/hwmon/mp2993.rst b/Documentation/hwmon/mp2993.rst
> new file mode 100644
> index 000000000000..a14bb30969f9
> --- /dev/null
> +++ b/Documentation/hwmon/mp2993.rst
> @@ -0,0 +1,150 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +Kernel driver mp2993
> +====================
> +
> +Supported chips:
> +
> +  * MPS mp2993
> +
> +    Prefix: 'mp2993'
> +
> +  * Datasheet
> +    https://scnbwymvp-my.sharepoint.com/:f:/g/personal/admin_scnbwy_com/Eth4kX1_J1hMsaASHiOYL4QBHU5a75r-tRfLKbHnJFdKLQ?e=vxj3DF
> +
> +Author:
> +
> +	Noah Wang <noahwang.wang@outlook.com>
> +
> +Description
> +-----------
> +
> +This driver implements support for Monolithic Power Systems, Inc. (MPS)
> +MP2993 Dual Loop Digital Multi-phase Controller.
> +
> +Device compliant with:
> +
> +- PMBus rev 1.3 interface.
> +
> +The driver exports the following attributes via the 'sysfs' files
> +for input voltage:
> +
> +**in1_input**
> +
> +**in1_label**
> +
> +**in1_crit**
> +
> +**in1_crit_alarm**
> +
> +**in1_lcrit**
> +
> +**in1_lcrit_alarm**
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
> +**in2_crit**
> +
> +**in2_crit_alarm**
> +
> +**in2_lcrit**
> +
> +**in2_lcrit_alarm**
> +
> +**in3_input**
> +
> +**in3_label**
> +
> +**in3_crit**
> +
> +**in3_crit_alarm**
> +
> +**in3_lcrit**
> +
> +**in3_lcrit_alarm**
> +
> +The driver provides the following attributes for input current:
> +
> +**curr1_input**
> +
> +**curr1_label**
> +
> +**curr1_max**
> +
> +**curr1_max_alarm**
> +
> +The driver provides the following attributes for output current:
> +
> +**curr2_input**
> +
> +**curr2_label**
> +
> +**curr2_crit**
> +
> +**curr2_crit_alarm**
> +
> +**curr2_max**
> +
> +**curr2_max_alarm**
> +
> +**curr3_input**
> +
> +**curr3_label**
> +
> +**curr3_crit**
> +
> +**curr3_crit_alarm**
> +
> +**curr3_max**
> +
> +**curr3_max_alarm**
> +
> +The driver provides the following attributes for input power:
> +
> +**power1_input**
> +
> +**power1_label**
> +
> +The driver provides the following attributes for output power:
> +
> +**power2_input**
> +
> +**power2_label**
> +
> +**power3_input**
> +
> +**power3_label**
> +
> +The driver provides the following attributes for temperature:
> +
> +**temp1_input**
> +
> +**temp1_crit**
> +
> +**temp1_crit_alarm**
> +
> +**temp1_max**
> +
> +**temp1_max_alarm**
> +
> +**temp2_input**
> +
> +**temp2_crit**
> +
> +**temp2_crit_alarm**
> +
> +**temp2_max**
> +
> +**temp2_max_alarm**
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8754ac2c259d..f47f3e13b004 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15258,6 +15258,13 @@ S:	Maintained
>   F:	Documentation/devicetree/bindings/leds/backlight/mps,mp3309c.yaml
>   F:	drivers/video/backlight/mp3309c.c
>   
> ++MPS MP2993 DRIVER
> ++M:	Noah Wang <noahwang.wang@outlook.com>
> ++L:	linux-hwmon@vger.kernel.org
> ++S:	Maintained
> ++F:	Documentation/hwmon/mp2993.rst
> ++F:	drivers/hwmon/pmbus/mp2993.c
> +
>   MR800 AVERMEDIA USB FM RADIO DRIVER
>   M:	Alexey Klimov <klimov.linux@gmail.com>
>   L:	linux-media@vger.kernel.org
> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> index 08e82c457356..d875d31ce84c 100644
> --- a/drivers/hwmon/pmbus/Kconfig
> +++ b/drivers/hwmon/pmbus/Kconfig
> @@ -346,6 +346,15 @@ config SENSORS_MP2975
>   	  This driver can also be built as a module. If so, the module will
>   	  be called mp2975.
>   
> +config SENSORS_MP2993
> +	tristate "MPS MP2993"
> +	help
> +	  If you say yes here you get hardware monitoring support for MPS
> +	  MP2993 Dual Loop Digital Multi-Phase Controller.
> +
> +	  This driver can also be built as a module. If so, the module will
> +	  be called mp2993.
> +
>   config SENSORS_MP2975_REGULATOR
>   	depends on SENSORS_MP2975 && REGULATOR
>   	bool "Regulator support for MPS MP2975"
> diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
> index 2279b3327bbf..312d3f0c0540 100644
> --- a/drivers/hwmon/pmbus/Makefile
> +++ b/drivers/hwmon/pmbus/Makefile
> @@ -37,6 +37,7 @@ obj-$(CONFIG_SENSORS_MAX8688)	+= max8688.o
>   obj-$(CONFIG_SENSORS_MP2856)	+= mp2856.o
>   obj-$(CONFIG_SENSORS_MP2888)	+= mp2888.o
>   obj-$(CONFIG_SENSORS_MP2975)	+= mp2975.o
> +obj-$(CONFIG_SENSORS_MP2993)	+= mp2993.o
>   obj-$(CONFIG_SENSORS_MP5023)	+= mp5023.o
>   obj-$(CONFIG_SENSORS_MP5990)	+= mp5990.o
>   obj-$(CONFIG_SENSORS_MPQ7932)	+= mpq7932.o
> diff --git a/drivers/hwmon/pmbus/mp2993.c b/drivers/hwmon/pmbus/mp2993.c
> new file mode 100644
> index 000000000000..43432b8d4faf
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/mp2993.c
> @@ -0,0 +1,269 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Hardware monitoring driver for MPS Multi-phase Digital VR Controllers(MP2993)
> + */
> +
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include "pmbus.h"
> +
> +#define MP2993_VOUT_OVUV_UINT	125
> +#define MP2993_VOUT_OVUV_DIV	64
> +#define MP2993_VIN_LIMIT_UINT	1
> +#define MP2993_VIN_LIMIT_DIV	8
> +#define MP2993_READ_VIN_UINT	1
> +#define MP2993_READ_VIN_DIV	32
> +
> +#define MP2993_PAGE_NUM	2
> +
> +#define MP2993_RAIL1_FUNC	(PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | \
> +							PMBUS_HAVE_IOUT | PMBUS_HAVE_POUT | \
> +							PMBUS_HAVE_TEMP | PMBUS_HAVE_PIN | \
> +							PMBUS_HAVE_IIN | \
> +							PMBUS_HAVE_STATUS_VOUT | \
> +							PMBUS_HAVE_STATUS_IOUT | \
> +							PMBUS_HAVE_STATUS_TEMP | \
> +							PMBUS_HAVE_STATUS_INPUT)
> +
> +#define MP2993_RAIL2_FUNC	(PMBUS_HAVE_VOUT | PMBUS_HAVE_IOUT | \
> +							 PMBUS_HAVE_POUT | PMBUS_HAVE_TEMP | \
> +							 PMBUS_HAVE_STATUS_VOUT | \
> +							 PMBUS_HAVE_STATUS_IOUT | \
> +							 PMBUS_HAVE_STATUS_TEMP | \
> +							 PMBUS_HAVE_STATUS_INPUT)
> +
> +/* Converts a linear11 data exponent to a specified value */
> +static u16 mp2993_linear11_exponent_transfer(u16 word, u16 expect_exponent)
> +{
> +	s16 exponent, mantissa, target_exponent;
> +
> +	exponent = ((s16)word) >> 11;
> +	mantissa = ((s16)((word & 0x7ff) << 5)) >> 5;
> +	target_exponent = (s16)((expect_exponent & 0x1f) << 11) >> 11;
> +
> +	if (exponent > target_exponent)
> +		mantissa = mantissa << (exponent - target_exponent);
> +	else
> +		mantissa = mantissa >> (target_exponent - exponent);
> +
> +	return (mantissa & 0x7ff) | ((expect_exponent << 11) & 0xf800);
> +}
> +
> +static int
> +mp2993_set_vout_format(struct i2c_client *client, int page, int format)
> +{
> +	int ret;
> +
> +	ret = i2c_smbus_write_byte_data(client, PMBUS_PAGE, page);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = i2c_smbus_write_byte_data(client, PMBUS_VOUT_MODE, format);
> +	if (ret < 0)
> +		return ret;

	return i2c_smbus_write_byte_data(...);

> +
> +	return 0;
> +}
> +
> +static int mp2993_identify(struct i2c_client *client, struct pmbus_driver_info *info)
> +{
> +	int ret;
> +
> +	/* Set vout to direct format for rail1. */
> +	ret = mp2993_set_vout_format(client, 0, PB_VOUT_MODE_DIRECT);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Set vout to direct format for rail2. */
> +	ret = mp2993_set_vout_format(client, 1, PB_VOUT_MODE_DIRECT);
> +	if (ret < 0)
> +		return ret;
> +
> +	return ret;


In other words,
	if (ret < 0)
		return ret;
	else
		return ret;

Please, don't do that.

	return mp2993_set_vout_format(...);

> +}
> +
> +static int mp2993_read_word_data(struct i2c_client *client, int page, int phase,
> +				 int reg)
> +{
> +	int ret;
> +
> +	switch (reg) {
> +	case PMBUS_VOUT_OV_FAULT_LIMIT:
> +	case PMBUS_VOUT_UV_FAULT_LIMIT:
> +		ret = pmbus_read_word_data(client, page, phase, reg);
> +		if (ret < 0)
> +			return ret;
> +
> +		ret = DIV_ROUND_CLOSEST(ret * MP2993_VOUT_OVUV_UINT, MP2993_VOUT_OVUV_DIV);
> +		break;
> +	case PMBUS_OT_FAULT_LIMIT:
> +	case PMBUS_OT_WARN_LIMIT:
> +		/*
> +		 * The MP2993 ot fault limit value and ot warn limit value
> +		 * per rail are always the same, so only PMBUS_OT_FAULT_LIMIT
> +		 * and PMBUS_OT_WARN_LIMIT register in page 0 are defined to
> +		 * indicates the limit value.
> +		 */
> +		ret = pmbus_read_word_data(client, 0, phase, reg);
> +		break;
> +	case PMBUS_READ_VIN:
> +		/* The MP2993 vin scale is (1/32V)/Lsb */
> +		ret = pmbus_read_word_data(client, page, phase, reg);
> +		if (ret < 0)
> +			return ret;
> +
> +		ret = DIV_ROUND_CLOSEST((ret & GENMASK(9, 0)) * MP2993_READ_VIN_UINT,
> +					MP2993_READ_VIN_DIV);
> +		break;
> +	case PMBUS_VIN_OV_FAULT_LIMIT:
> +	case PMBUS_VIN_OV_WARN_LIMIT:
> +	case PMBUS_VIN_UV_WARN_LIMIT:
> +	case PMBUS_VIN_UV_FAULT_LIMIT:
> +		/* The MP2993 vin limit scale is (1/8V)/Lsb */
> +		ret = pmbus_read_word_data(client, page, phase, reg);
> +		if (ret < 0)
> +			return ret;
> +
> +		ret = DIV_ROUND_CLOSEST((ret & GENMASK(7, 0)) * MP2993_VIN_LIMIT_UINT,
> +					MP2993_VIN_LIMIT_DIV);
> +		break;
> +	case PMBUS_READ_IOUT:
> +	case PMBUS_READ_IIN:
> +	case PMBUS_IIN_OC_WARN_LIMIT:
> +	case PMBUS_IOUT_OC_FAULT_LIMIT:
> +	case PMBUS_IOUT_OC_WARN_LIMIT:
> +	case PMBUS_READ_VOUT:
> +	case PMBUS_READ_PIN:
> +	case PMBUS_READ_POUT:
> +	case PMBUS_READ_TEMPERATURE_1:
> +		ret = -ENODATA;
> +		break;
> +	default:
> +		ret = -EINVAL;
> +		break;
> +	}
> +
> +	return ret;
> +}
> +
> +static int mp2993_write_word_data(struct i2c_client *client, int page, int reg,
> +				  u16 word)
> +{
> +	int ret;
> +
> +	switch (reg) {
> +	case PMBUS_VOUT_OV_FAULT_LIMIT:
> +	case PMBUS_VOUT_UV_FAULT_LIMIT:
> +		ret = DIV_ROUND_CLOSEST(word * MP2993_VOUT_OVUV_DIV, MP2993_VOUT_OVUV_UINT);
> +		ret = pmbus_write_word_data(client, 0, reg, ret);
> +		break;
> +	case PMBUS_OT_FAULT_LIMIT:
> +	case PMBUS_OT_WARN_LIMIT:
> +		/*
> +		 * The MP2993 ot fault limit value and ot warn limit value
> +		 * per rail are always the same, so only PMBUS_OT_FAULT_LIMIT
> +		 * and PMBUS_OT_WARN_LIMIT register in page 0 are defined to
> +		 * config the ot limit value.
> +		 */
> +		ret = pmbus_write_word_data(client, 0, reg, word);
> +		break;
> +	case PMBUS_VIN_OV_FAULT_LIMIT:
> +	case PMBUS_VIN_OV_WARN_LIMIT:
> +	case PMBUS_VIN_UV_WARN_LIMIT:
> +	case PMBUS_VIN_UV_FAULT_LIMIT:
> +		/* The MP2993 vin limit scale is (1/8V)/Lsb */
> +		ret = pmbus_write_word_data(client, 0, reg,
> +					    DIV_ROUND_CLOSEST(word * MP2993_VIN_LIMIT_DIV,
> +							      MP2993_VIN_LIMIT_UINT));
> +		break;
> +	case PMBUS_IIN_OC_WARN_LIMIT:
> +		/*
> +		 * The PMBUS_IIN_OC_WARN_LIMIT of MP2993 is linear11 format,
> +		 * and the exponent is a constant value(5'b00000)， so the
> +		 * exponent of word parameter should be converted to 5'b00000.
> +		 */
> +		ret = pmbus_write_word_data(client, page, reg,
> +					    mp2993_linear11_exponent_transfer(word, 0x00));
> +		break;
> +		//
> +	case PMBUS_IOUT_OC_FAULT_LIMIT:
> +	case PMBUS_IOUT_OC_WARN_LIMIT:
> +		/*
> +		 * The PMBUS_IOUT_OC_FAULT_LIMIT and PMBUS_IOUT_OC_WARN_LIMIT
> +		 * of MP2993 can be regarded as linear11 format, and the
> +		 * exponent is a 5'b00001 or 5'b00000. To ensure a larger
> +		 * range of limit value, so the exponent of word parameter
> +		 * should be converted to 5'b00001.
> +		 */
> +		ret = pmbus_write_word_data(client, page, reg,
> +					    mp2993_linear11_exponent_transfer(word, 0x01));
> +		break;
> +	default:
> +		ret = -EINVAL;
> +		break;
> +	}
> +
> +	return ret;
> +}
> +
> +static struct pmbus_driver_info mp2993_info = {
> +	.pages = MP2993_PAGE_NUM,
> +	.format[PSC_VOLTAGE_IN] = direct,
> +	.format[PSC_CURRENT_IN] = linear,
> +	.format[PSC_CURRENT_OUT] = linear,
> +	.format[PSC_TEMPERATURE] = direct,
> +	.format[PSC_POWER] = linear,
> +	.format[PSC_VOLTAGE_OUT] = direct,
> +
> +	.m[PSC_VOLTAGE_OUT] = 1,
> +	.R[PSC_VOLTAGE_OUT] = 3,
> +	.b[PSC_VOLTAGE_OUT] = 0,
> +
> +	.m[PSC_VOLTAGE_IN] = 1,
> +	.R[PSC_VOLTAGE_IN] = 0,
> +	.b[PSC_VOLTAGE_IN] = 0,
> +
> +	.m[PSC_TEMPERATURE] = 1,
> +	.R[PSC_TEMPERATURE] = 0,
> +	.b[PSC_TEMPERATURE] = 0,
> +
> +	.func[0] = MP2993_RAIL1_FUNC,
> +	.func[1] = MP2993_RAIL2_FUNC,
> +	.read_word_data = mp2993_read_word_data,
> +	.write_word_data = mp2993_write_word_data,
> +	.identify = mp2993_identify,
> +};
> +
> +static int mp2993_probe(struct i2c_client *client)
> +{
> +	return pmbus_do_probe(client, &mp2993_info);
> +}
> +
> +static const struct i2c_device_id mp2993_id[] = {
> +	{"mp2993", 0},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(i2c, mp2993_id);
> +
> +static const struct of_device_id __maybe_unused mp2993_of_match[] = {
> +	{.compatible = "mps,mp2993"},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, mp2993_of_match);
> +
> +static struct i2c_driver mp2993_driver = {
> +	.driver = {
> +		.name = "mp2993",
> +		.of_match_table = mp2993_of_match,
> +	},
> +	.probe = mp2993_probe,
> +	.id_table = mp2993_id,
> +};
> +
> +module_i2c_driver(mp2993_driver);
> +
> +MODULE_AUTHOR("Noah Wang <noahwang.wang@outlook.com>");
> +MODULE_DESCRIPTION("PMBus driver for MPS MP2993");
> +MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS(PMBUS);


