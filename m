Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 966BE651F32
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Dec 2022 11:47:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232288AbiLTKrg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 20 Dec 2022 05:47:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230189AbiLTKre (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 20 Dec 2022 05:47:34 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EC4BBA6;
        Tue, 20 Dec 2022 02:47:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671533254; x=1703069254;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ta1sJj/uDkGNDBiA/7uQgZKkGRhsWyBagI/fpBvf+pM=;
  b=ICWJkgO6sFzwNbyrE58EhZy9kzQdP5McynerpiSl5ieodTRWFoPOE6mz
   f7xcupLMka5Gq4CtrieJ3MYqzGOCdQeUVQOZkEKbP0/urR4ZrfXXiR8rl
   O8Hy6HhVuI+WeBSnDZXAfWIx+VzItiiVImAR6ovFzV5roU+vaPUwkHSB8
   S9HgdD/TnSBZB6jNNWqAdqNlfUn4U66+iRNGSSmkx3NzX6g9iyUqRBTBp
   p1hLuBYO31IrdVJSoenX8KXcs+RBOKbv6IvhBPgBWCIYd0FIQYGz9dRrZ
   bI9YUrsbPV408/wcgeX8FV/h6TyJYj0nUtiEdV24+RVOYkNX7dZ1k9ogF
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10566"; a="299927963"
X-IronPort-AV: E=Sophos;i="5.96,259,1665471600"; 
   d="scan'208";a="299927963"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2022 02:47:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10566"; a="650951239"
X-IronPort-AV: E=Sophos;i="5.96,259,1665471600"; 
   d="scan'208";a="650951239"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002.jf.intel.com with ESMTP; 20 Dec 2022 02:47:21 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1p7a9X-00CpST-2S;
        Tue, 20 Dec 2022 12:47:19 +0200
Date:   Tue, 20 Dec 2022 12:47:19 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Hanna Hawa <hhhawa@amazon.com>
Cc:     wsa@kernel.org, jarkko.nikula@linux.intel.com,
        mika.westerberg@linux.intel.com, jsd@semihalf.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        dwmw@amazon.co.uk, benh@amazon.com, ronenk@amazon.com,
        talel@amazon.com, jonnyc@amazon.com, hanochu@amazon.com,
        farbere@amazon.com, itamark@amazon.com, lareine@amazon.com
Subject: Re: [PATCH v3 1/1] i2c: designware: use casting of u64 in clock
 multiplication to avoid overflow
Message-ID: <Y6GSt8AOS1nsN0dn@smile.fi.intel.com>
References: <20221219171713.10108-1-hhhawa@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221219171713.10108-1-hhhawa@amazon.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Dec 19, 2022 at 05:17:13PM +0000, Hanna Hawa wrote:
> From: Lareine Khawaly <lareine@amazon.com>

Thank you for an update, my comments below.

> In functions i2c_dw_scl_lcnt() and i2c_dw_scl_hcnt() may have overflow
> by depending on the values of the given parameters including the ic_clk.
> For example in our use case where ic_clk is larger than one million,
> multiplication of ic_clk * 4700 will result in 32 bit overflow.
> 
> Add cast of u64 to the calculation to avoid multiplication overflow, and
> use the corresponding define for divide.
> 
> Fixes: 2373f6b9744d ("i2c-designware: split of i2c-designware.c into core and bus specific parts")

It's not clear if the second patch you sent (about unsigned long --> u32) is
required or not, can you clarify this in the changelog?

> Signed-off-by: Lareine Khawaly <lareine@amazon.com>
> Signed-off-by: Hanna Hawa <hhhawa@amazon.com>

This should be last part of the message body. The cutter '---' line makes it
so, currently you finish your message with a changelog and not tags. So, you
need to move the changelog after the cutter line.

> Change Log v2->v3:
> - Avoid changing the ic_clk parameter to u64, and do casting in the
>   calculation itself instead.
> - use DIV_ROUND_CLOSEST_ULL instead of DIV_ROUND_CLOSEST
> 
> Change Log v1->v2:
> - Update commit message and add fix tag.
> ---
>  drivers/i2c/busses/i2c-designware-common.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
> index e0a46dfd1c15..9cc02d0142df 100644
> --- a/drivers/i2c/busses/i2c-designware-common.c
> +++ b/drivers/i2c/busses/i2c-designware-common.c
> @@ -351,7 +351,8 @@ u32 i2c_dw_scl_hcnt(u32 ic_clk, u32 tSYMBOL, u32 tf, int cond, int offset)
>  		 *
>  		 * If your hardware is free from tHD;STA issue, try this one.
>  		 */
> -		return DIV_ROUND_CLOSEST(ic_clk * tSYMBOL, MICRO) - 8 + offset;
> +		return DIV_ROUND_CLOSEST_ULL((u64)ic_clk * tSYMBOL,
> +					     MICRO) - 8 + offset;

There is still a room for 'MICRO) -' part on the previous line.
Ditto for the similar cases.

-- 
With Best Regards,
Andy Shevchenko


