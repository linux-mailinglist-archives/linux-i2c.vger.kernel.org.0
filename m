Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2EAC35E7E87
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Sep 2022 17:37:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232684AbiIWPha (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 23 Sep 2022 11:37:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232677AbiIWPh3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 23 Sep 2022 11:37:29 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17FF0145959
        for <linux-i2c@vger.kernel.org>; Fri, 23 Sep 2022 08:37:28 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id a3so856408lfk.9
        for <linux-i2c@vger.kernel.org>; Fri, 23 Sep 2022 08:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=OgoaLpQ3yLM8sL8g85b58XwiPLmA9EGQIhDG7GYJi/Y=;
        b=U/jIWxOgoFz/4fL9IY1kUApVA9JT478amyvIMeWn+/9l5MAalm8L5UP7GL2AGnSeMl
         7CBbhsMsGSptl1Oun9YGw0Zmrf99ZTtyT5p8SyCAZBw6AOWz30Jk92GSJSruLxlFcDdc
         xUL80VdSuztcNx/54xsQrJ46sp580eOx6lIpE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=OgoaLpQ3yLM8sL8g85b58XwiPLmA9EGQIhDG7GYJi/Y=;
        b=IPG4HV2ukNomXIXFjyJcHLjvy+z8p6zYB0WjopVXhZ7711kMuXx4j8CW+CxHpdGVuo
         7X6TUdz9l5DHimEXzPpv3p4x2L7sJpJDTszjJNK7wd0CpHX35lp/QJ/tJrfQOzc3kKDK
         O8HjKQvzzydM0b6YzW7F426NCzlVyIBXm6n4g44UjPE8icxQODAS7+mIhmAg3+qe8Np7
         UVnedhdhW66WuwTVVtc0HM9ii3PizRvarDu8hj08MaUSeahNXZOumhVfFtV4vJX3LqI8
         fRCa1K4rqU1EMr3N+CCGUaAS3K/LCJydzBVyHJJrwNHp0Lpsf6+Pwo6EQlagjXK61K5B
         XCmQ==
X-Gm-Message-State: ACrzQf2CZzD0A4ZIFPmhlF+M7eGZiHEkT8whR93aSN194FJhLB+6lFk7
        kZd4Yyhj7B9BcPgH/BtGBASXEIw8AWdBhAMv
X-Google-Smtp-Source: AMsMyM4q/HhcObCXjtkfxjD5nQbJbc1FQmX5L2ujoIMgalu01KHLunEeTp3sLBLTE/EmQD2dGcIFFw==
X-Received: by 2002:a05:6512:2210:b0:499:d710:9c0d with SMTP id h16-20020a056512221000b00499d7109c0dmr3815118lfu.325.1663947446204;
        Fri, 23 Sep 2022 08:37:26 -0700 (PDT)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com. [209.85.208.181])
        by smtp.gmail.com with ESMTPSA id p10-20020ac246ca000000b0049f54a976e3sm1509270lfo.58.2022.09.23.08.37.25
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Sep 2022 08:37:25 -0700 (PDT)
Received: by mail-lj1-f181.google.com with SMTP id g20so482422ljg.7
        for <linux-i2c@vger.kernel.org>; Fri, 23 Sep 2022 08:37:25 -0700 (PDT)
X-Received: by 2002:a05:6512:ba1:b0:498:9890:1bb4 with SMTP id
 b33-20020a0565120ba100b0049898901bb4mr3294634lfv.122.1663947434871; Fri, 23
 Sep 2022 08:37:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220921155205.1332614-1-rrangel@chromium.org> <Yyw12S3pstNrbGFO@smile.fi.intel.com>
