Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C092968EB67
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Feb 2023 10:30:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230180AbjBHJax (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Feb 2023 04:30:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230360AbjBHJag (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Feb 2023 04:30:36 -0500
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DC454708A;
        Wed,  8 Feb 2023 01:29:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675848550; x=1707384550;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=eGv08XQ2pEAy7afPQ6nPqxR+KoFH0W15a828kZ+Zbxs=;
  b=UtabKmguMqE+is5RT9Wu//UJdTgTBD6POvsIiuRhuhUJFwQO/sHSFBNk
   lF0wDHuTPuMonph84qXXXHUXHNRWdUIESpywT0Qtqt6l3pzu0kw9su522
   LVhwHCsa570kKVQQsX2EpgbC5mlOpaFMTOwBw3b9P333t1OEr6nhYFvfC
   6BMjJt+Lsf0bvvaFylWcjcRjAC6MveFv5C36YBKYEMhnyqR7caXifvii+
   yXZVzhv8nZuNO5zB2DMwZ5JcqjlJ7MYrpRQiEPrprxPsXYZR0IfFE9SU/
   TPq61gTStaBi/ioH/KRbCRjSkHNT7zSJ8ViJ6cgFIUlt9tIM5LkzJuRgO
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="394345378"
X-IronPort-AV: E=Sophos;i="5.97,280,1669104000"; 
   d="scan'208";a="394345378"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2023 01:29:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="791136677"
X-IronPort-AV: E=Sophos;i="5.97,280,1669104000"; 
   d="scan'208";a="791136677"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 08 Feb 2023 01:29:04 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id CD1551A6; Wed,  8 Feb 2023 11:29:42 +0200 (EET)
Date:   Wed, 8 Feb 2023 11:29:42 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= 
        <amadeuszx.slawinski@linux.intel.com>
Cc:     Raul Rangel <rrangel@chromium.org>, Wolfram Sang <wsa@kernel.org>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Cezary Rojewski <cezary.rojewski@intel.com>,
        linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org,
        "Limonciello, Mario" <mario.limonciello@amd.com>
Subject: Re: [RFC] i2c: core: Do not enable wakeup by default
Message-ID: <Y+Nrhq9l6CIPjL7Z@black.fi.intel.com>
References: <20230207072540.27226-1-mika.westerberg@linux.intel.com>
 <CAHQZ30Bzn1Lxy+Y2gCcFTmzWzwnxqUZAHAjSh67Pz=WweaKHkg@mail.gmail.com>
 <Y+NH9pjbFfmijHF+@black.fi.intel.com>
 <b429918f-fe63-2897-8ade-d17fe2e3646f@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b429918f-fe63-2897-8ade-d17fe2e3646f@linux.intel.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On Wed, Feb 08, 2023 at 09:28:14AM +0100, Amadeusz Sławiński wrote:
> On 2/8/2023 7:57 AM, Mika Westerberg wrote:
> > Hi,
> > 
> > On Tue, Feb 07, 2023 at 09:33:55AM -0700, Raul Rangel wrote:
> > > Sorry, resending in plain text mode.
> > > 
> > > On Tue, Feb 7, 2023 at 12:25 AM Mika Westerberg
> > > <mika.westerberg@linux.intel.com> wrote:
> > > > 
> > > > After commit b38f2d5d9615 ("i2c: acpi: Use ACPI wake capability bit to
> > > > set wake_irq") the I2C core has been setting I2C_CLIENT_WAKE for ACPI
> > > > devices if they announce to be wake capable in their device description.
> > > > However, on certain systems where audio codec has been connected through
> > > > I2C this causes system suspend to wake up immediately because power to
> > > > the codec is turned off which pulls the interrupt line "low" triggering
> > > > wake up.
> > > > 
> > > > Possible reason why the interrupt is marked as wake capable is that some
> > > > codecs apparently support "Wake on Voice" or similar functionality.
> > > 
> > > That's generally a bug in the ACPI tables. The wake bit shouldn't be
> > > set if the power domain for the device is powered off on suspend. The
> > > best thing is to fix the ACPI tables, but if you can't, then you can
> > > set the ignore_wake flag for the device:
> > > https://github.com/torvalds/linux/blob/master/drivers/gpio/gpiolib-acpi.c#L31.
> > > If that works we can add a quirk for the device:
> > > https://github.com/torvalds/linux/blob/master/drivers/gpio/gpiolib-acpi.c#L1633.
> 
> I've seen this one already and also tried to use it, but it didn't work.
> Also when I was reading code I wasn't really convinced that it is linked to
> i2c in any straightforward way. I mean i2c decides in different places that
> it has wake support (I even added some prints to make sure ;). The code you
> pointed out decides in https://github.com/torvalds/linux/blob/master/drivers/gpio/gpiolib-acpi.c#L387
> but i2c code seems to decide in https://github.com/torvalds/linux/blob/master/drivers/i2c/i2c-core-acpi.c#L176
> where it just checks if irq flags has wake_capable flag set. When I looked
> at it previously I was pretty sure it comes straight from BIOS and passes
> the quirk code you mentioned, still I may have missed something.
> 
> > 
> > I think (hope) these systems are not yet available for public so there
> > is a chance that the tables can still be fixed, without need to add any
> > quirks.
> > 
> > @Amadeusz, @Cezary, if that's the case I suggest filing a bug against
> > the BIOS.
> > 
> 
> Well, I tried custom DSDT and had problems, but I just remembered that I
> probably need to pass "revision+1" in file, so kernel sees it as a newer
> version, let me try again. Is it enough to replace "ExclusiveAndWake" with
> "Exclusive"?

Yes, I think that should be enough.

> 
> > > > In any case, I don't think we should be enabling wakeup by default on
> > > > all I2C devices that are wake capable. According to device_init_wakeup()
> > > > documentation most devices should leave it disabled, with exceptions on
> > > > devices such as keyboards, power buttons etc. Userspace can enable
> > > > wakeup as needed by writing to device "power/wakeup" attribute.
> > > 
> > > Enabling wake by default was an unintended side-effect. I didn't catch
> > > this when I wrote the patch :/ It's been exposing all the incorrect
> > > ACPI configurations for better or worse. Mario pushed a patch up
> > > earlier to disable thes Wake GPIOs when using S3:
> > > https://github.com/torvalds/linux/commit/d63f11c02b8d3e54bdb65d8c309f73b7f474aec4.
> > > Are you having problems with S3 or S0iX?
> > 
> > I think this case is S0ix.
> 
> We test both cases in our setups.

Thanks for the clarification!
