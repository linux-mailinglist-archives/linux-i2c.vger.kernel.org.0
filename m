Return-Path: <linux-i2c+bounces-5696-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F307E95BDE4
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 20:04:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B44F1C22258
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 18:04:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 210FB1CFEC1;
	Thu, 22 Aug 2024 18:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gkF5CdpI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7DD01CFEA3;
	Thu, 22 Aug 2024 18:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724349862; cv=none; b=ssWnwLiD8fC4r+0k8ngFiPZrYfOfmRR4hUwbzvXsNL3z5Fo9ob5hr4xqky0JPofguVqCb7ob2i11tY5zTBJTTQk3FZbZgxGVP6I26cPmch6yRiUWssloBIWkDnRk4lz6LQGuIHVmHDQRVUJiFiM5mSaRqyn68hJxrE8YZxM6Gfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724349862; c=relaxed/simple;
	bh=h7LsJHBIzXuSTaTAvZwPJobQMQQe2FjkCJdegZnWH84=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jl/8G7tTBL75vkOdKKxbaoxbGgnewv3d6aAnUjsxUDTg2uz2/+z7QAW+kMlVJZ5f6EQCmwyKp6XR5QQAPEViZoR7cLCEl0rqbhx/EQtoB5S711Dt8jQz6rVL1y/+77P6g1RsLHMNni5MM1Ibp+HaZnVJv61laIcZ7RreWC0wzjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gkF5CdpI; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724349861; x=1755885861;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=h7LsJHBIzXuSTaTAvZwPJobQMQQe2FjkCJdegZnWH84=;
  b=gkF5CdpIvvO0lvMvWdpy26wpnjxF5RR2lVo6KaWPAxhm2DaVqds9Gkln
   14suUuAJaFKjr/xoNCDXt9ZDikUJ+aqcaAahVzAreVnEL54K9mjoyYzTZ
   rJmF1w1L1PZR9Uk3SAq46RNuSbbeE+qjVGnowZnyZ9FKvSLvd6i6vKn4J
   ZneTnQOwwKyBOAvC7tZDYbRQQppPPpXQspzrzAeEPyBFfxkrGsgZskdBL
   xSPZ4Wpw20adS8jj8TYifD4jUU0K7RK9Sf2lR1996E7aS1yCMCRqlFkse
   Yw6ZcSkwYUlATk1CnMPFNx3rKVD0cdL5uzXlx7RyZ+RauNhiIa6f7pLuP
   Q==;
X-CSE-ConnectionGUID: oa/5PlfYTwGxZ+i4WK9V+Q==
X-CSE-MsgGUID: qZVqLmfNSgyPViAkSKwemg==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="26656193"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="26656193"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 11:04:20 -0700
X-CSE-ConnectionGUID: Dfm2sxuuSHGJlrzOcWHxMw==
X-CSE-MsgGUID: 6nn7VvhuRiiQ8AsWCMF+Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="62074202"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa007.jf.intel.com with ESMTP; 22 Aug 2024 11:04:16 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 7A56E43E; Thu, 22 Aug 2024 21:04:12 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Narasimhan.V@amd.com,
	Borislav Petkov <bp@alien8.de>,
	Kim Phillips <kim.phillips@amd.com>
Subject: [PATCH v1 4/5] i2c: designware: Move exports to I2C_DW namespaces
Date: Thu, 22 Aug 2024 20:58:40 +0300
Message-ID: <20240822180411.2298991-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20240822180411.2298991-1-andriy.shevchenko@linux.intel.com>
References: <20240822180411.2298991-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Reduce scope of the I²C DesignWare driver exports to I2C_DW namespaces.
This will prevent abuse of the symbols and clean up global namespace.

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-common.c  | 2 ++
 drivers/i2c/busses/i2c-designware-master.c  | 3 +++
 drivers/i2c/busses/i2c-designware-pcidrv.c  | 2 ++
 drivers/i2c/busses/i2c-designware-platdrv.c | 2 ++
 drivers/i2c/busses/i2c-designware-slave.c   | 3 +++
 5 files changed, 12 insertions(+)

diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
index 2c460093b7ab..2601876f76ad 100644
--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -28,6 +28,8 @@
 #include <linux/types.h>
 #include <linux/units.h>
 
+#define DEFAULT_SYMBOL_NAMESPACE	I2C_DW_COMMON
+
 #include "i2c-designware-core.h"
 
 static char *abort_sources[] = {
diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index d3b466592be4..a890a73e197e 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -22,6 +22,8 @@
 #include <linux/regmap.h>
 #include <linux/reset.h>
 
+#define DEFAULT_SYMBOL_NAMESPACE	I2C_DW
+
 #include "i2c-designware-core.h"
 
 #define AMD_TIMEOUT_MIN_US	25
@@ -1037,3 +1039,4 @@ EXPORT_SYMBOL_GPL(i2c_dw_probe_master);
 
 MODULE_DESCRIPTION("Synopsys DesignWare I2C bus master adapter");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(I2C_DW_COMMON);
diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
index 14186230622d..2f2085700594 100644
--- a/drivers/i2c/busses/i2c-designware-pcidrv.c
+++ b/drivers/i2c/busses/i2c-designware-pcidrv.c
@@ -410,3 +410,5 @@ module_pci_driver(dw_i2c_driver);
 MODULE_AUTHOR("Baruch Siach <baruch@tkos.co.il>");
 MODULE_DESCRIPTION("Synopsys DesignWare PCI I2C bus adapter");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(I2C_DW);
+MODULE_IMPORT_NS(I2C_DW_COMMON);
diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 7e2f26d0593e..7a3f4e96d59e 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -462,3 +462,5 @@ module_exit(dw_i2c_exit_driver);
 MODULE_AUTHOR("Baruch Siach <baruch@tkos.co.il>");
 MODULE_DESCRIPTION("Synopsys DesignWare I2C bus adapter");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(I2C_DW);
+MODULE_IMPORT_NS(I2C_DW_COMMON);
diff --git a/drivers/i2c/busses/i2c-designware-slave.c b/drivers/i2c/busses/i2c-designware-slave.c
index 78e2c47e3d7d..5995361b5615 100644
--- a/drivers/i2c/busses/i2c-designware-slave.c
+++ b/drivers/i2c/busses/i2c-designware-slave.c
@@ -16,6 +16,8 @@
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 
+#define DEFAULT_SYMBOL_NAMESPACE	I2C_DW
+
 #include "i2c-designware-core.h"
 
 static void i2c_dw_configure_fifo_slave(struct dw_i2c_dev *dev)
@@ -279,3 +281,4 @@ EXPORT_SYMBOL_GPL(i2c_dw_probe_slave);
 MODULE_AUTHOR("Luis Oliveira <lolivei@synopsys.com>");
 MODULE_DESCRIPTION("Synopsys DesignWare I2C bus slave adapter");
 MODULE_LICENSE("GPL v2");
+MODULE_IMPORT_NS(I2C_DW_COMMON);
-- 
2.43.0.rc1.1336.g36b5255a03ac


