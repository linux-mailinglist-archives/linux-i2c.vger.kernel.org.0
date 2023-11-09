Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B09047E703B
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Nov 2023 18:27:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231598AbjKIR1p (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Nov 2023 12:27:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231478AbjKIR1o (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Nov 2023 12:27:44 -0500
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3578B93;
        Thu,  9 Nov 2023 09:27:42 -0800 (PST)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-5a84204e7aeso13741147b3.0;
        Thu, 09 Nov 2023 09:27:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699550861; x=1700155661; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=vRiA8JxjoD2NjKIcDOlUOfv4VQnMOeyr7clgpYm5X6w=;
        b=CPzQ3Ptc+kjI5R4bYstMY0AvTjWjPexSlAPemIKdQ7O4c7a+0Uc4q3ULTSIbpAT4EO
         famXOZYrYP22g5/aXFRpo+30KaGYJ/vsUeYhCpvFHDT3eEmqbJ2Fn7lCDXyQkorMBPAf
         7WxOATXiDgxg5kJlh0ngqj4/krRTBllHKQJzkFKShZzxNCNDq3DgahCQyOvuF35APb4V
         IDMIaPBmIh1Kr/Oc0vsJ3XzeaQLz+b//1pRCWG0DVVVkGgZWD1fziZqSIShUKpmWNPd7
         W4arIuWERu0iv7BIPABV0rmxQpWkw1aF4XjDaTfiuSx5MEGB+yi/N14zFRWo09IWq+4X
         +hEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699550861; x=1700155661;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vRiA8JxjoD2NjKIcDOlUOfv4VQnMOeyr7clgpYm5X6w=;
        b=MFzzWunUeX00j6/cZ6PYusdv5yHrPzng7UvFG1RDpcze5kh7P20l8N6eKxia1dJ6lh
         G0D35qcG/RuIXk9o6HDRkyr20sbEqldVM82AD+/n9ZDTYRNsbwdG1rEJ+qeo3fs1u0G3
         7pRbSejlbM3p0Vy/wK+izRgObARzS715Sg4Q2DHYjv5AW2nmiAm+5YHbrWnn79IIUuIF
         TdqmU6OU0pyLU8f3reXFz9BoQY+dN3DmJFXaRoV15bg0qN7KSZKt3lKIXaPTKZ8+eOZU
         ckQH8H4HyfdbY2tOdQpoG57MIHH5mygXexFL4sRH0rbi3h+CV+WFXdvxgABc55NDW4w9
         nEfQ==
X-Gm-Message-State: AOJu0YxjMvOQMTPVKsIpcR+TeVMvamNy8K7iWz7XzaKeGkaX9Keu7cdK
        9C8EeQRSv28Jg7HV3YjNoQg=
X-Google-Smtp-Source: AGHT+IH1Mugy42a9uBExGt4NdSrQEpv4KL34qy/YVOmoiAxARLbYEjwxN6x8CWIQ0lYwnF3uzvNekw==
X-Received: by 2002:a81:4893:0:b0:5a7:fcae:f3e2 with SMTP id v141-20020a814893000000b005a7fcaef3e2mr5860452ywa.43.1699550861262;
        Thu, 09 Nov 2023 09:27:41 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t15-20020a81c24f000000b00594fb0e2db3sm8067834ywg.138.2023.11.09.09.27.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Nov 2023 09:27:40 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <065e97b5-23ce-45f3-95ec-40e798c8a22e@roeck-us.net>
Date:   Thu, 9 Nov 2023 09:27:38 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] hwmon: pmbus: Add ltc4286 driver
Content-Language: en-US
To:     Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>, patrick@stwcx.xyz,
        Jean Delvare <jdelvare@suse.com>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-i2c@vger.kernel.org,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20231109014948.2334465-1-Delphine_CC_Chiu@Wiwynn.com>
 <20231109014948.2334465-3-Delphine_CC_Chiu@Wiwynn.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20231109014948.2334465-3-Delphine_CC_Chiu@Wiwynn.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 11/8/23 17:49, Delphine CC Chiu wrote:
> Add a driver to support ltc4286 chip
> 
> Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
> 
> Changelog:
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
>   drivers/hwmon/pmbus/ltc4286.c   | 177 ++++++++++++++++++++++++++++++++
>   5 files changed, 284 insertions(+)
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
> index 000000000000..e6690b38349a
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/ltc4286.c
> @@ -0,0 +1,177 @@
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
> +#define VRANGE_25P6		0
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
> +static const struct i2c_device_id ltc4286_id[] = { { "ltc4286", 0 },
> +						   { "ltc4287", 1 },
> +						   {} };

Please fix that formatting and use the more common style.

static const struct i2c_device_id ltc4286_id[] = {
	{ "ltc4286", 0 },
	{ "ltc4287", 1 },
	{}
};

> +MODULE_DEVICE_TABLE(i2c, ltc4286_id);
> +
> +static int ltc4286_probe(struct i2c_client *client)
> +{
> +	int ret;
> +	int temp_setting;
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
> +	ret = of_property_read_u32(client->dev.of_node,
> +				   "shunt-resistor-micro-ohms", &rsense);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (rsense == 0)
> +		return -EINVAL;
> +
> +	if (rsense > INT_MAX)
> +		return -ERANGE;
> +

This is not "Math result not representable". See below.

> +	info = devm_kmemdup(&client->dev, &ltc4286_info, sizeof(*info),
> +			    GFP_KERNEL);
> +	if (!info)
> +		return -ENOMEM;
> +
> +	/* Default of VRANGE_SELECT = 1, 102.4V */
> +	if (device_property_read_bool(&client->dev, "adi,vrange-low-enable")) {
> +		/* Setup MFR1 CONFIG register bit 1 VRANGE_SELECT */
> +		ret = i2c_smbus_read_word_data(client, LTC4286_MFR_CONFIG1);
> +		if (ret < 0)
> +			return dev_err_probe(
> +				&client->dev, ret,
> +				"Failed to read manufacturer configuration one\n");
> +
> +		ret &= ~VRANGE_SELECT_BIT; /* VRANGE_SELECT = 0, 25.6V */
> +		ret = i2c_smbus_write_word_data(client, LTC4286_MFR_CONFIG1,
> +						ret);
> +		if (ret < 0)
> +			return dev_err_probe(&client->dev, ret,
> +					     "Failed to set vrange\n");
> +
> +		info->m[PSC_VOLTAGE_IN] = 128;
> +		info->m[PSC_VOLTAGE_OUT] = 128;
> +
> +		temp_setting = 4 * rsense;
> +		if (temp_setting > INT_MAX)

This will still overflow for values of rsense larger than INT_MAX / 4.
temp_setting is an int, and its value will never be > INT_MAX.

> +			return dev_err_probe(&client->dev, -ERANGE,
> +					     "Power coefficient overflow\n");

ERANGE is "Math result not representable", which is not the case here.
This (and the above above) error needs to be -EINVAL.


> +		info->m[PSC_POWER] = temp_setting;
> +	} else {
> +		info->m[PSC_POWER] = rsense;

I told you before, the default range needs to be set. The range may have been
changed by the BIOS/ROMMON, or someone could have changed it manually with
i2cset or some other application, or some other operating system was loaded
earlier which did its own setting.

I do understand by now that you don't want to do that, but I won't accept
the driver without it, sorry.

> +	}
> +
> +	temp_setting = 1024 * rsense;
> +	if (temp_setting > INT_MAX)
> +		return dev_err_probe(&client->dev, -ERANGE,
> +				     "Current coefficient overflow\n");

Same comments as above for both overflow detection and error code. This also
means that rsense must _always_ be <= INT_MAX / 1024. I would suggest to
check that once after reading rsense instead of having three different checks
in different places.

Also, having an error message here but not with the initial check against
0 and INT_MAX is inconsistent. I'd suggest no error message, but if you want
to have error messages please make it consistent.

> +	info->m[PSC_CURRENT_OUT] = temp_setting;
> +
> +	return pmbus_do_probe(client, info);
> +}
> +
> +static const struct of_device_id ltc4286_of_match[] = {
> +	{ .compatible = "lltc,ltc4286" },
> +	{ .compatible = "lltc,ltc4287" },
> +	{}
> +};
> +
> +static struct i2c_driver ltc4286_driver = {
> +	.driver = {
> +		.name = "ltc4286",
> +		.of_match_table = ltc4286_of_match,
> +	},
> +	.probe = ltc4286_probe,
> +	.id_table = ltc4286_id,
> +};
> +
> +module_i2c_driver(ltc4286_driver);
> +
> +MODULE_AUTHOR("Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>");
> +MODULE_DESCRIPTION("PMBUS driver for LTC4286 and compatibles");
> +MODULE_LICENSE("GPL");

