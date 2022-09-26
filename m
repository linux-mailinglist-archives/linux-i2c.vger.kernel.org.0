Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2E235EAC1E
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Sep 2022 18:12:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235718AbiIZQMD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 26 Sep 2022 12:12:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235731AbiIZQLc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 26 Sep 2022 12:11:32 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8E3E9D515;
        Mon, 26 Sep 2022 07:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664204340; x=1695740340;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YEk0P4ViopuG0/B7+FIOXKhKwkUp+jx+G5pu26NtHE8=;
  b=FkiXzVspCFIji4g1dJHAalNEV9RCVdwOm6NCRWYEA/vH06hGDZ6f4I+P
   Ar3nvgSmZ70A2f6pypRwOWkvGSNhNcIiaHICh+6wvwVo0CZUqlFM6NE6G
   j1mJkJlLeDHHaLTyh4dYmQGWIpUBhEQBuR9OydaQFYzQdCI60dSaCvOLP
   jFmUxiomCADhnZefV/eyUlU34unbkuCNJb4cUKFWzEmt90ardcZB15G9w
   bpUS26ejQw0dJ6XewysaIXbKXo8FX3FPUMpbkJj/mGNnDY3w7HVBXbWHi
   Jw+j/BIWwfBEM0XRTWTmL0e2tQIbgvrHkIEjRbpp4CET5UyBSPYTrE7Hm
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="301949425"
X-IronPort-AV: E=Sophos;i="5.93,346,1654585200"; 
   d="scan'208";a="301949425"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2022 07:58:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="654292721"
X-IronPort-AV: E=Sophos;i="5.93,346,1654585200"; 
   d="scan'208";a="654292721"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 26 Sep 2022 07:58:52 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 7EC1F101; Mon, 26 Sep 2022 17:59:10 +0300 (EEST)
Date:   Mon, 26 Sep 2022 17:59:10 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Binbin Zhou <zhoubinbin@loongson.cn>
Cc:     Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, loongarch@lists.linux.dev,
        linux-acpi@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>,
        Jianmin Lv <lvjianmin@loongson.cn>,
        Huacai Chen <chenhuacai@loongson.cn>
Subject: Re: [PATCH V2 1/4] i2c: gpio: Add support on ACPI-based system
Message-ID: <YzG+Pr+jNIWhWQnp@black.fi.intel.com>
References: <cover.1664193316.git.zhoubinbin@loongson.cn>
 <f5df899e2218c0cd8cc8782b4a8f157ebb9726bc.1664193316.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f5df899e2218c0cd8cc8782b4a8f157ebb9726bc.1664193316.git.zhoubinbin@loongson.cn>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

[+Rafael and Andy]

Hi,

On Mon, Sep 26, 2022 at 09:00:04PM +0800, Binbin Zhou wrote:
> Add support for the ACPI-based device registration so that the driver
> can be also enabled through ACPI table.
> 
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  drivers/i2c/busses/i2c-gpio.c | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-gpio.c b/drivers/i2c/busses/i2c-gpio.c
> index b1985c1667e1..417eb31e0971 100644
> --- a/drivers/i2c/busses/i2c-gpio.c
> +++ b/drivers/i2c/busses/i2c-gpio.c
> @@ -13,6 +13,7 @@
>  #include <linux/init.h>
>  #include <linux/interrupt.h>
>  #include <linux/module.h>
> +#include <linux/acpi.h>
>  #include <linux/of.h>
>  #include <linux/platform_data/i2c-gpio.h>
>  #include <linux/platform_device.h>
> @@ -318,6 +319,24 @@ static void of_i2c_gpio_get_props(struct device_node *np,
>  		of_property_read_bool(np, "i2c-gpio,scl-output-only");
>  }
>  
> +static void acpi_i2c_gpio_get_props(struct device *dev,
> +				  struct i2c_gpio_platform_data *pdata)
> +{
> +	u32 reg;
> +
> +	device_property_read_u32(dev, "delay-us", &pdata->udelay);
> +
> +	if (!device_property_read_u32(dev, "timeout-ms", &reg))
> +		pdata->timeout = msecs_to_jiffies(reg);
> +
> +	pdata->sda_is_open_drain =
> +		device_property_read_bool(dev, "sda-open-drain");
> +	pdata->scl_is_open_drain =
> +		device_property_read_bool(dev, "scl-open-drain");
> +	pdata->scl_is_output_only =
> +		device_property_read_bool(dev, "scl-output-only");
> +}

Otherwise this patch looks good but I'm concerned because we have two
kinds of bindings now. The DT one above uses "i2c-gpio,..." and this
ACPI one uses just "..." so the question is where did these come from?
Is there already some existing system out there with these bindings or
they are documented somewhere?

Ideally we would be able to just do:

	pdata->sda_is_open_drain =
		device_property_read_bool(dev, "i2c-gpio,sda-open-drain");

for any firmware description.

> +
>  static struct gpio_desc *i2c_gpio_get_desc(struct device *dev,
>  					   const char *con_id,
>  					   unsigned int index,
> @@ -375,6 +394,8 @@ static int i2c_gpio_probe(struct platform_device *pdev)
>  
>  	if (np) {
>  		of_i2c_gpio_get_props(np, pdata);
> +	} else if (ACPI_COMPANION(dev)) {
> +		acpi_i2c_gpio_get_props(dev, pdata);
>  	} else {
>  		/*
>  		 * If all platform data settings are zero it is OK
> @@ -491,10 +512,19 @@ static const struct of_device_id i2c_gpio_dt_ids[] = {
>  MODULE_DEVICE_TABLE(of, i2c_gpio_dt_ids);
>  #endif
>  
> +#ifdef CONFIG_ACPI
> +static const struct acpi_device_id i2c_gpio_acpi_match[] = {
> +	{"LOON0005"}, /*LoongArch*/
> +	{}
> +};
> +MODULE_DEVICE_TABLE(acpi, i2c_gpio_acpi_match);
> +#endif
> +
>  static struct platform_driver i2c_gpio_driver = {
>  	.driver		= {
>  		.name	= "i2c-gpio",
>  		.of_match_table	= of_match_ptr(i2c_gpio_dt_ids),
> +		.acpi_match_table = ACPI_PTR(i2c_gpio_acpi_match),
>  	},
>  	.probe		= i2c_gpio_probe,
>  	.remove		= i2c_gpio_remove,
> -- 
> 2.31.1
