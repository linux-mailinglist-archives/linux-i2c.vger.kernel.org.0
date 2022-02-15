Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 868724B760E
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Feb 2022 21:48:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241948AbiBOQyW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 15 Feb 2022 11:54:22 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:37764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241893AbiBOQyP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 15 Feb 2022 11:54:15 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E77CB115948
        for <linux-i2c@vger.kernel.org>; Tue, 15 Feb 2022 08:54:04 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id k3-20020a1ca103000000b0037bdea84f9cso1812025wme.1
        for <linux-i2c@vger.kernel.org>; Tue, 15 Feb 2022 08:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=6dxUHfHd2thSyna+SP246lbFbUtj41Yjp+oFZyo2GbY=;
        b=DCat5VP9YVrqN0n/0UgbjvOxszAmCAanPIP4ymZHjEC3Wd41GjjR1nrq1O+FrhOxy7
         5MDQFMLJkVXiOsm8DeO85Hp4YFWeuEXdmvTkHvQ5onCspvycAdD3fP7dpBWoDNsQyRQp
         veeJuqjHZXT0dAzG4sZGe4NC/IqSx/spfjcf+pNZmsV8Qs6kbiRCLE8BDRv5Q+q38qUk
         ghhDR2hw8cfQxUGXUcD3pZ3Tzwe+4nJGBf+7Ynq6lK9rofaHsmXzRil+bhcbgZdJcPT8
         W2u24tBzncuNzK1rZTCgJI+5DhG6jgB2c362c5jxtPHKDZKcBnkv9X1pdtBYpcGK/0+C
         4q1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=6dxUHfHd2thSyna+SP246lbFbUtj41Yjp+oFZyo2GbY=;
        b=o4nm/MdjUF9MaoqF6YWKOmrwxLru5ee1kChAg1hJ8SDFYgEwYIikeBcEf98fhNwco/
         i8a9ZRCD9FcBUqjbObhS/F0H3S646B/xjz19uYZ96wIAFoIzFW7Qmen68A/MaOzDCOgN
         gjYKTIzrV6ps4MUpbFD+wbgBJhdT+/OT3kM+E0FpNp0RegisPjA7Ecr4A+zxPV1fKZRf
         lc27TwzByBBX946o1CUmem+wqMPM8JHEwznZaJH1P7pF9kvTKpJlm4+c5ZZ5aPocVTmE
         gdHgJfDKplXjuv6KYeWKq9Z4TE/qKOfeQhN1O9RydCk6tz5TOoFDrgsMfCja7AWFte6B
         2dRQ==
X-Gm-Message-State: AOAM530jCfQzsINNcAVDdkG3Uv4BY736tnTYmhl0Cw2hEuWggHdLsrej
        QLMkQY5/czFqH3Wu0iehNsEWHLrGhSV3Rg==
X-Google-Smtp-Source: ABdhPJwuKI+bNPJZZ1qflmVanE4vrI3VVZi31qJXYrb9UatcTi6G2+Lh1Fm0dLKpD/YcVimukmd//A==
X-Received: by 2002:a1c:2645:: with SMTP id m66mr3917370wmm.39.1644944043162;
        Tue, 15 Feb 2022 08:54:03 -0800 (PST)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id 7sm15721841wrb.43.2022.02.15.08.54.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Feb 2022 08:54:02 -0800 (PST)
Date:   Tue, 15 Feb 2022 16:54:00 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Wolfram Sang <wsa@kernel.org>, Jean Delvare <jdelvare@suse.de>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tan Jui Nee <jui.nee.tan@intel.com>,
        Kate Hsuan <hpa@redhat.com>,
        Jonathan Yong <jonathan.yong@intel.com>,
        linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Borislav Petkov <bp@alien8.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        James Morse <james.morse@arm.com>,
        Robert Richter <rric@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Peter Tyser <ptyser@xes-inc.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Mark Gross <markgross@kernel.org>,
        Henning Schild <henning.schild@siemens.com>
