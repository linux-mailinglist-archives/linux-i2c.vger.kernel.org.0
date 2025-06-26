Return-Path: <linux-i2c+bounces-11609-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F911AE9F7F
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Jun 2025 15:57:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 27FDB1C23DDF
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Jun 2025 13:57:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E4962E762A;
	Thu, 26 Jun 2025 13:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rx4Q/pLr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD6C2E8882;
	Thu, 26 Jun 2025 13:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750946186; cv=none; b=W8tena1TTfLp9TBmCj2V/4Nvvd+8WqK6LNAnR+e3laz8Ad554pcRyH7q4xKT2Lz3g3Di9R9WMSMX7Q73gE88Nkgl7gyijp1503fXjcbt4wzoqPWpfbf/iA/DoRGY1tAms5WdqMatEd5bVgGuoikK/vyjc/9FADJmzgVZ4NjXhA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750946186; c=relaxed/simple;
	bh=x4ltEshZqHNbrSP51wTw/NpNO58E2vOa1Qr/e5I0DYU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O3CMqnqfs9OkC4bVas6KXko83cbT8F0lQZ/8geJkSpGfzZByI1kjuVMiE8cmE+X406jitfDvOFFzkr115qln1u/34//F1EBcUHfC2zh2cp8CstXBv9RmBejGAtYEGqzAOT4qOz6HgIyw6c4EoBhk/mnVtpzfBeOPDTIOvDbme2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rx4Q/pLr; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750946184; x=1782482184;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=x4ltEshZqHNbrSP51wTw/NpNO58E2vOa1Qr/e5I0DYU=;
  b=Rx4Q/pLr+brE/BxukhViWAOhrBBfcuXqsj2GV02ySZbtPTuDj4tKsXO8
   kqB8pXA8O0LDGJB9W991KzBIgfzyd2dNbPGBB+95zfgqH++oxjRQVLThi
   bu9lcHgT2pZ0Csql2fEZ7UDdCflh3D/by5DX4WJGWVPQomcwudKm3uPYF
   fvGXMEXmv4eku+joF2wewAUfEEq3D90k7gmTQInGRZSMIJxPfTjibsZv6
   slMJtb8s9e0WJmvkGa7mtNX5oPqZdOdoLLLoY68ifo80RvQpDNwQ97hT0
   3bHkXRe/fN2y5hr8y581vvIguFYA2RSxFyaw6AXYOgtMUYdJLQlZTVk7e
   Q==;
X-CSE-ConnectionGUID: /WxQbx9cQyWvp9c+RdsQAg==
X-CSE-MsgGUID: TqRjDLiHROS3FEnmz8pIZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="53316398"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="53316398"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:56:24 -0700
X-CSE-ConnectionGUID: I6WrD2HbTFuos68MR9loSQ==
X-CSE-MsgGUID: rPa/dbIyQOOuDWVcE2AkZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="152146960"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmviesa007.fm.intel.com with ESMTP; 26 Jun 2025 06:56:20 -0700
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
	=?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Raag Jadav <raag.jadav@intel.com>,
	"Tauro, Riana" <riana.tauro@intel.com>,
	"Adatrao, Srinivasa" <srinivasa.adatrao@intel.com>,
	"Michael J. Ruhl" <michael.j.ruhl@intel.com>,
	intel-xe@lists.freedesktop.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/4] drm/xe: Support for I2C attached MCUs
Date: Thu, 26 Jun 2025 16:56:07 +0300
Message-ID: <20250626135610.299943-3-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250626135610.299943-1-heikki.krogerus@linux.intel.com>
References: <20250626135610.299943-1-heikki.krogerus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adding adaption/glue layer where the I2C host adapter
(Synopsys DesignWare I2C adapter) and the I2C clients (the
microcontroller units) are enumerated.

The microcontroller units (MCU) that are attached to the GPU
depend on the OEM. The initially supported MCU will be the
Add-In Management Controller (AMC).

