Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA72D2CADAC
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Dec 2020 21:48:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727903AbgLAUqf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Dec 2020 15:46:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728793AbgLAUqe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Dec 2020 15:46:34 -0500
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF8EBC061A4E;
        Tue,  1 Dec 2020 12:45:25 -0800 (PST)
Received: by mail-pj1-x1043.google.com with SMTP id p21so1149359pjv.0;
        Tue, 01 Dec 2020 12:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vft8Q6Q9s+nEgkzeUZ7AbqidJOMsxAnfPND7gPdOPjk=;
        b=DgrOKUXCK7p91HhE9p00kKXef+m4A0fwNg1TRBI5JBhJqAACyue0Aj3ue1wp1JLG5E
         BmwKDXIeFX1Ol0goaJUUcAhe/IKccBCE/I8ealSvqlZz4XVijERr75fQbbM8Z5rFkxYI
         qZabxAE9K57EiNNR3osif3f0tNhw7aynMAbcUwEnRBhFUJuvf4PaaiBvG5EjWANvd6WP
         Pn/Yfxs5zoY4KkRiAKopZhG5WP4P7eMUM3MegjSREsba2eEIvlKOVT3jguvdkfBu3p60
         HusYEzwEoFZs0RchG5jGTEw4k8anp97bS9aRquhpOXlcm59lt23hGd/gxtZDkx7E93Pl
         YINw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vft8Q6Q9s+nEgkzeUZ7AbqidJOMsxAnfPND7gPdOPjk=;
        b=aSQgDaeLlRu+nVpk5yU9z4wDWHTgxAnOOHI7FpZ9td99Xr1T+WEH8R3xd6Pr4f3yHj
         aeHrIodULza3ZfSv9FW90Ay5jNuIXjbaAOO7jGXY9GkhuQ04nYza+PDAuRYAL3CggdSy
         /X9Y7A06QVSzYxCJzRr39TfR/Hedxgt12cn6E1yBf/Vtfmz+1LuhnTTLuGnnpzLniSd4
         ykfBuIlOC6r+lSO6Qj+RPkIbfm4uSp2bMf9MswtOy1P9sdNj0WKEL9s2Qx6ZN197Em1k
         d2MoL7bjS4IyoG9UMXjJYuT5aOIai5EQUs4HmPr3k8fLoRMiLcka9hwv9R1tzk4xsrGV
         5bBA==
X-Gm-Message-State: AOAM533GD34MfizMhlL8tRthfWRm7gwhGOqS5F6lMKID0XCFr5MdNnk5
        eGo08h5Nu57N6I3Z5FojB5kVfdVeTfYdjnkcuhA=
X-Google-Smtp-Source: ABdhPJxp4jjL2M9ncR7r6UvA1hOEIHS9ZYzxO9X0q8s7jO9MO7SkN7u3A6KFmucin+odDhpUd05gwsSo8eoFllvjBMA=
X-Received: by 2002:a17:90a:c592:: with SMTP id l18mr4638832pjt.228.1606855525238;
 Tue, 01 Dec 2020 12:45:25 -0800 (PST)
MIME-Version: 1.0
References: <20201130133129.1024662-1-djrscally@gmail.com> <20201130133129.1024662-19-djrscally@gmail.com>
 <20201130200719.GB4077@smile.fi.intel.com> <8a1b0f5b-1289-256b-b25d-cf8af43bdc84@gmail.com>
 <20201201185417.GL4077@smile.fi.intel.com> <20201201185548.GV4569@pendragon.ideasonboard.com>
 <20201201190523.GO4077@smile.fi.intel.com> <20201201190638.GZ4569@pendragon.ideasonboard.com>
 <20201201192137.GR4077@smile.fi.intel.com> <4831d44a-5bcc-8cf3-964c-c7dca6827458@redhat.com>
