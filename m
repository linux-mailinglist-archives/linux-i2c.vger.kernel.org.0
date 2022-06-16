Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4642954D738
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Jun 2022 03:39:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347985AbiFPBh6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Jun 2022 21:37:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350809AbiFPBh5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 15 Jun 2022 21:37:57 -0400
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5992E4EF75;
        Wed, 15 Jun 2022 18:37:55 -0700 (PDT)
Received: (Authenticated sender: frank@zago.net)
        by mail.gandi.net (Postfix) with ESMTPSA id 5A429200004;
        Thu, 16 Jun 2022 01:37:51 +0000 (UTC)
From:   frank zago <frank@zago.net>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Wolfram Sang <wsa@kernel.org>, Johan Hovold <johan@kernel.org>,
        linux-usb@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        frank zago <frank@zago.net>
Subject: [PATCH v6 0/4] add driver for the WCH CH341 in I2C/GPIO mode
Date:   Wed, 15 Jun 2022 20:37:43 -0500
Message-Id: <20220616013747.126051-1-frank@zago.net>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The CH341 is a multifunction chip, presenting 3 different USB PID. One
of these functions is for I2C/SPI/GPIO. This new set of drivers will
manage I2C and GPIO.

Changes from v5:
Addressed reviewers' comments.
Better handling of 0-bytes i2c commands
Use of better USB API.

Changes from v4:
I should have addressed all the comments: rework of the GPIO interrupt
handling code to be more modern, changes in Kconfig wording, some code
cleanup.
Driver was tested again with up to 4 of these devices. No
error seen.

Changes from v3:
  - really converted to an MFD driver. Driver is now split into 3
    modules (MFD+I2C+GPIO).
  - minor code cleanups

Changes from v2:
  - bug fixes
  - more robust USB enumeration
  - Changed to an MFD driver as suggested

During testing I found that i2c handles hot removal, but not gpio. The
gpio subsystem will complain with 'REMOVING GPIOCHIP WITH GPIOS STILL
REQUESTED', but it's a gpiolib issue.

Changes from v1:
  - Removed double Signed-off-by
  - Move Kconfig into the same directory as the driver

frank zago (4):
  mfd: ch341: add core driver for the WCH CH341 in I2C/SPI/GPIO mode
  gpio: ch341: add GPIO MFD cell driver for the CH341
  i2c: ch341: add I2C MFD cell driver for the CH341
  docs: misc: add documentation for ch341 driver

 Documentation/misc-devices/ch341.rst | 109 ++++++++
 Documentation/misc-devices/index.rst |   1 +
 MAINTAINERS                          |   9 +
 drivers/gpio/Kconfig                 |  10 +
 drivers/gpio/Makefile                |   1 +
 drivers/gpio/gpio-ch341.c            | 385 +++++++++++++++++++++++++++
 drivers/i2c/busses/Kconfig           |  10 +
 drivers/i2c/busses/Makefile          |   1 +
 drivers/i2c/busses/i2c-ch341.c       | 377 ++++++++++++++++++++++++++
 drivers/mfd/Kconfig                  |  10 +
 drivers/mfd/Makefile                 |   1 +
 drivers/mfd/ch341-core.c             |  90 +++++++
 include/linux/mfd/ch341.h            |  26 ++
 13 files changed, 1030 insertions(+)
 create mode 100644 Documentation/misc-devices/ch341.rst
 create mode 100644 drivers/gpio/gpio-ch341.c
 create mode 100644 drivers/i2c/busses/i2c-ch341.c
 create mode 100644 drivers/mfd/ch341-core.c
 create mode 100644 include/linux/mfd/ch341.h

--
2.32.0
