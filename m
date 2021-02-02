Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 601AE30CA2E
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Feb 2021 19:43:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233764AbhBBSkq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 2 Feb 2021 13:40:46 -0500
Received: from mail-oi1-f176.google.com ([209.85.167.176]:41151 "EHLO
        mail-oi1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233747AbhBBODd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 2 Feb 2021 09:03:33 -0500
Received: by mail-oi1-f176.google.com with SMTP id m13so22769499oig.8;
        Tue, 02 Feb 2021 06:03:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XDOyyPXnhfDnLT42xUgfRv/pv03j1De9PVl4XkKNTZA=;
        b=OpQ6Mhcxvv+v3UUayQFxm/KdKjtiERcapfcohwYPXvegjVaVWaWon4/oZSJEq4pNoU
         5CC3B9xeqUkTHylxHE+/h5DIaDB85GfLegUH3NFBbZZEnBvzeiIGsdLRWxvw/tPTSz8E
         PIwnu6OtXaCe0HZpid6TYUCxghiMUaNSR+iqSCYs81YSISZsZkfnnd247gXvj1MrtkGE
         CC09EQhyK+3pwje+j62op8ogIfuIr7osnefbuPDK3yfQ8kRbjtk4EAy0Fy7qkT4g7Meq
         td8P0GiyPX8BWMXPbZTE8zcl/vAOhn/1UAApNKiHXEa5jGZdfunJLczZKt+NRhnv1hC/
         xBjQ==
X-Gm-Message-State: AOAM532rqGgzrboTv8adwP4pcRkRkXuwt5GFBiMifKPpN1Zxe8lwZ/v4
        34m0czMB48fIKZ6no++/MJeZtIviK/qUl8n+X1k=
X-Google-Smtp-Source: ABdhPJy0oGC9SrhvIPc6y3juU8i2CP65UYGiYv7W/WBqh/2pB9aSRhWKzEhtJZ6OKnjn/r/lWBX1jT4binoRV/rlprg=
X-Received: by 2002:aca:308a:: with SMTP id w132mr2611030oiw.69.1612274571030;
 Tue, 02 Feb 2021 06:02:51 -0800 (PST)
MIME-Version: 1.0
References: <20210118003428.568892-1-djrscally@gmail.com> <20210118003428.568892-3-djrscally@gmail.com>
 <CAJZ5v0gVQsZ4rxXW8uMidW9zfY_S50zpfrL-Gq0J3Z4-qqBiww@mail.gmail.com>
 <b381b48e-1bf2-f3e7-10a6-e51cd261f43c@gmail.com> <CAJZ5v0iU2m4Hs6APuauQ645DwbjYaB8nJFjYH0+7yQnR-FPZBQ@mail.gmail.com>
 <e2d7e5e9-920f-7227-76a6-b166e30e11e5@gmail.com> <CAJZ5v0gg5oXG3yOO9iDvPKSsadYrFojW6JcKfZcQbFFpO78zAQ@mail.gmail.com>
 <85ccf00d-7c04-b1da-a4bc-82c805df69c9@gmail.com> <CAJZ5v0jO9O1zhBMNRNB5kRt1o86BTjr1kRuFUe=nNVTDwBQhEg@mail.gmail.com>
 <0fac24d2-e8fc-7dc8-0f2f-44c7aadb1daf@gmail.com> <CAJZ5v0jVxMMGh6k-vXeBRsCtD0L14poNUrg4kZOpCfOz2sZGZQ@mail.gmail.com>
 <ee8f6b58-55c8-e0a0-c161-bdef361f9e0a@gmail.com> <d9ec0439-4323-51a2-70e7-c258fe63cd86@gmail.com>
In-Reply-To: <d9ec0439-4323-51a2-70e7-c258fe63cd86@gmail.com>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Tue, 2 Feb 2021 15:02:39 +0100
Message-ID: <CAJZ5v0j7U=e+GHLqpivqfvOKCyCZWm4VK3___4tTfcxD==vcHA@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] acpi: utils: Add function to fetch dependent acpi_devices
To:     Daniel Scally <djrscally@gmail.com>
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        "open list:ACPI COMPONENT ARCHITECTURE (ACPICA)" <devel@acpica.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Len Brown <lenb@kernel.org>, andy@kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Wolfram Sang <wsa@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Robert Moore <robert.moore@intel.com>,
        Erik Kaneda <erik.kaneda@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Feb 2, 2021 at 10:58 AM Daniel Scally <djrscally@gmail.com> wrote:
