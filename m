Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F6BA2FF2EC
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Jan 2021 19:10:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389368AbhAUSJh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 21 Jan 2021 13:09:37 -0500
Received: from mail-oi1-f169.google.com ([209.85.167.169]:34839 "EHLO
        mail-oi1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389720AbhAUSJd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 21 Jan 2021 13:09:33 -0500
Received: by mail-oi1-f169.google.com with SMTP id w8so3135895oie.2;
        Thu, 21 Jan 2021 10:09:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rZuG0eDaYJNboNh8e3LplxwDe2N2H+yB/LmrSLFUl6M=;
        b=mpkd3gCV1ZB6Juf+EQnHYyaq+CeUe3ecQxGnUd7uu/l9DT1GyHAiYpRPiCTckxdwcu
         V3xwqZSMqz3SwpPlslSYftoRE8zgYGXGIqgbhtBymwtR/Qdn4elnQiJCGdfo/T813M83
         J/MhKLhpC/q+UEDX69wVRJiVlTIv9hvf1q4QVqvWlREkpH23j0nyzcy+Z+44gUdslrWl
         3QH+ltYD/mDAqm2VcdfaPv4fDRGoiyrPx2w55sysQEICePLlNj/eXJhenl8Q7aNbXaZw
         nzjIKsutWYadXq0/4Td18vt+mmSi2cakIwlMWAeOuaS0uc+QlhDxeQgRz9wH42+1woke
         Snog==
X-Gm-Message-State: AOAM530kLzE1PB5BRbLrkjTQus1vv5zd702sh82DuavPC1AjLIu0oIXy
        s22k5WItbF+VkjmilXT6kTT+uNZzlTKiricwjCM=
X-Google-Smtp-Source: ABdhPJzonsjyrNxpDyasZkL5KpTZWxHq4Ux3HEM1YkApyJQtDjSw14vrAyNsETjZ7up7pvN+p39lnrgFySegxATtRNE=
X-Received: by 2002:aca:308a:: with SMTP id w132mr552636oiw.69.1611252522742;
 Thu, 21 Jan 2021 10:08:42 -0800 (PST)
MIME-Version: 1.0
References: <20210118003428.568892-1-djrscally@gmail.com> <20210118003428.568892-3-djrscally@gmail.com>
 <CAJZ5v0gVQsZ4rxXW8uMidW9zfY_S50zpfrL-Gq0J3Z4-qqBiww@mail.gmail.com>
 <b381b48e-1bf2-f3e7-10a6-e51cd261f43c@gmail.com> <CAJZ5v0iU2m4Hs6APuauQ645DwbjYaB8nJFjYH0+7yQnR-FPZBQ@mail.gmail.com>
 <e2d7e5e9-920f-7227-76a6-b166e30e11e5@gmail.com> <CAJZ5v0gg5oXG3yOO9iDvPKSsadYrFojW6JcKfZcQbFFpO78zAQ@mail.gmail.com>
 <85ccf00d-7c04-b1da-a4bc-82c805df69c9@gmail.com> <CAJZ5v0jO9O1zhBMNRNB5kRt1o86BTjr1kRuFUe=nNVTDwBQhEg@mail.gmail.com>
 <0fac24d2-e8fc-7dc8-0f2f-44c7aadb1daf@gmail.com>
In-Reply-To: <0fac24d2-e8fc-7dc8-0f2f-44c7aadb1daf@gmail.com>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Thu, 21 Jan 2021 19:08:31 +0100
Message-ID: <CAJZ5v0jVxMMGh6k-vXeBRsCtD0L14poNUrg4kZOpCfOz2sZGZQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] acpi: utils: Add function to fetch dependent acpi_devices
To:     Daniel Scally <djrscally@gmail.com>
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        linux-gpio@vger.kernel.org, linux-i2c <linux-i2c@vger.kernel.org>,
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

