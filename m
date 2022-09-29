Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B924E5EFA24
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Sep 2022 18:19:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236088AbiI2QTg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 29 Sep 2022 12:19:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236169AbiI2QT0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 29 Sep 2022 12:19:26 -0400
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C21EA9DB57
        for <linux-i2c@vger.kernel.org>; Thu, 29 Sep 2022 09:19:21 -0700 (PDT)
Received: by mail-io1-xd29.google.com with SMTP id g8so1316056iob.0
        for <linux-i2c@vger.kernel.org>; Thu, 29 Sep 2022 09:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MXIVSMuAlBQ+2uSHmUHfHLOHcWF4zJCrevwd/gYh7dQ=;
        b=dsmioauJSX/3oatV6YYYUCM6wUugxdJ55wkiAT9yEJEv4LIHzw5FG0PgkXOAlwZn59
         hUKWeM1H6uEW+mxbWtyTrEIKyYQ+ZPeF3hxDEmf7GDwbA7fS/Z6wwuscpoajTudrI39X
         tquzl4O104NooQFCFGAnjWz4UmvZ4NXm/Y1Wk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MXIVSMuAlBQ+2uSHmUHfHLOHcWF4zJCrevwd/gYh7dQ=;
        b=Nh0ekPBXV1GSW62Ldlgx2JbaFGGPUDp9drAfXFAp/L8IJmrTqVtN2lCxexkgZTKzIJ
         vjwcO1FbB4Jz3ztD8RQqCjSiGfCixaI+IW3/wRALftjp8O0i/O75zW5JKekweR/TqpGx
         WM8+55LWAr0f2rHr/qXkCNshYHUgPJjhQeXFDhzctScJSV3U6Cf3M3Vjqq6KVD7Wt+x2
         dmu489f3v3AQtTbIFWB11iMnm85RHeSMc2RxXYbf03UW63GbrWcHpuKMX8uwj85b/jDz
         oT35VMQbgtx+NVYTqZhBSP+u5YsnVhhQlnOEOeYXSKWDou+T+ayuHSy4IJF9qxnlXtG3
         /41w==
X-Gm-Message-State: ACrzQf19urNryETHnBJ1erLNN4IQDs1vzUkmwtI9R2qpt4Rd4cA5ZYuW
        cBq6yIE0tmahNGYrGHFdo4RrfPXNBk0KJzXn
X-Google-Smtp-Source: AMsMyM48p648vCzLy0mzgB1SpfuUOV6UBxOwCPopt1gMezmSdZkKJCSvUHOMvuMmrY0rMqLArJW7Vw==
X-Received: by 2002:a05:6638:339e:b0:35a:39e5:ed46 with SMTP id h30-20020a056638339e00b0035a39e5ed46mr2306365jav.12.1664468361129;
        Thu, 29 Sep 2022 09:19:21 -0700 (PDT)
Received: from rrangel920.bld.corp.google.com (h24-56-189-219.arvdco.broadband.dynamic.tds.net. [24.56.189.219])
        by smtp.gmail.com with ESMTPSA id f12-20020a02848c000000b0035aab2f1ab1sm2965451jai.134.2022.09.29.09.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 09:19:20 -0700 (PDT)
From:   Raul E Rangel <rrangel@chromium.org>
To:     linux-acpi@vger.kernel.org, linux-input@vger.kernel.org
Cc:     andriy.shevchenko@linux.intel.com, dmitry.torokhov@gmail.com,
        hdegoede@redhat.com, rafael@kernel.org,
        mika.westerberg@linux.intel.com, mario.limonciello@amd.com,
        timvp@google.com, linus.walleij@linaro.org, jingle.wu@emc.com.tw,
        Raul E Rangel <rrangel@chromium.org>,
        Alistair Francis <alistair@alistair23.me>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Bartosz Szczepanek <bsz@semihalf.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
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
Subject: [PATCH v6 00/13] acpi: i2c: Use SharedAndWake and ExclusiveAndWake to enable wake irq
Date:   Thu, 29 Sep 2022 10:19:04 -0600
Message-Id: <20220929161917.2348231-1-rrangel@chromium.org>
X-Mailer: git-send-email 2.37.3.998.g577e59143f-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Today, i2c drivers are making the assumption that their IRQs can also
be used as wake IRQs. This isn't always the case and it can lead to
spurious wakes. This has recently started to affect AMD Chromebooks.
With the introduction of
d62bd5ce12d7 ("pinctrl: amd: Implement irq_set_wake"), the AMD GPIO
controller gained the capability to set the wake bit on each GPIO. The
ACPI specification defines two ways to inform the system if a device is
wake capable:
1) The _PRW object defines the GPE that can be used to wake the system.
2) Setting ExclusiveAndWake or SharedAndWake in the _CRS GpioInt.

Currently only the first method is supported. The i2c drivers don't have
any indication that the IRQ is wake capable, so they guess. This causes
spurious interrupts, for example:
* We have an ACPI HID device that has `_PR0` and `_PR3`. It doesn't have
  `_PRW` or `ExclusiveAndWake` so that means the device can't wake the
  system.
* The IRQ line is active level low for this device and is pulled up by
  the power resource defined in `_PR0`/`_PR3`.
* The i2c driver will (incorrectly) arm the GPIO for wake by calling
  `enable_irq_wake` as part of its suspend hook.
* ACPI will power down the device since it doesn't have a wake GPE
  associated with it.
* When the device is powered down, the IRQ line will drop, and it will
  trigger a wake event.

