Return-Path: <linux-i2c+bounces-5833-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C962960FB6
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Aug 2024 17:01:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1EC861F21B86
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Aug 2024 15:01:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37ADB1C3F0D;
	Tue, 27 Aug 2024 15:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z/qgeNty"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB4B812B93;
	Tue, 27 Aug 2024 15:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724770873; cv=none; b=IsJLclVOb9LGB2caLWEvV0dQBykspA80R/pbGK+ngsxr6FIQUc7t83xufLAPhHrOy9TdvB3L1RbF5BvpdDqA2Lzd1HZ3UrgV/XiQxQ5fkHH/F+w+0+dkTnf3d21cvdpna8UvvdRAs2zmh0OBOyxymkPYX11V3RL8CVt3+vzLV5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724770873; c=relaxed/simple;
	bh=oydJDLi3JAWzvNrCQaY/CiPUb7N8FEP0UTTcLH+5X/E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G0SeMZpR/xF9nHkKStI3ZMShCvDiUDOTGvy+WqEF9tWjC6XJQ1yQ2Xw2818EbdlR6kkPITAf0pCFwPM4H0CmmqK9PGAjusrZTM7cwLUYmesuYBeNF7KNZj3xIOiXqXuLM0WwLvCvyjcjwm8R2W0Os4uuxtFCHo1bPajzkHTqdBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z/qgeNty; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724770871; x=1756306871;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=oydJDLi3JAWzvNrCQaY/CiPUb7N8FEP0UTTcLH+5X/E=;
  b=Z/qgeNty/2yHP5Dg3vW0lyjYn1ZZ5uO5z5gY74NxxVSpNwcgB7fFs/rI
   nrgqbpUG2/0BHqXycIUoBbETvsEB5wIrOPRJDGppIxV05PbWifvgfiHEf
   LpDLzYnLELzmtQ+nlPgru++ZVfiE8fWBkn77AOnUbsUlasfDP4ZGKTIqB
   t9YAhwix216Xcdlrx4cgXg72g6mMLfosYKpYq6SA1y69M0R5IkcQy99+6
   slsk7MYxywhcwkHcDvt+95xpY5SnbajbIwBD1z3IC3I/38Mc6eUYLDbWn
   7a8gNMIQMycwECcNt+i8zTcp6KlDs8Bln3u1vlBsS9N/iulUf9mheOpN0
   A==;
X-CSE-ConnectionGUID: iEZv+jutQhWJAnVur4DPFw==
X-CSE-MsgGUID: Jcq5ogtrTa+69DljwT7MPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="22781192"
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; 
   d="scan'208";a="22781192"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 08:01:09 -0700
X-CSE-ConnectionGUID: ClnZENtjRBecdSNZ8k4oBQ==
X-CSE-MsgGUID: gZl5jFDwT4ac3ckBmNOboQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; 
   d="scan'208";a="67751024"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa005.jf.intel.com with ESMTP; 27 Aug 2024 08:01:07 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 2666B142; Tue, 27 Aug 2024 18:01:05 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Narasimhan.V@amd.com,
	Borislav Petkov <bp@alien8.de>,
	Kim Phillips <kim.phillips@amd.com>
Subject: [PATCH v2 1/1] i2c: designware: Consolidate PM ops
Date: Tue, 27 Aug 2024 18:00:37 +0300
Message-ID: <20240827150101.2171107-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
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
P-Unit semaphore anyway and calling PM ops for PCI makes sense as
it might provide specific operation regions in ACPI (however there
are no known devices on market that are using it with PCI enabled I2C).
Note, the clocks are not in use in the PCI case.

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---

This is just a split of a single patch from bigger series [1].                                                   
It was made in no functionality change manner, except the PCI case                                               
described above. But since it touches PM and it was an area where                                                
regressions were observed I would like to have a formal Tested-by                                                
from AMD people to make sure we don't break their setup /                                                        
configurations.                                                                                                  
                                                                                                                 
Link: https://lore.kernel.org/linux-i2c/20231207141653.2785124-1-andriy.shevchenko@linux.intel.com/ [1]          

v2: fixed rebase issue (LKP)

 drivers/i2c/busses/i2c-designware-common.c  | 62 ++++++++++++++++++++
 drivers/i2c/busses/i2c-designware-core.h    |  3 +
 drivers/i2c/busses/i2c-designware-pcidrv.c  | 44 +-------------
 drivers/i2c/busses/i2c-designware-platdrv.c | 64 +--------------------
 4 files changed, 68 insertions(+), 105 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
index b60c55587e48..fb65fe6d8122 100644
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
@@ -736,5 +737,66 @@ void i2c_dw_disable(struct dw_i2c_dev *dev)
 }
 EXPORT_SYMBOL_GPL(i2c_dw_disable);
 
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
index 723d599cca93..c6bd6f65a2d3 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -15,6 +15,7 @@
 #include <linux/dev_printk.h>
 #include <linux/errno.h>
 #include <linux/i2c.h>
+#include <linux/pm.h>
 #include <linux/regmap.h>
 #include <linux/types.h>
 
@@ -341,6 +342,8 @@ int i2c_dw_handle_tx_abort(struct dw_i2c_dev *dev);
 int i2c_dw_set_fifo_size(struct dw_i2c_dev *dev);
 u32 i2c_dw_func(struct i2c_adapter *adap);
 
+extern const struct dev_pm_ops i2c_dw_dev_pm_ops;
+
 static inline void __i2c_dw_enable(struct dw_i2c_dev *dev)
 {
 	dev->status |= STATUS_ACTIVE;
diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
index dd188ccd961e..04377533f3ae 100644
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
index e49c68c6e142..285ba4c1803f 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -29,7 +29,6 @@
 #include <linux/reset.h>
 #include <linux/sched.h>
 #include <linux/slab.h>
-#include <linux/suspend.h>
 #include <linux/units.h>
 
 #include "i2c-designware-core.h"
@@ -339,67 +338,6 @@ static void dw_i2c_plat_remove(struct platform_device *pdev)
 	reset_control_assert(dev->rst);
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
@@ -442,7 +380,7 @@ static struct platform_driver dw_i2c_driver = {
 		.name	= "i2c_designware",
 		.of_match_table = dw_i2c_of_match,
 		.acpi_match_table = dw_i2c_acpi_match,
-		.pm	= pm_ptr(&dw_i2c_dev_pm_ops),
+		.pm	= pm_ptr(&i2c_dw_dev_pm_ops),
 	},
 	.id_table = dw_i2c_platform_ids,
 };
-- 
2.43.0.rc1.1336.g36b5255a03ac


