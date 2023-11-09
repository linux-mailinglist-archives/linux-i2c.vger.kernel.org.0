Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C56497E7175
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Nov 2023 19:28:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345060AbjKIS2v (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Nov 2023 13:28:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345019AbjKIS2n (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Nov 2023 13:28:43 -0500
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2730C3C0C;
        Thu,  9 Nov 2023 10:28:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699554521; x=1731090521;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YYYRkxf0rpg1oR/toNL6iopQD8fmDjHNAbcYLrc1aE8=;
  b=RTxAEsi+u3255dQKGuHqhE6Ydfeegzp4JhAH1pkkEnWzVHgOJKXqFEku
   MvIv04GQn+8XQHMSQOwkUMOcamxPyl5+DlycKg7ZHp41hWXceiiY6Zudo
   95LEw95QWy26teU8r+wKlPeLg+nEwDNAzDc0XYUAYTnUh3aoyw66xC8sk
   touWQL0mlN3JUTcE/S3+Vpe76aZwfVbUjdTxg4WiUw6TfVvk2mTK9+rd5
   chNKLGI3NspYuX/U1c2zX6q2OBFvEqm1usnV/s+w8inui74ApCLSR960L
   eMPaYBWWJZP0zCg30LkznQZ4gHq8Siu5AOMGaB/Lek561JO+oxpTSXs5B
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="389853925"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; 
   d="scan'208";a="389853925"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 10:28:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="936938988"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; 
   d="scan'208";a="936938988"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 09 Nov 2023 10:28:37 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 9AF9B7E7; Thu,  9 Nov 2023 20:28:32 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v2 06/12] i2c: designware: Consolidate firmware parsing and configuring code
Date:   Thu,  9 Nov 2023 20:19:16 +0200
Message-ID: <20231109182823.3531846-7-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1996.gbec44491f096
In-Reply-To: <20231109182823.3531846-1-andriy.shevchenko@linux.intel.com>
References: <20231109182823.3531846-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

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
index f4dc08139624..a2731179a42b 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -393,11 +393,4 @@ int i2c_dw_baytrail_probe_lock_support(struct dw_i2c_dev *dev);
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
index bfafebecf680..2e6c7bfb5bf7 100644
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
@@ -301,12 +297,7 @@ static int i2c_dw_pci_probe(struct pci_dev *pdev,
 		}
 	}
 
-	i2c_dw_adjust_bus_speed(dev);
-
-	if (has_acpi_companion(&pdev->dev))
-		i2c_dw_acpi_configure(&pdev->dev);
-
-	r = i2c_dw_validate_speed(dev);
+	r = i2c_dw_fw_parse_and_configure(dev);
 	if (r) {
 		pci_free_irq_vectors(pdev);
 		return r;
diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index c55fff3df8ca..0b6d6f2b6198 100644
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
@@ -245,7 +212,6 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 {
 	struct i2c_adapter *adap;
 	struct dw_i2c_dev *dev;
-	struct i2c_timings *t;
 	int irq, ret;
 
 	irq = platform_get_irq(pdev, 0);
@@ -274,18 +240,7 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 
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
 
@@ -313,6 +268,7 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 		goto exit_reset;
 
 	if (dev->clk) {
+		struct i2c_timings *t = &dev->timings;
 		u64 clk_khz;
 
 		dev->get_clk_rate_khz = i2c_dw_get_clk_rate_khz;
-- 
2.40.0.1996.gbec44491f096

