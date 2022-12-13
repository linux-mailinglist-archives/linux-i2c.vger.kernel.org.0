Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE29964B79F
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Dec 2022 15:43:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236011AbiLMOnJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Dec 2022 09:43:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236020AbiLMOm4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Dec 2022 09:42:56 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B90BA10CF;
        Tue, 13 Dec 2022 06:42:49 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6500,9779,10559"; a="305785596"
X-IronPort-AV: E=Sophos;i="5.96,241,1665471600"; 
   d="scan'208";a="305785596"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2022 06:42:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10559"; a="648578038"
X-IronPort-AV: E=Sophos;i="5.96,241,1665471600"; 
   d="scan'208";a="648578038"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002.jf.intel.com with ESMTP; 13 Dec 2022 06:42:45 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1p56UU-009KBd-2t;
        Tue, 13 Dec 2022 16:42:42 +0200
Date:   Tue, 13 Dec 2022 16:42:42 +0200
From:   Andy Shevchenko <andy@kernel.org>
To:     Binbin Zhou <zhoubinbin@loongson.cn>
Cc:     Wolfram Sang <wsa@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, loongarch@lists.linux.dev,
        devicetree@vger.kernel.org, Huacai Chen <chenhuacai@loongson.cn>,
        WANG Xuerui <kernel@xen0n.name>, Arnd Bergmann <arnd@arndb.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jianmin Lv <lvjianmin@loongson.cn>
Subject: Re: [PATCH V6 1/4] i2c: gpio: Add support on ACPI-based system
Message-ID: <Y5iPYiZJP4A26NMm@smile.fi.intel.com>
References: <cover.1670897253.git.zhoubinbin@loongson.cn>
 <de51467e355b4bae2f8aa18f833f30f9fe50de12.1670897253.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <de51467e355b4bae2f8aa18f833f30f9fe50de12.1670897253.git.zhoubinbin@loongson.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_SOFTFAIL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Dec 13, 2022 at 04:26:55PM +0800, Binbin Zhou wrote:
> Add support for the ACPI-based device registration, so that the driver
> can be also enabled through ACPI table.

LGTM now,
Reviewed-by: Andy Shevchenko <andy@kernel.org>

> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  drivers/i2c/busses/i2c-gpio.c | 28 ++++++++++++++++++----------
>  1 file changed, 18 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-gpio.c b/drivers/i2c/busses/i2c-gpio.c
> index 0e4385a9bcf7..680936234ef8 100644
> --- a/drivers/i2c/busses/i2c-gpio.c
> +++ b/drivers/i2c/busses/i2c-gpio.c
> @@ -13,9 +13,9 @@
>  #include <linux/init.h>
>  #include <linux/interrupt.h>
>  #include <linux/module.h>
> -#include <linux/of.h>
>  #include <linux/platform_data/i2c-gpio.h>
>  #include <linux/platform_device.h>
> +#include <linux/property.h>
>  #include <linux/slab.h>
>  
>  struct i2c_gpio_private_data {
> @@ -300,22 +300,23 @@ static inline void i2c_gpio_fault_injector_init(struct platform_device *pdev) {}
>  static inline void i2c_gpio_fault_injector_exit(struct platform_device *pdev) {}
>  #endif /* CONFIG_I2C_GPIO_FAULT_INJECTOR*/
>  
> -static void of_i2c_gpio_get_props(struct device_node *np,
> -				  struct i2c_gpio_platform_data *pdata)
> +/* Get i2c-gpio properties from DT or ACPI table */
> +static void i2c_gpio_get_properties(struct device *dev,
> +				     struct i2c_gpio_platform_data *pdata)
>  {
>  	u32 reg;
>  
> -	of_property_read_u32(np, "i2c-gpio,delay-us", &pdata->udelay);
> +	device_property_read_u32(dev, "i2c-gpio,delay-us", &pdata->udelay);
>  
> -	if (!of_property_read_u32(np, "i2c-gpio,timeout-ms", &reg))
> +	if (!device_property_read_u32(dev, "i2c-gpio,timeout-ms", &reg))
>  		pdata->timeout = msecs_to_jiffies(reg);
>  
>  	pdata->sda_is_open_drain =
> -		of_property_read_bool(np, "i2c-gpio,sda-open-drain");
> +		device_property_read_bool(dev, "i2c-gpio,sda-open-drain");
>  	pdata->scl_is_open_drain =
> -		of_property_read_bool(np, "i2c-gpio,scl-open-drain");
> +		device_property_read_bool(dev, "i2c-gpio,scl-open-drain");
>  	pdata->scl_is_output_only =
> -		of_property_read_bool(np, "i2c-gpio,scl-output-only");
> +		device_property_read_bool(dev, "i2c-gpio,scl-output-only");
>  }
>  
>  static struct gpio_desc *i2c_gpio_get_desc(struct device *dev,
> @@ -373,8 +374,8 @@ static int i2c_gpio_probe(struct platform_device *pdev)
>  	bit_data = &priv->bit_data;
>  	pdata = &priv->pdata;
>  
> -	if (np) {
> -		of_i2c_gpio_get_props(np, pdata);
> +	if (dev_fwnode(dev)) {
> +		i2c_gpio_get_properties(dev, pdata);
>  	} else {
>  		/*
>  		 * If all platform data settings are zero it is OK
> @@ -489,10 +490,17 @@ static const struct of_device_id i2c_gpio_dt_ids[] = {
>  
>  MODULE_DEVICE_TABLE(of, i2c_gpio_dt_ids);
>  
> +static const struct acpi_device_id i2c_gpio_acpi_match[] = {
> +	{ "LOON0005" }, /* LoongArch */
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(acpi, i2c_gpio_acpi_match);
> +
>  static struct platform_driver i2c_gpio_driver = {
>  	.driver		= {
>  		.name	= "i2c-gpio",
>  		.of_match_table	= i2c_gpio_dt_ids,
> +		.acpi_match_table = i2c_gpio_acpi_match,
>  	},
>  	.probe		= i2c_gpio_probe,
>  	.remove		= i2c_gpio_remove,
> -- 
> 2.31.1
> 

-- 
With Best Regards,
Andy Shevchenko


