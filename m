Return-Path: <linux-i2c+bounces-11610-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E062CAE9F81
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Jun 2025 15:57:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 893E43B026F
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Jun 2025 13:56:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E59E42E8DF0;
	Thu, 26 Jun 2025 13:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RkUKt6c+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8012E88A5;
	Thu, 26 Jun 2025 13:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750946190; cv=none; b=mkWSSCNwm3Vdb9+qByw4NMRuNrJJj+QhUNNrElK7Ih/AYwWKcBRVVISpINOkI2B8bRf1E7Y/uTG1Gye7LOkAedkw1ArJBKlHfI9+elCnjKUA7aL1VrNxDeLt40KkHL7uAvbcIhFELH/x+IohR+IDhYWS5w426YBk8DTFskPiX0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750946190; c=relaxed/simple;
	bh=aF3uTK1iO8x8oyAb433tOUT+wof8ZOyY6mEwIXBqq/w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nAD3oqWrOPW1Cb0MZW4z1dDLPo4DnN15Flen2IBls1TIvLx2fk/kSPiAjtAZ7YE2rVo+Zpq+MdJR6lnvQVfSKVc/SB/n6RZUyAoePhFt6izJJA1HUC5cXufMoh7+JPCVJF5p8xAiGT41vDsGTKa3iXVJLw42K64OhBn47KHH+Xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RkUKt6c+; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750946189; x=1782482189;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aF3uTK1iO8x8oyAb433tOUT+wof8ZOyY6mEwIXBqq/w=;
  b=RkUKt6c+AZ9dYWYIzIXpNj5srmHT8AE7AYDnbgkT2LK86R3PKOr54mag
   K9C9iZmujgbS6e0rEgopbwJMpHgrsB5FJjefhMokgtdCtxz2ZKba35pcZ
   G3x7Shi7At7gwotKmbkMI0wqwuPgjk51llTxWOOO1r0XAwli93NRPhxzP
   zmd7QZzxE6t03gIsp7e2l2Jpdt47w32m+CV1ShHnlK1jSeMqB3acWSuXI
   Ucm11fbI9kXFivbbN9kEHNRsn9KRJULcn522EQh+3SXglwRwqGQzjdcGt
   Jrj60PPUbPDwjMPYrjNpac52Q/bdOtpl6wtmSJ3WC4gc9/46kN2aKY6Do
   A==;
X-CSE-ConnectionGUID: JCPUOzqOS1OfacVTr8GyrA==
X-CSE-MsgGUID: ZBETEthpTdOtrJ5ZEuXJaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="53316417"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="53316417"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:56:29 -0700
X-CSE-ConnectionGUID: Bsjc+l4sQBCI2jBr/szA9w==
X-CSE-MsgGUID: beV7cXG8TJW9NGApDNokAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="152146969"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmviesa007.fm.intel.com with ESMTP; 26 Jun 2025 06:56:24 -0700
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
	linux-kernel@vger.kernel.org,
	Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v4 3/4] drm/xe/pm: Wire up suspend/resume for I2C controller
Date: Thu, 26 Jun 2025 16:56:08 +0300
Message-ID: <20250626135610.299943-4-heikki.krogerus@linux.intel.com>
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

From: Raag Jadav <raag.jadav@intel.com>

Wire up suspend/resume handles for I2C controller to match its power
state with SGUnit.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
Reviewed-by: Karthik Poosa <karthik.poosa@intel.com>
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/gpu/drm/xe/regs/xe_i2c_regs.h |  5 +++++
 drivers/gpu/drm/xe/xe_i2c.c           | 29 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_i2c.h           |  4 ++++
 drivers/gpu/drm/xe/xe_pm.c            |  9 +++++++++
 4 files changed, 47 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_i2c_regs.h b/drivers/gpu/drm/xe/regs/xe_i2c_regs.h
index 92dae4487614..af781c8e4a80 100644
--- a/drivers/gpu/drm/xe/regs/xe_i2c_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_i2c_regs.h
@@ -2,6 +2,8 @@
 #ifndef _XE_I2C_REGS_H_
 #define _XE_I2C_REGS_H_
 
+#include <linux/pci_regs.h>
+
 #include "xe_reg_defs.h"
 #include "xe_regs.h"
 
@@ -12,4 +14,7 @@
 #define REG_SG_REMAP_ADDR_PREFIX	XE_REG(SOC_BASE + 0x0164)
 #define REG_SG_REMAP_ADDR_POSTFIX	XE_REG(SOC_BASE + 0x0168)
 
+#define I2C_CONFIG_CMD			XE_REG(I2C_CONFIG_SPACE_OFFSET + PCI_COMMAND)
+#define I2C_CONFIG_PMCSR		XE_REG(I2C_CONFIG_SPACE_OFFSET + 0x84)
+
 #endif /* _XE_I2C_REGS_H_ */
