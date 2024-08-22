Return-Path: <linux-i2c+bounces-5700-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E6E95BDF0
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 20:05:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4617B1C237D9
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 18:05:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FAB91CFEA7;
	Thu, 22 Aug 2024 18:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gu+1KxH9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850DF1D04B5;
	Thu, 22 Aug 2024 18:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724349873; cv=none; b=WdRo9dDjvnou8T5mtOjv3MzvObrxGkuII8XPWHXTEAobsOgsN/8BassW0AbpYaUov2TSFZNLexjpLdOowobD/v8xB8ySoJmt7cpSiKZ5svv1MIzPDvfh6E/7F/ZkfMr4SFgcfiLODprA2Xp/+5y2ge0qcRKpmeyfslzjTkusWXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724349873; c=relaxed/simple;
	bh=PLg9DW14fUbZUKvPzBr5SKlhiqNP2bi/e6w3+deC6jY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M155sD5fNamCSCGXbWuJlGacqhsggwXETtEPxJoWVlG1zkN+jgkQtEVuas/bFDMECzVDp+TVuND+d7XQQSDWBWR1ZdCpc6w4mICz+LY6BcZDFfK7uMoob6amin1a/0n3rYjVpDhMlqGEYgDtJvaOPdjCEq/PXXxnEACf0oBm/qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gu+1KxH9; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724349871; x=1755885871;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PLg9DW14fUbZUKvPzBr5SKlhiqNP2bi/e6w3+deC6jY=;
  b=gu+1KxH9HLT5tltbbxXV0FJzS355UeqGUNmf76g6q5t40sFaS44aODYX
   R/icQF4Zp7Yq1pJo1yESQiM5331+8+MPOB/vZQWLp6ws29bQaFhissbxv
   K2lBi2wpk11gFWuG8ur9kYBul9y+HoBnJ/oW15UoygyPq3U/w0SrKvqRX
   LgxTWIYdk9OCcyLp48vsH5D5iurxxziNZ4Uwbi4xk6d1x3mK+ZYK1IoLb
   hF51yUl3wZY2u78Bdek90IIi/lqI4L5NsSvtYDKWquQ3T10b9kh6JeVjZ
   nVCytwtokLaSL0YXGVtJDGoBFNlWLkAHuK97MYX/bgY2DSCP75P9IAvGf
   g==;
X-CSE-ConnectionGUID: pDe+YdgoRLSZ2hcOrmPrdQ==
X-CSE-MsgGUID: sgN0ZmVKQ+2MI2QcY3oeZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="26656231"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="26656231"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 11:04:30 -0700
X-CSE-ConnectionGUID: XxlS/6KOR0GrlJwGcQU6iw==
X-CSE-MsgGUID: jPU8kpFpTOeVkY75015g5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="62074266"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa007.jf.intel.com with ESMTP; 22 Aug 2024 11:04:28 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 8A4A94D7; Thu, 22 Aug 2024 21:04:12 +0300 (EEST)
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
Subject: [PATCH v1 5/5] i2c: designware: Remove ->disable() callback
Date: Thu, 22 Aug 2024 20:58:41 +0300
Message-ID: <20240822180411.2298991-6-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20240822180411.2298991-1-andriy.shevchenko@linux.intel.com>
References: <20240822180411.2298991-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 90312351fd1e ("i2c: designware: MASTER mode as separated driver")
introduced ->disable() callback but there is no real use for it. Both
i2c-designware-master.c and i2c-designware-slave.c set it to the same
i2c_dw_disable() and scope is inside the same kernel module.

That said, replace the callback by explicitly calling the i2c_dw_disable().

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-common.c  | 1 +
 drivers/i2c/busses/i2c-designware-core.h    | 4 +---
 drivers/i2c/busses/i2c-designware-master.c  | 1 -
 drivers/i2c/busses/i2c-designware-pcidrv.c  | 5 +++--
 drivers/i2c/busses/i2c-designware-platdrv.c | 4 ++--
 drivers/i2c/busses/i2c-designware-slave.c   | 3 +--
 6 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
index 2601876f76ad..b60c55587e48 100644
--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -734,6 +734,7 @@ void i2c_dw_disable(struct dw_i2c_dev *dev)
 
 	i2c_dw_release_lock(dev);
 }
+EXPORT_SYMBOL_GPL(i2c_dw_disable);
 
 MODULE_DESCRIPTION("Synopsys DesignWare I2C bus adapter core");
 MODULE_LICENSE("GPL");
diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index b9f97f4eedf5..723d599cca93 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -237,7 +237,6 @@ struct reset_control;
  * @semaphore_idx: Index of table with semaphore type attached to the bus. It's
  *	-1 if there is no semaphore.
  * @shared_with_punit: true if this bus is shared with the SoCs PUNIT
