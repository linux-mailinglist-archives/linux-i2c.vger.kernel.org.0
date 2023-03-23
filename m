Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1EFE16C6E8E
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Mar 2023 18:21:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229796AbjCWRVK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Mar 2023 13:21:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbjCWRVK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 23 Mar 2023 13:21:10 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D22926866;
        Thu, 23 Mar 2023 10:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679592069; x=1711128069;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=F8VEs+gAoTbNxRMLbfeYtBj/ROtGxGe7/N+1j6jckaw=;
  b=b/ucdEI/q5ecmvInal7rOQKhySCMnA4cP7VjA4lyMa3iP7W6R+LkVH7o
   LttSaiMVTlmEoV13e4rDuisPqtm5X/i7rW4mdnhTFqBh63wZL6cx8ZkYS
   dZvGqCBAADrOALgVaYJog1neTe9sU0mzIf/opw7o1bo0iKMee4xtliV8c
   pYkw6GfxSXqkM93eeCGv7XBIfoUpAiVr8OFQZm5duh0kcr745eMoMcXTA
   UlHGoOFxik5wRXnv/eA5Az34u2HsyaqEghVLsgxfboBF5noEENBiuyM1U
   g4EEqnJJXYlmQHITL2YsQuQ/Vt+gvOL9d3kRDEjy3qrzYhj3oC4WhnYK9
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="425840143"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; 
   d="scan'208";a="425840143"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2023 10:21:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="712748266"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; 
   d="scan'208";a="712748266"
Received: from ye-nuc7i7dnhe.sh.intel.com ([10.239.154.52])
  by orsmga008.jf.intel.com with ESMTP; 23 Mar 2023 10:21:03 -0700
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
Subject: [PATCH v6 0/6] Add Intel LJCA device driver
Date:   Fri, 24 Mar 2023 01:21:07 +0800
Message-Id: <20230323172113.1231050-1-xiang.ye@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.6
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
 drivers/usb/misc/ljca.c                       | 1012 +++++++++++++++++
 include/linux/usb/ljca.h                      |   95 ++
 14 files changed, 2296 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-usb-devices-ljca
 create mode 100644 drivers/gpio/gpio-ljca.c
 create mode 100644 drivers/i2c/busses/i2c-ljca.c
 create mode 100644 drivers/spi/spi-ljca.c
 create mode 100644 drivers/usb/misc/ljca.c
 create mode 100644 include/linux/usb/ljca.h

-- 
2.34.1

