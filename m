Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB0BA1D96A6
	for <lists+linux-i2c@lfdr.de>; Tue, 19 May 2020 14:50:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728705AbgESMux (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 May 2020 08:50:53 -0400
Received: from mga12.intel.com ([192.55.52.136]:22000 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726196AbgESMuv (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 19 May 2020 08:50:51 -0400
IronPort-SDR: LVGSH90UcabCF9XRcBuJ/PqI/JpUearUFi9jHzeBOiabZczxiQAfLcHgIttlDbY4vEk7nNQG4Y
 pqgTJgZnDnJQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2020 05:50:50 -0700
IronPort-SDR: w9qRgXm/QS6/3jxMtlygxNf59nDHxo2C4Weht9hd9C5xHtZIBM9Be/3f+8fbg7PMOI89M/J7F8
 +6/ZrpghEccw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,410,1583222400"; 
   d="scan'208";a="288946751"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga004.fm.intel.com with ESMTP; 19 May 2020 05:50:48 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id EAA75396; Tue, 19 May 2020 15:50:47 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 5/7] i2c: designware: Move ACPI parts into common module
Date:   Tue, 19 May 2020 15:50:41 +0300
Message-Id: <20200519125043.6069-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200519125043.6069-1-andriy.shevchenko@linux.intel.com>
References: <20200519125043.6069-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

For possible code reuse in the future, move ACPI parts into common module.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: moved to a common code instead of being a separate (Jarkko)
 drivers/i2c/busses/i2c-designware-common.c  | 135 +++++++++++++++++++-
 drivers/i2c/busses/i2c-designware-core.h    |  15 ++-
 drivers/i2c/busses/i2c-designware-platdrv.c | 111 +---------------
 3 files changed, 142 insertions(+), 119 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
index 2fd5372b1237..e1697ed8b54a 100644
--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -8,17 +8,21 @@
  * Copyright (C) 2007 MontaVista Software Inc.
  * Copyright (C) 2009 Provigent Ltd.
  */
+#include <linux/acpi.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
-#include <linux/export.h>
-#include <linux/errno.h>
+#include <linux/device.h>
 #include <linux/err.h>
+#include <linux/errno.h>
+#include <linux/export.h>
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
+#include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
 #include <linux/swab.h>
+#include <linux/types.h>
 
 #include "i2c-designware-core.h"
 
@@ -116,6 +120,13 @@ int i2c_dw_set_reg_access(struct dw_i2c_dev *dev)
 	return 0;
 }
 
+static const u32 supported_speeds[] = {
+	I2C_MAX_HIGH_SPEED_MODE_FREQ,
+	I2C_MAX_FAST_MODE_PLUS_FREQ,
+	I2C_MAX_FAST_MODE_FREQ,
+	I2C_MAX_STANDARD_MODE_FREQ,
+};
+
 int i2c_dw_validate_speed(struct dw_i2c_dev *dev)
 {
 	struct i2c_timings *t = &dev->timings;
@@ -125,8 +136,8 @@ int i2c_dw_validate_speed(struct dw_i2c_dev *dev)
 	 * Only standard mode at 100kHz, fast mode at 400kHz,
 	 * fast mode plus at 1MHz and high speed mode at 3.4MHz are supported.
 	 */
-	for (i = 0; i < ARRAY_SIZE(i2c_dw_supported_speeds); i++) {
-		if (t->bus_freq_hz == i2c_dw_supported_speeds[i])
+	for (i = 0; i < ARRAY_SIZE(supported_speeds); i++) {
+		if (t->bus_freq_hz == supported_speeds[i])
 			return 0;
 	}
 
@@ -138,6 +149,122 @@ int i2c_dw_validate_speed(struct dw_i2c_dev *dev)
 }
 EXPORT_SYMBOL_GPL(i2c_dw_validate_speed);
 
+#ifdef CONFIG_ACPI
+
+#include <linux/dmi.h>
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
+	for (i = 0; i < ARRAY_SIZE(supported_speeds); i++) {
+		if (acpi_speed >= supported_speeds[i])
+			break;
+	}
+	acpi_speed = i < ARRAY_SIZE(supported_speeds) ? supported_speeds[i] : 0;
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
+
+#endif	/* CONFIG_ACPI */
+
 u32 i2c_dw_scl_hcnt(u32 ic_clk, u32 tSYMBOL, u32 tf, int cond, int offset)
 {
 	/*
diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index 77c8aa422268..150de5e5c31b 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -360,11 +360,12 @@ extern int i2c_dw_probe_lock_support(struct dw_i2c_dev *dev);
 static inline int i2c_dw_probe_lock_support(struct dw_i2c_dev *dev) { return 0; }
 #endif
 
-static __maybe_unused const u32 i2c_dw_supported_speeds[] = {
-	I2C_MAX_HIGH_SPEED_MODE_FREQ,
-	I2C_MAX_FAST_MODE_PLUS_FREQ,
-	I2C_MAX_FAST_MODE_FREQ,
-	I2C_MAX_STANDARD_MODE_FREQ,
-};
-
 int i2c_dw_validate_speed(struct dw_i2c_dev *dev);
+
+#if IS_ENABLED(CONFIG_ACPI)
+int i2c_dw_acpi_configure(struct device *device);
+void i2c_dw_acpi_adjust_bus_speed(struct device *device);
+#else
+static inline int i2c_dw_acpi_configure(struct device *device) { return -ENODEV; }
+static inline void i2c_dw_acpi_adjust_bus_speed(struct device *device) {}
+#endif
diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index a502750c89b7..9be9118f7a8d 100644
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
@@ -39,84 +38,6 @@ static u32 i2c_dw_get_clk_rate_khz(struct dw_i2c_dev *dev)
 }
 
 #ifdef CONFIG_ACPI
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
 static const struct acpi_device_id dw_i2c_acpi_match[] = {
 	{ "INT33C2", 0 },
 	{ "INT33C3", 0 },
@@ -134,11 +55,6 @@ static const struct acpi_device_id dw_i2c_acpi_match[] = {
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, dw_i2c_acpi_match);
-#else
-static inline int dw_i2c_acpi_configure(struct platform_device *pdev)
-{
-	return -ENODEV;
-}
 #endif
 
 #ifdef CONFIG_OF
@@ -198,8 +114,7 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 	struct i2c_adapter *adap;
 	struct dw_i2c_dev *dev;
 	struct i2c_timings *t;
-	u32 acpi_speed;
-	int i, irq, ret;
+	int irq, ret;
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
@@ -229,27 +144,7 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
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
 
@@ -257,7 +152,7 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 		dw_i2c_of_configure(pdev);
 
 	if (has_acpi_companion(&pdev->dev))
-		dw_i2c_acpi_configure(pdev);
+		i2c_dw_acpi_configure(&pdev->dev);
 
 	ret = i2c_dw_validate_speed(dev);
 	if (ret)
-- 
2.26.2

