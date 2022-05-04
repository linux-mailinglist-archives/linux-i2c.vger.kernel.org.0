Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23F8551A00C
	for <lists+linux-i2c@lfdr.de>; Wed,  4 May 2022 14:53:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350034AbiEDM4h (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 4 May 2022 08:56:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236375AbiEDM4f (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 4 May 2022 08:56:35 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D9DF2AE12;
        Wed,  4 May 2022 05:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651668779; x=1683204779;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TAR0OSTmgPalp1GT6kqlq85T8vW4wKavBhWP3MJ2K2A=;
  b=dHgtXRnpPjjVlbRuYsjwUesITQQlcyEAnpWwSqK8E3QnR3mvzJAk3x94
   Hu9ol/3/ksX4ORH3dx2tVizgJRR0+gz8k9VyzFP6adFTdT1874uzhCCgL
   53vkHKHmzs182tA6TySkrYpLdZubHRjf2xAKlqVuHhKUfiznQLBI0p3bL
   JDOPsS/V9HQqtff/dd6WG2GAYw7LUiTRlIsMTZkesDf5ELsNhunkvacAQ
   ECQ32eEAIs892VDOTYhsDJ6WQ3GEzNERyp1SuQgTXHuaBZveF0/YDEiil
   IJWEZ0ENBVozZ3mkQphKUS0r8IIOwTRbrwRo64fW2SnagoJs9alYZNg/a
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10336"; a="292946346"
X-IronPort-AV: E=Sophos;i="5.91,198,1647327600"; 
   d="scan'208";a="292946346"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2022 05:52:58 -0700
X-IronPort-AV: E=Sophos;i="5.91,198,1647327600"; 
   d="scan'208";a="734387769"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2022 05:52:52 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nmEUq-00Bssm-FU;
        Wed, 04 May 2022 15:52:48 +0300
Date:   Wed, 4 May 2022 15:52:48 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Wolfram Sang <wsa@kernel.org>, Jean Delvare <jdelvare@suse.de>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tan Jui Nee <jui.nee.tan@intel.com>,
        Kate Hsuan <hpa@redhat.com>,
        Jonathan Yong <jonathan.yong@intel.com>,
        linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Borislav Petkov <bp@alien8.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        James Morse <james.morse@arm.com>,
        Robert Richter <rric@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Peter Tyser <ptyser@xes-inc.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Mark Gross <markgross@kernel.org>,
        Henning Schild <henning.schild@siemens.com>
Subject: Re: [PATCH v4 5/8] mfd: lpc_ich: Add support for pinctrl in non-ACPI
 system
Message-ID: <YnJ3IJoJtqjvFmBB@smile.fi.intel.com>
References: <20220131151346.45792-1-andriy.shevchenko@linux.intel.com>
 <20220131151346.45792-6-andriy.shevchenko@linux.intel.com>
 <YgvaqBB8fNVWp1lN@google.com>
 <YgveyspHVXCp2ul+@smile.fi.intel.com>
 <YgvjDy1R06IC8FE5@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YgvjDy1R06IC8FE5@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Feb 15, 2022 at 05:29:51PM +0000, Lee Jones wrote:
> On Tue, 15 Feb 2022, Andy Shevchenko wrote:
> > On Tue, Feb 15, 2022 at 04:54:00PM +0000, Lee Jones wrote:
> > > On Mon, 31 Jan 2022, Andy Shevchenko wrote:

> > Thank you for the review, my answers below.

...

> > > > +static struct resource apl_gpio_resources[APL_GPIO_NR_DEVICES][2] = {
> > > > +	[APL_GPIO_NORTH] = {
> > > > +		DEFINE_RES_MEM(APL_GPIO_NORTH_OFFSET, 0x1000),
> > > 
> > > Are these 0x1000's being over-written in lpc_ich_init_pinctrl()?
> > > 
> > > If so, why pre-initialise?
> > 
> > You mean to pre-initialize the offsets, but leave the length to be added
> > in the function? It can be done, but it feels inconsistent, since we would
> > have offsets and lengths in different places for the same thingy. That said,
> > I prefer current way for the sake of consistency.
> 
> Don't you over-write this entry entirely?
> 
>   for (i = 0; i < ARRAY_SIZE(apl_gpio_devices); i++) {
>         struct resource *mem = &apl_gpio_resources[i][0];
> 
>         /* Fill MEM resource */
>         mem->start += base.start;
>         mem->end += base.start;
>         mem->flags = base.flags;
>   }
> 
> Oh wait, you're just adding the base value to the offsets.
> 
> In which case that comment is also confusing!

I have realised that in current form it has a bug (*), so I re-do a bit the way
that comment stays and the actual actions will be to *fill* the resource.

*) unbinding and binding back will bring us to the completely wrong resources.

-- 
With Best Regards,
Andy Shevchenko


