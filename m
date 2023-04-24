Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACFDE6ED016
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Apr 2023 16:14:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231137AbjDXOOH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Apr 2023 10:14:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231140AbjDXONv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Apr 2023 10:13:51 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58733768D;
        Mon, 24 Apr 2023 07:13:50 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-63b5c830d5eso3654725b3a.2;
        Mon, 24 Apr 2023 07:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682345630; x=1684937630;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TSEUsfr4dvWjlfJEd5fQQs4Zw/stuQIOx0vS+NOEm3c=;
        b=VcCZSgiac/KQ6Yz9t4vq8KO8Xg80es06TeZjm5LWSfeYgU0pnJspuLntkiJiu429mG
         bGu6Yt9lzoZNZmfNF77lSLUyZ8aMDNk13DNcvhUs5PNVc9CmTLHHpyTC8tP0iNE8brYW
         cPbSmHYUoufiIMAr07/wNQMjt1qESn1UuS/3oSqp6wThPPSTzWezNPeS7yv0u0azRTLC
         qVfHxXG0uodrABGmNW0mWLSu6RxjsXSX5KPrfgBKD7WMrUBPItXZJL/gw6tBn5Q8IW2n
         n/DdNUQfPhS1FsrdGReKp804/k9tQASZKom2F5h/jMiwq7Mo1hqnYE++1WyB19ywGEZ1
         cCbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682345630; x=1684937630;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TSEUsfr4dvWjlfJEd5fQQs4Zw/stuQIOx0vS+NOEm3c=;
        b=knb5rb4P0K/sVDTWZu5N7D6jou8NdylPDR2GfgXL5gSRyOzPxcgFXD8GwfnVniBlOj
         gwYWs/Cw1J1zKPARNiecElWX4xKZMu0NyBKVyQjf38vUG13tk6BUo6uHAzKgPUd+PmFO
         GYTQglCK7Q4JaO+g0RXZ+I3vUXaNATPDZVkN0taUEaCpRnj5j+TzbGoad/7UQ0xujVjS
         OqkhQOg6DqwjDjvuKzhocfolMZ34TRaVVSRJdgrRy3QDp7sCVwu+GS3zB43sLKJgjQxa
         LWih1J8Y1GwwgcoyysTedB/UFSejlhnsowfLthPP2LATFmHHNYuienxKmZqeGHQKS0iz
         XYdg==
X-Gm-Message-State: AAQBX9fZXEydZrP4xvIrX77J6vs6x1Nwi1+XcCYhx9b2381ms9ULTuvz
        p0eaJBqhuptiOV3SERhlHKA=
X-Google-Smtp-Source: AKy350YSmo+bdGt+AZUpTh+Km1yLIwDuTtNFpPe6MjG2FyhxYEvlH3Hy1oWbBvnMPwkkCzwBMZfR6A==
X-Received: by 2002:a17:90b:1b4a:b0:24b:5eb7:f404 with SMTP id nv10-20020a17090b1b4a00b0024b5eb7f404mr12144814pjb.41.1682345629772;
        Mon, 24 Apr 2023 07:13:49 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j4-20020a17090ae60400b0023faa95f75csm8404920pjy.36.2023.04.24.07.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Apr 2023 07:13:49 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 24 Apr 2023 07:13:48 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
Cc:     patrick@stwcx.xyz, Jean Delvare <jdelvare@suse.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-i2c@vger.kernel.org, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] hwmon: pmbus: Add ltc4286 driver
Message-ID: <c83242ca-f966-48e7-86a3-88b1b53c606c@roeck-us.net>
References: <20230424101352.28117-1-Delphine_CC_Chiu@Wiwynn.com>
 <20230424101352.28117-3-Delphine_CC_Chiu@Wiwynn.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230424101352.28117-3-Delphine_CC_Chiu@Wiwynn.com>
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Apr 24, 2023 at 06:13:50PM +0800, Delphine CC Chiu wrote:
> Add support for ltc4286 driver

