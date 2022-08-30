Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39A005A716A
	for <lists+linux-i2c@lfdr.de>; Wed, 31 Aug 2022 01:16:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231184AbiH3XQO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 Aug 2022 19:16:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230056AbiH3XQN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 30 Aug 2022 19:16:13 -0400
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com [IPv6:2607:f8b0:4864:20::d2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2AE4558E7
        for <linux-i2c@vger.kernel.org>; Tue, 30 Aug 2022 16:16:11 -0700 (PDT)
Received: by mail-io1-xd2e.google.com with SMTP id p187so10590859iod.8
        for <linux-i2c@vger.kernel.org>; Tue, 30 Aug 2022 16:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=x69BqAPYkPfjWtjrw3LI9eH4GuXIZVGeRYFtXQ4qANk=;
        b=GMh82kpsRbSMjNBdDIlyFF6p1LC0ASDp6rUqVioNXmfijJFe2BW6rlTrjMl3490xfu
         FsDeEGa2CSG5Sb7He+I+7DWspwGGkWHTRm+dz2D0r8MKYB4nEAin7IEw97Wo2cGbzPAn
         xwQSQy+YaXOV6Tqf3+qxjVDwQg364bAuTfusU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=x69BqAPYkPfjWtjrw3LI9eH4GuXIZVGeRYFtXQ4qANk=;
        b=ySt1R5rMLHmEc1wnOmnf1nkhX7g8vmQ6LNPZitobC84vteh1C7bxXI+WR28wbERMbf
         mavxqBp3o8LCI8x5pFOwAJsKkp0jcemd+lA2BxOTCOzA2Bc/QHOIRswTdTbtXGikpxF1
         md3j5YQUKKs89qTV/ywj6PHLo2eBGUQHqrHOs/TLU+LSvUQd/dNuVhZSeMxryo2d9t6T
         zffDBTJs05+V4Z66LRDEiuv3gclqAqtTmNABronex54z8P3pV3IblYiLn2xcysfHq45J
         qU2ZcMRubN3SaAhR9iiknBcIo7pwUsK7bqRHPEvDNR5sKWZ2rE97qfHHUOhAGhJdCZRq
         6zLA==
X-Gm-Message-State: ACgBeo3JEe3cMSZkLbIJgrUrOsBfsB+flle3t3g2zr1lbHVWDHZsNCmI
        sNdlpzHv8uFSJaX2BW38Qj1TMw==
X-Google-Smtp-Source: AA6agR5OcRQGYrRnCPUJPHTaVmS06dfSxPfnXE6Jpp9Ld2axdjlW1ZBJtBWb1Ys+GJKEYN1dk+TJSQ==
X-Received: by 2002:a05:6602:2ac2:b0:689:f825:803a with SMTP id m2-20020a0566022ac200b00689f825803amr11968475iov.131.1661901371266;
        Tue, 30 Aug 2022 16:16:11 -0700 (PDT)
Received: from rrangel920.bld.corp.google.com (h24-56-189-219.arvdco.broadband.dynamic.tds.net. [24.56.189.219])
        by smtp.gmail.com with ESMTPSA id z30-20020a056602081e00b0068b1858c81asm6165821iow.13.2022.08.30.16.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 16:16:10 -0700 (PDT)
From:   Raul E Rangel <rrangel@chromium.org>
To:     linux-acpi@vger.kernel.org, linux-input@vger.kernel.org
Cc:     hdegoede@redhat.com, mario.limonciello@amd.com, timvp@google.com,
        rafael@kernel.org, Raul E Rangel <rrangel@chromium.org>,
        Alistair Francis <alistair@alistair23.me>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Angela Czubak <acz@semihalf.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Bartosz Szczepanek <bsz@semihalf.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jiri Kosina <jikos@kernel.org>, Len Brown <lenb@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Rob Herring <robh@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        Yang Li <yang.lee@linux.alibaba.com>,
        "jingle.wu" <jingle.wu@emc.com.tw>, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/8] acpi: i2c: Use SharedAndWake and ExclusiveAndWake to enable wake irq
Date:   Tue, 30 Aug 2022 17:15:33 -0600
Message-Id: <20220830231541.1135813-1-rrangel@chromium.org>
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
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
defined on the GpioInt. This is accomplished by:
* Migrating some of the i2c drivers over to using the PM subsystem to
  manage the wake IRQ. max8925-i2c, elants_i2c, and raydium_i2c_ts still
  need to be migrated, I can do that depending on the feedback to this
  patch series.
* Expose the wake_capable bit from the ACPI GpioInt resource to the
  i2c core.
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

Thanks,
Raul


Raul E Rangel (8):
  Input: elan_i2c - Use PM subsystem to manage wake irq
  HID: i2c-hid: Use PM subsystem to manage wake irq
  gpiolib: acpi: Add wake_capable parameter to acpi_dev_gpio_irq_get_by
  i2c: acpi: Use ACPI GPIO wake capability bit to set wake_irq
  HID: i2c-hid: acpi: Stop setting wakeup_capable
  Input: elan_i2c - Don't set wake_irq when using ACPI
  HID: i2c-hid: Don't set wake_irq when using ACPI
  ACPI: PM: Take wake IRQ into consideration when entering
    suspend-to-idle

 drivers/acpi/device_pm.c            | 19 +++++++++++++++--
 drivers/gpio/gpio-pca953x.c         |  3 ++-
 drivers/gpio/gpiolib-acpi.c         | 11 +++++++++-
 drivers/gpio/gpiolib-acpi.h         |  2 ++
 drivers/hid/i2c-hid/i2c-hid-acpi.c  |  5 -----
 drivers/hid/i2c-hid/i2c-hid-core.c  | 33 +++++++++++------------------
 drivers/i2c/i2c-core-acpi.c         |  8 +++++--
 drivers/i2c/i2c-core-base.c         | 17 +++++++++------
 drivers/i2c/i2c-core.h              |  4 ++--
 drivers/input/mouse/elan_i2c_core.c | 14 +++++-------
 include/linux/acpi.h                | 14 +++++++++---
 11 files changed, 78 insertions(+), 52 deletions(-)

-- 
2.37.2.672.g94769d06f0-goog

