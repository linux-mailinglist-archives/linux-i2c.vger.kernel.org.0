Return-Path: <linux-i2c+bounces-20-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F707E815E
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Nov 2023 19:27:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 73584281056
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Nov 2023 18:27:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59D303A269;
	Fri, 10 Nov 2023 18:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SKyRDH++"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7FD03A287
	for <linux-i2c@vger.kernel.org>; Fri, 10 Nov 2023 18:27:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 221824C3E;
	Fri, 10 Nov 2023 10:27:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699640826; x=1731176826;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FDUwAH8xOLBxnLuBaj9E/OeMnat6GwenshE3bhi4w4o=;
  b=SKyRDH++rgqyPnTkSLufddY9m/7env76007vWSiPtRpL+MUI6OtgDO/v
   dowzZWLVAjYAias1uCwZZPBDbIDr+3YfTRlRP1+IRqBgxIy0oPzptPqr9
   6g9rs4UP81RDFN3hBMgzNYYGOd/KTZpyAkjqM7IhaarESv6SJ7C1VOOgB
   s2Pv/+1c6wH5TDoX1zfWb00twIWLqPe1e3TkK+L+U9D+VfMLfQqoxCbki
   UxjMRKyrxKw3GYPutLKZmZFpNPlLihgyjw6bmYFGkYvk+7BL2bFx9YD5r
   ZMZ71SlWBAtTQ0Lmp9/HwDb3wLmSOtFCot5lD1wxt2K3TSD7wAYKGMXfO
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="375251983"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="375251983"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 10:23:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="798663771"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="798663771"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 10 Nov 2023 10:23:24 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 34FE98D6; Fri, 10 Nov 2023 20:23:08 +0200 (EET)
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
Subject: [PATCH v3 19/25] i2c: designware: Consolidate PM ops
Date: Fri, 10 Nov 2023 20:11:39 +0200
Message-ID: <20231110182304.3894319-20-andriy.shevchenko@linux.intel.com>
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

We have the same (*) PM ops in the PCI and plaform drivers.
Instead, consolidate that PM ops under exported variable and
deduplicate them.

*)
With the subtle ACPI and P-Unit behaviour differences in PCI case.
But this is not a problem as for ACPI we need to take care of the
P-Unit semaphore anyway and calling PM ops for ACPI makes sense as
it might provide specific operation regions in (however there are
no known devices on market that are using it with PCI enabled I2C).
Note, the clocks are not in use in the PCI case.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-common.c  | 62 ++++++++++++++++++++
 drivers/i2c/busses/i2c-designware-core.h    |  5 +-
 drivers/i2c/busses/i2c-designware-pcidrv.c  | 44 +-------------
 drivers/i2c/busses/i2c-designware-platdrv.c | 64 +--------------------
 4 files changed, 69 insertions(+), 106 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
index 50cf4cbfeff3..b7e653e939bd 100644
--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -21,6 +21,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/pm.h>
 #include <linux/pm_runtime.h>
 #include <linux/property.h>
 #include <linux/regmap.h>
@@ -712,5 +713,66 @@ void i2c_dw_disable(struct dw_i2c_dev *dev)
 	i2c_dw_release_lock(dev);
 }
 
