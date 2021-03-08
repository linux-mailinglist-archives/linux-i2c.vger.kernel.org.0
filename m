Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 865CA330F7C
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Mar 2021 14:37:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229505AbhCHNhO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Mar 2021 08:37:14 -0500
Received: from mail-ot1-f41.google.com ([209.85.210.41]:38646 "EHLO
        mail-ot1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230075AbhCHNgn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 Mar 2021 08:36:43 -0500
Received: by mail-ot1-f41.google.com with SMTP id a17so9177466oto.5;
        Mon, 08 Mar 2021 05:36:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3SC+dThWdkkdkAOzaSbWtrlTJ9uPyl9VXsnQJro4+zQ=;
        b=Z9POlgOuy793D5BTuqYmhgpFlOHnU98IJxVI8ua8ZoyLjF66pFS4goo6Ue55mTB5ki
         4OZMjUeg1jnvFGMNMyKzu6afF4c1p3Gw+u5Q3MOddDWB9X7JOw2ltKe9PRKwLBL9odiv
         y73xIUt2ZBWk3OuzLxSZ+mn0S/1o+1GQIzN8FHiSb9RifbdWl7VJtn+hL9IhNFlWaC9+
         /5Fqdwh6JNAqWWyI53tfh5tG/rxKYURwCznBfhunDDM4XDDLI/F8JnEwHWo/oMzU8N4X
         pFc3IyTgJHEiFAsOSM934at6bodX0dthqz6kWup1BFfMZD3xBPx0pJVTd57S28HZ1Aqw
         NIRA==
X-Gm-Message-State: AOAM532rgzPr7QDsiIvk69OSdQommAsE42WW48bPTH+QF2aal4aVatqB
        BsWWRX9JBENuoHx7LQhdT7ypultRc6OmgvsQTd4=
X-Google-Smtp-Source: ABdhPJyy6ZpakLDXyR3Oyk57jV9FGupiJLAQnH75QbMy9JuTsZHE14IlWkvw4HT+2ZoGrY9c8JoAUD0rFxSpfGAfb7Q=
X-Received: by 2002:a05:6830:1e03:: with SMTP id s3mr9299001otr.321.1615210602629;
 Mon, 08 Mar 2021 05:36:42 -0800 (PST)
MIME-Version: 1.0
References: <20210222130735.1313443-1-djrscally@gmail.com> <20210222130735.1313443-2-djrscally@gmail.com>
 <CAHp75VfPuDjt=ZfHkwErF7_6Ks6wpqXO8mtq-2KjV+mU_PXFtg@mail.gmail.com>
 <615bad5e-6e68-43c9-dd0b-f26d2832d52f@gmail.com> <CAHp75Vc2iwvh1RiYmQDPSvgNvGT_gBcGTK67F+MhWgXyoxqn0A@mail.gmail.com>
In-Reply-To: <CAHp75Vc2iwvh1RiYmQDPSvgNvGT_gBcGTK67F+MhWgXyoxqn0A@mail.gmail.com>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Mon, 8 Mar 2021 14:36:27 +0100
Message-ID: <CAJZ5v0ijOhT3PVm6-gqnqycE-YZhD00dGbtK1UEV5nfrOF5Obw@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] ACPI: scan: Extend acpi_walk_dep_device_list()
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Daniel Scally <djrscally@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
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
        "open list:ACPI COMPONENT ARCHITECTURE (ACPICA)" <devel@acpica.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, Mar 7, 2021 at 9:39 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Sun, Mar 7, 2021 at 3:36 PM Daniel Scally <djrscally@gmail.com> wrote:
> > On 22/02/2021 13:34, Andy Shevchenko wrote:
> > > On Mon, Feb 22, 2021 at 3:12 PM Daniel Scally <djrscally@gmail.com> wrote:
> > >> The acpi_walk_dep_device_list() is not as generalisable as its name
> > >> implies, serving only to decrement the dependency count for each
> > >> dependent device of the input. Extend the function to instead accept
> > >> a callback which can be applied to all the dependencies in acpi_dep_list.
> > >> Replace all existing calls to the function with calls to a wrapper, passing
> > >> a callback that applies the same dependency reduction.
> > > The code looks okay to me, if it was the initial idea, feel free to add
> > > Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> >
> >
> > Thank you!
> >
> >
> > >> + */
> > >> +void acpi_dev_flag_dependency_met(acpi_handle handle)
> > >> +{
> > > Since it's acpi_dev_* namespace, perhaps it should take struct acpi_device here?
> >
> >
> > I can do this, but I avoided it because in most of the uses in the
> > kernel currently there's no struct acpi_device, they're just passing
> > ACPI_HANDLE(dev) instead, so I'd need to get the adev with
> > ACPI_COMPANION() in each place. It didn't seem worth it...

It may not even be possible sometimes, because that function may be
called before creating all of the struct acpi_device objects (like in
the case of deferred enumeration).

> > but happy to
> > do it if you'd prefer it that way?
>
> I see, let Rafael decide then. I'm not pushing here.

Well, it's a matter of correctness.
