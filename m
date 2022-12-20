Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50017651F36
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Dec 2022 11:48:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231371AbiLTKsq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 20 Dec 2022 05:48:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229749AbiLTKsm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 20 Dec 2022 05:48:42 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4F6FB5E;
        Tue, 20 Dec 2022 02:48:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671533321; x=1703069321;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mGnjsZRZGuBUTGQnqaiYvmkGkVdj81DKocJt/J2G9rY=;
  b=fZY2NgJD4pEo10sZkbwDpvRNWZYfPb2TkKazncQjpF3WwsuSTrq2bLZO
   rJMbGpSGEaNhKKCCtf55Q1/NQylUf4uuKTcy7pxLvNwKVYsPDoCyuCrSQ
   RE01u+LXVGAU8adNL6tY83I1mwTaOlvMRaggzoDkXAen4/52w1zeLFCZs
   4nGoDjgoBpKdEV8vSKKRFQx1Kt2um6T6HsTXXYQIrG1JhB1wOC0b4WtNv
   wEjSK7k1uw/ZlJHrac6O93yf7uz2HP2wYCAN5yR9ekzXK/N3dtuIZ+uWO
   K2elby4TJ+dtJiV0A1OEWA7UE70Nddi7iMtt2KI2fQ4x3Tv4QB1d0ECTH
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10566"; a="321488336"
X-IronPort-AV: E=Sophos;i="5.96,259,1665471600"; 
   d="scan'208";a="321488336"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2022 02:48:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10566"; a="719483877"
X-IronPort-AV: E=Sophos;i="5.96,259,1665471600"; 
   d="scan'208";a="719483877"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004.fm.intel.com with ESMTP; 20 Dec 2022 02:48:31 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1p7aAf-00CpV6-1H;
        Tue, 20 Dec 2022 12:48:29 +0200
Date:   Tue, 20 Dec 2022 12:48:29 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Hanna Hawa <hhhawa@amazon.com>
Cc:     wsa@kernel.org, jarkko.nikula@linux.intel.com,
        Suravee.Suthikulpanit@amd.com, mika.westerberg@linux.intel.com,
        jsd@semihalf.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, dwmw@amazon.co.uk, benh@amazon.com,
        ronenk@amazon.com, talel@amazon.com, jonnyc@amazon.com,
        hanochu@amazon.com, farbere@amazon.com, itamark@amazon.com
Subject: Re: [PATCH 1/1] i2c: designware: fix i2c_dw_clk_rate() return size
 to be u32
Message-ID: <Y6GS/QaEmxJSe4kS@smile.fi.intel.com>
References: <20221219172345.14272-1-hhhawa@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221219172345.14272-1-hhhawa@amazon.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Dec 19, 2022 at 05:23:45PM +0000, Hanna Hawa wrote:
> Make i2c_dw_clk_rate() to return u32 instead of unsigned long, as the
> function return the value of get_clk_rate_khz() which returns u32.

Makes sense.
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Fixes: b33af11de236 ("i2c: designware: Do not require clock when SSCN and FFCN are provided")
> Signed-off-by: Hanna Hawa <hhhawa@amazon.com>
> ---
>  drivers/i2c/busses/i2c-designware-common.c | 2 +-
>  drivers/i2c/busses/i2c-designware-core.h   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
> index c023b691441e..e0a46dfd1c15 100644
> --- a/drivers/i2c/busses/i2c-designware-common.c
> +++ b/drivers/i2c/busses/i2c-designware-common.c
> @@ -462,7 +462,7 @@ void __i2c_dw_disable(struct dw_i2c_dev *dev)
>  	dev_warn(dev->dev, "timeout in disabling adapter\n");
>  }
>  
> -unsigned long i2c_dw_clk_rate(struct dw_i2c_dev *dev)
> +u32 i2c_dw_clk_rate(struct dw_i2c_dev *dev)
>  {
>  	/*
>  	 * Clock is not necessary if we got LCNT/HCNT values directly from
> diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
> index 4d3a3b464ecd..56a029da448a 100644
> --- a/drivers/i2c/busses/i2c-designware-core.h
> +++ b/drivers/i2c/busses/i2c-designware-core.h
> @@ -322,7 +322,7 @@ int i2c_dw_init_regmap(struct dw_i2c_dev *dev);
>  u32 i2c_dw_scl_hcnt(u32 ic_clk, u32 tSYMBOL, u32 tf, int cond, int offset);
>  u32 i2c_dw_scl_lcnt(u32 ic_clk, u32 tLOW, u32 tf, int offset);
>  int i2c_dw_set_sda_hold(struct dw_i2c_dev *dev);
> -unsigned long i2c_dw_clk_rate(struct dw_i2c_dev *dev);
> +u32 i2c_dw_clk_rate(struct dw_i2c_dev *dev);
>  int i2c_dw_prepare_clk(struct dw_i2c_dev *dev, bool prepare);
>  int i2c_dw_acquire_lock(struct dw_i2c_dev *dev);
>  void i2c_dw_release_lock(struct dw_i2c_dev *dev);
> -- 
> 2.38.1
> 

-- 
With Best Regards,
Andy Shevchenko


