Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A0DF6FF91C
	for <lists+linux-i2c@lfdr.de>; Thu, 11 May 2023 20:01:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238571AbjEKSBz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 11 May 2023 14:01:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238952AbjEKSBv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 11 May 2023 14:01:51 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB18D10C;
        Thu, 11 May 2023 11:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683828104; x=1715364104;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=YmntpvtFHJS3jrZkGSqUkMwqsVJxjst16k/I4ZCZIMs=;
  b=FBgw+ylDzA60Cxe55E0rk9FBimMH47VzG+JapG3+i6WN4AqPV58MmAlI
   38UCTx8MWenT9MWYNjVRXiQF1H7Gm8BKkTNBbTE4iPFDd6Jl+6jnbApu8
   EjAEQmDnDb4cR7s6m0YmXMY7glG8QLSaZtCtHIpux49EhswV09sqGk1kF
   ycs9qcBrIfO8EoJ0b0ElbxZqdMzhBsrjT5AQ+8Ke7AxO9uqRQFYKCp+ir
   gkLIqw6B4R7wJUkBwHK45Ayo5sJMj8pTS2LWV6lAA4biZN9i7cK3Cy30i
   Rb+YigcgT4pGcbgpV+yZBgEgc3V75TwoUIQqrXHSZ4MppCAA7RdYlREQl
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="413942558"
X-IronPort-AV: E=Sophos;i="5.99,268,1677571200"; 
   d="scan'208";a="413942558"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2023 11:00:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="874061365"
X-IronPort-AV: E=Sophos;i="5.99,268,1677571200"; 
   d="scan'208";a="874061365"
Received: from ye-nuc7i7dnhe.sh.intel.com ([10.239.153.70])
  by orsmga005.jf.intel.com with ESMTP; 11 May 2023 11:00:39 -0700
From:   Ye Xiang <xiang.ye@intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Matthias Kaehlcke <mka@chromium.org>,
        Lee Jones <lee@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        Tyrone Ting <kfting@nuvoton.com>,
        Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-usb@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-gpio@vger.kernel.org
Cc:     srinivas.pandruvada@intel.com, heikki.krogerus@linux.intel.com,
        andriy.shevchenko@linux.intel.com, sakari.ailus@linux.intel.com,
        zhifeng.wang@intel.com, wentong.wu@intel.com, lixu.zhang@intel.com,
        Ye Xiang <xiang.ye@intel.com>
Subject: [PATCH v8 0/6] Add Intel LJCA device driver
Date:   Fri, 12 May 2023 01:58:38 +0800
Message-Id: <20230511175844.185070-1-xiang.ye@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add driver for Intel La Jolla Cove Adapter (LJCA) device.
This is a USB-GPIO, USB-I2C and USB-SPI device. We add 4
drivers to support this device: a USB driver, a GPIO chip
driver, a I2C controller driver and a SPI controller driver.

---
v8:
 - ljca: use READ_ONCE to make the value of ibuf consistent.
 - gpio: inplement get_direction callback.
 - gpio: move kconfig item into `USB GPIO expanders` menu.

v7:
 - ljca: remove unused field `udev` in struct ljca_dev.
 - ljca: rename ljca module name to usb-ljca.
 - ljca: use CONFIG_ACPI to enclose acpi related code.
 - ljca/gpio/i2c/spi: align MACRO defination.

v6:
 - ljca: split LJCA USB driver into two commits: USB part and API part.
 - gpio/i2c/spi: use auxiliary bus for sub-module device enumeration instead of MFD.
 - move document patch for LJCA sysfs entry to the 3th patch of this patch series.
 - ljca: fix potential race condition when wait response timeout.
 - ljca: use devm_kzalloc to malloc ljca device struct. 

v5:
 - move ljca.h from drivers/include/mfd to drivers/include/usb.
 - ljca: fix a potential memory leak issue.
 - add a blank line before return to adust to kernel code style.
 - ljca: sysfs: split "cmd" to "ljca_dfu" and "ljca_trace_level".

v4:
 - move ljca.c from drivers/mfd to drivers/usb/misc folder.
 - fix index warning in sysfs-bus-devices-ljca.

v3:
 - spi: make ljca_spi_transfer inline and fix an endian issue.

v2:
 - ljca: remove reset command.
 - gpio/spi/i2c: add `default MFD_LJCA` in Kconfig.
 - gpio: add "select GPIOLIB_IRQCHIP" in Kconfig.

Ye Xiang (6):
  usb: Add support for Intel LJCA device
  usb: ljca: Add transport interfaces for sub-module drivers
  Documentation: Add ABI doc for attributes of LJCA device
  gpio: Add support for Intel LJCA USB GPIO driver
  i2c: Add support for Intel LJCA USB I2C driver
  spi: Add support for Intel LJCA USB SPI driver

 .../ABI/testing/sysfs-bus-usb-devices-ljca    |   36 +
 drivers/gpio/Kconfig                          |   12 +
 drivers/gpio/Makefile                         |    1 +
 drivers/gpio/gpio-ljca.c                      |  479 ++++++++
 drivers/i2c/busses/Kconfig                    |   11 +
 drivers/i2c/busses/Makefile                   |    1 +
 drivers/i2c/busses/i2c-ljca.c                 |  350 ++++++
 drivers/spi/Kconfig                           |   11 +
 drivers/spi/Makefile                          |    1 +
 drivers/spi/spi-ljca.c                        |  290 +++++
 drivers/usb/misc/Kconfig                      |   14 +
 drivers/usb/misc/Makefile                     |    1 +
 drivers/usb/misc/usb-ljca.c                   | 1068 +++++++++++++++++
 include/linux/usb/ljca.h                      |  102 ++
 14 files changed, 2377 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-usb-devices-ljca
 create mode 100644 drivers/gpio/gpio-ljca.c
 create mode 100644 drivers/i2c/busses/i2c-ljca.c
 create mode 100644 drivers/spi/spi-ljca.c
 create mode 100644 drivers/usb/misc/usb-ljca.c
 create mode 100644 include/linux/usb/ljca.h

-- 
2.34.1