Originally-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/gpu/drm/xe/Kconfig            |   1 +
 drivers/gpu/drm/xe/Makefile           |   1 +
 drivers/gpu/drm/xe/regs/xe_i2c_regs.h |  15 ++
 drivers/gpu/drm/xe/regs/xe_irq_regs.h |   1 +
 drivers/gpu/drm/xe/regs/xe_pmt.h      |   2 +-
 drivers/gpu/drm/xe/regs/xe_regs.h     |   2 +
 drivers/gpu/drm/xe/xe_device.c        |   5 +
 drivers/gpu/drm/xe/xe_device_types.h  |   4 +
 drivers/gpu/drm/xe/xe_i2c.c           | 297 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_i2c.h           |  58 +++++
 drivers/gpu/drm/xe/xe_irq.c           |   2 +
 11 files changed, 387 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_i2c_regs.h
 create mode 100644 drivers/gpu/drm/xe/xe_i2c.c
 create mode 100644 drivers/gpu/drm/xe/xe_i2c.h

diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index 30ed74ad29ab..257bbb69d6ca 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -44,6 +44,7 @@ config DRM_XE
 	select WANT_DEV_COREDUMP
 	select AUXILIARY_BUS
 	select HMM_MIRROR
+	select REGMAP if I2C
 	help
 	  Driver for Intel Xe2 series GPUs and later. Experimental support
 	  for Xe series is also available.
diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index eee6bac01a00..4b8a8fcd3959 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -125,6 +125,7 @@ xe-y += xe_bb.o \
 	xe_wait_user_fence.o \
 	xe_wopcm.o
 
+xe-$(CONFIG_I2C)	+= xe_i2c.o
 xe-$(CONFIG_HMM_MIRROR) += xe_hmm.o
 xe-$(CONFIG_DRM_XE_GPUSVM) += xe_svm.o
 
diff --git a/drivers/gpu/drm/xe/regs/xe_i2c_regs.h b/drivers/gpu/drm/xe/regs/xe_i2c_regs.h
new file mode 100644
index 000000000000..92dae4487614
--- /dev/null
+++ b/drivers/gpu/drm/xe/regs/xe_i2c_regs.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: MIT */
+#ifndef _XE_I2C_REGS_H_
+#define _XE_I2C_REGS_H_
+
+#include "xe_reg_defs.h"
+#include "xe_regs.h"
+
+#define I2C_BRIDGE_OFFSET		(SOC_BASE + 0xd9000)
+#define I2C_CONFIG_SPACE_OFFSET		(SOC_BASE + 0xf6000)
+#define I2C_MEM_SPACE_OFFSET		(SOC_BASE + 0xf7400)
+
+#define REG_SG_REMAP_ADDR_PREFIX	XE_REG(SOC_BASE + 0x0164)
+#define REG_SG_REMAP_ADDR_POSTFIX	XE_REG(SOC_BASE + 0x0168)
+
+#endif /* _XE_I2C_REGS_H_ */
diff --git a/drivers/gpu/drm/xe/regs/xe_irq_regs.h b/drivers/gpu/drm/xe/regs/xe_irq_regs.h
index f0ecfcac4003..13635e4331d4 100644
--- a/drivers/gpu/drm/xe/regs/xe_irq_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_irq_regs.h
@@ -19,6 +19,7 @@
 #define   MASTER_IRQ				REG_BIT(31)
 #define   GU_MISC_IRQ				REG_BIT(29)
 #define   DISPLAY_IRQ				REG_BIT(16)
