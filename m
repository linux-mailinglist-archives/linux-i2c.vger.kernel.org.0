Return-Path: <linux-i2c+bounces-11165-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A955AC915C
	for <lists+linux-i2c@lfdr.de>; Fri, 30 May 2025 16:18:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C70C16CD2E
	for <lists+linux-i2c@lfdr.de>; Fri, 30 May 2025 14:18:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70CB7230BC8;
	Fri, 30 May 2025 14:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="II10I/6j"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0984723027C;
	Fri, 30 May 2025 14:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748614682; cv=none; b=dffSPVLSKxutOdFY4KFQEdKAMl1lqFX4cT4NEA0ef7C3TAnPRxORsXZCSWVWJuZny7cG6fmP50gkSm9BsIbwK2Y/4zJE0O8mFXbagyAJX5eOkk9oo+StXmUmzYZOj0lLeEruh/r7+y1bMBpx5nOFfkQeZHUvAGmh8r+dEJ8UwAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748614682; c=relaxed/simple;
	bh=ifJgfKhFEYusQmtdaHEgfUc2pdegU7338dusDyTAJBM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DKh+LaW6l+utHEBfQ04BQ8p1DSlpi8QH6ZDbho+/2Y1m5iuU5iWoOFDVgOfBDy2jNjN4fhBLYaWVIwRvBmFX/LAHeFqJ0KE8dO5b2vizZGb7iiAi2d2ybBAAEphp7rDX9tUotKBo1KY++nJ8lO+W83UbpAUCiv6UoTPfG61uuDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=II10I/6j; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748614678; x=1780150678;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ifJgfKhFEYusQmtdaHEgfUc2pdegU7338dusDyTAJBM=;
  b=II10I/6jtA1wgqqBe+PSu/pbBoDWDuU4N74EY/ntSCaIdmM/Ynq5ELnS
   LUS4LbsaeJVRpeA1EmfADX6hsdcXWMuj5i4C9U8hp08RGeUryJojPPVAU
   BVUDSyCeWsCmNT8ELnoK7Jgfut5tp7sk10XbV4mOi21WvjELKs36aVClk
   yuUtJo6rx4BmIcr1imXMwQ9GIeS/k2h+YXD1WygNR7d3GHed28spAKASL
   tFBRdvkhOs0mq7+yjEILdXh/tz8HP2pWl5lhwgg+D7HRSZ7ivRm7Wjp9M
   6NAJ/+mz4K0yExq4x5AnY9TpoM2LwCasM/XgWa4GatH444qYwSTB8Ag9p
   A==;
X-CSE-ConnectionGUID: jgGIGqjKRG6rxbC6bntfEQ==
X-CSE-MsgGUID: 4kBOvxUWSKia66zUWgiffQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="53339282"
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="53339282"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 07:17:58 -0700
X-CSE-ConnectionGUID: FHAzE9bPSV6u7M+F6vWF3g==
X-CSE-MsgGUID: SzqK5IjQRvOvp2V8rTtQKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="144222565"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmviesa008.fm.intel.com with ESMTP; 30 May 2025 07:17:53 -0700
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
	=?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Raag Jadav <raag.jadav@intel.com>,
	"Tauro, Riana" <riana.tauro@intel.com>,
	"Adatrao, Srinivasa" <srinivasa.adatrao@intel.com>,
	intel-xe@lists.freedesktop.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Michael J. Ruhl" <michael.j.ruhl@intel.com>
Subject: [PATCH v1 2/2] drm/xe: Support for I2C attached MCUs
Date: Fri, 30 May 2025 17:17:44 +0300
Message-ID: <20250530141744.3605983-3-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250530141744.3605983-1-heikki.krogerus@linux.intel.com>
References: <20250530141744.3605983-1-heikki.krogerus@linux.intel.com>
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
 drivers/gpu/drm/xe/Makefile           |   1 +
 drivers/gpu/drm/xe/regs/xe_i2c_regs.h |  16 ++
 drivers/gpu/drm/xe/regs/xe_irq_regs.h |   1 +
 drivers/gpu/drm/xe/xe_device.c        |   3 +
 drivers/gpu/drm/xe/xe_device_types.h  |   4 +
 drivers/gpu/drm/xe/xe_i2c.c           | 270 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_i2c.h           |  60 ++++++
 drivers/gpu/drm/xe/xe_irq.c           |   2 +
 8 files changed, 357 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_i2c_regs.h
 create mode 100644 drivers/gpu/drm/xe/xe_i2c.c
 create mode 100644 drivers/gpu/drm/xe/xe_i2c.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index e4bf484d4121..3f581e2bb564 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -124,6 +124,7 @@ xe-y += xe_bb.o \
 	xe_wait_user_fence.o \
 	xe_wopcm.o
 
