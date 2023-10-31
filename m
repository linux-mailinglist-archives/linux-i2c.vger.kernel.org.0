Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43BB77DD5D2
	for <lists+linux-i2c@lfdr.de>; Tue, 31 Oct 2023 19:09:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230479AbjJaSJm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 31 Oct 2023 14:09:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230455AbjJaSJl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 31 Oct 2023 14:09:41 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1926BA2;
        Tue, 31 Oct 2023 11:09:39 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-6be0277c05bso5297509b3a.0;
        Tue, 31 Oct 2023 11:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698775778; x=1699380578; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=JchhP+mGKXvZIlmqePmuD84psJVG+oz+e68YnJRPIdo=;
        b=Njht6S7VQD5X25TqY3cXftz+e98xikBN8DB93GXZFChKq70XVD3npFjhvpevLpBt12
         e72nl5z9HAi9BTCFKZ6HHVsCkx/6/SOkmBeAQQK8kmRWp9TGlnHdAWBM+LTqr3SQlMYH
         APX6lQ9VHZ639VwIAXOfF8I4eJisCJXZT5dGvWsx87nGbZxQYgbbAP/xlFlnZTFQZ6z1
         joOeXFKR7xXF8WycbZcttt8H+71qmjplMm7cVWJ6Nm4QY1GcqXkTz3OteBqZLq8AVL08
         E3CdH8izDGOTlJWEnh049S4uGUvODUT1tX+5eoMiS89bRlhgxCfhZGyjjga9femrAgQN
         R29A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698775778; x=1699380578;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JchhP+mGKXvZIlmqePmuD84psJVG+oz+e68YnJRPIdo=;
        b=D5AMRUlVAyD7n9lu8kEStRBfFU8KrwkfZ68lQ8A0ULZsPHL+vBWDmBtd3Z5kVWLOyB
         wRUFOn1vrA8Sf/+DccUWXeOWfXxS4D/f7RcB7C2yJu890NoEEiJqTmpyv3D0p92gqf4c
         yiyHATIafc2yy7AfMUqIegOBluYmBhnnY8wKkW5K4yz6KbUY7JAZiH/QFFTCsVYtIQL3
         r8KAjNCKypFB6EExHEJmtiUG0gEu1iDHyiMrx7zTWX2xrpgrgowslfGYlyigLb0VvkUQ
         gG4HTo0oA3vc5MklEk8WT5dRSE+haA3jvQpU4jpreHoGVqZRJJq9dO/IfP+0FBEtrHuK
         LBqQ==
X-Gm-Message-State: AOJu0YyTaJV0y2J4jefMjlSGAThJC2aj7T5J1rhrAv26i21iDpVuhx9Q
        8Cnaba8OeggQhfVh5tYsOu8=
X-Google-Smtp-Source: AGHT+IEhEGhFE8d19oTBS/RMKIKGCO7V9qvGIme49Hz8cY41gVd5uHZmSuhvL5tMNvGgl7GQjX/agw==
X-Received: by 2002:a05:6a00:2d96:b0:6b2:5b5:4f12 with SMTP id fb22-20020a056a002d9600b006b205b54f12mr12995496pfb.14.1698775778082;
        Tue, 31 Oct 2023 11:09:38 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g16-20020a056a001a1000b006c0685422e0sm1533514pfv.214.2023.10.31.11.09.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Oct 2023 11:09:37 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <96d7bf00-a5f8-486f-912d-931e918f3fa3@roeck-us.net>
Date:   Tue, 31 Oct 2023 11:09:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] hwmon: pmbus: Add ltc4286 driver
Content-Language: en-US
To:     Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>, patrick@stwcx.xyz,
        Jean Delvare <jdelvare@suse.com>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-i2c@vger.kernel.org,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20231031072124.201181-1-Delphine_CC_Chiu@Wiwynn.com>
 <20231031072124.201181-3-Delphine_CC_Chiu@Wiwynn.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20231031072124.201181-3-Delphine_CC_Chiu@Wiwynn.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 10/31/23 00:21, Delphine CC Chiu wrote:
> Add a driver to support ltc4286 chip
> 
> Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
> 
> Changelog:
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
>   Documentation/hwmon/ltc4286.rst |  95 +++++++++++++++++

Needs to be added to Documentation/hwmon/index.rst

