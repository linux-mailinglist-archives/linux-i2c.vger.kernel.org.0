Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E3896A5331
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Feb 2023 07:56:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230090AbjB1G4U (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 Feb 2023 01:56:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229485AbjB1G4T (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 28 Feb 2023 01:56:19 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 390631ADE2;
        Mon, 27 Feb 2023 22:56:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677567378; x=1709103378;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=cW1IMNs2oNrtcm+7Vi/sPjwhdqGJf2hQO4Un1Gs/SWc=;
  b=S25drpOVON4SibjdTgu3MjHd9pj1+VAnITgSsWOEEvID9i/hb9A6nPkn
   qzPcp+epHvG3yViJ3ld5kD35X0ESjVu6PTdd95gcR5BtQEPfM5YBsZd9i
   1hceIs7HXGHz+uEYe6ZWH6OZWPF1zR8jnDLOqjq+z7gTuAL9ubz471eqE
   mqG2gGbjDpg7K1Nn8NMMcgJ/hslSzQ4v3EorO4/Pza9ExfU3I97IvGBFZ
   4t6uVFksPcK5pLtl6jqpxmiqkak6I15g/fCPFZYLYCEXRW0KBb7qnt8NI
   pQUqXnZ2CjpmQMJBydoWYH0rsjddxs7dZ8aaxqqIV7NbrNNrr33znQql4
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="335551055"
X-IronPort-AV: E=Sophos;i="5.98,221,1673942400"; 
   d="scan'208";a="335551055"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2023 22:56:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="797969179"
X-IronPort-AV: E=Sophos;i="5.98,221,1673942400"; 
   d="scan'208";a="797969179"
Received: from ye-nuc7i7dnhe.sh.intel.com ([10.239.154.52])
  by orsmga004.jf.intel.com with ESMTP; 27 Feb 2023 22:56:13 -0800
From:   Ye Xiang <xiang.ye@intel.com>
To:     Lee Jones <lee@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        Tyrone Ting <kfting@nuvoton.com>,
        Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-gpio@vger.kernel.org
Cc:     srinivas.pandruvada@intel.com, heikki.krogerus@linux.intel.com,
        andriy.shevchenko@linux.intel.com, sakari.ailus@linux.intel.com,
        zhifeng.wang@intel.com, wentong.wu@intel.com, lixu.zhang@intel.com,
        Ye Xiang <xiang.ye@intel.com>
Subject: [PATCH v3 0/5] Add Intel LJCA device driver
Date:   Tue, 28 Feb 2023 14:56:13 +0800
Message-Id: <20230228065618.2686550-1-xiang.ye@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
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
 drivers/mfd/Kconfig                           |  13 +
 drivers/mfd/Makefile                          |   1 +
 drivers/mfd/ljca.c                            | 969 ++++++++++++++++++
 drivers/spi/Kconfig                           |  11 +
 drivers/spi/Makefile                          |   1 +
 drivers/spi/spi-ljca.c                        | 291 ++++++
 include/linux/mfd/ljca.h                      |  95 ++
 14 files changed, 2239 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-usb-devices-ljca
 create mode 100644 drivers/gpio/gpio-ljca.c
 create mode 100644 drivers/i2c/busses/i2c-ljca.c
 create mode 100644 drivers/mfd/ljca.c
 create mode 100644 drivers/spi/spi-ljca.c
 create mode 100644 include/linux/mfd/ljca.h

-- 
2.34.1

