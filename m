Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2E43519FC9
	for <lists+linux-i2c@lfdr.de>; Wed,  4 May 2022 14:42:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349767AbiEDMqT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 4 May 2022 08:46:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349701AbiEDMqS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 4 May 2022 08:46:18 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6EB717E11;
        Wed,  4 May 2022 05:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651668163; x=1683204163;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ITyYbB0V0Xb84R4YEw2hscxYMz0UNXJjyae1C700oaE=;
  b=O7XZp0pslgtvRpBfV5gdhDRi+SYQHlEBvPo7F/4Ao2N9tfn/JhFbY394
   catkVzg6OJc14Rn/eaOPGpHu5qobv6sncHcLnH3VHTOYO/kC2yY+ULSm6
   Az7cxVcII626O4Z33Pgokn4PoENyuqyRcvt8zQe3E83Q04XI0+HQSWLcE
   Vey0gwPeD0fQZHVvgukGujWZs6SAnFBqLrrzJF+heX9MnZHZtSbIlRbrW
   7hwbzkU1amDZU0U+cpOPtGwrix1VpoW6JhnbnRQfLTmgJzwnxTL+raW1C
   foK9qqWy4N+gUs/OJRyAUNVXaLzjpiJy9lJsLP/QYv6Xl0nKT2W5+4mv8
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10336"; a="266597886"
X-IronPort-AV: E=Sophos;i="5.91,198,1647327600"; 
   d="scan'208";a="266597886"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2022 05:42:42 -0700
X-IronPort-AV: E=Sophos;i="5.91,198,1647327600"; 
   d="scan'208";a="631946059"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2022 05:42:37 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nmEKr-00BshX-SU;
        Wed, 04 May 2022 15:42:29 +0300
Date:   Wed, 4 May 2022 15:42:29 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Henning Schild <henning.schild@siemens.com>
Cc:     Wolfram Sang <wsa@kernel.org>, Jean Delvare <jdelvare@suse.de>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
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
        Mark Gross <markgross@kernel.org>
Subject: Re: [PATCH v4 0/8] platform/x86: introduce p2sb_bar() helper
Message-ID: <YnJ0tdGTzTRYEISn@smile.fi.intel.com>
References: <20220131151346.45792-1-andriy.shevchenko@linux.intel.com>
 <20220308205016.2c0112ad@md1za8fc.ad001.siemens.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220308205016.2c0112ad@md1za8fc.ad001.siemens.net>
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

