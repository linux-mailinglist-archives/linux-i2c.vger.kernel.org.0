Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D94935F346
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Apr 2021 14:16:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233852AbhDNMPD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Apr 2021 08:15:03 -0400
Received: from mga02.intel.com ([134.134.136.20]:41034 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232115AbhDNMPC (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 14 Apr 2021 08:15:02 -0400
IronPort-SDR: erWDTNAOGSuKjHTas5TzE1JK+g0W/i9xBXagtgSRRey8yj2Uetf9Cyt4EBlrzRd9LvhcCiR6XI
 maFz7k3TiBhQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9953"; a="181747258"
X-IronPort-AV: E=Sophos;i="5.82,222,1613462400"; 
   d="scan'208";a="181747258"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2021 05:14:40 -0700
IronPort-SDR: wlRRmUGh48IO7CJMUGQEAnyLkoEgVJbk8WL+w4oYcmJdkMj6KUXvAUyBoqFMzRWGqZpbk/I6VU
 +NpR9N+vzcEw==
X-IronPort-AV: E=Sophos;i="5.82,222,1613462400"; 
   d="scan'208";a="399165092"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2021 05:14:38 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lWePj-003zOj-L6; Wed, 14 Apr 2021 15:14:35 +0300
Date:   Wed, 14 Apr 2021 15:14:35 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "wsa@kernel.org" <wsa@kernel.org>
Subject: Re: [PATCH v1 2/4] i2c: mpc: Remove CONFIG_PM_SLEEP ifdeffery
Message-ID: <YHbcq31AVvuFq/9A@smile.fi.intel.com>
References: <20210413143756.60138-1-andriy.shevchenko@linux.intel.com>
 <20210413143756.60138-2-andriy.shevchenko@linux.intel.com>
 <c6bae18f-a83f-675d-78a3-a4441b8c46f3@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c6bae18f-a83f-675d-78a3-a4441b8c46f3@alliedtelesis.co.nz>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Apr 13, 2021 at 11:43:25PM +0000, Chris Packham wrote:
> On 14/04/21 2:37 am, Andy Shevchenko wrote:
> > Use __maybe_unused for the suspend()/resume() hooks and get rid of
> > the CONFIG_PM_SLEEP ifdeffery to improve the code.

> This has a trivial conflict with my series because I'm also touching 
> struct mpc_i2c. git am -3 seems to deal with it but would it be easier 
> if I picked up these 4 changes and included them with my next submission?

It would be ideal to me!

> > -#define MPC_I2C_PM_OPS	(&mpc_i2c_pm_ops)
> > -#else
> > -#define MPC_I2C_PM_OPS	NULL
> > -#endif
> >   
> >   static const struct mpc_i2c_data mpc_i2c_data_512x = {
> >   	.setup = mpc_i2c_setup_512x,
> 
> There's a reference to MPC_I2C_PM_OPS in mpc_i2c_driver which needs 
> changing I think the following is needed

True. sorry that my build test had been broken.
Tell me if you want v2 with this fixed or you may fold that change since the
above agreement.

> diff --git a/drivers/i2c/busses/i2c-mpc.c b/drivers/i2c/busses/i2c-mpc.c
> index 1308f749dc75..7fde13472c09 100644
> --- a/drivers/i2c/busses/i2c-mpc.c
> +++ b/drivers/i2c/busses/i2c-mpc.c
> @@ -862,7 +862,7 @@ static struct platform_driver mpc_i2c_driver = {
>          .driver = {
>                  .name = DRV_NAME,
>                  .of_match_table = mpc_i2c_of_match,
> -               .pm = MPC_I2C_PM_OPS,
> +               .pm = &mpc_i2c_pm_ops,
>          },
>   };
> 
> 

-- 
With Best Regards,
Andy Shevchenko


