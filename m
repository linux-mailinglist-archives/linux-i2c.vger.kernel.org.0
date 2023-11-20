Return-Path: <linux-i2c+bounces-330-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4387F1617
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Nov 2023 15:47:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 447922824F8
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Nov 2023 14:47:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DCC51D53F;
	Mon, 20 Nov 2023 14:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ce5ZtRMy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD2A9D79;
	Mon, 20 Nov 2023 06:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700491620; x=1732027620;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UX0z46Bl1SWmYK4CEEW7ztVya3qhw3HeENPzwwS/4SQ=;
  b=ce5ZtRMy0xL5eyTFBPyhkBctDmjTnMmzRDHid4W68oH+zNvkr9wYCDFh
   9snBePGcao5Vg0xofpSKj8HE/eu0A8U0PFXjoRXxnpDg+ZDhwJn1mZ7YG
   pS0f+qu93kDwvYWhszDgL1orZfInBF0N3GVtWiTYqk5OoOzhHBfpdsCP1
   n6AnZbcAFv9MZniGQi0vaQHXPPeq/UrqHxUXhhhUPZrvygiMbNL9kzyc2
   /pktXjR92cnjGTSYiuBaM998shcWioMQkpjPxwNBTNDmSEuL0sxejPNQb
   netx4JBdrbsco5eKEinWbeGTg5VMKQBqa/mQrDShVY6b2Jy0TbV0HgwWF
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="455956521"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; 
   d="scan'208";a="455956521"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 06:46:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="801193211"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; 
   d="scan'208";a="801193211"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 20 Nov 2023 06:46:53 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id EB4C666B; Mon, 20 Nov 2023 16:46:44 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Wolfram Sang <wsa@kernel.org>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v4 17/24] i2c: designware: Remove ->disable() callback
Date: Mon, 20 Nov 2023 16:41:59 +0200
Message-ID: <20231120144641.1660574-18-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
In-Reply-To: <20231120144641.1660574-1-andriy.shevchenko@linux.intel.com>
References: <20231120144641.1660574-1-andriy.shevchenko@linux.intel.com>
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
 drivers/i2c/busses/i2c-designware-common.c  | 1 +
 drivers/i2c/busses/i2c-designware-core.h    | 2 --
 drivers/i2c/busses/i2c-designware-master.c  | 1 -
 drivers/i2c/busses/i2c-designware-pcidrv.c  | 5 +++--
 drivers/i2c/busses/i2c-designware-platdrv.c | 4 ++--
 drivers/i2c/busses/i2c-designware-slave.c   | 3 +--
 6 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
index 89b8fa492e26..5b1a597cb5dd 100644
--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -711,6 +711,7 @@ void i2c_dw_disable(struct dw_i2c_dev *dev)
 
 	i2c_dw_release_lock(dev);
 }
+EXPORT_SYMBOL_GPL(i2c_dw_disable);
 
 MODULE_DESCRIPTION("Synopsys DesignWare I2C bus adapter core");
 MODULE_LICENSE("GPL");
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
index a40acc3d9288..20571812d150 100644
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


