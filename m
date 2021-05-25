Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56C6B39021B
	for <lists+linux-i2c@lfdr.de>; Tue, 25 May 2021 15:23:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233173AbhEYNZA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 May 2021 09:25:00 -0400
Received: from mga14.intel.com ([192.55.52.115]:57899 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233023AbhEYNY6 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 25 May 2021 09:24:58 -0400
IronPort-SDR: KyxXagf5sTeS+MX4h+ls8cBYRtl53p3od18fdgs7V1EejEn2AT7py64xWJsnrfM1Hmb1nsepXA
 N0rHN2zGJdDQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9995"; a="201942109"
X-IronPort-AV: E=Sophos;i="5.82,328,1613462400"; 
   d="scan'208";a="201942109"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2021 06:23:26 -0700
IronPort-SDR: oeufRP7gtJ1+DYjg5AFGnve3V4dolGGFIaySYlFLNCkZn2t4AWg7hr5tbmWVPEjXUVej15+Gcf
 Zm2ikRffmC0Q==
X-IronPort-AV: E=Sophos;i="5.82,328,1613462400"; 
   d="scan'208";a="546598434"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2021 06:23:21 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1llX1i-00Eahp-FH; Tue, 25 May 2021 16:23:18 +0300
Date:   Tue, 25 May 2021 16:23:18 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Daniel Scally <djrscally@gmail.com>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        Wolfram Sang <wsa@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        devel@acpica.org, Len Brown <lenb@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Russell King <linux@armlinux.org.uk>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mark Gross <mgross@linux.intel.com>,
        Robert Moore <robert.moore@intel.com>,
        Erik Kaneda <erik.kaneda@intel.com>,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v4 0/8] Introduce intel_skl_int3472 module
Message-ID: <YKz6Ro+J1DduULz4@smile.fi.intel.com>
References: <20210520140928.3252671-1-djrscally@gmail.com>
 <f2d8e74f-f33b-2489-1b90-b11bf7465d19@redhat.com>
 <dbc269f9-c76f-04f9-0900-22171c3ef3a3@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dbc269f9-c76f-04f9-0900-22171c3ef3a3@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, May 25, 2021 at 03:12:45PM +0200, Hans de Goede wrote:
> On 5/25/21 3:10 PM, Hans de Goede wrote:
> > On 5/20/21 4:09 PM, Daniel Scally wrote:
> >> Apologies for the long delay since the last version of this series; the time I
> >> had free to work on it became somewhat restrained.
> > 
> > No worries, thank you for all the work you are putting into this.
> > 
> > I have not taken a close look at the code yet, but I see that Andy has and
> > the amount of remarks which he has on patch 7/8 which is the big one seems
> > to be limited, so I believe that we are getting close to this being ready
> > for merging.
> > 
> > This touches a lot of subsystems, so we need to come up with a plan to
> > merge this. Here is my proposal for how to do this:
> > 
> > 1/8   ACPI: scan: Extend acpi_walk_dep_device_list()
> > 2/8   ACPI: scan: Add function to fetch dependent of acpi device
> > 3/8   i2c: core: Add a format macro for I2C device names
> > 4/8   gpiolib: acpi: Export acpi_get_gpiod()
> > 5/8   clkdev: Make clkdev_drop() null aware
> > 6/8   gpiolib: acpi: Add acpi_gpio_get_io_resource()
> > 7/8   platform/x86: Add intel_skl_int3472 driver
> > 8/8   mfd: tps68470: Remove tps68470 MFD driver
> > 
> > Rafael already indicated that he wants to merge 1/8 (and presumably also 2/8)
> > through his tree and that he will provide an immutable branch with those
> > for merging into the pdx86 tree.
> 
> p.s.
> 
> Daniel it would be good if you can at least send a v5 of patch 2/8 with
> the suggested renames, then Rafael can merge 1/8 + 2/8 and we are down to 6
> patches (4 if we also merge the i2c + clk patches independently).

I would also prefer GPIO ACPI patches to be grouped together, so I can simply
take them in a row.

