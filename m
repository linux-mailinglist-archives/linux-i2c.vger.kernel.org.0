Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A523257536
	for <lists+linux-i2c@lfdr.de>; Mon, 31 Aug 2020 10:23:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727949AbgHaIXQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 31 Aug 2020 04:23:16 -0400
Received: from mga06.intel.com ([134.134.136.31]:26543 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725829AbgHaIXN (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 31 Aug 2020 04:23:13 -0400
IronPort-SDR: VLriy6BcbVV1PLh9RbX6TR6XH5EIKHPczhihMmSSPBuRQyVF2fxu36SXMMBHmoQn2FP/oEVBBr
 smvnfNryFYrA==
X-IronPort-AV: E=McAfee;i="6000,8403,9729"; a="218477923"
X-IronPort-AV: E=Sophos;i="5.76,375,1592895600"; 
   d="scan'208";a="218477923"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2020 01:23:10 -0700
IronPort-SDR: gLSHJrMEHOmN4CLQPUk1eUjfLzPJGAErURr6c0Qmd8Xpr1eB/Xud6G4u/50HaigYE43wSKZ5Yy
 dS4dNfDTBMlA==
X-IronPort-AV: E=Sophos;i="5.76,375,1592895600"; 
   d="scan'208";a="338159064"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2020 01:23:07 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 4BD6F2071B; Mon, 31 Aug 2020 11:23:05 +0300 (EEST)
Date:   Mon, 31 Aug 2020 11:23:05 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-acpi@vger.kernel.org, Bingbu Cao <bingbu.cao@intel.com>,
        linux-media@vger.kernel.org,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Hyungwoo Yang <hyungwoo.yang@intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rajmohan.mani@intel.com, Tomasz Figa <tfiga@chromium.org>,
        "Qiu, Tian Shu" <tian.shu.qiu@intel.com>
Subject: Re: [PATCH v6 1/6] i2c: Allow an ACPI driver to manage the device's
 power state during probe
Message-ID: <20200831082305.GD31019@paasikivi.fi.intel.com>
References: <20200826115432.6103-1-sakari.ailus@linux.intel.com>
 <20200826115432.6103-2-sakari.ailus@linux.intel.com>
 <20200828083832.GE1343@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200828083832.GE1343@ninjato>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

Thank you for the review.

On Fri, Aug 28, 2020 at 10:38:32AM +0200, Wolfram Sang wrote:
> Hi Sakari,
> 
> On Wed, Aug 26, 2020 at 02:54:27PM +0300, Sakari Ailus wrote:
> > Enable drivers to tell ACPI that there's no need to power on a device for
> > probe. Drivers should still perform this by themselves if there's a need
> > to. In some cases powering on the device during probe is undesirable, and
> > this change enables a driver to choose what fits best for it.
> > 
> > Add a field called "flags" into struct i2c_driver for driver flags, and a
> > flag I2C_DRV_FL_ALLOW_LOW_POWER_PROBE to tell a driver supports probe in
> > low power state.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/i2c/i2c-core-base.c | 18 +++++++++++++++---
> >  include/linux/i2c.h         | 14 ++++++++++++++
> >  2 files changed, 29 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> > index 34a9609f256da..f2683790eb0d2 100644
> > --- a/drivers/i2c/i2c-core-base.c
> > +++ b/drivers/i2c/i2c-core-base.c
> > @@ -436,6 +436,15 @@ static int i2c_smbus_host_notify_to_irq(const struct i2c_client *client)
> >  	return irq > 0 ? irq : -ENXIO;
> >  }
> >  
> > +static bool allow_low_power_probe(struct device *dev)
> > +{
> > +	struct i2c_driver *driver = to_i2c_driver(dev->driver);
> > +
> > +	return driver->flags & I2C_DRV_FL_ALLOW_LOW_POWER_PROBE &&
> > +		is_acpi_node(dev_fwnode(dev)) &&
> > +		device_property_present(dev, "allow-low-power-probe");
> 
> So, I wondered about potential DT usage and I read the discussion about
> that in v5 which concluded that for the DT case, the drivers can make
> use of the binding individually. I can agree to that, but then the name
> of the binding is probably problematic. 'allow-*' sounds like
> configuration but DT is for describing HW. So, I think something in the
> range of 'keep-low-power' or so might be better suited. Grepping shows
> there already is a generic binding "low-power-enable". Not sure, if it
> really fits, because here it is more about 'keeping' rather than
> enabling. Or?

The low-power-enable appears to be telling pinctrl drivers the pin can
be configured for low power operation.

This patchset is really about changing the default of ACPI powering up I²C
devices. On OF the drivers are indeed responsible for that.

Another approach in naming the property could related to the consequence
that device accesses must be omitted during driver probe time, but the
first device access takes place when the user actually needs it, e.g.
"skip-device-probe". Due to that the device does not need to be powered on
for probe, so powering it on can be omitted. I'd still keep the naming in
the kernel as-is in that case.

> 
> > +/**
> > + * enum i2c_driver_flags - Flags for an I2C device driver
> > + *
> > + * @I2C_DRV_FL_ALLOW_LOW_POWER_PROBE: Let the ACPI driver manage the device's
> > + *				      power state during probe and remove
> > + */
> > +enum i2c_driver_flags {
> > +	I2C_DRV_FL_ALLOW_LOW_POWER_PROBE = BIT(0),
> > +};
> > +
> >  /**
> >   * struct i2c_driver - represent an I2C device driver
> >   * @class: What kind of i2c device we instantiate (for detect)
> > @@ -231,6 +242,7 @@ enum i2c_alert_protocol {
> >   * @detect: Callback for device detection
> >   * @address_list: The I2C addresses to probe (for detect)
> >   * @clients: List of detected clients we created (for i2c-core use only)
> > + * @flags: A bitmask of flags defined in &enum i2c_driver_flags
> >   *
> >   * The driver.owner field should be set to the module owner of this driver.
> >   * The driver.name field should be set to the name of this driver.
> > @@ -289,6 +301,8 @@ struct i2c_driver {
> >  	int (*detect)(struct i2c_client *client, struct i2c_board_info *info);
> >  	const unsigned short *address_list;
> >  	struct list_head clients;
> > +
> > +	unsigned int flags;
> 
> Here I wonder if all this is really I2C specific? I could imagine this
> being useful for other busses as well, so maybe 'struct device_driver'
> is a better place?

The default power state appears to depend on the bus type on ACPI. I'd
think it's unlikely this feature would be needed elsewhere, with the
possible exception of I3C, if hardware design does not improve from the
current I²C connected cameras.

My original series had a field in struct device_driver for this purpose but
Greg K-H suggested moving it to I²C instead:

<URL:https://lore.kernel.org/linux-acpi/20190826084343.GA1095@kroah.com/>

-- 
Kind regards,

Sakari Ailus