>
> Hi Rafael
>
> On 21/01/2021 21:06, Daniel Scally wrote:
> >
> > On 21/01/2021 18:08, Rafael J. Wysocki wrote:
> >> On Thu, Jan 21, 2021 at 5:34 PM Daniel Scally <djrscally@gmail.com> wrote:
> >>>
> >>> On 21/01/2021 14:39, Rafael J. Wysocki wrote:
> >>>> On Thu, Jan 21, 2021 at 1:04 PM Daniel Scally <djrscally@gmail.com> wrote:
> >>>>> On 21/01/2021 11:58, Rafael J. Wysocki wrote:
> >>>>>> On Thu, Jan 21, 2021 at 10:47 AM Daniel Scally <djrscally@gmail.com> wrote:
> >>>>>>> Hi Rafael
> >>>>>>>
> >>>>>>> On 19/01/2021 13:15, Rafael J. Wysocki wrote:
> >>>>>>>> On Mon, Jan 18, 2021 at 9:51 PM Daniel Scally <djrscally@gmail.com> wrote:
> >>>>>>>>> On 18/01/2021 16:14, Rafael J. Wysocki wrote:
> >>>>>>>>>> On Mon, Jan 18, 2021 at 1:37 AM Daniel Scally <djrscally@gmail.com> wrote:
> >>>>>>>>>>> In some ACPI tables we encounter, devices use the _DEP method to assert
> >>>>>>>>>>> a dependence on other ACPI devices as opposed to the OpRegions that the
> >>>>>>>>>>> specification intends. We need to be able to find those devices "from"
> >>>>>>>>>>> the dependee, so add a function to parse all ACPI Devices and check if
> >>>>>>>>>>> the include the handle of the dependee device in their _DEP buffer.
> >>>>>>>>>> What exactly do you need this for?
> >>>>>>>>> So, in our DSDT we have devices with _HID INT3472, plus sensors which
> >>>>>>>>> refer to those INT3472's in their _DEP method. The driver binds to the
> >>>>>>>>> INT3472 device, we need to find the sensors dependent on them.
> >>>>>>>>>
> >>>>>>>> Well, this is an interesting concept. :-)
> >>>>>>>>
> >>>>>>>> Why does _DEP need to be used for that?  Isn't there any other way to
> >>>>>>>> look up the dependent sensors?
> >>>>>>>>
> >>>>>>>>>> Would it be practical to look up the suppliers in acpi_dep_list instead?
> >>>>>>>>>>
> >>>>>>>>>> Note that supplier drivers may remove entries from there, but does
> >>>>>>>>>> that matter for your use case?
> >>>>>>>>> Ah - that may work, yes. Thank you, let me test that.
> >>>>>>>> Even if that doesn't work right away, but it can be made work, I would
> >>>>>>>> very much prefer that to the driver parsing _DEP for every device in
> >>>>>>>> the namespace by itself.
> >>>>>>> This does work; do you prefer it in scan.c, or in utils.c (in which case
> >>>>>>> with acpi_dep_list declared as external var in internal.h)?
> >>>>>> Let's put it in scan.c for now, because there is the lock protecting
> >>>>>> the list in there too.
> >>>>>>
> >>>>>> How do you want to implement this?  Something like "walk the list and
> >>>>>> run a callback for the matching entries" or do you have something else
> >>>>>> in mind?
> >>>>> Something like this (though with a mutex_lock()). It could be simplified
> >>>>> by dropping the prev stuff, but we have seen INT3472 devices with
> >>>>> multiple sensors declaring themselves dependent on the same device
> >>>>>
> >>>>>
> >>>>> struct acpi_device *
> >>>>> acpi_dev_get_next_dependent_dev(struct acpi_device *supplier,
> >>>>>                 struct acpi_device *prev)
> >>>>> {
> >>>>>     struct acpi_dep_data *dep;
> >>>>>     struct acpi_device *adev;
> >>>>>     int ret;
> >>>>>
> >>>>>     if (!supplier)
> >>>>>         return ERR_PTR(-EINVAL);
> >>>>>
> >>>>>     if (prev) {
> >>>>>         /*
> >>>>>          * We need to find the previous device in the list, so we know
> >>>>>          * where to start iterating from.
> >>>>>          */
> >>>>>         list_for_each_entry(dep, &acpi_dep_list, node)
> >>>>>             if (dep->consumer == prev->handle &&
> >>>>>                 dep->supplier == supplier->handle)
> >>>>>                 break;
> >>>>>
> >>>>>         dep = list_next_entry(dep, node);
> >>>>>     } else {
> >>>>>         dep = list_first_entry(&acpi_dep_list, struct acpi_dep_data,
> >>>>>                        node);
> >>>>>     }
> >>>>>
> >>>>>
> >>>>>     list_for_each_entry_from(dep, &acpi_dep_list, node) {
> >>>>>         if (dep->supplier == supplier->handle) {
> >>>>>             ret = acpi_bus_get_device(dep->consumer, &adev);
> >>>>>             if (ret)
> >>>>>                 return ERR_PTR(ret);
> >>>>>
> >>>>>             return adev;
> >>>>>         }
> >>>>>     }
> >>>>>
> >>>>>     return NULL;
> >>>>> }
> >>>> That would work I think, but would it be practical to modify
> >>>> acpi_walk_dep_device_list() so that it runs a callback for every
> >>>> consumer found instead of or in addition to the "delete from the list
> >>>> and free the entry" operation?
> >>>
> >>> I think that this would work fine, if that's the way you want to go.
> >>> We'd just need to move everything inside the if (dep->supplier ==
> >>> handle) block to a new callback, and for my purposes I think also add a
> >>> way to stop parsing the list from the callback (so like have the
> >>> callbacks return int and stop parsing on a non-zero return). Do you want
> >>> to expose that ability to pass a callback outside of ACPI?
> >> Yes.
> >>
> >>> Or just export helpers to call each of the callbacks (one to fetch the next
> >>> dependent device, one to decrement the unmet dependencies counter)
> >> If you can run a callback for every matching entry, you don't really
> >> need to have a callback to return the next matching entry.  You can do
> >> stuff for all of them in one go
> >
> > Well it my case it's more to return a pointer to the dep->consumer's
> > acpi_device for a matching entry, so my idea was where there's multiple
> > dependents you could use this as an iterator...but it could just be
> > extended to that if needed later; I don't actually need to do it right now.
> >
> >
> >> note that it probably is not a good
> >> idea to run the callback under the lock, so the for loop currently in
> >> there is not really suitable for that
> >
> > No problem;  I'll tweak that then
>
> Slightly walking back my "No problem" here; as I understand this there's
> kinda two options:
>
> 1. Walk over the (locked) list, when a match is found unlock, run the
> callback and re-lock.

That's what I was thinking about.

> The problem with that idea is unless I'm mistaken there's no guarantee
> that the .next pointer is still valid then (even using the *_safe()
> methods) because either the next or the next + 1 entry could have been
> removed whilst the list was unlocked and the callback was being ran, so
> this seems a little unsafe.

This can be addressed by rotating the list while walking it, but that
becomes problematic if there are concurrent walkers.

OK, I guess running the callback under the lock is not really a big
deal (and for the deletion case this is actually necessary), so let's
do that.
