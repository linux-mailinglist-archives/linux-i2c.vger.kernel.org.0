Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FB37614D8E
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Nov 2022 15:59:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231180AbiKAO7G (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Nov 2022 10:59:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231204AbiKAO63 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Nov 2022 10:58:29 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9F9B1D312;
        Tue,  1 Nov 2022 07:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667314584; x=1698850584;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ymj/jOHbE6XLvUeDMy9nMN43LrVvwx6KJLq+fmcPOf0=;
  b=U1fH3qBfHvfoWwy68Tw8jQDYOyG1PSzPFdGWTKHQTH2/XxVWB/vgbEun
   31sEBAnI5qZEOZksyN5BKF3Mq+8ef7f5EclN/h6T1utBSjSNoIhYUQ1C1
   /B9TriiXWhq/l3e4BDBCzRFZe4XcelLWU7MDR/svUJ7X7pjcy5d+8d+jI
   Mh3ZTl3mzwac/eSeBajTbfb6IomScgsEPOc5yFhrBBaUyiZJTHcm1M74Q
   W0N1y1IfzGsvgJxuqm4L4EolvU3Yfcx+W1kjL4L18bQ/k9EJq28rLYVv8
   8pEat5Sbl0hgkZigBoYF4GZVMkkJOAPxhyKp9STHaHECnzrHtgMcywZcy
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="310860962"
X-IronPort-AV: E=Sophos;i="5.95,231,1661842800"; 
   d="scan'208";a="310860962"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2022 07:56:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="636423228"
X-IronPort-AV: E=Sophos;i="5.95,231,1661842800"; 
   d="scan'208";a="636423228"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga007.fm.intel.com with ESMTP; 01 Nov 2022 07:56:06 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1opsgO-005dZF-04;
        Tue, 01 Nov 2022 16:56:04 +0200
Date:   Tue, 1 Nov 2022 16:56:03 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Weilong Chen <chenweilong@huawei.com>
Cc:     yangyicong@hisilicon.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, wsa@kernel.org,
        f.fainelli@gmail.com, jarkko.nikula@linux.intel.com,
        jdelvare@suse.de, william.zhang@broadcom.com, jsd@semihalf.com,
        conor.dooley@microchip.com, phil.edworthy@renesas.com,
        tharunkumar.pasumarthi@microchip.com, semen.protsenko@linaro.org,
        kfting@nuvoton.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH next v10 1/2] i2c: hisi: Add initial device tree support
Message-ID: <Y2Ezg2TYeIsxUYxW@smile.fi.intel.com>
References: <20221101080728.143639-1-chenweilong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221101080728.143639-1-chenweilong@huawei.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-5.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Nov 01, 2022 at 04:07:27PM +0800, Weilong Chen wrote:
> The HiSilicon I2C controller can be used on embedded platform, which
> boot from devicetree.

Thanks, This version LGTM,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Weilong Chen <chenweilong@huawei.com>
> Acked-by: Yicong Yang <yangyicong@hisilicon.com>
> ---
> Change since v9:
> - Drop wrong use ACPI_PTR/of_match_ptr
> Link: https://lore.kernel.org/lkml/dfc1c006-61c0-8f28-6164-060347c69d04@huawei.com/T/
> 
>  drivers/i2c/busses/Kconfig    | 2 +-
>  drivers/i2c/busses/i2c-hisi.c | 7 +++++++
>  2 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index e50f9603d189..a7bfddf08fa7 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -673,7 +673,7 @@ config I2C_HIGHLANDER
>  
>  config I2C_HISI
>  	tristate "HiSilicon I2C controller"
> -	depends on (ARM64 && ACPI) || COMPILE_TEST
> +	depends on ARM64 || COMPILE_TEST
>  	help
>  	  Say Y here if you want to have Hisilicon I2C controller support
>  	  available on the Kunpeng Server.
> diff --git a/drivers/i2c/busses/i2c-hisi.c b/drivers/i2c/busses/i2c-hisi.c
> index 76c3d8f6fc3c..bcc97e4fcb65 100644
> --- a/drivers/i2c/busses/i2c-hisi.c
> +++ b/drivers/i2c/busses/i2c-hisi.c
> @@ -489,11 +489,18 @@ static const struct acpi_device_id hisi_i2c_acpi_ids[] = {
>  };
>  MODULE_DEVICE_TABLE(acpi, hisi_i2c_acpi_ids);
>  
> +static const struct of_device_id hisi_i2c_dts_ids[] = {
> +	{ .compatible = "hisilicon,ascend910-i2c", },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, hisi_i2c_dts_ids);
> +
>  static struct platform_driver hisi_i2c_driver = {
>  	.probe		= hisi_i2c_probe,
>  	.driver		= {
>  		.name	= "hisi-i2c",
>  		.acpi_match_table = hisi_i2c_acpi_ids,
> +		.of_match_table = hisi_i2c_dts_ids,
>  	},
>  };
>  module_platform_driver(hisi_i2c_driver);
> -- 
> 2.31.GIT
> 

-- 
With Best Regards,
Andy Shevchenko


