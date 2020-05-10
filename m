Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31FDC1CC9FF
	for <lists+linux-i2c@lfdr.de>; Sun, 10 May 2020 11:59:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728621AbgEJJ7q (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 10 May 2020 05:59:46 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:46260 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726863AbgEJJ7m (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 10 May 2020 05:59:42 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 790AC8030802;
        Sun, 10 May 2020 09:51:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id XTx9bp1szKOb; Sun, 10 May 2020 12:51:16 +0300 (MSK)
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        <linux-mips@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Jean Delvare <jdelvare@suse.de>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Max Staudt <max@enpas.org>, Stefan Roese <sr@denx.de>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>
Subject: [PATCH v2 12/12] i2c: designware: Add Baikal-T1 System I2C glue driver
Date:   Sun, 10 May 2020 12:50:18 +0300
Message-ID: <20200510095019.20981-13-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20200510095019.20981-1-Sergey.Semin@baikalelectronics.ru>
References: <20200306132001.1B875803087C@mail.baikalelectronics.ru>
 <20200510095019.20981-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Baikal-T1 System Controller is equipped with a dedicated I2C Controller
which functionality is based on the DW APB I2C IP-core, the only
difference in a way it' registers are accessed. There are three access
register provided in the System Controller registers map, which
indirectly address the normal DW APB I2C registers space.
So in order to have the Baikal-T1 System I2C Controller supported by the
common DW APB I2C driver we created a dedicated glue driver, which
retrieves the syscon regmap from the parental dt node and creates a
new regmap based on it. The new regmap is then passed to the generic DW I2C
platform driver initializer.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Paul Burton <paulburton@kernel.org>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Wolfram Sang <wsa@the-dreams.de>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>
Cc: linux-mips@vger.kernel.org
Cc: devicetree@vger.kernel.org
---
 drivers/i2c/busses/Kconfig              |  11 ++
 drivers/i2c/busses/Makefile             |   1 +
 drivers/i2c/busses/i2c-designware-bt1.c | 129 ++++++++++++++++++++++++
 3 files changed, 141 insertions(+)
 create mode 100644 drivers/i2c/busses/i2c-designware-bt1.c

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 2f047cf07fee..d4a5d78cc181 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -578,6 +578,17 @@ config I2C_DESIGNWARE_MSCC
 	  The driver can also be built as a module. If so, the module will be
 	  called i2c-designware-mscc.
 
+config I2C_DESIGNWARE_BT1
+	tristate "Baikal-T1 System I2C"
+	depends on (MIPS_BAIKAL_T1 && OF) || COMPILE_TEST
+	select I2C_DESIGNWARE_PLATFORM
+	help
+	  This driver supports the Baikal-T1 SoC version of the Synopsys
+	  Designware I2C IP-core.
+
+	  The driver can also be built as a module. If so, the module will be
+	  called i2c-designware-bt1.
+
 config I2C_DESIGNWARE_PCI
 	tristate "Synopsys DesignWare PCI"
 	depends on PCI
diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
index 480a9fe4fb64..7b044d4e299a 100644
--- a/drivers/i2c/busses/Makefile
+++ b/drivers/i2c/busses/Makefile
@@ -56,6 +56,7 @@ obj-$(CONFIG_I2C_DESIGNWARE_PLATFORM)			+= i2c-designware-platform.o
 i2c-designware-platform-y 				:= i2c-designware-platdrv.o
 i2c-designware-platform-$(CONFIG_I2C_DESIGNWARE_BAYTRAIL) += i2c-designware-baytrail.o
 obj-$(CONFIG_I2C_DESIGNWARE_MSCC)			+= i2c-designware-mscc.o
+obj-$(CONFIG_I2C_DESIGNWARE_BT1)			+= i2c-designware-bt1.o
 obj-$(CONFIG_I2C_DESIGNWARE_PCI)			+= i2c-designware-pci.o
 i2c-designware-pci-y					:= i2c-designware-pcidrv.o
 obj-$(CONFIG_I2C_DIGICOLOR)	+= i2c-digicolor.o
diff --git a/drivers/i2c/busses/i2c-designware-bt1.c b/drivers/i2c/busses/i2c-designware-bt1.c
new file mode 100644
index 000000000000..ed157d1c3b81
--- /dev/null
+++ b/drivers/i2c/busses/i2c-designware-bt1.c
@@ -0,0 +1,129 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2020 BAIKAL ELECTRONICS, JSC
+ *
+ * Authors:
+ *   Serge Semin <Sergey.Semin@baikalelectronics.ru>
+ *
+ * Baikal-T1 System I2C driver
+ */
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/mod_devicetable.h>
+#include <linux/platform_device.h>
+#include <linux/mfd/syscon.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+#include <linux/of.h>
+
+#include "i2c-designware-core.h"
+#include "i2c-designware-platdrv.h"
+
+/*
+ * Access registers to the normal I2C regspace.
+ */
+#define BT1_I2C_CTL			0x100
+#define BT1_I2C_CTL_ADDR_MASK		GENMASK(7, 0)
+#define BT1_I2C_CTL_WR			BIT(8)
+#define BT1_I2C_CTL_GO			BIT(31)
+#define BT1_I2C_DI			0x104
+#define BT1_I2C_DO			0x108
+
+struct bt1_i2c_dev {
+	struct dw_i2c_dev dev;
+	struct regmap *sys_regs;
+};
+
+static int bt1_i2c_read(void *context, unsigned int reg, unsigned int *val)
+{
+	struct bt1_i2c_dev *bt1 = context;
+	int ret;
+
+	/*
+	 * Note these methods shouldn't ever fail because the system controller
+	 * registers are memory mapped. We check the return value just in case.
+	 */
+	ret = regmap_write(bt1->sys_regs, BT1_I2C_CTL,
+			   BT1_I2C_CTL_GO | (reg & BT1_I2C_CTL_ADDR_MASK));
+	if (ret)
+		return ret;
+
+	return regmap_read(bt1->sys_regs, BT1_I2C_DO, val);
+}
+
+static int bt1_i2c_write(void *context, unsigned int reg, unsigned int val)
+{
+	struct bt1_i2c_dev *bt1 = context;
+	int ret;
+
+	ret = regmap_write(bt1->sys_regs, BT1_I2C_DI, val);
+	if (ret)
+		return ret;
+
+	return regmap_write(bt1->sys_regs, BT1_I2C_CTL,
+		BT1_I2C_CTL_GO | BT1_I2C_CTL_WR | (reg & BT1_I2C_CTL_ADDR_MASK));
+}
+
+static struct regmap_config bt1_i2c_cfg = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.fast_io = true,
+	.reg_read = bt1_i2c_read,
+	.reg_write = bt1_i2c_write,
+	.max_register = DW_IC_COMP_TYPE
+};
+
+static int bt1_i2c_plat_probe(struct platform_device *pdev)
+{
+	struct bt1_i2c_dev *bt1;
+
+	bt1 = devm_kzalloc(&pdev->dev, sizeof(*bt1), GFP_KERNEL);
+	if (!bt1)
+		return -ENOMEM;
+
+	bt1->sys_regs = syscon_node_to_regmap(pdev->dev.of_node->parent);
+	if (IS_ERR(bt1->sys_regs)) {
+		dev_err(&pdev->dev, "Couldn't get BT1 I2C register map\n");
+		return PTR_ERR(bt1->sys_regs);
+	}
+
+	bt1->dev.map = devm_regmap_init(&pdev->dev, NULL, bt1, &bt1_i2c_cfg);
+	if (IS_ERR(bt1->dev.map)) {
+		dev_err(&pdev->dev, "Failed to init the registers map\n");
+		return PTR_ERR(bt1->dev.map);
+	}
+
+	bt1->dev.dev = &pdev->dev;
+	platform_set_drvdata(pdev, bt1);
+
+	return i2c_dw_plat_setup(&bt1->dev);
+}
+
+static int bt1_i2c_plat_remove(struct platform_device *pdev)
+{
+	struct bt1_i2c_dev *bt1 = platform_get_drvdata(pdev);
+
+	return i2c_dw_plat_clear(&bt1->dev);
+}
+
+static const struct of_device_id bt1_i2c_of_match[] = {
+	{ .compatible = "baikal,bt1-sys-i2c" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, bt1_i2c_of_match);
+
+static struct platform_driver bt1_i2c_driver = {
+	.probe = bt1_i2c_plat_probe,
+	.remove = bt1_i2c_plat_remove,
+	.driver		= {
+		.name	= "bt1-sys-i2c",
+		.of_match_table = bt1_i2c_of_match,
+		.pm	= &i2c_dw_plat_dev_pm_ops,
+	},
+};
+module_platform_driver(bt1_i2c_driver);
+
+MODULE_AUTHOR("Serge Semin <Sergey.Semin@baikalelectronics.ru>");
+MODULE_DESCRIPTION("Baikal-T1 System I2C Controller");
+MODULE_LICENSE("GPL v2");
-- 
2.25.1

