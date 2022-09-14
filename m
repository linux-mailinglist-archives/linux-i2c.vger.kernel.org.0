Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72F895B9136
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Sep 2022 01:58:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229766AbiINX6K (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Sep 2022 19:58:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229711AbiINX6I (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Sep 2022 19:58:08 -0400
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECBAF89824
        for <linux-i2c@vger.kernel.org>; Wed, 14 Sep 2022 16:58:06 -0700 (PDT)
Received: by mail-io1-xd2f.google.com with SMTP id r134so13649540iod.8
        for <linux-i2c@vger.kernel.org>; Wed, 14 Sep 2022 16:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=FyJik6ROpZ2yeD7GwjWvgb+hf71qfzTeOYJCVjcO18E=;
        b=AQYtOB79mXFZIDXHSD41sUTom6ptHeMRcAqbDiFIANz0083xLdmpUx1aAtJmlmkDKw
         zUtCSgGmQEaVUEG3LdTYQvhvX1BcHO1//j42FW+RI5MS2sN7fhf4ATm+YXcw42AORlBP
         vnA3/s5NRrE5se7p5MAb6Xb5rWAg1XjEJrvkM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=FyJik6ROpZ2yeD7GwjWvgb+hf71qfzTeOYJCVjcO18E=;
        b=0CfcXdA4gkXYlT/l/gIbOJLHol9tjE/fed21vcPcCegU1yBPWZQFszEsW54ppbDFs1
         A6cnskGbjyYuCb5DvAheZMicL9HF6eXk0k46ukHqhQ8/0QXsGyfCKRISrAnIsTQfNwnM
         aGYVsjlgb3WyrhWoYOE21/XFRaOrWJbbluY2FNvpc5QWnYRlKXt/LuxHieSeiyMW6AKQ
         bIIM07Rtz0Zs4zth50i2S4QzeUt/d+uUysZrgHpryylqTSzOyW171uMF2kBHIC0iI26H
         IwgdNSdvW8WU06mP6gRXutWAOAEhAtiaIBQWKiCogrJouL5vGOAJLAUPIv7MFdD59EUg
         I5dw==
X-Gm-Message-State: ACgBeo2x4SrLlc86HPtFar+AAxOaZaDLZGDNipMLreQ7Jsrvk3If/MDM
        yU8DptUuzmrwWWm9ClZKyyw1dQ==
X-Google-Smtp-Source: AA6agR5l5JDc0WxLOnDg27N8mDa0GrAsluUuxtmOHbHVeqpn8JgYWVDDPebvIshXEgDuAIqJMyr11Q==
X-Received: by 2002:a05:6638:2501:b0:35a:3675:fe2c with SMTP id v1-20020a056638250100b0035a3675fe2cmr8924188jat.35.1663199885958;
        Wed, 14 Sep 2022 16:58:05 -0700 (PDT)
Received: from rrangel920.bld.corp.google.com (h24-56-189-219.arvdco.broadband.dynamic.tds.net. [24.56.189.219])
        by smtp.gmail.com with ESMTPSA id a14-20020a027a0e000000b0034c0e8829c0sm353721jac.0.2022.09.14.16.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 16:58:05 -0700 (PDT)
From:   Raul E Rangel <rrangel@chromium.org>
To:     linux-acpi@vger.kernel.org, linux-input@vger.kernel.org
Cc:     jingle.wu@emc.com.tw, rafael@kernel.org,
        andriy.shevchenko@linux.intel.com, mario.limonciello@amd.com,
        hdegoede@redhat.com, linus.walleij@linaro.org, timvp@google.com,
        dmitry.torokhov@gmail.com, Raul E Rangel <rrangel@chromium.org>,
        Alistair Francis <alistair@alistair23.me>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Angela Czubak <acz@semihalf.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
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
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Radoslaw Biernacki <biernacki@google.com>,
        Rob Herring <robh@kernel.org>,
        Terry Bowman <terry.bowman@amd.com>,
        Wolfram Sang <wsa@kernel.org>,
        Yang Li <yang.lee@linux.alibaba.com>,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 00/13] acpi: i2c: Use SharedAndWake and ExclusiveAndWake to enable wake irq
Date:   Wed, 14 Sep 2022 17:57:48 -0600
Message-Id: <20220914235801.1731478-1-rrangel@chromium.org>
X-Mailer: git-send-email 2.37.3.968.ga6b4b080e4-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
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

 drivers/acpi/device_pm.c                   | 19 +++++++++++--
 drivers/acpi/irq.c                         | 11 ++++++--
 drivers/acpi/resource.c                    | 24 +++++++++++-----
 drivers/gpio/gpiolib-acpi.c                | 17 +++++++++--
 drivers/gpio/gpiolib-acpi.h                |  2 ++
 drivers/hid/i2c-hid/i2c-hid-acpi.c         |  5 ----
 drivers/hid/i2c-hid/i2c-hid-core.c         | 24 ++--------------
 drivers/i2c/i2c-core-acpi.c                | 33 ++++++++++++++++------
 drivers/i2c/i2c-core-base.c                |  8 +++++-
 drivers/i2c/i2c-core.h                     |  4 +--
 drivers/input/mouse/elan_i2c_core.c        | 15 +---------
 drivers/input/touchscreen/elants_i2c.c     | 13 ++-------
 drivers/input/touchscreen/raydium_i2c_ts.c |  7 +----
 drivers/pnp/pnpacpi/rsparser.c             |  9 ++++--
 include/linux/acpi.h                       | 25 ++++++++++++----
 include/linux/ioport.h                     |  3 +-
 16 files changed, 126 insertions(+), 93 deletions(-)

-- 
2.37.3.968.ga6b4b080e4-goog