On Tue, Mar 08, 2022 at 08:50:16PM +0100, Henning Schild wrote:
> Am Mon, 31 Jan 2022 17:13:38 +0200
> schrieb Andy Shevchenko <andriy.shevchenko@linux.intel.com>:
> 
> > There are a few users and at least one more is coming (*) that would
> > like to utilize P2SB mechanism of hiding and unhiding a device from
> > the PCI configuration space.
> > 
> > Here is the series to consolidate p2sb handling code for existing
> > users and provide a generic way for new comer(s).
> > 
> > It also includes a patch to enable GPIO controllers on Apollo Lake
> > when it's used with ABL bootloader w/o ACPI support.
> > 
> > The patch that bring the helper ("platform/x86/intel: Add Primary
> > to Sideband (P2SB) bridge support") has a commit message that
> > sheds a light on what the P2SB is and why this is needed.
> > 
> > The changes made in v2 do not change the main idea and the
> > functionality in a big scale. What we need is probably one more
> > (RE-)test done by Henning. I hope to have it merged to v5.18-rc1 that
> > Siemens can develop their changes based on this series.
> 
> I did test this series and it works as expected. Only problem is that
> the leds driver will not work together with the pinctrl. Because two
> "in tree drivers" will try to reserve the same memory region when both
> are enabled. Who wins is a matter of probing order ...

Can we have your formal Tested-by tag?

> If you can take my changes into your series we will not have a problem.

Yes, that's the plan, but your patches needs a bit of work I believe.

> Otherwise we might need to create sort of a conflict which my series
> would revert when switching apl lake to gpio.
> 
> I would not know the process, let us see what the reviews bring and how
> to continue here.

I'm about to comment on the patches.

> Thanks so much for taking care, especially the pinctrl coming up
> without ACPI really improves the simatic leds on the apl lake.

You are welcome!

> In fact i will have to double check if i really need the p2sb for the
> 427E wdt ... but until i have an answer, p2sb works just fine.

Thanks!

> > I have tested this on Apollo Lake platform (I'm able to see SPI NOR
> > and since we have an ACPI device for GPIO I do not see any attempts
> > to recreate one).
> > 
> > *) One in this series, and one is a due after merge in the Simatic
> > IPC drivers
> > 
> > The series may be routed either via MFD (and I guess Lee would prefer
> > that) or via PDx86, whichever seems better for you, folks. As of
> > today patches are ACKed by the respective maintainers, but I2C one
> > and one of the MFD.
> > 
> > Wolfram, can you ACK the patch against i2c-i801 driver, if you have no
> > objections?
> > 
> > Changes in v4:
> > - added tag to the entire series (Hans)
> > - added tag to pin control patch (Mika)
> > - dropped PCI core changes (PCI core doesn't want modifications to be
> > made)
> > - as a consequence of the above merged necessary bits into p2sb.c
> > - added a check that p2sb is really hidden (Hans)
> > - added EDAC patches (reviewed by maintainer internally)
> > 
> > Changes in v3:
> > - resent with cover letter
> > 
> > Changes in v2:
> > - added parentheses around bus in macros (Joe)
> > - added tag (Jean)
> > - fixed indentation and wrapping in the header (Christoph)
> > - moved out of PCI realm to PDx86 as the best common denominator
> > (Bjorn)
> > - added a verbose commit message to explain P2SB thingy (Bjorn)
> > - converted first parameter from pci_dev to pci_bus
> > - made first two parameters (bus and devfn) optional (Henning, Lee)
> > - added Intel pin control patch to the series (Henning, Mika)
> > - fixed English style in the commit message of one of MFD patch (Lee)
> > - added tags to my MFD LPC ICH patches (Lee)
> > - used consistently (c) (Lee)
> > - made indexing for MFD cell and resource arrays (Lee)
> > - fixed the resource size in i801 (Jean)
> > 
> > Andy Shevchenko (6):
> >   pinctrl: intel: Check against matching data instead of ACPI
> > companion mfd: lpc_ich: Factor out lpc_ich_enable_spi_write()
> >   mfd: lpc_ich: Switch to generic p2sb_bar()
> >   i2c: i801: convert to use common P2SB accessor
> >   EDAC, pnd2: Use proper I/O accessors and address space annotation
> >   EDAC, pnd2: convert to use common P2SB accessor
> > 
> > Jonathan Yong (1):
> >   platform/x86/intel: Add Primary to Sideband (P2SB) bridge support
> > 
> > Tan Jui Nee (1):
> >   mfd: lpc_ich: Add support for pinctrl in non-ACPI system
> > 
> >  drivers/edac/Kconfig                   |   1 +
> >  drivers/edac/pnd2_edac.c               |  62 ++---
> >  drivers/i2c/busses/Kconfig             |   1 +
> >  drivers/i2c/busses/i2c-i801.c          |  39 +---
> >  drivers/mfd/Kconfig                    |   1 +
> >  drivers/mfd/lpc_ich.c                  | 136 +++++++++--
> >  drivers/pinctrl/intel/pinctrl-intel.c  |  14 +-
> >  drivers/platform/x86/intel/Kconfig     |  12 +
> >  drivers/platform/x86/intel/Makefile    |   1 +
> >  drivers/platform/x86/intel/p2sb.c      | 305
> > +++++++++++++++++++++++++ include/linux/platform_data/x86/p2sb.h |
> > 27 +++ 11 files changed, 500 insertions(+), 99 deletions(-)
> >  create mode 100644 drivers/platform/x86/intel/p2sb.c
> >  create mode 100644 include/linux/platform_data/x86/p2sb.h
> > 
> 

-- 
With Best Regards,
Andy Shevchenko


