Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39A537BD368
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Oct 2023 08:33:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345251AbjJIGd4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 9 Oct 2023 02:33:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229551AbjJIGd4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 9 Oct 2023 02:33:56 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 265A6B9;
        Sun,  8 Oct 2023 23:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696833234; x=1728369234;
  h=from:to:cc:subject:date:message-id;
  bh=yGGnTiOwfcMWNPVc2G/Q813ixhjZkvPBHMtZp7WfHWA=;
  b=RhzwvGgW2Tay0i90VybRKZkZns+OkvFNviuWP8QAvEoI2Dm5YADqBnL8
   Xzn4lmefIuDYnS11qsVcOtnUIs/FlNvK0FVYdmnsFguae0664Od7KjHK6
   KnSpfiTj7BvEQB11ytKycUE6UPGlZy14RNRWo4QoFwAgsJ7e2LGStV3uA
   usQvzYrJh2mK9SLoCEMu5Ubx+Fgko54HdGoa2V3evU1HsZOcjq5pUV88v
   wTKKe5FGxnJCEBR9T9Wasbv/1BJb1MKvOzpwwQLA3yWdDkoN0yvOA4fie
   w6FwIV34g7coFaIl1w2k+naBsB46w8YvjFda+o6ji+1GKDXTKY7I+OJk0
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="448273533"
X-IronPort-AV: E=Sophos;i="6.03,209,1694761200"; 
   d="scan'208";a="448273533"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2023 23:33:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="896653868"
X-IronPort-AV: E=Sophos;i="6.03,209,1694761200"; 
   d="scan'208";a="896653868"
Received: from shsensorbuild2.sh.intel.com ([10.239.134.197])
  by fmsmga001.fm.intel.com with ESMTP; 08 Oct 2023 23:32:08 -0700
From:   Wentong Wu <wentong.wu@intel.com>
To:     gregkh@linuxfoundation.org, oneukum@suse.com, wsa@kernel.org,
        andi.shyti@linux.intel.com, broonie@kernel.org
Cc:     bartosz.golaszewski@linaro.org, linus.walleij@linaro.org,
        hdegoede@redhat.com, linux-usb@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        sakari.ailus@linux.intel.com, zhifeng.wang@intel.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wentong Wu <wentong.wu@intel.com>
Subject: [PATCH v20 0/4] Add Intel LJCA device driver
Date:   Mon,  9 Oct 2023 14:33:21 +0800
Message-Id: <1696833205-16716-1-git-send-email-wentong.wu@intel.com>
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

Add driver for Intel La Jolla Cove Adapter (LJCA) device. This
IO-expander adds additional functions to the host system with
host USB interface, such as GPIO, I2C and SPI. This patch set
adds four drivers to support this device: a USB device driver,
a GPIO chip driver, a I2C controller driver and a SPI controller
driver.

---
v20:
 - add __counted_by attributes for all of [] arrays
 - use proper kernel doc for ljca_adapter structure
 - re-structure ljca_recv function to make it more clear
 - remove all of scoped_guard
 - check return value of usb_autopm_get_interface()
 - re-structure ljca_enumerate_clients() to handle error correctly
 - add comment for 'uid = "0";' in ljca_match_device_ids()
 - change the parameters' type of ljca_send() to u8

v17 - v19:
 - rebase patch set on top of Linus' master branch (57d88e8a5974644039fbc47806bac7bb12025636)
 - change valid_pins type to __le32 and access valid_pins with get_unaligned_le32
 - remove COMPILE_TEST for USB_LJCA Kconfig

v16:
 - drop all void * and use real types in the exported apis and internal ljca_send()
 - remove #ifdef in usb-ljca.c file
 - add documentation in ljca.h for the public structures
 - add error message in ljca_handle_cmd_ack() if error happens and remove blank line
 - use the functionality in cleanup.h for spinlock to make function much simpler
 - change the type of ex_buf in struct ljca_adapter to u8 *

v14 - v15:
 - enhance disconnect() of usb-ljca driver
 - change memchr to strchr in ljca_match_device_ids() of usb-ljca driver
 - fix build error: implicit declaration of function 'acpi_dev_clear_dependencies'

v13:
 - make ljca-usb more robust with the help of Hans de Goede
 - call acpi_dev_clear_dependencies() to mark _DEP ACPI dependencies on the I2C controller as satisfied
 - avoid err printing because of calling usb_kill_urb when attempts to resubmit the rx urb

v10 - v12:
 - switch dev_err to dev_dbg for i2c-ljca driver
 - remove message length check because of defined quirk structure
 - remove I2C_FUNC_SMBUS_EMUL support
 - remove ljca_i2c_format_slave_addr
 - remove memset before write write w_packet for i2c driver
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
 drivers/gpio/gpio-ljca.c      | 246 +++++++-----
 drivers/i2c/busses/Kconfig    |  11 +
 drivers/i2c/busses/Makefile   |   1 +
 drivers/i2c/busses/i2c-ljca.c | 343 ++++++++++++++++
 drivers/spi/Kconfig           |  11 +
 drivers/spi/Makefile          |   1 +
 drivers/spi/spi-ljca.c        | 297 ++++++++++++++
 drivers/usb/misc/Kconfig      |  13 +
 drivers/usb/misc/Makefile     |   1 +
 drivers/usb/misc/usb-ljca.c   | 902 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/usb/ljca.h      | 145 +++++++
 12 files changed, 1870 insertions(+), 105 deletions(-)
 create mode 100644 drivers/i2c/busses/i2c-ljca.c
 create mode 100644 drivers/spi/spi-ljca.c
 create mode 100644 drivers/usb/misc/usb-ljca.c
 create mode 100644 include/linux/usb/ljca.h

-- 
2.7.4

