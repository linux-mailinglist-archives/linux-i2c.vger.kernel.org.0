Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6B897D86B0
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Oct 2023 18:27:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231253AbjJZQ1j (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 26 Oct 2023 12:27:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229815AbjJZQ1i (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 26 Oct 2023 12:27:38 -0400
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA9A018A;
        Thu, 26 Oct 2023 09:27:35 -0700 (PDT)
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-3b2ec9a79bdso682746b6e.3;
        Thu, 26 Oct 2023 09:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698337655; x=1698942455; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1o+C/Ju47qPjeFqJIVFsykCRJQQm8W2j+1h8zsZchD0=;
        b=WjFASNsv5jNU9yPalee2EA1wyu/6kx285dU/7W19kkCZebDkzhNvvOFvNMwR0jAPiX
         +15En4OqMfdC/el/7vcvQ9WPnMSgaJ2EOJxXio7NNSpRbMCDvbGGnv5y2cHFeaxC2hgk
         2ju0YaOSmRl/UctZyqO5RwbtSt/Zgu8/AdoMWqbqVFhZHwx7e7qA2+mmDlrhU8cnGnR6
         hQBjEyH1jc+cv829GgU7io/HDIlTwfUE5NRUohnieJqRc9puovwcoklAv/I4DOd/R+Gw
         VmUqvuJ1r/WpBwJLX2V9ysqdSyFySVy6ynWVcFXC0PjOuG54XEaIbDK74BIxv9S8aFkT
         V1xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698337655; x=1698942455;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1o+C/Ju47qPjeFqJIVFsykCRJQQm8W2j+1h8zsZchD0=;
        b=Sb0Ls26l3XFy/tTdnc9WIQDHSEqfbJNQKQSL8iKNDWv6ExgDR7XszcJKo/J+vkPW0h
         u2hYHhb6FkTBBK/nWEpKCDXWXdLMKxDFDHCtZMLPJfureWyV0SztWxWM4symbpPKCpU4
         M5d2DvdOLbPy0AKiAYjJBXUiEal2ZZRnpGaT1qI0ksUAForGVbpRlJMCJfYwhqRCZt5G
         TPxRGEWT3q5vlq79RPaKvWNxTwG3g2Gx7tPuejgsQ2RKiZ5lzB/bqU3SozIFk5p9Mq5G
         eQiZZMSPsHVhyhZnCu85Kmc/3zqD3MI8UseeeEFu7M9kTaIansLA+irm4R1TC+AvFip6
         6Fdg==
X-Gm-Message-State: AOJu0YywQx3co0xnwkRSxQ5CyHXxvJH7iAlIMEfdb6qGG30Rn9XI6aSm
        6jk03u1QhTuBPo9Jd5txep4=
X-Google-Smtp-Source: AGHT+IE6aVhubW1YE0EGv32aZBUobbdBYep/IteFbHIY2FN45nKdYHsAM/gJi1YjCUanmGBBzoKF3Q==
X-Received: by 2002:a05:6808:90:b0:3b2:dd87:fc with SMTP id s16-20020a056808009000b003b2dd8700fcmr21032696oic.2.1698337654829;
        Thu, 26 Oct 2023 09:27:34 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id i133-20020a25d18b000000b00d9ac1f0e23csm5414095ybg.56.2023.10.26.09.27.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Oct 2023 09:27:34 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <2ef2e804-d498-a2ae-9717-dd03bfd26853@roeck-us.net>
Date:   Thu, 26 Oct 2023 09:27:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To:     Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>, patrick@stwcx.xyz,
        Jean Delvare <jdelvare@suse.com>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-i2c@vger.kernel.org,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20231026081514.3610343-1-Delphine_CC_Chiu@Wiwynn.com>
 <20231026081514.3610343-3-Delphine_CC_Chiu@Wiwynn.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2 2/2] hwmon: pmbus: Add ltc4286 driver
In-Reply-To: <20231026081514.3610343-3-Delphine_CC_Chiu@Wiwynn.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 10/26/23 01:15, Delphine CC Chiu wrote:
> Add a driver to support ltc4286 chip
> 
> Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
> 
> Changelog:
>    v2 - Revise Linear Technologies LTC4286 to
>         Analog Devices LTC4286 in Kconfig
>       - Add more description for this driver in Kconfig
>       - Add some comments for MBR setting in ltc4286.c
>       - Add ltc4286.rst
> ---
>   Documentation/hwmon/ltc4286.rst |  79 ++++++++++++++++
>   drivers/hwmon/pmbus/Kconfig     |   9 ++
>   drivers/hwmon/pmbus/Makefile    |   1 +
>   drivers/hwmon/pmbus/ltc4286.c   | 160 ++++++++++++++++++++++++++++++++
>   4 files changed, 249 insertions(+)
>   create mode 100644 Documentation/hwmon/ltc4286.rst
>   create mode 100644 drivers/hwmon/pmbus/ltc4286.c
> 
> diff --git a/Documentation/hwmon/ltc4286.rst b/Documentation/hwmon/ltc4286.rst
> new file mode 100644
> index 000000000000..9cae50b7478d
> --- /dev/null
> +++ b/Documentation/hwmon/ltc4286.rst
> @@ -0,0 +1,79 @@
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
> +inX_label               "vin1" or "vout1" depending on chip variant and
> +                        configuration.

Is that a cut-and-paste ? I don't see it handled in the driver, and I don't immediately
see it in the datasheet. From the datasheet, it seems to me that both are always
present.

> +inX_input               Measured voltage.
> +
> +curr1_label             "iout1"
> +curr1_input             Measured current.
> +
> +power1_label            "pin1"
> +power1_input            Input power.
> +
> +temp1_input             Chip temperature.
> +======================= =======================================================
> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> index b4e93bd5835e..f2b53e8abc3c 100644
> --- a/drivers/hwmon/pmbus/Kconfig
> +++ b/drivers/hwmon/pmbus/Kconfig
> @@ -226,6 +226,15 @@ config SENSORS_LTC3815
>   
>   	  This driver can also be built as a module. If so, the module will
>   	  be called ltc3815.
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
> index 000000000000..e1d72fe9587c
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/ltc4286.c
> @@ -0,0 +1,160 @@
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
> +
> +enum chips { ltc4286, ltc4287 };
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
> +	 * Thus, the MBR setting which involves rsense should be shifted by 6 digits.
> +	 */
> +	.R[PSC_CURRENT_OUT] = 3 - 6,
> +	.m[PSC_POWER] = 1,
> +	.b[PSC_POWER] = 0,
> +	/*
> +	 * The rsense value used in MBR formula in LTC4286 datasheet should be ohm unit.
> +	 * However, the rsense value that user input is mirco ohm.
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

The datasheet for LTC4286  (in the PMBus description talks about LSB 21.3 mV/RSENSE
for IOUT_OC_WARN_LIMIT and 2.8/RSENSE for PIN_OP_WARN_LIMIT. This contradicts
data elsewhere in the datasheet which uses above coefficients for both LTC4286
and LTC4287. I don't know if the datasheet is wrong, but this needs to be clarified.
If the datasheet is wrong, that needs to be mentioned above. If the limit registers
use different coefficients, local code will be needed to adjust values when reading /
writing the registers to have it match coefficients.

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
> +		dev_err(&client->dev, "failed to read manufacturer id\n");

Why not use dev_err_probe() here ?

> +		return ret;
> +	}
> +
> +	/*
> +	 * Refer to ltc4286 datasheet page 20
> +	 * the manufacturer id is LTC
> +	 */
> +	if (ret != LTC4286_MFR_ID_SIZE ||
> +	    strncmp(block_buffer, "LTC", LTC4286_MFR_ID_SIZE)) {
> +		return dev_err_probe(&client->dev, ret,
> +				     "failed to read manufacturer id\n");

This is misleading. It didn't _fail_ to read the manufacturer ID.

> +	}
> +
> +	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL, block_buffer);
> +	if (ret < 0) {
> +		dev_err(&client->dev, "failed to read manufacturer model\n");

Why not use dev_err_probe() here ?

> +		return ret;
> +	}
> +
> +	for (mid = ltc4286_id; mid->name[0]; mid++) {
> +		if (!strncasecmp(mid->name, block_buffer, strlen(mid->name)))
> +			break;
> +	}