The patch does not add support for a driver, it adds support for a chip.

> 
> Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
> ---
>  drivers/hwmon/pmbus/Kconfig   |   9 +++
>  drivers/hwmon/pmbus/Makefile  |   1 +
>  drivers/hwmon/pmbus/ltc4286.c | 142 ++++++++++++++++++++++++++++++++++

Documentation is missing.

>  3 files changed, 152 insertions(+)
>  create mode 100644 drivers/hwmon/pmbus/ltc4286.c
> 
> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> index 59d9a7430499..1230d910d681 100644
> --- a/drivers/hwmon/pmbus/Kconfig
> +++ b/drivers/hwmon/pmbus/Kconfig
> @@ -218,6 +218,15 @@ config SENSORS_LTC3815
>  	  This driver can also be built as a module. If so, the module will
>  	  be called ltc3815.
>  
> +config SENSORS_LTC4286
> +	bool "Linear Technologies LTC4286"

Analog Devices ?

> +	help
> +	  If you say yes here you get hardware monitoring support for Linear
> +	  Technology LTC4286.
> +
> +	  This driver can also be built as a module. If so, the module will
> +	  be called ltc4286.
> +
>  config SENSORS_MAX15301
>  	tristate "Maxim MAX15301"
>  	help
> diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
> index 3ae019916267..540265539580 100644
> --- a/drivers/hwmon/pmbus/Makefile
> +++ b/drivers/hwmon/pmbus/Makefile
> @@ -23,6 +23,7 @@ obj-$(CONFIG_SENSORS_LM25066)	+= lm25066.o
>  obj-$(CONFIG_SENSORS_LT7182S)	+= lt7182s.o
>  obj-$(CONFIG_SENSORS_LTC2978)	+= ltc2978.o
>  obj-$(CONFIG_SENSORS_LTC3815)	+= ltc3815.o
> +obj-$(CONFIG_SENSORS_LTC4286)	+= ltc4286.o
>  obj-$(CONFIG_SENSORS_MAX15301)	+= max15301.o
>  obj-$(CONFIG_SENSORS_MAX16064)	+= max16064.o
>  obj-$(CONFIG_SENSORS_MAX16601)	+= max16601.o
> diff --git a/drivers/hwmon/pmbus/ltc4286.c b/drivers/hwmon/pmbus/ltc4286.c
> new file mode 100644
> index 000000000000..474f4ec9107c
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/ltc4286.c
> @@ -0,0 +1,142 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Hardware monitoring driver for LTC4286 Hot-Swap Controller
> + *
> + * Copyright (c) 2023 Linear Technology

Really ?

> + */
> +
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/pmbus.h>
> +#include "pmbus.h"
> +
> +// LTC4286 register

Please no C++ comments in the code.

> +#define LTC4286_MFR_CONFIG1 (0xF2)

Unnecessary ( )

> +
> +// LTC4286 configuration
> +#define VRANGE_SELECT (1 << 1)

#define<space>DEFINE<tab>value, please. Also, please use BIT() macros
where appropriate.
> +
> +#define LTC4286_MFR_ID_SIZE 3
> +
> +enum chips { ltc4286, ltc4287 };

There is no LTC4287 according to information available in public.
It has not even be announced.

Besides, the above enum is not really used anywhere and therefore
has zero value. Maybe the LTC4287 is not yet released. Even then,
there is no value listing it here because its parameters seem
to be identical to LTC4286.

> +
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
> +	.R[PSC_CURRENT_OUT] = 3 - 6,

This needs explanation.

> +	.m[PSC_POWER] = 1,
> +	.b[PSC_POWER] = 0,
> +	.R[PSC_POWER] = 4 - 6,

This needs explanation.

> +	.m[PSC_TEMPERATURE] = 1,
> +	.b[PSC_TEMPERATURE] = 273.15,

Assigning a float to an int doesn't make much sense.

