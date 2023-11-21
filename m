Return-Path: <linux-i2c+bounces-371-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9E37F3366
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Nov 2023 17:14:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E7AE8B21FFC
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Nov 2023 16:13:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D4315A0EB;
	Tue, 21 Nov 2023 16:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GdLSBjVA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4223D47;
	Tue, 21 Nov 2023 08:13:45 -0800 (PST)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-6bee11456baso4869036b3a.1;
        Tue, 21 Nov 2023 08:13:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700583225; x=1701188025; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=/q46EpJ3OfsV5qo9BEVEwhl8kJbGDcAbuVAits3YSDI=;
        b=GdLSBjVAx05VaI81axD16MjePSvIXErYEQGtyesWVnK1+UX83nSBglUmk2nl6LnktQ
         EFPGU0coFfCC3cNXG0iBmgLT2XYrBOJF+9SK1hJpV9WBZuUl3WSMa/DtltwADR0kLfb8
         HYz5XK/qTsXReH3cafYoPlF6F1J0hktkSAMjRIInNn7IctF3OmK+PSyM2DJSERfcv62g
         Dos/3MjZ5eiby69g+tQczTN6BUg9T9j9Y7eOV2FlwaZqz4HmgfeWVHVHMNn07VUl/pV/
         jD/xE3m8+FHnIdIxWXP1XuFgb0DY3lRiRnKS7ql3jeSN1PX+3YVEC9bm1FqsedHPczru
         Qc+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700583225; x=1701188025;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/q46EpJ3OfsV5qo9BEVEwhl8kJbGDcAbuVAits3YSDI=;
        b=nKP0lm/vIrRzQPb86/u58FqSFzcKmlQ1kui5wB7+KAC61N2Ul97+O2IBnX5HzC2xeo
         tuho5xvnZJ/9P796XpHAMyvtElwqK5s8XQPb5cJYQvhwJkFSoiPqBz7S5tHwM2YQ9QE5
         yLPBoZ7AAurqoYkqXdTNob550RZ4ZXXTr84UE5tar6oOl2rGQuMt1b8vXkVMFELpTH9O
         YhLNfXGnjauKOfkcJcqkr+LI7hy7wmjJsoqO7+9w+wIa9xCt/1MAMW3HN65rDgOzQWux
         a0QP9IEgsgRW22MQ9kDdNeh7NJBLt4KDk+8ICCrzRfuRKdTr6tbhzf5BJlX8SDs7jcm+
         8jlw==
X-Gm-Message-State: AOJu0Yzt8nzdd0BTTYnyrS6heCnLWfyzcWsELzNYt0INsfJdgvlp2MCC
	9y7F7zBq2VqAMb6wqWVJv1Y=
X-Google-Smtp-Source: AGHT+IGJZcKfCtBmO6dbIbP4xn/SCiYxhTNXH0656G7h0uNh9lJbW6XJU7B/OKxrrWGGAoxIfv8jIA==
X-Received: by 2002:a05:6a21:9209:b0:174:7f7:d049 with SMTP id tl9-20020a056a21920900b0017407f7d049mr11619652pzb.9.1700583225051;
        Tue, 21 Nov 2023 08:13:45 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x20-20020aa784d4000000b006cbbc07a1c0sm1729433pfn.156.2023.11.21.08.13.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Nov 2023 08:13:44 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <5eff3abe-c3de-4d98-87c2-2b82bcd2f826@roeck-us.net>
Date: Tue, 21 Nov 2023 08:13:42 -0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] hwmon: pmbus: Add ltc4286 driver
Content-Language: en-US
To: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>, patrick@stwcx.xyz,
 Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-i2c@vger.kernel.org,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20231121050757.2108786-1-Delphine_CC_Chiu@Wiwynn.com>
 <20231121050757.2108786-3-Delphine_CC_Chiu@Wiwynn.com>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20231121050757.2108786-3-Delphine_CC_Chiu@Wiwynn.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/20/23 21:07, Delphine CC Chiu wrote:
