Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9381569C1DE
	for <lists+linux-i2c@lfdr.de>; Sun, 19 Feb 2023 19:31:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231249AbjBSSbG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 19 Feb 2023 13:31:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231248AbjBSSbF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 19 Feb 2023 13:31:05 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16F6D12060;
        Sun, 19 Feb 2023 10:31:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676831464; x=1708367464;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=rxO9Sfhn2wj9n4LS9X8ZK7gT0EqU8TJ1InY3k6whKXs=;
  b=l7WsVR1LayXxMgnukUnWOROd5qoTPucRkmWtvbhPnKA9YY2I4gXj4gd7
   uZOpJJLSLY8+n++eY7TYQo+eeBK7v1QGcW26Te/uUOCc8l7J34lvZAj19
   5FCbpxX/SU08CspaLIsTOkfuJP2gWE65j5EJkdTx8QzzvaGk0cnEl2/Sh
   hhmDeXK7bu4oeE18YB6KWIPYaGZSy/u8UytHIuUDS7Bdi2JzrjEkT2lPM
   dN3FclftfGAHK6R+lVVVQuUEoPihdOuO8sTjA21wbmVkT+iidCRvoE77/
   7IP7tyZDLYFKWU62iS0vHhGtzo77n3CnXmEBfKH3Bjiz9ouXaF4oiOB7P
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="333634347"
X-IronPort-AV: E=Sophos;i="5.97,310,1669104000"; 
   d="scan'208";a="333634347"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2023 10:31:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="845107088"
X-IronPort-AV: E=Sophos;i="5.97,310,1669104000"; 
   d="scan'208";a="845107088"
Received: from ye-nuc7i7dnhe.sh.intel.com ([10.239.154.52])
  by orsmga005.jf.intel.com with ESMTP; 19 Feb 2023 10:30:57 -0800
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
Subject: [PATCH 0/5] Add Intel LJCA device driver
Date:   Mon, 20 Feb 2023 02:30:54 +0800
Message-Id: <20230219183059.1029525-1-xiang.ye@intel.com>
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

Ye Xiang (5):
  mfd: Add support for Intel LJCA device
  gpio: Add support for Intel LJCA USB GPIO driver
  i2c: Add support for Intel LJCA USB I2C driver
  spi: Add support for Intel LJCA USB SPI driver
  Documentation: Add ABI doc for attributes of LJCA device

 .../ABI/testing/sysfs-bus-usb-devices-ljca    |  22 +
 drivers/gpio/Kconfig                          |  10 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-ljca.c                      | 454 ++++++++
 drivers/i2c/busses/Kconfig                    |  10 +
 drivers/i2c/busses/Makefile                   |   1 +
 drivers/i2c/busses/i2c-ljca.c                 | 357 +++++++
 drivers/mfd/Kconfig                           |  13 +
 drivers/mfd/Makefile                          |   1 +
 drivers/mfd/ljca.c                            | 977 ++++++++++++++++++
 drivers/spi/Kconfig                           |  10 +
 drivers/spi/Makefile                          |   1 +
 drivers/spi/spi-ljca.c                        | 291 ++++++
 include/linux/mfd/ljca.h                      |  95 ++
 14 files changed, 2243 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-usb-devices-ljca
 create mode 100644 drivers/gpio/gpio-ljca.c
 create mode 100644 drivers/i2c/busses/i2c-ljca.c
 create mode 100644 drivers/mfd/ljca.c
 create mode 100644 drivers/spi/spi-ljca.c
 create mode 100644 include/linux/mfd/ljca.h

-- 
2.34.1

