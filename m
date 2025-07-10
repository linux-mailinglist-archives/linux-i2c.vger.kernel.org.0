Return-Path: <linux-i2c+bounces-11893-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 459CFAFFAB5
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Jul 2025 09:20:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8F7B8174680
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Jul 2025 07:20:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB149288C18;
	Thu, 10 Jul 2025 07:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AME6WZID"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1023528A40F;
	Thu, 10 Jul 2025 07:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752132004; cv=none; b=f7fa4DMren4n3ZuDAMAS2cfPcBjQ5UrivxmvqXd6yy1rrv4isFrhNfI2uV3L2LOmz99aIA6OuM2Jd8NsjOxZC9bsqKPczRZkr14VQslvFWBdPBjgnL27ZE1bh+lMLqlCTmpY67x6KjACv69VYaKQCriZE1FpzMKPkdSyjQTbZ80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752132004; c=relaxed/simple;
	bh=sjh4gOcnYKChZCbV0VyHgDNa8DtDBHg52CdsqzJhr18=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HvzClz6h37jen4mkndPtwz/+zFvV3FFusNmUc0Sn/fiHJvsszRdLtcTi/WmyyZRJCfQE0YEcu50gH74GELYnzFOSrfUjr6h4by8XuSHesadWGzvX8COyPIkQbbvs/IV2bUZupVZU7lGmBS0noKgcI/k9yly/8adbpym0oCATx2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AME6WZID; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752132003; x=1783668003;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sjh4gOcnYKChZCbV0VyHgDNa8DtDBHg52CdsqzJhr18=;
  b=AME6WZIDE+0r550cDid8AFngkKxyNTOk6Z81uFku67+LIa52JldEFuzl
   ux5j67V6HoGo0aipNYElceS1V71JplhCrLiIKEe0NyYe/dkpc1nK9S+SS
   bZ4JhUqY7lXDBPPvxbdRxI8utekY4dYPAktnpQa3dX1l0jS5m+IhHpY5G
   jcFxoBqtaFiQ1nIFkmYFHTGpNHCuG/RaZyMRIKUAfvqJS8kDtsGRFpIJx
   lfFwlwcvHEvTrOCbQxSCOif0+DwUVv7SteYG4S44dn9x6iLJIVq+77Rkf
   vYkERomUrknjqNSovumY04T5tlWSEwzr0tijPkD1tzEbTlo3wEr7WPA+z
   w==;
X-CSE-ConnectionGUID: obRCrkS5Sq2QKcVssgZ7BQ==
X-CSE-MsgGUID: zQ8NuScvRj2ySFbDoUUPdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="54256732"
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; 
   d="scan'208";a="54256732"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2025 00:20:03 -0700
X-CSE-ConnectionGUID: oNY3nEVJRgivDtV14VzI9w==
X-CSE-MsgGUID: oGPUBtNLR7qDZVecYy3U+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; 
   d="scan'208";a="160323979"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
  by orviesa003.jf.intel.com with ESMTP; 10 Jul 2025 00:19:57 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: lucas.demarchi@intel.com,
	thomas.hellstrom@linux.intel.com,
	rodrigo.vivi@intel.com
Cc: jarkko.nikula@linux.intel.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	andriy.shevchenko@linux.intel.com,
	mika.westerberg@linux.intel.com,
	jsd@semihalf.com,
	andi.shyti@kernel.org,
	raag.jadav@intel.com,
	riana.tauro@intel.com,
	srinivasa.adatrao@intel.com,
	michael.j.ruhl@intel.com,
	intel-xe@lists.freedesktop.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Karthik Poosa <karthik.poosa@intel.com>,
	Andi Shyti <andi.shyti@linux.intel.com>
Subject: [PATCH v7 4/5] drm/xe/pm: Wire up suspend/resume for I2C controller
Date: Thu, 10 Jul 2025 12:46:11 +0530
Message-Id: <20250710071612.2714990-5-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250710071612.2714990-1-raag.jadav@intel.com>
References: <20250710071612.2714990-1-raag.jadav@intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Wire up suspend/resume handles for I2C controller to match its power
state with SGUnit.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Reviewed-by: Karthik Poosa <karthik.poosa@intel.com>
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
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
index 6f05142a8abf..db9c0340be5c 100644
--- a/drivers/gpu/drm/xe/xe_i2c.c
+++ b/drivers/gpu/drm/xe/xe_i2c.c
@@ -226,6 +226,31 @@ static const struct regmap_config i2c_regmap_config = {
 	.fast_io = true,
 };
 
+void xe_i2c_pm_suspend(struct xe_device *xe)
+{
+	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
+
+	if (!xe->i2c || xe->i2c->ep.cookie != XE_I2C_EP_COOKIE_DEVICE)
+		return;
+
+	xe_mmio_rmw32(mmio, I2C_CONFIG_PMCSR, PCI_PM_CTRL_STATE_MASK, (__force u32)PCI_D3hot);
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
+	xe_mmio_rmw32(mmio, I2C_CONFIG_PMCSR, PCI_PM_CTRL_STATE_MASK, (__force u32)PCI_D0);
+	drm_dbg(&xe->drm, "pmcsr: 0x%08x\n", xe_mmio_read32(mmio, I2C_CONFIG_PMCSR));
+}
+
 static void xe_i2c_remove(void *data)
 {
 	struct xe_i2c *i2c = data;
@@ -270,6 +295,10 @@ int xe_i2c_probe(struct xe_device *xe)
 	i2c->mmio = xe_root_tile_mmio(xe);
 	i2c->drm_dev = drm_dev;
 	i2c->ep = ep;
+	xe->i2c = i2c;
+
+	/* PCI PM isn't aware of this device, bring it up and match it with SGUnit state. */
+	xe_i2c_pm_resume(xe, true);
 
 	regmap = devm_regmap_init(drm_dev, NULL, i2c, &i2c_regmap_config);
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
index bcfda545e74f..f171a91b849c 100644
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
 
@@ -190,6 +193,8 @@ int xe_pm_resume(struct xe_device *xe)
 	if (err)
 		goto err;
 
+	xe_i2c_pm_resume(xe, xe->d3cold.allowed);
+
 	xe_irq_resume(xe);
 
 	for_each_gt(gt, xe, id)
@@ -487,6 +492,8 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
 
 	xe_display_pm_runtime_suspend_late(xe);
 
+	xe_i2c_pm_suspend(xe);
+
 	xe_rpm_lockmap_release(xe);
 	xe_pm_write_callback_task(xe, NULL);
 	return 0;
@@ -534,6 +541,8 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 			goto out;
 	}
 
+	xe_i2c_pm_resume(xe, xe->d3cold.allowed);
+
 	xe_irq_resume(xe);
 
 	for_each_gt(gt, xe, id)
-- 
2.34.1


