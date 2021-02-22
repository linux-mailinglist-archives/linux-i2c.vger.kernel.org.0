Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3829321A1B
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Feb 2021 15:20:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230393AbhBVOTG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Feb 2021 09:19:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231633AbhBVOQp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 22 Feb 2021 09:16:45 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00AA3C06178B;
        Mon, 22 Feb 2021 06:16:05 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id c19so8634188pjq.3;
        Mon, 22 Feb 2021 06:16:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MuRf9/8b8K4IIlZM2nZP16CBZ8tDQb2s0kmOZ82ah7g=;
        b=la0El+ftwtmu5M03fzpfMVvgBdVuRP3q4ZiVGvwFO53W1pSflIkeMM/mLsuc//DbuA
         QRhI1h4hB8VXAF16KpdwJq6snysYR/FKx7iBpYm/2wW9mLxbZt+zFxoYV+hYvxT2Ggff
         6y03xiPi06tgGt+Es945HsXGJj9uQ1h5QrXf0ok/De/BXAD/VI5hsk+N+nR979u48HXv
         w03SWlmlRotFvqL8UJzfdcM5iMxd8S4xhAJavUbrvyxrJUDqQDyJrRgPZAjcfaOapafA
         88T/ub89tKwE7LkdWQIykWxc+LIUt1trusz17x/lNug6OmgOLBtaK3DVQQBnM4Z0jIdL
         erkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MuRf9/8b8K4IIlZM2nZP16CBZ8tDQb2s0kmOZ82ah7g=;
        b=GhXT66XY6XJloBFO3GiJwfPE9JxYQ9Z/gIjqeA0fkfuhwFX634sF1ZzT6KdLsnnrli
         0B4x3MyQpjKd1GbT8EqWLFk1yj2Et8te69U3ZTHGoTUoSAT1zGzXMyC+WRNijcFiygzZ
         8ZLemxCcTneLn3qA+5RfEYJS+Ws+GKsJ2rr3r8iVoIkbIdGSKCnCQT30GTvddRMwGi2Z
         qpEqSSOL6uxaMx+WnUuwq/3ITWuGtRC+SfG3Pwtjq/Vkes6SPdmPn2bqOKtOsubnr3kc
         JmY8GVGeJXXxKVQzxKo6zGfbcYcci94Lsmay/liO/kwhPZBCeChyq18FzX7QBGGiyFox
         WoVg==
X-Gm-Message-State: AOAM530y/rV3FneSpfKzJg8wzsMBwyPZfb3lKFwSNAsWYOeVGyQsYl3D
        1jNLuw3fypCIfk3nQDMtUc3bdvduy1jiDKTHtiM=
X-Google-Smtp-Source: ABdhPJyceCFX4/m8npDBtOmCtRQbAXk3yI2ti/FWHXAMEjlS4lgPJ5ZE3mk9mm2xvEKRzIgsqCPax1EQlAX7Uetnftw=
X-Received: by 2002:a17:90b:3d8:: with SMTP id go24mr24474065pjb.181.1614003364468;
 Mon, 22 Feb 2021 06:16:04 -0800 (PST)
MIME-Version: 1.0
References: <20210222130735.1313443-1-djrscally@gmail.com>
In-Reply-To: <20210222130735.1313443-1-djrscally@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 22 Feb 2021 16:15:48 +0200
Message-ID: <CAHp75Vfu678RQ1-p4rXOkp5UPDuxgW4ctm1w+uEFhumcfGXf1g@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] Introduce intel_skl_int3472 module
To:     Daniel Scally <djrscally@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Dmitry Torokhov <dtor@chromium.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Rajmohan Mani <rajmohan.mani@intel.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Len Brown <lenb@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Wolfram Sang <wsa@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        kieran.bingham+renesas@ideasonboard.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Robert Moore <robert.moore@intel.com>,
        Erik Kaneda <erik.kaneda@intel.com>, me@fabwu.ch,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        devel@acpica.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Feb 22, 2021 at 3:11 PM Daniel Scally <djrscally@gmail.com> wrote:
>
> v1 for this series was originally 14-18 of this series:
> https://lore.kernel.org/linux-media/20201130133129.1024662-1-djrscally@gmail.com/T/#m91934e12e3d033da2e768e952ea3b4a125ee3e67
>
> v2 was here:
> https://lore.kernel.org/platform-driver-x86/20210118003428.568892-1-djrscally@gmail.com/
>
> Series level changelog:
>
>         - Dropped the patch moving acpi_lpss_dep() to utils since it's not used
>         in acpi_dev_get_dependent_dev() anymore.
>         - Replaced it with a patch extending acpi_walk_dep_device_list() to be
>         able to apply a given callback against each device in acpi_dep_list
>         - Dropped the patch creating acpi_i2c_dev_name() and simply open coded
>         that functionality.
>
> This has been tested on a number of devices, but currently **not** on a device
> designed for ChromeOS, which we ideally need to do to ensure no regression
> caused by replacing the tps68470 MFD driver. Sakari / Tomasz, is there any way
> you could help with that? Unfortunately, I don't have a device to test it on
> myself.

