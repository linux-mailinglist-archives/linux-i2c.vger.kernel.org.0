Return-Path: <linux-i2c+bounces-5767-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D827495D373
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2024 18:31:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 08EEA1C21A2E
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2024 16:31:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 843BE18A94E;
	Fri, 23 Aug 2024 16:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c/3jv6KZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF3F18858B;
	Fri, 23 Aug 2024 16:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724430678; cv=none; b=sWARN/GOZcA6snbt0Q/8eOqUn9YwlfObr4A/OCcI2BiheEAhkOTk+5JMJp4c9ypf1Z/ISoOzr5Tn/Bk9g+2cCZRKrAPD8i+o9EFNljNqejYV9E2KYvx3AMD9PlXAuGr3PkmXRDrgjlF8LjgTPx566PebAe1kCpKkwGvEO6PudXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724430678; c=relaxed/simple;
	bh=TtHDT83tvcfqaZqVoGV/9QPUuQm+l0VHLBt7eXQfi6s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mo9fkbqVz3aDTkSRnyV9J9ouHiBCnRtf5aeJCYapyOnGZdAISbuFzvWaXRd5QkLH8/NRrfBqliol0C4oivEIkX5JhvlwUl+jXVRxSF3WTCiNXdkWa7D2KDWuTemdJDQnW4byOEP1fTkS88+9AK7izJj6jPRMWVIu05OaY/FpPuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c/3jv6KZ; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724430676; x=1755966676;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=TtHDT83tvcfqaZqVoGV/9QPUuQm+l0VHLBt7eXQfi6s=;
  b=c/3jv6KZZV+/32VvCHqwsNtv+mSfJJ3XCK1fqJiU0OxnP65AHYW/+W1x
   Vmv13tT8hhsvaRA0tCAyOpJ/pKD9WNEYimb2o1PYnuCdLjhXZt/Q2GZLH
   iXIUmEobDOtPsk8KA1GzFcns0jQQl5TjxXO0OY8hDAIIoXU99pZ6pduTv
   GnQnCAISqUGPZaKpR3fYb9cxhSoa5BrSxGygn0qO+Ie/4jvdAzxUKx7M9
   nAyD3hqZycdLLxuuiV6Ko1wgjyvxrReMfnJbNRJ5C51Pw62yqcMR0hPuk
   ZUWccTYVaUv+UD9RHcqpuQv2DI8ouJ2byE49Pay7R3v4QF7bprTxXwVKk
   A==;
X-CSE-ConnectionGUID: lXiQMoSrQsCVML9DVxDYOg==
X-CSE-MsgGUID: ptJewJCvS3yNkUXGzS0pMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="23075898"
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="23075898"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 09:31:15 -0700
X-CSE-ConnectionGUID: ve+/pSCTRUOb1PWVRrfWLg==
X-CSE-MsgGUID: nYMDMltQSF2sMjr2dOam8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="62005799"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa010.fm.intel.com with ESMTP; 23 Aug 2024 09:31:12 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id AB479209; Fri, 23 Aug 2024 19:31:00 +0300 (EEST)
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
Subject: [PATCH v1 1/1] i2c: designware: Consolidate PM ops
Date: Fri, 23 Aug 2024 19:28:16 +0300
Message-ID: <20240823163057.1175381-1-andriy.shevchenko@linux.intel.com>
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

 drivers/i2c/busses/i2c-designware-common.c  | 62 +++++++++++++++++++++
 drivers/i2c/busses/i2c-designware-core.h    |  3 +
 drivers/i2c/busses/i2c-designware-pcidrv.c  | 44 +--------------
 drivers/i2c/busses/i2c-designware-platdrv.c | 62 ---------------------
 4 files changed, 67 insertions(+), 104 deletions(-)

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
index e49c68c6e142..ec2ac5d6f74c 100644
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
-- 
2.43.0.rc1.1336.g36b5255a03ac


