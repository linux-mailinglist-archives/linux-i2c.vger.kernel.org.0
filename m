Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22004749804
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Jul 2023 11:11:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229528AbjGFJLn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 Jul 2023 05:11:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231906AbjGFJLj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 6 Jul 2023 05:11:39 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCAF2DB;
        Thu,  6 Jul 2023 02:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688634698; x=1720170698;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ekHp2nELjYlgyZkKYcsz1RmYnFI0SwFmUC/Z0AuBeuM=;
  b=ZeXNRTypEx/PZ7J/dlnxOeJOHBvgPmD5FSaXORjkMGyND4tjWBRFBlCz
   cwmIUd7y3zRtmq4aI4nmNMBJijRpHBBbTLL6SLCm/J7+kTQa93otCuunX
   1X6i81Cf82y3PsuvcVgD1edkIWXueVSviv2SnuVUeQGF1MwtZytI1UMgw
   Y1eBMKL9Wrxj8LruEsdn3AvcXJu08SYkfuFGTA9EO5hKNkkbhkOAVM2eG
   oqRcHIbWUfHvXmQsWinq35EMKjbkgTMNhDrjorhZNScUWif7j8kLkapBS
   4GqNfWuwwqEqlDVHJxCFwebsaJEMqAjEXqQM8M5JAR63vXigIRJaPTjx9
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="343884302"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; 
   d="scan'208";a="343884302"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2023 02:11:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="864031653"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; 
   d="scan'208";a="864031653"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga001.fm.intel.com with ESMTP; 06 Jul 2023 02:11:36 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qHL1T-000ThJ-03;
        Thu, 06 Jul 2023 12:11:35 +0300
Date:   Thu, 6 Jul 2023 12:11:34 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>
Subject: Re: [PATCH 06/23] i2c: designware: Remove #ifdef guards for PM
 related functions
Message-ID: <ZKaFRpm9Ito94fgL@smile.fi.intel.com>
References: <20230705204314.89800-1-paul@crapouillou.net>
 <20230705204314.89800-7-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230705204314.89800-7-paul@crapouillou.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jul 05, 2023 at 10:42:57PM +0200, Paul Cercueil wrote:
> Use the new PM macros for the suspend and resume functions to be
> automatically dropped by the compiler when CONFIG_PM or
> CONFIG_PM_SLEEP are disabled, without having to use #ifdef guards.
> 
> This has the advantage of always compiling these functions in,
> independently of any Kconfig option. Thanks to that, bugs and other
> regressions are subsequently easier to catch.

I have wip of something like this in a private branch, so
I'm glad you beat me up to it!

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

> ---
> Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
> Cc: Jan Dabros <jsd@semihalf.com>
> ---
>  drivers/i2c/busses/i2c-designware-platdrv.c | 22 ++++++---------------
>  1 file changed, 6 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
> index 970c1c3b0402..855b698e99c0 100644
> --- a/drivers/i2c/busses/i2c-designware-platdrv.c
> +++ b/drivers/i2c/busses/i2c-designware-platdrv.c
> @@ -418,7 +418,6 @@ static void dw_i2c_plat_remove(struct platform_device *pdev)
>  	reset_control_assert(dev->rst);
>  }
>  
> -#ifdef CONFIG_PM_SLEEP
>  static int dw_i2c_plat_prepare(struct device *dev)
>  {
>  	/*
> @@ -429,11 +428,7 @@ static int dw_i2c_plat_prepare(struct device *dev)
>  	 */
>  	return !has_acpi_companion(dev);
>  }
> -#else
> -#define dw_i2c_plat_prepare	NULL
> -#endif
>  
> -#ifdef CONFIG_PM
>  static int dw_i2c_plat_runtime_suspend(struct device *dev)
>  {
>  	struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
> @@ -447,7 +442,7 @@ static int dw_i2c_plat_runtime_suspend(struct device *dev)
>  	return 0;
>  }
>  
> -static int __maybe_unused dw_i2c_plat_suspend(struct device *dev)
> +static int dw_i2c_plat_suspend(struct device *dev)
>  {
>  	struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
>  
> @@ -468,7 +463,7 @@ static int dw_i2c_plat_runtime_resume(struct device *dev)
>  	return 0;
>  }
>  
> -static int __maybe_unused dw_i2c_plat_resume(struct device *dev)
> +static int dw_i2c_plat_resume(struct device *dev)
>  {
>  	struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
>  
> @@ -479,16 +474,11 @@ static int __maybe_unused dw_i2c_plat_resume(struct device *dev)
>  }
>  
>  static const struct dev_pm_ops dw_i2c_dev_pm_ops = {
> -	.prepare = dw_i2c_plat_prepare,
> -	SET_LATE_SYSTEM_SLEEP_PM_OPS(dw_i2c_plat_suspend, dw_i2c_plat_resume)
> -	SET_RUNTIME_PM_OPS(dw_i2c_plat_runtime_suspend, dw_i2c_plat_runtime_resume, NULL)
> +	.prepare = pm_sleep_ptr(dw_i2c_plat_prepare),
> +	LATE_SYSTEM_SLEEP_PM_OPS(dw_i2c_plat_suspend, dw_i2c_plat_resume)
> +	RUNTIME_PM_OPS(dw_i2c_plat_runtime_suspend, dw_i2c_plat_runtime_resume, NULL)
>  };
>  
> -#define DW_I2C_DEV_PMOPS (&dw_i2c_dev_pm_ops)
> -#else
> -#define DW_I2C_DEV_PMOPS NULL
> -#endif
> -
>  /* Work with hotplug and coldplug */
>  MODULE_ALIAS("platform:i2c_designware");
>  
> @@ -499,7 +489,7 @@ static struct platform_driver dw_i2c_driver = {
>  		.name	= "i2c_designware",
>  		.of_match_table = of_match_ptr(dw_i2c_of_match),
>  		.acpi_match_table = ACPI_PTR(dw_i2c_acpi_match),
> -		.pm	= DW_I2C_DEV_PMOPS,
> +		.pm	= pm_ptr(&dw_i2c_dev_pm_ops),
>  	},
>  };
>  
> -- 
> 2.40.1
> 

-- 
With Best Regards,
Andy Shevchenko


