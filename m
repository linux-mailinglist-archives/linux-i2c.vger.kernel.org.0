Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B5025E5F9E
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Sep 2022 12:16:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231164AbiIVKQS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 22 Sep 2022 06:16:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231365AbiIVKQM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 22 Sep 2022 06:16:12 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 400D7DC109;
        Thu, 22 Sep 2022 03:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663841766; x=1695377766;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CQbqezvYNIyE8OGvExvDSF/Mp5tT/FBMWk7NZcof/JE=;
  b=YW+98jNztFzotEz4dji8AvyhvZ6OkXFjSAquJnp2suG+PN2xDe9fnQLt
   YjFDCZ8w/yrT/3TF74E17LzQ0eO8163Y8I9eMOR8mUHarusIEYhPmNaTU
   Z7gyhuwu1h/pHoQCCa1FQ7yaSzyTGYEiTheUYIbxyzkuOc69DHxxldYIK
   baCpnYK1gSiF/yti4qniOhMn8ZCbZ+mM0/9SLqdkQJJM8we86dJDBWlsL
   goQ+6tslRTvoy0zh8pUqsKVs6aB6h9s2R3oTvitEFC+5pD3/cjlxR1aUx
   zKiFFdtVAF5UeOO2GuvknOTFnRxgGK5tpxxp9iTlWFf/u2v5qegd2brGW
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10477"; a="301667567"
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; 
   d="scan'208";a="301667567"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2022 03:16:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; 
   d="scan'208";a="864801941"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga006.fm.intel.com with ESMTP; 22 Sep 2022 03:15:56 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1obJFJ-005xRh-20;
        Thu, 22 Sep 2022 13:15:53 +0300
Date:   Thu, 22 Sep 2022 13:15:53 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Raul E Rangel <rrangel@chromium.org>
Cc:     linux-acpi@vger.kernel.org, linux-input@vger.kernel.org,
        rafael@kernel.org, timvp@google.com,
        mika.westerberg@linux.intel.com, dmitry.torokhov@gmail.com,
        jingle.wu@emc.com.tw, hdegoede@redhat.com,
        mario.limonciello@amd.com, linus.walleij@linaro.org,
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
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v5 00/13] acpi: i2c: Use SharedAndWake and
 ExclusiveAndWake to enable wake irq
Message-ID: <Yyw12S3pstNrbGFO@smile.fi.intel.com>
References: <20220921155205.1332614-1-rrangel@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220921155205.1332614-1-rrangel@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Sep 21, 2022 at 09:51:52AM -0600, Raul E Rangel wrote:
> Today, i2c drivers are making the assumption that their IRQs can also
> be used as wake IRQs. This isn't always the case and it can lead to
> spurious wakes. This has recently started to affect AMD Chromebooks.
> With the introduction of
> d62bd5ce12d7 ("pinctrl: amd: Implement irq_set_wake"), the AMD GPIO
> controller gained the capability to set the wake bit on each GPIO. The
> ACPI specification defines two ways to inform the system if a device is
> wake capable:
> 1) The _PRW object defines the GPE that can be used to wake the system.
> 2) Setting ExclusiveAndWake or SharedAndWake in the _CRS GpioInt.
> 
> Currently only the first method is supported. The i2c drivers don't have
> any indication that the IRQ is wake capable, so they guess. This causes
> spurious interrupts, for example:
> * We have an ACPI HID device that has `_PR0` and `_PR3`. It doesn't have
>   `_PRW` or `ExclusiveAndWake` so that means the device can't wake the
>   system.
> * The IRQ line is active level low for this device and is pulled up by
>   the power resource defined in `_PR0`/`_PR3`.
> * The i2c driver will (incorrectly) arm the GPIO for wake by calling
>   `enable_irq_wake` as part of its suspend hook.
> * ACPI will power down the device since it doesn't have a wake GPE
>   associated with it.
> * When the device is powered down, the IRQ line will drop, and it will
>   trigger a wake event.
> 
> See the following debug log:
> [   42.335804] PM: Suspending system (s2idle)
> [   42.340186] amd_gpio AMD0030:00: RX: Setting wake for pin 89 to enable
> [   42.467736]     power-0416 __acpi_power_off      : Power resource [PR00] turned off
> [   42.467739] device_pm-0280 device_set_power      : Device [H05D] transitioned to D3cold
> [   42.475210] PM: pm_system_irq_wakeup: 11 triggered pinctrl_amd
> [   42.535293] PM: Wakeup unrelated to ACPI SCI
> [   42.535294] PM: resume from suspend-to-idle
> 
> In order to fix this, we need to take into account the wake capable bit
> defined on the Interrupt/GpioInt. This is accomplished by:
> * Migrating some of the i2c drivers over to using the PM subsystem to
>   manage the wake IRQ.
> * Expose the wake_capable bit from the ACPI Interrupt/GpioInt resource
>   to the  i2c core.
> * Use the wake_capable bit in the i2c core to call
>   `dev_pm_set_wake_irq`. This reuses the existing device tree flow.
> * Make the i2c drivers stop calling `dev_pm_set_wake_irq` since it's now
>   handled by the i2c core.
> * Make the ACPI device PM system aware of the wake_irq. This is
>   necessary so the device doesn't incorrectly get powered down when a
>   wake_irq is enabled.
> 
> I've tested this code with various combinations of having _PRW,
> ExclusiveAndWake and power resources all defined or not defined, but it
> would be great if others could test this out on their hardware.
> 
> I'm sure this will surface some devices where the IRQs were not
> correctly marked as wake capable. Ideally the firmware can be fixed, but
> if not we can work around this in the kernel by providing a board
> specific `struct i2c_board_info` with the `I2C_CLIENT_WAKE` flag set.
> See `chromeos_laptop.c` for an example of matching DMI properties and
> setting the `I2C_CLIENT_WAKE` override.
> 
> Thanks,
> Raul
> 
> Changes in v5:
> - Added Acked-by: Benjamin Tissoires
> - Removed clang-format white space changes
> - Check irq return value before updating wake_capable pointer

