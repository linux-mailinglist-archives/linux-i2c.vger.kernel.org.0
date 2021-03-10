Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 325193339F4
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Mar 2021 11:28:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231790AbhCJK1o (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 10 Mar 2021 05:27:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229660AbhCJK1V (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 10 Mar 2021 05:27:21 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FF65C061760
        for <linux-i2c@vger.kernel.org>; Wed, 10 Mar 2021 02:27:20 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id d15so22704124wrv.5
        for <linux-i2c@vger.kernel.org>; Wed, 10 Mar 2021 02:27:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Kptfrvu/Fb55Ii8aAQJW9aAPQICxkOK8F9AK/ZdQ2Fw=;
        b=mW8WRTrJtBe2h2nWOnSf9jX0FJEijKlVoT7LfXXNq9vEuWpDJW6SoXlq8JOnjc3k2Q
         k7wmmhIdMZU5/qRpQJzkMrgm41tzNsmXbeib2TTTdp816tA8o6minWSH76zjQhwQPgis
         7rKGutUp2aai8ZZHDMxdNyNaf1u4/xgIzUEQ1hOJ33uCCsDsdeLpr8b+Ayge18G0zV2k
         f6caWhdaDJoygStuwQ73cUzlj18nJ0amZ97UU8Q++J55TGO3/N+cw/2uj47bZzGG+s8A
         1MMBIS9rogUx89mWOMwziuG8BsT4BX1i3+VqxMyKmYuozuWtUuso9PE9dnjhdYbYJbkR
         B2zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Kptfrvu/Fb55Ii8aAQJW9aAPQICxkOK8F9AK/ZdQ2Fw=;
        b=Jz4KVs0g33l2lQpET3mXivd5Byl5AThYBj8eocRZdfSaVwqjSA6F+BlaqDHndeJLgm
         EBx9Q4rIKRgx8rdKIPnKNnkhHflIqz8T3sQhPUbmK8h0Eqes+S/ijdGBSPGIALNpc42r
         Z5S3NJTDrxRt5Jme06d4H4nH0O3K7b6FZEqPjDYyUxeNfLWvGr0cOeTwqJ8VM3ZMqMuI
         vq/jalI1wnP2gTxrozj9bDJw/V8iOde+gqLIQewxkFT0jQ2864BgdY8ybI/8hHLuDHLH
         WTyJBc/QQ0gyWQiDGku2YDGri5gl+NwGiSS9ut/gRfmB5HJRi8ch8lqOMIQdNcd4YLc+
         dsUw==
X-Gm-Message-State: AOAM533tqUf6MTqqEtCXrhxtJI3vmuLhe/JnR5gyf47c9N73QTigDSX4
        8w2GYr8iePTci/1iIfFc7azTug==
X-Google-Smtp-Source: ABdhPJw91nTbMxgmH2k+xHu7UiIV0Tg4WDDIYXozAWRvYVX5+daHddjc1PjIT/YEgQZ3N6wl12VGwQ==
X-Received: by 2002:a5d:61c9:: with SMTP id q9mr2690991wrv.219.1615372039013;
        Wed, 10 Mar 2021 02:27:19 -0800 (PST)
Received: from dell ([91.110.221.204])
        by smtp.gmail.com with ESMTPSA id j12sm28611919wrx.59.2021.03.10.02.27.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 02:27:18 -0800 (PST)
Date:   Wed, 10 Mar 2021 10:27:16 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        gregkh@linuxfoundation.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Jean Delvare <jdelvare@suse.de>,
        Tan Jui Nee <jui.nee.tan@intel.com>,
        Jim Quinlan <james.quinlan@broadcom.com>,
        Jonathan Yong <jonathan.yong@intel.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pci@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Peter Tyser <ptyser@xes-inc.com>, hdegoede@redhat.com,
        henning.schild@siemens.com
Subject: Re: [PATCH v1 6/7] mfd: lpc_ich: Add support for pinctrl in non-ACPI
 system
Message-ID: <20210310102716.GD701493@dell>
References: <20210308122020.57071-1-andriy.shevchenko@linux.intel.com>
 <20210308122020.57071-7-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210308122020.57071-7-andriy.shevchenko@linux.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 08 Mar 2021, Andy Shevchenko wrote:

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
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/mfd/lpc_ich.c | 100 +++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 99 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mfd/lpc_ich.c b/drivers/mfd/lpc_ich.c
> index 8e9bd6813287..959247b6987a 100644
> --- a/drivers/mfd/lpc_ich.c
> +++ b/drivers/mfd/lpc_ich.c
> @@ -8,7 +8,8 @@
>   *  Configuration Registers.
>   *
>   *  This driver is derived from lpc_sch.
> -
> + *
> + *  Copyright (C) 2017, 2021 Intel Corporation

Big C or little c?  Please be consistent.

>   *  Copyright (c) 2011 Extreme Engineering Solution, Inc.
>   *  Author: Aaron Sierra <asierra@xes-inc.com>
>   *
> @@ -43,6 +44,7 @@
>  #include <linux/acpi.h>
>  #include <linux/pci.h>
>  #include <linux/pci-p2sb.h>
> +#include <linux/pinctrl/pinctrl.h>
>  #include <linux/mfd/core.h>
>  #include <linux/mfd/lpc_ich.h>
>  #include <linux/platform_data/itco_wdt.h>
> @@ -140,6 +142,73 @@ static struct mfd_cell lpc_ich_gpio_cell = {
>  	.ignore_resource_conflicts = true,
>  };
>  
> +/* Offset data for Apollo Lake GPIO controllers */
> +#define APL_GPIO_SOUTHWEST_OFFSET	0xc00000
> +#define APL_GPIO_SOUTHWEST_SIZE		0x654
> +#define APL_GPIO_NORTHWEST_OFFSET	0xc40000
> +#define APL_GPIO_NORTHWEST_SIZE		0x764
> +#define APL_GPIO_NORTH_OFFSET		0xc50000
> +#define APL_GPIO_NORTH_SIZE		0x76c
> +#define APL_GPIO_WEST_OFFSET		0xc70000
> +#define APL_GPIO_WEST_SIZE		0x674
> +
> +#define APL_GPIO_NR_DEVICES		4
> +#define APL_GPIO_IRQ			14
> +
> +static struct resource apl_gpio_resources[APL_GPIO_NR_DEVICES][2] = {
> +	{
> +		DEFINE_RES_MEM(APL_GPIO_NORTH_OFFSET, APL_GPIO_NORTH_SIZE),
> +		DEFINE_RES_IRQ(APL_GPIO_IRQ),
> +	},
> +	{
> +		DEFINE_RES_MEM(APL_GPIO_NORTHWEST_OFFSET, APL_GPIO_NORTHWEST_SIZE),
> +		DEFINE_RES_IRQ(APL_GPIO_IRQ),
> +	},
> +	{
> +		DEFINE_RES_MEM(APL_GPIO_WEST_OFFSET, APL_GPIO_WEST_SIZE),
> +		DEFINE_RES_IRQ(APL_GPIO_IRQ),
> +	},
> +	{
> +		DEFINE_RES_MEM(APL_GPIO_SOUTHWEST_OFFSET, APL_GPIO_SOUTHWEST_SIZE),
> +		DEFINE_RES_IRQ(APL_GPIO_IRQ),
> +	},
> +};
> +
> +/* The order must be in sync with apl_pinctrl_soc_data */
> +static const struct mfd_cell apl_gpio_devices[APL_GPIO_NR_DEVICES] = {
> +	{
> +		/* North */
> +		.name = "apollolake-pinctrl",
> +		.id = 0,

Do these have to be hard-coded?

> +		.num_resources = ARRAY_SIZE(apl_gpio_resources[0]),
> +		.resources = apl_gpio_resources[0],

You can make this less fragile by defining the index and using:

  [DEFINE_X_Y_Z] = { /* resource */ }, /* etc */

... above.

> +		.ignore_resource_conflicts = true,
> +	},
> +	{
> +		/* NorthWest */
> +		.name = "apollolake-pinctrl",
> +		.id = 1,
> +		.num_resources = ARRAY_SIZE(apl_gpio_resources[1]),
> +		.resources = apl_gpio_resources[1],
> +		.ignore_resource_conflicts = true,
> +	},
> +	{
> +		/* West */
> +		.name = "apollolake-pinctrl",
> +		.id = 2,
> +		.num_resources = ARRAY_SIZE(apl_gpio_resources[2]),
> +		.resources = apl_gpio_resources[2],
> +		.ignore_resource_conflicts = true,
> +	},
> +	{
> +		/* SouthWest */
> +		.name = "apollolake-pinctrl",
> +		.id = 3,
> +		.num_resources = ARRAY_SIZE(apl_gpio_resources[3]),
> +		.resources = apl_gpio_resources[3],
> +		.ignore_resource_conflicts = true,
> +	},
> +};
>  
>  static struct mfd_cell lpc_ich_spi_cell = {
>  	.name = "intel-spi",
> @@ -1082,6 +1151,29 @@ static int lpc_ich_init_wdt(struct pci_dev *dev)
>  	return ret;
>  }
>  
> +static int lpc_ich_init_pinctrl(struct pci_dev *dev)
> +{
> +	struct resource base;
> +	unsigned int i;
> +	int ret;
> +
> +	ret = pci_p2sb_bar(dev, PCI_DEVFN(13, 0), &base);

What is 13 and 0?  Should these be defined?

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

So you're converting PCI devices to platform devices.

I'm not sure how 'okay' that is.

Adding Greg to see if he has an opinion.

> +	return mfd_add_devices(&dev->dev, 0, apl_gpio_devices,

Please use the defines, rather than 0.

> +			       ARRAY_SIZE(apl_gpio_devices), NULL, 0, NULL);
> +}
> +
>  static void lpc_ich_test_spi_write(struct pci_dev *dev, unsigned int devfn,
>  				   struct intel_spi_boardinfo *info)
>  {
> @@ -1198,6 +1290,12 @@ static int lpc_ich_probe(struct pci_dev *dev,
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
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
