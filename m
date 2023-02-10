Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1435691D12
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Feb 2023 11:43:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232165AbjBJKna (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 10 Feb 2023 05:43:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231732AbjBJKn3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 10 Feb 2023 05:43:29 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 757946ADC6;
        Fri, 10 Feb 2023 02:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676025808; x=1707561808;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4ZpVP0uZpF9n0L+B8eTG5Uh8ltX2SGFA9vlGugK1LX8=;
  b=OYe4fGNZg3XcmByQvMs1QqsOTVrJCqWYsish+F+SZ4zeOk/DkTDbmV36
   7IuquLb9SJ64MfzPGApcd75DQpFB4c/IvnWMpyS4aony3RZeh9ZqSvmhh
   Cgg0wSlVebXDkOFz04c8Tnw/OvQ0lsSsH7NBsrNIjFcL4+UBXURl1hGVI
   Yq9bha6crkcF2d+r6Iz94Nk9UoiZjOhnTSu+GQtt1ziIsEkgvJ8z1k7ye
   SiC9VqvEayCbs+InhvB+Byd/tpRrtu6hpVImX7m4X8m92rF5DCZ/s6TpP
   cDc/3VsiO2oc0YO3DGTWoli6zLiTQy4pt5z/FzDgr8OjLSc2d0cwjN/AV
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="329019191"
X-IronPort-AV: E=Sophos;i="5.97,286,1669104000"; 
   d="scan'208";a="329019191"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2023 02:43:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="617853387"
X-IronPort-AV: E=Sophos;i="5.97,286,1669104000"; 
   d="scan'208";a="617853387"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003.jf.intel.com with ESMTP; 10 Feb 2023 02:43:24 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1pQQsF-0050i0-0D;
        Fri, 10 Feb 2023 12:43:23 +0200
Date:   Fri, 10 Feb 2023 12:43:22 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mario Limonciello <mario.limonciello@amd.com>
Cc:     Jan =?utf-8?B?RMSFYnJvxZs=?= <jsd@semihalf.com>,
        Grzegorz Bernacki <gjb@semihalf.com>,
        Thomas Rijo-john <Rijo-john.Thomas@amd.com>,
        Lendacky Thomas <Thomas.Lendacky@amd.com>,
        herbert@gondor.apana.org.au,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/6] i2c: designware: Use PCI PSP driver for communication
Message-ID: <Y+YfyiERB80bHE1Y@smile.fi.intel.com>
References: <20230209223811.4993-1-mario.limonciello@amd.com>
 <20230209223811.4993-7-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230209223811.4993-7-mario.limonciello@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Feb 09, 2023 at 04:38:08PM -0600, Mario Limonciello wrote:
> Currently the PSP semaphore communication base address is discovered
> by using an MSR that is not architecturally guaranteed for future
> platforms.  Also the mailbox that is utilized for communication with
> the PSP may have other consumers in the kernel, so it's better to
> make all communication go through a single driver.

...

>  #if IS_ENABLED(CONFIG_I2C_DESIGNWARE_AMDPSP)
>  int i2c_dw_amdpsp_probe_lock_support(struct dw_i2c_dev *dev);
> -void i2c_dw_amdpsp_remove_lock_support(struct dw_i2c_dev *dev);
>  #endif

...

>  #ifdef CONFIG_I2C_DESIGNWARE_AMDPSP
>  	{
>  		.probe = i2c_dw_amdpsp_probe_lock_support,
> -		.remove = i2c_dw_amdpsp_remove_lock_support,
>  	},
>  #endif

Personally I found better to have empty stub for the sake of symmetry of API.
But at the end it's not my decision, just felt that I have to express this.

-- 
With Best Regards,
Andy Shevchenko


