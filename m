Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC67538B139
	for <lists+linux-i2c@lfdr.de>; Thu, 20 May 2021 16:11:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237239AbhETOMy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 May 2021 10:12:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237114AbhETOMB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 May 2021 10:12:01 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0421C061352;
        Thu, 20 May 2021 07:09:41 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id x8so17818890wrq.9;
        Thu, 20 May 2021 07:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ITSUS5r5hEUj7pr1CVlQCx/8PA216WAC5CyHFDa3mzk=;
        b=Q+syC+MSVJ4dladQif2oXzxSVW5bVDYGTzkmbqFKqcGtGamw+E/idAExrlrsLn3dDS
         SIlVlOv2T/WB+GrZ9OPyfNuyWtNptJRs597wboRr9l7q2mCzuZCDvNBUyJjX6jiW0EwD
         TFiZ6HNYI+Wwk1U+b7L6SlHuLGGPShG35f10R3xwoC1e9GrIpR4zdQGF2xz+2t1izsca
         j5q6bpO5Q6QS9vGoO7/tIASNo2puxpTqSM7vJcLCLA2u4lmNJCP/J/tENj5Ne5R08uei
         L2eYL6DVltK8ybr1w9Eyh4SKA3uZl1I0WIA6f6tkreFKWqC/aaIU4F0w+lky+WmWEgya
         /Cbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ITSUS5r5hEUj7pr1CVlQCx/8PA216WAC5CyHFDa3mzk=;
        b=RQ9qwWK0HZ/O3YhL2wR+AMlYYyUkgvjmZOrwEc+9c6nIlo5Ptb0BHRcebAIrxrbQl5
         U+WfaAaGA6EyNrs/k1Nq+QTARNEbNdtkA1NPoZRAcZ/pGvmFUVriAAfPbOR3yzEOGjpc
         RhcxTatEHxfh9oLCH61p4qN4JfGGlt1ZxPRr3DChNSAq987d4rDT7ug/evdLXHaV9FR+
         Fk3Fc00pWQ+ENfyrxYGIYaFqelvsvS16aHxKzZItM1kzRzi3LRlL1m4WwzKEBkNNKJA5
         dUgYW7t6uA2IrUjvrGv6mNS2WVDq9QuC4zzX3q7bDI2zOMnelkBxX0Uk7XIOomK9OeYO
         Y+SQ==
X-Gm-Message-State: AOAM5312fyM9RiBOlVfI6Lmd9S0kq3dfqYCEDEhjq+1AdGrMatpqxxVO
        cq4dhYoVfndlPe/CwaN6HM8=
X-Google-Smtp-Source: ABdhPJyHTPqgQZdYYUho5mvrJ11+g7aF0gXsjQ4KRURic/VMsnbNjl4CETAc0oAYdIj7n5UCphPcgQ==
X-Received: by 2002:adf:cc81:: with SMTP id p1mr4435946wrj.175.1621519780487;
        Thu, 20 May 2021 07:09:40 -0700 (PDT)
Received: from valhalla.home ([91.110.20.117])
        by smtp.gmail.com with ESMTPSA id m6sm8411974wml.3.2021.05.20.07.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 07:09:40 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Wolfram Sang <wsa@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        devel@acpica.org
Cc:     Len Brown <lenb@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Russell King <linux@armlinux.org.uk>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mark Gross <mgross@linux.intel.com>,
        Robert Moore <robert.moore@intel.com>,
        Erik Kaneda <erik.kaneda@intel.com>,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com
Subject: [PATCH v4 0/8] Introduce intel_skl_int3472 module
Date:   Thu, 20 May 2021 15:09:20 +0100
Message-Id: <20210520140928.3252671-1-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello all

Apologies for the long delay since the last version of this series; the time I
had free to work on it became somewhat restrained.

v1 for this series was originally 14-18 of this series:
https://lore.kernel.org/linux-media/20201130133129.1024662-1-djrscally@gmail.com/T/#m91934e12e3d033da2e768e952ea3b4a125ee3e67

