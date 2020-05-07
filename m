Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6F881C8D01
	for <lists+linux-i2c@lfdr.de>; Thu,  7 May 2020 15:51:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726491AbgEGNvp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 7 May 2020 09:51:45 -0400
Received: from mga07.intel.com ([134.134.136.100]:23255 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726350AbgEGNvp (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 7 May 2020 09:51:45 -0400
IronPort-SDR: g76Cum8yQCCLAKaqK8aUVYQbPgy0k8vrEPxQ6exS0kMB1EhwD1J0VWmg9WPr+m5UDAzcmSR6iX
 Mhid3dcLnGoA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2020 06:51:44 -0700
IronPort-SDR: WMpjAvkMfgsUIRre7tMOSM68LdKTSSUb1L52GjOAE2Z01gdU7z1LfTkM5k3fKBE3x3bMiiRMtw
 V1V4MSZwNeOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,363,1583222400"; 
   d="scan'208";a="407641038"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 07 May 2020 06:51:42 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 1BF0D101; Thu,  7 May 2020 16:51:42 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 2/4] i2c: designware: Split out OF parts into separate module
Date:   Thu,  7 May 2020 16:51:38 +0300
Message-Id: <20200507135140.14635-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200507135140.14635-1-andriy.shevchenko@linux.intel.com>
References: <20200507135140.14635-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

For better maintenance and possible code reuse in the future,
split out OF parts into a separate module.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/Makefile                 |  3 ++
 drivers/i2c/busses/i2c-designware-core.h    |  6 +++
 drivers/i2c/busses/i2c-designware-of.c      | 50 ++++++++++++++++++
 drivers/i2c/busses/i2c-designware-platdrv.c | 56 ++++-----------------
 4 files changed, 68 insertions(+), 47 deletions(-)
 create mode 100644 drivers/i2c/busses/i2c-designware-of.c

diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
index a33aa107a05d2..cadcff3aad814 100644
--- a/drivers/i2c/busses/Makefile
+++ b/drivers/i2c/busses/Makefile
@@ -50,6 +50,9 @@ obj-$(CONFIG_I2C_CPM)		+= i2c-cpm.o
 obj-$(CONFIG_I2C_DAVINCI)	+= i2c-davinci.o
 obj-$(CONFIG_I2C_DESIGNWARE_CORE)	+= i2c-designware-core.o
 i2c-designware-core-objs := i2c-designware-common.o
+ifeq ($(CONFIG_OF),y)
+i2c-designware-core-objs += i2c-designware-of.o
+endif
 i2c-designware-core-objs += i2c-designware-master.o
 ifeq ($(CONFIG_I2C_DESIGNWARE_SLAVE),y)
 i2c-designware-core-objs += i2c-designware-slave.o
diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index 626959573f894..b3d7c04ffe1ae 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -382,3 +382,9 @@ static inline int i2c_dw_validate_speed(struct dw_i2c_dev *dev)
 
 	return 0;
 }
