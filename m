Return-Path: <linux-i2c+bounces-11334-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1B4AD331C
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Jun 2025 12:05:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 260D4189747D
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Jun 2025 10:05:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B24028CF67;
	Tue, 10 Jun 2025 10:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mWNqa7vu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618D928CF59;
	Tue, 10 Jun 2025 10:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749549812; cv=none; b=Pcn7BLnHIcdq6tVQJC78AVu+6ScPBAoiEIbqS3xJ13iZlLsGEZS/Q9GZ2LnEEPgrHfPoFj2KB3a+6RGhaBONEq+dkTDKgHI2MG5BY1zIp9ZFvRLbXoxXEzCfOT5YWF/WF4lSL6i0WGhUZoMvZBd5WYUJ9QMfbUV++72SkA6MMCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749549812; c=relaxed/simple;
	bh=SIjFkanjeqNj8t7I+yrVNo4R4IqXB7cn0S6I/15UTGQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MnNkx/ii8ewvW+wXb2jCWsphvARWH7nN+UR9fPN6rFCIyp2eJ4PUfqohvHwwI8P48Urtdc6kt8W3Ws40qrC5Ck4c5PxlMz3fTMqNwl+ykIfoZ2AxSOif+PyVfw5yciwe8Q+rgMh3pS4VCkZbZd9or1cWqpz4duXRaQZjIdDxK3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mWNqa7vu; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749549811; x=1781085811;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SIjFkanjeqNj8t7I+yrVNo4R4IqXB7cn0S6I/15UTGQ=;
  b=mWNqa7vucpDJ39TMe7LVMV2EE6o5pqSnrvPuDryG2Mt3btAKrncSnbN6
   xw8inbxMslR+2Zuw2Q4lB4MuqgQLUZKMXu9iNNAP+80k+AN+2ojkDCx/I
   mHwwtJTcV1+xcXe3cXMPjR2e+S4WPu8J6uqwQsSxisWsMHgol6vTgCH1k
   kTd8m8fwMxXwbEVE6+NA2pAzkOlCvPZOjgFWemrKn2pK+W9L1SAO6nU3Y
   LoioJEFF3Jlxo2lCJU5u8q9s2rX17qkM47k/WFecmPsqsMLgaWrtQVMR0
   WJeTbEZf2ydcDNTcLvzFDQsUuTC23v9pDydkh6UHvy4ww5zdjAW//Sx+x
   w==;
X-CSE-ConnectionGUID: ET2YECfOT1K1iaIxOOxD3A==
X-CSE-MsgGUID: CTHE/yyDQAuIl9o16W/WrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="69094616"
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="69094616"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 03:03:31 -0700
X-CSE-ConnectionGUID: uluiVWnoSS6pe96UQ97VbQ==
X-CSE-MsgGUID: FyME/zj2RdSyVyDoY4VPpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="147295403"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmviesa010.fm.intel.com with ESMTP; 10 Jun 2025 03:03:26 -0700
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
	"Michael J. Ruhl" <michael.j.ruhl@intel.com>,
	intel-xe@lists.freedesktop.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v2 3/4] drm/xe/pm: Wire up suspend/resume for I2C controller
Date: Tue, 10 Jun 2025 13:03:09 +0300
Message-ID: <20250610100311.2245871-4-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250610100311.2245871-1-heikki.krogerus@linux.intel.com>
References: <20250610100311.2245871-1-heikki.krogerus@linux.intel.com>
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
index fa7223e6ce9e..27f9935fd8fd 100644
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
 #define CLIENT_DISC_COOKIE		XE_REG(SOC_BASE + 0x0164)
 #define CLIENT_DISC_ADDRESS		XE_REG(SOC_BASE + 0x0168)
 
+#define I2C_CONFIG_CMD			XE_REG(I2C_CONFIG_SPACE_OFFSET + PCI_COMMAND)
+#define I2C_CONFIG_PMCSR		XE_REG(I2C_CONFIG_SPACE_OFFSET + 0x84)
+
 #endif /* _XE_I2C_REGS_H_ */
diff --git a/drivers/gpu/drm/xe/xe_i2c.c b/drivers/gpu/drm/xe/xe_i2c.c
index 3d649602ede8..59bdf28717bc 100644
--- a/drivers/gpu/drm/xe/xe_i2c.c
+++ b/drivers/gpu/drm/xe/xe_i2c.c
@@ -208,6 +208,31 @@ static const struct regmap_config i2c_regmap_config = {
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
@@ -240,6 +265,10 @@ int xe_i2c_probe(struct xe_device *xe)
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
index e88845be61b4..3b1208416bde 100644
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


