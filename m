Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4AB54C1628
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Feb 2022 16:08:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238201AbiBWPJC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Feb 2022 10:09:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239659AbiBWPJC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 23 Feb 2022 10:09:02 -0500
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7D05AC91F;
        Wed, 23 Feb 2022 07:08:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645628913; x=1677164913;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HfHNMcR5ubAAaB+Q+epxiJu58smcf4E5LCJ1Jt49JFE=;
  b=d6g9esswYR7NrDWHHXNyGNEjXTa9Hmtf9P56yOmj9Jq1f/2vkxAdC6Ia
   ic1RNNdnWb77XPpGZJc8ZR/Kt/V0h4uz70WQzjcbDSydFKhHGREoZU9cb
   OKl5q2kh7x/tUdL7h57sq94Q62/E5LckbU8h3zJs4gGk8/wMFaTCXgnse
   rFBbaNwucpvAfsvkkFOob+DH6WSSZnKDuJSvLezyLHNch+wGpBQZyqfs5
   19z+nmorLrHKpEXmTlDmjJC/EpDUki4TXFtgNDOI0ZDdl+fK/jnkEIrXS
   gIl1N6402IAoW9ZXujilC3UEX1DUx006KKKub+fZj8SgOUWrb9M2i0Y/2
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10266"; a="315209149"
X-IronPort-AV: E=Sophos;i="5.88,391,1635231600"; 
   d="scan'208";a="315209149"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2022 07:08:33 -0800
X-IronPort-AV: E=Sophos;i="5.88,391,1635231600"; 
   d="scan'208";a="776699605"
Received: from smile.fi.intel.com ([10.237.72.59])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2022 07:08:31 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nMtEy-007T9n-Ex;
        Wed, 23 Feb 2022 17:07:40 +0200
Date:   Wed, 23 Feb 2022 17:07:39 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jan Dabros <jsd@semihalf.com>
Cc:     linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        jarkko.nikula@linux.intel.com, wsa@kernel.org,
        rrangel@chromium.org, upstream@semihalf.com,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH -next] i2c: designware: Fix improper usage of readl
Message-ID: <YhZNu0pHKiK9Vf55@smile.fi.intel.com>
References: <20220218133348.628962-1-jsd@semihalf.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220218133348.628962-1-jsd@semihalf.com>
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

On Fri, Feb 18, 2022 at 02:33:48PM +0100, Jan Dabros wrote:
> Kernel test robot reported incorrect type in argument 1 of readl(), but
> more importantly it brought attention that MMIO accessor shouldn't be
> used in this case, since req->hdr.status is part of a command-response
> buffer in system memory.
> 
> Since its value may be altered by PSP outside of the scope of current
> thread (somehow similar to IRQ handler case), we need to use
> READ_ONCE() to ensure compiler won't optimize this call.
> 
> Fix also 'status' variable type to reflect that corresponding field in
> command-response buffer is platform-independent u32.

Thanks for the fix, seems reasonable to me.
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Jan Dabros <jsd@semihalf.com>
> Reported-by: kernel test robot <lkp@intel.com>
> ---
>  drivers/i2c/busses/i2c-designware-amdpsp.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-amdpsp.c b/drivers/i2c/busses/i2c-designware-amdpsp.c
> index 752e0024db03..c64e459afb5c 100644
> --- a/drivers/i2c/busses/i2c-designware-amdpsp.c
> +++ b/drivers/i2c/busses/i2c-designware-amdpsp.c
> @@ -160,9 +160,10 @@ static int psp_send_cmd(struct psp_i2c_req *req)
>  /* Helper to verify status returned by PSP */
>  static int check_i2c_req_sts(struct psp_i2c_req *req)
>  {
> -	int status;
> +	u32 status;
>  
> -	status = readl(&req->hdr.status);
> +	/* Status field in command-response buffer is updated by PSP */
> +	status = READ_ONCE(req->hdr.status);
>  
>  	switch (status) {
>  	case PSP_I2C_REQ_STS_OK:
> -- 
> 2.35.1.265.g69c8d7142f-goog
> 

-- 
With Best Regards,
Andy Shevchenko


