Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8B94574A8C
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Jul 2022 12:23:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231953AbiGNKX1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 14 Jul 2022 06:23:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229923AbiGNKX0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 14 Jul 2022 06:23:26 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30396222B3;
        Thu, 14 Jul 2022 03:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657794205; x=1689330205;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UbzX0APp7Mo6B5jHE+G1Jm7JNvJbZu+NCDrRJ18nxbk=;
  b=A078pS08PsHSUlv4nV1RA/3Meh7UKv8tMDzhnCopKBi1AqqJFv7+jDUi
   CltXs6sXLwxyNsDURN/Y9hkUGPmFrKKbJLA12ALWhH0HjtVhh2ZtoWcXL
   hFGIO2nLZfdtoN4G/WptmUWed2pikR5W7HOBflzghnz5/w3yFvnwAMzmL
   o9jodb4x6g0xD+KMJfllGlS5yJqduK4iD/Xtinax7bCoVB0iXQdkSxhiE
   in2QmOadHvQwT5gqkog9jjLrabH4vUXv1ldJcdYl43a3/gAbL0k7DiZR5
   aE0dTKZtCLQVg3Z5abmPO/b/66uzCfyCIAWHWI9h3uzNVv/yWOrivgCao
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10407"; a="265262673"
X-IronPort-AV: E=Sophos;i="5.92,269,1650956400"; 
   d="scan'208";a="265262673"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2022 03:23:23 -0700
X-IronPort-AV: E=Sophos;i="5.92,269,1650956400"; 
   d="scan'208";a="596044416"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2022 03:23:17 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1oBw01-001D7R-0H;
        Thu, 14 Jul 2022 13:23:13 +0300
Date:   Thu, 14 Jul 2022 13:23:12 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Henning Schild <henning.schild@siemens.com>,
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
Message-ID: <Ys/ukP8dqnwUoou4@smile.fi.intel.com>
References: <20220606164138.66535-1-andriy.shevchenko@linux.intel.com>
 <YqBS8I62YBPFC9iS@google.com>
 <CAHp75Ve9Lju8AEQd5huz1aYGg4sOu-ae7tTdyDWCXPCBR=wXbQ@mail.gmail.com>
 <YrGyWCaY+swYAYzH@smile.fi.intel.com>
 <YryAXlZqcr/liN7n@smile.fi.intel.com>
 <20220629191406.35965d5b@md1za8fc.ad001.siemens.net>
 <Ys71dyMdozGUAto0@smile.fi.intel.com>
 <20220713204827.0b290fd7@md1za8fc.ad001.siemens.net>
 <Ys/jz7HqhrxSCOnV@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ys/jz7HqhrxSCOnV@google.com>
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

On Thu, Jul 14, 2022 at 10:37:19AM +0100, Lee Jones wrote:
> On Wed, 13 Jul 2022, Henning Schild wrote:
> > Am Wed, 13 Jul 2022 19:40:23 +0300
> > schrieb Andy Shevchenko <andriy.shevchenko@linux.intel.com>:

...

> > And maybe there is a way/process to escalate to another maintainer.
> > Does anyone even know what is going on with Pavel? 
> 
> I'll take the hit.  He had his chance.
> 
> I'm happy to move forward with Andy's review.

Thank you, Lee, much appreciated!
The patches (9..12) have my SoB, I think it should be enough, but if you thinks
they need my Rb tag, I can reply to them with it.

> (Side note: Seeing as Pavel hasn't been seen for 2 months, I'll also
>  follow-up on  the LED ML to offer to become temporary maintainer for a
>  bit)

This is good news as well, because I noticed there are a few series there stuck
as well.

-- 
With Best Regards,
Andy Shevchenko


