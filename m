Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E00CE7A31FE
	for <lists+linux-i2c@lfdr.de>; Sat, 16 Sep 2023 20:54:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230476AbjIPSyH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 16 Sep 2023 14:54:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230409AbjIPSxu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 16 Sep 2023 14:53:50 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4434CE3;
        Sat, 16 Sep 2023 11:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694890425; x=1726426425;
  h=from:to:cc:subject:date:message-id;
  bh=Badz5cO4bHR5VDqvD0/ig1Ju0hG2Le0ckCgBrC+TMOU=;
  b=bWDDgVu2M1bWavaxKDzRJQ2WlXcxPJ2V07uH+hBIEuNEBkZJbHJ7VMuS
   QlpB+n4d8FvPMhMOAcxqbIn/GRUsmZvv1DWNxu/wfIh8gQXmR9DUFm1G+
   h9qAfOv2Df75tnOzOxI3Qtx81/IDoD4dxnGhRcjfGL+Wi7pgkjHR9Nhh7
   KrSN3415SPeFk5KTj/50L8BM0tAQ5Ofr2WFHxuVbueMyzeeLxEVq8gd42
   uFq3dBPcGv7QhPTD0QY1ErYdZj9aNfGppsgCS/HGGmqbMdDDNSwCPK01v
   /WB0+tDctu0lJmPfIds+QeJcVch+9q0Z3YQHPMEOluTAJ9/oW9Um7q8X1
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10835"; a="465794001"
X-IronPort-AV: E=Sophos;i="6.02,152,1688454000"; 
   d="scan'208";a="465794001"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2023 11:53:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10835"; a="810907545"
X-IronPort-AV: E=Sophos;i="6.02,152,1688454000"; 
   d="scan'208";a="810907545"
Received: from shsensorbuild2.sh.intel.com ([10.239.134.197])
  by fmsmga008.fm.intel.com with ESMTP; 16 Sep 2023 11:53:39 -0700
From:   Wentong Wu <wentong.wu@intel.com>
To:     gregkh@linuxfoundation.org, arnd@arndb.de, mka@chromium.org,
        oneukum@suse.com, lee@kernel.org, wsa@kernel.org,
        kfting@nuvoton.com, broonie@kernel.org, linus.walleij@linaro.org,
        hdegoede@redhat.com, maz@kernel.org, brgl@bgdev.pl,
        linux-usb@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-gpio@vger.kernel.org,
        andriy.shevchenko@linux.intel.com, heikki.krogerus@linux.intel.com,
        andi.shyti@linux.intel.com, sakari.ailus@linux.intel.com,
        bartosz.golaszewski@linaro.org, srinivas.pandruvada@intel.com
Cc:     zhifeng.wang@intel.com, Wentong Wu <wentong.wu@intel.com>
Subject: [PATCH v19 0/4] Add Intel LJCA device driver
Date:   Sun, 17 Sep 2023 02:53:32 +0800
Message-Id: <1694890416-14409-1-git-send-email-wentong.wu@intel.com>
X-Mailer: git-send-email 2.7.4
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add driver for Intel La Jolla Cove Adapter (LJCA) device. This
IO-expander adds additional functions to the host system such
as GPIO, I2C and SPI with USB host interface. We add 4 drivers
to support this device: a USB driver, a GPIO chip driver, a I2C
controller driver and a SPI controller driver.

---
v19:
 - add v17's change which v18 doesn't apply

v18:
 - rebase patch set on top of Linus' master branch (57d88e8a5974644039fbc47806bac7bb12025636)

v17:
 - change valid_pins type to __le32 and access valid_pins with get_unaligned_le32
 - remove COMPILE_TEST for USB_LJCA Kconfig

v16:
 - drop all void * and use real types in the exported apis and internal ljca_send()
 - remove #ifdef in usb-ljca.c file
 - add documentation in ljca.h for the public structures
 - add error message in ljca_handle_cmd_ack() if error happens and remove blank line
 - use the functionality in cleanup.h for spinlock to make function much simpler
 - change the type of ex_buf in struct ljca_adapter to u8 *

v15:
 - enhance disconnect() of usb-ljca driver
 - change memchr to strchr in ljca_match_device_ids() of usb-ljca driver

v14:
 - fix build error: implicit declaration of function 'acpi_dev_clear_dependencies'

v13:
 - make ljca-usb more robust with the help of Hans de Goede
 - call acpi_dev_clear_dependencies() to mark _DEP ACPI dependencies on the I2C controller as satisfied, and patch is from Hans de Goede

v12:
 - switch dev_err to dev_dbg for i2c-ljca driver
 - avoid err printing because of calling usb_kill_urb when attempts to resubmit the rx urb

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
 drivers/i2c/busses/i2c-ljca.c | 342 +++++++++++++++++
 drivers/spi/Kconfig           |  11 +
 drivers/spi/Makefile          |   1 +
 drivers/spi/spi-ljca.c        | 297 +++++++++++++++
 drivers/usb/misc/Kconfig      |  13 +
 drivers/usb/misc/Makefile     |   1 +
 drivers/usb/misc/usb-ljca.c   | 837 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/usb/ljca.h      | 145 ++++++++
 12 files changed, 1804 insertions(+), 105 deletions(-)
 create mode 100644 drivers/i2c/busses/i2c-ljca.c
 create mode 100644 drivers/spi/spi-ljca.c
 create mode 100644 drivers/usb/misc/usb-ljca.c
 create mode 100644 include/linux/usb/ljca.h

-- 
2.7.4

