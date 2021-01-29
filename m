Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B598308AC1
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Jan 2021 17:59:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229661AbhA2Q6m (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 29 Jan 2021 11:58:42 -0500
Received: from mail-oi1-f170.google.com ([209.85.167.170]:38175 "EHLO
        mail-oi1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230525AbhA2Q6Q (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 29 Jan 2021 11:58:16 -0500
Received: by mail-oi1-f170.google.com with SMTP id h6so10559294oie.5;
        Fri, 29 Jan 2021 08:58:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=py4i/w8jro7Fl8LekRKSdeeXTTY0JD8nUzdfE1Ud7gw=;
        b=W7Z4fjeuMMB2UXe8PGYab9G2Vkr0+wBQj0a+0nsGEYOArYHvDbMx2LTOK6gaEEWMcB
         Y9GwDto3T/xe3YvBNNnrlWBA037MWe8BID1p7ILkTy9JlZt//YZ1JV1oXPysRNdqLe4q
         C69pvmJVZS/vWA9wCeepBO6JSw3HK/OQ8uWXfUJlf7zkwG/ipqdBEEQqPqKj8WVn2/BH
         m65ottOTea+55JL11Lk098VI928sLyLw7m9Fv51x49Lpn/KtCwFVNG65SeP432wRBJC4
         z/0DuTuxRBOLkLXz+29QNpA8ujqg+uA9NgcS9b7AoSd2T4+OZJsaBrdOmHgKSVGudhU3
         xKrA==
X-Gm-Message-State: AOAM532/PWOFhiBte/Bj0oCGmO2X1W0SkTokiUIlBcCOn4f6oyg+td/u
        J3xbvcXA97N0leXBGVgjAn2Sg9KPFxvnn6J98Es=
X-Google-Smtp-Source: ABdhPJx2f+cW84BsIhyHfaV87Rb7P+2padlLT1jzuRtmB5eD/O2c3AiQZ1zHZNTq/nE2F3h8l+GlyOJDsm3fq31tJq8=
X-Received: by 2002:aca:d14:: with SMTP id 20mr3262383oin.157.1611939448031;
 Fri, 29 Jan 2021 08:57:28 -0800 (PST)
MIME-Version: 1.0
References: <20200903081550.6012-1-sakari.ailus@linux.intel.com>
 <20210128232729.16064-1-sakari.ailus@linux.intel.com> <CAJZ5v0hdG1W0D5E6GbrTDiAjMyC0mSgb3Z2WEBy3hhb4iJhDNw@mail.gmail.com>
 <20210129164522.GJ32460@paasikivi.fi.intel.com>
In-Reply-To: <20210129164522.GJ32460@paasikivi.fi.intel.com>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Fri, 29 Jan 2021 17:57:17 +0100
Message-ID: <CAJZ5v0iJB80QX9ze9_hpNP4R-+C36Rvn8d+7S-4-guWrN=SiWQ@mail.gmail.com>
Subject: Re: [PATCH v9 1/7] ACPI: scan: Obtain device's desired enumeration
 power state
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Mani, Rajmohan" <rajmohan.mani@intel.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Hyungwoo Yang <hyungwoo.yang@intel.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Jan 29, 2021 at 5:45 PM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Rafael,
>
> Thanks for the comments.
>
> On Fri, Jan 29, 2021 at 03:07:57PM +0100, Rafael J. Wysocki wrote:
> > On Fri, Jan 29, 2021 at 12:27 AM Sakari Ailus
> > <sakari.ailus@linux.intel.com> wrote:
> > >
> > > Store a device's desired enumeration power state in struct
> > > acpi_device_power_flags during acpi_device object's initialisation.
> > >
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > ---
> > >  drivers/acpi/scan.c     | 6 ++++++
> > >  include/acpi/acpi_bus.h | 3 ++-
> > >  2 files changed, 8 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
> > > index 1d7a02ee45e05..b077c645c9845 100644
> > > --- a/drivers/acpi/scan.c
> > > +++ b/drivers/acpi/scan.c
> > > @@ -987,6 +987,8 @@ static void acpi_bus_init_power_state(struct acpi_device *device, int state)
> > >
> > >  static void acpi_bus_get_power_flags(struct acpi_device *device)
> > >  {
> > > +       unsigned long long pre;
> > > +       acpi_status status;
> > >         u32 i;
> > >
> > >         /* Presence of _PS0|_PR0 indicates 'power manageable' */
> > > @@ -1008,6 +1010,10 @@ static void acpi_bus_get_power_flags(struct acpi_device *device)
> > >         if (acpi_has_method(device->handle, "_DSW"))
> > >                 device->power.flags.dsw_present = 1;
> > >
> > > +       status = acpi_evaluate_integer(device->handle, "_PRE", NULL, &pre);
> > > +       if (ACPI_SUCCESS(status) && !pre)
> > > +               device->power.flags.allow_low_power_probe = 1;
> >
> > While this is what has been discussed and thanks for taking it into
> > account, I'm now thinking that it may be cleaner to introduce a new
> > object to return the deepest power state of the device in which it can
> > be enumerated, say _DSE (Device State for Enumeration) such that 4
> > means D3cold, 3 - D3hot and so on, so the above check can be replaced
> > with something like
> >
> > status = acpi_evaluate_integer(device->handle, "_PRE", NULL, &dse);
>
> s/_PRE/_DSE/
>
> ?

Yes, sorry.

>
> > if (ACPI_FAILURE(status))
>
> ACPI_SUCCESS?

Yup.

> >         device->power.state_for_enumeratin = dse;
> >
> > And then, it is a matter of comparing ->power.state_for_enumeratin
> > with ->power.state and putting the device into D0 if the former is
> > shallower than the latter.
> >
> > What do you think?
>
> Sounds good. How about calling the function e.g.
> acpi_device_resume_for_probe(), so runtime PM could be used to resume the
> device if the function returns true?

I'd rather try to power it up before enabling runtime PM, because in
order to do the latter properly, you need to know if the device is
active or suspended to start with.

So you need something like (pseudo-code)

if (this_device_needs_to_be_on(ACPI_COMPANION(dev))) {
   acpi_device_set_power(ACPI_COMPANION(dev), ACPI_STATE_D0);
   pm_runtime_set_active(dev);
} else {
   pm_runtime_set_suspended(dev);
}

and then you can enable PM-runtime.
