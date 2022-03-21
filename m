Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E2F44E1F88
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Mar 2022 05:31:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344332AbiCUEcd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Mar 2022 00:32:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244277AbiCUEcb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Mar 2022 00:32:31 -0400
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B262330F5C;
        Sun, 20 Mar 2022 21:31:02 -0700 (PDT)
Received: from relay2-d.mail.gandi.net (unknown [217.70.183.194])
        by mslow1.mail.gandi.net (Postfix) with ESMTP id 1800FC96C2;
        Mon, 21 Mar 2022 04:22:02 +0000 (UTC)
Received: (Authenticated sender: frank@zago.net)
        by mail.gandi.net (Postfix) with ESMTPSA id 4DDB740002;
        Mon, 21 Mar 2022 04:21:49 +0000 (UTC)
From:   frank zago <frank@zago.net>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Wolfram Sang <wsa@kernel.org>, Johan Hovold <johan@kernel.org>,
        linux-usb@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        frank zago <frank@zago.net>
Subject: [PATCH v4 1/3] mfd: ch341: add core driver for the WCH CH341 in I2C/GPIO mode
Date:   Sun, 20 Mar 2022 23:21:40 -0500
Message-Id: <20220321042142.69239-2-frank@zago.net>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220321042142.69239-1-frank@zago.net>
References: <20220321042142.69239-1-frank@zago.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The CH341 is a multifunction chip, presenting 3 different USB PID. One
of these functions is for I2C/SPI/GPIO. This new set of drivers will
manage I2C and GPIO.

Signed-off-by: frank zago <frank@zago.net>
---
 Documentation/misc-devices/ch341.rst | 114 +++++++++++++++++++++++++++
 Documentation/misc-devices/index.rst |   1 +
 MAINTAINERS                          |   7 ++
 drivers/mfd/Kconfig                  |  12 +++
 drivers/mfd/Makefile                 |   1 +
 drivers/mfd/ch341-core.c             | 103 ++++++++++++++++++++++++
 include/linux/mfd/ch341.h            |  25 ++++++
 7 files changed, 263 insertions(+)
 create mode 100644 Documentation/misc-devices/ch341.rst
 create mode 100644 drivers/mfd/ch341-core.c
 create mode 100644 include/linux/mfd/ch341.h

diff --git a/Documentation/misc-devices/ch341.rst b/Documentation/misc-devices/ch341.rst
new file mode 100644
index 000000000000..a4884918cd32
--- /dev/null
+++ b/Documentation/misc-devices/ch341.rst
@@ -0,0 +1,114 @@
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
+  - 0x5512: SPI/I2C/GPIO mode, covered by the MFD `ch341-mfd` driver
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
+The driver doesn't support detection of I2C device present on the
+bus. Apparently when a device is not present at a given address, the
+CH341 will return an extra byte of data, but the driver doesn't
+support that. This may be addressed in the future.
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
index 30ac58f81901..190f93b56ec6 100644
--- a/Documentation/misc-devices/index.rst
+++ b/Documentation/misc-devices/index.rst
@@ -29,3 +29,4 @@ fit into other categories.
    spear-pcie-gadget
    uacce
    xilinx_sdfec
+   ch341
diff --git a/MAINTAINERS b/MAINTAINERS
index cd0f68d4a34a..a6b2805fd1a1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20845,6 +20845,13 @@ M:	David Härdeman <david@hardeman.nu>
 S:	Maintained
 F:	drivers/media/rc/winbond-cir.c
 
+WINCHIPHEAD CH341 I2C/GPIO MFD DRIVER
+M:	Frank Zago <frank@zago.net>
+L:	linux-usb@vger.kernel.org
+S:	Maintained
+F:	drivers/mfd/ch341-core.c
+F:	include/linux/mfd/ch341.h
+
 WINSYSTEMS EBC-C384 WATCHDOG DRIVER
 M:	William Breathitt Gray <vilhelm.gray@gmail.com>
 L:	linux-watchdog@vger.kernel.org
diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index ba0b3eb131f1..84067e454c90 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1778,6 +1778,18 @@ config MFD_LOCHNAGAR
 	help
 	  Support for Cirrus Logic Lochnagar audio development board.
 
+config MFD_CH341
+	tristate "WinChipHead CH341 in I2C/SPI/GPIO mode"
+	depends on USB
+	help
+	  If you say yes to this option, support for the CH341 series
+	  of chips, running in I2C/SPI/GPIO mode will be included.
+
+	  The chip's SPI mode is not supported.
+
+	  This driver can also be built as a module.  If so, the
+	  module will be called ch341-core.
+
 config MFD_ARIZONA
 	select REGMAP
 	select REGMAP_IRQ
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index df1ecc4a4c95..a0364a0d5e33 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -13,6 +13,7 @@ obj-$(CONFIG_MFD_ASIC3)		+= asic3.o tmio_core.o
 obj-$(CONFIG_ARCH_BCM2835)	+= bcm2835-pm.o
 obj-$(CONFIG_MFD_BCM590XX)	+= bcm590xx.o
 obj-$(CONFIG_MFD_BD9571MWV)	+= bd9571mwv.o