>   drivers/hwmon/pmbus/Kconfig     |   9 ++
>   drivers/hwmon/pmbus/Makefile    |   1 +
>   drivers/hwmon/pmbus/ltc4286.c   | 178 ++++++++++++++++++++++++++++++++
>   4 files changed, 283 insertions(+)
>   create mode 100644 Documentation/hwmon/ltc4286.rst
>   create mode 100644 drivers/hwmon/pmbus/ltc4286.c
> 
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
> index b4e93bd5835e..f2b53e8abc3c 100644
> --- a/drivers/hwmon/pmbus/Kconfig
> +++ b/drivers/hwmon/pmbus/Kconfig
> @@ -226,6 +226,15 @@ config SENSORS_LTC3815
>   
>   	  This driver can also be built as a module. If so, the module will
>   	  be called ltc3815.

Add empty line

> +config SENSORS_LTC4286
> +	bool "Analog Devices LTC4286"
> +	help
> +	  LTC4286 is an integrated solution for hot swap applications that
> +	  allows a board to be safely inserted and removed from a live
> +	  backplane.
> +	  This chip could be used to monitor voltage, current, ...etc.
> +	  If you say yes here you get hardware monitoring support for Analog
> +	  Devices LTC4286.
>   
>   config SENSORS_MAX15301
>   	tristate "Maxim MAX15301"
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
> index 000000000000..042d3af99489
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/ltc4286.c
> @@ -0,0 +1,178 @@
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
> +enum chips { ltc4286, ltc4287 };

Not really used anywhere and can be dropped.

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
> +	 * However, the rsense value that user input is mirco ohm.

micro

> +	 * Thus, the MBR setting which involves rsense should be shifted by 6 digits.
> +	 */
> +	.R[PSC_CURRENT_OUT] = 3 - 6,
> +	.m[PSC_POWER] = 1,
> +	.b[PSC_POWER] = 0,
> +	/*
> +	 * The rsense value used in MBR formula in LTC4286 datasheet should be ohm unit.
> +	 * However, the rsense value that user input is mirco ohm.

micro

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
> +static const struct i2c_device_id ltc4286_id[] = { { "ltc4286", ltc4286 },
> +						   { "ltc4287", ltc4287 },
> +						   {} };
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
> +	ret = of_property_read_u32(client->dev.of_node,
> +				   "shunt-resistor-micro-ohms", &rsense);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (rsense == 0)
> +		return -EINVAL;
> +
> +	info = devm_kzalloc(&client->dev, sizeof(*info), GFP_KERNEL);
> +	if (!info)
> +		return -ENOMEM;
> +	memcpy(info, &ltc4286_info, sizeof(*info));

devm_kmemdup()

> +
> +	/* Default of VRANGE_SELECT = 1, 102.4V */
> +	if (device_property_read_bool(&client->dev, "adi,vrange-low-enable")) {
> +		/* Setup MFR1 CONFIG register bit 1 VRANGE_SELECT */
> +		ret = i2c_smbus_read_word_data(client, LTC4286_MFR_CONFIG1);
> +		if (ret < 0) {
> +			return dev_err_probe(
> +				&client->dev, ret,
> +				"Failed to read manufacturer configuration one\n");
> +		}
> +
> +		if ((ret & VRANGE_SELECT_BIT) != VRANGE_25P6) {
> +			ret &= ~VRANGE_SELECT_BIT; /* VRANGE_SELECT = 0, 25.6V */
> +			ret = i2c_smbus_write_word_data(
> +				client, LTC4286_MFR_CONFIG1, ret);
> +			if (ret < 0)
> +				return dev_err_probe(&client->dev, ret,
> +						     "Failed to set vrange\n");
> +		}
> +
> +		info->m[PSC_VOLTAGE_IN] = 128;
> +		info->m[PSC_VOLTAGE_OUT] = 128;
> +		info->m[PSC_POWER] = 4 * rsense;
> +		if (info->m[PSC_POWER] > INT_MAX)

This is too late. See below.

> +			return dev_err_probe(&client->dev, -ERANGE,
> +					     "Power coefficient overflow\n");
> +	} else {
> +		info->m[PSC_POWER] = rsense;
> +		if (info->m[PSC_POWER] > INT_MAX)
> +			return dev_err_probe(&client->dev, -ERANGE,
> +					     "Power coefficient overflow\n");

This still needs to be written into the chip. There is no guarantee that
the chip is in its default configuration when the driver is loaded.

> +	}
> +
> +	info->m[PSC_CURRENT_OUT] = 1024 * rsense;
> +	if (info->m[PSC_CURRENT_OUT] > INT_MAX)

This is too late. If rsense == INT_MAX, for example, 1024 * rsense
will be some negative number.

> +		return dev_err_probe(&client->dev, -ERANGE,
> +				     "Current coefficient overflow\n");
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

