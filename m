Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 602D3321810
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Feb 2021 14:11:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231842AbhBVNKS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Feb 2021 08:10:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230370AbhBVNIb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 22 Feb 2021 08:08:31 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD1E4C061574;
        Mon, 22 Feb 2021 05:07:50 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id n8so18966316wrm.10;
        Mon, 22 Feb 2021 05:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=stoI6eMvRjtFHS9Ho0CArAefJgOQJyQUHAhNv0n6e4E=;
        b=Gf0Viy3DbSfkz1pJqcezIWfnDzVD4oqxxMCiR/sjGI8+EXHYz8JEJYcZQy0Vf4RrLa
         s+lJdvZNDqwColLKAPfYPUHjIkaMyEi4GkVBSVQJkrON+zOgsvwtZhCkm/xKuEXPg3N3
         iUI20+CQGkwf9VpK3F2QxfmbGCNJcDBqb29nDRGdcZXqHseOMCCHu8SA5BKaile1JzvG
         HpXpuWyk9qmQSw9ihyizw6vawle+zhieP3ObpKq7TzmJ4STiDmsUbuno0hc6/HeHwYpM
         rsa+y/TrgSln63LhkFa13g/+K+s2M/U5j9vUmr1ITd4El5MiVJxm0suPZw8Bv5hLaDcQ
         Z8jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=stoI6eMvRjtFHS9Ho0CArAefJgOQJyQUHAhNv0n6e4E=;
        b=CW7EytFexEyt/FwEvF6Ho6rAf/f40OoJxl71kjx03/Xor+ndAL6qDe3UyUi6lsiMQ8
         sr/zSKaJXQnBUkQMayq0HUmFsH4RkUqgC40GR8/poHX9k7kqxI4myzyFZluS2gSF5B9H
         7ha0y2STJ3esEsDG/66nVEcPwCUhHnPhUu4sKo1WDqGyeMxC4DWf6C/Fn2gBIx2RLiqQ
         8sml7S2XNWVwdONDuouDa3Ig/jh333vxqScxQvdc7VmpedCBDZ/sCIvmezJwaCOPdqTG
         jzDVQWf77htFbFen/N4lv3G3lK1PvLFZlL/A2GD8/zUH1pgHROxM/02lPKcMa0bQE/wi
         kxuA==
X-Gm-Message-State: AOAM532AHiLTDqFj2p8gTmuLqxNcBeFEdNm5FvFDSV1UPGs/Kg5AZzDG
        RezY1Gvb27FJKQiIGytRfyI=
X-Google-Smtp-Source: ABdhPJySRppn9M08YPD6sZO7+VPk6b7fWJ9jG7po/pvuPyLHctU4YqYih2P2Bk1oWchInca3Ohs/Zg==
X-Received: by 2002:adf:fdd0:: with SMTP id i16mr21304628wrs.215.1613999269481;
        Mon, 22 Feb 2021 05:07:49 -0800 (PST)
Received: from valhalla.home ([2.31.224.123])
        by smtp.gmail.com with ESMTPSA id t198sm26575828wmt.7.2021.02.22.05.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 05:07:49 -0800 (PST)
From:   Daniel Scally <djrscally@gmail.com>
To:     tfiga@chromium.org, sakari.ailus@linux.intel.com,
        rajmohan.mani@intel.com, rjw@rjwysocki.net, lenb@kernel.org,
        mika.westerberg@linux.intel.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, wsa@kernel.org, lee.jones@linaro.org
Cc:     andy.shevchenko@linux.intel.com,
        kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart@ideasonboard.com, hdegoede@redhat.com,
        mgross@linux.intel.com, luzmaximilian@gmail.com,
        robert.moore@intel.com, erik.kaneda@intel.com, me@fabwu.ch,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, devel@acpica.org
Subject: [PATCH v3 0/6] Introduce intel_skl_int3472 module
Date:   Mon, 22 Feb 2021 13:07:29 +0000
Message-Id: <20210222130735.1313443-1-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

v1 for this series was originally 14-18 of this series:
https://lore.kernel.org/linux-media/20201130133129.1024662-1-djrscally@gmail.com/T/#m91934e12e3d033da2e768e952ea3b4a125ee3e67

v2 was here:
https://lore.kernel.org/platform-driver-x86/20210118003428.568892-1-djrscally@gmail.com/

Series level changelog:

	- Dropped the patch moving acpi_lpss_dep() to utils since it's not used
	in acpi_dev_get_dependent_dev() anymore.
	- Replaced it with a patch extending acpi_walk_dep_device_list() to be
	able to apply a given callback against each device in acpi_dep_list
	- Dropped the patch creating acpi_i2c_dev_name() and simply open coded
	that functionality.

