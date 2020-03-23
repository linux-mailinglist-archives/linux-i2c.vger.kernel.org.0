Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38BA4190071
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Mar 2020 22:36:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726982AbgCWVgL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 23 Mar 2020 17:36:11 -0400
Received: from mga06.intel.com ([134.134.136.31]:17076 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726203AbgCWVgL (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 23 Mar 2020 17:36:11 -0400
IronPort-SDR: vNqW6XBMX9TcI8Bdq39Xe0SG2mxKILk434f2eciLxBYrV+GjZxm5WQZkxAt8s4x95O0PFfGh7m
 9gEpRAiBcwOw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2020 14:36:09 -0700
IronPort-SDR: 52/ppiaqJr0+7nRGHO3di463XmFQdFylQyxoh7YPzOWeb6pOlDhtB+fKBsWEJ6EfQLiKD7JvnD
 rPw4HMsBshkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,297,1580803200"; 
   d="scan'208";a="238017779"
Received: from unknown (HELO kekkonen.fi.intel.com) ([10.249.35.222])
  by fmsmga007.fm.intel.com with ESMTP; 23 Mar 2020 14:36:05 -0700
Received: by kekkonen.fi.intel.com (Postfix, from userid 1000)
        id 6580321EF2; Mon, 23 Mar 2020 23:36:03 +0200 (EET)
Date:   Mon, 23 Mar 2020 23:36:03 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-i2c <linux-i2c@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-acpi@vger.kernel.org, Bingbu Cao <bingbu.cao@intel.com>,
        linux-media <linux-media@vger.kernel.org>,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Hyungwoo Yang <hyungwoo.yang@intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        LKML <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rajmohan.mani@intel.com, Tomasz Figa <tfiga@chromium.org>
Subject: Re: [PATCH v4 1/6] i2c: Allow driver to manage the device's power
 state during probe
Message-ID: <20200323213602.GC21174@kekkonen.localdomain>
References: <20200121134157.20396-1-sakari.ailus@linux.intel.com>
 <20200121134157.20396-2-sakari.ailus@linux.intel.com>
 <CAMpxmJX8gF3TujMMeEgERAFM4YbpgnNjOmuV+U7uWCndqsyGeA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMpxmJX8gF3TujMMeEgERAFM4YbpgnNjOmuV+U7uWCndqsyGeA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Bartosz,

On Wed, Jan 29, 2020 at 02:54:20PM +0100, Bartosz Golaszewski wrote:
> wt., 21 sty 2020 o 14:41 Sakari Ailus <sakari.ailus@linux.intel.com> napisał(a):
> >
> > Enable drivers to tell ACPI that there's no need to power on a device for
> > probe. Drivers should still perform this by themselves if there's a need
> > to. In some cases powering on the device during probe is undesirable, and
> > this change enables a driver to choose what fits best for it.
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/i2c/i2c-core-base.c | 15 ++++++++++++---
> >  include/linux/i2c.h         |  3 +++
> >  2 files changed, 15 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> > index 9f8dcd3f83850..7bf1699c9044d 100644
> > --- a/drivers/i2c/i2c-core-base.c
> > +++ b/drivers/i2c/i2c-core-base.c
> > @@ -303,6 +303,14 @@ static int i2c_smbus_host_notify_to_irq(const struct i2c_client *client)
> >         return irq > 0 ? irq : -ENXIO;
> >  }
> >
> > +static bool probe_low_power(struct device *dev)
> > +{
> > +       struct i2c_driver *driver = to_i2c_driver(dev->driver);
> > +
> > +       return driver->probe_low_power &&
> > +               device_property_present(dev, "probe-low-power");
> > +}
> > +
> >  static int i2c_device_probe(struct device *dev)
> >  {
> >         struct i2c_client       *client = i2c_verify_client(dev);
> > @@ -375,7 +383,8 @@ static int i2c_device_probe(struct device *dev)
> >         if (status < 0)
> >                 goto err_clear_wakeup_irq;
> >
> > -       status = dev_pm_domain_attach(&client->dev, true);
> > +       status = dev_pm_domain_attach(&client->dev,
> > +                                     !probe_low_power(&client->dev));
> >         if (status)
> >                 goto err_clear_wakeup_irq;
> >
> > @@ -397,7 +406,7 @@ static int i2c_device_probe(struct device *dev)
> >         return 0;
> >
> >  err_detach_pm_domain:
> > -       dev_pm_domain_detach(&client->dev, true);
> > +       dev_pm_domain_detach(&client->dev, !probe_low_power(&client->dev));
> >  err_clear_wakeup_irq:
> >         dev_pm_clear_wake_irq(&client->dev);
> >         device_init_wakeup(&client->dev, false);
> > @@ -419,7 +428,7 @@ static int i2c_device_remove(struct device *dev)
> >                 status = driver->remove(client);
> >         }
> >
> > -       dev_pm_domain_detach(&client->dev, true);
> > +       dev_pm_domain_detach(&client->dev, !probe_low_power(&client->dev));
> >
> >         dev_pm_clear_wake_irq(&client->dev);
> >         device_init_wakeup(&client->dev, false);
> > diff --git a/include/linux/i2c.h b/include/linux/i2c.h
> > index 582ef05ec07ed..6d0d6af393c56 100644
> > --- a/include/linux/i2c.h
> > +++ b/include/linux/i2c.h
> > @@ -229,6 +229,8 @@ enum i2c_alert_protocol {
> >   * @address_list: The I2C addresses to probe (for detect)
> >   * @clients: List of detected clients we created (for i2c-core use only)
> >   * @disable_i2c_core_irq_mapping: Tell the i2c-core to not do irq-mapping
> > + * @probe_low_power: Let the driver manage the device's power state
> > + *                  during probe and remove.
> >   *
> >   * The driver.owner field should be set to the module owner of this driver.
> >   * The driver.name field should be set to the name of this driver.
> > @@ -289,6 +291,7 @@ struct i2c_driver {
> >         struct list_head clients;
> >
> >         bool disable_i2c_core_irq_mapping;
> > +       bool probe_low_power;
> 
> I don't see any users of disable_i2c_core_irq_mapping in current
> mainline. Maybe instead of adding another 1-byte boolean for every
> such property, let's just use the fact that this struct will have at
> least an alignment of 32-bits anyway and merge the two into an int
> field called 'flags' so that we can extend it in the future if needed?
> 
> The name 'probe_low_power' is misleading to me too. It makes me think
> it's the default state for some reason. It should be something like
> 'allow_low_power_probe'.

Ah, got around reading this one after sending the previous mail.

Sounds reasonable. I'll address both in v5.

-- 
Kind regards,

Sakari Ailus
