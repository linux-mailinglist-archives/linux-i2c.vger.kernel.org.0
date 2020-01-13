Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D02B2139B1A
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Jan 2020 22:06:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726587AbgAMVGy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 13 Jan 2020 16:06:54 -0500
Received: from sauhun.de ([88.99.104.3]:42040 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726536AbgAMVGy (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 13 Jan 2020 16:06:54 -0500
Received: from localhost (p54B332D5.dip0.t-ipconnect.de [84.179.50.213])
        by pokefinder.org (Postfix) with ESMTPSA id D404D2C06F2;
        Mon, 13 Jan 2020 22:06:51 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.de>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 1/3] i2c: parport-light: remove driver
Date:   Mon, 13 Jan 2020 22:06:41 +0100
Message-Id: <20200113210643.5033-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200113210643.5033-1-wsa+renesas@sang-engineering.com>
References: <20200113210643.5033-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The justification of a light version of the parport driver was less
overhead for embedded systems. Well, today, even if an embedded system
still has a parport, it surely can handle the fully-fledged parport
driver. Remove it to reduce the maintenance burden.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 .../i2c/busses/i2c-parport-light.rst          |  24 --
 Documentation/i2c/busses/index.rst            |   1 -
 MAINTAINERS                                   |   2 -
 drivers/i2c/busses/Kconfig                    |  28 --
 drivers/i2c/busses/Makefile                   |   1 -
 drivers/i2c/busses/i2c-parport-light.c        | 267 ------------------
 6 files changed, 323 deletions(-)
 delete mode 100644 Documentation/i2c/busses/i2c-parport-light.rst
 delete mode 100644 drivers/i2c/busses/i2c-parport-light.c

diff --git a/Documentation/i2c/busses/i2c-parport-light.rst b/Documentation/i2c/busses/i2c-parport-light.rst
deleted file mode 100644
index e73af975d2c8..000000000000
--- a/Documentation/i2c/busses/i2c-parport-light.rst
+++ /dev/null
@@ -1,24 +0,0 @@
-===============================
-Kernel driver i2c-parport-light
-===============================
-
-Author: Jean Delvare <jdelvare@suse.de>
-
-This driver is a light version of i2c-parport. It doesn't depend
-on the parport driver, and uses direct I/O access instead. This might be
-preferred on embedded systems where wasting memory for the clean but heavy
-parport handling is not an option. The drawback is a reduced portability
-and the impossibility to daisy-chain other parallel port devices.
-
-Please see i2c-parport for documentation.
-
-Module parameters:
-
-* type: type of adapter (see i2c-parport or modinfo)
-
-* base: base I/O address
-  Default is 0x378 which is fairly common for parallel ports, at least on PC.
-
-* irq: optional IRQ
-  This must be passed if you want SMBus alert support, assuming your adapter
-  actually supports this.
diff --git a/Documentation/i2c/busses/index.rst b/Documentation/i2c/busses/index.rst
index 2a26e251a335..5e4077b08d86 100644
--- a/Documentation/i2c/busses/index.rst
+++ b/Documentation/i2c/busses/index.rst
@@ -20,7 +20,6 @@ I2C Bus Drivers
    i2c-nforce2
    i2c-nvidia-gpu
    i2c-ocores
-   i2c-parport-light
    i2c-parport
    i2c-pca-isa
    i2c-piix4
diff --git a/MAINTAINERS b/MAINTAINERS
index 8982c6e013b3..f665739bf57c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7725,9 +7725,7 @@ M:	Jean Delvare <jdelvare@suse.com>
 L:	linux-i2c@vger.kernel.org
 S:	Maintained
 F:	Documentation/i2c/busses/i2c-parport.rst
-F:	Documentation/i2c/busses/i2c-parport-light.rst
 F:	drivers/i2c/busses/i2c-parport.c
-F:	drivers/i2c/busses/i2c-parport-light.c
 
 I2C SUBSYSTEM
 M:	Wolfram Sang <wsa@the-dreams.de>
diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 6a0aa76859f3..933f15f0ad67 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -1211,37 +1211,9 @@ config I2C_PARPORT
 	  An adapter type parameter is now mandatory.  Please read the file
 	  Documentation/i2c/busses/i2c-parport.rst for details.
 
-	  Another driver exists, named i2c-parport-light, which doesn't depend
-	  on the parport driver.  This is meant for embedded systems. Don't say
-	  Y here if you intend to say Y or M there.
-
 	  This support is also available as a module.  If so, the module
 	  will be called i2c-parport.
 
-config I2C_PARPORT_LIGHT
-	tristate "Parallel port adapter (light)"
-	select I2C_ALGOBIT
-	select I2C_SMBUS
-	help
-	  This supports parallel port I2C adapters such as the ones made by
-	  Philips or Velleman, Analog Devices evaluation boards, and more.
-	  Basically any adapter using the parallel port as an I2C bus with
-	  no extra chipset is supported by this driver, or could be.
-
-	  This driver is a light version of i2c-parport.  It doesn't depend
-	  on the parport driver, and uses direct I/O access instead.  This
-	  might be preferred on embedded systems where wasting memory for
-	  the clean but heavy parport handling is not an option.  The
-	  drawback is a reduced portability and the impossibility to
-	  daisy-chain other parallel port devices.
-
-	  Don't say Y here if you said Y or M to i2c-parport.  Saying M to
-	  both is possible but both modules should not be loaded at the same
-	  time.
-
-	  This support is also available as a module.  If so, the module
-	  will be called i2c-parport-light.
-
 config I2C_ROBOTFUZZ_OSIF
 	tristate "RobotFuzz Open Source InterFace USB adapter"
 	depends on USB
diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
index 3ab8aebc39c9..25d60889713c 100644
--- a/drivers/i2c/busses/Makefile
+++ b/drivers/i2c/busses/Makefile
@@ -128,7 +128,6 @@ obj-$(CONFIG_I2C_ZX2967)	+= i2c-zx2967.o
 obj-$(CONFIG_I2C_DIOLAN_U2C)	+= i2c-diolan-u2c.o
 obj-$(CONFIG_I2C_DLN2)		+= i2c-dln2.o
 obj-$(CONFIG_I2C_PARPORT)	+= i2c-parport.o
-obj-$(CONFIG_I2C_PARPORT_LIGHT)	+= i2c-parport-light.o
 obj-$(CONFIG_I2C_ROBOTFUZZ_OSIF)	+= i2c-robotfuzz-osif.o
 obj-$(CONFIG_I2C_TAOS_EVM)	+= i2c-taos-evm.o
 obj-$(CONFIG_I2C_TINY_USB)	+= i2c-tiny-usb.o
diff --git a/drivers/i2c/busses/i2c-parport-light.c b/drivers/i2c/busses/i2c-parport-light.c
deleted file mode 100644
index 00f6aaf22cfc..000000000000
--- a/drivers/i2c/busses/i2c-parport-light.c
+++ /dev/null
@@ -1,267 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/* ------------------------------------------------------------------------ *
- * i2c-parport-light.c I2C bus over parallel port                           *
- * ------------------------------------------------------------------------ *
-   Copyright (C) 2003-2010 Jean Delvare <jdelvare@suse.de>
-
-   Based on older i2c-velleman.c driver
-   Copyright (C) 1995-2000 Simon G. Vogl
-   With some changes from:
-   Frodo Looijaard <frodol@dds.nl>
-   Kyösti Mälkki <kmalkki@cc.hut.fi>
-
- * ------------------------------------------------------------------------ */
-
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <linux/init.h>
-#include <linux/delay.h>
-#include <linux/platform_device.h>
-#include <linux/ioport.h>
-#include <linux/i2c.h>
-#include <linux/i2c-algo-bit.h>
-#include <linux/i2c-smbus.h>
-#include <linux/io.h>
-#include "i2c-parport.h"
-
-#define DEFAULT_BASE 0x378
-#define DRVNAME "i2c-parport-light"
-
-static struct platform_device *pdev;
-
-static u16 base;
-module_param_hw(base, ushort, ioport, 0);
-MODULE_PARM_DESC(base, "Base I/O address");
-
-static int irq;
-module_param_hw(irq, int, irq, 0);
-MODULE_PARM_DESC(irq, "IRQ (optional)");
-
-/* ----- Low-level parallel port access ----------------------------------- */
-
-static inline void port_write(unsigned char p, unsigned char d)
-{
-	outb(d, base+p);
-}
-
-static inline unsigned char port_read(unsigned char p)
-{
-	return inb(base+p);
-}
-
-/* ----- Unified line operation functions --------------------------------- */
-
-static inline void line_set(int state, const struct lineop *op)
-{
-	u8 oldval = port_read(op->port);
-
-	/* Touch only the bit(s) needed */
-	if ((op->inverted && !state) || (!op->inverted && state))
-		port_write(op->port, oldval | op->val);
-	else
-		port_write(op->port, oldval & ~op->val);
-}
-
-static inline int line_get(const struct lineop *op)
-{
-	u8 oldval = port_read(op->port);
-
-	return ((op->inverted && (oldval & op->val) != op->val)
-	    || (!op->inverted && (oldval & op->val) == op->val));
-}
-
-/* ----- I2C algorithm call-back functions and structures ----------------- */
-
-static void parport_setscl(void *data, int state)
-{
-	line_set(state, &adapter_parm[type].setscl);
-}
-
-static void parport_setsda(void *data, int state)
-{
-	line_set(state, &adapter_parm[type].setsda);
-}
-
-static int parport_getscl(void *data)
-{
-	return line_get(&adapter_parm[type].getscl);
-}
-
-static int parport_getsda(void *data)
-{
-	return line_get(&adapter_parm[type].getsda);
-}
-
-/* Encapsulate the functions above in the correct structure
-   Note that getscl will be set to NULL by the attaching code for adapters
-   that cannot read SCL back */
-static struct i2c_algo_bit_data parport_algo_data = {
-	.setsda		= parport_setsda,
-	.setscl		= parport_setscl,
-	.getsda		= parport_getsda,
-	.getscl		= parport_getscl,
-	.udelay		= 50,
-	.timeout	= HZ,
-};
-
-/* ----- Driver registration ---------------------------------------------- */
-
-static struct i2c_adapter parport_adapter = {
-	.owner		= THIS_MODULE,
-	.class		= I2C_CLASS_HWMON,
-	.algo_data	= &parport_algo_data,
-	.name		= "Parallel port adapter (light)",
-};
-
-/* SMBus alert support */
-static struct i2c_smbus_alert_setup alert_data = {
-};
-static struct i2c_client *ara;
-static struct lineop parport_ctrl_irq = {
-	.val		= (1 << 4),
-	.port		= PORT_CTRL,
-};
-
-static int i2c_parport_probe(struct platform_device *pdev)
-{
-	int err;
-
-	/* Reset hardware to a sane state (SCL and SDA high) */
-	parport_setsda(NULL, 1);
-	parport_setscl(NULL, 1);
-	/* Other init if needed (power on...) */
-	if (adapter_parm[type].init.val) {
-		line_set(1, &adapter_parm[type].init);
-		/* Give powered devices some time to settle */
-		msleep(100);
-	}
-
-	parport_adapter.dev.parent = &pdev->dev;
-	err = i2c_bit_add_bus(&parport_adapter);
-	if (err) {
-		dev_err(&pdev->dev, "Unable to register with I2C\n");
-		return err;
-	}
-
-	/* Setup SMBus alert if supported */
-	if (adapter_parm[type].smbus_alert && irq) {
-		alert_data.irq = irq;
-		ara = i2c_setup_smbus_alert(&parport_adapter, &alert_data);
-		if (ara)
-			line_set(1, &parport_ctrl_irq);
-		else
-			dev_warn(&pdev->dev, "Failed to register ARA client\n");
-	}
-
-	return 0;
-}
-
-static int i2c_parport_remove(struct platform_device *pdev)
-{
-	if (ara) {
-		line_set(0, &parport_ctrl_irq);
-		i2c_unregister_device(ara);
-		ara = NULL;
-	}
-	i2c_del_adapter(&parport_adapter);
-
-	/* Un-init if needed (power off...) */
-	if (adapter_parm[type].init.val)
-		line_set(0, &adapter_parm[type].init);
-
-	return 0;
-}
-
-static struct platform_driver i2c_parport_driver = {
-	.driver = {
-		.name	= DRVNAME,
-	},
-	.probe		= i2c_parport_probe,
-	.remove		= i2c_parport_remove,
-};
-
-static int __init i2c_parport_device_add(u16 address)
-{
-	int err;
-
-	pdev = platform_device_alloc(DRVNAME, -1);
-	if (!pdev) {
-		err = -ENOMEM;
-		printk(KERN_ERR DRVNAME ": Device allocation failed\n");
-		goto exit;
-	}
-
-	err = platform_device_add(pdev);
-	if (err) {
-		printk(KERN_ERR DRVNAME ": Device addition failed (%d)\n",
-		       err);
-		goto exit_device_put;
-	}
-
-	return 0;
-
-exit_device_put:
-	platform_device_put(pdev);
-exit:
-	return err;
-}
-
-static int __init i2c_parport_init(void)
-{
-	int err;
-
-	if (type < 0) {
-		printk(KERN_ERR DRVNAME ": adapter type unspecified\n");
-		return -ENODEV;
-	}
-
-	if (type >= ARRAY_SIZE(adapter_parm)) {
-		printk(KERN_ERR DRVNAME ": invalid type (%d)\n", type);
-		return -ENODEV;
-	}
-
-	if (base == 0) {
-		pr_info(DRVNAME ": using default base 0x%x\n", DEFAULT_BASE);
-		base = DEFAULT_BASE;
-	}
-
-	if (!request_region(base, 3, DRVNAME))
-		return -EBUSY;
-
-	if (irq != 0)
-		pr_info(DRVNAME ": using irq %d\n", irq);
-
-	if (!adapter_parm[type].getscl.val)
-		parport_algo_data.getscl = NULL;
-
-	/* Sets global pdev as a side effect */
-	err = i2c_parport_device_add(base);
-	if (err)
-		goto exit_release;
-
-	err = platform_driver_register(&i2c_parport_driver);
-	if (err)
-		goto exit_device;
-
-	return 0;
-
-exit_device:
-	platform_device_unregister(pdev);
-exit_release:
-	release_region(base, 3);
-	return err;
-}
-
-static void __exit i2c_parport_exit(void)
-{
-	platform_driver_unregister(&i2c_parport_driver);
-	platform_device_unregister(pdev);
-	release_region(base, 3);
-}
-
-MODULE_AUTHOR("Jean Delvare <jdelvare@suse.de>");
-MODULE_DESCRIPTION("I2C bus over parallel port (light)");
-MODULE_LICENSE("GPL");
-
-module_init(i2c_parport_init);
-module_exit(i2c_parport_exit);
-- 
2.20.1