In-Reply-To: <Yyw12S3pstNrbGFO@smile.fi.intel.com>
From:   Raul Rangel <rrangel@chromium.org>
Date:   Fri, 23 Sep 2022 09:37:03 -0600
X-Gmail-Original-Message-ID: <CAHQZ30BpkQ4R-Wh_9zaUeFWVSJm79ebu5Lp4Xx=R6RUx_KYrrg@mail.gmail.com>
Message-ID: <CAHQZ30BpkQ4R-Wh_9zaUeFWVSJm79ebu5Lp4Xx=R6RUx_KYrrg@mail.gmail.com>
Subject: Re: [PATCH v5 00/13] acpi: i2c: Use SharedAndWake and
 ExclusiveAndWake to enable wake irq
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linux ACPI <linux-acpi@vger.kernel.org>,
        linux-input <linux-input@vger.kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Tim Van Patten <timvp@google.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "jingle.wu" <jingle.wu@emc.com.tw>,
        Hans de Goede <hdegoede@redhat.com>,
        "Limonciello, Mario" <mario.limonciello@amd.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alistair Francis <alistair@alistair23.me>,
        Angela Czubak <acz@semihalf.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Bartosz Szczepanek <bsz@semihalf.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Cai Huoqing <cai.huoqing@linux.dev>,
        Dan Williams <dan.j.williams@intel.com>,
        Douglas Anderson <dianders@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <groeck@chromium.org>,
        Jiri Kosina <jikos@kernel.org>,
        Johnny Chuang <johnny.chuang.emc@gmail.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Len Brown <lenb@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Rob Herring <robh@kernel.org>,
        Terry Bowman <terry.bowman@amd.com>, Tom Rix <trix@redhat.com>,
        Wolfram Sang <wsa@kernel.org>,
        Yang Li <yang.lee@linux.alibaba.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Sep 22, 2022 at 4:16 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Sep 21, 2022 at 09:51:52AM -0600, Raul E Rangel wrote:
> > Today, i2c drivers are making the assumption that their IRQs can also
> > be used as wake IRQs. This isn't always the case and it can lead to
> > spurious wakes. This has recently started to affect AMD Chromebooks.
> > With the introduction of
> > d62bd5ce12d7 ("pinctrl: amd: Implement irq_set_wake"), the AMD GPIO
> > controller gained the capability to set the wake bit on each GPIO. The
> > ACPI specification defines two ways to inform the system if a device is
> > wake capable:
> > 1) The _PRW object defines the GPE that can be used to wake the system.
> > 2) Setting ExclusiveAndWake or SharedAndWake in the _CRS GpioInt.
> >
> > Currently only the first method is supported. The i2c drivers don't have
> > any indication that the IRQ is wake capable, so they guess. This causes
> > spurious interrupts, for example:
> > * We have an ACPI HID device that has `_PR0` and `_PR3`. It doesn't have
> >   `_PRW` or `ExclusiveAndWake` so that means the device can't wake the
> >   system.
> > * The IRQ line is active level low for this device and is pulled up by
> >   the power resource defined in `_PR0`/`_PR3`.
> > * The i2c driver will (incorrectly) arm the GPIO for wake by calling
> >   `enable_irq_wake` as part of its suspend hook.
> > * ACPI will power down the device since it doesn't have a wake GPE
> >   associated with it.
> > * When the device is powered down, the IRQ line will drop, and it will
> >   trigger a wake event.
> >
> > See the following debug log:
> > [   42.335804] PM: Suspending system (s2idle)
> > [   42.340186] amd_gpio AMD0030:00: RX: Setting wake for pin 89 to enable
> > [   42.467736]     power-0416 __acpi_power_off      : Power resource [PR00] turned off
> > [   42.467739] device_pm-0280 device_set_power      : Device [H05D] transitioned to D3cold
> > [   42.475210] PM: pm_system_irq_wakeup: 11 triggered pinctrl_amd
> > [   42.535293] PM: Wakeup unrelated to ACPI SCI
> > [   42.535294] PM: resume from suspend-to-idle
> >
> > In order to fix this, we need to take into account the wake capable bit
> > defined on the Interrupt/GpioInt. This is accomplished by:
> > * Migrating some of the i2c drivers over to using the PM subsystem to
> >   manage the wake IRQ.
> > * Expose the wake_capable bit from the ACPI Interrupt/GpioInt resource
> >   to the  i2c core.
> > * Use the wake_capable bit in the i2c core to call
> >   `dev_pm_set_wake_irq`. This reuses the existing device tree flow.
> > * Make the i2c drivers stop calling `dev_pm_set_wake_irq` since it's now
> >   handled by the i2c core.
> > * Make the ACPI device PM system aware of the wake_irq. This is
> >   necessary so the device doesn't incorrectly get powered down when a
> >   wake_irq is enabled.
> >
> > I've tested this code with various combinations of having _PRW,
> > ExclusiveAndWake and power resources all defined or not defined, but it
> > would be great if others could test this out on their hardware.
> >
> > I'm sure this will surface some devices where the IRQs were not
> > correctly marked as wake capable. Ideally the firmware can be fixed, but
> > if not we can work around this in the kernel by providing a board
> > specific `struct i2c_board_info` with the `I2C_CLIENT_WAKE` flag set.
> > See `chromeos_laptop.c` for an example of matching DMI properties and
> > setting the `I2C_CLIENT_WAKE` override.
> >
> > Thanks,
> > Raul
> >
> > Changes in v5:
> > - Added Acked-by: Benjamin Tissoires
> > - Removed clang-format white space changes
> > - Check irq return value before updating wake_capable pointer
>