See the following debug log:
[   42.335804] PM: Suspending system (s2idle)
[   42.340186] amd_gpio AMD0030:00: RX: Setting wake for pin 89 to enable
[   42.467736]     power-0416 __acpi_power_off      : Power resource [PR00] turned off
[   42.467739] device_pm-0280 device_set_power      : Device [H05D] transitioned to D3cold
[   42.475210] PM: pm_system_irq_wakeup: 11 triggered pinctrl_amd
[   42.535293] PM: Wakeup unrelated to ACPI SCI
[   42.535294] PM: resume from suspend-to-idle

In order to fix this, we need to take into account the wake capable bit
defined on the Interrupt/GpioInt. This is accomplished by:
* Migrating some of the i2c drivers over to using the PM subsystem to
  manage the wake IRQ.
* Expose the wake_capable bit from the ACPI Interrupt/GpioInt resource
  to the  i2c core.
* Use the wake_capable bit in the i2c core to call
  `dev_pm_set_wake_irq`. This reuses the existing device tree flow.
* Make the i2c drivers stop calling `dev_pm_set_wake_irq` since it's now
  handled by the i2c core.
* Make the ACPI device PM system aware of the wake_irq. This is
  necessary so the device doesn't incorrectly get powered down when a
  wake_irq is enabled.

I've tested this code with various combinations of having _PRW,
ExclusiveAndWake and power resources all defined or not defined, but it
would be great if others could test this out on their hardware.

I'm sure this will surface some devices where the IRQs were not
correctly marked as wake capable. Ideally the firmware can be fixed, but
if not we can work around this in the kernel by providing a board
specific `struct i2c_board_info` with the `I2C_CLIENT_WAKE` flag set.
See `chromeos_laptop.c` for an example of matching DMI properties and
setting the `I2C_CLIENT_WAKE` override.

Thanks,
Raul

Changes in v6:
- Return early when irq < 0
- Refactored to leave else clause

Changes in v5:
- Added Acked-by: Benjamin Tissoires
- Removed clang-format white space changes
- Check irq return value before updating wake_capable pointer
- Go back to using adev->wakeup.flags.valid to keep the diff cleaner
- Fix a typo in comment

Changes in v4:
- Added Reviewed-by
- Reformatted with 96 char limit
- Added Reviewed-by
- Reformatted with 96 char limit
- Removed unnecessary !!
- Removed unrelated whitespace change
- Added Reviewed-by
- Renamed i2c_acpi_add_resource to i2c_acpi_add_irq_resource
- Expanded logic in i2c_acpi_add_i2c_resource to make it easier to read

Changes in v3:
- Kept `acpi_dev_gpio_irq_get_by` unchanged to avoid having to touch
  unrelated drivers.
- Converted wake_capable parameter to bool.
- Fixed bad indent
- Convert wake_capable to bool
- Only update wake_capable pointer once
- Move wake_capable local into local block

Changes in v2:
- Added elants_i2c to series
- Added raydium_ts_i2c to series
- Fixed call site in mlxbf_gige_probe
- Added ability to extract wake bit from Interrupt/IRQ resources
- Look at wake_cabple bit for IRQ/Interrupt resources
- I chose not to keep the legacy code around since systems without DT or ACPI should be rare.

Raul E Rangel (13):
  HID: i2c-hid: Use PM subsystem to manage wake irq
  Input: elan_i2c - Use PM subsystem to manage wake irq
  Input: elants_i2c - Use PM subsystem to manage wake irq
  Input: raydium_ts_i2c - Use PM subsystem to manage wake irq
  gpiolib: acpi: Add wake_capable variants of acpi_dev_gpio_irq_get
  ACPI: resources: Add wake_capable parameter to acpi_dev_irq_flags
  i2c: acpi: Use ACPI wake capability bit to set wake_irq
  ACPI: PM: Take wake IRQ into consideration when entering
    suspend-to-idle
  HID: i2c-hid: acpi: Stop setting wakeup_capable
  HID: i2c-hid: Don't set wake_capable and wake_irq
  Input: elan_i2c - Don't set wake_capable and wake_irq
  Input: elants_i2c - Don't set wake_capable and wake_irq
  Input: raydium_ts_i2c - Don't set wake_capable and wake_irq

 drivers/acpi/device_pm.c                   | 15 ++++++++
 drivers/acpi/irq.c                         |  8 +++--
 drivers/acpi/resource.c                    | 16 ++++++---
 drivers/gpio/gpiolib-acpi.c                | 15 ++++++--
 drivers/gpio/gpiolib-acpi.h                |  2 ++
 drivers/hid/i2c-hid/i2c-hid-acpi.c         |  5 ---
 drivers/hid/i2c-hid/i2c-hid-core.c         | 24 ++-----------
 drivers/i2c/i2c-core-acpi.c                | 40 ++++++++++++++++------
 drivers/i2c/i2c-core-base.c                |  6 +++-
 drivers/i2c/i2c-core.h                     |  4 +--
 drivers/input/mouse/elan_i2c_core.c        | 15 +-------
 drivers/input/touchscreen/elants_i2c.c     | 13 ++-----
 drivers/input/touchscreen/raydium_i2c_ts.c |  7 +---
 drivers/pnp/pnpacpi/rsparser.c             |  7 ++--
 include/linux/acpi.h                       | 23 ++++++++++---
 include/linux/ioport.h                     |  3 +-
 16 files changed, 113 insertions(+), 90 deletions(-)

-- 
2.37.3.998.g577e59143f-goog

