Return-Path: <linux-i2c+bounces-14643-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 716E7CCC6EA
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Dec 2025 16:17:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B89DD309AF18
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Dec 2025 15:15:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B52734BA53;
	Thu, 18 Dec 2025 15:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NICkP0e8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE992FE07F;
	Thu, 18 Dec 2025 15:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766070921; cv=none; b=g7vtl35rMN9gsR6evVpHnBszQVNX1KbXCb82WMBL4k45fKoyZLmdREKvCC0amopWqrhJ6qHNrORstrfTYSBZ6THlifTy2p5UGjE9XUPx/FGtf1TeduJgIbDY+mG5WGWoE3TOO3eDF9p8a9jykD++0FQxpsEMuW7W17JUZyUYT5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766070921; c=relaxed/simple;
	bh=Smckrg7+KnbhrTERu00VP73ZnleaknC3grp6RThlXuY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S2QXSoeeMLyWdB2mXmkQSHyeC3lZULnbdgWYSgJ7rO/O0pp9n9l9AH5IMyFUrPLcaTWy8j4VtLb2671/BPra5ZAl6ZUOAMPYk8gacqMed7MhI9sWvGJOFFpM+cV8BwKb8s5/itV5xsZsjydvr9gNzCoeSabriHbiDOgidisvQGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NICkP0e8; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766070918; x=1797606918;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Smckrg7+KnbhrTERu00VP73ZnleaknC3grp6RThlXuY=;
  b=NICkP0e81rJqgx60IMYb3UV5so1NKPJ7Hy8NO05j91ljeoOcHzzZrPY5
   RXaDA7JEc2tmT81hiPpOaCGsp68euR26kuqhPfgP/NB4eGzwRxGFqnzze
   t08X2FpKl3U9deH0LZaA4dj3vniyqGf9jM91vnsoqSW5zNVcCOpnv29f0
   uWaWxxRiY6hV2EEMfIQl37hIiMYWdx5gVbBBh/jiA5bNBoTBp1JfkgNYe
   dWJcLZR4q827Hp2cHYr2wIRaiJNBEmlbw274a+JU0M3U8DnijlpJ+axx1
   +hRtNaDxLCP1jvDN949r6Pt3J9XKv9G/cReceunK+cg8zvoRxcGvpven8
   Q==;
X-CSE-ConnectionGUID: 22tLWWmzQ/W9kPC4IaLZYw==
X-CSE-MsgGUID: xpZ8jvY2TaKkz2PGMhRH3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="78739517"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; 
   d="scan'208";a="78739517"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 07:15:14 -0800
X-CSE-ConnectionGUID: iRsxyoQvScS0jzXGhQDb+g==
X-CSE-MsgGUID: GOlqyDczQ1uRAdst+VM4Yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; 
   d="scan'208";a="197857486"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa010.jf.intel.com with ESMTP; 18 Dec 2025 07:15:13 -0800
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Raag Jadav <raag.jadav@intel.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/6] i2c: designware: Remove useless driver specific option for I2C target
Date: Thu, 18 Dec 2025 16:15:00 +0100
Message-ID: <20251218151509.361617-2-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251218151509.361617-1-heikki.krogerus@linux.intel.com>
References: <20251218151509.361617-1-heikki.krogerus@linux.intel.com>
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


