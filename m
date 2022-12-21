Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9B26653756
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Dec 2022 21:08:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234749AbiLUUIC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 21 Dec 2022 15:08:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229578AbiLUUIB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 21 Dec 2022 15:08:01 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D18020BD5;
        Wed, 21 Dec 2022 12:08:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671653280; x=1703189280;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aLxKIfV0JnJSlwyEArfN5S1veu6mHIJ+yOsHfgJEft8=;
  b=fDlPFtavXjaDAxhIqOJhG1t3pDxZUViXNuFek+qgwsB57OdXy5UZ4qlm
   HcGOZz6JafT/qt8/763JVe10SR+DmxqpAy3xAP7u6j6VwpA3SWsgwVl/2
   5M9MAZ32asX1BLocK2oJHPgyJp2ik8tf0G+ZyUP6dKmT0ruBJKZ+2E4rF
   qA3SvclHb4S/tlGThs3peo1JD+4ZseoUSTAyPlozYCsOxRLSGaal23JVl
   841PFxeJ7nRfEarYyunnVYUxaBfQ9ChT/JlUdnU73fem79g5e8/B4CQzZ
   i1/FC6qqEXitqkcpQITmfQEDxj1HqFG3ofM+utlylFpVtV9eduLBcwVDD
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="307647026"
X-IronPort-AV: E=Sophos;i="5.96,263,1665471600"; 
   d="scan'208";a="307647026"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2022 12:07:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="683932518"
X-IronPort-AV: E=Sophos;i="5.96,263,1665471600"; 
   d="scan'208";a="683932518"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga001.jf.intel.com with ESMTP; 21 Dec 2022 12:07:47 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1p85NQ-00De9t-3B;
        Wed, 21 Dec 2022 22:07:44 +0200
Date:   Wed, 21 Dec 2022 22:07:44 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Hanna Hawa <hhhawa@amazon.com>
Cc:     wsa@kernel.org, jarkko.nikula@linux.intel.com,
        mika.westerberg@linux.intel.com, jsd@semihalf.com,
        linus.walleij@linaro.org, ben-linux@fluff.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        dwmw@amazon.co.uk, benh@amazon.com, ronenk@amazon.com,
        talel@amazon.com, jonnyc@amazon.com, hanochu@amazon.com,
        farbere@amazon.com, itamark@amazon.com, lareine@amazon.com
Subject: Re: [PATCH v5 1/1] i2c: designware: use casting of u64 in clock
 multiplication to avoid overflow
Message-ID: <Y6NnkDwD9UUQ8Ro/@smile.fi.intel.com>
References: <20221221195900.23276-1-hhhawa@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221221195900.23276-1-hhhawa@amazon.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Dec 21, 2022 at 07:59:00PM +0000, Hanna Hawa wrote:
> From: Lareine Khawaly <lareine@amazon.com>
> 
> In functions i2c_dw_scl_lcnt() and i2c_dw_scl_hcnt() may have overflow
> by depending on the values of the given parameters including the ic_clk.
> For example in our use case where ic_clk is larger than one million,
> multiplication of ic_clk * 4700 will result in 32 bit overflow.
> 
> Add cast of u64 to the calculation to avoid multiplication overflow, and
> use the corresponding define for divide.

Perfect, thank you!
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Fixes: 2373f6b9744d ("i2c-designware: split of i2c-designware.c into core and bus specific parts")
> Signed-off-by: Lareine Khawaly <lareine@amazon.com>
> Signed-off-by: Hanna Hawa <hhhawa@amazon.com>
> ---
> Change log v4->v5:
> - Fix indentation
> 
> Change Log v3->v4:
> - update line length when possible
> - fix change log location in the patch
> 
> Change Log v2->v3:
> - Avoid changing the ic_clk parameter to u64, and do casting in the
>   calculation itself instead.
> - i2c_dw_clk_rate() returns unsigned long which is confusing because the
>   function return the value of get_clk_rate_khz() which returns u32.
>   This is not effect the overflow issue, pushed change in separated
>   patch.
> - use DIV_ROUND_CLOSEST_ULL instead of DIV_ROUND_CLOSEST
> 
> Change Log v1->v2:
> - Update commit message and add fix tag.
> 
>  drivers/i2c/busses/i2c-designware-common.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
> index e0a46dfd1c15..6fdb25a5f801 100644
> --- a/drivers/i2c/busses/i2c-designware-common.c
> +++ b/drivers/i2c/busses/i2c-designware-common.c
> @@ -351,7 +351,8 @@ u32 i2c_dw_scl_hcnt(u32 ic_clk, u32 tSYMBOL, u32 tf, int cond, int offset)
>  		 *
>  		 * If your hardware is free from tHD;STA issue, try this one.
>  		 */
> -		return DIV_ROUND_CLOSEST(ic_clk * tSYMBOL, MICRO) - 8 + offset;
> +		return DIV_ROUND_CLOSEST_ULL((u64)ic_clk * tSYMBOL, MICRO) -
> +		       8 + offset;
>  	else
>  		/*
>  		 * Conditional expression:
> @@ -367,7 +368,8 @@ u32 i2c_dw_scl_hcnt(u32 ic_clk, u32 tSYMBOL, u32 tf, int cond, int offset)
>  		 * The reason why we need to take into account "tf" here,
>  		 * is the same as described in i2c_dw_scl_lcnt().
>  		 */
> -		return DIV_ROUND_CLOSEST(ic_clk * (tSYMBOL + tf), MICRO) - 3 + offset;
> +		return DIV_ROUND_CLOSEST_ULL((u64)ic_clk * (tSYMBOL + tf), MICRO) -
> +		       3 + offset;
>  }
>  
>  u32 i2c_dw_scl_lcnt(u32 ic_clk, u32 tLOW, u32 tf, int offset)
> @@ -383,7 +385,8 @@ u32 i2c_dw_scl_lcnt(u32 ic_clk, u32 tLOW, u32 tf, int offset)
>  	 * account the fall time of SCL signal (tf).  Default tf value
>  	 * should be 0.3 us, for safety.
>  	 */
> -	return DIV_ROUND_CLOSEST(ic_clk * (tLOW + tf), MICRO) - 1 + offset;
> +	return DIV_ROUND_CLOSEST_ULL((u64)ic_clk * (tLOW + tf), MICRO) -
> +	       1 + offset;
>  }
>  
>  int i2c_dw_set_sda_hold(struct dw_i2c_dev *dev)
> -- 
> 2.38.1
> 

-- 
With Best Regards,
Andy Shevchenko