On Thu, Jan 21, 2021 at 5:34 PM Daniel Scally <djrscally@gmail.com> wrote:
>
>
> On 21/01/2021 14:39, Rafael J. Wysocki wrote:
> > On Thu, Jan 21, 2021 at 1:04 PM Daniel Scally <djrscally@gmail.com> wrote:
> >>
> >> On 21/01/2021 11:58, Rafael J. Wysocki wrote:
> >>> On Thu, Jan 21, 2021 at 10:47 AM Daniel Scally <djrscally@gmail.com> wrote:
> >>>> Hi Rafael
> >>>>
> >>>> On 19/01/2021 13:15, Rafael J. Wysocki wrote:
> >>>>> On Mon, Jan 18, 2021 at 9:51 PM Daniel Scally <djrscally@gmail.com> wrote:
> >>>>>> On 18/01/2021 16:14, Rafael J. Wysocki wrote:
> >>>>>>> On Mon, Jan 18, 2021 at 1:37 AM Daniel Scally <djrscally@gmail.com> wrote:
> >>>>>>>> In some ACPI tables we encounter, devices use the _DEP method to assert
> >>>>>>>> a dependence on other ACPI devices as opposed to the OpRegions that the
> >>>>>>>> specification intends. We need to be able to find those devices "from"
> >>>>>>>> the dependee, so add a function to parse all ACPI Devices and check if
> >>>>>>>> the include the handle of the dependee device in their _DEP buffer.
> >>>>>>> What exactly do you need this for?
> >>>>>> So, in our DSDT we have devices with _HID INT3472, plus sensors which
> >>>>>> refer to those INT3472's in their _DEP method. The driver binds to the
> >>>>>> INT3472 device, we need to find the sensors dependent on them.
> >>>>>>
> >>>>> Well, this is an interesting concept. :-)
> >>>>>
> >>>>> Why does _DEP need to be used for that?  Isn't there any other way to
> >>>>> look up the dependent sensors?
> >>>>>
> >>>>>>> Would it be practical to look up the suppliers in acpi_dep_list instead?
> >>>>>>>
> >>>>>>> Note that supplier drivers may remove entries from there, but does
> >>>>>>> that matter for your use case?
> >>>>>> Ah - that may work, yes. Thank you, let me test that.
> >>>>> Even if that doesn't work right away, but it can be made work, I would
> >>>>> very much prefer that to the driver parsing _DEP for every device in
> >>>>> the namespace by itself.
> >>>> This does work; do you prefer it in scan.c, or in utils.c (in which case
> >>>> with acpi_dep_list declared as external var in internal.h)?
> >>> Let's put it in scan.c for now, because there is the lock protecting
> >>> the list in there too.
> >>>
> >>> How do you want to implement this?  Something like "walk the list and
> >>> run a callback for the matching entries" or do you have something else
> >>> in mind?
> >>
> >> Something like this (though with a mutex_lock()). It could be simplified
> >> by dropping the prev stuff, but we have seen INT3472 devices with
> >> multiple sensors declaring themselves dependent on the same device
> >>
> >>
> >> struct acpi_device *
> >> acpi_dev_get_next_dependent_dev(struct acpi_device *supplier,
> >>                 struct acpi_device *prev)
> >> {
> >>     struct acpi_dep_data *dep;
> >>     struct acpi_device *adev;
> >>     int ret;
> >>
> >>     if (!supplier)
> >>         return ERR_PTR(-EINVAL);
> >>
> >>     if (prev) {
> >>         /*
> >>          * We need to find the previous device in the list, so we know
> >>          * where to start iterating from.
> >>          */
> >>         list_for_each_entry(dep, &acpi_dep_list, node)
> >>             if (dep->consumer == prev->handle &&
> >>                 dep->supplier == supplier->handle)
> >>                 break;
> >>
> >>         dep = list_next_entry(dep, node);
> >>     } else {
> >>         dep = list_first_entry(&acpi_dep_list, struct acpi_dep_data,
> >>                        node);
> >>     }
> >>
> >>
> >>     list_for_each_entry_from(dep, &acpi_dep_list, node) {
> >>         if (dep->supplier == supplier->handle) {
> >>             ret = acpi_bus_get_device(dep->consumer, &adev);
> >>             if (ret)
> >>                 return ERR_PTR(ret);
> >>
> >>             return adev;
> >>         }
> >>     }
> >>
> >>     return NULL;
> >> }
> > That would work I think, but would it be practical to modify
> > acpi_walk_dep_device_list() so that it runs a callback for every
> > consumer found instead of or in addition to the "delete from the list
> > and free the entry" operation?
>
>
> I think that this would work fine, if that's the way you want to go.
> We'd just need to move everything inside the if (dep->supplier ==
> handle) block to a new callback, and for my purposes I think also add a
> way to stop parsing the list from the callback (so like have the
> callbacks return int and stop parsing on a non-zero return). Do you want
> to expose that ability to pass a callback outside of ACPI?

Yes.

> Or just export helpers to call each of the callbacks (one to fetch the next
> dependent device, one to decrement the unmet dependencies counter)

If you can run a callback for every matching entry, you don't really
need to have a callback to return the next matching entry.  You can do
stuff for all of them in one go (note that it probably is not a good
idea to run the callback under the lock, so the for loop currently in
there is not really suitable for that).

> Otherwise, I'd just need to update the 5 users of that function either
> to use the new helper or else to also pass the decrement dependencies
> callback.

Or have a wrapper around it passing the decrement dependencies
callback for the "typical" users.