This is pointless code. If the ID is not found, mid will point after
the end of the array, and then what ?

The purpose of such code is to validate if the chip is actually the one
referenced in the match function and at least warn if that is not the case.
It should never accept a chip which is _known_ to not be supported.

> +
> +	ret = of_property_read_u32(client->dev.of_node,
> +				   "shunt-resistor-micro-ohms", &rsense);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (rsense == 0)
> +		return -EINVAL;
> +
> +	info = &ltc4286_info;
> +
> +	/* Default of VRANGE_SELECT = 1, 102.4V */
> +	if (device_property_read_bool(&client->dev, "adi,vrange-select-25p6")) {

What if the adi,vrange-select-25p6 property is not provided, but the chip
is programmed for this range ?

> +		/* Setup MFR1 CONFIG register bit 1 VRANGE_SELECT */
> +		ret = i2c_smbus_read_word_data(client, LTC4286_MFR_CONFIG1);
> +		if (ret < 0) {
> +			dev_err(&client->dev,
> +				"failed to read manufacturer configuration one\n"); > +			return ret;
> +		}
> +
> +		ret &= ~VRANGE_SELECT_BIT; /* VRANGE_SELECT = 0, 25.6V */
> +		ret = i2c_smbus_write_word_data(client, LTC4286_MFR_CONFIG1,
> +						ret);

This should only be written if it actually changed.

> +		if (ret < 0) {
> +			dev_err(&client->dev, "failed to set vrange\n");
> +			return ret;
> +		}
> +
> +		info->m[PSC_VOLTAGE_IN] = 128;
> +		info->m[PSC_VOLTAGE_OUT] = 128;
> +		info->m[PSC_POWER] = 4 * rsense;

You can not overwrite ltc4286_info because there might be several chips
in the system with different sense resistor values and range
configurations.

Also, the above (and the calculation in the code below) will overflow
with too-large sense register values.

> +	} else
> +		info->m[PSC_POWER] = rsense;

Please run checkpatch --strict on your patches.

> +
> +	info->m[PSC_CURRENT_OUT] = 1024 * rsense;

Any rsense value larger than MAXINT / 1024 will overflow.

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

