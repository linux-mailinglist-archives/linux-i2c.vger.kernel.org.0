Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BC8C2418A3
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Aug 2020 10:57:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728381AbgHKI5v (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 11 Aug 2020 04:57:51 -0400
Received: from mga07.intel.com ([134.134.136.100]:33872 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728336AbgHKI5v (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 11 Aug 2020 04:57:51 -0400
IronPort-SDR: hhrZbCcZRh0Sdybu/vfzBM6qAONDK1+1j3R6DppUJ3gqgUZ8YF3rjl//Jh+07QQcW8Qu2DnN4i
 bT7tXicfI20g==
X-IronPort-AV: E=McAfee;i="6000,8403,9709"; a="218030568"
X-IronPort-AV: E=Sophos;i="5.75,460,1589266800"; 
   d="scan'208";a="218030568"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2020 01:57:49 -0700
IronPort-SDR: EmAtZuRpcdtRFUCT8R9mvEDeG40/XSjZz7NwrbIXaM72Jbh4UNwML1IGy6XVooLEowvXfWqy3P
 Zit6SPImqfOg==
X-IronPort-AV: E=Sophos;i="5.75,460,1589266800"; 
   d="scan'208";a="277522857"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2020 01:57:46 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 391D8206E3; Tue, 11 Aug 2020 11:57:44 +0300 (EEST)
Date:   Tue, 11 Aug 2020 11:57:44 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Sudeep Holla <sudeep.holla@arm.com>
Cc:     linux-i2c@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-acpi@vger.kernel.org, Bingbu Cao <bingbu.cao@intel.com>,
        linux-media@vger.kernel.org,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Hyungwoo Yang <hyungwoo.yang@intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rajmohan.mani@intel.com, Tomasz Figa <tfiga@chromium.org>,
        "Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v5 1/6] i2c: Allow driver to manage the device's power
 state during probe
Message-ID: <20200811085744.GK16270@paasikivi.fi.intel.com>
References: <20200810142747.12400-1-sakari.ailus@linux.intel.com>
 <20200810142747.12400-2-sakari.ailus@linux.intel.com>
 <20200810144148.GD31434@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200810144148.GD31434@bogus>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Sudeep,

Thanks for the review.

On Mon, Aug 10, 2020 at 03:41:48PM +0100, Sudeep Holla wrote:
> On Mon, Aug 10, 2020 at 05:27:42PM +0300, Sakari Ailus wrote:
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
> >  drivers/i2c/i2c-core-base.c | 17 ++++++++++++++---
> >  include/linux/i2c.h         | 14 ++++++++++++++
> >  2 files changed, 28 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> > index 34a9609f256da..cde9cf49a07e6 100644
> > --- a/drivers/i2c/i2c-core-base.c
> > +++ b/drivers/i2c/i2c-core-base.c
> > @@ -436,6 +436,14 @@ static int i2c_smbus_host_notify_to_irq(const struct i2c_client *client)
> >  	return irq > 0 ? irq : -ENXIO;
> >  }
> >
> > +static bool allow_low_power_probe(struct device *dev)
> > +{
> > +	struct i2c_driver *driver = to_i2c_driver(dev->driver);
> > +
> > +	return driver->flags & I2C_DRV_FL_ALLOW_LOW_POWER_PROBE &&
> > +		device_property_present(dev, "allow-low-power-probe");
> 
> I assume this change makes even the DT property "allow-low-power-probe"
> work in the same way. Should we have proper DT binding for that ?
> 
> This comment applies for any property using device_property_* but has
> no explicit DT binding ? Just asking the question to know the strategy
> followed. Sorry if this is redundant question, feel free to point me
> to the past discussions.

It's not a redundant question, no.

I²C drivers on OF are responsible for controlling device's power state
already (using runtime PM or without) so I think the drivers could use the
property directly on OF systems (and document the property in DT bindings
first) if there's a need to. IOW this code isn't needed on OF.

Note that the power_on or power_off arguments are not used by
genpd_dev_pm_attach() or genpd_dev_pm_detach() so this patch only affects
ACPI. I think I should check the device is an ACPI device above, for
clarity.

Cc also DT list. The entire set is here:

<URL:https://lore.kernel.org/linux-acpi/20200810142747.12400-1-sakari.ailus@linux.intel.com/>

-- 
Kind regards,

Sakari Ailus