+#define   I2C_IRQ				REG_BIT(12)
 #define   GT_DW_IRQ(x)				REG_BIT(x)
 
 /*
diff --git a/drivers/gpu/drm/xe/regs/xe_pmt.h b/drivers/gpu/drm/xe/regs/xe_pmt.h
index b0efd9b48d1e..2995d72c3f78 100644
--- a/drivers/gpu/drm/xe/regs/xe_pmt.h
+++ b/drivers/gpu/drm/xe/regs/xe_pmt.h
@@ -5,7 +5,7 @@
 #ifndef _XE_PMT_H_
 #define _XE_PMT_H_
 
-#define SOC_BASE			0x280000
+#include "xe_regs.h"
 
 #define BMG_PMT_BASE_OFFSET		0xDB000
 #define BMG_DISCOVERY_OFFSET		(SOC_BASE + BMG_PMT_BASE_OFFSET)
diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
index 3abb17d2ca33..1926b4044314 100644
--- a/drivers/gpu/drm/xe/regs/xe_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_regs.h
@@ -7,6 +7,8 @@
 
 #include "regs/xe_reg_defs.h"
 
+#define SOC_BASE				0x280000
+
 #define GU_CNTL_PROTECTED			XE_REG(0x10100C)
 #define   DRIVERINT_FLR_DIS			REG_BIT(31)
 
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index cd17c1354ab3..71356ee31e9d 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -43,6 +43,7 @@
 #include "xe_guc_pc.h"
 #include "xe_hw_engine_group.h"
 #include "xe_hwmon.h"
+#include "xe_i2c.h"
 #include "xe_irq.h"
 #include "xe_memirq.h"
 #include "xe_mmio.h"
@@ -925,6 +926,10 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		goto err_unregister_display;
 
+	err = xe_i2c_probe(xe);
+	if (err)
+		goto err_unregister_display;
+
 	for_each_gt(gt, xe, id)
 		xe_gt_sanitize_freq(gt);
 
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 6aca4b1a2824..dffff2d80f18 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -34,6 +34,7 @@ struct dram_info;
 struct intel_display;
 struct intel_dg_nvm_dev;
 struct xe_ggtt;
+struct xe_i2c;
 struct xe_pat_ops;
 struct xe_pxp;
 
@@ -583,6 +584,9 @@ struct xe_device {
 	/** @pmu: performance monitoring unit */
 	struct xe_pmu pmu;
 
+	/** @i2c: I2C host controller */
+	struct xe_i2c *i2c;
+
 	/** @atomic_svm_timeslice_ms: Atomic SVM fault timeslice MS */
 	u32 atomic_svm_timeslice_ms;
 
