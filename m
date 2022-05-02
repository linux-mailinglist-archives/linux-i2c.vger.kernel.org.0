Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 238395173FD
	for <lists+linux-i2c@lfdr.de>; Mon,  2 May 2022 18:15:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1386186AbiEBQSD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 2 May 2022 12:18:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357459AbiEBQSC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 2 May 2022 12:18:02 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC241DFE4;
        Mon,  2 May 2022 09:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651508073; x=1683044073;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=J/zBHDxhx9Erqph7DBTL1Nk5osAbgd2b/7QSvJaYzxE=;
  b=F0a77bk2Kbi/bbTcCkXDLX/Egw7XW8812Vs0SbM1wdt6fwkXFlEB3c4W
   UU5LLxQL1ycnWZCdst4+CHWLO6OIalIz675WKPbydTEGiJMOhbeKVS0RD
   651vsyst9fmmCZFolb+5KaYWRkzc9cz3wo9sSzClkreUgFa5eZtA7z7hx
   9LYuvKNZPIojRetHJRqL4dGvG9LSFUwD+wpFuUxV4IOwOoA8egX1byzm5
   Wxeu4SfZ8YO6h38JwEzfsqj6ABO1+VzGyVfk8dHtdlr/FVDiw2WqdQkY2
   YJCrz5v6W1mjt/FSMjdqW/EBN/TmPkTnvgkGM/vOo8fhaGzZB26u3G4VY
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="247801312"
X-IronPort-AV: E=Sophos;i="5.91,192,1647327600"; 
   d="scan'208";a="247801312"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2022 09:14:33 -0700
X-IronPort-AV: E=Sophos;i="5.91,192,1647327600"; 
   d="scan'208";a="619957666"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2022 09:14:27 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nlYgq-00B6dj-2Z;
        Mon, 02 May 2022 19:14:24 +0300
Date:   Mon, 2 May 2022 19:14:23 +0300
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
Message-ID: <YnADXy3A+kIsL+f9@smile.fi.intel.com>
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
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Feb 15, 2022 at 05:29:51PM +0000, Lee Jones wrote:
> On Tue, 15 Feb 2022, Andy Shevchenko wrote:
> > On Tue, Feb 15, 2022 at 04:54:00PM +0000, Lee Jones wrote:
> > > On Mon, 31 Jan 2022, Andy Shevchenko wrote:

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

Right.

> In which case that comment is also confusing!

I will fix a comment in the next version.


-- 
With Best Regards,
Andy Shevchenko


