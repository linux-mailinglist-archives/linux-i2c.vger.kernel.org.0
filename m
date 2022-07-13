Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF93D573B63
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Jul 2022 18:40:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237060AbiGMQkk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 13 Jul 2022 12:40:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229913AbiGMQkj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 13 Jul 2022 12:40:39 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60DB82E6B7;
        Wed, 13 Jul 2022 09:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657730435; x=1689266435;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fnQOCgmmuU1mQ1zCnnmtaPsBptE0xg9rGXhM5D+1Tlk=;
  b=hWU4FroW9OMoBpYUTMolV51NOTFZscGW/KnSVAVP/TbOmUICHknoe1Nr
   UCb+ZaOPwJqHDEL+uOHM5CED5pHsJn4HhPLhZhqQ1Wa+1ubLjjgMVU0+i
   1sTK+ypcxUsKhTNoHnvK0S5t25KpyoW7m+N9Jru7ABKRBoRqg/T39Nsnu
   JlIBmj9ILsF8YAXUIIM1YzFIvhgD7e5cPyZ3r+9gNHA/AYur1WfpPOoJp
   fzAIQpUuenkNitYEeLzo9Q1OKPNPvgnm8P5oEV1pWSHyEolQ8IyomQB44
   vyS1DtlLo9LctL82Xl79KJu5XD53Wz3uXEqtakrxJnM2oM9fhQWOGxTGB
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10407"; a="265066890"
X-IronPort-AV: E=Sophos;i="5.92,267,1650956400"; 
   d="scan'208";a="265066890"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2022 09:40:34 -0700
X-IronPort-AV: E=Sophos;i="5.92,267,1650956400"; 
   d="scan'208";a="722416355"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2022 09:40:27 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1oBfPT-001CUH-2s;
        Wed, 13 Jul 2022 19:40:23 +0300
Date:   Wed, 13 Jul 2022 19:40:23 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Henning Schild <henning.schild@siemens.com>
Cc:     Lee Jones <lee.jones@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Tony Luck <tony.luck@intel.com>, Wolfram Sang <wsa@kernel.org>,
        Jean Delvare <jdelvare@suse.de>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Yong <jonathan.yong@intel.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-edac@vger.kernel.org, linux-i2c <linux-i2c@vger.kernel.org>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        LINUXWATCHDOG <linux-watchdog@vger.kernel.org>,
        Borislav Petkov <bp@alien8.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        James Morse <james.morse@arm.com>,
        Robert Richter <rric@kernel.org>,
        Jean Delvare <jdelvare@suse.com>, Pavel Machek <pavel@ucw.cz>,
        Peter Tyser <ptyser@xes-inc.com>,
        Andy Shevchenko <andy@kernel.org>,
        Mark Gross <markgross@kernel.org>
Subject: Re: [PATCH v6 00/12] platform/x86: introduce p2sb_bar() helper
Message-ID: <Ys71dyMdozGUAto0@smile.fi.intel.com>
References: <20220606164138.66535-1-andriy.shevchenko@linux.intel.com>
 <YqBS8I62YBPFC9iS@google.com>
 <CAHp75Ve9Lju8AEQd5huz1aYGg4sOu-ae7tTdyDWCXPCBR=wXbQ@mail.gmail.com>
 <YrGyWCaY+swYAYzH@smile.fi.intel.com>
 <YryAXlZqcr/liN7n@smile.fi.intel.com>
 <20220629191406.35965d5b@md1za8fc.ad001.siemens.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220629191406.35965d5b@md1za8fc.ad001.siemens.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jun 29, 2022 at 07:14:06PM +0200, Henning Schild wrote:
