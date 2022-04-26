Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C72550FE9F
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Apr 2022 15:15:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347337AbiDZNRZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 26 Apr 2022 09:17:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350796AbiDZNRU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 26 Apr 2022 09:17:20 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B729C7306A
        for <linux-i2c@vger.kernel.org>; Tue, 26 Apr 2022 06:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650978851; x=1682514851;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ytIWqc057ix9SvuOXgl+FMLYUEj3n6agUztSwF8j1uo=;
  b=J8/Hli2rBF4CczmW62fzCTOYnvEOOP9BS6kgQ+oSBv7H0cQWO2sgtW0G
   NsuSfW9XuHTiVnrInKajgYzfqiN7muvg2+mnKfoS2Rr4tN5yXYP2cmKDM
   HuWEYx5yz/7f6bOv/YMME3gVnzm6zPkz/8BGRPUM2S5mHy6fI2oaVf/lr
   5+iXuE8LJl6IFUOspJB+tquTZl+m4SleicVWtabyGXljIEyzl7OxdcGLc
   aorkTXjP2+5GkjbEXEUReKGXjSlO2Toi71KyrE66n5DWqZDy9dZlU+qd2
   6YPsYeL18YHFh6CPppja7R4vhDqxWdX+VqejjD5LZGgEqklg+WDf92Gta
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10328"; a="245495649"
X-IronPort-AV: E=Sophos;i="5.90,290,1643702400"; 
   d="scan'208";a="245495649"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2022 06:14:11 -0700
X-IronPort-AV: E=Sophos;i="5.90,290,1643702400"; 
   d="scan'208";a="807512383"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2022 06:14:09 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1njL15-008Kr5-96;
        Tue, 26 Apr 2022 16:14:07 +0300
Date:   Tue, 26 Apr 2022 16:14:06 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>
Subject: Re: [PATCH] i2c: designware: Sort timing parameter ACPI method calls
 by the speed
Message-ID: <YmfwHgw7W8WJM9e7@smile.fi.intel.com>
References: <20220420125802.352306-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220420125802.352306-1-jarkko.nikula@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Apr 20, 2022 at 03:58:02PM +0300, Jarkko Nikula wrote:
> It's more logical to read these get timing parameters ACPI method calls
> sorted by speed categories in increasing order: Standard-mode,
> Fast-mode, Fast-mode Plus and High-speed mode.
> 
> Originally these were in order after commit a92ec1746f10
> ("i2c: designware: get fast plus and high speed *CNT configuration") but
> got mixed up over the years.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> ---
>  drivers/i2c/busses/i2c-designware-common.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
> index 9f8574320eb2..e7d316b1401a 100644
> --- a/drivers/i2c/busses/i2c-designware-common.c
> +++ b/drivers/i2c/busses/i2c-designware-common.c
> @@ -266,9 +266,9 @@ int i2c_dw_acpi_configure(struct device *device)
>  	 * selected speed modes.
>  	 */
>  	i2c_dw_acpi_params(device, "SSCN", &dev->ss_hcnt, &dev->ss_lcnt, &ss_ht);
> +	i2c_dw_acpi_params(device, "FMCN", &dev->fs_hcnt, &dev->fs_lcnt, &fs_ht);
>  	i2c_dw_acpi_params(device, "FPCN", &dev->fp_hcnt, &dev->fp_lcnt, &fp_ht);
>  	i2c_dw_acpi_params(device, "HSCN", &dev->hs_hcnt, &dev->hs_lcnt, &hs_ht);
> -	i2c_dw_acpi_params(device, "FMCN", &dev->fs_hcnt, &dev->fs_lcnt, &fs_ht);
>  
>  	switch (t->bus_freq_hz) {
>  	case I2C_MAX_STANDARD_MODE_FREQ:
> -- 
> 2.35.1
> 

-- 
With Best Regards,
Andy Shevchenko