+
+#if IS_ENABLED(CONFIG_OF)
+int i2c_dw_of_configure(struct device *device);
+#else
+static inline int i2c_dw_of_configure(struct device *device) { return -ENODEV; }
+#endif
diff --git a/drivers/i2c/busses/i2c-designware-of.c b/drivers/i2c/busses/i2c-designware-of.c
new file mode 100644
index 0000000000000..7434bce286b98
--- /dev/null
+++ b/drivers/i2c/busses/i2c-designware-of.c
@@ -0,0 +1,50 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Synopsys DesignWare I2C adapter driver.
+ *
+ * Based on the TI DAVINCI I2C adapter driver.
+ *
+ * Copyright (C) 2006 Texas Instruments.
+ * Copyright (C) 2007 MontaVista Software Inc.
+ * Copyright (C) 2009 Provigent Ltd.
+ */
+#include <linux/bits.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/export.h>
+#include <linux/io.h>
+#include <linux/platform_device.h>
+#include <linux/types.h>
+
+#include "i2c-designware-core.h"
+
+#define MSCC_ICPU_CFG_TWI_DELAY		0x0
+#define MSCC_ICPU_CFG_TWI_DELAY_ENABLE	BIT(0)
+#define MSCC_ICPU_CFG_TWI_SPIKE_FILTER	0x4
+
+static int mscc_twi_set_sda_hold_time(struct dw_i2c_dev *dev)
+{
+	writel((dev->sda_hold_time << 1) | MSCC_ICPU_CFG_TWI_DELAY_ENABLE,
+	       dev->ext + MSCC_ICPU_CFG_TWI_DELAY);
+
+	return 0;
+}
+
+int i2c_dw_of_configure(struct device *device)
+{
+	struct platform_device *pdev = to_platform_device(device);
+	struct dw_i2c_dev *dev = platform_get_drvdata(pdev);
+
+	switch (dev->flags & MODEL_MASK) {
+	case MODEL_MSCC_OCELOT:
+		dev->ext = devm_platform_ioremap_resource(pdev, 1);
+		if (!IS_ERR(dev->ext))
+			dev->set_sda_hold_time = mscc_twi_set_sda_hold_time;
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(i2c_dw_of_configure);
diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index d6c03d7179c7a..6780d636bac73 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -17,10 +17,8 @@
 #include <linux/errno.h>
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
-#include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_data/i2c-designware.h>
 #include <linux/platform_device.h>
 #include <linux/pm.h>
@@ -141,49 +139,6 @@ static inline int dw_i2c_acpi_configure(struct platform_device *pdev)
 }
 #endif
 
-#ifdef CONFIG_OF
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
-static int dw_i2c_of_configure(struct platform_device *pdev)
-{
-	struct dw_i2c_dev *dev = platform_get_drvdata(pdev);
-
-	switch (dev->flags & MODEL_MASK) {
-	case MODEL_MSCC_OCELOT:
-		dev->ext = devm_platform_ioremap_resource(pdev, 1);
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
-static const struct of_device_id dw_i2c_of_match[] = {
-	{ .compatible = "snps,designware-i2c", },
-	{ .compatible = "mscc,ocelot-i2c", .data = (void *)MODEL_MSCC_OCELOT },
-	{},
-};
-MODULE_DEVICE_TABLE(of, dw_i2c_of_match);
-#else
-static inline int dw_i2c_of_configure(struct platform_device *pdev)
-{
-	return -ENODEV;
-}
-#endif
-
 static void dw_i2c_plat_pm_cleanup(struct dw_i2c_dev *dev)
 {
 	pm_runtime_disable(dev->dev);
@@ -254,7 +209,7 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 	dev->flags |= (uintptr_t)device_get_match_data(&pdev->dev);
 
 	if (pdev->dev.of_node)
-		dw_i2c_of_configure(pdev);
+		i2c_dw_of_configure(&pdev->dev);
 
 	if (has_acpi_companion(&pdev->dev))
 		dw_i2c_acpi_configure(pdev);
@@ -419,6 +374,13 @@ static const struct dev_pm_ops dw_i2c_dev_pm_ops = {
 #define DW_I2C_DEV_PMOPS NULL
 #endif
 
+static const struct of_device_id dw_i2c_of_match[] = {
+	{ .compatible = "snps,designware-i2c", },
+	{ .compatible = "mscc,ocelot-i2c", .data = (void *)MODEL_MSCC_OCELOT },
+	{}
+};
+MODULE_DEVICE_TABLE(of, dw_i2c_of_match);
+
 /* Work with hotplug and coldplug */
 MODULE_ALIAS("platform:i2c_designware");
 
@@ -427,7 +389,7 @@ static struct platform_driver dw_i2c_driver = {
 	.remove = dw_i2c_plat_remove,
 	.driver		= {
 		.name	= "i2c_designware",
-		.of_match_table = of_match_ptr(dw_i2c_of_match),
+		.of_match_table = dw_i2c_of_match,
 		.acpi_match_table = ACPI_PTR(dw_i2c_acpi_match),
 		.pm	= DW_I2C_DEV_PMOPS,
 	},
-- 
2.26.2