+static int i2c_dw_prepare(struct device *device)
+{
+	/*
+	 * If the ACPI companion device object is present for this device,
+	 * it may be accessed during suspend and resume of other devices via
+	 * I2C operation regions, so tell the PM core and middle layers to
+	 * avoid skipping system suspend/resume callbacks for it in that case.
+	 */
+	return !has_acpi_companion(device);
+}
+
+static int i2c_dw_runtime_suspend(struct device *device)
+{
+	struct dw_i2c_dev *dev = dev_get_drvdata(device);
+
+	if (dev->shared_with_punit)
+		return 0;
+
+	i2c_dw_disable(dev);
+	i2c_dw_prepare_clk(dev, false);
+
+	return 0;
+}
+
+static int i2c_dw_suspend(struct device *device)
+{
+	struct dw_i2c_dev *dev = dev_get_drvdata(device);
+
+	i2c_mark_adapter_suspended(&dev->adapter);
+
+	return i2c_dw_runtime_suspend(device);
+}
+
+static int i2c_dw_runtime_resume(struct device *device)
+{
+	struct dw_i2c_dev *dev = dev_get_drvdata(device);
+
+	if (!dev->shared_with_punit)
+		i2c_dw_prepare_clk(dev, true);
+
+	dev->init(dev);
+
+	return 0;
+}
+
+static int i2c_dw_resume(struct device *device)
+{
+	struct dw_i2c_dev *dev = dev_get_drvdata(device);
+
+	i2c_dw_runtime_resume(device);
+	i2c_mark_adapter_resumed(&dev->adapter);
+
+	return 0;
+}
+
+EXPORT_GPL_DEV_PM_OPS(i2c_dw_dev_pm_ops) = {
+	.prepare = pm_sleep_ptr(i2c_dw_prepare),
+	LATE_SYSTEM_SLEEP_PM_OPS(i2c_dw_suspend, i2c_dw_resume)
+	RUNTIME_PM_OPS(i2c_dw_runtime_suspend, i2c_dw_runtime_resume, NULL)
+};
+
 MODULE_DESCRIPTION("Synopsys DesignWare I2C bus adapter core");
 MODULE_LICENSE("GPL");
diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index 52667d670363..f6ebf86dcc6f 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -15,6 +15,7 @@
 #include <linux/dev_printk.h>
 #include <linux/errno.h>
 #include <linux/i2c.h>
+#include <linux/pm.h>
 #include <linux/regmap.h>
 #include <linux/types.h>
 
@@ -337,7 +338,8 @@ int i2c_dw_wait_bus_not_busy(struct dw_i2c_dev *dev);
 int i2c_dw_handle_tx_abort(struct dw_i2c_dev *dev);
 int i2c_dw_set_fifo_size(struct dw_i2c_dev *dev);
 u32 i2c_dw_func(struct i2c_adapter *adap);
-void i2c_dw_disable(struct dw_i2c_dev *dev);
+
+extern const struct dev_pm_ops i2c_dw_dev_pm_ops;
 
 static inline void __i2c_dw_enable(struct dw_i2c_dev *dev)
 {
@@ -352,6 +354,7 @@ static inline void __i2c_dw_disable_nowait(struct dw_i2c_dev *dev)
 }
 
 void __i2c_dw_disable(struct dw_i2c_dev *dev);
+void i2c_dw_disable(struct dw_i2c_dev *dev);
 
 extern void i2c_dw_configure_master(struct dw_i2c_dev *dev);
 extern int i2c_dw_probe_master(struct dw_i2c_dev *dev);
diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
index 6fd4a3d8764a..c9eb01a16048 100644
--- a/drivers/i2c/busses/i2c-designware-pcidrv.c
+++ b/drivers/i2c/busses/i2c-designware-pcidrv.c
@@ -19,6 +19,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/pci.h>
+#include <linux/pm.h>
 #include <linux/pm_runtime.h>
 #include <linux/power_supply.h>
 #include <linux/sched.h>
@@ -194,47 +195,6 @@ static struct dw_pci_controller dw_pci_controllers[] = {
 	},
 };
 
