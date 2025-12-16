Return-Path: <linux-i2c+bounces-14574-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C84CC333F
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Dec 2025 14:26:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id ACFBB30303A8
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Dec 2025 13:26:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9696F38E16B;
	Tue, 16 Dec 2025 13:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dgd2vYHY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B87337D133;
	Tue, 16 Dec 2025 13:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765890889; cv=none; b=u4EXvI61q4lb/lpyYvYVIzfNKqiZTiBPuMdRCfyT7zgMTW6cc74RxVYB6c0nYfzMCOxoWg4FGsp8RScerG9Fxc3MrqXO/7xofUYtqelQMtAn9QmU0tCGwPQtldWpoNae1AOWP4AQIOytvk5M2zFcvX53fgLnkLx/9MmRU7606gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765890889; c=relaxed/simple;
	bh=Smckrg7+KnbhrTERu00VP73ZnleaknC3grp6RThlXuY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pJ7pwvxfyoylnS0uYezLwf2dXAFPdBRNlkOgRHSmo/rFvlKFU8rp0uCV79+5IVtYWvHCes4774MqpxeW1qHFN6WMmp04s7ziXrIdkDlae/9ZTjhPFHhGeaitZyc8IXs4ugrSVR84k2aOdqdU2GRD4hW2E0imkjQhi2RJPjM58gM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dgd2vYHY; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765890888; x=1797426888;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Smckrg7+KnbhrTERu00VP73ZnleaknC3grp6RThlXuY=;
  b=Dgd2vYHY7PzU8ifmx4RIrzrbOAmfgZ3gFb3LtoPniPmZryanzda2F9Mm
   0uMVlRh9GFh00Dr8phiXuJd6eOAID+COToHhCw90nXkkDLtLVKk/n5lkT
   zOqKPciAtiQdxGOnhBax9NX+yjjb6wc0twVGnFmLimTi35CyM/tjpviho
   nrjG39p8mJcCfQtVhdCrAXGFfa2EG5HlcBa8f+Oi61EGWMDlu2cUZng0Z
   2B/0VVNdI/L4H8r2akCIPkGfdnq55dAokZR8t3WlcJWePpe4gUfIHJCC7
   sbU+poLgdFqwP8dP4Hjzv8YfH1jwuLHURoLKVb0+mR3QKR96eEtb50yvB
   w==;
X-CSE-ConnectionGUID: kq98EQ6IQayIn70fDQ2zMw==
X-CSE-MsgGUID: xPFOEHdpTkaK0a5WfP3kbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="78444887"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="78444887"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 05:14:47 -0800
X-CSE-ConnectionGUID: gKRZH1QURhe9O12LiIfP6Q==
X-CSE-MsgGUID: NIvOEPwsRZ6IqpDnTSAq/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="198274403"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 16 Dec 2025 05:14:45 -0800
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Jan Dabros <jsd@semihalf.com>,
	Raag Jadav <raag.jadav@intel.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/6] i2c: designware: Remove useless driver specific option for I2C target
Date: Tue, 16 Dec 2025 14:14:36 +0100
Message-ID: <20251216131442.8464-2-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251216131442.8464-1-heikki.krogerus@linux.intel.com>
References: <20251216131442.8464-1-heikki.krogerus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The generic option for I2C target is already user selectable,
which makes the DesignWare specific option completely
unnecessary. The DesignWare option also silently selected
I2C_SLAVE instead of depending on it without any real need
for it.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/i2c/busses/Kconfig               | 10 ++--------
 drivers/i2c/busses/Makefile              |  2 +-
 drivers/i2c/busses/i2c-designware-core.h |  2 +-
 3 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 09ba55bae1fa..860812e224a0 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -569,20 +569,14 @@ config I2C_DESIGNWARE_CORE
 	help
 	  This option enables support for the Synopsys DesignWare I2C adapter.
 	  This driver includes support for the I2C host on the Synopsys
-	  Designware I2C adapter.
+	  Designware I2C adapter, and the I2C slave when enabled (select
+	  I2C_SLAVE).
 
 	  To compile the driver as a module, choose M here: the module will be
 	  called i2c-designware-core.
 
 if I2C_DESIGNWARE_CORE
 
-config I2C_DESIGNWARE_SLAVE
-	bool "Synopsys DesignWare Slave"
-	select I2C_SLAVE
-	help
-	  If you say yes to this option, support will be included for the
-	  Synopsys DesignWare I2C slave adapter.
-
 config I2C_DESIGNWARE_PLATFORM
 	tristate "Synopsys DesignWare Platform driver"
 	depends on (ACPI && COMMON_CLK) || !ACPI
diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
index fb985769f5ff..547123ab351f 100644
--- a/drivers/i2c/busses/Makefile
+++ b/drivers/i2c/busses/Makefile
@@ -53,7 +53,7 @@ obj-$(CONFIG_I2C_DAVINCI)	+= i2c-davinci.o
 obj-$(CONFIG_I2C_DESIGNWARE_CORE)			+= i2c-designware-core.o
 i2c-designware-core-y					:= i2c-designware-common.o
 i2c-designware-core-y					+= i2c-designware-master.o
-i2c-designware-core-$(CONFIG_I2C_DESIGNWARE_SLAVE) 	+= i2c-designware-slave.o
+i2c-designware-core-$(CONFIG_I2C_SLAVE) 		+= i2c-designware-slave.o
 obj-$(CONFIG_I2C_DESIGNWARE_PLATFORM)			+= i2c-designware-platform.o
 i2c-designware-platform-y 				:= i2c-designware-platdrv.o
 i2c-designware-platform-$(CONFIG_I2C_DESIGNWARE_AMDPSP)	+= i2c-designware-amdpsp.o
diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index bb5ce0a382f9..2a7decc24931 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -386,7 +386,7 @@ void i2c_dw_disable(struct dw_i2c_dev *dev);
 extern void i2c_dw_configure_master(struct dw_i2c_dev *dev);
 extern int i2c_dw_probe_master(struct dw_i2c_dev *dev);
 
-#if IS_ENABLED(CONFIG_I2C_DESIGNWARE_SLAVE)
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
 extern void i2c_dw_configure_slave(struct dw_i2c_dev *dev);
 extern int i2c_dw_probe_slave(struct dw_i2c_dev *dev);
 #else
-- 
2.50.1


