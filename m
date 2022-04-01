Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B815C4EE62A
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Apr 2022 04:45:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244177AbiDACpq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 31 Mar 2022 22:45:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231317AbiDACpo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 31 Mar 2022 22:45:44 -0400
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89537141D98;
        Thu, 31 Mar 2022 19:43:55 -0700 (PDT)
Received: from relay1-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::221])
        by mslow1.mail.gandi.net (Postfix) with ESMTP id DB075C791A;
        Fri,  1 Apr 2022 02:33:43 +0000 (UTC)
Received: (Authenticated sender: frank@zago.net)
        by mail.gandi.net (Postfix) with ESMTPSA id 6E6BD240003;
        Fri,  1 Apr 2022 02:33:18 +0000 (UTC)
From:   frank zago <frank@zago.net>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Wolfram Sang <wsa@kernel.org>, Johan Hovold <johan@kernel.org>,
        linux-usb@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        frank zago <frank@zago.net>
Subject: [PATCH v5 0/3] WCH CH341 GPIO and SPI support
Date:   Thu, 31 Mar 2022 21:33:03 -0500
Message-Id: <20220401023306.79532-1-frank@zago.net>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_MSPIKE_H2,
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


frank zago (3):
  mfd: ch341: add core driver for the WCH CH341 in I2C/SPI/GPIO mode
  gpio: ch341: add GPIO MFD cell driver for the CH341
  i2c: ch341: add I2C MFD cell driver for the CH341

 Documentation/misc-devices/ch341.rst | 114 ++++++++
 Documentation/misc-devices/index.rst |   1 +
 MAINTAINERS                          |   9 +
 drivers/gpio/Kconfig                 |  10 +
 drivers/gpio/Makefile                |   1 +
 drivers/gpio/gpio-ch341.c            | 383 +++++++++++++++++++++++++++
 drivers/i2c/busses/Kconfig           |  10 +
 drivers/i2c/busses/Makefile          |   1 +
 drivers/i2c/busses/i2c-ch341.c       | 331 +++++++++++++++++++++++
 drivers/mfd/Kconfig                  |  10 +
 drivers/mfd/Makefile                 |   1 +
 drivers/mfd/ch341-core.c             | 105 ++++++++
 include/linux/mfd/ch341.h            |  26 ++
 13 files changed, 1002 insertions(+)
 create mode 100644 Documentation/misc-devices/ch341.rst
 create mode 100644 drivers/gpio/gpio-ch341.c
 create mode 100644 drivers/i2c/busses/i2c-ch341.c
 create mode 100644 drivers/mfd/ch341-core.c
 create mode 100644 include/linux/mfd/ch341.h

--
2.32.0
