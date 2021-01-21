Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 011EB2FED22
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Jan 2021 15:42:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731824AbhAUOlR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 21 Jan 2021 09:41:17 -0500
Received: from mail-ot1-f53.google.com ([209.85.210.53]:45994 "EHLO
        mail-ot1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731621AbhAUOk5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 21 Jan 2021 09:40:57 -0500
Received: by mail-ot1-f53.google.com with SMTP id n42so1754160ota.12;
        Thu, 21 Jan 2021 06:40:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=e2wC/gqTSVsEHUIwD9i+N/18O78gZ5uCZkeTAoDdvWM=;
        b=N/Dm8JP1SX8I81Iak5zh5Lc1eM6okSBElw7EryE1P35cBxz2Z7gktT6Rfu/D8CwG5a
         7+pzRGeQtoUELB7LOHVRQLONWOAI2H4A5FL+k3tglrNexAuxL4Qhbrb6zKAXPRb0tMLe
         9+m2DYlpHwwtDkiFsu6gJVXSFaLopRHi9hmU0IWUOA8hL7onSWrDOD7Vba2Wv0UuizlM
         a7KhgAWIo4eIUsb1k3E49stKjzCfnEPzUMlfrD4jfUCSQbPPvW/JbjikFRW2X5uDPjjh
         kgOLcoSN3Wk9aMD+ZdTsa84SjFe/r7pKAoNRsyZHk44/XzRI8eHzTl45sDlCDN8RXntq
         smZg==
X-Gm-Message-State: AOAM531+sL7HuYayhPMFJQtH+pHe21FVVco7Yt5j2EltybfUH5t332B6
        6QrAMxW5VIuIC5KJx5w8hzJ/nj8KYuyM1gopmRA=
X-Google-Smtp-Source: ABdhPJxygx7O8j/Cs5KFm/tGd04SykZqet5/kp/3jkr6W6fOeKCg3atmGLgcAGJqtDf4Cqjy9l1O2Q+aMR5sGiyOhng=
X-Received: by 2002:a9d:1710:: with SMTP id i16mr10445162ota.260.1611240007526;
 Thu, 21 Jan 2021 06:40:07 -0800 (PST)
MIME-Version: 1.0
References: <20210118003428.568892-1-djrscally@gmail.com> <20210118003428.568892-3-djrscally@gmail.com>
 <CAJZ5v0gVQsZ4rxXW8uMidW9zfY_S50zpfrL-Gq0J3Z4-qqBiww@mail.gmail.com>
 <b381b48e-1bf2-f3e7-10a6-e51cd261f43c@gmail.com> <CAJZ5v0iU2m4Hs6APuauQ645DwbjYaB8nJFjYH0+7yQnR-FPZBQ@mail.gmail.com>
 <e2d7e5e9-920f-7227-76a6-b166e30e11e5@gmail.com> <CAJZ5v0gg5oXG3yOO9iDvPKSsadYrFojW6JcKfZcQbFFpO78zAQ@mail.gmail.com>
 <85ccf00d-7c04-b1da-a4bc-82c805df69c9@gmail.com>
In-Reply-To: <85ccf00d-7c04-b1da-a4bc-82c805df69c9@gmail.com>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Thu, 21 Jan 2021 15:39:55 +0100
Message-ID: <CAJZ5v0jO9O1zhBMNRNB5kRt1o86BTjr1kRuFUe=nNVTDwBQhEg@mail.gmail.com>
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

On Thu, Jan 21, 2021 at 1:04 PM Daniel Scally <djrscally@gmail.com> wrote:
>
>
> On 21/01/2021 11:58, Rafael J. Wysocki wrote:
> > On Thu, Jan 21, 2021 at 10:47 AM Daniel Scally <djrscally@gmail.com> wrote:
> >> Hi Rafael
> >>
> >> On 19/01/2021 13:15, Rafael J. Wysocki wrote:
> >>> On Mon, Jan 18, 2021 at 9:51 PM Daniel Scally <djrscally@gmail.com> wrote:
> >>>> On 18/01/2021 16:14, Rafael J. Wysocki wrote:
> >>>>> On Mon, Jan 18, 2021 at 1:37 AM Daniel Scally <djrscally@gmail.com> wrote:
> >>>>>> In some ACPI tables we encounter, devices use the _DEP method to assert
> >>>>>> a dependence on other ACPI devices as opposed to the OpRegions that the
> >>>>>> specification intends. We need to be able to find those devices "from"
> >>>>>> the dependee, so add a function to parse all ACPI Devices and check if
> >>>>>> the include the handle of the dependee device in their _DEP buffer.
> >>>>> What exactly do you need this for?
> >>>> So, in our DSDT we have devices with _HID INT3472, plus sensors which
> >>>> refer to those INT3472's in their _DEP method. The driver binds to the
> >>>> INT3472 device, we need to find the sensors dependent on them.
> >>>>
> >>> Well, this is an interesting concept. :-)
> >>>
> >>> Why does _DEP need to be used for that?  Isn't there any other way to
> >>> look up the dependent sensors?
> >>>
> >>>>> Would it be practical to look up the suppliers in acpi_dep_list instead?
> >>>>>
> >>>>> Note that supplier drivers may remove entries from there, but does
> >>>>> that matter for your use case?
> >>>> Ah - that may work, yes. Thank you, let me test that.
> >>> Even if that doesn't work right away, but it can be made work, I would
> >>> very much prefer that to the driver parsing _DEP for every device in
> >>> the namespace by itself.
> >>
> >> This does work; do you prefer it in scan.c, or in utils.c (in which case
> >> with acpi_dep_list declared as external var in internal.h)?
> > Let's put it in scan.c for now, because there is the lock protecting
> > the list in there too.
> >
> > How do you want to implement this?  Something like "walk the list and
> > run a callback for the matching entries" or do you have something else
> > in mind?
>
>
> Something like this (though with a mutex_lock()). It could be simplified
> by dropping the prev stuff, but we have seen INT3472 devices with
> multiple sensors declaring themselves dependent on the same device
>
>
> struct acpi_device *
> acpi_dev_get_next_dependent_dev(struct acpi_device *supplier,
>                 struct acpi_device *prev)
> {
>     struct acpi_dep_data *dep;
>     struct acpi_device *adev;
>     int ret;
>
>     if (!supplier)
>         return ERR_PTR(-EINVAL);
>
>     if (prev) {
>         /*
>          * We need to find the previous device in the list, so we know
>          * where to start iterating from.
>          */
>         list_for_each_entry(dep, &acpi_dep_list, node)
>             if (dep->consumer == prev->handle &&
>                 dep->supplier == supplier->handle)
>                 break;
>
>         dep = list_next_entry(dep, node);
>     } else {
>         dep = list_first_entry(&acpi_dep_list, struct acpi_dep_data,
>                        node);
>     }
>
>
>     list_for_each_entry_from(dep, &acpi_dep_list, node) {
>         if (dep->supplier == supplier->handle) {
>             ret = acpi_bus_get_device(dep->consumer, &adev);
>             if (ret)
>                 return ERR_PTR(ret);
>
>             return adev;
>         }
>     }
>
>     return NULL;
> }

That would work I think, but would it be practical to modify
acpi_walk_dep_device_list() so that it runs a callback for every
consumer found instead of or in addition to the "delete from the list
and free the entry" operation?
