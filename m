Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A58841CCA02
	for <lists+linux-i2c@lfdr.de>; Sun, 10 May 2020 11:59:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728681AbgEJJ7s (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 10 May 2020 05:59:48 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:46314 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728464AbgEJJ7s (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 10 May 2020 05:59:48 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id D37BB8000AFA;
        Sun, 10 May 2020 09:50:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id g2auXzFxYgSj; Sun, 10 May 2020 12:50:51 +0300 (MSK)
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
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        <linux-mips@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Hanjun Guo <guohanjun@huawei.com>,
        Hans de Goede <hdegoede@redhat.com>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>
Subject: [PATCH v2 08/12] i2c: designware: Introduce platform drivers glue layer interface
Date:   Sun, 10 May 2020 12:50:14 +0300
Message-ID: <20200510095019.20981-9-Sergey.Semin@baikalelectronics.ru>
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

Seeing the DW I2C platform driver is getting overcomplicated with a lot of
vendor-specific configs let's introduce a glue-layer interface so new
platforms which equipped with Synopsys Designware APB I2C IP-core would
be able to handle their peculiarities in the dedicated objects.

The generic platform setups and cleanups can now be performed by means of
two new functions exported from the Dw I2C platform driver:

int i2c_dw_plat_setup(struct dw_i2c_dev *dev);
int i2c_dw_plat_clear(struct dw_i2c_dev *dev);

They also install and remove the I2C controller respectively. In addition
if device supports the PM interface a glue driver can use the generic
platform PM callbacks collected into the PM dev ops structure:

const struct dev_pm_ops i2c_dw_plat_dev_pm_ops;

Before setting the platform DW I2C device up the glue probe code is
supposed to create an instance of `struct dw_i2c_dev` and pre-initialize
its `struct device` pointer together with optional platform-specific
flags. Currently the ACCESS_NO_IRQ_SUSPEND and ACCESS_INTR_MASK flags are
supported.

Note we moved the platform driver private data setup to the generic
platform probe method. By doing so the driver data pointer will be free
to be used by the glue-layer driver.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Paul Burton <paulburton@kernel.org>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>
Cc: linux-mips@vger.kernel.org
Cc: devicetree@vger.kernel.org
---
 drivers/i2c/busses/i2c-designware-core.h    |  4 +
 drivers/i2c/busses/i2c-designware-platdrv.c | 84 +++++++++++++--------
 drivers/i2c/busses/i2c-designware-platdrv.h | 16 ++++
 3 files changed, 71 insertions(+), 33 deletions(-)
 create mode 100644 drivers/i2c/busses/i2c-designware-platdrv.h

diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index b5b981c1bb0d..10606266b30c 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -8,6 +8,8 @@
  * Copyright (C) 2007 MontaVista Software Inc.
  * Copyright (C) 2009 Provigent Ltd.
  */
+#ifndef __I2C_DESIGNWARE_CORE_H__
+#define __I2C_DESIGNWARE_CORE_H__
 
 #include <linux/i2c.h>
 #include <linux/regmap.h>
@@ -324,3 +326,5 @@ extern int i2c_dw_probe_lock_support(struct dw_i2c_dev *dev);
 #else
 static inline int i2c_dw_probe_lock_support(struct dw_i2c_dev *dev) { return 0; }
 #endif
+
+#endif /* __I2C_DESIGNWARE_CORE_H__ */
diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 5536673060cc..274953155569 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -32,6 +32,7 @@
 #include <linux/suspend.h>
 
 #include "i2c-designware-core.h"
+#include "i2c-designware-platdrv.h"
 
 static u32 i2c_dw_get_clk_rate_khz(struct dw_i2c_dev *dev)
 {
@@ -80,9 +81,9 @@ static void dw_i2c_acpi_params(struct platform_device *pdev, char method[],
 	kfree(buf.pointer);
 }
 
-static int dw_i2c_acpi_configure(struct platform_device *pdev)
+static int dw_i2c_acpi_configure(struct dw_i2c_dev *dev)
 {
-	struct dw_i2c_dev *dev = platform_get_drvdata(pdev);
+	struct platform_device *pdev = to_platform_device(dev->dev);
 	struct i2c_timings *t = &dev->timings;
 	u32 ss_ht = 0, fp_ht = 0, hs_ht = 0, fs_ht = 0;
 
@@ -135,7 +136,7 @@ static const struct acpi_device_id dw_i2c_acpi_match[] = {
 };
 MODULE_DEVICE_TABLE(acpi, dw_i2c_acpi_match);
 #else
-static inline int dw_i2c_acpi_configure(struct platform_device *pdev)
+static inline int dw_i2c_acpi_configure(struct dw_i2c_dev *dev)
 {
 	return -ENODEV;
 }
@@ -154,9 +155,9 @@ static int mscc_twi_set_sda_hold_time(struct dw_i2c_dev *dev)
 	return 0;
 }
 
-static int dw_i2c_of_configure(struct platform_device *pdev)
+static int dw_i2c_of_configure(struct dw_i2c_dev *dev)
 {
-	struct dw_i2c_dev *dev = platform_get_drvdata(pdev);
+	struct platform_device *pdev = to_platform_device(dev->dev);
 	struct resource *mem;
 
 	switch (dev->flags & MODEL_MASK) {
@@ -180,7 +181,7 @@ static const struct of_device_id dw_i2c_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, dw_i2c_of_match);
 #else
-static inline int dw_i2c_of_configure(struct platform_device *pdev)
+static inline int dw_i2c_of_configure(struct dw_i2c_dev *dev)
 {
 	return -ENODEV;
 }
@@ -234,33 +235,25 @@ static const u32 supported_speeds[] = {
 	I2C_MAX_STANDARD_MODE_FREQ,
 };
 
-static int dw_i2c_plat_probe(struct platform_device *pdev)
+int i2c_dw_plat_setup(struct dw_i2c_dev *dev)
 {
+	struct platform_device *pdev = to_platform_device(dev->dev);
 	struct dw_i2c_platform_data *pdata = dev_get_platdata(&pdev->dev);
 	struct i2c_adapter *adap;
-	struct dw_i2c_dev *dev;
 	struct i2c_timings *t;
 	u32 acpi_speed;
 	struct resource *mem;
-	int i, irq, ret;
+	int i, ret;
 
-	irq = platform_get_irq(pdev, 0);
-	if (irq < 0)
-		return irq;
-
-	dev = devm_kzalloc(&pdev->dev, sizeof(struct dw_i2c_dev), GFP_KERNEL);
-	if (!dev)
-		return -ENOMEM;
+	dev->irq = platform_get_irq(pdev, 0);
+	if (dev->irq < 0)
+		return dev->irq;
 
 	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	dev->base = devm_ioremap_resource(&pdev->dev, mem);
 	if (IS_ERR(dev->base))
 		return PTR_ERR(dev->base);
 
-	dev->dev = &pdev->dev;
-	dev->irq = irq;
-	platform_set_drvdata(pdev, dev);
-
 	dev->rst = devm_reset_control_get_optional_exclusive(&pdev->dev, NULL);
 	if (IS_ERR(dev->rst))
 		return PTR_ERR(dev->rst);
@@ -295,13 +288,11 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 	else
 		t->bus_freq_hz = I2C_MAX_FAST_MODE_FREQ;
 
-	dev->flags |= (uintptr_t)device_get_match_data(&pdev->dev);
-
 	if (pdev->dev.of_node)
-		dw_i2c_of_configure(pdev);
+		dw_i2c_of_configure(dev);
 
 	if (has_acpi_companion(&pdev->dev))
-		dw_i2c_acpi_configure(pdev);
+		dw_i2c_acpi_configure(dev);
 
 	/*
 	 * Only standard mode at 100kHz, fast mode at 400kHz,
@@ -393,10 +384,11 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 	reset_control_assert(dev->rst);
 	return ret;
 }
+EXPORT_SYMBOL_GPL(i2c_dw_plat_setup);
 
-static int dw_i2c_plat_remove(struct platform_device *pdev)
+int i2c_dw_plat_clear(struct dw_i2c_dev *dev)
 {
-	struct dw_i2c_dev *dev = platform_get_drvdata(pdev);
+	struct platform_device *pdev = to_platform_device(dev->dev);
 
 	pm_runtime_get_sync(&pdev->dev);
 
@@ -412,6 +404,29 @@ static int dw_i2c_plat_remove(struct platform_device *pdev)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(i2c_dw_plat_clear);
+
+static int dw_i2c_plat_probe(struct platform_device *pdev)
+{
+	struct dw_i2c_dev *dev;
+
+	dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
+	if (!dev)
+		return -ENOMEM;
+
+	dev->dev = &pdev->dev;
+	dev->flags |= (uintptr_t)device_get_match_data(dev->dev);
+	platform_set_drvdata(pdev, dev);
+
+	return i2c_dw_plat_setup(dev);
+}
+
+static int dw_i2c_plat_remove(struct platform_device *pdev)
+{
+	struct dw_i2c_dev *dev = platform_get_drvdata(pdev);
+
+	return i2c_dw_plat_clear(dev);
+}
 
 #ifdef CONFIG_PM_SLEEP
 static int dw_i2c_plat_prepare(struct device *dev)
@@ -470,17 +485,20 @@ static int dw_i2c_plat_resume(struct device *dev)
 	return 0;
 }
 
-static const struct dev_pm_ops dw_i2c_dev_pm_ops = {
+#else
+
+#define dw_i2c_plat_prepare	NULL
+#define dw_i2c_plat_complete	NULL
+
+#endif
+
+const struct dev_pm_ops i2c_dw_plat_dev_pm_ops = {
 	.prepare = dw_i2c_plat_prepare,
 	.complete = dw_i2c_plat_complete,
 	SET_LATE_SYSTEM_SLEEP_PM_OPS(dw_i2c_plat_suspend, dw_i2c_plat_resume)
 	SET_RUNTIME_PM_OPS(dw_i2c_plat_suspend, dw_i2c_plat_resume, NULL)
 };
-
-#define DW_I2C_DEV_PMOPS (&dw_i2c_dev_pm_ops)
-#else
-#define DW_I2C_DEV_PMOPS NULL
-#endif
+EXPORT_SYMBOL_GPL(i2c_dw_plat_dev_pm_ops);
 
 /* Work with hotplug and coldplug */
 MODULE_ALIAS("platform:i2c_designware");
@@ -492,7 +510,7 @@ static struct platform_driver dw_i2c_driver = {
 		.name	= "i2c_designware",
 		.of_match_table = of_match_ptr(dw_i2c_of_match),
 		.acpi_match_table = ACPI_PTR(dw_i2c_acpi_match),
-		.pm	= DW_I2C_DEV_PMOPS,
+		.pm	= &i2c_dw_plat_dev_pm_ops,
 	},
 };
 
diff --git a/drivers/i2c/busses/i2c-designware-platdrv.h b/drivers/i2c/busses/i2c-designware-platdrv.h
new file mode 100644
index 000000000000..8916c4f61d7f
--- /dev/null
+++ b/drivers/i2c/busses/i2c-designware-platdrv.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Synopsys DesignWare I2C adapter driver.
+ */
+#ifndef __I2C_DESIGNWARE_PLATDRV_H__
+#define __I2C_DESIGNWARE_PLATDRV_H__
+
+#include <linux/pm.h>
+
+#include "i2c-designware-core.h"
+
+extern int i2c_dw_plat_setup(struct dw_i2c_dev *dev);
+extern int i2c_dw_plat_clear(struct dw_i2c_dev *dev);
+extern const struct dev_pm_ops i2c_dw_plat_dev_pm_ops;
+
+#endif /* __I2C_DESIGNWARE_PLATDRV_H__ */
-- 
2.25.1

