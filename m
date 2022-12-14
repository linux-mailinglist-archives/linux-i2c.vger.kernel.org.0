Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87D3F64CDC1
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Dec 2022 17:13:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238828AbiLNQNi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Dec 2022 11:13:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238880AbiLNQNV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Dec 2022 11:13:21 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E621726AA3;
        Wed, 14 Dec 2022 08:13:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671034400; x=1702570400;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EK21mGpVkl+u/cMbAO0Q/LoJISNG2jsqcGqQ1RtO0jw=;
  b=bcr6Mly9J2bJoS+xXqrd8SspKEMdrTnHA2ARztqABvQYisKmEDC+lpsz
   rAAvl8fkhEWMhNizv6pvfotj+jUBwuinfZ6zX0/7BoUejob3NuRIKdwI6
   3wCGGyz95ts1RKlDYKegpSSwSM2JCkVY84hSgL99KYO8Cgk3byL9lfsGP
   pMieAk7K0eoH8ABWeHaC2cuzh4EBRsKBcKNqCOcwcWwyU9aU4SQsuYs2j
   w5wdfJb3v26En0hkc3iGWuOv2or92JuMpPr7/5qLqAuqVkn/ZVXoE1WOA
   ozR1STfvljJg4oY4bODSMcPf6NfTv23vhB4/N6fVhjWdS7shY4xDsRdzz
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10561"; a="320303034"
X-IronPort-AV: E=Sophos;i="5.96,244,1665471600"; 
   d="scan'208";a="320303034"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2022 08:12:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10561"; a="773389912"
X-IronPort-AV: E=Sophos;i="5.96,244,1665471600"; 
   d="scan'208";a="773389912"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga004.jf.intel.com with ESMTP; 14 Dec 2022 08:12:14 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1p5UMe-009tRP-2f;
        Wed, 14 Dec 2022 18:12:12 +0200
Date:   Wed, 14 Dec 2022 18:12:12 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Hanna Hawa <hhhawa@amazon.com>
Cc:     jarkko.nikula@linux.intel.com, mika.westerberg@linux.intel.com,
        jsd@semihalf.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, dwmw@amazon.co.uk, benh@amazon.com,
        ronenk@amazon.com, talel@amazon.com, jonnyc@amazon.com,
        hanochu@amazon.com, farbere@amazon.com, itamark@amazon.com,
        lareine@amazon.com
Subject: Re: [PATCH v2 1/1] i2c: designware: use u64 for clock freq to avoid
 u32 multiplication overflow
Message-ID: <Y5n13HLzvMIy3RVh@smile.fi.intel.com>
References: <20221214154117.65714-1-hhhawa@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221214154117.65714-1-hhhawa@amazon.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Dec 14, 2022 at 03:41:17PM +0000, Hanna Hawa wrote:
> From: Lareine Khawaly <lareine@amazon.com>
> 
> In functions i2c_dw_scl_lcnt() and i2c_dw_scl_hcnt() may have overflow
> by depending on the values of the given parameters including the ic_clk.
> For example in our use case where ic_clk is larger than one million,
> multiplication of ic_clk * 4700 will result in 32 bit overflow.
> 
> Make the ic_clk to be u64 parameter to avoid the overflow.

Below my comment, after addressing it,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Change Log v1->v2:
> - Update commit message and add fix tag.

Wrong location of the changelog...

> Fixes: 2373f6b9744d ("i2c-designware: split of i2c-designware.c into core and bus specific parts")
> Signed-off-by: Lareine Khawaly <lareine@amazon.com>
> Signed-off-by: Hanna Hawa <hhhawa@amazon.com>
> ---

...should be somewhere here.

>  drivers/i2c/busses/i2c-designware-common.c | 4 ++--
>  drivers/i2c/busses/i2c-designware-core.h   | 4 ++--
>  drivers/i2c/busses/i2c-designware-master.c | 2 +-
>  3 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
> index c023b691441e..61a6b7bb8935 100644
> --- a/drivers/i2c/busses/i2c-designware-common.c
> +++ b/drivers/i2c/busses/i2c-designware-common.c
> @@ -332,7 +332,7 @@ void i2c_dw_adjust_bus_speed(struct dw_i2c_dev *dev)
>  }
>  EXPORT_SYMBOL_GPL(i2c_dw_adjust_bus_speed);
>  
> -u32 i2c_dw_scl_hcnt(u32 ic_clk, u32 tSYMBOL, u32 tf, int cond, int offset)
> +u32 i2c_dw_scl_hcnt(u64 ic_clk, u32 tSYMBOL, u32 tf, int cond, int offset)
>  {
>  	/*
>  	 * DesignWare I2C core doesn't seem to have solid strategy to meet
> @@ -370,7 +370,7 @@ u32 i2c_dw_scl_hcnt(u32 ic_clk, u32 tSYMBOL, u32 tf, int cond, int offset)
>  		return DIV_ROUND_CLOSEST(ic_clk * (tSYMBOL + tf), MICRO) - 3 + offset;
>  }
>  
> -u32 i2c_dw_scl_lcnt(u32 ic_clk, u32 tLOW, u32 tf, int offset)
> +u32 i2c_dw_scl_lcnt(u64 ic_clk, u32 tLOW, u32 tf, int offset)
>  {
>  	/*
>  	 * Conditional expression:
> diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
> index 4d3a3b464ecd..aaba6f9977b6 100644
> --- a/drivers/i2c/busses/i2c-designware-core.h
> +++ b/drivers/i2c/busses/i2c-designware-core.h
> @@ -319,8 +319,8 @@ struct i2c_dw_semaphore_callbacks {
>  };
>  
>  int i2c_dw_init_regmap(struct dw_i2c_dev *dev);
> -u32 i2c_dw_scl_hcnt(u32 ic_clk, u32 tSYMBOL, u32 tf, int cond, int offset);
> -u32 i2c_dw_scl_lcnt(u32 ic_clk, u32 tLOW, u32 tf, int offset);
> +u32 i2c_dw_scl_hcnt(u64 ic_clk, u32 tSYMBOL, u32 tf, int cond, int offset);
> +u32 i2c_dw_scl_lcnt(u64 ic_clk, u32 tLOW, u32 tf, int offset);
>  int i2c_dw_set_sda_hold(struct dw_i2c_dev *dev);
>  unsigned long i2c_dw_clk_rate(struct dw_i2c_dev *dev);
>  int i2c_dw_prepare_clk(struct dw_i2c_dev *dev, bool prepare);
> diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
> index 16a4cd68567c..bfa2b37fb3f7 100644
> --- a/drivers/i2c/busses/i2c-designware-master.c
> +++ b/drivers/i2c/busses/i2c-designware-master.c
> @@ -44,7 +44,7 @@ static int i2c_dw_set_timings_master(struct dw_i2c_dev *dev)
>  	u32 sda_falling_time, scl_falling_time;
>  	struct i2c_timings *t = &dev->timings;
>  	const char *fp_str = "";
> -	u32 ic_clk;
> +	u64 ic_clk;
>  	int ret;
>  
>  	ret = i2c_dw_acquire_lock(dev);
> -- 
> 2.38.1
> 

-- 
With Best Regards,
Andy Shevchenko


