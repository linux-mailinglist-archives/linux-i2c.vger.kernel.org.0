Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3816F143923
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Jan 2020 10:09:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728456AbgAUJJw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 Jan 2020 04:09:52 -0500
Received: from mga11.intel.com ([192.55.52.93]:50095 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727969AbgAUJJw (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 21 Jan 2020 04:09:52 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 21 Jan 2020 01:09:51 -0800
X-IronPort-AV: E=Sophos;i="5.70,345,1574150400"; 
   d="scan'208";a="215470836"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 21 Jan 2020 01:09:49 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id DDE45208C5; Tue, 21 Jan 2020 11:09:46 +0200 (EET)
Date:   Tue, 21 Jan 2020 11:09:46 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     linux-i2c <linux-i2c@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Mani, Rajmohan" <rajmohan.mani@intel.com>,
        Tomasz Figa <tfiga@chromium.org>
Subject: Re: [PATCH v3 2/5] ACPI: Add a convenience function to tell a device
 is suspended in probe
Message-ID: <20200121090946.GX5440@paasikivi.fi.intel.com>
References: <20200109154529.19484-1-sakari.ailus@linux.intel.com>
 <20200109154529.19484-3-sakari.ailus@linux.intel.com>
 <CAJZ5v0hfGateSt-_EBuyHqLYi5NR4PUFB=wDF+Gu+9-tFXuohg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJZ5v0hfGateSt-_EBuyHqLYi5NR4PUFB=wDF+Gu+9-tFXuohg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Rafael,

Thank you for the review.

On Mon, Jan 13, 2020 at 11:41:12AM +0100, Rafael J. Wysocki wrote:
> On Thu, Jan 9, 2020 at 4:44 PM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> >
> > Add a convenience function to tell whether a device is suspended for probe
> > or remove, for busses where the custom is that drivers don't need to
> > resume devices in probe, or suspend them in their remove handlers.
> >
> > Returns false on non-ACPI systems.
> >
> > Suggested-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/acpi/device_pm.c | 35 +++++++++++++++++++++++++++++++++++
> >  include/linux/acpi.h     |  5 +++++
> >  2 files changed, 40 insertions(+)
> >
> > diff --git a/drivers/acpi/device_pm.c b/drivers/acpi/device_pm.c
> > index 5e4a8860a9c0c..87393020276d8 100644
> > --- a/drivers/acpi/device_pm.c
> > +++ b/drivers/acpi/device_pm.c
> > @@ -1348,4 +1348,39 @@ int acpi_dev_pm_attach(struct device *dev, bool power_on)
> >         return 1;
> >  }
> >  EXPORT_SYMBOL_GPL(acpi_dev_pm_attach);
> > +
> > +/**
> > + * acpi_dev_low_power_state_probe - Tell if a device is in a low power state
> 
> "Check the current ACPI power state of a device."

Sounds good.

> 
> > + *                                 during probe
> 
> Why is this limited to probe?

Well.. that was the purpose. It could be used at other times, too, I guess,
but most of the time runtime PM is the right interface for doing that.

> 
> The function actually checks whether or not the ACPI power state of
> the device is low-power at the call time (except that it is a bit racy
> with respect to _set_power(), so it may not work as expected if called
> in parallel with that one).
> 
> Maybe drop the "probe" part of the name (actually, I would call this
> function acpi_dev_state_low_power()) and add a paragraph about the
> potential race with _set_power() to the description?

Agreed, I'll use the text you provided below.

> 
> > + * @dev: The device
> 
> "Physical device the ACPI power state of which to check".

Ok.

> 
> > + *
> > + * Tell whether a given device is in a low power state during the driver's probe
> > + * or remove operation.
> > + *
> > + * Drivers of devices on certain busses such as I²C can generally assume (on
> > + * ACPI based systems) that the devices they control are powered on without
> > + * driver having to do anything about it. Using struct
> > + * device_driver.probe_low_power and "probe-low-power" property, this can be
> > + * negated and the driver has full control of the device power management.
> 
> The above information belongs somewhere else in my view.

How about putting it to the DSD ReST property documentation, perhaps with a
little bit more context? I can add another patch for that.

> 
> > + * Always returns false on non-ACPI based systems. True is returned on ACPI
> 
> "On a system without ACPI, return false.  On a system with ACPI,
> return true if the current ACPI power state of the device is not D0,
> or false otherwise.
> 
> Note that the power state of a device is not well-defined after it has
> been passed to acpi_device_set_power() and before that function
> returns, so it is not valid to ask for the ACPI power state of the
> device in that time frame."

Works for me.

> 
> > + * based systems iff the device is in a low power state during probe or remove.
> > + */
> > +bool acpi_dev_low_power_state_probe(struct device *dev)
> > +{
> > +       int power_state;
> > +       int ret;
> > +
> > +       if (!is_acpi_device_node(dev_fwnode(dev)))
> > +               return false;
> 
> This is (at least) inefficient, because the same check is repeated by
> ACPI_COMPANION().
> 
> If you really want to print the message, it is better to do something like
> 
> struct acpi_device *adev = ACPI_COMPANION(dev);
> 
> if (!adev)
>         return false;
> 
> ret = acpi_device_get_power(adev, &power_state);

Yes, makes sense.

> 
> > +
> > +       ret = acpi_device_get_power(ACPI_COMPANION(dev), &power_state);
> > +       if (ret) {
> > +               dev_warn(dev, "Cannot obtain power state (%d)\n", ret);
> 
> And the log level of this message is way too high IMO.
> 
> This means a firmware bug AFAICS and so after seeing it once on a
> given system it becomes noise.  I'd use pr_debug() to print it.

I'll switch to dev_dbg() then --- as we have the device.

> 
> > +               return false;
> > +       }
> > +
> > +       return power_state != ACPI_STATE_D0;
> > +}
> > +EXPORT_SYMBOL_GPL(acpi_dev_low_power_state_probe);
> > +
> >  #endif /* CONFIG_PM */

-- 
Kind regards,

Sakari Ailus
