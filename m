Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2DC5144173
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Jan 2020 17:05:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729414AbgAUQDL convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Tue, 21 Jan 2020 11:03:11 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:45847 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729937AbgAUQDE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 21 Jan 2020 11:03:04 -0500
Received: by mail-ot1-f65.google.com with SMTP id 59so3336383otp.12;
        Tue, 21 Jan 2020 08:03:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=3uhVIJum8giozCbBAOAWfX0RCY6W6sw6Ypl8FcWQYgw=;
        b=gjnBgvKuRoIHcy/7hapOzadDpTWIpf9+Eq/Y08/QYvaBjHphHnnuUgtDOSHLg38EZu
         P4QwcAdxFv4WO/DU5wWV/TWEncKxhCtf2Nk2v+QABtmBWrHlh0XKyinQP94WQNzdPOnH
         eU5YJ31FSo1SG35pvOvEdO/UZt78wnJ5XQMcIBQEmoguSSgu2Th2E84MSIhbecTBYfh4
         siOzoKI9xlLFL3Hzs+9dXA6rODGNAagp34WKpO87Ppv3Fvj9kOn37Z5cICRY1Vtxa64+
         xcLUMsBxFyWs9AIw7nYD++0Xe3Vaz6SMBAwPyDD1EkcEJpklZrHMBWIOmnoqDnWKJ319
         KzZQ==
X-Gm-Message-State: APjAAAVKj4tHv25eq1NeDsk+XHXcQCrJtrZx8QWGEjUa3l3sBM3A/NRA
        djcGwCd89fkssadXC4sxey3FSRMGMyAyZx7n1Tw=
X-Google-Smtp-Source: APXvYqw6XT5EzbITnd9lPUjkFNyWUErkpjeaTNijKjeAsb/nf2EtB/i7hY+Prsk+BHDYhDqQd3i9Wde9kUjQ1TdRaCg=
X-Received: by 2002:a05:6830:4b9:: with SMTP id l25mr4157514otd.266.1579622583933;
 Tue, 21 Jan 2020 08:03:03 -0800 (PST)
MIME-Version: 1.0
References: <20200109154529.19484-1-sakari.ailus@linux.intel.com>
 <20200109154529.19484-3-sakari.ailus@linux.intel.com> <CAJZ5v0hfGateSt-_EBuyHqLYi5NR4PUFB=wDF+Gu+9-tFXuohg@mail.gmail.com>
 <20200121090946.GX5440@paasikivi.fi.intel.com>
In-Reply-To: <20200121090946.GX5440@paasikivi.fi.intel.com>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Tue, 21 Jan 2020 17:02:52 +0100
Message-ID: <CAJZ5v0gEO_QesTg2oqA-9dYbPJ5Gsm5H8wvSRQTLeww0o2vx3g@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] ACPI: Add a convenience function to tell a device
 is suspended in probe
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Mani, Rajmohan" <rajmohan.mani@intel.com>,
        Tomasz Figa <tfiga@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Jan 21, 2020 at 10:09 AM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Rafael,
>
> Thank you for the review.
>
> On Mon, Jan 13, 2020 at 11:41:12AM +0100, Rafael J. Wysocki wrote:
> > On Thu, Jan 9, 2020 at 4:44 PM Sakari Ailus
> > <sakari.ailus@linux.intel.com> wrote:
> > >
> > > Add a convenience function to tell whether a device is suspended for probe
> > > or remove, for busses where the custom is that drivers don't need to
> > > resume devices in probe, or suspend them in their remove handlers.
> > >
> > > Returns false on non-ACPI systems.
> > >
> > > Suggested-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > ---
> > >  drivers/acpi/device_pm.c | 35 +++++++++++++++++++++++++++++++++++
> > >  include/linux/acpi.h     |  5 +++++
> > >  2 files changed, 40 insertions(+)
> > >
> > > diff --git a/drivers/acpi/device_pm.c b/drivers/acpi/device_pm.c
> > > index 5e4a8860a9c0c..87393020276d8 100644
> > > --- a/drivers/acpi/device_pm.c
> > > +++ b/drivers/acpi/device_pm.c
> > > @@ -1348,4 +1348,39 @@ int acpi_dev_pm_attach(struct device *dev, bool power_on)
> > >         return 1;
> > >  }
> > >  EXPORT_SYMBOL_GPL(acpi_dev_pm_attach);
> > > +
> > > +/**
> > > + * acpi_dev_low_power_state_probe - Tell if a device is in a low power state
> >
> > "Check the current ACPI power state of a device."
>
> Sounds good.
>
> >
> > > + *                                 during probe
> >
> > Why is this limited to probe?
>
> Well.. that was the purpose. It could be used at other times, too, I guess,
> but most of the time runtime PM is the right interface for doing that.

PM-runtime is a layer above this one.

It is mostly about the coordination between devices, reference
counting etc which this is about device power states.

> >
> > The function actually checks whether or not the ACPI power state of
> > the device is low-power at the call time (except that it is a bit racy
> > with respect to _set_power(), so it may not work as expected if called
> > in parallel with that one).
> >
> > Maybe drop the "probe" part of the name (actually, I would call this
> > function acpi_dev_state_low_power()) and add a paragraph about the
> > potential race with _set_power() to the description?
>
> Agreed, I'll use the text you provided below.
>
> >
> > > + * @dev: The device
> >
> > "Physical device the ACPI power state of which to check".
>
> Ok.
>
> >
> > > + *
> > > + * Tell whether a given device is in a low power state during the driver's probe
> > > + * or remove operation.
> > > + *
> > > + * Drivers of devices on certain busses such as I涎 can generally assume (on
> > > + * ACPI based systems) that the devices they control are powered on without
> > > + * driver having to do anything about it. Using struct
> > > + * device_driver.probe_low_power and "probe-low-power" property, this can be
> > > + * negated and the driver has full control of the device power management.
> >
> > The above information belongs somewhere else in my view.
>
> How about putting it to the DSD ReST property documentation, perhaps with a
> little bit more context? I can add another patch for that.

Yes, something like that.
