Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0A141E319A
	for <lists+linux-i2c@lfdr.de>; Tue, 26 May 2020 23:56:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390806AbgEZVz5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 26 May 2020 17:55:57 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:60018 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389641AbgEZVzy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 26 May 2020 17:55:54 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id A887E803087F;
        Tue, 26 May 2020 21:55:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id PWEOSNhYxOhX; Wed, 27 May 2020 00:55:45 +0300 (MSK)
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh+dt@kernel.org>, <linux-mips@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 12/12] i2c: designware: Add Baikal-T1 System I2C support
Date:   Wed, 27 May 2020 00:55:28 +0300
Message-ID: <20200526215528.16417-13-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20200526215528.16417-1-Sergey.Semin@baikalelectronics.ru>
References: <20200526215528.16417-1-Sergey.Semin@baikalelectronics.ru>
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
register provided in the System Controller registers map, which indirectly
address the normal DW APB I2C registers space. So in order to have the
Baikal-T1 System I2C Controller supported by the common DW APB I2C driver
we created a dedicated Dw I2C controller model quirk, which retrieves the
syscon regmap from the parental dt node and creates a new regmap based on
it.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: linux-mips@vger.kernel.org
Cc: devicetree@vger.kernel.org

---

Changelog v3:
- This is a new patch, which has been created due to declining the
  glue-layer approach.
---
 drivers/i2c/busses/Kconfig                  |  3 +-
 drivers/i2c/busses/i2c-designware-core.h    |  3 +
 drivers/i2c/busses/i2c-designware-platdrv.c | 81 ++++++++++++++++++++-
 3 files changed, 83 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index adaaf5679266..9924e8ad697b 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -530,8 +530,9 @@ config I2C_DESIGNWARE_CORE
 
 config I2C_DESIGNWARE_PLATFORM
 	tristate "Synopsys DesignWare Platform"
-	select I2C_DESIGNWARE_CORE
 	depends on (ACPI && COMMON_CLK) || !ACPI
+	select I2C_DESIGNWARE_CORE
+	select MFD_SYSCON if MIPS_BAIKAL_T1
 	help
 	  If you say yes to this option, support will be included for the
 	  Synopsys DesignWare I2C adapter.
diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index 4a54ec1ce6e3..422554416fde 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -174,6 +174,7 @@
  * struct dw_i2c_dev - private i2c-designware data
  * @dev: driver model device node
  * @map: IO registers map
+ * @sysmap: System controller registers map
  * @base: IO registers pointer
  * @ext: Extended IO registers pointer
  * @cmd_complete: tx completion indicator
@@ -226,6 +227,7 @@
 struct dw_i2c_dev {
 	struct device		*dev;
 	struct regmap		*map;
+	struct regmap		*sysmap;
 	void __iomem		*base;
 	void __iomem		*ext;
 	struct completion	cmd_complete;
@@ -282,6 +284,7 @@ struct dw_i2c_dev {
 #define ACCESS_NO_IRQ_SUSPEND	0x00000008
 
 #define MODEL_MSCC_OCELOT	0x00000100
+#define MODEL_BAIKAL_BT1	0x00000200
 #define MODEL_MASK		0x00000f00
 
 int i2c_dw_init_regmap(struct dw_i2c_dev *dev);
diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 93bdcfae57df..e3be46147315 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -19,6 +19,7 @@
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
+#include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_data/i2c-designware.h>
@@ -26,6 +27,7 @@
 #include <linux/pm.h>
 #include <linux/pm_runtime.h>
 #include <linux/property.h>
+#include <linux/regmap.h>
 #include <linux/reset.h>
 #include <linux/sched.h>
 #include <linux/slab.h>
@@ -142,6 +144,66 @@ static inline int dw_i2c_acpi_configure(struct platform_device *pdev)
 #endif
 
 #ifdef CONFIG_OF
+#define BT1_I2C_CTL			0x100
+#define BT1_I2C_CTL_ADDR_MASK		GENMASK(7, 0)
+#define BT1_I2C_CTL_WR			BIT(8)
+#define BT1_I2C_CTL_GO			BIT(31)
+#define BT1_I2C_DI			0x104
+#define BT1_I2C_DO			0x108
+
+static int bt1_i2c_read(void *context, unsigned int reg, unsigned int *val)
+{
+	struct dw_i2c_dev *dev = context;
+	int ret;
+
+	/*
+	 * Note these methods shouldn't ever fail because the system controller
+	 * registers are memory mapped. We check the return value just in case.
+	 */
+	ret = regmap_write(dev->sysmap, BT1_I2C_CTL,
+			   BT1_I2C_CTL_GO | (reg & BT1_I2C_CTL_ADDR_MASK));
+	if (ret)
+		return ret;
+
+	return regmap_read(dev->sysmap, BT1_I2C_DO, val);
+}
+
+static int bt1_i2c_write(void *context, unsigned int reg, unsigned int val)
+{
+	struct dw_i2c_dev *dev = context;
+	int ret;
+
+	ret = regmap_write(dev->sysmap, BT1_I2C_DI, val);
+	if (ret)
+		return ret;
+
+	return regmap_write(dev->sysmap, BT1_I2C_CTL,
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
+static int bt1_i2c_request_regs(struct dw_i2c_dev *dev)
+{
+	dev->sysmap = syscon_node_to_regmap(dev->dev->of_node->parent);
+	if (IS_ERR(dev->sysmap))
+		return PTR_ERR(dev->sysmap);
+
+	dev->map = devm_regmap_init(dev->dev, NULL, dev, &bt1_i2c_cfg);
+	if (IS_ERR(dev->map))
+		return PTR_ERR(dev->map);
+
+	return 0;
+}
+
 #define MSCC_ICPU_CFG_TWI_DELAY		0x0
 #define MSCC_ICPU_CFG_TWI_DELAY_ENABLE	BIT(0)
 #define MSCC_ICPU_CFG_TWI_SPIKE_FILTER	0x4
@@ -176,10 +238,16 @@ static int dw_i2c_of_configure(struct platform_device *pdev)
 static const struct of_device_id dw_i2c_of_match[] = {
 	{ .compatible = "snps,designware-i2c", },
 	{ .compatible = "mscc,ocelot-i2c", .data = (void *)MODEL_MSCC_OCELOT },
+	{ .compatible = "baikal,bt1-sys-i2c", .data = (void *)MODEL_BAIKAL_BT1 },
 	{},
 };
 MODULE_DEVICE_TABLE(of, dw_i2c_of_match);
 #else
+static int bt1_i2c_request_regs(struct dw_i2c_dev *dev)
+{
+	return -ENODEV;
+}
+
 static inline int dw_i2c_of_configure(struct platform_device *pdev)
 {
 	return -ENODEV;
@@ -239,9 +307,16 @@ static int dw_i2c_plat_request_regs(struct dw_i2c_dev *dev)
 	struct platform_device *pdev = to_platform_device(dev->dev);
 	int ret = 0;
 
-	dev->base = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
-	if (IS_ERR(dev->base))
-		ret = PTR_ERR(dev->base);
+	switch (dev->flags & MODEL_MASK) {
+	case MODEL_BAIKAL_BT1:
+		ret = bt1_i2c_request_regs(dev);
+		break;
+	default:
+		dev->base = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
+		if (IS_ERR(dev->base))
+			ret = PTR_ERR(dev->base);
+		break;
+	}
 
 	return ret;
 }
-- 
2.26.2

