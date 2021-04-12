Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8EB435CA9E
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Apr 2021 18:01:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243205AbhDLQBo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 12 Apr 2021 12:01:44 -0400
Received: from lizzard.sbs.de ([194.138.37.39]:56388 "EHLO lizzard.sbs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238498AbhDLQBn (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 12 Apr 2021 12:01:43 -0400
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
        by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 13CG18SA016672
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 12 Apr 2021 18:01:08 +0200
Received: from md1za8fc.ad001.siemens.net ([139.22.41.180])
        by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 13CG17PN005253;
        Mon, 12 Apr 2021 18:01:07 +0200
Date:   Mon, 12 Apr 2021 18:01:06 +0200
From:   Henning Schild <henning.schild@siemens.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Jean Delvare <jdelvare@suse.de>,
        Lee Jones <lee.jones@linaro.org>,
        Tan Jui Nee <jui.nee.tan@intel.com>,
        "Jim Quinlan" <james.quinlan@broadcom.com>,
        Jonathan Yong <jonathan.yong@intel.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-pci@vger.kernel.org>, Jean Delvare <jdelvare@suse.com>,
        Peter Tyser <ptyser@xes-inc.com>, <hdegoede@redhat.com>
Subject: Re: [PATCH v1 6/7] mfd: lpc_ich: Add support for pinctrl in
 non-ACPI system
Message-ID: <20210412180106.7dc524e8@md1za8fc.ad001.siemens.net>
In-Reply-To: <20210308122020.57071-7-andriy.shevchenko@linux.intel.com>
References: <20210308122020.57071-1-andriy.shevchenko@linux.intel.com>
        <20210308122020.57071-7-andriy.shevchenko@linux.intel.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Am Mon, 8 Mar 2021 14:20:19 +0200
schrieb Andy Shevchenko <andriy.shevchenko@linux.intel.com>:

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
>  drivers/mfd/lpc_ich.c | 100
> +++++++++++++++++++++++++++++++++++++++++- 1 file changed, 99
> insertions(+), 1 deletion(-)
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

drivers/pinctrl/intel/pinctrl-broxton.c:653
BXT_COMMUNITY(0, 77),

> +#define APL_GPIO_WEST_OFFSET		0xc70000
> +#define APL_GPIO_WEST_SIZE		0x674

All these sizes correlate with 4 magic numbers from pinctrl-broxton.

SIZE - 0x500 (pad_base?) - 4 (no clue) / 8

It might be worth basing both numbers on a define and giving the magic
numbers some names.

But all this seems like duplication of pinctrl-broxton, maybe the
pinctrl driver should unhide the p2sb ...

regards,
Henning

> +
> +#define APL_GPIO_NR_DEVICES		4
> +#define APL_GPIO_IRQ			14
> +
> +static struct resource apl_gpio_resources[APL_GPIO_NR_DEVICES][2] = {
> +	{
> +		DEFINE_RES_MEM(APL_GPIO_NORTH_OFFSET,
> APL_GPIO_NORTH_SIZE),
> +		DEFINE_RES_IRQ(APL_GPIO_IRQ),
> +	},
> +	{
> +		DEFINE_RES_MEM(APL_GPIO_NORTHWEST_OFFSET,
> APL_GPIO_NORTHWEST_SIZE),
> +		DEFINE_RES_IRQ(APL_GPIO_IRQ),
> +	},
> +	{
> +		DEFINE_RES_MEM(APL_GPIO_WEST_OFFSET,
> APL_GPIO_WEST_SIZE),
> +		DEFINE_RES_IRQ(APL_GPIO_IRQ),
> +	},
> +	{
> +		DEFINE_RES_MEM(APL_GPIO_SOUTHWEST_OFFSET,
> APL_GPIO_SOUTHWEST_SIZE),
> +		DEFINE_RES_IRQ(APL_GPIO_IRQ),
> +	},
> +};
> +
> +/* The order must be in sync with apl_pinctrl_soc_data */
> +static const struct mfd_cell apl_gpio_devices[APL_GPIO_NR_DEVICES] =
> {
> +	{
> +		/* North */
> +		.name = "apollolake-pinctrl",
> +		.id = 0,
> +		.num_resources = ARRAY_SIZE(apl_gpio_resources[0]),
> +		.resources = apl_gpio_resources[0],
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
> @@ -1082,6 +1151,29 @@ static int lpc_ich_init_wdt(struct pci_dev
> *dev) return ret;
>  }
>  
> +static int lpc_ich_init_pinctrl(struct pci_dev *dev)
> +{
> +	struct resource base;
> +	unsigned int i;
> +	int ret;
> +
> +	ret = pci_p2sb_bar(dev, PCI_DEVFN(13, 0), &base);
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
> +			       ARRAY_SIZE(apl_gpio_devices), NULL,
> 0, NULL); +}
> +
>  static void lpc_ich_test_spi_write(struct pci_dev *dev, unsigned int
> devfn, struct intel_spi_boardinfo *info)
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

