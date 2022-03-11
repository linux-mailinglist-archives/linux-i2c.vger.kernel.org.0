Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C85804D6700
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Mar 2022 18:02:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234127AbiCKRDJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Mar 2022 12:03:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350596AbiCKRDB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 11 Mar 2022 12:03:01 -0500
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B8421D5296;
        Fri, 11 Mar 2022 09:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647018117; x=1678554117;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xAtkn+6Yrm4CPGtSJwRMIk0Yc8i3ptN3pVxxjuuFOVQ=;
  b=E/bpg2Jz5xLr7XEAFjHFdea/hFYc4uBpzocYfowGotyxjMLNLdiBqADR
   hz1BWSlmD9fQAlGcOlO8VKJZCZDKxPJcrgKjA/FiNH18GPZ+IRlCIvKh1
   QHuD15u5QrqQAPsGVScI/jUxNm5LEu8wNY0+x/8aVEpvvJ1EaSJ05Gp3D
   s667t8TF8a0eNbArf/n5cXydVLKAuleuM7+L6ZAXo8+Jmcl/D28c9s3vF
   JxnQfVonDzeffnkisW2fYQBwdLjxDF9hepTeVyRE/5GoBNYzrv6KhmXm8
   mq80LAiMXFCkretuo6LQrmNKeV35FMEGqjXA04T8JhdpaCayshpgoxjyY
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10283"; a="237782111"
X-IronPort-AV: E=Sophos;i="5.90,174,1643702400"; 
   d="scan'208";a="237782111"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2022 09:01:56 -0800
X-IronPort-AV: E=Sophos;i="5.90,174,1643702400"; 
   d="scan'208";a="633469267"
Received: from smile.fi.intel.com ([10.237.72.59])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2022 09:01:55 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nSidc-00FTUT-Sz;
        Fri, 11 Mar 2022 19:01:12 +0200
Date:   Fri, 11 Mar 2022 19:01:12 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jan Dabros <jsd@semihalf.com>
Cc:     linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        jarkko.nikula@linux.intel.com, wsa@kernel.org,
        upstream@semihalf.com
Subject: Re: [PATCH v2 -next] i2c: designware: Remove code duplication
Message-ID: <YiuAWFtg1ApWQMxR@smile.fi.intel.com>
References: <20220310220932.140973-1-jsd@semihalf.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220310220932.140973-1-jsd@semihalf.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Mar 10, 2022 at 11:09:32PM +0100, Jan Dabros wrote:
> Simplify code by moving common part to one function.

LGTM
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Jan Dabros <jsd@semihalf.com>
> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> v1->v2:
> * Add kudos for Andy who suggested this change
> * Get rid of extra function and move common code to psp_send_i2c_req
> * Update commit message and commit title
>   (was "i2c:designware: Add helper to remove redundancy")
>  drivers/i2c/busses/i2c-designware-amdpsp.c | 35 ++++++++++------------
>  1 file changed, 15 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-amdpsp.c b/drivers/i2c/busses/i2c-designware-amdpsp.c
> index c64e459afb5c..5c32255c3239 100644
> --- a/drivers/i2c/busses/i2c-designware-amdpsp.c
> +++ b/drivers/i2c/busses/i2c-designware-amdpsp.c
> @@ -214,17 +214,28 @@ static int psp_send_i2c_req(enum psp_i2c_req_type i2c_req_type)
>  				PSP_I2C_REQ_RETRY_DELAY_US,
>  				PSP_I2C_REQ_RETRY_CNT * PSP_I2C_REQ_RETRY_DELAY_US,
>  				0, req);
> -	if (ret)
> +	if (ret) {
> +		dev_err(psp_i2c_dev, "Timed out waiting for PSP to %s I2C bus\n",
> +			(i2c_req_type == PSP_I2C_REQ_ACQUIRE) ?
> +			"release" : "acquire");
>  		goto cleanup;
> +	}
>  
>  	ret = status;
> -	if (ret)
> +	if (ret) {
> +		dev_err(psp_i2c_dev, "PSP communication error\n");
>  		goto cleanup;
> +	}
>  
>  	dev_dbg(psp_i2c_dev, "Request accepted by PSP after %ums\n",
>  		jiffies_to_msecs(jiffies - start));
>  
>  cleanup:
> +	if (ret) {
> +		dev_err(psp_i2c_dev, "Assume i2c bus is for exclusive host usage\n");
> +		psp_i2c_mbox_fail = true;
> +	}
> +
>  	kfree(req);
>  	return ret;
>  }
> @@ -249,16 +260,8 @@ static int psp_acquire_i2c_bus(void)
>  	};
>  
>  	status = psp_send_i2c_req(PSP_I2C_REQ_ACQUIRE);
> -	if (status) {
> -		if (status == -ETIMEDOUT)
> -			dev_err(psp_i2c_dev, "Timed out waiting for PSP to release I2C bus\n");
> -		else
> -			dev_err(psp_i2c_dev, "PSP communication error\n");
> -
> -		dev_err(psp_i2c_dev, "Assume i2c bus is for exclusive host usage\n");
> -		psp_i2c_mbox_fail = true;
> +	if (status)
>  		goto cleanup;
> -	}
>  
>  	psp_i2c_sem_acquired = jiffies;
>  	psp_i2c_access_count++;
> @@ -294,16 +297,8 @@ static void psp_release_i2c_bus(void)
>  
>  	/* Send a release command to PSP */
>  	status = psp_send_i2c_req(PSP_I2C_REQ_RELEASE);
> -	if (status) {
> -		if (status == -ETIMEDOUT)
> -			dev_err(psp_i2c_dev, "Timed out waiting for PSP to acquire I2C bus\n");
> -		else
> -			dev_err(psp_i2c_dev, "PSP communication error\n");
> -
> -		dev_err(psp_i2c_dev, "Assume i2c bus is for exclusive host usage\n");
> -		psp_i2c_mbox_fail = true;
> +	if (status)
>  		goto cleanup;
> -	}
>  
>  	dev_dbg(psp_i2c_dev, "PSP semaphore held for %ums\n",
>  		jiffies_to_msecs(jiffies - psp_i2c_sem_acquired));
> -- 
> 2.31.0
> 

-- 
With Best Regards,
Andy Shevchenko


