Return-Path: <linux-i2c+bounces-5695-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AF36D95BDE2
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 20:04:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2FD5A1F2284E
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 18:04:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51A0A1CF29E;
	Thu, 22 Aug 2024 18:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OTKW1BDP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483EE17C220;
	Thu, 22 Aug 2024 18:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724349859; cv=none; b=XiCm7f77mFR64uAdrqjibxFKwcM1RP2Xii5Kpi4QdpTUHVKa/9u331wKsi9ci28vV7kdHP3BJkqtEF64acM0yMUaSDdnpDOG4muOda5ode+cDkX7S48UuUamwgnYgCc9V2CpVvOgAR6KrbTYu9X3sVgyj4AV/sVGqPwogacdGs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724349859; c=relaxed/simple;
	bh=OA4kb5LzL/1YA4zXW7b6x6znzrZuwLNBRax1lE+xTEg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=scYg571k/6I3bjCS2TAr9zUx0UHEXWrwboiaZXJrR7O5vERAFP3B4UW/4Dee6wU/fnUiwzGGZTBpcqDwGY+UvgJiQ6j8IkYYpl1l9+6jbiz9Tkr+TuJUw+wWedH6B6jCdIKiErsYCqgML7zs+yKSWHrY0nJXAOBP8gUzoaWbSJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OTKW1BDP; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724349857; x=1755885857;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OA4kb5LzL/1YA4zXW7b6x6znzrZuwLNBRax1lE+xTEg=;
  b=OTKW1BDPiudf6gaqYv2/UeyOl/aTTK42z21v50pbH+gTQnjWkSls1BWW
   7l27lOG5DrOrXG/wUQuKJYbIe3EVyGv9DvJ/3vILKBGJPwiGpDmbVLK1M
   4LEIj7681q24QZbrkoGspwbyyKjQ7se3vryrQcD2o7uE6Ofm4yTDxvy0z
   j3L7URTbxCb1xX5clOcdjIlhXwC3V/l/5MdOvloABKViv4+8hCo8TMGPA
   ePX7EPbYIyq5Wo1KQeI/u5SoFyRNjHfFsuazjqnrCK6U89EktpMtA3arc
   3rKGtD5g+Y5C2kOCZrZoMkskscU+DmyLp6zqTUMeEyFBnyyefb0+PiJjg
   w==;
X-CSE-ConnectionGUID: /eXaDUUmSWqQUgsWRr7sIg==
X-CSE-MsgGUID: +gJUPpKhQ+y5TdJUMwjXig==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="33409870"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="33409870"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 11:04:16 -0700
X-CSE-ConnectionGUID: roJ2Qa6MQCq1XBoIh1G/oQ==
X-CSE-MsgGUID: hmfffN3NQzKDcrpgXzV7fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="99049979"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa001.jf.intel.com with ESMTP; 22 Aug 2024 11:04:14 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 5DBC92B3; Thu, 22 Aug 2024 21:04:12 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Narasimhan.V@amd.com,
	Borislav Petkov <bp@alien8.de>,
	Kim Phillips <kim.phillips@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH v1 2/5] i2c: designware: Consolidate firmware parsing and configuring code
Date: Thu, 22 Aug 2024 20:58:38 +0300
Message-ID: <20240822180411.2298991-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20240822180411.2298991-1-andriy.shevchenko@linux.intel.com>
References: <20240822180411.2298991-1-andriy.shevchenko@linux.intel.com>
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
index f0d7cad92f1c..b0d3c47d93ce 100644
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
 
 static u32 i2c_dw_read_scl_reg(struct dw_i2c_dev *dev, u32 reg)
 {
diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index ebcf816b731c..b9f97f4eedf5 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -416,11 +416,4 @@ int i2c_dw_baytrail_probe_lock_support(struct dw_i2c_dev *dev);
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
index cbbcbcc265c9..14186230622d 100644
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
index 981a2d399c9f..7e2f26d0593e 100644
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
@@ -242,7 +209,6 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 {
 	struct i2c_adapter *adap;
 	struct dw_i2c_dev *dev;
-	struct i2c_timings *t;
 	int irq, ret;
 
 	irq = platform_get_irq(pdev, 0);
@@ -271,18 +237,7 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 
 	reset_control_deassert(dev->rst);
 
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
 		goto exit_reset;
 
@@ -310,6 +265,7 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 		goto exit_reset;
 
 	if (dev->clk) {
+		struct i2c_timings *t = &dev->timings;
 		u64 clk_khz;
 
 		dev->get_clk_rate_khz = i2c_dw_get_clk_rate_khz;
-- 
2.43.0.rc1.1336.g36b5255a03ac


