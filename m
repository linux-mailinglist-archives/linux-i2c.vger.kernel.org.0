Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F57A5C01BD
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Sep 2022 17:38:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229804AbiIUPib (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 21 Sep 2022 11:38:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231247AbiIUPiF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 21 Sep 2022 11:38:05 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44A92A00C3
        for <linux-i2c@vger.kernel.org>; Wed, 21 Sep 2022 08:34:12 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id c7so6283278pgt.11
        for <linux-i2c@vger.kernel.org>; Wed, 21 Sep 2022 08:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=UTdfe4rE8KI1C0mMzwUzNNTbt7cLPfJiUPMCCT6i1bw=;
        b=GhMRIYK+BNavL7wlB7IPzB3C5ER/d3XvUFqXlz7Cv/yEpFsy2iiHXyQf2dtXFbe61Y
         Y3UIer9yzgVe6lHcu10PgJsD8yuSm55/lpuzm+Xlrfyaoa8/WHRamtLoOhOVKVlCRw5P
         uRv0Ysw/ekeuqatl7Akd+W6Kv5ZDs6Midmy28=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=UTdfe4rE8KI1C0mMzwUzNNTbt7cLPfJiUPMCCT6i1bw=;
        b=S2VQadU44c+EIdEkPvteEBCsMJMplXEzxthvIjcSaQI4Q8DEQyeErxjI5LG+oUGODQ
         u73oDhKF2WuDPueuO6Zsa1WuSWnkmc6ZcrTXv91AYwZrIO4r4DLmiFmP4TaySX0dQNex
         C4ziyXJMsZrF+8J55o1J5UnuPpAY4Fus1NHPgZ4pk77kLpVorMOiZMnrsdJD3Cp2mWzk
         4w8sqIdFrqVbAqz9KTJq/qqM63+O5TCii9vUdthX9d1d1k6fugm4nmmKI7E7o8EI/cTX
         l7RL41Srm56ETe+nW6Qr+b4TlH7C6P25OuDWHyOBm6r+Ga4158/D6h6mJETdFpx4sk3T
         dwxw==
X-Gm-Message-State: ACrzQf0WSr38s4nHOJiUejsv4mxLCkqmjmEE9rwkRabVicFXevTnndHm
        E1WmJnFzRa0pO4983whh/pXn31XLEXk0Yuyp
X-Google-Smtp-Source: AMsMyM7khfoDqzbkuIb8qlJK7gXYZVG5mL371XFRoRsEqwTdGDtr1SrP/dvc88yy2bjzEXtDTGTQ9Q==
X-Received: by 2002:a05:6a00:852:b0:544:5907:7520 with SMTP id q18-20020a056a00085200b0054459077520mr29012835pfk.31.1663774428686;
        Wed, 21 Sep 2022 08:33:48 -0700 (PDT)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com. [209.85.215.174])
        by smtp.gmail.com with ESMTPSA id h23-20020a631217000000b0043be67b6304sm1757868pgl.0.2022.09.21.08.33.47
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Sep 2022 08:33:48 -0700 (PDT)
Received: by mail-pg1-f174.google.com with SMTP id 78so6266652pgb.13
        for <linux-i2c@vger.kernel.org>; Wed, 21 Sep 2022 08:33:47 -0700 (PDT)
X-Received: by 2002:a6b:e003:0:b0:6a0:d55b:a3ae with SMTP id
 z3-20020a6be003000000b006a0d55ba3aemr11587226iog.167.1663774415900; Wed, 21
 Sep 2022 08:33:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220919155916.1044219-1-rrangel@chromium.org> <CAO-hwJKcpXQjvLuQK+wfqkU0LHxKbbAyNCZnQGxe47fm1o6LQw@mail.gmail.com>
In-Reply-To: <CAO-hwJKcpXQjvLuQK+wfqkU0LHxKbbAyNCZnQGxe47fm1o6LQw@mail.gmail.com>
From:   Raul Rangel <rrangel@chromium.org>
Date:   Wed, 21 Sep 2022 09:33:24 -0600
X-Gmail-Original-Message-ID: <CAHQZ30CSbsm0j15=gMbuwdeSOR6Z17tcwB+N1H2Vof5SuDPzew@mail.gmail.com>
Message-ID: <CAHQZ30CSbsm0j15=gMbuwdeSOR6Z17tcwB+N1H2Vof5SuDPzew@mail.gmail.com>
Subject: Re: [PATCH v4 00/13] acpi: i2c: Use SharedAndWake and
 ExclusiveAndWake to enable wake irq
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Linux ACPI <linux-acpi@vger.kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Tim Van Patten <timvp@google.com>,
        Hans De Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Mario Limonciello <mario.limonciello@amd.com>,
        jingle <jingle.wu@emc.com.tw>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alistair Francis <alistair@alistair23.me>,
        Angela Czubak <acz@semihalf.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Bartosz Szczepanek <bsz@semihalf.com>,
        Cai Huoqing <cai.huoqing@linux.dev>,
        Dan Williams <dan.j.williams@intel.com>,
        Douglas Anderson <dianders@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <groeck@chromium.org>,
        Jiri Kosina <jikos@kernel.org>,
        Johnny Chuang <johnny.chuang.emc@gmail.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Len Brown <lenb@kernel.org>, Rob Herring <robh@kernel.org>,
        Terry Bowman <terry.bowman@amd.com>,
        Wolfram Sang <wsa@kernel.org>,
        Yang Li <yang.lee@linux.alibaba.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
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

On Tue, Sep 20, 2022 at 4:43 AM Benjamin Tissoires
<benjamin.tissoires@redhat.com> wrote:
>
> On Mon, Sep 19, 2022 at 5:59 PM Raul E Rangel <rrangel@chromium.org> wrote:
> >
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
> > Changes in v4:
> > - Added Reviewed-by
> > - Reformatted with 96 char limit
> > - Removed unnecessary !!
> > - Removed unrelated white space change
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
> >  drivers/acpi/resource.c                    | 23 ++++++++++----
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
> >  16 files changed, 117 insertions(+), 94 deletions(-)
> >
>

> For the HID patches (1, 9, 10):
> Acked-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
>
> Feel free to take those through whatever tree is the best, we don't
> have anything scheduled for i2c-hid for 6.1 right now.
>
> Cheers,
> Benjamin
>
Great thanks! I'll include your Acked-By in the next round.
