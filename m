Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A93C690B74
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Feb 2023 15:15:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230108AbjBIOPR convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Thu, 9 Feb 2023 09:15:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229781AbjBIOPQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Feb 2023 09:15:16 -0500
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AC6723877;
        Thu,  9 Feb 2023 06:15:11 -0800 (PST)
Received: by mail-ej1-f48.google.com with SMTP id p26so6661943ejx.13;
        Thu, 09 Feb 2023 06:15:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IUa2bENByFDfZVeOJ9KaNSIGYgOZAahuAApUIydZsoU=;
        b=sMK9n1n5xiRrQ0GpmG8F158mPPOq2qbbVkAZ+GnP9Gr4Ucz7tC8EJS+Ab3qPUcVETk
         x7a0F53rIKGpTumoJ0I5E82YPzMwuAs1S2wUMrMVkOPRy4IqHG4MvWjjLd4sV62rqx6l
         4h4VfQbJYJ/MQHSct8IniHd/d6xcy76ysx9WLOuZW05Jf2XicIz+O2MchBbQo+I11/F9
         fUXi7O9QpnmJz5sWk3EcXzc9Jtm3rKJOKKHaUBFBZ19qmprcUjFuudYva/mBZaTkysIV
         unexV6hIlf85lFJyRM57ZWdxnf+jCuz9wvwDUF+K7NvIEluTn2nBWiVccESMQVCxoGLG
         IK7Q==
X-Gm-Message-State: AO0yUKWd7W90f1XaHpVvemQ5uNlyGGOjZWiUTrmKtTX2QeiNpbhZT/Zg
        7hMZFm8qOqqjPzHZ/FWs0mv30UOfNuIg1A1yNYg=
X-Google-Smtp-Source: AK7set+k1vcGKnsGlNW8IXT/Kn9j/PHNlMs2Hrko2cQ3ZKTnf2qHwdNq8mz4GG4BOp+5D6CcIczpnegVH7CkbrIFKVM=
X-Received: by 2002:a17:906:d9d0:b0:8af:2abd:63ec with SMTP id
 qk16-20020a170906d9d000b008af2abd63ecmr560296ejb.5.1675952109432; Thu, 09 Feb
 2023 06:15:09 -0800 (PST)
MIME-Version: 1.0
References: <20230207072540.27226-1-mika.westerberg@linux.intel.com>
 <CAHQZ30Bzn1Lxy+Y2gCcFTmzWzwnxqUZAHAjSh67Pz=WweaKHkg@mail.gmail.com>
 <Y+NH9pjbFfmijHF+@black.fi.intel.com> <b429918f-fe63-2897-8ade-d17fe2e3646f@linux.intel.com>
 <CAHQZ30C=_aS+FefChYZFAG4vNbFZofh=wpP2mBGbfW1JTD3D_A@mail.gmail.com>
In-Reply-To: <CAHQZ30C=_aS+FefChYZFAG4vNbFZofh=wpP2mBGbfW1JTD3D_A@mail.gmail.com>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Thu, 9 Feb 2023 15:14:55 +0100
Message-ID: <CAJZ5v0j5DC9Kt6BhVaj9di4BmjjTXMkvT_oa7WBMJ5RFsdzGgg@mail.gmail.com>
Subject: Re: [RFC] i2c: core: Do not enable wakeup by default
To:     Raul Rangel <rrangel@chromium.org>
Cc:     =?UTF-8?B?QW1hZGV1c3ogU8WCYXdpxYRza2k=?= 
        <amadeuszx.slawinski@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Cezary Rojewski <cezary.rojewski@intel.com>,
        linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org,
        "Limonciello, Mario" <mario.limonciello@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Feb 8, 2023 at 4:59 PM Raul Rangel <rrangel@chromium.org> wrote:
