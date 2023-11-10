Return-Path: <linux-i2c+bounces-13-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F14FB7E8138
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Nov 2023 19:25:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1FDDEB20C64
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Nov 2023 18:25:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9449438DE9;
	Fri, 10 Nov 2023 18:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HV00dD0i"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FFB363B4
	for <linux-i2c@vger.kernel.org>; Fri, 10 Nov 2023 18:25:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23C481A308;
	Fri, 10 Nov 2023 10:25:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699640733; x=1731176733;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UlLtzUZidhLr+ErCA/P7beaN1JMuUCeo3WO1WKunYxo=;
  b=HV00dD0iBGlvdN0gUwrhAPf5oHpatzinqeyMcQpQP2OcC1TxT8e7ZFa3
   65J0SfSJjc/lB0V7wrTBosd6QQiL23xkR94Lh30Syo9l1Ko+eBqrfBWTc
   J3rzGQCujCvsqeEwFomJFyXkmr5rmS9/U6ecuGjR26xwmclQ/nhrpOYS9
   0mSe8C/JSpb4B8L8mdl3PeBLy0W5rWPWf1r+y5pd1iAzzys8xi1dHhSn4
   bsoLHbwmwKHBv7hcjhUq/5i+/yshtOG5Bj1cLjM4hTTuQ887O8Roiv16B
   iBnhg2cYXZOw5PVEUcMoPHFuoY3ILeTh96qlbkoeGNdtqv160+Ffw4U1p
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="375251946"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="375251946"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 10:23:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="798663761"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="798663761"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 10 Nov 2023 10:23:21 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 080188BB; Fri, 10 Nov 2023 20:23:08 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Wolfram Sang <wsa@kernel.org>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v3 15/25] i2c: designware: Consolidate firmware parsing and configuring code
Date: Fri, 10 Nov 2023 20:11:35 +0200
Message-ID: <20231110182304.3894319-16-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
In-Reply-To: <20231110182304.3894319-1-andriy.shevchenko@linux.intel.com>
References: <20231110182304.3894319-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We have the same code flows in the PCI and plaform drivers. Moreover,
the flow requires the common code to export a few functions. Instead,
consolidate that flow under new function called
i2c_dw_fw_parse_and_configure() and drop unneeded exports.

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-common.c  | 68 +++++++++++++++++++--
 drivers/i2c/busses/i2c-designware-core.h    |  9 +--
 drivers/i2c/busses/i2c-designware-pcidrv.c  | 11 +---
 drivers/i2c/busses/i2c-designware-platdrv.c | 48 +--------------
 4 files changed, 66 insertions(+), 70 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
index 8d2223d164e3..a5cae814a9c2 100644
--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -20,6 +20,7 @@
 #include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/swab.h>
@@ -188,7 +189,7 @@ static const u32 supported_speeds[] = {
 	I2C_MAX_STANDARD_MODE_FREQ,
 };
 
-int i2c_dw_validate_speed(struct dw_i2c_dev *dev)
+static int i2c_dw_validate_speed(struct dw_i2c_dev *dev)
 {
 	struct i2c_timings *t = &dev->timings;
 	unsigned int i;
@@ -208,7 +209,44 @@ int i2c_dw_validate_speed(struct dw_i2c_dev *dev)
 
 	return -EINVAL;
 }
-EXPORT_SYMBOL_GPL(i2c_dw_validate_speed);
+
+#ifdef CONFIG_OF
+
+#include <linux/platform_device.h>
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
+static void i2c_dw_of_configure(struct device *device)
+{
+	struct platform_device *pdev = to_platform_device(device);
+	struct dw_i2c_dev *dev = dev_get_drvdata(device);
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
+}
+
+#else	/* CONFIG_OF */
+
+static inline void i2c_dw_of_configure(struct device *device) { }
+
+#endif	/* CONFIG_OF */
 
 #ifdef CONFIG_ACPI
 
@@ -255,7 +293,7 @@ static void i2c_dw_acpi_params(struct device *device, char method[],
 	kfree(buf.pointer);
 }
 
-void i2c_dw_acpi_configure(struct device *device)
+static void i2c_dw_acpi_configure(struct device *device)
 {
 	struct dw_i2c_dev *dev = dev_get_drvdata(device);
 	struct i2c_timings *t = &dev->timings;
@@ -286,7 +324,6 @@ void i2c_dw_acpi_configure(struct device *device)
 		break;
 	}
 }
