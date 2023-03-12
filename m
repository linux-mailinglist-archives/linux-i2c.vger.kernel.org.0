Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4FF16B6A67
	for <lists+linux-i2c@lfdr.de>; Sun, 12 Mar 2023 20:04:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230289AbjCLTEe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 12 Mar 2023 15:04:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229713AbjCLTEd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 12 Mar 2023 15:04:33 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78A8C172A;
        Sun, 12 Mar 2023 12:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678647872; x=1710183872;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=TSnwn0TySxJCCKYtlGkoxoE5mTRoz3cqkkbx1mBjmF0=;
  b=emWN2z1PQmhs+dYifm/n5DwDi3aEZp3+Lgkv+STAY2ohDvj2c6KZdCfc
   Irl2oAhW06KXrZU78clqGf1DWybtFkn9tcvseqwGp70o6FrV5Dg73tSjY
   SOM+vuoTwsa9tVlffp44yNRo8mGBw3Pvl7J6xt13cYRdG2ZoXXG0sKco8
   T6yiTYPo5OwP+Mj6N283nyMOOnrWUXm6GLXNhv1RQ3L/Nt+9KxjobwmtW
   aNtF8qiESQL3l4YWcETXPB6PjCU2aabDHjQYOwgvr26EleANk3Zhnuavi
   EZtMlboGnvSMWjrwP0ayeD1I3kpfMzrk/Hzw3QQMBWmeqm4FHGmaSjGbg
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="338568291"
X-IronPort-AV: E=Sophos;i="5.98,254,1673942400"; 
   d="scan'208";a="338568291"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2023 12:04:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="655749326"
X-IronPort-AV: E=Sophos;i="5.98,254,1673942400"; 
   d="scan'208";a="655749326"
Received: from ye-nuc7i7dnhe.sh.intel.com ([10.239.154.52])
  by orsmga006.jf.intel.com with ESMTP; 12 Mar 2023 12:04:27 -0700
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
Subject: [PATCH v5 0/5] Add Intel LJCA device driver
Date:   Mon, 13 Mar 2023 03:04:30 +0800
Message-Id: <20230312190435.3568212-1-xiang.ye@intel.com>
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

Ye Xiang (5):
  usb: Add support for Intel LJCA device
  gpio: Add support for Intel LJCA USB GPIO driver
  i2c: Add support for Intel LJCA USB I2C driver
  spi: Add support for Intel LJCA USB SPI driver
  Documentation: Add ABI doc for attributes of LJCA device

 .../ABI/testing/sysfs-bus-usb-devices-ljca    |  36 +
 drivers/gpio/Kconfig                          |  12 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-ljca.c                      | 459 ++++++++
 drivers/i2c/busses/Kconfig                    |  11 +
 drivers/i2c/busses/Makefile                   |   1 +
 drivers/i2c/busses/i2c-ljca.c                 | 355 +++++++
 drivers/spi/Kconfig                           |  11 +
 drivers/spi/Makefile                          |   1 +
 drivers/spi/spi-ljca.c                        | 293 +++++
 drivers/usb/misc/Kconfig                      |  13 +
 drivers/usb/misc/Makefile                     |   1 +
 drivers/usb/misc/ljca.c                       | 998 ++++++++++++++++++
 include/linux/usb/ljca.h                      |  95 ++
 14 files changed, 2287 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-usb-devices-ljca
 create mode 100644 drivers/gpio/gpio-ljca.c
 create mode 100644 drivers/i2c/busses/i2c-ljca.c
 create mode 100644 drivers/spi/spi-ljca.c
 create mode 100644 drivers/usb/misc/ljca.c
 create mode 100644 include/linux/usb/ljca.h

-- 
2.34.1

