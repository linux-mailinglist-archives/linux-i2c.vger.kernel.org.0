Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 028922FE986
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Jan 2021 13:00:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730560AbhAUL7p (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 21 Jan 2021 06:59:45 -0500
Received: from mail-ot1-f41.google.com ([209.85.210.41]:42838 "EHLO
        mail-ot1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728846AbhAUL7f (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 21 Jan 2021 06:59:35 -0500
Received: by mail-ot1-f41.google.com with SMTP id f6so1319644ots.9;
        Thu, 21 Jan 2021 03:59:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LMQpWTlwXlB+6DhuZpRPyd2/2y3TLAjilyG8Sg/pBQ4=;
        b=tbYRWno+wlZxOIOXoc2efdBECq/zwJxHZz1DYSHEeo+FGar5goxcUjpkxY3rGtxCeJ
         fVg67s99LYEEctteoTQ+xRmZ3ewBDg4T4lUF4yAREJRFr0j/N8K/m/YKAKg2Vgc4xbB6
         iEVO+UGhc8mKZ1xM7xdgDSchClUVeQvpsGbqXUDHcwMgPpX9d9Rg1GlCmDCq7u9jU954
         GxnGuhfllwcvkfjkEuB+oYpodG9Xwyf9ROKGbVu1hHbGJ70bSXqdT5FOjD44ps9ysPA1
         HgTK8dCXKw1DEhDwBAclb7jJtK0cuW7IsUemF0WzulbJavAPHbzIAKaiD3dCOikBTzAj
         r6Rg==
X-Gm-Message-State: AOAM53133IraZqjTiy30MFqRAaPr71tvh56qzkH6t7K4zJmFvIJ8+FjT
        QFRQ/pwpkIz00imBdtTk60g7XAsjdeAn19ik9eo=
X-Google-Smtp-Source: ABdhPJzUXT3Qcu1MEek/JIy1QokhzlIz+1Z889izuguqO0chtBSEj4LHKA87+uH8We9MoxEatFnak9b3i0z82NlULJU=
X-Received: by 2002:a9d:1710:: with SMTP id i16mr9965157ota.260.1611230334235;
 Thu, 21 Jan 2021 03:58:54 -0800 (PST)
MIME-Version: 1.0
References: <20210118003428.568892-1-djrscally@gmail.com> <20210118003428.568892-3-djrscally@gmail.com>
 <CAJZ5v0gVQsZ4rxXW8uMidW9zfY_S50zpfrL-Gq0J3Z4-qqBiww@mail.gmail.com>
 <b381b48e-1bf2-f3e7-10a6-e51cd261f43c@gmail.com> <CAJZ5v0iU2m4Hs6APuauQ645DwbjYaB8nJFjYH0+7yQnR-FPZBQ@mail.gmail.com>
 <e2d7e5e9-920f-7227-76a6-b166e30e11e5@gmail.com>
In-Reply-To: <e2d7e5e9-920f-7227-76a6-b166e30e11e5@gmail.com>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Thu, 21 Jan 2021 12:58:43 +0100
Message-ID: <CAJZ5v0gg5oXG3yOO9iDvPKSsadYrFojW6JcKfZcQbFFpO78zAQ@mail.gmail.com>
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

On Thu, Jan 21, 2021 at 10:47 AM Daniel Scally <djrscally@gmail.com> wrote:
>
> Hi Rafael
>
> On 19/01/2021 13:15, Rafael J. Wysocki wrote:
> > On Mon, Jan 18, 2021 at 9:51 PM Daniel Scally <djrscally@gmail.com> wrote:
> >> On 18/01/2021 16:14, Rafael J. Wysocki wrote:
> >>> On Mon, Jan 18, 2021 at 1:37 AM Daniel Scally <djrscally@gmail.com> wrote:
> >>>> In some ACPI tables we encounter, devices use the _DEP method to assert
> >>>> a dependence on other ACPI devices as opposed to the OpRegions that the
> >>>> specification intends. We need to be able to find those devices "from"
> >>>> the dependee, so add a function to parse all ACPI Devices and check if
> >>>> the include the handle of the dependee device in their _DEP buffer.
> >>> What exactly do you need this for?
> >> So, in our DSDT we have devices with _HID INT3472, plus sensors which
> >> refer to those INT3472's in their _DEP method. The driver binds to the
> >> INT3472 device, we need to find the sensors dependent on them.
> >>
> > Well, this is an interesting concept. :-)
> >
> > Why does _DEP need to be used for that?  Isn't there any other way to
> > look up the dependent sensors?
> >
> >>> Would it be practical to look up the suppliers in acpi_dep_list instead?
> >>>
> >>> Note that supplier drivers may remove entries from there, but does
> >>> that matter for your use case?
> >> Ah - that may work, yes. Thank you, let me test that.
> > Even if that doesn't work right away, but it can be made work, I would
> > very much prefer that to the driver parsing _DEP for every device in
> > the namespace by itself.
>
>
> This does work; do you prefer it in scan.c, or in utils.c (in which case
> with acpi_dep_list declared as external var in internal.h)?

Let's put it in scan.c for now, because there is the lock protecting
the list in there too.

How do you want to implement this?  Something like "walk the list and
run a callback for the matching entries" or do you have something else
in mind?