Subject: Re: [PATCH v4 5/8] mfd: lpc_ich: Add support for pinctrl in non-ACPI
 system
Message-ID: <YgvaqBB8fNVWp1lN@google.com>
References: <20220131151346.45792-1-andriy.shevchenko@linux.intel.com>
 <20220131151346.45792-6-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220131151346.45792-6-andriy.shevchenko@linux.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 31 Jan 2022, Andy Shevchenko wrote:

> From: Tan Jui Nee <jui.nee.tan@intel.com>
> 
> Add support for non-ACPI systems, such as system that uses
> Advanced Boot Loader (ABL) whereby a platform device has to be created
> in order to bind with pin control and GPIO.
> 
> At the moment, Intel Apollo Lake In-Vehicle Infotainment (IVI) system
> requires a driver to hide and unhide P2SB to lookup P2SB BAR and pass
> the PCI BAR address to GPIO.
> 
> Signed-off-by: Tan Jui Nee <jui.nee.tan@intel.com>
> Co-developed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Acked-by: Hans de Goede <hdegoede@redhat.com>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/mfd/lpc_ich.c | 101 +++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 100 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mfd/lpc_ich.c b/drivers/mfd/lpc_ich.c
> index 95dca5434917..e1bca5325ce7 100644
> --- a/drivers/mfd/lpc_ich.c
> +++ b/drivers/mfd/lpc_ich.c
> @@ -8,7 +8,8 @@
>   *  Configuration Registers.
>   *
>   *  This driver is derived from lpc_sch.
> -
> + *
> + *  Copyright (c) 2017, 2021-2022 Intel Corporation
>   *  Copyright (c) 2011 Extreme Engineering Solution, Inc.
>   *  Author: Aaron Sierra <asierra@xes-inc.com>
>   *
> @@ -42,6 +43,7 @@
>  #include <linux/errno.h>
>  #include <linux/acpi.h>
>  #include <linux/pci.h>
> +#include <linux/pinctrl/pinctrl.h>
>  #include <linux/mfd/core.h>
>  #include <linux/mfd/lpc_ich.h>
>  #include <linux/platform_data/itco_wdt.h>
> @@ -140,6 +142,70 @@ static struct mfd_cell lpc_ich_gpio_cell = {
>  	.ignore_resource_conflicts = true,
>  };
>  
> +#define APL_GPIO_NORTH		0
> +#define APL_GPIO_NORTHWEST	1
> +#define APL_GPIO_WEST		2
> +#define APL_GPIO_SOUTHWEST	3
> +#define APL_GPIO_NR_DEVICES	4
> +
> +/* Offset data for Apollo Lake GPIO controllers */
> +#define APL_GPIO_NORTH_OFFSET		0xc50000
> +#define APL_GPIO_NORTHWEST_OFFSET	0xc40000
> +#define APL_GPIO_WEST_OFFSET		0xc70000
> +#define APL_GPIO_SOUTHWEST_OFFSET	0xc00000
> +
> +#define APL_GPIO_IRQ			14
> +
> +static struct resource apl_gpio_resources[APL_GPIO_NR_DEVICES][2] = {
> +	[APL_GPIO_NORTH] = {
> +		DEFINE_RES_MEM(APL_GPIO_NORTH_OFFSET, 0x1000),

Are these 0x1000's being over-written in lpc_ich_init_pinctrl()?

If so, why pre-initialise?

> +		DEFINE_RES_IRQ(APL_GPIO_IRQ),
> +	},
> +	[APL_GPIO_NORTHWEST] = {
> +		DEFINE_RES_MEM(APL_GPIO_NORTHWEST_OFFSET, 0x1000),
> +		DEFINE_RES_IRQ(APL_GPIO_IRQ),
> +	},
> +	[APL_GPIO_WEST] = {
> +		DEFINE_RES_MEM(APL_GPIO_WEST_OFFSET, 0x1000),
> +		DEFINE_RES_IRQ(APL_GPIO_IRQ),
> +	},
> +	[APL_GPIO_SOUTHWEST] = {
> +		DEFINE_RES_MEM(APL_GPIO_SOUTHWEST_OFFSET, 0x1000),
> +		DEFINE_RES_IRQ(APL_GPIO_IRQ),
> +	},
> +};
> +
> +/* The order must be in sync with apl_pinctrl_soc_data */