In-Reply-To: <4831d44a-5bcc-8cf3-964c-c7dca6827458@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 1 Dec 2020 22:46:13 +0200
Message-ID: <CAHp75Vfq1zPxt5RpdD16rKiLOSfda7FwfHsot5JCTd98tXxPdQ@mail.gmail.com>
Subject: Re: [PATCH 18/18] ipu3: Add driver for dummy INT3472 ACPI device
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Dan Scally <djrscally@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        devel@acpica.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Len Brown <lenb@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Wolfram Sang <wsa@kernel.org>, Yong Zhi <yong.zhi@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tian Shu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Robert Moore <robert.moore@intel.com>,
        Erik Kaneda <erik.kaneda@intel.com>,
        Petr Mladek <pmladek@suse.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        kieran.bingham+renesas@ideasonboard.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        laurent.pinchart+renesas@ideasonboard.com,
        jorhand@linux.microsoft.com, Tsuchiya Yuto <kitakar@gmail.com>,
        "Krogerus, Heikki" <heikki.krogerus@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Dec 1, 2020 at 10:39 PM Hans de Goede <hdegoede@redhat.com> wrote:
> On 12/1/20 8:21 PM, Andy Shevchenko wrote:
> > On Tue, Dec 01, 2020 at 09:06:38PM +0200, Laurent Pinchart wrote:
> >> On Tue, Dec 01, 2020 at 09:05:23PM +0200, Andy Shevchenko wrote:
> >>> On Tue, Dec 01, 2020 at 08:55:48PM +0200, Laurent Pinchart wrote:
> >>>> On Tue, Dec 01, 2020 at 08:54:17PM +0200, Andy Shevchenko wrote:
> >>>>> On Tue, Dec 01, 2020 at 08:30:03AM +0000, Dan Scally wrote:
> >>>>>> On 30/11/2020 20:07, Andy Shevchenko wrote:

...

> >>>>>>>> +static struct int3472_sensor_regulator_map int3472_sensor_regulator_maps[] = {
> >>>>>>>> +      { "GNDF140809R", 2, miix_510_ov2680 },
> >>>>>>>> +      { "YHCU", 2, surface_go2_ov5693 },
> >>>>>>>> +      { "MSHW0070", 2, surface_book_ov5693 },
> >>>>>>>> +};
> >>>>>>>
> >>>>>>> Hmm... Usual way is to use DMI for that. I'm not sure above will not give us
> >>>>>>> false positive matches.
> >>>>>>
> >>>>>> I considered DMI too, no problem to switch to that if it's a better choice.
> >>>>>
> >>>>> I prefer DMI as it's a standard way to describe platform quirks in x86 world.
> >>>>
> >>>> Do you think the Windows driver would use DMI ?
> >>>
> >>> Linux is using DMI for quirks.
> >>>
> >>>> That seems quite
> >>>> unlikely to me, given how they would have to release a new driver binary
> >>>> for every machine. I'm pretty sure that a different mechanism is used to
> >>>> identify camera integration, and I think it would make sense to follow
> >>>> the same approach. That would allow us to avoid large tables of DMI
> >>>> identifiers that would need to be constently updated, potentially making
> >>>> user experience better.
> >>>
> >>> All Surface family can be matched in a way as Apple machines [1].
> >>>
> >>> [1]: https://lkml.org/lkml/2020/4/15/1198
> >>
> >> But not all Surface machines necessarily have the same camera
> >> architecture. My point is that there seems to be identifiers reported in
> >> ACPI for the exact purpose of identifying the camera architecture. If we
> >> used DMI instead, we would have to handle each machine individually.
> >
> > With help of DMI we may narrow down the search.
> >
> > But again, we are talking about uncertainity. It may be your way (a lot of
> > platforms that have different settings), or mine (only a few with more or less
> > standard sets of settings).
> >
> > DMI is simply standard in Linux (people usually easier can grep for quirks for
> > a specific platform).
> >
> > I would rather ask Hans' opinion since he has quite an expertise with DMI for
> > good and bad.
>
> So generally there are 2 ways how things like this can go:
>
> 1) There is sufficient information in the ACPI table and we use data from the
> ACPI tables
>
> 2) There is unsufficient info in the ACPI tables (or we don't know how to
> get / interpret the data) and we use DMI quirks
>
> Although we do often also use a combination, getting what we can from ACPI,
> combined with a set of defaults for what we cannot get from ACPI
> based on what reference designs use (IOW what most devices seem to have
> copy and pasted). Combined with DMI quirks for when the defaults do not
> work (which is quite often).
>
> Depending on if "not working because of wrong defaults" has bad side effects,
> another option is also to only allow the driver to load on devices which
> have the necessary info provided through a DMI match.
>
> I hope this helps.

Thanks! Yes, it sounds to me as a useful input!

-- 
With Best Regards,
Andy Shevchenko
