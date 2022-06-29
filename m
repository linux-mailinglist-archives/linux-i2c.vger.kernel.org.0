Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 86F66560600
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Jun 2022 18:40:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229573AbiF2QkM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Jun 2022 12:40:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229479AbiF2QkL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Jun 2022 12:40:11 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 644292C11C;
        Wed, 29 Jun 2022 09:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656520810; x=1688056810;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Z+hcQzKepqpV4YWC94+CLnyEkG6YeuxWItwkjNGgn3g=;
  b=EMRW4yYMOut+YvJiCcEB/BGuUvjzqEzgX9f5bC9NWVMYs6cnTWIe3WsI
   T6YkypOYsWZ/OLVPV8f5g5zspOYHdmoP7AINP4P2SWAuBeX2ygDN3vXoZ
   rUGXuRCQrR6WL24VKXhV+NoEMuybUALfGA9WSeuKPfdK4lUMKvnG5Mjc/
   7uBpK0Suq3innGLuCCU6bTB+dGOTuBMIsRf/cLA2YeNnZXtTV6o+8No4x
   RdLkwQCfTfTGQgNsO7dvOjRqGRW4166hFId7Rb5M1/B9NZgiacPTvslkK
   WyBaqJMNOYz3BNdwJcH1z3//EMNFHQ2qQXwO08sgRMqCYfRqFGAIMvosh
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10393"; a="307579352"
X-IronPort-AV: E=Sophos;i="5.92,231,1650956400"; 
   d="scan'208";a="307579352"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2022 09:40:09 -0700
X-IronPort-AV: E=Sophos;i="5.92,231,1650956400"; 
   d="scan'208";a="617628857"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2022 09:40:02 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1o6ajO-000xuI-Nk;
        Wed, 29 Jun 2022 19:39:58 +0300
Date:   Wed, 29 Jun 2022 19:39:58 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Lee Jones <lee.jones@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>
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
Message-ID: <YryAXlZqcr/liN7n@smile.fi.intel.com>
References: <20220606164138.66535-1-andriy.shevchenko@linux.intel.com>
 <YqBS8I62YBPFC9iS@google.com>
 <CAHp75Ve9Lju8AEQd5huz1aYGg4sOu-ae7tTdyDWCXPCBR=wXbQ@mail.gmail.com>
 <YrGyWCaY+swYAYzH@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YrGyWCaY+swYAYzH@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-7.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

+Cc: Rafael

On Tue, Jun 21, 2022 at 02:58:16PM +0300, Andy Shevchenko wrote:
> On Wed, Jun 08, 2022 at 12:50:44PM +0200, Andy Shevchenko wrote:
> > On Wed, Jun 8, 2022 at 9:42 AM Lee Jones <lee.jones@linaro.org> wrote:
> > > On Mon, 06 Jun 2022, Andy Shevchenko wrote:
> > >
> > > > There are a few users that would like to utilize P2SB mechanism of hiding
> > > > and unhiding a device from the PCI configuration space.
> > > >
> > > > Here is the series to consolidate p2sb handling code for existing users
> > > > and to provide a generic way for new comer(s).
> > > >
> > > > It also includes a patch to enable GPIO controllers on Apollo Lake
> > > > when it's used with ABL bootloader w/o ACPI support.
> > > >
> > > > The patch that brings the helper ("platform/x86/intel: Add Primary to
> > > > Sideband (P2SB) bridge support") has a commit message that sheds a light
> > > > on what the P2SB is and why this is needed.
> > > >
> > > > I have tested this on Apollo Lake platform (I'm able to see SPI NOR and
> > > > since we have an ACPI device for GPIO I do not see any attempts to recreate
> > > > one).
> > > >
> > > > The series is ready to be merged via MFD tree, but see below.
> > > >
> > > > The series also includes updates for Simatic IPC drivers that partially
> > > > tagged by respective maintainers (the main question is if Pavel is okay
> > > > with the last three patches, since I believe Hans is okay with removing
> > > > some code under PDx86). Hence the first 8 patches can be merged right
> > > > away and the rest when Pavel does his review.
> > >
> > > Can we just wait for Pavel's review, then merge them all at once?
> > 
> > Sure, it would be the best course of action.
> 
> Pavel, do you have a chance to review the patches (last three) that touch
> LED drivers? What would be your verdict?

Lee, Rafael,

It seems quite hard to get Pavel's attention to this series [1]. It's already
passed more than 3 weeks for any sign of review of three top patches of the
series that touched LED subsystem. The entire series has all necessary tags,
but for LED changes.

Note, that the top of this series is not done by me and was sent for
preliminary review much earlier [2], altogether it makes months of no response from
the maintainer.

The nature of patches is pretty simple and doesn't touch any of other than Simatic LED
drivers nor LED core. Moreover, it was written by Siemens, who produces the H/W in
question and very well tested as a separate change and as part of the series.

I think to move forward we may ask Rafael to review it on behalf of good maintainer
and with his approval apply entire series.

Thoughts?

[1]: https://lore.kernel.org/all/20220606164138.66535-1-andriy.shevchenko@linux.intel.com/
[2]: https://lore.kernel.org/linux-leds/20220513083652.974-1-henning.schild@siemens.com/

-- 
With Best Regards,
Andy Shevchenko


