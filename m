Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CBA336A2A2A
	for <lists+linux-i2c@lfdr.de>; Sat, 25 Feb 2023 15:01:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229478AbjBYOBT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 25 Feb 2023 09:01:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbjBYOBT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 25 Feb 2023 09:01:19 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 942E917CD2;
        Sat, 25 Feb 2023 06:01:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677333678; x=1708869678;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=GLhdLw+oFWOLlJlG8A53g2nXQ0av44AQE7yKJKyYA+4=;
  b=NgBPKZ5l/+zdEdx1kdMqfeglOhxt/eAzezyj+c72sitvcaULbpTAvM93
   he6iinbpsNULC4DpB8m4s5c4etogwRa9ckLIEDECUcDl4sTOYGSO5ccUq
   cCcNcBuPIzP7xmIDkZ1YUtBN82nAcPVCYeIOl43H+uloL7XehthKnWZAk
   NbkeSEiuJJwj7rMHBa8nLt2ZGC1gak2bT6TOeP3/81VktGadl+rO5SAn1
   1542v3ef11Ul3OgWkHn4eMG8d23F3Ms6C5buw5okdUkXNR4nizmIuzyvB
   LEsXu6MNJfkKE9p0Q5DwzpGtnFDVSNNLdHQwdwRbA5aGfIcsQuJwGVeK2
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="314053383"
X-IronPort-AV: E=Sophos;i="5.97,327,1669104000"; 
   d="scan'208";a="314053383"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2023 06:01:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="918740157"
X-IronPort-AV: E=Sophos;i="5.97,327,1669104000"; 
   d="scan'208";a="918740157"
Received: from ye-nuc7i7dnhe.sh.intel.com ([10.239.154.52])
  by fmsmga006.fm.intel.com with ESMTP; 25 Feb 2023 06:01:14 -0800
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
Subject: [PATCH v2 0/5] Add Intel LJCA device driver
Date:   Sat, 25 Feb 2023 22:01:13 +0800
Message-Id: <20230225140118.2037220-1-xiang.ye@intel.com>
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