v2 was here:
https://lore.kernel.org/platform-driver-x86/20210118003428.568892-1-djrscally@gmail.com/

v3 was here:
https://lore.kernel.org/lkml/20210222130735.1313443-1-djrscally@gmail.com/

Series level changelog:

	- Added patch 5/8 to make clkdev_drop() NULL aware to simplify error
	handling.
	- Added patch 6/8 to add acpi_gpio_get_io_resource().

This has been tested on a number of devices, but currently **not** on a device
designed for ChromeOS, which we ideally need to do to ensure no regression
caused by replacing the tps68470 MFD driver. Unfortunately, I don't have a
device to test it on myself.

=========== Original Cover Letter ===========

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

Daniel Scally (8):
  ACPI: scan: Extend acpi_walk_dep_device_list()
  ACPI: scan: Add function to fetch dependent of acpi device
  i2c: core: Add a format macro for I2C device names
  gpiolib: acpi: Export acpi_get_gpiod()
  clkdev: Make clkdev_drop() null aware
  gpiolib: acpi: Add acpi_gpio_get_io_resource()
  platform/x86: Add intel_skl_int3472 driver
  mfd: tps68470: Remove tps68470 MFD driver

 MAINTAINERS                                   |   5 +
 drivers/acpi/ec.c                             |   2 +-
 drivers/acpi/pmic/Kconfig                     |   2 +-
 drivers/acpi/pmic/intel_pmic_chtdc_ti.c       |   2 +-
 drivers/acpi/scan.c                           | 107 ++++-
 drivers/clk/clkdev.c                          |   3 +
 drivers/gpio/Kconfig                          |   2 +-
 drivers/gpio/gpiolib-acpi.c                   |  61 ++-
 drivers/i2c/i2c-core-acpi.c                   |   8 +-
 drivers/i2c/i2c-core-base.c                   |   4 +-
 drivers/mfd/Kconfig                           |  18 -
 drivers/mfd/Makefile                          |   1 -
 drivers/mfd/tps68470.c                        |  97 -----
 drivers/platform/surface/aggregator/core.c    |   6 +-
 drivers/platform/surface/surface3_power.c     |  22 +-
 .../platform/surface/surface_acpi_notify.c    |   7 +-
 drivers/platform/x86/Kconfig                  |   2 +
 drivers/platform/x86/Makefile                 |   1 +
 drivers/platform/x86/intel-int3472/Kconfig    |  31 ++
 drivers/platform/x86/intel-int3472/Makefile   |   5 +
 .../intel_skl_int3472_clk_and_regulator.c     | 195 +++++++++
 .../intel-int3472/intel_skl_int3472_common.c  | 106 +++++
 .../intel-int3472/intel_skl_int3472_common.h  | 113 +++++
 .../intel_skl_int3472_discrete.c              | 409 ++++++++++++++++++
 .../intel_skl_int3472_tps68470.c              | 109 +++++
 include/acpi/acpi_bus.h                       |   8 +
 include/linux/acpi.h                          |  11 +-
 include/linux/gpio/consumer.h                 |   2 +
 include/linux/i2c.h                           |   3 +
 29 files changed, 1175 insertions(+), 167 deletions(-)
 delete mode 100644 drivers/mfd/tps68470.c
 create mode 100644 drivers/platform/x86/intel-int3472/Kconfig
 create mode 100644 drivers/platform/x86/intel-int3472/Makefile
 create mode 100644 drivers/platform/x86/intel-int3472/intel_skl_int3472_clk_and_regulator.c
 create mode 100644 drivers/platform/x86/intel-int3472/intel_skl_int3472_common.c
 create mode 100644 drivers/platform/x86/intel-int3472/intel_skl_int3472_common.h
 create mode 100644 drivers/platform/x86/intel-int3472/intel_skl_int3472_discrete.c
 create mode 100644 drivers/platform/x86/intel-int3472/intel_skl_int3472_tps68470.c

-- 
2.25.1