> +	.R[PSC_TEMPERATURE] = 0,
> +	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_IOUT |
> +		   PMBUS_HAVE_PIN | PMBUS_HAVE_TEMP,

The chip does have a number of status registers.

> +};
> +
> +static int ltc4286_probe(struct i2c_client *client,
> +			 const struct i2c_device_id *id)
> +{
> +	int ret;
> +	u8 block_buffer[I2C_SMBUS_BLOCK_MAX + 1];
> +	struct device *dev = &client->dev;
> +	struct pmbus_driver_info *info;
> +	u32 rsense;
> +
> +	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_ID, block_buffer);
> +	if (ret < 0) {
> +		dev_err(&client->dev, "failed to read manufacturer id\n");

Kind of pointless to declare a local 'dev' variable and not use it.

> +		return ret;
> +	}
> +
> +	/* Refer to ltc4286 datasheet page 20
> +	 * the default manufacturer id is LTC

Why "default" ?

> +	 */

Please use standard multi-line comments.

> +	if (ret != LTC4286_MFR_ID_SIZE ||
> +	    strncmp(block_buffer, "LTC", LTC4286_MFR_ID_SIZE)) {
> +		dev_err(&client->dev, "unsupported manufacturer id\n");
> +		return -ENODEV;
> +	}
> +
> +	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL, block_buffer);
> +	if (ret < 0) {
> +		dev_err(&client->dev, "failed to read manufacturer model\n");
> +		return ret;
> +	}

Why read the model if you don't do anything with it ?

> +
> +	ret = of_property_read_u32(client->dev.of_node, "rsense-micro-ohms",
> +				   &rsense);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (rsense == 0)
> +		return -EINVAL;
> +

There should be a default for systems not supporting devicetree.

> +	info = &ltc4286_info;
> +
> +	/* Default of VRANGE_SELECT = 1 */
> +	if (device_property_read_bool(dev, "vrange_select_25p6")) {
> +		/* Setup MFR1 CONFIG register bit 1 VRANGE_SELECT */
> +		ret = i2c_smbus_read_word_data(client, LTC4286_MFR_CONFIG1);
> +		if (ret < 0) {
> +			dev_err(&client->dev,
> +				"failed to read manufacturer configuration one\n");
> +			return ret;
> +		}
> +
> +		ret &= ~VRANGE_SELECT; /* VRANGE_SELECT = 0, 25.6V */
> +		i2c_smbus_write_word_data(client, LTC4286_MFR_CONFIG1, ret);

Error check missing.

> +
> +		info->m[PSC_VOLTAGE_IN] = 128;
> +		info->m[PSC_VOLTAGE_OUT] = 128;
> +		info->m[PSC_POWER] = 4 * rsense;
> +	} else {
> +		info->m[PSC_POWER] = rsense;

This just takes the current configuration, and assumes it is the default.
That may not be correct. The chip may have been configured by the BIOS,
or manually.

> +	}
> +

The code assumes that there is only a single chip in the system, or that
the configuration of all chips is identical. This is not necessarily
correct.

> +	info->m[PSC_CURRENT_OUT] = 1024 * rsense;
> +
> +	return pmbus_do_probe(client, info);
> +}
> +
> +static const struct i2c_device_id ltc4286_id[] = { { "ltc4286", ltc4286 },
> +						   { "ltc4287", ltc4287 },

Even if LTC4287 existed, assigning the ID here ...

> +						   {} };
> +MODULE_DEVICE_TABLE(i2c, ltc4286_id);
> +
> +static const struct of_device_id ltc4286_of_match[] = {
> +	{ .compatible = "lltc,ltc4286" },
> +	{ .compatible = "lltc,ltc4287" },

... but not here defeats having it in the first place.

> +	{}
> +};

MODULE_DEVOCE_TABLE() missing.

> +
> +/* This is the driver that will be inserted */

Useless comment

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
> -- 
> 2.17.1
> 
