Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A0BA39F27D
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Jun 2021 11:33:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229678AbhFHJfo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Jun 2021 05:35:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229548AbhFHJfo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Jun 2021 05:35:44 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70051C061574;
        Tue,  8 Jun 2021 02:33:51 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 562F73E6;
        Tue,  8 Jun 2021 11:33:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623144829;
        bh=OFltWdjgbl2i1zvXlb4e6VeZ33EjH6WYdsDnL6NUN0Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=A2xCVhCp4hsB4y/r2Ch1xBKDyPLc0U9DeHLpx8CxUxrNxj8qqHE+MqnDpGvEKjnq7
         Ip3CexhiOlo/1sCdXGrBt3TNcbuyjpP9kJ1n91fGPc4t3hNYnp4x+zsiINKrlYg+nn
         WpO75bogCTLyYX9kkftBFKO/j/TDEVrws9cjKBcU=
Date:   Tue, 8 Jun 2021 12:33:34 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Daniel Scally <djrscally@gmail.com>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Lee Jones <lee.jones@linaro.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, devel@acpica.org,
        Len Brown <lenb@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Wolfram Sang <wsa@kernel.org>,
        Mark Gross <mgross@linux.intel.com>,
        Robert Moore <robert.moore@intel.com>,
        Erik Kaneda <erik.kaneda@intel.com>,
        kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v5 0/6] Introduce intel_skl_int3472 module
Message-ID: <YL85bqGwuBXkoqy3@pendragon.ideasonboard.com>
References: <20210603224007.120560-1-djrscally@gmail.com>
 <4400512a-b788-7074-d3c6-0ec228b43d7e@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4400512a-b788-7074-d3c6-0ec228b43d7e@redhat.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Hans,

On Tue, Jun 08, 2021 at 11:00:24AM +0200, Hans de Goede wrote:
> On 6/4/21 12:40 AM, Daniel Scally wrote:
> > Hello all
> > 
> > Bit longer than hoped but here's v5.
> > 
> > v4:
> > https://lore.kernel.org/lkml/20210520140928.3252671-1-djrscally@gmail.com/
> > 
> > v3
> > https://lore.kernel.org/lkml/20210222130735.1313443-1-djrscally@gmail.com/
> > 
> > v2
> > https://lore.kernel.org/platform-driver-x86/20210118003428.568892-1-djrscally@gmail.com/
> > 
> > v1
> > https://lore.kernel.org/linux-media/20201130133129.1024662-1-djrscally@gmail.com/T/#m91934e12e3d033da2e768e952ea3b4a125ee3e67
> > 
> > The only changes are the dropped patches, renamed functions in 2/6 and most of
> > Andy's suggestions on 5/6 - I didn't hit them all yet but didn't want to delay
> > this any more.
> > 
> > Series level changelog:
> > 
> > 	- Dropped all but the essential patches to simplify merge plan - thanks
> > 	Hans.
> 
> Thank you. Andy has already sends me a pull-req for the gpiolib-acpi changes
> and I expect Rafael to send me a pull-req (from an immutable branch) for the
> ACPI bits soon-ish.
> 
> When I merge those both into pdx86 I should be able to pick-up 5/6.
> 
> Given the long time this has been in the making I'm tempted to do that
> (pick up 5/6 as is) and then we can do further cleanups like looking into
> using the existing fixed-regulator code later. My mean reason to do this
> would be to get this code into the hands of users starting with the 5.14
> kernel.

That would be great !

> So question, how usable is this (from the kernel pov, I know userspace
> needs work too) once I merge 5/6. Is the kernel-side support for the cameras
> on some Surface devices then complete or are more patches necessary in
> other subsystems ?

Camera sensor drivers are the other piece of the puzzle that is
required. Daniel is working on an ov5693 driver which can be found at
https://github.com/djrscally/media_tree/tree/ov5693-v2. It's nearing
completion too.

With those two pieces, we have support for the Microsoft Surface Go 2 in
libcamera, as well as a few other devices whose exact model escapes me
at this minute.

> Note another advantage of just merging 5/6 as is and doing the fixed-regulator
> bits on top, is that having those in a separate commit makes it easier to
> see if these indeed result in a nice cleanup (vs sticking with the current code).
> 
> > Daniel Scally (6):
> >   ACPI: scan: Extend acpi_walk_dep_device_list()
> >   ACPI: scan: Add function to fetch dependent of acpi device
> >   gpiolib: acpi: Export acpi_get_gpiod()
> >   gpiolib: acpi: Add acpi_gpio_get_io_resource()
> >   platform/x86: Add intel_skl_int3472 driver
> >   mfd: tps68470: Remove tps68470 MFD driver
> > 
> >  MAINTAINERS                                   |   5 +
> >  drivers/acpi/ec.c                             |   2 +-
> >  drivers/acpi/pmic/Kconfig                     |   2 +-
> >  drivers/acpi/pmic/intel_pmic_chtdc_ti.c       |   2 +-
> >  drivers/acpi/scan.c                           | 104 ++++-
> >  drivers/gpio/Kconfig                          |   2 +-
> >  drivers/gpio/gpiolib-acpi.c                   |  61 ++-
> >  drivers/i2c/i2c-core-acpi.c                   |   8 +-
> >  drivers/mfd/Kconfig                           |  18 -
> >  drivers/mfd/Makefile                          |   1 -
> >  drivers/mfd/tps68470.c                        |  97 ----
> >  drivers/platform/surface/aggregator/core.c    |   6 +-
> >  drivers/platform/surface/surface3_power.c     |  22 +-
> >  .../platform/surface/surface_acpi_notify.c    |   7 +-
> >  drivers/platform/x86/Kconfig                  |   2 +
> >  drivers/platform/x86/Makefile                 |   1 +
> >  drivers/platform/x86/intel-int3472/Kconfig    |  30 ++
> >  drivers/platform/x86/intel-int3472/Makefile   |   5 +
> >  .../intel_skl_int3472_clk_and_regulator.c     | 196 ++++++++
> >  .../intel-int3472/intel_skl_int3472_common.c  | 106 +++++
> >  .../intel-int3472/intel_skl_int3472_common.h  | 118 +++++
> >  .../intel_skl_int3472_discrete.c              | 417 ++++++++++++++++++
> >  .../intel_skl_int3472_tps68470.c              | 137 ++++++
> >  include/acpi/acpi_bus.h                       |   8 +
> >  include/linux/acpi.h                          |  11 +-
> >  include/linux/gpio/consumer.h                 |   2 +
> >  26 files changed, 1205 insertions(+), 165 deletions(-)
> >  delete mode 100644 drivers/mfd/tps68470.c
> >  create mode 100644 drivers/platform/x86/intel-int3472/Kconfig
> >  create mode 100644 drivers/platform/x86/intel-int3472/Makefile
> >  create mode 100644 drivers/platform/x86/intel-int3472/intel_skl_int3472_clk_and_regulator.c
> >  create mode 100644 drivers/platform/x86/intel-int3472/intel_skl_int3472_common.c
> >  create mode 100644 drivers/platform/x86/intel-int3472/intel_skl_int3472_common.h
> >  create mode 100644 drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c
> >  create mode 100644 drivers/platform/x86/intel-int3472/intel_skl_int3472_tps68470.c

-- 
Regards,

Laurent Pinchart