>
> On Wed, Feb 8, 2023 at 1:28 AM Amadeusz Sławiński
> <amadeuszx.slawinski@linux.intel.com> wrote:
> >
> > On 2/8/2023 7:57 AM, Mika Westerberg wrote:
> > > Hi,
> > >
> > > On Tue, Feb 07, 2023 at 09:33:55AM -0700, Raul Rangel wrote:
> > >> Sorry, resending in plain text mode.
> > >>
> > >> On Tue, Feb 7, 2023 at 12:25 AM Mika Westerberg
> > >> <mika.westerberg@linux.intel.com> wrote:
> > >>>
> > >>> After commit b38f2d5d9615 ("i2c: acpi: Use ACPI wake capability bit to
> > >>> set wake_irq") the I2C core has been setting I2C_CLIENT_WAKE for ACPI
> > >>> devices if they announce to be wake capable in their device description.
> > >>> However, on certain systems where audio codec has been connected through
> > >>> I2C this causes system suspend to wake up immediately because power to
> > >>> the codec is turned off which pulls the interrupt line "low" triggering
> > >>> wake up.
> > >>>
> > >>> Possible reason why the interrupt is marked as wake capable is that some
> > >>> codecs apparently support "Wake on Voice" or similar functionality.
> > >>
> > >> That's generally a bug in the ACPI tables. The wake bit shouldn't be
> > >> set if the power domain for the device is powered off on suspend. The
> > >> best thing is to fix the ACPI tables, but if you can't, then you can
> > >> set the ignore_wake flag for the device:
> > >> https://github.com/torvalds/linux/blob/master/drivers/gpio/gpiolib-acpi.c#L31.
> > >> If that works we can add a quirk for the device:
> > >> https://github.com/torvalds/linux/blob/master/drivers/gpio/gpiolib-acpi.c#L1633.
> >
>
> > I've seen this one already and also tried to use it, but it didn't work.
> > Also when I was reading code I wasn't really convinced that it is linked
> > to i2c in any straightforward way. I mean i2c decides in different
> > places that it has wake support (I even added some prints to make sure
> > ;). The code you pointed out decides in
> > https://github.com/torvalds/linux/blob/master/drivers/gpio/gpiolib-acpi.c#L387
> > but i2c code seems to decide in
> > https://github.com/torvalds/linux/blob/master/drivers/i2c/i2c-core-acpi.c#L176
> > where it just checks if irq flags has wake_capable flag set. When I
> > looked at it previously I was pretty sure it comes straight from BIOS
> > and passes the quirk code you mentioned, still I may have missed something.
>
> You also need the following patch
> https://github.com/torvalds/linux/commit/0e3b175f079247f0d40d2ab695999c309d3a7498,
> otherwise the ignore flag only applies to _AEI GPIOs.
>
> >
> > >
> > > I think (hope) these systems are not yet available for public so there
> > > is a chance that the tables can still be fixed, without need to add any
> > > quirks.
> > >
> > > @Amadeusz, @Cezary, if that's the case I suggest filing a bug against
> > > the BIOS.
> > >
> >
> > Well, I tried custom DSDT and had problems, but I just remembered that I
> > probably need to pass "revision+1" in file, so kernel sees it as a newer
> > version, let me try again. Is it enough to replace "ExclusiveAndWake"
> > with "Exclusive"?
> >
> > >>> In any case, I don't think we should be enabling wakeup by default on
> > >>> all I2C devices that are wake capable. According to device_init_wakeup()
> > >>> documentation most devices should leave it disabled, with exceptions on
> > >>> devices such as keyboards, power buttons etc. Userspace can enable
> > >>> wakeup as needed by writing to device "power/wakeup" attribute.
> > >>
> > >> Enabling wake by default was an unintended side-effect. I didn't catch
> > >> this when I wrote the patch :/ It's been exposing all the incorrect
> > >> ACPI configurations for better or worse. Mario pushed a patch up
> > >> earlier to disable thes Wake GPIOs when using S3:
> > >> https://github.com/torvalds/linux/commit/d63f11c02b8d3e54bdb65d8c309f73b7f474aec4.
> > >> Are you having problems with S3 or S0iX?
> > >
> > > I think this case is S0ix.
> >
> > We test both cases in our setups.
>
> IMO if a device needs to support wake from S3 the ACPI table needs to
> define a _PRW and define the proper power resources to keep the device
> functional during S3.

Yes, it should, but there's more to it than this.

First of all, the interrupt in question needs to be enabled prior to
S3 entry.  That will happen if device_may_wakeup() is true for the
given device AFAICS.

Second, the device should be in a suitable power state which _S3W is
about.  That should also happen via ACPI PM.

Next, _PRW should return the list of power resources that need to be
_ON prior to S3 entry for the device to be able to wake the system.

However, _PRW also provides the information on which sleep states the
system can be woken up from by the given device and S3 need not be one
of them.

The kernel will not prevent S3 from being entered if that is the case,
so it doesn't follow the spec literally in that respect.
