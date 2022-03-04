Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C51E4CD45E
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Mar 2022 13:40:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229886AbiCDMk5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Mar 2022 07:40:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231390AbiCDMk4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 4 Mar 2022 07:40:56 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41ED21768D1
        for <linux-i2c@vger.kernel.org>; Fri,  4 Mar 2022 04:40:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646397608; x=1677933608;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lu2A8nr4iljZZ3A9dmddmJKaKz+e0D2A7UK6WgZvM78=;
  b=VYoglmUTfzvbEGhFq/YH0NHlx0tvlxOjhsQRMh1fcAZgzWHH5VVDwnXa
   Og8neSPFsKvUbsMuzkXyQbk44Mh9GUfRNvydcOMoWFjX0Z63OWIS7v7W+
   hEYDZF50uKymx9sM01TlLDTbwFUYB7+wpaVIivhDwBv4bmBMzSITSP7wu
   IbMe+Rw1wexc4Zc1/s3Bnb7OAymcUhvFqQ773rCTaYpCG6IZJqP7RcI+S
   sgvkyyCRt3T+Gq/8B7djLMuemHmMxhFYqOHyH2Om8L6UimFlag4pQfAyk
   0l4MDG9Boparadpr/5426UYgYnh2nLtdGuoNqvbSfgb+k176dQALExzRm
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10275"; a="254159714"
X-IronPort-AV: E=Sophos;i="5.90,155,1643702400"; 
   d="scan'208";a="254159714"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2022 04:39:55 -0800
X-IronPort-AV: E=Sophos;i="5.90,155,1643702400"; 
   d="scan'208";a="508971098"
Received: from smile.fi.intel.com ([10.237.72.59])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2022 04:39:52 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nQ7D8-00BDd6-E7;
        Fri, 04 Mar 2022 14:39:06 +0200
Date:   Fri, 4 Mar 2022 14:39:06 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     Wolfram Sang <wsa@kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Hans de Goede <hdegoede@redhat.com>,
        linux-i2c@vger.kernel.org, patches@lists.linux.dev
Subject: Re: [PATCH -next] i2c: designware: Mark
 dw_i2c_plat_{suspend,resume}() as __maybe_unused
Message-ID: <YiIIanhJXnoDWJkq@smile.fi.intel.com>
References: <20220303191713.2402461-1-nathan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220303191713.2402461-1-nathan@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-7.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Mar 03, 2022 at 12:17:13PM -0700, Nathan Chancellor wrote:
> When CONFIG_PM is set but CONFIG_PM_SLEEP is not, two compiler warnings
> appear:
> 
>   drivers/i2c/busses/i2c-designware-platdrv.c:444:12: error: unused function 'dw_i2c_plat_suspend' [-Werror,-Wunused-function]
>   static int dw_i2c_plat_suspend(struct device *dev)
>              ^
>   drivers/i2c/busses/i2c-designware-platdrv.c:465:12: error: unused function 'dw_i2c_plat_resume' [-Werror,-Wunused-function]
>   static int dw_i2c_plat_resume(struct device *dev)
>              ^
>   2 errors generated.
> 
> These functions are only used in SET_LATE_SYSTEM_SLEEP_PM_OPS(), which
> is defined as empty when CONFIG_PM_SLEEP is not defined. Mark the
> functions as __maybe_unused to make it clear that these functions might
> be unused in this configuration.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Thanks!


> Fixes: c57813b8b288 ("i2c: designware: Lock the adapter while setting the suspended flag")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  drivers/i2c/busses/i2c-designware-platdrv.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
> index 116a297d1f6b..70ade5306e45 100644
> --- a/drivers/i2c/busses/i2c-designware-platdrv.c
> +++ b/drivers/i2c/busses/i2c-designware-platdrv.c
> @@ -441,7 +441,7 @@ static int dw_i2c_plat_runtime_suspend(struct device *dev)
>  	return 0;
>  }
>  
> -static int dw_i2c_plat_suspend(struct device *dev)
> +static int __maybe_unused dw_i2c_plat_suspend(struct device *dev)
>  {
>  	struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
>  
> @@ -462,7 +462,7 @@ static int dw_i2c_plat_runtime_resume(struct device *dev)
>  	return 0;
>  }
>  
> -static int dw_i2c_plat_resume(struct device *dev)
> +static int __maybe_unused dw_i2c_plat_resume(struct device *dev)
>  {
>  	struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
>  
> 
> base-commit: 1d366c2f9df8279df2adbb60471f86fc40a1c39e
> -- 
> 2.35.1
> 

-- 
With Best Regards,
Andy Shevchenko