diff --git a/drivers/gpu/drm/xe/xe_i2c.c b/drivers/gpu/drm/xe/xe_i2c.c
new file mode 100644
index 000000000000..bfbfe1de7f77
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_i2c.c
@@ -0,0 +1,297 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+/*
+ * Intel Xe I2C attached Microcontroller Units (MCU)
+ *
+ * Copyright (C) 2025 Intel Corporation.
+ */
+
+#include <linux/array_size.h>
+#include <linux/container_of.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/ioport.h>
+#include <linux/irq.h>
+#include <linux/irqdomain.h>
+#include <linux/notifier.h>
+#include <linux/pci.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+#include <linux/sprintf.h>
+#include <linux/string.h>
+#include <linux/types.h>
+#include <linux/workqueue.h>
+
+#include "regs/xe_i2c_regs.h"
+#include "regs/xe_irq_regs.h"
+
+#include "xe_device.h"
+#include "xe_device_types.h"
+#include "xe_i2c.h"
+#include "xe_mmio.h"
+#include "xe_platform_types.h"
+
+/**
+ * DOC: Xe I2C devices
+ *
+ * Register platform device for the I2C host controller (Synpsys DesignWare I2C)
+ * if the registers of that controller are mapped to the MMIO, and also the I2C
+ * client device for the Add-In Management Controller (the MCU) attached to the
+ * host controller.
+ *
+ * See drivers/i2c/busses/i2c-designware-* for more information on the I2C host
+ * controller.
+ */
+
+static const char adapter_name[] = "i2c_designware";
+
+static const struct property_entry xe_i2c_adapter_properties[] = {
+	PROPERTY_ENTRY_STRING("compatible", "intel,xe-i2c"),
+	PROPERTY_ENTRY_U32("clock-frequency", I2C_MAX_FAST_MODE_PLUS_FREQ),
+	{ }
+};
+
+static inline void xe_i2c_read_endpoint(struct xe_mmio *mmio, void *ep)
+{
+	u32 *val = ep;
+
+	val[0] = xe_mmio_read32(mmio, REG_SG_REMAP_ADDR_PREFIX);
+	val[1] = xe_mmio_read32(mmio, REG_SG_REMAP_ADDR_POSTFIX);
+}
+
+static void xe_i2c_client_work(struct work_struct *work)
+{
+	struct xe_i2c *i2c = container_of(work, struct xe_i2c, work);
+	struct i2c_board_info info = {
+		.type	= "amc",
+		.flags	= I2C_CLIENT_HOST_NOTIFY,
+		.addr	= i2c->ep.addr[1],
+	};
+
+	i2c->client[0] = i2c_new_client_device(i2c->adapter, &info);
+}
+
+static int xe_i2c_notifier(struct notifier_block *nb, unsigned long action, void *data)
+{
+	struct xe_i2c *i2c = container_of(nb, struct xe_i2c, bus_notifier);
+	struct i2c_adapter *adapter = i2c_verify_adapter(data);
+	struct device *dev = data;
+
+	if (action == BUS_NOTIFY_ADD_DEVICE &&
+	    adapter && dev->parent == &i2c->pdev->dev) {
+		i2c->adapter = adapter;
+		schedule_work(&i2c->work);
+		return NOTIFY_OK;
+	}
+
+	return NOTIFY_DONE;
+}
+
+static int xe_i2c_register_adapter(struct xe_i2c *i2c)
+{
+	struct pci_dev *pci = to_pci_dev(i2c->drm_dev);
+	struct platform_device *pdev;
+	struct fwnode_handle *fwnode;
+	int ret;
+
+	fwnode = fwnode_create_software_node(xe_i2c_adapter_properties, NULL);
+	if (!fwnode)
+		return -ENOMEM;
+
+	/*
+	 * Not using platform_device_register_full() here because we don't have
+	 * a handle to the platform_device before it returns. xe_i2c_notifier()
+	 * uses that handle, but it may be called before
+	 * platform_device_register_full() is done.
+	 */
+	pdev = platform_device_alloc(adapter_name, pci_dev_id(pci));
+	if (!pdev) {
+		ret = -ENOMEM;
+		goto err_fwnode_remove;
+	}
+
+	if (i2c->adapter_irq) {
+		struct resource	res = { };
+
+		res.start = i2c->adapter_irq;
+		res.name = "xe_i2c";
+		res.flags = IORESOURCE_IRQ;
+
+		ret = platform_device_add_resources(pdev, &res, 1);
+		if (ret)
+			goto err_pdev_put;
+	}
+
+	pdev->dev.parent = i2c->drm_dev;
+	pdev->dev.fwnode = fwnode;
+	i2c->adapter_node = fwnode;
+	i2c->pdev = pdev;
+
+	ret = platform_device_add(pdev);
+	if (ret)
+		goto err_pdev_put;
+
+	return 0;
+
+err_pdev_put:
+	platform_device_put(pdev);
+err_fwnode_remove:
+	fwnode_remove_software_node(fwnode);
+
+	return ret;
+}
+
+static void xe_i2c_unregister_adapter(struct xe_i2c *i2c)
+{
+	platform_device_unregister(i2c->pdev);
+	fwnode_remove_software_node(i2c->adapter_node);
+}
+
+/**
+ * xe_i2c_irq_handler: Handler for I2C interrupts
+ * @xe: xe device instance
+ * @master_ctl: interrupt register
+ *
+ * Forward interrupts generated by the I2C host adapter to the I2C host adapter
+ * driver.
+ */
+void xe_i2c_irq_handler(struct xe_device *xe, u32 master_ctl)
+{
+	if (!xe->i2c || !xe->i2c->adapter_irq)
+		return;
+
+	if (master_ctl & I2C_IRQ)
+		generic_handle_irq_safe(xe->i2c->adapter_irq);
+}
+
+static int xe_i2c_irq_map(struct irq_domain *h, unsigned int virq,
+			  irq_hw_number_t hw_irq_num)
+{
+	irq_set_chip_and_handler(virq, &dummy_irq_chip, handle_simple_irq);
+	return 0;
+}
+
+static const struct irq_domain_ops xe_i2c_irq_ops = {
+	.map = xe_i2c_irq_map,
+};
+
+static int xe_i2c_create_irq(struct xe_i2c *i2c)
+{
+	struct irq_domain *domain;
+
+	if (!(i2c->ep.capabilities & XE_I2C_EP_CAP_IRQ))
+		return 0;
+
+	domain = irq_domain_create_linear(dev_fwnode(i2c->drm_dev), 1, &xe_i2c_irq_ops, NULL);
+	if (!domain)
+		return -ENOMEM;
+
+	i2c->adapter_irq = irq_create_mapping(domain, 0);
+	i2c->irqdomain = domain;
+
+	return 0;
+}
+
+static void xe_i2c_remove_irq(struct xe_i2c *i2c)
+{
+	if (i2c->irqdomain) {
+		irq_dispose_mapping(i2c->adapter_irq);
+		irq_domain_remove(i2c->irqdomain);
+	}
+}
+
+static int xe_i2c_read(void *context, unsigned int reg, unsigned int *val)
+{
+	struct xe_i2c *i2c = context;
+
+	*val = xe_mmio_read32(i2c->mmio, XE_REG(reg + I2C_MEM_SPACE_OFFSET));
+
+	return 0;
+}
+
+static int xe_i2c_write(void *context, unsigned int reg, unsigned int val)
+{
+	struct xe_i2c *i2c = context;
+
+	xe_mmio_write32(i2c->mmio, XE_REG(reg + I2C_MEM_SPACE_OFFSET), val);
+
+	return 0;
+}
+
+static const struct regmap_config i2c_regmap_config = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_read = xe_i2c_read,
+	.reg_write = xe_i2c_write,
+	.fast_io = true,
+};
+
+static void xe_i2c_remove(void *data)
+{
+	struct xe_i2c *i2c = data;
+	int i;
+
+	for (i = 0; i < XE_I2C_MAX_CLIENTS; i++)
+		i2c_unregister_device(i2c->client[i]);
+
+	bus_unregister_notifier(&i2c_bus_type, &i2c->bus_notifier);
+	xe_i2c_unregister_adapter(i2c);
+	xe_i2c_remove_irq(i2c);
+}
+
+/**
+ * xe_i2c_probe: Probe the I2C host adapter and the I2C clients attached to it
+ * @xe: xe device instance
+ *
+ * Register all the I2C devices described in the I2C Endpoint data structure.
+ *
+ * Return: 0 on success, error code on failure
+ */
+int xe_i2c_probe(struct xe_device *xe)
+{
+	struct xe_i2c_endpoint ep;
+	struct regmap *regmap;
+	struct xe_i2c *i2c;
+	int ret;
+
+	xe_i2c_read_endpoint(xe_root_tile_mmio(xe), &ep);
+	if (ep.cookie != XE_I2C_EP_COOKIE_DEVICE)
+		return 0;
+
+	i2c = devm_kzalloc(xe->drm.dev, sizeof(*i2c), GFP_KERNEL);
+	if (!i2c)
+		return -ENOMEM;
+
+	INIT_WORK(&i2c->work, xe_i2c_client_work);
+	i2c->mmio = xe_root_tile_mmio(xe);
+	i2c->drm_dev = xe->drm.dev;
+	i2c->ep = ep;
+
+	regmap = devm_regmap_init(i2c->drm_dev, NULL, i2c, &i2c_regmap_config);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	i2c->bus_notifier.notifier_call = xe_i2c_notifier;
+	ret = bus_register_notifier(&i2c_bus_type, &i2c->bus_notifier);
+	if (ret)
+		return ret;
+
+	ret = xe_i2c_create_irq(i2c);
+	if (ret)
+		goto err_unregister_notifier;
+
+	ret = xe_i2c_register_adapter(i2c);
+	if (ret)
+		goto err_remove_irq;
+
+	return devm_add_action_or_reset(i2c->drm_dev, xe_i2c_remove, i2c);
+
+err_remove_irq:
+	xe_i2c_remove_irq(i2c);
+
+err_unregister_notifier:
+	bus_unregister_notifier(&i2c_bus_type, &i2c->bus_notifier);
+
+	return ret;
+}
diff --git a/drivers/gpu/drm/xe/xe_i2c.h b/drivers/gpu/drm/xe/xe_i2c.h
new file mode 100644
index 000000000000..7ea40f4e4aa4
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_i2c.h
@@ -0,0 +1,58 @@
+/* SPDX-License-Identifier: MIT */
+#ifndef _XE_I2C_H_
+#define _XE_I2C_H_
+
+#include <linux/bits.h>
+#include <linux/notifier.h>
+#include <linux/types.h>
+#include <linux/workqueue.h>
+
+struct device;
+struct fwnode_handle;
+struct i2c_adapter;
+struct i2c_client;
+struct irq_domain;
+struct platform_device;
+struct xe_device;
+struct xe_mmio;
+
+#define XE_I2C_MAX_CLIENTS		3
+
+#define XE_I2C_EP_COOKIE_DEVICE		0xde
+
+/* Endpoint Capabilities */
+#define XE_I2C_EP_CAP_IRQ		BIT(0)
+
+struct xe_i2c_endpoint {
+	u8 cookie;
+	u8 capabilities;
+	u16 addr[XE_I2C_MAX_CLIENTS];
+};
+
+struct xe_i2c {
+	struct fwnode_handle *adapter_node;
+	struct platform_device *pdev;
+	struct i2c_adapter *adapter;
+	struct i2c_client *client[XE_I2C_MAX_CLIENTS];
+
+	struct notifier_block bus_notifier;
+	struct work_struct work;
+
+	struct irq_domain *irqdomain;
+	int adapter_irq;
+
+	struct xe_i2c_endpoint ep;
+	struct device *drm_dev;
+
+	struct xe_mmio *mmio;
+};
+
+#if IS_ENABLED(CONFIG_I2C)
+int xe_i2c_probe(struct xe_device *xe);
+void xe_i2c_irq_handler(struct xe_device *xe, u32 master_ctl);
+#else
+static inline int xe_i2c_probe(struct xe_device *xe) { return 0; }
+static inline void xe_i2c_irq_handler(struct xe_device *xe, u32 master_ctl) { }
+#endif
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 5362d3174b06..c43e62dc692e 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -18,6 +18,7 @@
 #include "xe_gt.h"
 #include "xe_guc.h"
 #include "xe_hw_engine.h"
+#include "xe_i2c.h"
 #include "xe_memirq.h"
 #include "xe_mmio.h"
 #include "xe_pxp.h"
@@ -476,6 +477,7 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
 			if (xe->info.has_heci_cscfi)
 				xe_heci_csc_irq_handler(xe, master_ctl);
 			xe_display_irq_handler(xe, master_ctl);
+			xe_i2c_irq_handler(xe, master_ctl);
 			gu_misc_iir = gu_misc_irq_ack(xe, master_ctl);
 		}
 	}
-- 
2.47.2


