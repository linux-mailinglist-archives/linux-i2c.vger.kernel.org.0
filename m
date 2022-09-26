Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 09AED5EACF8
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Sep 2022 18:47:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229881AbiIZQrw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 26 Sep 2022 12:47:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229545AbiIZQrd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 26 Sep 2022 12:47:33 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4867814979E;
        Mon, 26 Sep 2022 08:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664206766; x=1695742766;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bpjB9oa09/n7/0gP0TKZgaDRnnGyZ1buQjAUJvrc8z0=;
  b=kG2voKYuXZssgxoQ+xnYDNJkXmyerbj7FX7aYjRGJVHDG3QbOihimwA7
   zgkBZjAHrhe8aAYLf0P3jb6BG+RyWQP5uCYj1cgH/YsIWBmwtLRxt+m23
   ILbO01ehxv1SbJUZ6NUYhEphMKFwzwAKh7CX8TIjtQW1hwGnNtK0SrEO8
   KB4x5YfcG8ZZm73NAovvaT+2VwlqHq75Bgqb3SHT7Uwa00F5TsqrShAtb
   0QcqORx8v02FqYNiIOOg1xt0vdXwrrqsU6ZFVAHc8tv68C6KHhJnVCL8a
   xZWNqPrg4bJeZBFNFHm0EijISjOiy7RamlybW6RPubytrP4CnyU3fVlP5
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="302531687"
X-IronPort-AV: E=Sophos;i="5.93,346,1654585200"; 
   d="scan'208";a="302531687"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2022 08:39:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="621100753"
X-IronPort-AV: E=Sophos;i="5.93,346,1654585200"; 
   d="scan'208";a="621100753"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002.jf.intel.com with ESMTP; 26 Sep 2022 08:39:23 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1ocqCX-0080sk-17;
        Mon, 26 Sep 2022 18:39:21 +0300
Date:   Mon, 26 Sep 2022 18:39:21 +0300
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Binbin Zhou <zhoubinbin@loongson.cn>
Cc:     Wolfram Sang <wsa@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, loongarch@lists.linux.dev,
        linux-acpi@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>,
        Jianmin Lv <lvjianmin@loongson.cn>,
        Huacai Chen <chenhuacai@loongson.cn>
Subject: Re: [PATCH V2 1/4] i2c: gpio: Add support on ACPI-based system
Message-ID: <YzHHqXUdLR5W/sw+@smile.fi.intel.com>
References: <cover.1664193316.git.zhoubinbin@loongson.cn>
 <f5df899e2218c0cd8cc8782b4a8f157ebb9726bc.1664193316.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f5df899e2218c0cd8cc8782b4a8f157ebb9726bc.1664193316.git.zhoubinbin@loongson.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Sep 26, 2022 at 09:00:04PM +0800, Binbin Zhou wrote:
> Add support for the ACPI-based device registration so that the driver
> can be also enabled through ACPI table.
> 
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>

Who is this and why this SoB in the chain?

> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>

...

>  #include <linux/init.h>
>  #include <linux/interrupt.h>
>  #include <linux/module.h>
> +#include <linux/acpi.h>
>  #include <linux/of.h>
>  #include <linux/platform_data/i2c-gpio.h>
>  #include <linux/platform_device.h>

Seems you misinterpret ordering.

Besides that I don't see the needs of acpi.h. The header missed the
mod_devicetable.h (even without this patch), and your code needs property.h.

...

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

+1 to Mika's objection. Instead, make the common bindings and convert
the driver from OF to be agnostic.

...

>  MODULE_DEVICE_TABLE(of, i2c_gpio_dt_ids);
>  #endif
>  
> +#ifdef CONFIG_ACPI

Please, drop these ifdefferies (including OF one), it's more harmful
than useful.

> +#endif

...

>  		.of_match_table	= of_match_ptr(i2c_gpio_dt_ids),
> +		.acpi_match_table = ACPI_PTR(i2c_gpio_acpi_match),

No ACPI_PTR(), and accordingly no of_match_ptr(). See above.

-- 
With Best Regards,
Andy Shevchenko