You are too fast with a new versions... I have comment on the v4 and I believe
it applicable here (not settled yet).

> - Go back to using adev->wakeup.flags.valid to keep the diff cleaner
> - Fix a typo in comment
> 
> Changes in v4:
> - Added Reviewed-by
> - Reformatted with 96 char limit
> - Added Reviewed-by
> - Reformatted with 96 char limit
> - Removed unnecessary !!
> - Removed unrelated whitespace change
> - Added Reviewed-by
> - Renamed i2c_acpi_add_resource to i2c_acpi_add_irq_resource
> - Expanded logic in i2c_acpi_add_i2c_resource to make it easier to read
> 
> Changes in v3:
> - Kept `acpi_dev_gpio_irq_get_by` unchanged to avoid having to touch
>   unrelated drivers.
> - Converted wake_capable parameter to bool.
> - Fixed bad indent
> - Convert wake_capable to bool
> - Only update wake_capable pointer once
> - Move wake_capable local into local block
> 
> Changes in v2:
> - Added elants_i2c to series
> - Added raydium_ts_i2c to series
> - Fixed call site in mlxbf_gige_probe
> - Added ability to extract wake bit from Interrupt/IRQ resources
> - Look at wake_cabple bit for IRQ/Interrupt resources
> - I chose not to keep the legacy code around since systems without DT or ACPI should be rare.
> 
> Raul E Rangel (13):
>   HID: i2c-hid: Use PM subsystem to manage wake irq
>   Input: elan_i2c - Use PM subsystem to manage wake irq
>   Input: elants_i2c - Use PM subsystem to manage wake irq
>   Input: raydium_ts_i2c - Use PM subsystem to manage wake irq
>   gpiolib: acpi: Add wake_capable variants of acpi_dev_gpio_irq_get
>   ACPI: resources: Add wake_capable parameter to acpi_dev_irq_flags
>   i2c: acpi: Use ACPI wake capability bit to set wake_irq
>   ACPI: PM: Take wake IRQ into consideration when entering
>     suspend-to-idle
>   HID: i2c-hid: acpi: Stop setting wakeup_capable
>   HID: i2c-hid: Don't set wake_capable and wake_irq
>   Input: elan_i2c - Don't set wake_capable and wake_irq
>   Input: elants_i2c - Don't set wake_capable and wake_irq
>   Input: raydium_ts_i2c - Don't set wake_capable and wake_irq
> 
>  drivers/acpi/device_pm.c                   | 19 +++++++++--
>  drivers/acpi/irq.c                         |  8 +++--
>  drivers/acpi/resource.c                    | 16 +++++++---
>  drivers/gpio/gpiolib-acpi.c                | 15 +++++++--
>  drivers/gpio/gpiolib-acpi.h                |  2 ++
>  drivers/hid/i2c-hid/i2c-hid-acpi.c         |  5 ---
>  drivers/hid/i2c-hid/i2c-hid-core.c         | 24 ++------------
>  drivers/i2c/i2c-core-acpi.c                | 37 ++++++++++++++++------
>  drivers/i2c/i2c-core-base.c                |  6 +++-
>  drivers/i2c/i2c-core.h                     |  4 +--
>  drivers/input/mouse/elan_i2c_core.c        | 15 +--------
>  drivers/input/touchscreen/elants_i2c.c     | 13 ++------
>  drivers/input/touchscreen/raydium_i2c_ts.c |  7 +---
>  drivers/pnp/pnpacpi/rsparser.c             |  7 ++--
>  include/linux/acpi.h                       | 23 +++++++++++---
>  include/linux/ioport.h                     |  3 +-
>  16 files changed, 112 insertions(+), 92 deletions(-)
> 
> -- 
> 2.37.3.968.ga6b4b080e4-goog
> 

-- 
With Best Regards,
Andy Shevchenko


