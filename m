Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3FC1553184
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Jun 2022 13:59:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350323AbiFUL64 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 Jun 2022 07:58:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350349AbiFUL63 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 21 Jun 2022 07:58:29 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFCF92AC69;
        Tue, 21 Jun 2022 04:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655812708; x=1687348708;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fJlvgZDVU/+AbpIeOVnnvWZJsUD7oZ1ag94qSd3Xs98=;
  b=C/zx29/uNzbeu5d194OVBcPzGgzeDLqJBnM+PcMJdGBdVx9RXfRQExn6
   YLKa8td27UEjgnRwoQJpB0x/yDzbydEPNuvI0DBqf88oBqE1MDjhcR2jV
   daDGADbHhR3tSkwOSP0+dI+nqY+0r6DhZub3oNrVGZY0r90+n2sNzcSPs
   UR0y/rqFVhYNylrA2Rv5oNwQPWgX9BkuaEjI/g1KH1zWQTWLFnwZwmyAo
   fRXq3e2SEtwKwfwU6GN5vNudPnsRejw/N62NJZWJ3YNbTdI/tXIKnoQ/N
   2f3Sl7FGEyqqB47kgVV9Uo/m3b9XPNOTG52AzmU8tokgSev2de6hWtx6d
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10384"; a="278869433"
X-IronPort-AV: E=Sophos;i="5.92,209,1650956400"; 
   d="scan'208";a="278869433"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2022 04:58:28 -0700
X-IronPort-AV: E=Sophos;i="5.92,209,1650956400"; 
   d="scan'208";a="538012895"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2022 04:58:21 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1o3cWP-000r07-2e;
        Tue, 21 Jun 2022 14:58:17 +0300
Date:   Tue, 21 Jun 2022 14:58:16 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Tony Luck <tony.luck@intel.com>, Wolfram Sang <wsa@kernel.org>,
        Jean Delvare <jdelvare@suse.de>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Henning Schild <henning.schild@siemens.com>,
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
Message-ID: <YrGyWCaY+swYAYzH@smile.fi.intel.com>
References: <20220606164138.66535-1-andriy.shevchenko@linux.intel.com>
 <YqBS8I62YBPFC9iS@google.com>
 <CAHp75Ve9Lju8AEQd5huz1aYGg4sOu-ae7tTdyDWCXPCBR=wXbQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75Ve9Lju8AEQd5huz1aYGg4sOu-ae7tTdyDWCXPCBR=wXbQ@mail.gmail.com>
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

On Wed, Jun 08, 2022 at 12:50:44PM +0200, Andy Shevchenko wrote:
> On Wed, Jun 8, 2022 at 9:42 AM Lee Jones <lee.jones@linaro.org> wrote:
> >
> > On Mon, 06 Jun 2022, Andy Shevchenko wrote:
> >
> > > There are a few users that would like to utilize P2SB mechanism of hiding
> > > and unhiding a device from the PCI configuration space.
> > >
> > > Here is the series to consolidate p2sb handling code for existing users
> > > and to provide a generic way for new comer(s).
> > >
> > > It also includes a patch to enable GPIO controllers on Apollo Lake
> > > when it's used with ABL bootloader w/o ACPI support.
> > >
> > > The patch that brings the helper ("platform/x86/intel: Add Primary to
> > > Sideband (P2SB) bridge support") has a commit message that sheds a light
> > > on what the P2SB is and why this is needed.
> > >
> > > I have tested this on Apollo Lake platform (I'm able to see SPI NOR and
> > > since we have an ACPI device for GPIO I do not see any attempts to recreate
> > > one).
> > >
> > > The series is ready to be merged via MFD tree, but see below.
> > >
> > > The series also includes updates for Simatic IPC drivers that partially
> > > tagged by respective maintainers (the main question is if Pavel is okay
> > > with the last three patches, since I believe Hans is okay with removing
> > > some code under PDx86). Hence the first 8 patches can be merged right
> > > away and the rest when Pavel does his review.
> >
> > Can we just wait for Pavel's review, then merge them all at once?
> 
> Sure, it would be the best course of action.

Pavel, do you have a chance to review the patches (last three) that touch
LED drivers? What would be your verdict?

-- 
With Best Regards,
Andy Shevchenko