> Am Wed, 29 Jun 2022 19:39:58 +0300
> schrieb Andy Shevchenko <andriy.shevchenko@linux.intel.com>:
> 
> > +Cc: Rafael
> > 
> > On Tue, Jun 21, 2022 at 02:58:16PM +0300, Andy Shevchenko wrote:
> > > On Wed, Jun 08, 2022 at 12:50:44PM +0200, Andy Shevchenko wrote:  
> > > > On Wed, Jun 8, 2022 at 9:42 AM Lee Jones <lee.jones@linaro.org>
> > > > wrote:  
> > > > > On Mon, 06 Jun 2022, Andy Shevchenko wrote:
> > > > >  
> > > > > > There are a few users that would like to utilize P2SB
> > > > > > mechanism of hiding and unhiding a device from the PCI
> > > > > > configuration space.
> > > > > >
> > > > > > Here is the series to consolidate p2sb handling code for
> > > > > > existing users and to provide a generic way for new comer(s).
> > > > > >
> > > > > > It also includes a patch to enable GPIO controllers on Apollo
> > > > > > Lake when it's used with ABL bootloader w/o ACPI support.
> > > > > >
> > > > > > The patch that brings the helper ("platform/x86/intel: Add
> > > > > > Primary to Sideband (P2SB) bridge support") has a commit
> > > > > > message that sheds a light on what the P2SB is and why this
> > > > > > is needed.
> > > > > >
> > > > > > I have tested this on Apollo Lake platform (I'm able to see
> > > > > > SPI NOR and since we have an ACPI device for GPIO I do not
> > > > > > see any attempts to recreate one).
> > > > > >
> > > > > > The series is ready to be merged via MFD tree, but see below.
> > > > > >
> > > > > > The series also includes updates for Simatic IPC drivers that
> > > > > > partially tagged by respective maintainers (the main question
> > > > > > is if Pavel is okay with the last three patches, since I
> > > > > > believe Hans is okay with removing some code under PDx86).
> > > > > > Hence the first 8 patches can be merged right away and the
> > > > > > rest when Pavel does his review.  
> > > > >
> > > > > Can we just wait for Pavel's review, then merge them all at
> > > > > once?  
> > > > 
> > > > Sure, it would be the best course of action.  
> > > 
> > > Pavel, do you have a chance to review the patches (last three) that
> > > touch LED drivers? What would be your verdict?  
> > 
> > Lee, Rafael,
> > 
> > It seems quite hard to get Pavel's attention to this series [1]. It's
> > already passed more than 3 weeks for any sign of review of three top
> > patches of the series that touched LED subsystem. The entire series
> > has all necessary tags, but for LED changes.
> > 
> > Note, that the top of this series is not done by me and was sent for
> > preliminary review much earlier [2], altogether it makes months of no
> > response from the maintainer.
> > 
> > The nature of patches is pretty simple and doesn't touch any of other
> > than Simatic LED drivers nor LED core. Moreover, it was written by
> > Siemens, who produces the H/W in question and very well tested as a
> > separate change and as part of the series.
> 
> The code has been reviewed and is in fact pretty simple. The only
> questionable but pragmatic change that might catch the attention of a
> pedantic reviewer is that i did put the gpio implementation of the
> driver under the same/existing kernel config switch.
> 
> > I think to move forward we may ask Rafael to review it on behalf of
> > good maintainer and with his approval apply entire series.
> > 
> > Thoughts?
> 
> Thanks for pushing this Andy. I was wondering how and when that story
> would continue. Technically these changes should really go in one badge
> or we need to find a way to separate them somehow. I would try to go
> that extra mile to get out of your way. But i am kind of afraid such an
> effort might also end up touching the same files and block us at the
> same maintainer.
> 
> Did anyone check whether Pavel was active at all in those last months
> and maybe other patches waiting for review? Hope he is fine and active
> and just somehow forgot/overlooked/ignored this one.

I have send a private mail to Pavel and have got no response.
Can we move this forward, let's say, by applying first 8 patches?

> > [1]:
> > https://lore.kernel.org/all/20220606164138.66535-1-andriy.shevchenko@linux.intel.com/
> > [2]:
> > https://lore.kernel.org/linux-leds/20220513083652.974-1-henning.schild@siemens.com/
> 

-- 
With Best Regards,
Andy Shevchenko