-static int __maybe_unused i2c_dw_pci_runtime_suspend(struct device *dev)
-{
-	struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
-
-	i2c_dw_disable(i_dev);
-	return 0;
-}
-
-static int __maybe_unused i2c_dw_pci_suspend(struct device *dev)
-{
-	struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
-
-	i2c_mark_adapter_suspended(&i_dev->adapter);
-
-	return i2c_dw_pci_runtime_suspend(dev);
-}
-
-static int __maybe_unused i2c_dw_pci_runtime_resume(struct device *dev)
-{
-	struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
-
-	return i_dev->init(i_dev);
-}
-
-static int __maybe_unused i2c_dw_pci_resume(struct device *dev)
-{
-	struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
-	int ret;
-
-	ret = i2c_dw_pci_runtime_resume(dev);
-
-	i2c_mark_adapter_resumed(&i_dev->adapter);
-
-	return ret;
-}
-
-static const struct dev_pm_ops i2c_dw_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(i2c_dw_pci_suspend, i2c_dw_pci_resume)
-	SET_RUNTIME_PM_OPS(i2c_dw_pci_runtime_suspend, i2c_dw_pci_runtime_resume, NULL)
-};
-
 static const struct property_entry dgpu_properties[] = {
 	/* USB-C doesn't power the system */
 	PROPERTY_ENTRY_U8("scope", POWER_SUPPLY_SCOPE_DEVICE),
@@ -402,7 +362,7 @@ static struct pci_driver dw_i2c_driver = {
 	.probe		= i2c_dw_pci_probe,
 	.remove		= i2c_dw_pci_remove,
 	.driver         = {
-		.pm     = &i2c_dw_pm_ops,
+		.pm	= pm_ptr(&i2c_dw_dev_pm_ops),
 	},
 	.id_table	= i2c_designware_pci_ids,
 };
diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 9b249d27841d..d9a64006a3d6 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -29,7 +29,6 @@
 #include <linux/reset.h>
 #include <linux/sched.h>
 #include <linux/slab.h>
-#include <linux/suspend.h>
 #include <linux/units.h>
 
 #include "i2c-designware-core.h"
@@ -349,67 +348,6 @@ static void dw_i2c_plat_remove(struct platform_device *pdev)
 	pm_runtime_put_sync(&pdev->dev);
 }
 
-static int dw_i2c_plat_prepare(struct device *dev)
-{
-	/*
-	 * If the ACPI companion device object is present for this device, it
-	 * may be accessed during suspend and resume of other devices via I2C
-	 * operation regions, so tell the PM core and middle layers to avoid
-	 * skipping system suspend/resume callbacks for it in that case.
-	 */
-	return !has_acpi_companion(dev);
-}
-
-static int dw_i2c_plat_runtime_suspend(struct device *dev)
-{
-	struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
-
-	if (i_dev->shared_with_punit)
-		return 0;
-
-	i2c_dw_disable(i_dev);
-	i2c_dw_prepare_clk(i_dev, false);
-
-	return 0;
-}
-
-static int dw_i2c_plat_suspend(struct device *dev)
-{
-	struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
-
-	i2c_mark_adapter_suspended(&i_dev->adapter);
-
-	return dw_i2c_plat_runtime_suspend(dev);
-}
-
-static int dw_i2c_plat_runtime_resume(struct device *dev)
-{
-	struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
-
-	if (!i_dev->shared_with_punit)
-		i2c_dw_prepare_clk(i_dev, true);
-
-	i_dev->init(i_dev);
-
-	return 0;
-}
-
-static int dw_i2c_plat_resume(struct device *dev)
-{
-	struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
-
-	dw_i2c_plat_runtime_resume(dev);
-	i2c_mark_adapter_resumed(&i_dev->adapter);
-
-	return 0;
-}
-
-static const struct dev_pm_ops dw_i2c_dev_pm_ops = {
-	.prepare = pm_sleep_ptr(dw_i2c_plat_prepare),
-	LATE_SYSTEM_SLEEP_PM_OPS(dw_i2c_plat_suspend, dw_i2c_plat_resume)
-	RUNTIME_PM_OPS(dw_i2c_plat_runtime_suspend, dw_i2c_plat_runtime_resume, NULL)
-};
-
 static const struct of_device_id dw_i2c_of_match[] = {
 	{ .compatible = "snps,designware-i2c", },
 	{ .compatible = "mscc,ocelot-i2c", .data = (void *)MODEL_MSCC_OCELOT },
@@ -451,7 +389,7 @@ static struct platform_driver dw_i2c_driver = {
 		.name	= "i2c_designware",
 		.of_match_table = dw_i2c_of_match,
 		.acpi_match_table = dw_i2c_acpi_match,
-		.pm	= pm_ptr(&dw_i2c_dev_pm_ops),
+		.pm	= pm_ptr(&i2c_dw_dev_pm_ops),
 	},
 	.id_table = dw_i2c_platform_ids,
 };
-- 
2.43.0.rc1.1.gbec44491f096


