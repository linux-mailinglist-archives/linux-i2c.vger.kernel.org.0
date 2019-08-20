Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BDFD495AF6
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Aug 2019 11:28:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729537AbfHTJ1y (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 20 Aug 2019 05:27:54 -0400
Received: from enpas.org ([46.38.239.100]:39242 "EHLO mail.enpas.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729198AbfHTJ1y (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 20 Aug 2019 05:27:54 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        by mail.enpas.org (Postfix) with ESMTPSA id 7DFA6FFDB4;
        Tue, 20 Aug 2019 09:27:49 +0000 (UTC)
From:   Max Staudt <max@enpas.org>
To:     linux-i2c@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org,
        glaubitz@physik.fu-berlin.de, Max Staudt <max@enpas.org>
Subject: [PATCH] i2c/busses: Add i2c-icy for I2C on m68k/Amiga
Date:   Tue, 20 Aug 2019 11:27:39 +0200
Message-Id: <20190820092739.7213-1-max@enpas.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <3F017C0B-44D6-4E63-A908-DDAA5586D67C@enpas.org>
References: <3F017C0B-44D6-4E63-A908-DDAA5586D67C@enpas.org>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This is the i2c-icy driver for the ICY board for Amiga computers.
It connects a PCF8584 I2C controller to the Zorro bus, providing I2C
connectivity. The original documentation can be found on Aminet:

https://aminet.net/package/docs/hard/icy

IRQ support is currently not implemented, as i2c-algo-pcf is built for
the ISA bus and a straight implementation of the same stack locks up a
Zorro machine.

v5: usleep_range() instead of udelay()
    Style

v3: Fixed %pa format string
    Dropped adapter class.
    Clarified licence.
    Removed clock parameter.

v2: Matched function names to callbacks from i2c-algo-pcf
    Used z_readb()/z_writeb()
    Removed BROKEN_ON_SMP in Kconfig
    Moved LTC2990 to a separate commit

Signed-off-by: Max Staudt <max@enpas.org>
---
 MAINTAINERS                  |   6 ++
 drivers/i2c/busses/Kconfig   |  11 +++
 drivers/i2c/busses/Makefile  |   1 +
 drivers/i2c/busses/i2c-icy.c | 172 +++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 190 insertions(+)
 create mode 100644 drivers/i2c/busses/i2c-icy.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 1be025959..70336c083 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7705,6 +7705,12 @@ S:	Maintained
 F:	drivers/mfd/lpc_ich.c
 F:	drivers/gpio/gpio-ich.c
 
+ICY I2C DRIVER
+M:	Max Staudt <max@enpas.org>
+L:	linux-i2c@vger.kernel.org
+S:	Maintained
+F:	drivers/i2c/busses/i2c-icy.c
+
 IDE SUBSYSTEM
 M:	"David S. Miller" <davem@davemloft.net>
 L:	linux-ide@vger.kernel.org
diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index ee5dfb5ae..9e57e1101 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -1300,6 +1300,17 @@ config I2C_ELEKTOR
 	  This support is also available as a module.  If so, the module
 	  will be called i2c-elektor.
 
+config I2C_ICY
+	tristate "ICY Zorro card"
+	depends on ZORRO
+	select I2C_ALGOPCF
+	help
+	  This supports the PCF8584 Zorro bus I2C adapter, known as ICY.
+	  Say Y if you own such an adapter.
+
+	  This support is also available as a module.  If so, the module
+	  will be called i2c-icy.
+
 config I2C_MLXCPLD
 	tristate "Mellanox I2C driver"
 	depends on X86_64
diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
index a3245231b..d0e1c3d4e 100644
--- a/drivers/i2c/busses/Makefile
+++ b/drivers/i2c/busses/Makefile
@@ -139,6 +139,7 @@ obj-$(CONFIG_I2C_BCM_KONA)	+= i2c-bcm-kona.o
 obj-$(CONFIG_I2C_BRCMSTB)	+= i2c-brcmstb.o
 obj-$(CONFIG_I2C_CROS_EC_TUNNEL)	+= i2c-cros-ec-tunnel.o
 obj-$(CONFIG_I2C_ELEKTOR)	+= i2c-elektor.o
+obj-$(CONFIG_I2C_ICY)		+= i2c-icy.o
 obj-$(CONFIG_I2C_MLXCPLD)	+= i2c-mlxcpld.o
 obj-$(CONFIG_I2C_OPAL)		+= i2c-opal.o
 obj-$(CONFIG_I2C_PCA_ISA)	+= i2c-pca-isa.o
diff --git a/drivers/i2c/busses/i2c-icy.c b/drivers/i2c/busses/i2c-icy.c
new file mode 100644
index 000000000..7b7083da8
--- /dev/null
+++ b/drivers/i2c/busses/i2c-icy.c
@@ -0,0 +1,172 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * I2C driver for stand-alone PCF8584 style adapters on Zorro cards
+ *
+ * Original ICY documentation can be found on Aminet:
+ * https://aminet.net/package/docs/hard/icy
+ *
+ * There has been a modern community re-print of this design in 2019:
+ * https://www.a1k.org/forum/index.php?threads/70106/
+ *
+ * The card is basically a Philips PCF8584 connected straight to the
+ * beginning of the AutoConfig'd address space (register S1 on base+2),
+ * with /INT on /INT2 on the Zorro bus.
+ *
+ * Copyright (c) 2019 Max Staudt <max@enpas.org>
+ *
+ * This started as a fork of i2c-elektor.c and has evolved since.
+ * Thanks go to its authors for providing a base to grow on.
+ *
+ *
+ * IRQ support is currently not implemented.
+ *
+ * As it turns out, i2c-algo-pcf is really written with i2c-elektor's
+ * edge-triggered ISA interrupts in mind, while the Amiga's Zorro bus has
+ * level-triggered interrupts. This means that once an interrupt occurs, we
+ * have to tell the PCF8584 to shut up immediately, or it will keep the
+ * interrupt line busy and cause an IRQ storm.
+
+ * However, because of the PCF8584's host-side protocol, there is no good
+ * way to just quieten it without side effects. Rather, we have to perform
+ * the next read/write operation straight away, which will reset the /INT
+ * pin. This entails re-designing the core of i2c-algo-pcf in the future.
+ * For now, we never request an IRQ from the PCF8584, and poll it instead.
+ */
+
+#include <linux/delay.h>
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/ioport.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+
+#include <linux/i2c.h>
+#include <linux/i2c-algo-pcf.h>
+
+#include <asm/amigaints.h>
+#include <linux/zorro.h>
+
+#include "../algos/i2c-algo-pcf.h"
+
+struct icy_i2c {
+	struct i2c_adapter adapter;
+
+	void __iomem *reg_s0;
+	void __iomem *reg_s1;
+};
+
+/*
+ * Functions called by i2c-algo-pcf
+ */
+static void icy_pcf_setpcf(void *data, int ctl, int val)
+{
+	struct icy_i2c *i2c = (struct icy_i2c *)data;
+
+	u8 __iomem *address = ctl ? i2c->reg_s1 : i2c->reg_s0;
+
+	z_writeb(val, address);
+}
+
+static int icy_pcf_getpcf(void *data, int ctl)
+{
+	struct icy_i2c *i2c = (struct icy_i2c *)data;
+
+	u8 __iomem *address = ctl ? i2c->reg_s1 : i2c->reg_s0;
+	return z_readb(address);
+}
+
+static int icy_pcf_getown(void *data)
+{
+	return 0x55;
+}
+
+static int icy_pcf_getclock(void *data)
+{
+	return 0x1c;
+}
+
+static void icy_pcf_waitforpin(void *data)
+{
+	usleep_range(50, 150);
+}
+
+/*
+ * Main i2c-icy part
+ */
+static int icy_probe(struct zorro_dev *z,
+		     const struct zorro_device_id *ent)
+{
+	struct icy_i2c *i2c;
+	struct i2c_algo_pcf_data *algo_data;
+
+	i2c = devm_kzalloc(&z->dev, sizeof(*i2c), GFP_KERNEL);
+	if (!i2c)
+		return -ENOMEM;
+
+	algo_data = devm_kzalloc(&z->dev, sizeof(*algo_data), GFP_KERNEL);
+	if (!algo_data)
+		return -ENOMEM;
+
+	dev_set_drvdata(&z->dev, i2c);
+	i2c->adapter.dev.parent = &z->dev;
+	i2c->adapter.owner = THIS_MODULE;
+	/* i2c->adapter.algo assigned by i2c_pcf_add_bus() */
+	i2c->adapter.algo_data = algo_data;
+	strlcpy(i2c->adapter.name, "ICY I2C Zorro adapter",
+		sizeof(i2c->adapter.name));
+
+	if (!devm_request_mem_region(&z->dev,
+				     z->resource.start,
+				     4, i2c->adapter.name))
+		return -ENXIO;
+
+	/* Driver private data */
+	i2c->reg_s0 = ZTWO_VADDR(z->resource.start);
+	i2c->reg_s1 = ZTWO_VADDR(z->resource.start + 2);
+
+	algo_data->data = i2c;
+	algo_data->setpcf     = icy_pcf_setpcf;
+	algo_data->getpcf     = icy_pcf_getpcf;
+	algo_data->getown     = icy_pcf_getown;
+	algo_data->getclock   = icy_pcf_getclock;
+	algo_data->waitforpin = icy_pcf_waitforpin;
+
+	if (i2c_pcf_add_bus(&i2c->adapter)) {
+		dev_err(&z->dev, "i2c_pcf_add_bus() failed\n");
+		return -ENXIO;
+	}
+
+	dev_info(&z->dev, "ICY I2C controller at %pa, IRQ not implemented\n",
+		 &z->resource.start);
+
+	return 0;
+}
+
+static void icy_remove(struct zorro_dev *z)
+{
+	struct icy_i2c *i2c = dev_get_drvdata(&z->dev);
+
+	i2c_del_adapter(&i2c->adapter);
+}
+
+static const struct zorro_device_id icy_zorro_tbl[] = {
+	{ ZORRO_ID(VMC, 15, 0), },
+	{ 0 }
+};
+
+MODULE_DEVICE_TABLE(zorro, icy_zorro_tbl);
+
+static struct zorro_driver icy_driver = {
+	.name           = "i2c-icy",
+	.id_table       = icy_zorro_tbl,
+	.probe          = icy_probe,
+	.remove         = icy_remove,
+};
+
+module_driver(icy_driver,
+	      zorro_register_driver,
+	      zorro_unregister_driver);
+
+MODULE_AUTHOR("Max Staudt <max@enpas.org>");
+MODULE_DESCRIPTION("I2C bus via PCF8584 on ICY Zorro card");
+MODULE_LICENSE("GPL v2");
-- 
2.11.0

