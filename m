Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 812B939AE3D
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Jun 2021 00:41:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229839AbhFCWnS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Jun 2021 18:43:18 -0400
Received: from mail-wm1-f46.google.com ([209.85.128.46]:55988 "EHLO
        mail-wm1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229697AbhFCWnS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Jun 2021 18:43:18 -0400
Received: by mail-wm1-f46.google.com with SMTP id g204so4270872wmf.5;
        Thu, 03 Jun 2021 15:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AGHMFQROySDuAI1WX8+v+a7AxJ/f1867TETlzbkJ1nQ=;
        b=r8a9gJC5FypqHxKB+UOi77NVllKbePD3mMj9P4XqyUwlU8wayWLqr+0Dico3Q4l7ta
         yGgbybsjhf0T0dJuofwy7w8ltOo3CW6920PcGOeif6QF821ltJ6S3Cr+CscucllsudIt
         cREXhX/6AltO6rsuQQ5ffy4hmQ1bWTFzZLcJTQDeVqEOrdM6UIB+rR7Rff7xtMigNdYs
         YQBJPgaCsqanE7Lb5DToFWJ3m2VCcbVLFJJS/aX6WLIbw4sEfgu7/1IN5qv51mx4rl1T
         FW1DHE7bBQNRw7qGF6hgSBlii2HOGycI4g3yr+Pf+bA1aNEnwstZnnPTD1ckRh34Uilb
         Fshg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AGHMFQROySDuAI1WX8+v+a7AxJ/f1867TETlzbkJ1nQ=;
        b=ogUhIWJl+AUj1Da/SxE/XmVd8lcvWDoNLe8QRZ9qJKRQoceaZt2nMlR05K6SLPj1iN
         Y3VbHST4CroSyeuKbeEki80LRW6RzJ5pR20CcEkojjVXbILZ0nN+845hQLNb0oj32Qzq
         tjw8linDa/NKcFW6r/dMs/kx0MX4Twwm5CIXMiU28HcUaGJLFhKfjkEWs/LNmmkpWRc1
         PwACXe3P0fymfgzdsj4R2h6aCYB6kRcP12h1T8fjiPRW6VgmottPuufx0f3RR8KKyYYF
         hV8mkTYZGmuf34toBgdwUVSko+Au01qJ7oPuSF7mOkzk9CE1Me2O0fQfR+7JZ6t34PAj
         jhXg==
X-Gm-Message-State: AOAM5312/z1n10Ft1VT5aEoZsRDz8RVLSeMiETUcNqb14LLm7m7Gx7sU
        OVSyBVO2BLnnintwrcFDr28=
X-Google-Smtp-Source: ABdhPJy+3T3gQHQj3wZJFUax3BGw5seXgjSn2gkSQDt8uOtA+WSf1j5i6XYDGFIzhJt+KkxEjgGZ9g==
X-Received: by 2002:a7b:c052:: with SMTP id u18mr594606wmc.105.1622760020478;
        Thu, 03 Jun 2021 15:40:20 -0700 (PDT)
Received: from valhalla.home ([91.110.88.218])
        by smtp.gmail.com with ESMTPSA id f14sm4612103wry.40.2021.06.03.15.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jun 2021 15:40:19 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, devel@acpica.org
Cc:     Len Brown <lenb@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Wolfram Sang <wsa@kernel.org>,
        Mark Gross <mgross@linux.intel.com>,
        Robert Moore <robert.moore@intel.com>,
        Erik Kaneda <erik.kaneda@intel.com>,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com
Subject: [PATCH v5 0/6] Introduce intel_skl_int3472 module
Date:   Thu,  3 Jun 2021 23:40:01 +0100
Message-Id: <20210603224007.120560-1-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello all

Bit longer than hoped but here's v5.

v4:
https://lore.kernel.org/lkml/20210520140928.3252671-1-djrscally@gmail.com/

v3
https://lore.kernel.org/lkml/20210222130735.1313443-1-djrscally@gmail.com/

v2
https://lore.kernel.org/platform-driver-x86/20210118003428.568892-1-djrscally@gmail.com/

v1
https://lore.kernel.org/linux-media/20201130133129.1024662-1-djrscally@gmail.com/T/#m91934e12e3d033da2e768e952ea3b4a125ee3e67

The only changes are the dropped patches, renamed functions in 2/6 and most of
Andy's suggestions on 5/6 - I didn't hit them all yet but didn't want to delay
this any more.

Series level changelog:

	- Dropped all but the essential patches to simplify merge plan - thanks
	Hans.

Daniel Scally (6):
  ACPI: scan: Extend acpi_walk_dep_device_list()
  ACPI: scan: Add function to fetch dependent of acpi device
  gpiolib: acpi: Export acpi_get_gpiod()
  gpiolib: acpi: Add acpi_gpio_get_io_resource()
  platform/x86: Add intel_skl_int3472 driver
  mfd: tps68470: Remove tps68470 MFD driver

 MAINTAINERS                                   |   5 +
 drivers/acpi/ec.c                             |   2 +-
 drivers/acpi/pmic/Kconfig                     |   2 +-
 drivers/acpi/pmic/intel_pmic_chtdc_ti.c       |   2 +-
 drivers/acpi/scan.c                           | 104 ++++-
 drivers/gpio/Kconfig                          |   2 +-
 drivers/gpio/gpiolib-acpi.c                   |  61 ++-
 drivers/i2c/i2c-core-acpi.c                   |   8 +-
 drivers/mfd/Kconfig                           |  18 -
 drivers/mfd/Makefile                          |   1 -
 drivers/mfd/tps68470.c                        |  97 ----
 drivers/platform/surface/aggregator/core.c    |   6 +-
 drivers/platform/surface/surface3_power.c     |  22 +-
 .../platform/surface/surface_acpi_notify.c    |   7 +-
 drivers/platform/x86/Kconfig                  |   2 +
 drivers/platform/x86/Makefile                 |   1 +
 drivers/platform/x86/intel-int3472/Kconfig    |  30 ++
 drivers/platform/x86/intel-int3472/Makefile   |   5 +
 .../intel_skl_int3472_clk_and_regulator.c     | 196 ++++++++
 .../intel-int3472/intel_skl_int3472_common.c  | 106 +++++
 .../intel-int3472/intel_skl_int3472_common.h  | 118 +++++
 .../intel_skl_int3472_discrete.c              | 417 ++++++++++++++++++
 .../intel_skl_int3472_tps68470.c              | 137 ++++++
 include/acpi/acpi_bus.h                       |   8 +
 include/linux/acpi.h                          |  11 +-
 include/linux/gpio/consumer.h                 |   2 +
 26 files changed, 1205 insertions(+), 165 deletions(-)
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