+xe-$(CONFIG_I2C)	+= xe_i2c.o
 xe-$(CONFIG_HMM_MIRROR) += xe_hmm.o
 xe-$(CONFIG_DRM_XE_GPUSVM) += xe_svm.o
 
diff --git a/drivers/gpu/drm/xe/regs/xe_i2c_regs.h b/drivers/gpu/drm/xe/regs/xe_i2c_regs.h
new file mode 100644
index 000000000000..2acb55eeef0d
--- /dev/null
+++ b/drivers/gpu/drm/xe/regs/xe_i2c_regs.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _XE_I2C_REGS_H_
+#define _XE_I2C_REGS_H_
+
+#include "xe_reg_defs.h"
+
+#define SOC_BASE			0x280000
+
+#define I2C_CONFIG_SPACE_OFFSET		(SOC_BASE + 0xf6000)
+#define I2C_MEM_SPACE_OFFSET		(SOC_BASE + 0xf7400)
+#define I2C_BRIDGE_OFFSET		(SOC_BASE + 0xd9000)
+
+#define CLIENT_DISC_COOKIE		XE_REG(SOC_BASE + 0x0164)
+#define CLIENT_DISC_ADDRESS		XE_REG(SOC_BASE + 0x0168)
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
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index d4b6e623aa48..dd635101420b 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -42,6 +42,7 @@
 #include "xe_guc.h"
 #include "xe_hw_engine_group.h"
 #include "xe_hwmon.h"
+#include "xe_i2c.h"
 #include "xe_irq.h"
 #include "xe_memirq.h"
 #include "xe_mmio.h"
@@ -929,6 +930,8 @@ int xe_device_probe(struct xe_device *xe)
 
 	xe_vsec_init(xe);
 
+	xe_i2c_probe(xe);
+
 	return devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, xe);
 
 err_unregister_display:
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 50b2bfa682ac..7011a078b9c7 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -36,6 +36,7 @@
 #endif
 
 struct xe_ggtt;
+struct xe_i2c;
 struct xe_pat_ops;
 struct xe_pxp;
 
@@ -572,6 +573,9 @@ struct xe_device {
 	/** @pmu: performance monitoring unit */
 	struct xe_pmu pmu;
 
+	/** @i2c: I2C host controller */
+	struct xe_i2c *i2c;
+
 	/** @atomic_svm_timeslice_ms: Atomic SVM fault timeslice MS */
 	u32 atomic_svm_timeslice_ms;
 
diff --git a/drivers/gpu/drm/xe/xe_i2c.c b/drivers/gpu/drm/xe/xe_i2c.c
new file mode 100644
index 000000000000..cc231368789f
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_i2c.c
@@ -0,0 +1,270 @@
+// SPDX-License-Identifier: GPL-2.0
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
+/* Synopsys DesignWare I2C Host Adapter */
+static const char adapter_name[] = "i2c_designware";
+
+static const struct property_entry xe_i2c_adapter_properties[] = {
+	PROPERTY_ENTRY_STRING("compatible", "intel,xe-mcu-i2c"),
+	PROPERTY_ENTRY_U32("clock-frequency", I2C_MAX_FAST_MODE_PLUS_FREQ),
+	{ }
+};
+
+static inline void xe_i2c_read_endpoint(struct xe_mmio *mmio, void *ep)
+{
+	u32 *val = ep;
+
+	val[0] = xe_mmio_read32(mmio, CLIENT_DISC_COOKIE);
+	val[1] = xe_mmio_read32(mmio, CLIENT_DISC_ADDRESS);
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
+	xe_i2c_unregister_adapter(i2c);
+	xe_i2c_remove_irq(i2c);
+	bus_unregister_notifier(&i2c_bus_type, &i2c->bus_notifier);
+}
+
+int xe_i2c_probe(struct xe_device *xe)
+{
+	struct xe_i2c_endpoint ep;
+	struct regmap *regmap;
+	struct xe_i2c *i2c;
+	int ret;
+
+	if (xe->info.platform != XE_BATTLEMAGE)
+		return 0;
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
+		goto err_unregister_notifier;
+
+	return devm_add_action_or_reset(i2c->drm_dev, xe_i2c_remove, i2c);
+
+err_unregister_notifier:
+	bus_unregister_notifier(&i2c_bus_type, &i2c->bus_notifier);
+
+	return ret;
+}
diff --git a/drivers/gpu/drm/xe/xe_i2c.h b/drivers/gpu/drm/xe/xe_i2c.h
new file mode 100644
index 000000000000..ab8e21630838
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_i2c.h
@@ -0,0 +1,60 @@
+/* SPDX-License-Identifier: GPL-2.0 */
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
+#define XE_I2C_EP_CAP_MULTI_MCU		BIT(1)
+#define XE_I2C_EP_CAP_SMBUS		BIT(2)
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