+Cc: Dmitry and Guenter. Guys, do you know by a chance who can help
with the above request from Daniel?


> Original cover letter:
>
> At the moment in the kernel the ACPI _HID INT3472 is taken by the tps68470
> MFD driver, but that driver can only handle some of the cases of that _HID
> that we see. There are at least these three possibilities:
>
> 1. INT3472 devices that provide GPIOs through the usual framework and run
>    power and clocks through an operation region; this is the situation that
>    the current module handles and is seen on ChromeOS devices
> 2. INT3472 devices that provide GPIOs, plus clocks and regulators that are
>    meant to be driven through the usual frameworks, usually seen on devices
>    designed to run Windows
> 3. INT3472 devices that don't actually represent a physical tps68470, but
>    are being used as a convenient way of grouping a bunch of system GPIO
>    lines that are intended to enable power and clocks for sensors which
>    are called out as dependent on them. Also seen on devices designed to
>    run Windows.
>
> This series introduces a new module which registers:
>
> 1. An i2c driver that determines which scenario (#1 or #2) applies to the
>    machine and registers platform devices to be bound to GPIO, OpRegion,
>    clock and regulator drivers as appropriate.
> 2. A platform driver that binds to the dummy INT3472 devices described in
>    #3
>
> The platform driver for the dummy device registers the GPIO lines that
> enable the clocks and regulators to the sensors via those frameworks so
> that sensor drivers can consume them in the usual fashion. The existing
> GPIO and OpRegion tps68470 drivers will work with the i2c driver that's
> registered. Clock and regulator drivers are available but have not so far been
> tested, so aren't part of this series.
>
> The existing mfd/tps68470.c driver being thus superseded, it is removed.
>
> Thanks
> Dan
>
> Daniel Scally (6):
>   ACPI: scan: Extend acpi_walk_dep_device_list()
>   ACPI: scan: Add function to fetch dependent of acpi device
>   i2c: core: Add a format macro for I2C device names
>   gpiolib: acpi: Export acpi_get_gpiod()
>   platform/x86: Add intel_skl_int3472 driver
>   mfd: tps68470: Remove tps68470 MFD driver
>
>  MAINTAINERS                                   |   5 +
>  drivers/acpi/ec.c                             |   2 +-
>  drivers/acpi/pmic/Kconfig                     |   2 +-
>  drivers/acpi/pmic/intel_pmic_chtdc_ti.c       |   2 +-
>  drivers/acpi/scan.c                           |  92 ++-
>  drivers/gpio/Kconfig                          |   2 +-
>  drivers/gpio/gpiolib-acpi.c                   |  38 +-
>  drivers/i2c/i2c-core-acpi.c                   |   2 +-
>  drivers/i2c/i2c-core-base.c                   |   4 +-
>  drivers/mfd/Kconfig                           |  18 -
>  drivers/mfd/Makefile                          |   1 -
>  drivers/mfd/tps68470.c                        |  97 ---
>  drivers/platform/surface/surface3_power.c     |   2 +-
>  drivers/platform/x86/Kconfig                  |   2 +
>  drivers/platform/x86/Makefile                 |   1 +
>  drivers/platform/x86/intel-int3472/Kconfig    |  31 +
>  drivers/platform/x86/intel-int3472/Makefile   |   4 +
>  .../intel-int3472/intel_skl_int3472_common.c  | 106 ++++
>  .../intel-int3472/intel_skl_int3472_common.h  | 110 ++++
>  .../intel_skl_int3472_discrete.c              | 592 ++++++++++++++++++
>  .../intel_skl_int3472_tps68470.c              | 113 ++++
>  include/acpi/acpi_bus.h                       |   8 +
>  include/linux/acpi.h                          |   4 +-
>  include/linux/gpio/consumer.h                 |   7 +
>  include/linux/i2c.h                           |   3 +
>  25 files changed, 1100 insertions(+), 148 deletions(-)
>  delete mode 100644 drivers/mfd/tps68470.c
>  create mode 100644 drivers/platform/x86/intel-int3472/Kconfig
>  create mode 100644 drivers/platform/x86/intel-int3472/Makefile
>  create mode 100644 drivers/platform/x86/intel-int3472/intel_skl_int3472_common.c
>  create mode 100644 drivers/platform/x86/intel-int3472/intel_skl_int3472_common.h
>  create mode 100644 drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c
>  create mode 100644 drivers/platform/x86/intel-int3472/intel_skl_int3472_tps68470.c
>
> --
> 2.25.1
>


-- 
With Best Regards,
Andy Shevchenko
