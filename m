Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCC331CCA04
	for <lists+linux-i2c@lfdr.de>; Sun, 10 May 2020 11:59:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725839AbgEJJ7u (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 10 May 2020 05:59:50 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:46312 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728645AbgEJJ7t (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 10 May 2020 05:59:49 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 9F62E8030790;
        Sun, 10 May 2020 09:51:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id M0U76NXGKjSn; Sun, 10 May 2020 12:51:01 +0300 (MSK)
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
        Geert Uytterhoeven <geert@linux-m68k.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Hanjun Guo <guohanjun@huawei.com>,
        Hans de Goede <hdegoede@redhat.com>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>
Subject: [PATCH v2 09/12] i2c: designware: Unpin Microsemi Ocelot I2C into a glue driver
Date:   Sun, 10 May 2020 12:50:15 +0300
Message-ID: <20200510095019.20981-10-Sergey.Semin@baikalelectronics.ru>
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

Since glue-layer drivers design is now supported by the DW APB I2C
platform code lets unpin MSCC Ocelot I2C driver at least. It won't be that
hard because the only difference between this controller and vanilly core
is in what the former sets the sda hold time in a dedicated configure
registers space.

Note I enabled the new driver by default for the MSCC Ocelot platform so
one would be automatically built and we wouldn't need to alter the in- and
out-of-source tree platform configs.

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
 drivers/i2c/busses/Kconfig                  | 12 +++
 drivers/i2c/busses/Makefile                 |  1 +
 drivers/i2c/busses/i2c-designware-core.h    |  3 -
 drivers/i2c/busses/i2c-designware-mscc.c    | 83 +++++++++++++++++++++
 drivers/i2c/busses/i2c-designware-platdrv.c | 40 ----------
 5 files changed, 96 insertions(+), 43 deletions(-)
 create mode 100644 drivers/i2c/busses/i2c-designware-mscc.c

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index ed6927c4c540..2f047cf07fee 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -566,6 +566,18 @@ config I2C_DESIGNWARE_SLAVE
 	  This is not a standalone module, this module compiles together with
 	  i2c-designware-core.
 
+config I2C_DESIGNWARE_MSCC
+	tristate "Microsemi Ocelot I2C"
+	depends on MSCC_OCELOT
+	select I2C_DESIGNWARE_PLATFORM
+	default y
+	help
+	  This driver supports the Microsemi Ocelot SoC version of the Synopsys
+	  Designware I2C IP-core.
+
+	  The driver can also be built as a module. If so, the module will be
+	  called i2c-designware-mscc.
+
 config I2C_DESIGNWARE_PCI
 	tristate "Synopsys DesignWare PCI"
 	depends on PCI
diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
index c6813d7b2780..480a9fe4fb64 100644
--- a/drivers/i2c/busses/Makefile
+++ b/drivers/i2c/busses/Makefile
@@ -55,6 +55,7 @@ i2c-designware-core-$(CONFIG_I2C_DESIGNWARE_SLAVE) 	+= i2c-designware-slave.o
 obj-$(CONFIG_I2C_DESIGNWARE_PLATFORM)			+= i2c-designware-platform.o
 i2c-designware-platform-y 				:= i2c-designware-platdrv.o
 i2c-designware-platform-$(CONFIG_I2C_DESIGNWARE_BAYTRAIL) += i2c-designware-baytrail.o
+obj-$(CONFIG_I2C_DESIGNWARE_MSCC)			+= i2c-designware-mscc.o
 obj-$(CONFIG_I2C_DESIGNWARE_PCI)			+= i2c-designware-pci.o
 i2c-designware-pci-y					:= i2c-designware-pcidrv.o
 obj-$(CONFIG_I2C_DIGICOLOR)	+= i2c-digicolor.o
diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index 10606266b30c..64544777a1fa 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -177,7 +177,6 @@
  * @dev: driver model device node
  * @map: IO registers map
  * @base: IO registers pointer
- * @ext: Extended IO registers pointer
  * @cmd_complete: tx completion indicator
  * @clk: input reference clock
  * @pclk: clock required to access the registers
@@ -229,7 +228,6 @@ struct dw_i2c_dev {
 	struct device		*dev;
 	struct regmap		*map;
 	void __iomem		*base;
-	void __iomem		*ext;
 	struct completion	cmd_complete;
 	struct clk		*clk;
 	struct clk		*pclk;
@@ -284,7 +282,6 @@ struct dw_i2c_dev {
 #define ACCESS_NO_IRQ_SUSPEND	0x00000008
 
 #define MODEL_CHERRYTRAIL	0x00000100
-#define MODEL_MSCC_OCELOT	0x00000200
 #define MODEL_MASK		0x00000f00
 
 int i2c_dw_init_regmap(struct dw_i2c_dev *dev);
diff --git a/drivers/i2c/busses/i2c-designware-mscc.c b/drivers/i2c/busses/i2c-designware-mscc.c
new file mode 100644
index 000000000000..0649e3d1fefc
--- /dev/null
+++ b/drivers/i2c/busses/i2c-designware-mscc.c
@@ -0,0 +1,83 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Microsemi Ocelot I2C Controller.
+ */
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/mod_devicetable.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/of.h>
+
+#include "i2c-designware-core.h"
+#include "i2c-designware-platdrv.h"
+
+#define MSCC_ICPU_CFG_TWI_DELAY		0x0
+#define MSCC_ICPU_CFG_TWI_DELAY_ENABLE	BIT(0)
+#define MSCC_ICPU_CFG_TWI_SPIKE_FILTER	0x4
+
+struct mscc_i2c_dev {
+	struct dw_i2c_dev	dev;
+	void __iomem		*ext;
+};
+#define to_mscc_device(_dev)	container_of((_dev), struct mscc_i2c_dev, dev)
+
+static int mscc_twi_set_sda_hold_time(struct dw_i2c_dev *dev)
+{
+	struct mscc_i2c_dev *mscc = to_mscc_device(dev);
+
+	writel((dev->sda_hold_time << 1) | MSCC_ICPU_CFG_TWI_DELAY_ENABLE,
+	       mscc->ext + MSCC_ICPU_CFG_TWI_DELAY);
+
+	return 0;
+}
+
+static int mscc_i2c_plat_probe(struct platform_device *pdev)
+{
+	struct mscc_i2c_dev *mscc;
+	struct resource *mem;
+
+	mscc = devm_kzalloc(&pdev->dev, sizeof(*mscc), GFP_KERNEL);
+	if (!mscc)
+		return -ENOMEM;
+
+	mem = platform_get_resource(pdev, IORESOURCE_MEM, 1);
+	mscc->ext = devm_ioremap_resource(&pdev->dev, mem);
+	if (!IS_ERR(mscc->ext))
+		mscc->dev.set_sda_hold_time = mscc_twi_set_sda_hold_time;
+
+	mscc->dev.dev = &pdev->dev;
+	platform_set_drvdata(pdev, mscc);
+
+	return i2c_dw_plat_setup(&mscc->dev);
+}
+
+static int mscc_i2c_plat_remove(struct platform_device *pdev)
+{
+	struct mscc_i2c_dev *mscc = platform_get_drvdata(pdev);
+
+	return i2c_dw_plat_clear(&mscc->dev);
+}
+
+#ifdef CONFIG_OF
+static const struct of_device_id mscc_i2c_of_match[] = {
+	{ .compatible = "mscc,ocelot-i2c" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, mscc_i2c_of_match);
+#endif
+
+static struct platform_driver mscc_i2c_driver = {
+	.probe = mscc_i2c_plat_probe,
+	.remove = mscc_i2c_plat_remove,
+	.driver		= {
+		.name	= "i2c_ocelot",
+		.of_match_table = of_match_ptr(mscc_i2c_of_match),
+		.pm	= &i2c_dw_plat_dev_pm_ops,
+	},
+};
+module_platform_driver(mscc_i2c_driver);
+
+MODULE_AUTHOR("Alexandre Belloni <alexandre.belloni@bootlin.com>");
+MODULE_DESCRIPTION("Microsemi Ocelot I2C Controller");
+MODULE_LICENSE("GPL");
diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 274953155569..1f56865bb6ca 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -143,48 +143,11 @@ static inline int dw_i2c_acpi_configure(struct dw_i2c_dev *dev)
 #endif
 
 #ifdef CONFIG_OF
-#define MSCC_ICPU_CFG_TWI_DELAY		0x0
-#define MSCC_ICPU_CFG_TWI_DELAY_ENABLE	BIT(0)
-#define MSCC_ICPU_CFG_TWI_SPIKE_FILTER	0x4
-
-static int mscc_twi_set_sda_hold_time(struct dw_i2c_dev *dev)
-{
-	writel((dev->sda_hold_time << 1) | MSCC_ICPU_CFG_TWI_DELAY_ENABLE,
-	       dev->ext + MSCC_ICPU_CFG_TWI_DELAY);
-
-	return 0;
-}
-
-static int dw_i2c_of_configure(struct dw_i2c_dev *dev)
-{
-	struct platform_device *pdev = to_platform_device(dev->dev);
-	struct resource *mem;
-
-	switch (dev->flags & MODEL_MASK) {
-	case MODEL_MSCC_OCELOT:
-		mem = platform_get_resource(pdev, IORESOURCE_MEM, 1);
-		dev->ext = devm_ioremap_resource(&pdev->dev, mem);
-		if (!IS_ERR(dev->ext))
-			dev->set_sda_hold_time = mscc_twi_set_sda_hold_time;
-		break;
-	default:
-		break;
-	}
-
-	return 0;
-}
-
 static const struct of_device_id dw_i2c_of_match[] = {
 	{ .compatible = "snps,designware-i2c", },
-	{ .compatible = "mscc,ocelot-i2c", .data = (void *)MODEL_MSCC_OCELOT },
 	{},
 };
 MODULE_DEVICE_TABLE(of, dw_i2c_of_match);
-#else
-static inline int dw_i2c_of_configure(struct dw_i2c_dev *dev)
-{
-	return -ENODEV;
-}
 #endif
 
 static void i2c_dw_configure_master(struct dw_i2c_dev *dev)
@@ -288,9 +251,6 @@ int i2c_dw_plat_setup(struct dw_i2c_dev *dev)
 	else
 		t->bus_freq_hz = I2C_MAX_FAST_MODE_FREQ;
 
-	if (pdev->dev.of_node)
-		dw_i2c_of_configure(dev);
-
 	if (has_acpi_companion(&pdev->dev))
 		dw_i2c_acpi_configure(dev);
 
-- 
2.25.1

