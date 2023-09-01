Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 325A478F808
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Sep 2023 07:36:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232555AbjIAFgs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 1 Sep 2023 01:36:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229981AbjIAFgr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 1 Sep 2023 01:36:47 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 818EAE7E;
        Thu, 31 Aug 2023 22:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693546604; x=1725082604;
  h=from:to:cc:subject:date:message-id;
  bh=Hf+9nKywTFho0y3AAeFfQEW/5aoDPESNDVEammXwi0s=;
  b=bc4gOqWeQxtPqJsomoS1t/KHFNsmXYzEAqxSs51Z06fWG9uOh8KK15b1
   62frgjGoSLEeZps9+gpHGc1gKkdahHXDKI18Ckg8kH0lDwBhriAW2KvHv
   EzMR8+KTfw+hks6GcT/3v7zvSuLsiz+AGSNFbFQ2OVKTL3xnsM9Dr0W3s
   CGf0qcheKyhD3LB/hgf0Nf2vJW2eSTfBj+xjMu6tGabDl3FYoY9irRzQZ
   W/aHZ3jkftzQRfE714eCJgW/9TPnK9rVJ4MEvOwV7Q7y6fisUSD3D5fRs
   D0qag70rDYEIbkQS91V9HVTeEvFYwSSaW8AkIhqRyMf6ZCqTu2lF/Avlu
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="442535142"
X-IronPort-AV: E=Sophos;i="6.02,218,1688454000"; 
   d="scan'208";a="442535142"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 22:36:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="774871909"
X-IronPort-AV: E=Sophos;i="6.02,218,1688454000"; 
   d="scan'208";a="774871909"
Received: from shsensorbuild2.sh.intel.com ([10.239.134.197])
  by orsmga001.jf.intel.com with ESMTP; 31 Aug 2023 22:36:38 -0700
From:   Wentong Wu <wentong.wu@intel.com>
To:     gregkh@linuxfoundation.org, arnd@arndb.de, mka@chromium.org,
        oneukum@suse.com, lee@kernel.org, wsa@kernel.org,
        kfting@nuvoton.com, broonie@kernel.org, linus.walleij@linaro.org,
        maz@kernel.org, brgl@bgdev.pl, linux-usb@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-gpio@vger.kernel.org, andriy.shevchenko@linux.intel.com,
        heikki.krogerus@linux.intel.com, andi.shyti@linux.intel.com,
        sakari.ailus@linux.intel.com, bartosz.golaszewski@linaro.org,
        srinivas.pandruvada@intel.com
Cc:     zhifeng.wang@intel.com, Wentong Wu <wentong.wu@intel.com>
Subject: [PATCH v12 0/4] Add Intel LJCA device driver
Date:   Fri,  1 Sep 2023 13:36:13 +0800
Message-Id: <1693546577-17824-1-git-send-email-wentong.wu@intel.com>
X-Mailer: git-send-email 2.7.4
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add driver for Intel La Jolla Cove Adapter (LJCA) device. This is
a USB-GPIO, USB-I2C and USB-SPI device. We add 4 drivers to support
this device: a USB driver, a GPIO chip driver, a I2C controller
driver and a SPI controller driver.

---
v12:
 - switch dev_err to dev_dbg for i2c-ljca driver
 - avoid err printing because of calling usb_kill_urb when
attempts to resubmit the rx urb

v11:
 - switch dev_err to dev_dbg for i2c-ljca driver
 - remove message length check because of defined quirk structure
 - remove I2C_FUNC_SMBUS_EMUL support

v10:
 - remove ljca_i2c_format_slave_addr
 - remove memset before write write w_packet
 - make ljca_i2c_stop void and print err message in case failure
 - use dev_err_probe in ljca_i2c_probe function

v9:
 - overhaul usb-ljca driver to make it more structured and easy understand
 - fix memory leak issue for usb-ljca driver
 - add spinlock to protect tx_buf and ex_buf
 - change exported APIs for usb-ljca driver
 - unify prefix for structures and functions for i2c-ljca driver
 - unify prefix for structures and functions for spi-ljca driver
 - unify prefix for structures and functions for gpio-ljca driver
 - update gpio-ljca, i2c-ljca and spi-ljca drivers according to usb-ljca's changes

Wentong Wu (4):
  usb: Add support for Intel LJCA device
  i2c: Add support for Intel LJCA USB I2C driver
  spi: Add support for Intel LJCA USB SPI driver
  gpio: update Intel LJCA USB GPIO driver

 drivers/gpio/Kconfig          |   4 +-
 drivers/gpio/gpio-ljca.c      | 246 +++++++------
 drivers/i2c/busses/Kconfig    |  11 +
 drivers/i2c/busses/Makefile   |   1 +
 drivers/i2c/busses/i2c-ljca.c | 326 +++++++++++++++++
 drivers/spi/Kconfig           |  11 +
 drivers/spi/Makefile          |   1 +
 drivers/spi/spi-ljca.c        | 297 +++++++++++++++
 drivers/usb/misc/Kconfig      |  14 +
 drivers/usb/misc/Makefile     |   1 +
 drivers/usb/misc/usb-ljca.c   | 817 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/usb/ljca.h      | 113 ++++++
 12 files changed, 1737 insertions(+), 105 deletions(-)
 create mode 100644 drivers/i2c/busses/i2c-ljca.c
 create mode 100644 drivers/spi/spi-ljca.c
 create mode 100644 drivers/usb/misc/usb-ljca.c
 create mode 100644 include/linux/usb/ljca.h

-- 
2.7.4

