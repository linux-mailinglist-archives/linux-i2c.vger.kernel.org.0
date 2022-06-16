Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B01E254D725
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Jun 2022 03:39:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242403AbiFPBif (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Jun 2022 21:38:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344998AbiFPBiO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 15 Jun 2022 21:38:14 -0400
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E22EC57B20;
        Wed, 15 Jun 2022 18:38:11 -0700 (PDT)
Received: (Authenticated sender: frank@zago.net)
        by mail.gandi.net (Postfix) with ESMTPSA id 8B365200003;
        Thu, 16 Jun 2022 01:38:07 +0000 (UTC)
From:   frank zago <frank@zago.net>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Wolfram Sang <wsa@kernel.org>, Johan Hovold <johan@kernel.org>,
        linux-usb@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        frank zago <frank@zago.net>
Subject: [PATCH v6 4/4] docs: misc: add documentation for ch341 driver
Date:   Wed, 15 Jun 2022 20:37:47 -0500
Message-Id: <20220616013747.126051-5-frank@zago.net>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220616013747.126051-1-frank@zago.net>
References: <20220616013747.126051-1-frank@zago.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Document the multifunction CH341 chip driver, in GPIO and I2C mode.

Signed-off-by: frank zago <frank@zago.net>
---
 Documentation/misc-devices/ch341.rst | 109 +++++++++++++++++++++++++++
 Documentation/misc-devices/index.rst |   1 +
 2 files changed, 110 insertions(+)
 create mode 100644 Documentation/misc-devices/ch341.rst

diff --git a/Documentation/misc-devices/ch341.rst b/Documentation/misc-devices/ch341.rst
new file mode 100644
index 000000000000..65ba293bdc2d
--- /dev/null
+++ b/Documentation/misc-devices/ch341.rst
@@ -0,0 +1,109 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+===========================================================
+WinChipHead (沁恒) CH341 linux driver for I2C and GPIO mode
+===========================================================
+
+The CH341 is declined in several flavors, and may support one or more
+of UART, SPI, I2C and GPIO, but not always simultaneously:
+
+  - CH341 A/B/F: UART, Printer, SPI, I2C and GPIO
+  - CH341 C/T: UART and I2C
+  - CH341 H: SPI
+
+They work in 3 different modes, with only one being presented
+depending on the USB PID:
+
+  - 0x5523: UART mode, covered by the USB `ch341` serial driver
+  - 0x5512: SPI/I2C/GPIO mode, covered by the ch341 MFD drivers
+  - 0x5584: Parallel printer mode, covered by the USB `usblp` driver
+
+Mode selection is done at the hardware level by tying some
+pins. Breakout boards with one of the CH341 chip usually have one or
+more jumpers to select which mode they work on. At least one model
+(CJMCU-341) appears to need bridging some solder pads to select a
+different default. Breakout boards also don't usually offer an option
+to configure the chip into printer mode; for that case, connect the
+SCL and SDA lines directly together.
+
+The various CH341 appear to be indistinguishable from the
+software. For instance the ch341 MFD driver will present a GPIO
+interface for the CH341T although physical pins are not present, and
+the device will accept GPIO commands.
+
+The ch341 MFD driver has been tested with a CH341A, CH341B and
+CH341T.
+
+Some breakout boards work in 3.3V and 5V depending on some jumpers.
+
+The black chip programmer with a ZIF socket will power the CH341 at
+3.3V if a jumper is set, but will only output 5V to the chips to be
+programmed, which is not always desirable. A hardware hack to use 3.3V
+everywhere, involving some soldering, is available at
+https://eevblog.com/forum/repair/ch341a-serial-memory-programmer-power-supply-fix/
+
+Some sample code for the CH341 is available at the manufacturer
+website, at http://wch-ic.com/products/CH341.html
+
+The repository at https://github.com/boseji/CH341-Store contains a lot
+of information on these chips, including datasheets.
+
+This driver is based on the pre-existing work at
+https://github.com/gschorcht/i2c-ch341-usb
+
+
+I2C Caveats
+-----------
+
+The ch341 doesn't work with a Wii nunchuk, possibly because the
+pull-up value is too low (1500 ohms).
+
+i2c AT24 eeproms can be read but not programmed properly because the
+at24 linux driver tries to write a byte at a time, and doesn't wait at
+all (or enough) between writes. Data corruption on writes does occur.
+
+
+The GPIOs
+---------
+
+16 GPIOs are available on the CH341 A/B/F. The first 6 are input/output,
+and the last 10 are input only.
+
+Pinout and their names as they appear on some breakout boards::
+
+  CH341A/B/F     GPIO  Names                    Mode
+    pin          line
+
+   15             0     D0, CS0                  input/output
+   16             1     D1, CS1                  input/output
+   17             2     D2, CS2                  input/output
+   18             3     D3, SCK, DCK             input/output
+   19             4     D4, DOUT2, CS3           input/output
+   20             5     D5, MOSI, DOUT, SDO      input/output
+   21             6     D6, DIN2                 input
+   22             7     D7, MISO, DIN            input
+    5             8     ERR                      input
+    6             9     PEMP                     input
+    7            10     INT                      input
+    8            11     SLCT (SELECT)            input
+   26            12     RST# (?)                 input
+   27            13     WT (WAIT)                input
+    4            14     DS (Data Select?)        input
+    3            15     AS (Address Select?)     input
+
+
+GPIO interrupt
+~~~~~~~~~~~~~~
+
+The INT pin, corresponding to GPIO 10 is an input pin that can trigger
+an interrupt on a rising edge. Only that pin is able to generate an
+interrupt, and only on a rising edge. Trying to monitor events on
+another GPIO, or that GPIO on something other than a rising edge, will
+be rejected.
+
+
+SPI
+---
+
+This driver doesn't offer an SPI interface (yet) due to the
+impossibility of declaring an SPI device like I2C does.
diff --git a/Documentation/misc-devices/index.rst b/Documentation/misc-devices/index.rst
index 756be15a49a4..e85531a4f354 100644
--- a/Documentation/misc-devices/index.rst
+++ b/Documentation/misc-devices/index.rst
@@ -19,6 +19,7 @@ fit into other categories.
    bh1770glc
    eeprom
    c2port
+   ch341
    dw-xdata-pcie
    ibmvmc
    ics932s401
-- 
2.32.0