- * @disable: function to disable the controller
  * @init: function to initialize the I2C hardware
  * @set_sda_hold_time: callback to retrieve IP specific SDA hold timing
  * @mode: operation mode - DW_IC_MASTER or DW_IC_SLAVE
@@ -295,7 +294,6 @@ struct dw_i2c_dev {
 	void			(*release_lock)(void);
 	int			semaphore_idx;
 	bool			shared_with_punit;
-	void			(*disable)(struct dw_i2c_dev *dev);
 	int			(*init)(struct dw_i2c_dev *dev);
 	int			(*set_sda_hold_time)(struct dw_i2c_dev *dev);
 	int			mode;
@@ -342,7 +340,6 @@ int i2c_dw_wait_bus_not_busy(struct dw_i2c_dev *dev);
 int i2c_dw_handle_tx_abort(struct dw_i2c_dev *dev);
 int i2c_dw_set_fifo_size(struct dw_i2c_dev *dev);
 u32 i2c_dw_func(struct i2c_adapter *adap);
-void i2c_dw_disable(struct dw_i2c_dev *dev);
 
 static inline void __i2c_dw_enable(struct dw_i2c_dev *dev)
 {
@@ -375,6 +372,7 @@ static inline void __i2c_dw_read_intr_mask(struct dw_i2c_dev *dev,
 }
 
 void __i2c_dw_disable(struct dw_i2c_dev *dev);
+void i2c_dw_disable(struct dw_i2c_dev *dev);
 
 extern void i2c_dw_configure_master(struct dw_i2c_dev *dev);
 extern int i2c_dw_probe_master(struct dw_i2c_dev *dev);
diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index a890a73e197e..e46f1b22c360 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -949,7 +949,6 @@ int i2c_dw_probe_master(struct dw_i2c_dev *dev)
 	init_completion(&dev->cmd_complete);
 
 	dev->init = i2c_dw_init_master;
-	dev->disable = i2c_dw_disable;
 
 	ret = i2c_dw_init_regmap(dev);
 	if (ret)
diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
index 2f2085700594..dd188ccd961e 100644
--- a/drivers/i2c/busses/i2c-designware-pcidrv.c
+++ b/drivers/i2c/busses/i2c-designware-pcidrv.c
@@ -198,7 +198,7 @@ static int __maybe_unused i2c_dw_pci_runtime_suspend(struct device *dev)
 {
 	struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
 
-	i_dev->disable(i_dev);
+	i2c_dw_disable(i_dev);
 	return 0;
 }
 
@@ -339,7 +339,8 @@ static void i2c_dw_pci_remove(struct pci_dev *pdev)
 {
 	struct dw_i2c_dev *dev = pci_get_drvdata(pdev);
 
-	dev->disable(dev);
+	i2c_dw_disable(dev);
+
 	pm_runtime_forbid(&pdev->dev);
 	pm_runtime_get_noresume(&pdev->dev);
 
diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 7a3f4e96d59e..e49c68c6e142 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -328,7 +328,7 @@ static void dw_i2c_plat_remove(struct platform_device *pdev)
 
 	i2c_del_adapter(&dev->adapter);
 
-	dev->disable(dev);
+	i2c_dw_disable(dev);
 
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	pm_runtime_put_sync(&pdev->dev);
@@ -357,7 +357,7 @@ static int dw_i2c_plat_runtime_suspend(struct device *dev)
 	if (i_dev->shared_with_punit)
 		return 0;
 
-	i_dev->disable(i_dev);
+	i2c_dw_disable(i_dev);
 	i2c_dw_prepare_clk(i_dev, false);
 
 	return 0;
diff --git a/drivers/i2c/busses/i2c-designware-slave.c b/drivers/i2c/busses/i2c-designware-slave.c
index 5995361b5615..7035296aa24c 100644
--- a/drivers/i2c/busses/i2c-designware-slave.c
+++ b/drivers/i2c/busses/i2c-designware-slave.c
@@ -90,7 +90,7 @@ static int i2c_dw_unreg_slave(struct i2c_client *slave)
 	struct dw_i2c_dev *dev = i2c_get_adapdata(slave->adapter);
 
 	regmap_write(dev->map, DW_IC_INTR_MASK, 0);
-	dev->disable(dev);
+	i2c_dw_disable(dev);
 	synchronize_irq(dev->irq);
 	dev->slave = NULL;
 	pm_runtime_put(dev->dev);
@@ -237,7 +237,6 @@ int i2c_dw_probe_slave(struct dw_i2c_dev *dev)
 	int ret;
 
 	dev->init = i2c_dw_init_slave;
-	dev->disable = i2c_dw_disable;
 
 	ret = i2c_dw_init_regmap(dev);
 	if (ret)
-- 
2.43.0.rc1.1336.g36b5255a03ac