+obj-$(CONFIG_MFD_CH341)		+= ch341-core.o
 obj-$(CONFIG_MFD_CROS_EC_DEV)	+= cros_ec_dev.o
 obj-$(CONFIG_MFD_ENE_KB3930)	+= ene-kb3930.o
 obj-$(CONFIG_MFD_EXYNOS_LPASS)	+= exynos-lpass.o
diff --git a/drivers/mfd/ch341-core.c b/drivers/mfd/ch341-core.c
new file mode 100644
index 000000000000..fbb2897cd956
--- /dev/null
+++ b/drivers/mfd/ch341-core.c
@@ -0,0 +1,103 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Core driver for the CH341A, CH341B and CH341T in I2C/SPI/GPIO
+ * mode. There are cell drivers available for I2C and GPIO. SPI is not
+ * yet supported.
+ *
+ * Copyright 2022, Frank Zago
+ * Copyright (c) 2017 Gunar Schorcht (gunar@schorcht.net)
+ * Copyright (c) 2016 Tse Lun Bien
+ * Copyright (c) 2014 Marco Gittler
+ * Copyright (c) 2006-2007 Till Harbaum (Till@Harbaum.org)
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/mfd/core.h>
+
+#include <linux/mfd/ch341.h>
+
+static const struct mfd_cell ch341_devs[] = {
+};
+
+static int ch341_usb_probe(struct usb_interface *iface,
+			   const struct usb_device_id *usb_id)
+{
+	struct usb_host_endpoint *endpoints;
+	struct ch341_device *dev;
+	int rc;
+
+	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
+	if (!dev)
+		return -ENOMEM;
+
+	dev->usb_dev = usb_get_dev(interface_to_usbdev(iface));
+	dev->iface = iface;
+	mutex_init(&dev->usb_lock);
+
+	if (iface->cur_altsetting->desc.bNumEndpoints != 3) {
+		rc = -ENODEV;
+		goto free_dev;
+	}
+
+	endpoints = iface->cur_altsetting->endpoint;
+	if (!usb_endpoint_is_bulk_in(&endpoints[0].desc) ||
+	    !usb_endpoint_is_bulk_out(&endpoints[1].desc) ||
+	    !usb_endpoint_xfer_int(&endpoints[2].desc)) {
+		rc = -ENODEV;
+		goto free_dev;
+	}
+
+	dev->ep_in = endpoints[0].desc.bEndpointAddress;
+	dev->ep_out = endpoints[1].desc.bEndpointAddress;
+	dev->ep_intr = endpoints[2].desc.bEndpointAddress;
+	dev->ep_intr_interval = endpoints[2].desc.bInterval;
+
+	usb_set_intfdata(iface, dev);
+
+	rc = mfd_add_hotplug_devices(&iface->dev, ch341_devs,
+				     ARRAY_SIZE(ch341_devs));
+	if (rc) {
+		dev_err(&iface->dev, "Failed to add mfd devices to core.");
+		goto free_dev;
+	}
+
+	return 0;
+
+free_dev:
+	usb_put_dev(dev->usb_dev);
+	kfree(dev);
+
+	return rc;
+}
+
+static void ch341_usb_disconnect(struct usb_interface *usb_if)
+{
+	struct ch341_device *dev = usb_get_intfdata(usb_if);
+
+	mfd_remove_devices(&usb_if->dev);
+	usb_set_intfdata(dev->iface, NULL);
+	usb_put_dev(dev->usb_dev);
+	kfree(dev);
+}
+
+static const struct usb_device_id ch341_usb_table[] = {
+	{ USB_DEVICE(0x1a86, 0x5512) },
+	{ }
+};
+
+MODULE_DEVICE_TABLE(usb, ch341_usb_table);
+
+static struct usb_driver ch341_usb_driver = {
+	.name       = "ch341-mfd",
+	.id_table   = ch341_usb_table,
+	.probe      = ch341_usb_probe,
+	.disconnect = ch341_usb_disconnect
+};
+
+module_usb_driver(ch341_usb_driver);
+
+MODULE_AUTHOR("Various");
+MODULE_DESCRIPTION("CH341 USB to I2C/SPI/GPIO adapter");
+MODULE_LICENSE("GPL v2");
diff --git a/include/linux/mfd/ch341.h b/include/linux/mfd/ch341.h
new file mode 100644
index 000000000000..246159477cdf
--- /dev/null
+++ b/include/linux/mfd/ch341.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Definitions for CH341 MFD driver
+ */
+
+#include <linux/usb.h>
+#include <linux/mutex.h>
+
+#define DEFAULT_TIMEOUT 1000	/* 1s USB requests timeout */
+
+/* All commands fit inside a 32-byte segment. There may be several
+ * of these segments in a USB command.
+ */
+#define SEG_SIZE 32
+
+struct ch341_device {
+	struct usb_device *usb_dev;
+	struct usb_interface *iface;
+	struct mutex usb_lock;
+
+	int ep_in;
+	int ep_out;
+	int ep_intr;
+	u8 ep_intr_interval;
+};
-- 
2.32.0

