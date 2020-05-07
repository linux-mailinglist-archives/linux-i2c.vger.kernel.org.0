Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 120521C8D04
	for <lists+linux-i2c@lfdr.de>; Thu,  7 May 2020 15:52:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725964AbgEGNwr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 7 May 2020 09:52:47 -0400
Received: from mga11.intel.com ([192.55.52.93]:7353 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726074AbgEGNwq (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 7 May 2020 09:52:46 -0400
IronPort-SDR: tR9B5pk5wJz/dH1+kjGPEscP/0+pK979KWoPAv36Wpbycj8HSq+r0y3WCwst1xyETlyN7R+UPS
 MQSXk7cz6nVA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2020 06:51:44 -0700
IronPort-SDR: ictqzZKR5YhVR6fybHB7FNLOymkH9bySgvS4XeWy0m5GimVOvlS36RwQkSI8eYdObL+O1447is
 qPhTeV+rMxYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,363,1583222400"; 
   d="scan'208";a="370122191"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 07 May 2020 06:51:43 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 287F4130; Thu,  7 May 2020 16:51:42 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 3/4] i2c: designware: Split out ACPI parts into separate module
Date:   Thu,  7 May 2020 16:51:39 +0300
Message-Id: <20200507135140.14635-3-andriy.shevchenko@linux.intel.com>
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
split out ACPI parts into a separate module.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/Makefile                 |   3 +
 drivers/i2c/busses/i2c-designware-acpi.c    | 130 +++++++++++++++++
 drivers/i2c/busses/i2c-designware-core.h    |   8 ++
 drivers/i2c/busses/i2c-designware-platdrv.c | 151 +++-----------------
 4 files changed, 163 insertions(+), 129 deletions(-)
 create mode 100644 drivers/i2c/busses/i2c-designware-acpi.c

diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
index cadcff3aad814..177a4266dc1e3 100644
--- a/drivers/i2c/busses/Makefile
+++ b/drivers/i2c/busses/Makefile
@@ -50,6 +50,9 @@ obj-$(CONFIG_I2C_CPM)		+= i2c-cpm.o
 obj-$(CONFIG_I2C_DAVINCI)	+= i2c-davinci.o
 obj-$(CONFIG_I2C_DESIGNWARE_CORE)	+= i2c-designware-core.o
 i2c-designware-core-objs := i2c-designware-common.o
+ifeq ($(CONFIG_ACPI),y)
+i2c-designware-core-objs += i2c-designware-acpi.o
+endif
 ifeq ($(CONFIG_OF),y)
 i2c-designware-core-objs += i2c-designware-of.o
 endif
diff --git a/drivers/i2c/busses/i2c-designware-acpi.c b/drivers/i2c/busses/i2c-designware-acpi.c
new file mode 100644
index 0000000000000..78b62546cea8a
--- /dev/null
+++ b/drivers/i2c/busses/i2c-designware-acpi.c
@@ -0,0 +1,130 @@
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
+#include <linux/acpi.h>
+#include <linux/device.h>
+#include <linux/dmi.h>
+#include <linux/export.h>
+#include <linux/i2c.h>
+#include <linux/kernel.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+
+#include "i2c-designware-core.h"
+
+/*
+ * The HCNT/LCNT information coming from ACPI should be the most accurate
+ * for given platform. However, some systems get it wrong. On such systems
+ * we get better results by calculating those based on the input clock.
+ */
+static const struct dmi_system_id i2c_dw_no_acpi_params[] = {
+	{
+		.ident = "Dell Inspiron 7348",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Inspiron 7348"),
+		},
+	},
+	{}
+};
+
+static void i2c_dw_acpi_params(struct device *device, char method[],
+			       u16 *hcnt, u16 *lcnt, u32 *sda_hold)
+{
+	struct acpi_buffer buf = { ACPI_ALLOCATE_BUFFER };
+	acpi_handle handle = ACPI_HANDLE(device);
+	union acpi_object *obj;
+
+	if (dmi_check_system(i2c_dw_no_acpi_params))
+		return;
+
+	if (ACPI_FAILURE(acpi_evaluate_object(handle, method, NULL, &buf)))
+		return;
+
+	obj = (union acpi_object *)buf.pointer;
+	if (obj->type == ACPI_TYPE_PACKAGE && obj->package.count == 3) {
+		const union acpi_object *objs = obj->package.elements;
+
+		*hcnt = (u16)objs[0].integer.value;
+		*lcnt = (u16)objs[1].integer.value;
+		*sda_hold = (u32)objs[2].integer.value;
+	}
+
+	kfree(buf.pointer);
+}
+
+int i2c_dw_acpi_configure(struct device *device)
+{
+	struct dw_i2c_dev *dev = dev_get_drvdata(device);
+	struct i2c_timings *t = &dev->timings;
+	u32 ss_ht = 0, fp_ht = 0, hs_ht = 0, fs_ht = 0;
+
+	dev->tx_fifo_depth = 32;
+	dev->rx_fifo_depth = 32;
+
+	/*
+	 * Try to get SDA hold time and *CNT values from an ACPI method for
+	 * selected speed modes.
+	 */
+	i2c_dw_acpi_params(device, "SSCN", &dev->ss_hcnt, &dev->ss_lcnt, &ss_ht);
+	i2c_dw_acpi_params(device, "FPCN", &dev->fp_hcnt, &dev->fp_lcnt, &fp_ht);
+	i2c_dw_acpi_params(device, "HSCN", &dev->hs_hcnt, &dev->hs_lcnt, &hs_ht);
+	i2c_dw_acpi_params(device, "FMCN", &dev->fs_hcnt, &dev->fs_lcnt, &fs_ht);
+
+	switch (t->bus_freq_hz) {
+	case I2C_MAX_STANDARD_MODE_FREQ:
+		dev->sda_hold_time = ss_ht;
+		break;
+	case I2C_MAX_FAST_MODE_PLUS_FREQ:
+		dev->sda_hold_time = fp_ht;
+		break;
+	case I2C_MAX_HIGH_SPEED_MODE_FREQ:
+		dev->sda_hold_time = hs_ht;
+		break;
+	case I2C_MAX_FAST_MODE_FREQ:
+	default:
+		dev->sda_hold_time = fs_ht;
+		break;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(i2c_dw_acpi_configure);
+
+void i2c_dw_acpi_adjust_bus_speed(struct device *device)
+{
+	struct dw_i2c_dev *dev = dev_get_drvdata(device);
+	struct i2c_timings *t = &dev->timings;
+	u32 acpi_speed;
+	int i;
+
+	acpi_speed = i2c_acpi_find_bus_speed(device);
+	/*
+	 * Some DSTDs use a non standard speed, round down to the lowest
+	 * standard speed.
+	 */
+	for (i = 0; i < ARRAY_SIZE(i2c_dw_supported_speeds); i++) {
+		if (acpi_speed >= i2c_dw_supported_speeds[i])
+			break;
+	}
+	acpi_speed = i < ARRAY_SIZE(i2c_dw_supported_speeds) ? i2c_dw_supported_speeds[i] : 0;
+
+	/*
+	 * Find bus speed from the "clock-frequency" device property, ACPI
+	 * or by using fast mode if neither is set.
+	 */
+	if (acpi_speed && t->bus_freq_hz)
+		t->bus_freq_hz = min(t->bus_freq_hz, acpi_speed);
+	else if (acpi_speed || t->bus_freq_hz)
+		t->bus_freq_hz = max(t->bus_freq_hz, acpi_speed);
+	else
+		t->bus_freq_hz = I2C_MAX_FAST_MODE_FREQ;
+}
+EXPORT_SYMBOL_GPL(i2c_dw_acpi_adjust_bus_speed);
diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index b3d7c04ffe1ae..140c0b3d49686 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -383,6 +383,14 @@ static inline int i2c_dw_validate_speed(struct dw_i2c_dev *dev)
 	return 0;
 }
 
+#if IS_ENABLED(CONFIG_ACPI)
+int i2c_dw_acpi_configure(struct device *device);
+void i2c_dw_acpi_adjust_bus_speed(struct device *device);
+#else
+static inline int i2c_dw_acpi_configure(struct device *device) { return -ENODEV; }
+static inline void i2c_dw_acpi_adjust_bus_speed(struct device *device) {}
+#endif
+
 #if IS_ENABLED(CONFIG_OF)
 int i2c_dw_of_configure(struct device *device);
 #else
diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 6780d636bac73..deada90e67071 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -12,7 +12,6 @@
 #include <linux/clk-provider.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
-#include <linux/dmi.h>
 #include <linux/err.h>
 #include <linux/errno.h>
 #include <linux/i2c.h>
@@ -36,109 +35,6 @@ static u32 i2c_dw_get_clk_rate_khz(struct dw_i2c_dev *dev)
 	return clk_get_rate(dev->clk)/1000;
 }
 
