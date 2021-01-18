Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE4782F969A
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Jan 2021 01:35:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730487AbhARAfX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 17 Jan 2021 19:35:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730468AbhARAfW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 17 Jan 2021 19:35:22 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E826FC061573;
        Sun, 17 Jan 2021 16:34:41 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id r4so12385274wmh.5;
        Sun, 17 Jan 2021 16:34:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hv3QULuAw3daEtPKtW/GfZxtyLAjRCNrwbUyjJ0z7Xs=;
        b=iab6/rtv8fV2t/9tKiUZM6JzYtYY5t2jiLWWaSJwuY4UQBwFm9+jBWNQ7plLcMo4yv
         Ew0u3XTUYFIes11V2xwarfu+yyqrmpJhps5NW8NU0GNSSaAm3mJ7uvOqOL1+RkHGzr6m
         AXeXBkXDUe3OqWEcONBJEtzhC4f1kP3x3rAntdvkvCIFQt5FfmxIfVFRaTAlA6F4rRj/
         p+h9CYL6A2JH8yF1B6Sn8jm6eeZ6CNHF0HnDMyj+iCp2wSXj70pjrPQcs2F/OVF1FAEK
         UONkTBn3oPbgabnAfnEbWYEueALZzKbthyc5W7LXOI38rJEfnfjVvbIvGLgZ56YWAv/O
         CcSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hv3QULuAw3daEtPKtW/GfZxtyLAjRCNrwbUyjJ0z7Xs=;
        b=pOVyc+hEhXCvnB9KpAj8DjaNczycBidmZi8qbsgJZ9c3nhUIB6blz18jUenXm8BVLC
         7epdXB2fgSSjzi/9NRwUo4FOQ+obuof3/2+4hZJvZ/ur4MXJGh65Epi1rmfczbC5FURt
         aBK7Ga86dVPRvSENOqSRYWGZAgvazrAAwWS5jWtm/fcGN29yzW9dHz7KMQ42i/DNM3pE
         UnyaoEBgy5EtMz9ExaJxMJAVUj2KbX3ag3FRwBlSdvuyOuYTieTKfdiOfq//cAc4gSSc
         EKJKGUBY9A4sLFQHhg7DpaAIcCvUNJ6ycFU3zF/K1Iz4XlUnpTunb591HGOckO48xibF
         kSrw==
X-Gm-Message-State: AOAM5333qTqvngQZz7Ql6ebXRofpY3vC8xL3ygKJJS9yNAmS14YZt6WS
        ETpmBFAyIAdmp1tpMfCtzzgEAVqsaoA8eQ==
X-Google-Smtp-Source: ABdhPJx2d8jb8IceRsmC0SWY66dY7dVMCHYr1ggXjUpDi/gyQV3E+EAl3VTbJ8wyyNCBSbuwmUlSqA==
X-Received: by 2002:a1c:6383:: with SMTP id x125mr18434747wmb.46.1610930080551;
        Sun, 17 Jan 2021 16:34:40 -0800 (PST)
Received: from valhalla.home ([2.29.208.120])
        by smtp.gmail.com with ESMTPSA id o124sm23642040wmb.5.2021.01.17.16.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 16:34:39 -0800 (PST)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, devel@acpica.org
Cc:     rjw@rjwysocki.net, lenb@kernel.org, andy@kernel.org,
        mika.westerberg@linux.intel.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, wsa@kernel.org, lee.jones@linaro.org,
        hdegoede@redhat.com, mgross@linux.intel.com,
        robert.moore@intel.com, erik.kaneda@intel.com,
        sakari.ailus@linux.intel.com, andriy.shevchenko@linux.intel.com,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com
Subject: [PATCH v2 0/7] Introduce intel_skl_int3472 driver 
Date:   Mon, 18 Jan 2021 00:34:21 +0000
Message-Id: <20210118003428.568892-1-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello all

v1 for this series was originally 14-18 of this series:
https://lore.kernel.org/linux-media/20201130133129.1024662-1-djrscally@gmail.com/T/#m91934e12e3d033da2e768e952ea3b4a125ee3e67

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
registered. Clock and regulator drivers are currently in the works.

The existing mfd/tps68470.c driver being thus superseded, it is removed.

This has been tested on a number of devices; but currently **not** on a
ChromeOS, which we ideally need to do to ensure no regression caused by
replacing the tps68470 MFD driver.

Thanks
Dan

Daniel Scally (7):
  acpi: utils: move acpi_lpss_dep() to utils
  acpi: utils: Add function to fetch dependent acpi_devices
  i2c: i2c-core-base: Use format macro in i2c_dev_set_name()
  i2c: i2c-core-acpi: Add i2c_acpi_dev_name()
  gpio: gpiolib-acpi: Export acpi_get_gpiod()
  platform: x86: Add intel_skl_int3472 driver
  mfd: Remove tps68470 MFD driver

 MAINTAINERS                                   |   5 +
 drivers/acpi/acpi_lpss.c                      |  24 -
 drivers/acpi/internal.h                       |   1 +
 drivers/acpi/pmic/Kconfig                     |   1 -
 drivers/acpi/utils.c                          |  58 ++
 drivers/gpio/Kconfig                          |   1 -
 drivers/gpio/gpiolib-acpi.c                   |   3 +-
 drivers/i2c/i2c-core-acpi.c                   |  16 +
 drivers/i2c/i2c-core-base.c                   |   4 +-
 drivers/mfd/Kconfig                           |  18 -
 drivers/mfd/Makefile                          |   1 -
 drivers/mfd/tps68470.c                        |  97 ----
 drivers/platform/x86/Kconfig                  |  25 +
 drivers/platform/x86/Makefile                 |   4 +
 .../platform/x86/intel_skl_int3472_common.c   | 100 ++++
 .../platform/x86/intel_skl_int3472_common.h   | 100 ++++
 .../platform/x86/intel_skl_int3472_discrete.c | 496 ++++++++++++++++++
 .../platform/x86/intel_skl_int3472_tps68470.c | 145 +++++
 include/acpi/acpi_bus.h                       |   2 +
 include/linux/acpi.h                          |   5 +
 include/linux/i2c.h                           |   8 +
 21 files changed, 969 insertions(+), 145 deletions(-)
 delete mode 100644 drivers/mfd/tps68470.c
 create mode 100644 drivers/platform/x86/intel_skl_int3472_common.c
 create mode 100644 drivers/platform/x86/intel_skl_int3472_common.h
 create mode 100644 drivers/platform/x86/intel_skl_int3472_discrete.c
 create mode 100644 drivers/platform/x86/intel_skl_int3472_tps68470.c

-- 
2.25.1