diff --git a/drivers/gpu/drm/xe/xe_i2c.c b/drivers/gpu/drm/xe/xe_i2c.c
index bfbfe1de7f77..0227fcba2168 100644
--- a/drivers/gpu/drm/xe/xe_i2c.c
+++ b/drivers/gpu/drm/xe/xe_i2c.c
@@ -227,6 +227,31 @@ static const struct regmap_config i2c_regmap_config = {
 	.fast_io = true,
 };
 
+void xe_i2c_pm_suspend(struct xe_device *xe)
+{
+	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
+
+	if (!xe->i2c || xe->i2c->ep.cookie != XE_I2C_EP_COOKIE_DEVICE)
+		return;
+
+	xe_mmio_rmw32(mmio, I2C_CONFIG_PMCSR, PCI_PM_CTRL_STATE_MASK, PCI_D3hot);
+	drm_dbg(&xe->drm, "pmcsr: 0x%08x\n", xe_mmio_read32(mmio, I2C_CONFIG_PMCSR));
+}
+
+void xe_i2c_pm_resume(struct xe_device *xe, bool d3cold)
+{
+	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
+
+	if (!xe->i2c || xe->i2c->ep.cookie != XE_I2C_EP_COOKIE_DEVICE)
+		return;
+
+	if (d3cold)
+		xe_mmio_rmw32(mmio, I2C_CONFIG_CMD, 0, PCI_COMMAND_MEMORY);
+
+	xe_mmio_rmw32(mmio, I2C_CONFIG_PMCSR, PCI_PM_CTRL_STATE_MASK, PCI_D0);
+	drm_dbg(&xe->drm, "pmcsr: 0x%08x\n", xe_mmio_read32(mmio, I2C_CONFIG_PMCSR));
+}
+
 static void xe_i2c_remove(void *data)
 {
 	struct xe_i2c *i2c = data;
@@ -267,6 +292,10 @@ int xe_i2c_probe(struct xe_device *xe)
 	i2c->mmio = xe_root_tile_mmio(xe);
 	i2c->drm_dev = xe->drm.dev;
 	i2c->ep = ep;
+	xe->i2c = i2c;
+
+	/* PCI PM isn't aware of this device, bring it up and match it with SGUnit state. */
+	xe_i2c_pm_resume(xe, true);
 
 	regmap = devm_regmap_init(i2c->drm_dev, NULL, i2c, &i2c_regmap_config);
 	if (IS_ERR(regmap))
diff --git a/drivers/gpu/drm/xe/xe_i2c.h b/drivers/gpu/drm/xe/xe_i2c.h
index 7ea40f4e4aa4..b767ed8ce52b 100644
--- a/drivers/gpu/drm/xe/xe_i2c.h
+++ b/drivers/gpu/drm/xe/xe_i2c.h
@@ -50,9 +50,13 @@ struct xe_i2c {
 #if IS_ENABLED(CONFIG_I2C)
 int xe_i2c_probe(struct xe_device *xe);
 void xe_i2c_irq_handler(struct xe_device *xe, u32 master_ctl);
+void xe_i2c_pm_suspend(struct xe_device *xe);
+void xe_i2c_pm_resume(struct xe_device *xe, bool d3cold);
 #else
 static inline int xe_i2c_probe(struct xe_device *xe) { return 0; }
 static inline void xe_i2c_irq_handler(struct xe_device *xe, u32 master_ctl) { }
+static inline void xe_i2c_pm_suspend(struct xe_device *xe) { }
+static inline void xe_i2c_pm_resume(struct xe_device *xe, bool d3cold) { }
 #endif
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 26e95460af87..46471e166b96 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -19,6 +19,7 @@
 #include "xe_ggtt.h"
 #include "xe_gt.h"
 #include "xe_guc.h"
+#include "xe_i2c.h"
 #include "xe_irq.h"
 #include "xe_pcode.h"
 #include "xe_pxp.h"
@@ -146,6 +147,8 @@ int xe_pm_suspend(struct xe_device *xe)
 
 	xe_display_pm_suspend_late(xe);
 
+	xe_i2c_pm_suspend(xe);
+
 	drm_dbg(&xe->drm, "Device suspended\n");
 	return 0;
 
@@ -191,6 +194,8 @@ int xe_pm_resume(struct xe_device *xe)
 	if (err)
 		goto err;
 
+	xe_i2c_pm_resume(xe, xe->d3cold.allowed);
+
 	xe_irq_resume(xe);
 
 	for_each_gt(gt, xe, id)
@@ -484,6 +489,8 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
 
 	xe_display_pm_runtime_suspend_late(xe);
 
+	xe_i2c_pm_suspend(xe);
+
 	xe_rpm_lockmap_release(xe);
 	xe_pm_write_callback_task(xe, NULL);
 	return 0;
@@ -531,6 +538,8 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 			goto out;
 	}
 
+	xe_i2c_pm_resume(xe, xe->d3cold.allowed);
+
 	xe_irq_resume(xe);
 
 	for_each_gt(gt, xe, id)
-- 
2.47.2


