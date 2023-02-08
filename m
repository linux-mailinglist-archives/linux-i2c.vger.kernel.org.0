Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4920A68E892
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Feb 2023 07:57:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229490AbjBHG5Z (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Feb 2023 01:57:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbjBHG5Y (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Feb 2023 01:57:24 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6862442F5;
        Tue,  7 Feb 2023 22:57:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675839443; x=1707375443;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=KU26xadb2s6Iuk8RXQtURwmgb/X3RtBXkptiP/o5Ky8=;
  b=DJW27jJMwr1+5bdFa2KW/PEnw++VbzcXYdTHw08IFBQyibHvKHKC6AAv
   euo5MrHIxY9cMJaHLVgyk6VdBae4xXlmAdBoJoE+f1c7NhEmDP7ZVVwZ8
   EWniEU/GcHjBOtMRrMyZ3HFrkd5eI5cX8S0GuCuVO0IrDyFYNQXQK9sFU
   eW9H256H8YL+V9ruTTXYp8DecvxwxV67EFmiecYtSskoLTrbbtB5Xr48g
   F5H98bfWvPe1zyjvDNCy1HxW3zSMwrVUbpbk39ktufAK75L+pNedWIuo0
   oOa2x+xXvddT+G1GBbSgakcwOc4k/PRJhostpO17wWLw9btjQ5R2DbFYK
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="331858437"
X-IronPort-AV: E=Sophos;i="5.97,280,1669104000"; 
   d="scan'208";a="331858437"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2023 22:57:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="791092709"
X-IronPort-AV: E=Sophos;i="5.97,280,1669104000"; 
   d="scan'208";a="791092709"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 07 Feb 2023 22:57:20 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 0EC2C1A6; Wed,  8 Feb 2023 08:57:58 +0200 (EET)
Date:   Wed, 8 Feb 2023 08:57:58 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Raul Rangel <rrangel@chromium.org>
Cc:     Wolfram Sang <wsa@kernel.org>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= 
        <amadeuszx.slawinski@linux.intel.com>,
        Cezary Rojewski <cezary.rojewski@intel.com>,
        linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org,
        "Limonciello, Mario" <mario.limonciello@amd.com>
Subject: Re: [RFC] i2c: core: Do not enable wakeup by default
Message-ID: <Y+NH9pjbFfmijHF+@black.fi.intel.com>
References: <20230207072540.27226-1-mika.westerberg@linux.intel.com>
 <CAHQZ30Bzn1Lxy+Y2gCcFTmzWzwnxqUZAHAjSh67Pz=WweaKHkg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHQZ30Bzn1Lxy+Y2gCcFTmzWzwnxqUZAHAjSh67Pz=WweaKHkg@mail.gmail.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On Tue, Feb 07, 2023 at 09:33:55AM -0700, Raul Rangel wrote:
> Sorry, resending in plain text mode.
> 
> On Tue, Feb 7, 2023 at 12:25 AM Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
> >
> > After commit b38f2d5d9615 ("i2c: acpi: Use ACPI wake capability bit to
> > set wake_irq") the I2C core has been setting I2C_CLIENT_WAKE for ACPI
> > devices if they announce to be wake capable in their device description.
> > However, on certain systems where audio codec has been connected through
> > I2C this causes system suspend to wake up immediately because power to
> > the codec is turned off which pulls the interrupt line "low" triggering
> > wake up.
> >
> > Possible reason why the interrupt is marked as wake capable is that some
> > codecs apparently support "Wake on Voice" or similar functionality.
> 
> That's generally a bug in the ACPI tables. The wake bit shouldn't be
> set if the power domain for the device is powered off on suspend. The
> best thing is to fix the ACPI tables, but if you can't, then you can
> set the ignore_wake flag for the device:
> https://github.com/torvalds/linux/blob/master/drivers/gpio/gpiolib-acpi.c#L31.
> If that works we can add a quirk for the device:
> https://github.com/torvalds/linux/blob/master/drivers/gpio/gpiolib-acpi.c#L1633.

I think (hope) these systems are not yet available for public so there
is a chance that the tables can still be fixed, without need to add any
quirks.

@Amadeusz, @Cezary, if that's the case I suggest filing a bug against
the BIOS.

> > In any case, I don't think we should be enabling wakeup by default on
> > all I2C devices that are wake capable. According to device_init_wakeup()
> > documentation most devices should leave it disabled, with exceptions on
> > devices such as keyboards, power buttons etc. Userspace can enable
> > wakeup as needed by writing to device "power/wakeup" attribute.
> 
> Enabling wake by default was an unintended side-effect. I didn't catch
> this when I wrote the patch :/ It's been exposing all the incorrect
> ACPI configurations for better or worse. Mario pushed a patch up
> earlier to disable thes Wake GPIOs when using S3:
> https://github.com/torvalds/linux/commit/d63f11c02b8d3e54bdb65d8c309f73b7f474aec4.
> Are you having problems with S3 or S0iX?

I think this case is S0ix.

> > Reported-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
> > Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> > ---
> > Hi,
> >
> > Sending this as RFC because I'm not too familiar with the usage of
> > I2C_CLIENT_WAKE and whether this is something that is expected behaviour
> > in users of I2C devices. On ACPI side I think this is the correct thing
> > to do at least.
> >
> >  drivers/i2c/i2c-core-base.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> > index 087e480b624c..7046549bdae7 100644
> > --- a/drivers/i2c/i2c-core-base.c
> > +++ b/drivers/i2c/i2c-core-base.c
> > @@ -527,7 +527,7 @@ static int i2c_device_probe(struct device *dev)
> >                         goto put_sync_adapter;
> >                 }
> >
> > -               device_init_wakeup(&client->dev, true);
> > +               device_init_wakeup(&client->dev, false);
> 
> This would be a change in behavior for Device Tree. Maybe you can
> declare a `bool enable_wake = true`, then in the ACPI branch
> (https://github.com/torvalds/linux/blob/master/drivers/i2c/i2c-core-base.c#L495)
> set `enable_wake = false`. This would keep wakes enabled by default on
> device tree and disabled for ACPI. This matches the original behavior
> before my patch.

I don't think it's a good idea to make the behaviour different. Drivers
in general do not need to know whether the device was enumerated on ACPI
or DT or whatnot. Same goes for users who should expect similar
behaviour on the same device.

I wonder what is the reason why I2C bus does this for all wake capable
devices in the first place? Typically it should be up to the user to
enable them not the opposite.