Why does the order matter if you've pre-enumerated them all?

> +static const struct mfd_cell apl_gpio_devices[APL_GPIO_NR_DEVICES] = {
> +	[APL_GPIO_NORTH] = {
> +		.name = "apollolake-pinctrl",
> +		.id = APL_GPIO_NORTH,
> +		.num_resources = ARRAY_SIZE(apl_gpio_resources[APL_GPIO_NORTH]),
> +		.resources = apl_gpio_resources[APL_GPIO_NORTH],
> +		.ignore_resource_conflicts = true,
> +	},
> +	[APL_GPIO_NORTHWEST] = {
> +		.name = "apollolake-pinctrl",
> +		.id = APL_GPIO_NORTHWEST,
> +		.num_resources = ARRAY_SIZE(apl_gpio_resources[APL_GPIO_NORTHWEST]),
> +		.resources = apl_gpio_resources[APL_GPIO_NORTHWEST],
> +		.ignore_resource_conflicts = true,
> +	},
> +	[APL_GPIO_WEST] = {
> +		.name = "apollolake-pinctrl",
> +		.id = APL_GPIO_WEST,
> +		.num_resources = ARRAY_SIZE(apl_gpio_resources[APL_GPIO_WEST]),
> +		.resources = apl_gpio_resources[APL_GPIO_WEST],
> +		.ignore_resource_conflicts = true,
> +	},
> +	[APL_GPIO_SOUTHWEST] = {
> +		.name = "apollolake-pinctrl",
> +		.id = APL_GPIO_SOUTHWEST,
> +		.num_resources = ARRAY_SIZE(apl_gpio_resources[APL_GPIO_SOUTHWEST]),
> +		.resources = apl_gpio_resources[APL_GPIO_SOUTHWEST],
> +		.ignore_resource_conflicts = true,
> +	},
> +};
>  
>  static struct mfd_cell lpc_ich_spi_cell = {
>  	.name = "intel-spi",
> @@ -1083,6 +1149,33 @@ static int lpc_ich_init_wdt(struct pci_dev *dev)
>  	return ret;
>  }
>  
> +static int lpc_ich_init_pinctrl(struct pci_dev *dev)
> +{
> +	struct resource base;
> +	unsigned int i;
> +	int ret;
> +
> +	/* Check, if GPIO has been exported as an ACPI device */
> +	if (acpi_dev_present("INT3452", NULL, -1))
> +		return -EEXIST;
> +
> +	ret = p2sb_bar(dev->bus, 0, &base);
> +	if (ret)
> +		return ret;
> +
> +	for (i = 0; i < ARRAY_SIZE(apl_gpio_devices); i++) {
> +		struct resource *mem = &apl_gpio_resources[i][0];
> +
> +		/* Fill MEM resource */
> +		mem->start += base.start;
> +		mem->end += base.start;
> +		mem->flags = base.flags;
> +	}
> +
> +	return mfd_add_devices(&dev->dev, 0, apl_gpio_devices,
> +			       ARRAY_SIZE(apl_gpio_devices), NULL, 0, NULL);
> +}
> +
>  static void lpc_ich_test_spi_write(struct pci_dev *dev, unsigned int devfn,
>  				   struct intel_spi_boardinfo *info)
>  {
> @@ -1199,6 +1292,12 @@ static int lpc_ich_probe(struct pci_dev *dev,
>  			cell_added = true;
>  	}
>  
> +	if (priv->chipset == LPC_APL) {
> +		ret = lpc_ich_init_pinctrl(dev);
> +		if (!ret)
> +			cell_added = true;
> +	}
> +
>  	if (lpc_chipset_info[priv->chipset].spi_type) {
>  		ret = lpc_ich_init_spi(dev);
>  		if (!ret)

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
