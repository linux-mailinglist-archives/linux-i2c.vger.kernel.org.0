Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48E0F75F90C
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jul 2023 15:57:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230075AbjGXN4u (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Jul 2023 09:56:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231290AbjGXN43 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Jul 2023 09:56:29 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4D4610D8;
        Mon, 24 Jul 2023 06:55:45 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1b8ad356fe4so26594375ad.2;
        Mon, 24 Jul 2023 06:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690206945; x=1690811745;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=ULja3BLjTNFjQ4GO2rpitCFLtGkIPOmJuF93/WwCacE=;
        b=EP1WKlKH9GEPEdOFls1ivH1XkWa4cmSVW97NYgoLwTvJHFaGF1WKtRgJ4/FsQpk2Hr
         PjkUdvuD33TmqvWzUyH+ZoveTwZTFiZw8H1O40aTx68ZEDQSRCfKv38sVtzVQ+gv2wPe
         yS0PGqdUO9Nnt30ybzTfw6+Pd75jfc+/ysgX98MoTlWAAu1ql5Fcl1jDr9A3a2N2Ro6b
         HV+59Jk51G+dMhQwDAnzhUyclRmNPi4tVgEEtkriWrmTokkLSRS0b4CRUyyT519ISIj6
         T8svNuf7/nzZk3MLHJjg3rcm2RnVWQHq4MR4lnfKO+GvnTuX9iYoYfYOAGk1igurDCtU
         pymQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690206945; x=1690811745;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ULja3BLjTNFjQ4GO2rpitCFLtGkIPOmJuF93/WwCacE=;
        b=cNrtvZeV4P7o0Q3uXMgv7wV1khNf0myp6S1JbwW2u3dzNtZDRbz8V+enVCOBoTPKil
         HmjxOVOo24hqu7r84CYjuD22voCHsWgYv27m4ohg9bT2zdPGQjGw6F7XhcBG4tf7JFuQ
         XAkZGspWARpOXPf4yOg0CdOq44QaYANuZa9o+9DHPJS4jiG98FgJXcYkdjTVBHHgev7g
         UcdYuyoKetlCwKqw8Yr2/Fz8vcbtGUqsMHPeDWdhhAiwGu1lmzu7PyY2xmVu1jvlIG2A
         ROUeTS73/3pxgjE/gzp28XgIX54OLOWAUCbTTJzyG9eX2x2EWos5ikWFTTQx1diXJNKM
         9NIA==
X-Gm-Message-State: ABy/qLZoz10EVhBEtGLAffMh0+TgxI6lH8cz6UeLj9Y364WE8lrLnW6H
        WEk40qkwRTONJKJEQXUai7ZazfYPgSc=
X-Google-Smtp-Source: APBJJlFDNfEzpO5i0W64pXfS84ozrVvSAt2NOlNtVfg/Vl0J+gYmIDbfextWl/RN0V4iDWTfHMTWew==
X-Received: by 2002:a17:902:e811:b0:1b1:9218:6bf9 with SMTP id u17-20020a170902e81100b001b192186bf9mr11213340plg.43.1690206945215;
        Mon, 24 Jul 2023 06:55:45 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id bb11-20020a170902bc8b00b00198d7b52eefsm8872741plb.257.2023.07.24.06.55.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jul 2023 06:55:44 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <4c67020f-4385-5d34-1c31-2cbdb0f37b6e@roeck-us.net>
Date:   Mon, 24 Jul 2023 06:55:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/2] hwmon: pmbus: Add ltc4286 driver
Content-Language: en-US
To:     Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>, patrick@stwcx.xyz,
        Jean Delvare <jdelvare@suse.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-i2c@vger.kernel.org,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230424101352.28117-1-Delphine_CC_Chiu@Wiwynn.com>
 <20230724100514.1028061-1-Delphine_CC_Chiu@Wiwynn.com>
 <20230724100514.1028061-2-Delphine_CC_Chiu@Wiwynn.com>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20230724100514.1028061-2-Delphine_CC_Chiu@Wiwynn.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 7/24/23 03:05, Delphine CC Chiu wrote:
> Add a driver to support ltc4286 chip
> 

No change log, no versioning, did not address all feedback,
sent as reply to previous version instead of independently.

I am not going to re-review this patch. Address all feedback
comments, provide change log and patch versions, and do not
send as reply to previous patch series.

Guenter

> Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
> ---
>   drivers/hwmon/pmbus/Kconfig   |   9 +++
>   drivers/hwmon/pmbus/Makefile  |   1 +
>   drivers/hwmon/pmbus/ltc4286.c | 147 ++++++++++++++++++++++++++++++++++
>   3 files changed, 157 insertions(+)
>   create mode 100644 drivers/hwmon/pmbus/ltc4286.c
> 
> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> index 270b6336b76d..7cb9cbff587d 100644
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
> +	  allows a board to be safely inserted and removed from a
> +	  live backplane.
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
> index 000000000000..b86bf31cfbae
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/ltc4286.c
> @@ -0,0 +1,147 @@
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
> +	.R[PSC_CURRENT_OUT] = 3 - 6, /* To support small shunt resistor value */
> +	.m[PSC_POWER] = 1,
> +	.b[PSC_POWER] = 0,
> +	.R[PSC_POWER] = 4 - 6, /* To support small shunt resistor value */
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
> +	u8 block_buffer[I2C_SMBUS_BLOCK_MAX + 1];
> +	struct pmbus_driver_info *info;
> +	u32 rsense;
> +
> +	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_ID, block_buffer);
> +	if (ret < 0) {
> +		dev_err(&client->dev, "failed to read manufacturer id\n");
> +		return ret;
> +	}
> +
> +	/*
> +	 * Refer to ltc4286 datasheet page 20
> +	 * the manufacturer id is LTC
> +	 */
> +	if (ret != LTC4286_MFR_ID_SIZE ||
> +	    strncmp(block_buffer, "LTC", LTC4286_MFR_ID_SIZE)) {
> +		return dev_err_probe(&client->dev, err,
> +				     "failed to read manufacturer id\n");
> +	}
> +
> +	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL, block_buffer);
> +	if (ret < 0) {
> +		dev_err(&client->dev, "failed to read manufacturer model\n");
> +		return ret;
> +	}
> +
> +	for (mid = ltc4286_id; mid->name[0]; mid++) {
> +		if (!strncasecmp(mid->name, block_buffer, strlen(mid->name)))
> +			break;
> +	}
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
> +	if (device_property_read_bool(client->dev, "vrange_select_25p6")) {
> +		/* Setup MFR1 CONFIG register bit 1 VRANGE_SELECT */
> +		ret = i2c_smbus_read_word_data(client, LTC4286_MFR_CONFIG1);
> +		if (ret < 0) {
> +			dev_err(&client->dev,
> +				"failed to read manufacturer configuration one\n");
> +			return ret;
> +		}
> +
> +		ret &= ~VRANGE_SELECT; /* VRANGE_SELECT = 0, 25.6V */
> +		ret = i2c_smbus_write_word_data(client, LTC4286_MFR_CONFIG1,
> +						ret);
> +		if (ret < 0) {
> +			dev_err(&client->dev, "failed to set vrange\n");
> +			return ret;
> +		}
> +
> +		info->m[PSC_VOLTAGE_IN] = 128;
> +		info->m[PSC_VOLTAGE_OUT] = 128;
> +		info->m[PSC_POWER] = 4 * rsense;
> +	} else
> +		info->m[PSC_POWER] = rsense;
> +
> +	info->m[PSC_CURRENT_OUT] = 1024 * rsense;
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