This has been tested on a number of devices, but currently **not** on a device
designed for ChromeOS, which we ideally need to do to ensure no regression
caused by replacing the tps68470 MFD driver. Sakari / Tomasz, is there any way
you could help with that? Unfortunately, I don't have a device to test it on
myself.

Original cover letter: 

At the moment in the kernel the ACPI _HID INT3472 is taken by the tps68470
MFD driver, but that driver can only handle some of the cases of that _HID
that we see. There are at least these three possibilities:

1. INT3472 devices that provide GPIOs through the usual framework and run
   power and clocks through an operation region; this is the situation that
   the current module handles and is seen on ChromeOS devices
2. INT3472 devices that provide GPIOs, plus clocks and regulators that are
   meant to be driven through the usual frameworks, usually seen on devices
   designed to run Windows
3. INT3472 devices that don't actually represent a physical tps68470, but
   are being used as a convenient way of grouping a bunch of system GPIO
   lines that are intended to enable power and clocks for sensors which
   are called out as dependent on them. Also seen on devices designed to
   run Windows.

This series introduces a new module which registers:

1. An i2c driver that determines which scenario (#1 or #2) applies to the
   machine and registers platform devices to be bound to GPIO, OpRegion,
   clock and regulator drivers as appropriate.
2. A platform driver that binds to the dummy INT3472 devices described in
   #3

The platform driver for the dummy device registers the GPIO lines that
enable the clocks and regulators to the sensors via those frameworks so
that sensor drivers can consume them in the usual fashion. The existing
GPIO and OpRegion tps68470 drivers will work with the i2c driver that's
registered. Clock and regulator drivers are available but have not so far been
tested, so aren't part of this series.

The existing mfd/tps68470.c driver being thus superseded, it is removed.

Thanks
Dan

Daniel Scally (6):
  ACPI: scan: Extend acpi_walk_dep_device_list()
  ACPI: scan: Add function to fetch dependent of acpi device
  i2c: core: Add a format macro for I2C device names
  gpiolib: acpi: Export acpi_get_gpiod()
  platform/x86: Add intel_skl_int3472 driver
  mfd: tps68470: Remove tps68470 MFD driver

 MAINTAINERS                                   |   5 +
 drivers/acpi/ec.c                             |   2 +-
 drivers/acpi/pmic/Kconfig                     |   2 +-
 drivers/acpi/pmic/intel_pmic_chtdc_ti.c       |   2 +-
 drivers/acpi/scan.c                           |  92 ++-
 drivers/gpio/Kconfig                          |   2 +-
 drivers/gpio/gpiolib-acpi.c                   |  38 +-
 drivers/i2c/i2c-core-acpi.c                   |   2 +-
 drivers/i2c/i2c-core-base.c                   |   4 +-
 drivers/mfd/Kconfig                           |  18 -
 drivers/mfd/Makefile                          |   1 -
 drivers/mfd/tps68470.c                        |  97 ---
 drivers/platform/surface/surface3_power.c     |   2 +-
 drivers/platform/x86/Kconfig                  |   2 +
 drivers/platform/x86/Makefile                 |   1 +
 drivers/platform/x86/intel-int3472/Kconfig    |  31 +
 drivers/platform/x86/intel-int3472/Makefile   |   4 +
 .../intel-int3472/intel_skl_int3472_common.c  | 106 ++++
 .../intel-int3472/intel_skl_int3472_common.h  | 110 ++++
 .../intel_skl_int3472_discrete.c              | 592 ++++++++++++++++++
 .../intel_skl_int3472_tps68470.c              | 113 ++++
 include/acpi/acpi_bus.h                       |   8 +
 include/linux/acpi.h                          |   4 +-
 include/linux/gpio/consumer.h                 |   7 +
 include/linux/i2c.h                           |   3 +
 25 files changed, 1100 insertions(+), 148 deletions(-)
 delete mode 100644 drivers/mfd/tps68470.c
 create mode 100644 drivers/platform/x86/intel-int3472/Kconfig
 create mode 100644 drivers/platform/x86/intel-int3472/Makefile
 create mode 100644 drivers/platform/x86/intel-int3472/intel_skl_int3472_common.c
 create mode 100644 drivers/platform/x86/intel-int3472/intel_skl_int3472_common.h
 create mode 100644 drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c
 create mode 100644 drivers/platform/x86/intel-int3472/intel_skl_int3472_tps68470.c

-- 
2.25.1