> > 4/8 and 6/8 are both gpiolib-acpi patches and seem to be ready for merging
> > now, perhaps the gpiolib-acpi maintainers can already merge these and also
> > provide an immutable branch ?  Andy/Mika ?

Fine with me. Just need Mika's Ack / Rb tag.

> > 3/8 and 5/8 seem to be nice cleanups, but not really necessary. IMHO it
> > would be best to park these cleanups for later and for 3/8 add the following
> > where necessary for now:
> > 
> > /* FIXME drop this once the I2C_DEV_NAME_FORMAT macro has been added to include/linux/i2c.h */
> > #ifndef I2C_DEV_NAME_FORMAT
> > #define I2C_DEV_NAME_FORMAT		"i2c-%s"
> > #endif
> > 
> > This is not the prettiest but it reduces all the subsys cross-deps and things
> > like this have been done before for similar reasons.
> > 
> > Likewise it would be good if you can add if (foo) as condition before any
> > clkdev_drop(foo) calls in this patch-set and then merge
> > 5/8 "clkdev: Make clkdev_drop() null aware" independently of this and then
> > once both are in Linux tree follow-up with a cleanup patch dropping the if (foo)
> > guards.
> > 
> > So this would leave as deps for 7/8 just the 2 ACPI and 2 gpiolib-acpi patches
> > which I can hopefully pull-in via immutable branches and then we are good.
> > 
> > AFAICT patch 8/8 can be merged independently once 7/8 hits for-next (IOW once
> > we are sure the next kernel will have 7/8).
> > 
> > Or alternatively one of the involved subsys maintainers just merges the entire
> > set (once it is ready) and then provides an immutable branch with the entire set
> > on top of 5.13-rc1 (or 5.14-rc1). But that requires acks from all the other
> > subsys maintainers. Note I'm fine with either approach.

