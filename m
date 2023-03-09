Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13F026B1C00
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Mar 2023 08:11:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229803AbjCIHK7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Mar 2023 02:10:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229742AbjCIHK6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Mar 2023 02:10:58 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12729A3B40;
        Wed,  8 Mar 2023 23:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678345858; x=1709881858;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=0JC8EdQCQu79Tbr/nJ/2g2CWrJledfFqbEALgkGmyiQ=;
  b=VOyYJtkE4o6lgzpqFzgwXwHo7WT1xtjMGEk1wp7J4PwnNJa/tfz4VeTC
   v3n4XuSr1JKBKuUGfGDsrnFm+HILfw/oRrPk+bqyWyddg4YmsMUurSzxB
   n+RtJ1ZMXF32eflXdLb5oHbd1bLW04h+nCS/wYB6fpPR28ET1qfNte6T0
   0jYrRt3eG3DDO93knILVaD0b+VOTQTzjDSMKf4ZfRRoQcWaBHw7C58CjK
   u71l2YxB2Y69hEFxC/Mx6890vvKCgp3tbwaRDZTffWLBRbChk/G7QOfVl
   podqxlCNuio8espO2tM6IBdu16shjoqqPhsft59UOAkhb2KmiRQDO2AFs
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="316767645"
X-IronPort-AV: E=Sophos;i="5.98,245,1673942400"; 
   d="scan'208";a="316767645"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2023 23:10:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="923126288"
X-IronPort-AV: E=Sophos;i="5.98,245,1673942400"; 
   d="scan'208";a="923126288"
Received: from ye-nuc7i7dnhe.sh.intel.com ([10.239.154.52])
  by fmsmga006.fm.intel.com with ESMTP; 08 Mar 2023 23:10:53 -0800
From:   Ye Xiang <xiang.ye@intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Matthias Kaehlcke <mka@chromium.org>,
        Lee Jones <lee@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        Tyrone Ting <kfting@nuvoton.com>,
        Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-usb@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-gpio@vger.kernel.org
Cc:     srinivas.pandruvada@intel.com, heikki.krogerus@linux.intel.com,
        andriy.shevchenko@linux.intel.com, sakari.ailus@linux.intel.com,
        zhifeng.wang@intel.com, wentong.wu@intel.com, lixu.zhang@intel.com,
        Ye Xiang <xiang.ye@intel.com>
Subject: [PATCH v4 0/5] Add Intel LJCA device driver
Date:   Thu,  9 Mar 2023 15:10:55 +0800
Message-Id: <20230309071100.2856899-1-xiang.ye@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
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
v4:
 - move ljca.c from drivers/mfd to drivers/usb/misc folder.
 - fix index warning in sysfs-bus-devices-ljca.

v3:
 - spi: make ljca_spi_transfer inline and fix an endian issue.

v2:
 - ljca: remove reset command.
 - gpio/spi/i2c: add `default MFD_LJCA` in Kconfig.
 - gpio: add "select GPIOLIB_IRQCHIP" in Kconfig.

Ye Xiang (5):
  mfd: Add support for Intel LJCA device
  gpio: Add support for Intel LJCA USB GPIO driver
  i2c: Add support for Intel LJCA USB I2C driver
  spi: Add support for Intel LJCA USB SPI driver
  Documentation: Add ABI doc for attributes of LJCA device

 .../ABI/testing/sysfs-bus-usb-devices-ljca    |  22 +
 drivers/gpio/Kconfig                          |  12 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-ljca.c                      | 454 ++++++++
 drivers/i2c/busses/Kconfig                    |  11 +
 drivers/i2c/busses/Makefile                   |   1 +
 drivers/i2c/busses/i2c-ljca.c                 | 357 +++++++
 drivers/spi/Kconfig                           |  11 +
 drivers/spi/Makefile                          |   1 +
 drivers/spi/spi-ljca.c                        | 291 ++++++
 drivers/usb/misc/Kconfig                      |  13 +
 drivers/usb/misc/Makefile                     |   1 +
 drivers/usb/misc/ljca.c                       | 969 ++++++++++++++++++
 include/linux/mfd/ljca.h                      |  95 ++
 14 files changed, 2239 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-usb-devices-ljca
 create mode 100644 drivers/gpio/gpio-ljca.c
 create mode 100644 drivers/i2c/busses/i2c-ljca.c
 create mode 100644 drivers/spi/spi-ljca.c
 create mode 100644 drivers/usb/misc/ljca.c
 create mode 100644 include/linux/mfd/ljca.h

-- 
2.34.1

