Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EDAE3314B2
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Mar 2021 18:25:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231171AbhCHRY3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Mar 2021 12:24:29 -0500
Received: from mail-oi1-f178.google.com ([209.85.167.178]:44926 "EHLO
        mail-oi1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231220AbhCHRYD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 Mar 2021 12:24:03 -0500
Received: by mail-oi1-f178.google.com with SMTP id w195so5124555oif.11;
        Mon, 08 Mar 2021 09:24:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=46Dl+/n5MDXaPsg8pK7iPxr6SdZP0DYwFyO9StPfVU0=;
        b=BVwUHNbpB1GDF/DPzuq7HfbJGHAhmy5UfUbOmsLkZID6pvX98UnbCr+Km0WlyHEzNM
         njyjuhDUJCMqdmnYUgfhtr454v/c1AY4oVGfBPyNFBtDiYblWqESmGWGCJoTmqwZ9sqB
         +EG85f0m+03vBRHBLJ0ZOrWKhCQdYd94vMdP7hZlvMhQ7zrEgw8i3AYUzgz46pyEFajw
         U76PVM9/x8Xo8/10+gfL0i0+i313LZpxZS9AaUdb7AYfq3jqHch+pOpcqGjUBlIOrN0R
         w59hCiWTeJ7j+Oz3BxxKu3B0a0to8+NvorQKvJwgCsvbSOD6NHCwBqGO0m4ulsROiXJm
         ZE5g==
X-Gm-Message-State: AOAM530CJCcR3vtx1oWe3BIybAEjMqyNNtWgE2r+5X60FfMJmFGDB/si
        5Jz82lLGBEBt8d0Kg7Qe9PGFrzxwerNy+P69m+w=
X-Google-Smtp-Source: ABdhPJwMlR4X/o29NrD2vDK13sLOTLewPoMXmTCDSlyg1tEBBcj52cBVPnmXI+TT1Hb829Z/MVg/FVmPbb5+YFhYMjI=
X-Received: by 2002:aca:3d85:: with SMTP id k127mr18673488oia.157.1615224242728;
 Mon, 08 Mar 2021 09:24:02 -0800 (PST)
MIME-Version: 1.0
References: <20210222130735.1313443-1-djrscally@gmail.com> <20210222130735.1313443-2-djrscally@gmail.com>
 <CAHp75VfPuDjt=ZfHkwErF7_6Ks6wpqXO8mtq-2KjV+mU_PXFtg@mail.gmail.com>
 <615bad5e-6e68-43c9-dd0b-f26d2832d52f@gmail.com> <CAHp75Vc2iwvh1RiYmQDPSvgNvGT_gBcGTK67F+MhWgXyoxqn0A@mail.gmail.com>
 <CAJZ5v0ijOhT3PVm6-gqnqycE-YZhD00dGbtK1UEV5nfrOF5Obw@mail.gmail.com>
 <YEYtME2AxpXBq6iF@smile.fi.intel.com> <CAJZ5v0i+suMNWhUc=v0pnpabS-Ew-CMeSH945JB0YKnQAbi4Wg@mail.gmail.com>
In-Reply-To: <CAJZ5v0i+suMNWhUc=v0pnpabS-Ew-CMeSH945JB0YKnQAbi4Wg@mail.gmail.com>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Mon, 8 Mar 2021 18:23:51 +0100
Message-ID: <CAJZ5v0iyGGLjhYnQxQTokib5Dyiuz_ApvaWb13qz8=U3V44vFg@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] ACPI: scan: Extend acpi_walk_dep_device_list()
To:     Daniel Scally <djrscally@gmail.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Rajmohan Mani <rajmohan.mani@intel.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Len Brown <lenb@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Wolfram Sang <wsa@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Robert Moore <robert.moore@intel.com>,
        Erik Kaneda <erik.kaneda@intel.com>, me@fabwu.ch,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        "open list:ACPI COMPONENT ARCHITECTURE (ACPICA)" <devel@acpica.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Mar 8, 2021 at 4:45 PM Rafael J. Wysocki <rafael@kernel.org> wrote:
>
> On Mon, Mar 8, 2021 at 2:57 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> >
> > On Mon, Mar 08, 2021 at 02:36:27PM +0100, Rafael J. Wysocki wrote:
> > > On Sun, Mar 7, 2021 at 9:39 PM Andy Shevchenko
> > > <andy.shevchenko@gmail.com> wrote:
> > > > On Sun, Mar 7, 2021 at 3:36 PM Daniel Scally <djrscally@gmail.com> wrote:
> > > > > On 22/02/2021 13:34, Andy Shevchenko wrote:
> > > > > > On Mon, Feb 22, 2021 at 3:12 PM Daniel Scally <djrscally@gmail.com> wrote:
> > > > > >> The acpi_walk_dep_device_list() is not as generalisable as its name
> > > > > >> implies, serving only to decrement the dependency count for each
> > > > > >> dependent device of the input. Extend the function to instead accept
> > > > > >> a callback which can be applied to all the dependencies in acpi_dep_list.
> > > > > >> Replace all existing calls to the function with calls to a wrapper, passing
> > > > > >> a callback that applies the same dependency reduction.
> > > > > > The code looks okay to me, if it was the initial idea, feel free to add
> > > > > > Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> >
> > ...
> >
> > > > > >> +void acpi_dev_flag_dependency_met(acpi_handle handle)
> >
> > > > > > Since it's acpi_dev_* namespace, perhaps it should take struct acpi_device here?
> > > > >
> > > > > I can do this, but I avoided it because in most of the uses in the
> > > > > kernel currently there's no struct acpi_device, they're just passing
> > > > > ACPI_HANDLE(dev) instead, so I'd need to get the adev with
> > > > > ACPI_COMPANION() in each place. It didn't seem worth it...
> > >
> > > It may not even be possible sometimes, because that function may be
> > > called before creating all of the struct acpi_device objects (like in
> > > the case of deferred enumeration).
> > >
> > > > > but happy to
> > > > > do it if you'd prefer it that way?
> > > >
> > > > I see, let Rafael decide then. I'm not pushing here.
> > >
> > > Well, it's a matter of correctness.
> >
> > Looking at your above comment it is indeed. Thanks for clarification!
>
> Well, actually, the struct device for the object passed to this
> function should be there already, because otherwise it wouldn't make
> sense to update the list.  So my comment above is not really
> applicable to this particular device and the function could take a
> struct acpi_device pointer argument.  Sorry for the confusion.
>
> > But should we have acpi_dev_*() namespace for this function if it takes handle?
>
> It takes a device object handle.
>
> Anyway, as per the above, it can take a struct acpi_device pointer
> argument in which case the "acpi_dev_" prefix should be fine.
>
> > For time being nothing better than following comes to my mind:
> >
> > __acpi_dev_flag_dependency_met() => __acpi_flag_device_dependency_met()
> > acpi_dev_flag_dependency_met() => acpi_flag_device_dependency_met()
>
> The above said, the name is somewhat confusing overall IMV.
>
> Something like acpi_dev_clear_dependencies() might be better.
>
> So lets make it something like
>
> void acpi_dev_clear_dependencies(struct acpi_device *supplier);

To be precise, there are two functions in the patch,
acpi_dev_flag_dependency_met() which invokes
acpi_walk_dep_device_list() and __acpi_dev_flag_dependency_met()
invoked by the latter as a callback.

Above I was talking about the first one.

The callback should still take a struct acpi_dep_data pointer argument
and I would call it acpi_scan_clear_dep() or similar.