> >> v1 for this series was originally 14-18 of this series:
> >> https://lore.kernel.org/linux-media/20201130133129.1024662-1-djrscally@gmail.com/T/#m91934e12e3d033da2e768e952ea3b4a125ee3e67
> >>
> >> v2 was here:
> >> https://lore.kernel.org/platform-driver-x86/20210118003428.568892-1-djrscally@gmail.com/
> >>
> >> v3 was here:
> >> https://lore.kernel.org/lkml/20210222130735.1313443-1-djrscally@gmail.com/
> >>
> >> Series level changelog:
> >>
> >> 	- Added patch 5/8 to make clkdev_drop() NULL aware to simplify error
> >> 	handling.
> >> 	- Added patch 6/8 to add acpi_gpio_get_io_resource().
> >>
> >> This has been tested on a number of devices, but currently **not** on a device
> >> designed for ChromeOS, which we ideally need to do to ensure no regression
> >> caused by replacing the tps68470 MFD driver. Unfortunately, I don't have a
> >> device to test it on myself.
> >>
> >> =========== Original Cover Letter ===========
> >>
> >> At the moment in the kernel the ACPI _HID INT3472 is taken by the tps68470
> >> MFD driver, but that driver can only handle some of the cases of that _HID
> >> that we see. There are at least these three possibilities:
> >>
> >> 1. INT3472 devices that provide GPIOs through the usual framework and run
> >>    power and clocks through an operation region; this is the situation that
> >>    the current module handles and is seen on ChromeOS devices
> >> 2. INT3472 devices that provide GPIOs, plus clocks and regulators that are
> >>    meant to be driven through the usual frameworks, usually seen on devices
> >>    designed to run Windows
> >> 3. INT3472 devices that don't actually represent a physical tps68470, but
> >>    are being used as a convenient way of grouping a bunch of system GPIO
> >>    lines that are intended to enable power and clocks for sensors which
> >>    are called out as dependent on them. Also seen on devices designed to
> >>    run Windows.
> >>
> >> This series introduces a new module which registers:
> >>
> >> 1. An i2c driver that determines which scenario (#1 or #2) applies to the
> >>    machine and registers platform devices to be bound to GPIO, OpRegion,
> >>    clock and regulator drivers as appropriate.
> >> 2. A platform driver that binds to the dummy INT3472 devices described in
> >>    #3
> >>
> >> The platform driver for the dummy device registers the GPIO lines that
> >> enable the clocks and regulators to the sensors via those frameworks so
> >> that sensor drivers can consume them in the usual fashion. The existing
> >> GPIO and OpRegion tps68470 drivers will work with the i2c driver that's
> >> registered. Clock and regulator drivers are available but have not so far been
> >> tested, so aren't part of this series.
> >>
> >> The existing mfd/tps68470.c driver being thus superseded, it is removed.
> >>
> >> Thanks
> >> Dan
> >>
> >> Daniel Scally (8):
> >>   ACPI: scan: Extend acpi_walk_dep_device_list()
> >>   ACPI: scan: Add function to fetch dependent of acpi device
> >>   i2c: core: Add a format macro for I2C device names
> >>   gpiolib: acpi: Export acpi_get_gpiod()
> >>   clkdev: Make clkdev_drop() null aware
> >>   gpiolib: acpi: Add acpi_gpio_get_io_resource()
> >>   platform/x86: Add intel_skl_int3472 driver
> >>   mfd: tps68470: Remove tps68470 MFD driver
> >>
> >>  MAINTAINERS                                   |   5 +
> >>  drivers/acpi/ec.c                             |   2 +-
> >>  drivers/acpi/pmic/Kconfig                     |   2 +-
> >>  drivers/acpi/pmic/intel_pmic_chtdc_ti.c       |   2 +-
> >>  drivers/acpi/scan.c                           | 107 ++++-
> >>  drivers/clk/clkdev.c                          |   3 +
> >>  drivers/gpio/Kconfig                          |   2 +-
> >>  drivers/gpio/gpiolib-acpi.c                   |  61 ++-
> >>  drivers/i2c/i2c-core-acpi.c                   |   8 +-
> >>  drivers/i2c/i2c-core-base.c                   |   4 +-
> >>  drivers/mfd/Kconfig                           |  18 -
> >>  drivers/mfd/Makefile                          |   1 -
> >>  drivers/mfd/tps68470.c                        |  97 -----
> >>  drivers/platform/surface/aggregator/core.c    |   6 +-
> >>  drivers/platform/surface/surface3_power.c     |  22 +-
> >>  .../platform/surface/surface_acpi_notify.c    |   7 +-
> >>  drivers/platform/x86/Kconfig                  |   2 +
> >>  drivers/platform/x86/Makefile                 |   1 +
> >>  drivers/platform/x86/intel-int3472/Kconfig    |  31 ++
> >>  drivers/platform/x86/intel-int3472/Makefile   |   5 +
> >>  .../intel_skl_int3472_clk_and_regulator.c     | 195 +++++++++
> >>  .../intel-int3472/intel_skl_int3472_common.c  | 106 +++++
> >>  .../intel-int3472/intel_skl_int3472_common.h  | 113 +++++
> >>  .../intel_skl_int3472_discrete.c              | 409 ++++++++++++++++++
> >>  .../intel_skl_int3472_tps68470.c              | 109 +++++
> >>  include/acpi/acpi_bus.h                       |   8 +
> >>  include/linux/acpi.h                          |  11 +-
> >>  include/linux/gpio/consumer.h                 |   2 +
> >>  include/linux/i2c.h                           |   3 +
> >>  29 files changed, 1175 insertions(+), 167 deletions(-)
> >>  delete mode 100644 drivers/mfd/tps68470.c
> >>  create mode 100644 drivers/platform/x86/intel-int3472/Kconfig
> >>  create mode 100644 drivers/platform/x86/intel-int3472/Makefile
> >>  create mode 100644 drivers/platform/x86/intel-int3472/intel_skl_int3472_clk_and_regulator.c
> >>  create mode 100644 drivers/platform/x86/intel-int3472/intel_skl_int3472_common.c
> >>  create mode 100644 drivers/platform/x86/intel-int3472/intel_skl_int3472_common.h
> >>  create mode 100644 drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c
> >>  create mode 100644 drivers/platform/x86/intel-int3472/intel_skl_int3472_tps68470.c
> >>
> 

-- 
With Best Regards,
Andy Shevchenko


