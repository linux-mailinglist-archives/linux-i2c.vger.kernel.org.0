Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 903947A31EA
	for <lists+linux-i2c@lfdr.de>; Sat, 16 Sep 2023 20:38:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237290AbjIPSiY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 16 Sep 2023 14:38:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229732AbjIPSht (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 16 Sep 2023 14:37:49 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D11CFCE3;
        Sat, 16 Sep 2023 11:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694889464; x=1726425464;
  h=from:to:cc:subject:date:message-id;
  bh=AT5WWxI9hLwFEV51mkyCPpGP+L0vQQIaLfZ7jwJnb8A=;
  b=GRwFCWWrCzo3yeKDlyp7IfnTf5oSxlhd3VuPUOjCgjQaDipnGCUhwp9T
   UST0bRL3QGGZyeicmpYDSHqG31C33DuGxX29okOtpmgTK+maswRhqAwH8
   OQrd0xNaQr9s5M+sujEs52FQ4eZ/Uo0Ng7BW8GRFFDJg636S4HM/jQByC
   PW4w2jUOHrnBrbYqd4h9PUz2JItjZY3E3gzB6V6yVPxqwHpuePdjf/MLc
   ts5LcEfUW16Nl2KNdgr3LFC1hXJfSeBa8+3a1aO6E9Llrm2lSSH2JMYsL
   nYrf/MjO29jyAadJcnTjH6Dk2XrkHQ7tdN88ue7KT1iSytE+kqFtKPlAX
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10835"; a="383273388"
X-IronPort-AV: E=Sophos;i="6.02,152,1688454000"; 
   d="scan'208";a="383273388"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2023 11:37:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10835"; a="745372022"
X-IronPort-AV: E=Sophos;i="6.02,152,1688454000"; 
   d="scan'208";a="745372022"
Received: from shsensorbuild2.sh.intel.com ([10.239.134.197])
  by orsmga002.jf.intel.com with ESMTP; 16 Sep 2023 11:37:27 -0700
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
Subject: [PATCH v18 0/4] Add Intel LJCA device driver
Date:   Sun, 17 Sep 2023 02:37:17 +0800
Message-Id: <1694889441-7024-1-git-send-email-wentong.wu@intel.com>
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
 drivers/usb/misc/Kconfig      |  14 +
 drivers/usb/misc/Makefile     |   1 +
 drivers/usb/misc/usb-ljca.c   | 835 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/usb/ljca.h      | 145 ++++++++
 12 files changed, 1803 insertions(+), 105 deletions(-)
 create mode 100644 drivers/i2c/busses/i2c-ljca.c
 create mode 100644 drivers/spi/spi-ljca.c
 create mode 100644 drivers/usb/misc/usb-ljca.c
 create mode 100644 include/linux/usb/ljca.h

-- 
2.7.4

