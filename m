Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 09869546560
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Jun 2022 13:19:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348125AbiFJLTf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 10 Jun 2022 07:19:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347505AbiFJLTe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 10 Jun 2022 07:19:34 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8232614AF5F;
        Fri, 10 Jun 2022 04:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654859973; x=1686395973;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FWd25+nkQABOCKa2N+z8fvZKZ1ypHGesE5mtSjD2jWE=;
  b=SykCTYbwazjKkfTaP54a6ZfH8IkUWCImRmcRBMffgUbMGy5s34wFG3s5
   Bzlur6dHs65yzbw8/WLzgw2Q9dqAPex60LumRMNHQ041HtUo202kyLLl0
   uJPflZDNxWFCfY4Lr8/QmCCeZcYwEK9BYFiGGrBmsILW0Qz/nXVK29KJZ
   Sq6v82anD0ujNAH5WZYlVkB8zNVBLj+HE/JRD7HS9IA9YbeJ3xL9uOZsC
   xuIhr/Yp3F9A5pipSJi0vHURYiJ4g2OXGqZ7sylxRFvQHuZDJ7SgjulLk
   tMqXiLBSO0p/KYNw4mVYOkwZHIRoIlB9h+K9oi+vsXEVQY51ur4c2sT+3
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10373"; a="339351582"
X-IronPort-AV: E=Sophos;i="5.91,290,1647327600"; 
   d="scan'208";a="339351582"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2022 04:19:33 -0700
X-IronPort-AV: E=Sophos;i="5.91,290,1647327600"; 
   d="scan'208";a="724922539"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2022 04:19:29 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nzcfm-000Yii-Lq;
        Fri, 10 Jun 2022 14:19:26 +0300
Date:   Fri, 10 Jun 2022 14:19:26 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: designware: Use standard optional ref clock
 implementation
Message-ID: <YqMovttAaGBw796k@smile.fi.intel.com>
References: <20220610074233.9748-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220610074233.9748-1-Sergey.Semin@baikalelectronics.ru>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-5.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Jun 10, 2022 at 10:42:33AM +0300, Serge Semin wrote:
> Even though the DW I2C controller reference clock source is requested by
> the method devm_clk_get() with non-optional clock requirement the way the
> clock handler is used afterwards has a pure optional clock semantic
> (though in some circumstances we can get a warning about the clock missing
> printed in the system console). There is no point in reimplementing that
> functionality seeing the kernel clock framework already supports the
> optional interface from scratch. Thus let's convert the platform driver to
> using it.
> 
> Note by providing this commit we get to fix two problems. The first one
> was introduced in commit c62ebb3d5f0d ("i2c: designware: Add support for
> an interface clock"). It causes not having the interface clock (pclk)
> enabled/disabled in case if the reference clock isn't provided. The second
> problem was first introduced in commit b33af11de236 ("i2c: designware: Do
> not require clock when SSCN and FFCN are provided"). Since that
> modification the deferred probe procedure has been unsupported in case if
> the interface clock isn't ready.

Makes sense,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Fixes: c62ebb3d5f0d ("i2c: designware: Add support for an interface clock")
> Fixes: b33af11de236 ("i2c: designware: Do not require clock when SSCN and FFCN are provided")
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> ---
>  drivers/i2c/busses/i2c-designware-common.c  |  3 ---
>  drivers/i2c/busses/i2c-designware-platdrv.c | 13 +++++++++++--
>  2 files changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
> index 9f8574320eb2..b08e5bc2b64c 100644
> --- a/drivers/i2c/busses/i2c-designware-common.c
> +++ b/drivers/i2c/busses/i2c-designware-common.c
> @@ -477,9 +477,6 @@ int i2c_dw_prepare_clk(struct dw_i2c_dev *dev, bool prepare)
>  {
>  	int ret;
>  
> -	if (IS_ERR(dev->clk))
> -		return PTR_ERR(dev->clk);
> -
>  	if (prepare) {
>  		/* Optional interface clock */
>  		ret = clk_prepare_enable(dev->pclk);
> diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
> index 70ade5306e45..ba043b547393 100644
> --- a/drivers/i2c/busses/i2c-designware-platdrv.c
> +++ b/drivers/i2c/busses/i2c-designware-platdrv.c
> @@ -320,8 +320,17 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
>  		goto exit_reset;
>  	}
>  
> -	dev->clk = devm_clk_get(&pdev->dev, NULL);
> -	if (!i2c_dw_prepare_clk(dev, true)) {
> +	dev->clk = devm_clk_get_optional(&pdev->dev, NULL);
> +	if (IS_ERR(dev->clk)) {
> +		ret = PTR_ERR(dev->clk);
> +		goto exit_reset;
> +	}
> +
> +	ret = i2c_dw_prepare_clk(dev, true);
> +	if (ret)
> +		goto exit_reset;
> +
> +	if (dev->clk) {
>  		u64 clk_khz;
>  
>  		dev->get_clk_rate_khz = i2c_dw_get_clk_rate_khz;
> -- 
> 2.35.1
> 

-- 
With Best Regards,
Andy Shevchenko