> You are too fast with a new versions... I have comment on the v4 and I believe
> it applicable here (not settled yet).
>

I'll send out a new series with the change.

> > - Go back to using adev->wakeup.flags.valid to keep the diff cleaner
> > - Fix a typo in comment
> >
> > Changes in v4:
> > - Added Reviewed-by
> > - Reformatted with 96 char limit
> > - Added Reviewed-by
> > - Reformatted with 96 char limit
> > - Removed unnecessary !!
> > - Removed unrelated whitespace change
> > - Added Reviewed-by
> > - Renamed i2c_acpi_add_resource to i2c_acpi_add_irq_resource
> > - Expanded logic in i2c_acpi_add_i2c_resource to make it easier to read
> >
> > Changes in v3:
> > - Kept `acpi_dev_gpio_irq_get_by` unchanged to avoid having to touch
> >   unrelated drivers.
> > - Converted wake_capable parameter to bool.
> > - Fixed bad indent
> > - Convert wake_capable to bool
> > - Only update wake_capable pointer once
> > - Move wake_capable local into local block
> >
> > Changes in v2:
> > - Added elants_i2c to series
> > - Added raydium_ts_i2c to series
> > - Fixed call site in mlxbf_gige_probe
> > - Added ability to extract wake bit from Interrupt/IRQ resources
> > - Look at wake_cabple bit for IRQ/Interrupt resources
> > - I chose not to keep the legacy code around since systems without DT or ACPI should be rare.
> >
> > Raul E Rangel (13):
> >   HID: i2c-hid: Use PM subsystem to manage wake irq
> >   Input: elan_i2c - Use PM subsystem to manage wake irq
> >   Input: elants_i2c - Use PM subsystem to manage wake irq
> >   Input: raydium_ts_i2c - Use PM subsystem to manage wake irq
> >   gpiolib: acpi: Add wake_capable variants of acpi_dev_gpio_irq_get
> >   ACPI: resources: Add wake_capable parameter to acpi_dev_irq_flags
> >   i2c: acpi: Use ACPI wake capability bit to set wake_irq
> >   ACPI: PM: Take wake IRQ into consideration when entering
> >     suspend-to-idle
> >   HID: i2c-hid: acpi: Stop setting wakeup_capable
> >   HID: i2c-hid: Don't set wake_capable and wake_irq
> >   Input: elan_i2c - Don't set wake_capable and wake_irq
> >   Input: elants_i2c - Don't set wake_capable and wake_irq
> >   Input: raydium_ts_i2c - Don't set wake_capable and wake_irq
> >
> >  drivers/acpi/device_pm.c                   | 19 +++++++++--
> >  drivers/acpi/irq.c                         |  8 +++--
> >  drivers/acpi/resource.c                    | 16 +++++++---
> >  drivers/gpio/gpiolib-acpi.c                | 15 +++++++--
> >  drivers/gpio/gpiolib-acpi.h                |  2 ++
> >  drivers/hid/i2c-hid/i2c-hid-acpi.c         |  5 ---
> >  drivers/hid/i2c-hid/i2c-hid-core.c         | 24 ++------------
> >  drivers/i2c/i2c-core-acpi.c                | 37 ++++++++++++++++------
> >  drivers/i2c/i2c-core-base.c                |  6 +++-
> >  drivers/i2c/i2c-core.h                     |  4 +--
> >  drivers/input/mouse/elan_i2c_core.c        | 15 +--------
> >  drivers/input/touchscreen/elants_i2c.c     | 13 ++------
> >  drivers/input/touchscreen/raydium_i2c_ts.c |  7 +---
> >  drivers/pnp/pnpacpi/rsparser.c             |  7 ++--
> >  include/linux/acpi.h                       | 23 +++++++++++---
> >  include/linux/ioport.h                     |  3 +-
> >  16 files changed, 112 insertions(+), 92 deletions(-)
> >
> > --
> > 2.37.3.968.ga6b4b080e4-goog
> >
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
