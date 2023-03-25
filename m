Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3EEE46C8F19
	for <lists+linux-i2c@lfdr.de>; Sat, 25 Mar 2023 16:47:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231808AbjCYPr4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 25 Mar 2023 11:47:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231716AbjCYPrw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 25 Mar 2023 11:47:52 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD93912593;
        Sat, 25 Mar 2023 08:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679759244; x=1711295244;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=juObK8W9N0NkiNFfnz736OwLgoWizj7LQHSUIK5DE2A=;
  b=BpwR5h75bwGiCQrPlCJN7xJH9YBCCJiR5v6hom1vym/X30Oeh8DiRpkz
   /eNuiQwhP7a8/f78K8Dbrm61uFks71LX2FzTDHrwibPCIGUZnpOTSFbS0
   71grCXQm9hTUPnloKTkJiry8pK7Bl27loxdDubceXEaSKjlvKLqRHjBBc
   Lok0Wjtc/rbxg2fSZS4jWniBl7ylTX4r18OWcQFdFzBa+vMX1fMcx2Zlk
   SQzln+2X5HkXnHygb+reZsnW1rPgn96u1G5eDX/AWrFyJ1pjRKkyQSsx0
   Rmrdj44135n9HmySNN76QMkhLcPBC4Z3sLXb4Ikbh4J9AyxZjI3Gy1BAh
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10660"; a="341558691"
X-IronPort-AV: E=Sophos;i="5.98,290,1673942400"; 
   d="scan'208";a="341558691"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2023 08:47:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10660"; a="793793817"
X-IronPort-AV: E=Sophos;i="5.98,290,1673942400"; 
   d="scan'208";a="793793817"
Received: from ye-nuc7i7dnhe.sh.intel.com ([10.239.154.52])
  by fmsmga002.fm.intel.com with ESMTP; 25 Mar 2023 08:47:09 -0700
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
Subject: [PATCH v7 0/6] Add Intel LJCA device driver
Date:   Sat, 25 Mar 2023 23:47:05 +0800
Message-Id: <20230325154711.2419569-1-xiang.ye@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
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
v7:
 - ljca: remove unused field `udev` in struct ljca_dev.
 - ljca: rename ljca module name to usb-ljca.
 - ljca: use CONFIG_ACPI to enclose acpi related code.
 - ljca/gpio/i2c/spi: aligh MACRO defination.

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
 drivers/gpio/gpio-ljca.c                      |  458 ++++++++
 drivers/i2c/busses/Kconfig                    |   11 +
 drivers/i2c/busses/Makefile                   |    1 +
 drivers/i2c/busses/i2c-ljca.c                 |  355 ++++++
 drivers/spi/Kconfig                           |   11 +
 drivers/spi/Makefile                          |    1 +
 drivers/spi/spi-ljca.c                        |  289 +++++
 drivers/usb/misc/Kconfig                      |   13 +
 drivers/usb/misc/Makefile                     |    1 +
 drivers/usb/misc/usb-ljca.c                   | 1027 +++++++++++++++++
 include/linux/usb/ljca.h                      |   95 ++
 14 files changed, 2311 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-usb-devices-ljca
 create mode 100644 drivers/gpio/gpio-ljca.c
 create mode 100644 drivers/i2c/busses/i2c-ljca.c
 create mode 100644 drivers/spi/spi-ljca.c
 create mode 100644 drivers/usb/misc/usb-ljca.c
 create mode 100644 include/linux/usb/ljca.h

-- 
2.34.1