-EXPORT_SYMBOL_GPL(i2c_dw_acpi_configure);
 
 static u32 i2c_dw_acpi_round_bus_speed(struct device *device)
 {
@@ -308,11 +345,13 @@ static u32 i2c_dw_acpi_round_bus_speed(struct device *device)
 
 #else	/* CONFIG_ACPI */
 
+static inline void i2c_dw_acpi_configure(struct device *device) { }
+
 static inline u32 i2c_dw_acpi_round_bus_speed(struct device *device) { return 0; }
 
 #endif	/* CONFIG_ACPI */
 
-void i2c_dw_adjust_bus_speed(struct dw_i2c_dev *dev)
+static void i2c_dw_adjust_bus_speed(struct dw_i2c_dev *dev)
 {
 	u32 acpi_speed = i2c_dw_acpi_round_bus_speed(dev->dev);
 	struct i2c_timings *t = &dev->timings;
@@ -328,7 +367,24 @@ void i2c_dw_adjust_bus_speed(struct dw_i2c_dev *dev)
 	else
 		t->bus_freq_hz = I2C_MAX_FAST_MODE_FREQ;
 }
-EXPORT_SYMBOL_GPL(i2c_dw_adjust_bus_speed);
+
+int i2c_dw_fw_parse_and_configure(struct dw_i2c_dev *dev)
+{
+	struct i2c_timings *t = &dev->timings;
+	struct device *device = dev->dev;
+
+	i2c_parse_fw_timings(device, t, false);
+
+	i2c_dw_adjust_bus_speed(dev);
+
+	if (device->of_node)
+		i2c_dw_of_configure(device);
+	if (has_acpi_companion(device))
+		i2c_dw_acpi_configure(device);
+
+	return i2c_dw_validate_speed(dev);
+}
+EXPORT_SYMBOL_GPL(i2c_dw_fw_parse_and_configure);
 
 u32 i2c_dw_scl_hcnt(u32 ic_clk, u32 tSYMBOL, u32 tf, int cond, int offset)
 {
diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index b7884f15e0e9..22477143bb98 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -395,11 +395,4 @@ int i2c_dw_baytrail_probe_lock_support(struct dw_i2c_dev *dev);
 int i2c_dw_amdpsp_probe_lock_support(struct dw_i2c_dev *dev);
 #endif
 
-int i2c_dw_validate_speed(struct dw_i2c_dev *dev);
-void i2c_dw_adjust_bus_speed(struct dw_i2c_dev *dev);
-
-#if IS_ENABLED(CONFIG_ACPI)
-void i2c_dw_acpi_configure(struct device *device);
-#else
-static inline void i2c_dw_acpi_configure(struct device *device) { }
-#endif
+int i2c_dw_fw_parse_and_configure(struct dw_i2c_dev *dev);
diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
index 7f04dc33e6f7..1d1b0c3cc079 100644
--- a/drivers/i2c/busses/i2c-designware-pcidrv.c
+++ b/drivers/i2c/busses/i2c-designware-pcidrv.c
@@ -253,7 +253,6 @@ static int i2c_dw_pci_probe(struct pci_dev *pdev,
 	int r;
 	struct dw_pci_controller *controller;
 	struct dw_scl_sda_cfg *cfg;
-	struct i2c_timings *t;
 
 	if (id->driver_data >= ARRAY_SIZE(dw_pci_controllers))
 		return dev_err_probe(&pdev->dev, -EINVAL,
@@ -288,9 +287,6 @@ static int i2c_dw_pci_probe(struct pci_dev *pdev,
 	dev->irq = pci_irq_vector(pdev, 0);
 	dev->flags |= controller->flags;
 
-	t = &dev->timings;
-	i2c_parse_fw_timings(&pdev->dev, t, false);
-
 	pci_set_drvdata(pdev, dev);
 
 	if (controller->setup) {
@@ -299,12 +295,7 @@ static int i2c_dw_pci_probe(struct pci_dev *pdev,
 			return r;
 	}
 
-	i2c_dw_adjust_bus_speed(dev);
-
-	if (has_acpi_companion(&pdev->dev))
-		i2c_dw_acpi_configure(&pdev->dev);
-
-	r = i2c_dw_validate_speed(dev);
+	r = i2c_dw_fw_parse_and_configure(dev);
 	if (r)
 		return r;
 
diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index b8606b651feb..b275a1b19eec 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -21,7 +21,6 @@
 #include <linux/kernel.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm.h>
 #include <linux/pm_runtime.h>
@@ -97,43 +96,11 @@ static int bt1_i2c_request_regs(struct dw_i2c_dev *dev)
 	dev->map = devm_regmap_init(dev->dev, NULL, dev, &bt1_i2c_cfg);
 	return PTR_ERR_OR_ZERO(dev->map);
 }
-
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
-static void i2c_dw_of_configure(struct device *device)
-{
-	struct platform_device *pdev = to_platform_device(device);
-	struct dw_i2c_dev *dev = dev_get_drvdata(device);
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
-}
 #else
 static int bt1_i2c_request_regs(struct dw_i2c_dev *dev)
 {
 	return -ENODEV;
 }
-
-static inline void i2c_dw_of_configure(struct device *device)
-{
-}
 #endif
 
 static int txgbe_i2c_request_regs(struct dw_i2c_dev *dev)
@@ -274,7 +241,6 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 {
 	struct i2c_adapter *adap;
 	struct dw_i2c_dev *dev;
-	struct i2c_timings *t;
 	int irq, ret;
 
 	irq = platform_get_irq(pdev, 0);
@@ -301,18 +267,7 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	t = &dev->timings;
-	i2c_parse_fw_timings(&pdev->dev, t, false);
-
-	i2c_dw_adjust_bus_speed(dev);
-
-	if (pdev->dev.of_node)
-		i2c_dw_of_configure(&pdev->dev);
-
-	if (has_acpi_companion(&pdev->dev))
-		i2c_dw_acpi_configure(&pdev->dev);
-
-	ret = i2c_dw_validate_speed(dev);
+	ret = i2c_dw_fw_parse_and_configure(dev);
 	if (ret)
 		return ret;
 
@@ -336,6 +291,7 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 		return ret;
 
 	if (dev->clk) {
+		struct i2c_timings *t = &dev->timings;
 		u64 clk_khz;
 
 		dev->get_clk_rate_khz = i2c_dw_get_clk_rate_khz;
-- 
2.43.0.rc1.1.gbec44491f096