> Add a driver to support ltc4286 chip
> 
> Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
> ---
> Changelog:
>    v6 - Check VRANGE_SELECT before driver loading
>    v5 - Check the overflow when reading rsense
>       - Set default rsense value
>    v4 - Add empty line before "config SENSORS_LTC4286" in Kconfig
>       - Add ltc4286 to Documentation/hwmon/index.rst
>       - Revise comment typo
>       - Use devm_kmemdup instead of memcpy
>       - Check MBR value before writting into
>    v3 - Use dev_err_probe() instead of dev_err()
>       - The VRANGE_SELECT bit only be written if it actually changed
>       - Avoid the info pointer being overwritten
>       - Check the MBR value range to avoid overflow
>       - Revise ltc4286.rst to corrcet description
>    v2 - Revise Linear Technologies LTC4286 to
>         Analog Devices LTC4286 in Kconfig
>       - Add more description for this driver in Kconfig
>       - Add some comments for MBR setting in ltc4286.c
>       - Add ltc4286.rst
> ---
>   Documentation/hwmon/index.rst   |   1 +
>   Documentation/hwmon/ltc4286.rst |  95 +++++++++++++++++
>   drivers/hwmon/pmbus/Kconfig     |  10 ++
>   drivers/hwmon/pmbus/Makefile    |   1 +
>   drivers/hwmon/pmbus/ltc4286.c   | 183 ++++++++++++++++++++++++++++++++
>   5 files changed, 290 insertions(+)
>   create mode 100644 Documentation/hwmon/ltc4286.rst
>   create mode 100644 drivers/hwmon/pmbus/ltc4286.c
> 
> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
> index 72f4e6065bae..080827cc4c34 100644
> --- a/Documentation/hwmon/index.rst
> +++ b/Documentation/hwmon/index.rst
> @@ -128,6 +128,7 @@ Hardware Monitoring Kernel Drivers
>      ltc4245
>      ltc4260
>      ltc4261
> +   ltc4286
>      max127
>      max15301
>      max16064
> diff --git a/Documentation/hwmon/ltc4286.rst b/Documentation/hwmon/ltc4286.rst
> new file mode 100644
> index 000000000000..2cd149676d86
> --- /dev/null
> +++ b/Documentation/hwmon/ltc4286.rst
> @@ -0,0 +1,95 @@
> +.. SPDX-License-Identifier: GPL-2.0-or-later
> +
> +Kernel driver ltc4286
> +=====================
> +
> +Supported chips:
> +
> +  * Analog Devices LTC4286
> +
> +    Prefix: 'ltc4286'
> +
> +    Addresses scanned: -
> +
> +    Datasheet: https://www.analog.com/media/en/technical-documentation/data-sheets/ltc4286.pdf
> +
> +  * Analog Devices LTC4287
> +
> +    Prefix: 'ltc4287'
> +
> +    Addresses scanned: -
> +
> +    Datasheet: https://www.analog.com/media/en/technical-documentation/data-sheets/ltc4287.pdf
> +
> +Author: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
> +
> +
> +Description
> +-----------
> +
> +This driver supports hardware monitoring for Analog Devices LTC4286
> +and LTC4287 Hot-Swap Controller and Digital Power Monitors.
> +
> +LTC4286 and LTC4287 are hot-swap controllers that allow a circuit board
> +to be removed from or inserted into a live backplane. They also feature
> +current and voltage readback via an integrated 12 bit analog-to-digital
> +converter (ADC), accessed using a PMBus interface.
> +
> +The driver is a client driver to the core PMBus driver. Please see
> +Documentation/hwmon/pmbus.rst for details on PMBus client drivers.
> +
> +
> +Usage Notes
> +-----------
> +
> +This driver does not auto-detect devices. You will have to instantiate the
> +devices explicitly. Please see Documentation/i2c/instantiating-devices.rst for
> +details.
> +
> +The shunt value in micro-ohms can be set via device tree at compile-time. Please
> +refer to the Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml for bindings
> +if the device tree is used.
> +
> +
> +Platform data support
> +---------------------
> +
> +The driver supports standard PMBus driver platform data. Please see
> +Documentation/hwmon/pmbus.rst for details.
> +
> +
> +Sysfs entries
> +-------------
> +
> +The following attributes are supported. Limits are read-write, history reset
> +attributes are write-only, all other attributes are read-only.
> +
> +======================= =======================================================
> +in1_label		"vin"
> +in1_input		Measured voltage.
> +in1_alarm		Input voltage alarm.
> +in1_min 		Minimum input voltage.
> +in1_max 		Maximum input voltage.
> +
> +in2_label		"vout1"
> +in2_input		Measured voltage.
> +in2_alarm		Output voltage alarm.
> +in2_min 		Minimum output voltage.
> +in2_max 		Maximum output voltage.
> +
> +curr1_label		"iout1"
> +curr1_input		Measured current.
> +curr1_alarm		Output current alarm.
> +curr1_max		Maximum current.
> +
> +power1_label		"pin"
> +power1_input		Input power.
> +power1_alarm		Input power alarm.
> +power1_max		Maximum poewr.
> +
> +temp1_input		Chip temperature.
> +temp1_min		Minimum chip temperature.
> +temp1_max		Maximum chip temperature.
> +temp1_crit		Critical chip temperature.
> +temp1_alarm		Chip temperature alarm.
> +======================= =======================================================
> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> index b4e93bd5835e..2d4f972e5a65 100644
> --- a/drivers/hwmon/pmbus/Kconfig
> +++ b/drivers/hwmon/pmbus/Kconfig
> @@ -227,6 +227,16 @@ config SENSORS_LTC3815
>   	  This driver can also be built as a module. If so, the module will
>   	  be called ltc3815.
>   
> +config SENSORS_LTC4286
> +	bool "Analog Devices LTC4286"
> +	help
> +	  LTC4286 is an integrated solution for hot swap applications that
> +	  allows a board to be safely inserted and removed from a live
> +	  backplane.
> +	  This chip could be used to monitor voltage, current, ...etc.
> +	  If you say yes here you get hardware monitoring support for Analog
> +	  Devices LTC4286.
> +
>   config SENSORS_MAX15301
>   	tristate "Maxim MAX15301"
>   	help
> diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
> index 84ee960a6c2d..94e28f6d6a61 100644
> --- a/drivers/hwmon/pmbus/Makefile
> +++ b/drivers/hwmon/pmbus/Makefile
> @@ -24,6 +24,7 @@ obj-$(CONFIG_SENSORS_LM25066)	+= lm25066.o
>   obj-$(CONFIG_SENSORS_LT7182S)	+= lt7182s.o
>   obj-$(CONFIG_SENSORS_LTC2978)	+= ltc2978.o
>   obj-$(CONFIG_SENSORS_LTC3815)	+= ltc3815.o
> +obj-$(CONFIG_SENSORS_LTC4286)	+= ltc4286.o
>   obj-$(CONFIG_SENSORS_MAX15301)	+= max15301.o
>   obj-$(CONFIG_SENSORS_MAX16064)	+= max16064.o
>   obj-$(CONFIG_SENSORS_MAX16601)	+= max16601.o
> diff --git a/drivers/hwmon/pmbus/ltc4286.c b/drivers/hwmon/pmbus/ltc4286.c
> new file mode 100644
> index 000000000000..e43e05579be1
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/ltc4286.c
> @@ -0,0 +1,183 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/pmbus.h>
> +#include "pmbus.h"
> +
> +/* LTC4286 register */
> +#define LTC4286_MFR_CONFIG1	0xF2
> +
> +/* LTC4286 configuration */
> +#define VRANGE_SELECT_BIT	BIT(1)
> +
> +#define LTC4286_MFR_ID_SIZE	3
> +#define VRANGE_102P4		1
> +
> +/*
> + * Initialize the MBR as default settings which is referred to LTC4286 datasheet
> + * (March 22, 2022 version) table 3 page 16
> + */
> +static struct pmbus_driver_info ltc4286_info = {
> +	.pages = 1,
> +	.format[PSC_VOLTAGE_IN] = direct,
> +	.format[PSC_VOLTAGE_OUT] = direct,
> +	.format[PSC_CURRENT_OUT] = direct,
> +	.format[PSC_POWER] = direct,
> +	.format[PSC_TEMPERATURE] = direct,
> +	.m[PSC_VOLTAGE_IN] = 32,
> +	.b[PSC_VOLTAGE_IN] = 0,
> +	.R[PSC_VOLTAGE_IN] = 1,
> +	.m[PSC_VOLTAGE_OUT] = 32,
> +	.b[PSC_VOLTAGE_OUT] = 0,
> +	.R[PSC_VOLTAGE_OUT] = 1,
> +	.m[PSC_CURRENT_OUT] = 1024,
> +	.b[PSC_CURRENT_OUT] = 0,
> +	/*
> +	 * The rsense value used in MBR formula in LTC4286 datasheet should be ohm unit.
> +	 * However, the rsense value that user input is micro ohm.
> +	 * Thus, the MBR setting which involves rsense should be shifted by 6 digits.
> +	 */
> +	.R[PSC_CURRENT_OUT] = 3 - 6,
> +	.m[PSC_POWER] = 1,
> +	.b[PSC_POWER] = 0,
> +	/*
> +	 * The rsense value used in MBR formula in LTC4286 datasheet should be ohm unit.
> +	 * However, the rsense value that user input is micro ohm.
> +	 * Thus, the MBR setting which involves rsense should be shifted by 6 digits.
> +	 */
> +	.R[PSC_POWER] = 4 - 6,
> +	.m[PSC_TEMPERATURE] = 1,
> +	.b[PSC_TEMPERATURE] = 273,
> +	.R[PSC_TEMPERATURE] = 0,
> +	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_IOUT |
> +		   PMBUS_HAVE_PIN | PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_VOUT |
> +		   PMBUS_HAVE_STATUS_IOUT | PMBUS_HAVE_STATUS_TEMP,
> +};
> +
> +static const struct i2c_device_id ltc4286_id[] = {
> +	{ "ltc4286", 0 },
> +	{ "ltc4287", 1 },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(i2c, ltc4286_id);
> +
> +static int ltc4286_probe(struct i2c_client *client)
> +{
> +	int ret;
> +	const struct i2c_device_id *mid;
> +	u8 block_buffer[I2C_SMBUS_BLOCK_MAX + 1];
> +	struct pmbus_driver_info *info;
> +	u32 rsense;
> +
> +	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_ID, block_buffer);
> +	if (ret < 0) {
> +		return dev_err_probe(&client->dev, ret,
> +				     "Failed to read manufacturer id\n");
> +	}
> +
> +	/*
> +	 * Refer to ltc4286 datasheet page 20
> +	 * the manufacturer id is LTC
> +	 */
> +	if (ret != LTC4286_MFR_ID_SIZE ||
> +	    strncmp(block_buffer, "LTC", LTC4286_MFR_ID_SIZE)) {
> +		return dev_err_probe(&client->dev, ret,
> +				     "Manufacturer id mismatch\n");
> +	}
> +
> +	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL, block_buffer);
> +	if (ret < 0) {
> +		return dev_err_probe(&client->dev, ret,
> +				     "Failed to read manufacturer model\n");
> +	}
> +
> +	for (mid = ltc4286_id; mid->name[0]; mid++) {
> +		if (!strncasecmp(mid->name, block_buffer, strlen(mid->name)))
> +			break;
> +	}
> +	if (!mid->name[0])
> +		return dev_err_probe(&client->dev, -ENODEV,
> +				     "Unsupported device\n");
> +
> +	if (of_property_read_u32(client->dev.of_node,
> +				 "shunt-resistor-micro-ohms", &rsense))
> +		rsense = 300; /* 0.3 mOhm if not set via DT */
> +
> +	if (rsense == 0)
> +		return -EINVAL;
> +
> +	/* Check for the latter MBR value won't overflow */
> +	if (rsense > (INT_MAX / 1024))
> +		return -EINVAL;
> +
> +	info = devm_kmemdup(&client->dev, &ltc4286_info, sizeof(*info),
> +			    GFP_KERNEL);
> +	if (!info)
> +		return -ENOMEM;
> +
> +	/* Check  MFR1 CONFIG register bit 1 VRANGE_SELECT before driver loading */
> +	ret = i2c_smbus_read_word_data(client, LTC4286_MFR_CONFIG1);
> +	if (ret < 0)
> +		return dev_err_probe(
> +			&client->dev, ret,
> +			"Failed to read manufacturer configuration one\n");
> +
> +	if (device_property_read_bool(&client->dev, "adi,vrange-low-enable")) {
> +		/* The voltage range is 102.4 volts now */
> +		if (ret == VRANGE_102P4) {

This has to check VRANGE_SELECT_BIT, not the entire register.
Other register bit values are unknown.

		if (ret & VRANGE_SELECT_BIT)

Alternatively, something like
	int new, orig;
	...
	orig = i2c_smbus_read_word_data(client, LTC4286_MFR_CONFIG1);
	if (orig < 0)
		return dev_err_probe(...);
	new = orig;
	if (device_property_read_bool(&client->dev, "adi,vrange-low-enable")) {
		new &= ~VRANGE_SELECT_BIT;
		info->m[PSC_VOLTAGE_IN] = 128;
		info->m[PSC_VOLTAGE_OUT] = 128;
		info->m[PSC_POWER] = 4 * rsense;
	} else {
		new |= VRANGE_SELECT_BIT;
		info->m[PSC_POWER] = rsense;
	}
	if (new != orig) {
		ret = i2c_smbus_write_word_data(client, LTC4286_MFR_CONFIG1, new);
		if (ret)
			return dev_err_probe(...);
	}

seems cleaner to me, but that is your call.

Guenter


