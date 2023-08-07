Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D44167727F6
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Aug 2023 16:37:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232486AbjHGOhe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Aug 2023 10:37:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231945AbjHGOhd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Aug 2023 10:37:33 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FBB210DC;
        Mon,  7 Aug 2023 07:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691419053; x=1722955053;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IQp76Oi9F1FPEe0VQq/loiMqcyX1xlJBgAyOmGBe3Jk=;
  b=dfPHaoQXwRHsut6oOye8L+iwfc8iLVqKT0emmMwg+P1u4/FLqkQCuxOw
   vv2ePk/AaJzRwS4KOHKJu4j13wanXz6pKGwyfmJ6rQ3ahmyDbamEkCFwk
   uPoS4xewk5ZMxKsqsBx21SF76EsLbeMfHrgQXNNeiGQeoF2wnqxqZLfEj
   Wl91beLSX/xfwdhOJDFxZvKWxArKuJ2Haap9BkXKxGFSDlHP1gzTcvxZt
   eJVyHGc3yDNpZPSD+faZfFbOknfZE9+943NVJjjoSloKXMpI7MpwExYYr
   gFFKDgzGcTKnmQw8nCX2MTz217nlsq7LwZHZ1bL+SkZMgMmwXBrg2TsGR
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="350868479"
X-IronPort-AV: E=Sophos;i="6.01,262,1684825200"; 
   d="scan'208";a="350868479"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2023 07:37:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="800956757"
X-IronPort-AV: E=Sophos;i="6.01,262,1684825200"; 
   d="scan'208";a="800956757"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004.fm.intel.com with ESMTP; 07 Aug 2023 07:37:30 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qT1MP-00FdRP-0j;
        Mon, 07 Aug 2023 17:37:29 +0300
Date:   Mon, 7 Aug 2023 17:37:28 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>
Subject: Re: [PATCH v1 9/9] i2c: designware: Fix spelling and other issues in
 the comments
Message-ID: <ZNEBqDamvHMMRqRw@smile.fi.intel.com>
References: <20230725143023.86325-1-andriy.shevchenko@linux.intel.com>
 <20230725143023.86325-10-andriy.shevchenko@linux.intel.com>
 <20230804214157.iaylzqcmpflx6x7j@intel.intel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230804214157.iaylzqcmpflx6x7j@intel.intel>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Aug 04, 2023 at 11:41:57PM +0200, Andi Shyti wrote:

...

> > @@ -210,12 +210,12 @@ static void psp_release_i2c_bus(void)
> >  {
> >  	mutex_lock(&psp_i2c_access_mutex);
> >  
> > -	/* Return early if mailbox was malfunctional */
> > +	/* Return early if mailbox was malfunctioned */
> 
> I think "was malfunctioned" is not really correct... maybe "has
> malfunctioned"? "is malfunctioning"?

I first stumbled over this, but than I read the function name...
I guess they are correct. So I think I need to drop this hunk.

...

> > -		 * transfer supported by the driver (for 400KHz this is
> > +		 * transfer supported by the driver (for 400kHz this is
> 
> what did you change here? :)

Proper units. k is the official SI prefix for KILO.

-- 
With Best Regards,
Andy Shevchenko