-#ifdef CONFIG_ACPI
-/*
- * The HCNT/LCNT information coming from ACPI should be the most accurate
- * for given platform. However, some systems get it wrong. On such systems
- * we get better results by calculating those based on the input clock.
- */
-static const struct dmi_system_id dw_i2c_no_acpi_params[] = {
-	{
-		.ident = "Dell Inspiron 7348",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Inspiron 7348"),
-		},
-	},
-	{ }
-};
-
-static void dw_i2c_acpi_params(struct platform_device *pdev, char method[],
-			       u16 *hcnt, u16 *lcnt, u32 *sda_hold)
-{
-	struct acpi_buffer buf = { ACPI_ALLOCATE_BUFFER };
-	acpi_handle handle = ACPI_HANDLE(&pdev->dev);
-	union acpi_object *obj;
-
-	if (dmi_check_system(dw_i2c_no_acpi_params))
-		return;
-
-	if (ACPI_FAILURE(acpi_evaluate_object(handle, method, NULL, &buf)))
-		return;
-
-	obj = (union acpi_object *)buf.pointer;
-	if (obj->type == ACPI_TYPE_PACKAGE && obj->package.count == 3) {
-		const union acpi_object *objs = obj->package.elements;
-
-		*hcnt = (u16)objs[0].integer.value;
-		*lcnt = (u16)objs[1].integer.value;
-		*sda_hold = (u32)objs[2].integer.value;
-	}
-
-	kfree(buf.pointer);
-}
-
-static int dw_i2c_acpi_configure(struct platform_device *pdev)
-{
-	struct dw_i2c_dev *dev = platform_get_drvdata(pdev);
-	struct i2c_timings *t = &dev->timings;
-	u32 ss_ht = 0, fp_ht = 0, hs_ht = 0, fs_ht = 0;
-
-	dev->tx_fifo_depth = 32;
-	dev->rx_fifo_depth = 32;
-
-	/*
-	 * Try to get SDA hold time and *CNT values from an ACPI method for
-	 * selected speed modes.
-	 */
-	dw_i2c_acpi_params(pdev, "SSCN", &dev->ss_hcnt, &dev->ss_lcnt, &ss_ht);
-	dw_i2c_acpi_params(pdev, "FPCN", &dev->fp_hcnt, &dev->fp_lcnt, &fp_ht);
-	dw_i2c_acpi_params(pdev, "HSCN", &dev->hs_hcnt, &dev->hs_lcnt, &hs_ht);
-	dw_i2c_acpi_params(pdev, "FMCN", &dev->fs_hcnt, &dev->fs_lcnt, &fs_ht);
-
-	switch (t->bus_freq_hz) {
-	case I2C_MAX_STANDARD_MODE_FREQ:
-		dev->sda_hold_time = ss_ht;
-		break;
-	case I2C_MAX_FAST_MODE_PLUS_FREQ:
-		dev->sda_hold_time = fp_ht;
-		break;
-	case I2C_MAX_HIGH_SPEED_MODE_FREQ:
-		dev->sda_hold_time = hs_ht;
-		break;
-	case I2C_MAX_FAST_MODE_FREQ:
-	default:
-		dev->sda_hold_time = fs_ht;
-		break;
-	}
-
-	return 0;
-}
-
-static const struct acpi_device_id dw_i2c_acpi_match[] = {
-	{ "INT33C2", 0 },
-	{ "INT33C3", 0 },
-	{ "INT3432", 0 },
-	{ "INT3433", 0 },
-	{ "80860F41", ACCESS_NO_IRQ_SUSPEND },
-	{ "808622C1", ACCESS_NO_IRQ_SUSPEND | MODEL_CHERRYTRAIL },
-	{ "AMD0010", ACCESS_INTR_MASK },
-	{ "AMDI0010", ACCESS_INTR_MASK },
-	{ "AMDI0510", 0 },
-	{ "APMC0D0F", 0 },
-	{ "HISI02A1", 0 },
-	{ "HISI02A2", 0 },
-	{ "HISI02A3", 0 },
-	{ }
-};
-MODULE_DEVICE_TABLE(acpi, dw_i2c_acpi_match);
-#else
-static inline int dw_i2c_acpi_configure(struct platform_device *pdev)
-{
-	return -ENODEV;
-}
-#endif
-
 static void dw_i2c_plat_pm_cleanup(struct dw_i2c_dev *dev)
 {
 	pm_runtime_disable(dev->dev);
@@ -153,8 +49,7 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 	struct i2c_adapter *adap;
 	struct dw_i2c_dev *dev;
 	struct i2c_timings *t;
-	u32 acpi_speed;
-	int i, irq, ret;
+	int irq, ret;
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
@@ -184,27 +79,7 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 	else
 		i2c_parse_fw_timings(&pdev->dev, t, false);
 
-	acpi_speed = i2c_acpi_find_bus_speed(&pdev->dev);
-	/*
-	 * Some DSTDs use a non standard speed, round down to the lowest
-	 * standard speed.
-	 */
-	for (i = 0; i < ARRAY_SIZE(i2c_dw_supported_speeds); i++) {
-		if (acpi_speed >= i2c_dw_supported_speeds[i])
-			break;
-	}
-	acpi_speed = i < ARRAY_SIZE(i2c_dw_supported_speeds) ? i2c_dw_supported_speeds[i] : 0;
-
-	/*
-	 * Find bus speed from the "clock-frequency" device property, ACPI
-	 * or by using fast mode if neither is set.
-	 */
-	if (acpi_speed && t->bus_freq_hz)
-		t->bus_freq_hz = min(t->bus_freq_hz, acpi_speed);
-	else if (acpi_speed || t->bus_freq_hz)
-		t->bus_freq_hz = max(t->bus_freq_hz, acpi_speed);
-	else
-		t->bus_freq_hz = I2C_MAX_FAST_MODE_FREQ;
+	i2c_dw_acpi_adjust_bus_speed(&pdev->dev);
 
 	dev->flags |= (uintptr_t)device_get_match_data(&pdev->dev);
 
@@ -212,7 +87,7 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 		i2c_dw_of_configure(&pdev->dev);
 
 	if (has_acpi_companion(&pdev->dev))
-		dw_i2c_acpi_configure(pdev);
+		i2c_dw_acpi_configure(&pdev->dev);
 
 	ret = i2c_dw_validate_speed(dev);
 	if (ret)
@@ -374,6 +249,24 @@ static const struct dev_pm_ops dw_i2c_dev_pm_ops = {
 #define DW_I2C_DEV_PMOPS NULL
 #endif
 
+static const struct acpi_device_id dw_i2c_acpi_match[] = {
+	{ "INT33C2", 0 },
+	{ "INT33C3", 0 },
+	{ "INT3432", 0 },
+	{ "INT3433", 0 },
+	{ "80860F41", ACCESS_NO_IRQ_SUSPEND },
+	{ "808622C1", ACCESS_NO_IRQ_SUSPEND | MODEL_CHERRYTRAIL },
+	{ "AMD0010", ACCESS_INTR_MASK },
+	{ "AMDI0010", ACCESS_INTR_MASK },
+	{ "AMDI0510", 0 },
+	{ "APMC0D0F", 0 },
+	{ "HISI02A1", 0 },
+	{ "HISI02A2", 0 },
+	{ "HISI02A3", 0 },
+	{}
+};
+MODULE_DEVICE_TABLE(acpi, dw_i2c_acpi_match);
+
 static const struct of_device_id dw_i2c_of_match[] = {
 	{ .compatible = "snps,designware-i2c", },
 	{ .compatible = "mscc,ocelot-i2c", .data = (void *)MODEL_MSCC_OCELOT },
@@ -390,7 +283,7 @@ static struct platform_driver dw_i2c_driver = {
 	.driver		= {
 		.name	= "i2c_designware",
 		.of_match_table = dw_i2c_of_match,
-		.acpi_match_table = ACPI_PTR(dw_i2c_acpi_match),
+		.acpi_match_table = dw_i2c_acpi_match,
 		.pm	= DW_I2C_DEV_PMOPS,
 	},
 };
-- 
2.26.2

