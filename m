Return-Path: <linux-i2c+bounces-22-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2917E8198
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Nov 2023 19:30:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5A604B209B7
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Nov 2023 18:30:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC9173A28F;
	Fri, 10 Nov 2023 18:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cEbb/LvB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6CFA3A299
	for <linux-i2c@vger.kernel.org>; Fri, 10 Nov 2023 18:30:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE1DB114F14;
	Fri, 10 Nov 2023 10:30:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699641005; x=1731177005;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=B3CkUjJAuKNPK59JWl+dYcVt5eqY8CuXnEh/dYaOvzk=;
  b=cEbb/LvBPkeB+wP1AVReeFB5MiMp8Q/mVRdWa6cWInhQQR96HrCjcSS8
   FFHbD7a4dPKu4EktihLKUqxQVojUc1m3ZUx+Ky36IZMCQotvasn6Jp6w6
   oK5NbEycX66QvTukpI7NQsizrYuwtG3bnECUNLZwq3UQbrT5iivwShhGA
   DDFgM9GU+3o5f+YUK6A/UNoKQO8BM9y2hbOXp33FzxUjdfztY20jQFUu0
   fGaU4sinatqcsAgnGSP+7rJ/oFLb3YQ2oFLmPOxMT36KfvvTGo3UovwH5
   PU6UUpGgHnWqSdEgZ1fegPmSPZlSa2s8UBKh7k1aGWm1VZHVTfwn5Flsg
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="380606842"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="380606842"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 10:29:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="792912160"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="792912160"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga008.jf.intel.com with ESMTP; 10 Nov 2023 10:29:36 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 247D876F; Fri, 10 Nov 2023 20:23:08 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Wolfram Sang <wsa@kernel.org>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v3 18/25] i2c: designware: Remove ->disable() callback
Date: Fri, 10 Nov 2023 20:11:38 +0200
Message-ID: <20231110182304.3894319-19-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
In-Reply-To: <20231110182304.3894319-1-andriy.shevchenko@linux.intel.com>
References: <20231110182304.3894319-1-andriy.shevchenko@linux.intel.com>
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

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-core.h    | 2 --
 drivers/i2c/busses/i2c-designware-master.c  | 1 -
 drivers/i2c/busses/i2c-designware-pcidrv.c  | 4 ++--
 drivers/i2c/busses/i2c-designware-platdrv.c | 4 ++--
 drivers/i2c/busses/i2c-designware-slave.c   | 3 +--
 5 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index 22477143bb98..52667d670363 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -238,7 +238,6 @@ struct i2c_dw_semaphore_callbacks;
  * @semaphore_idx: Index of table with semaphore type attached to the bus. It's
  *	-1 if there is no semaphore.
  * @shared_with_punit: true if this bus is shared with the SoCs PUNIT
- * @disable: function to disable the controller
  * @init: function to initialize the I2C hardware
  * @set_sda_hold_time: callback to retrieve IP specific SDA hold timing
  * @mode: operation mode - DW_IC_MASTER or DW_IC_SLAVE
@@ -295,7 +294,6 @@ struct dw_i2c_dev {
 	void			(*release_lock)(void);
 	const struct i2c_dw_semaphore_callbacks *semaphore_cb;
 	bool			shared_with_punit;
-	void			(*disable)(struct dw_i2c_dev *dev);
 	int			(*init)(struct dw_i2c_dev *dev);
 	int			(*set_sda_hold_time)(struct dw_i2c_dev *dev);
 	int			mode;
diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index 0b6576d7f811..bd3c8db521de 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -990,7 +990,6 @@ int i2c_dw_probe_master(struct dw_i2c_dev *dev)
 	init_completion(&dev->cmd_complete);
 
 	dev->init = i2c_dw_init_master;
-	dev->disable = i2c_dw_disable;
 
 	ret = i2c_dw_init_regmap(dev);
 	if (ret)
diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
index 93a117d295d7..6fd4a3d8764a 100644
--- a/drivers/i2c/busses/i2c-designware-pcidrv.c
+++ b/drivers/i2c/busses/i2c-designware-pcidrv.c
@@ -198,7 +198,7 @@ static int __maybe_unused i2c_dw_pci_runtime_suspend(struct device *dev)
 {
 	struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
 
-	i_dev->disable(i_dev);
+	i2c_dw_disable(i_dev);
 	return 0;
 }
 
@@ -341,7 +341,7 @@ static void i2c_dw_pci_remove(struct pci_dev *pdev)
 
 	i2c_del_adapter(&dev->adapter);
 
-	dev->disable(dev);
+	i2c_dw_disable(dev);
 
 	pm_runtime_forbid(&pdev->dev);
 	pm_runtime_get_noresume(&pdev->dev);
diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 6b1a26afc278..9b249d27841d 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -343,7 +343,7 @@ static void dw_i2c_plat_remove(struct platform_device *pdev)
 
 	i2c_del_adapter(&dev->adapter);
 
-	dev->disable(dev);
+	i2c_dw_disable(dev);
 
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	pm_runtime_put_sync(&pdev->dev);
@@ -367,7 +367,7 @@ static int dw_i2c_plat_runtime_suspend(struct device *dev)
 	if (i_dev->shared_with_punit)
 		return 0;
 
-	i_dev->disable(i_dev);
+	i2c_dw_disable(i_dev);
 	i2c_dw_prepare_clk(i_dev, false);
 
 	return 0;
diff --git a/drivers/i2c/busses/i2c-designware-slave.c b/drivers/i2c/busses/i2c-designware-slave.c
index 70d183fa3bff..5abd5ec41954 100644
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
2.43.0.rc1.1.gbec44491f096


