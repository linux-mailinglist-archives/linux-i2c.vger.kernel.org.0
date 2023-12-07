Return-Path: <linux-i2c+bounces-664-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 682AF808A21
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Dec 2023 15:17:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 87D0E1C209B7
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Dec 2023 14:17:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9375A41C69;
	Thu,  7 Dec 2023 14:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J7Be8VLv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3308E1725;
	Thu,  7 Dec 2023 06:17:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701958638; x=1733494638;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fls2pGV5/CANEYagjwcIIhHdkS/3ZVkHfy5tbawqAgg=;
  b=J7Be8VLvYx4zEwgOOiYmI4VoWbLPCU6c6B6HsVnTRG+7K855SNkHSvho
   ZmCXAiT/vak8VZdpbQu36iBsf6zqSw89Lhz6ojTpWMY1+xvrO+AQMLCc5
   26jBAF+bXCKM7XJudqA0ZE70t9i1cCZO5nw9um8YLDAlqtjr7JdFKAtUZ
   vHWvWrza79v2bzdE68qZ/E/UseHWo2a51eU41TZ+KPlDOV8D7H8LKb41r
   3ea5eealAB75bgV5MEwaPjdYYHggprJwppXHcCYyuPAnDKce4vD4YCp7H
   qpfAeqbsmCyCh3xU/Y2Fk+gsSoh9lPETPj8slZEVWik29Gy0L78BUAxye
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="460726174"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="460726174"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 06:17:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="889756100"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="889756100"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 07 Dec 2023 06:17:11 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 413A6BDE; Thu,  7 Dec 2023 16:17:03 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Wolfram Sang <wsa@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Serge Semin <fancer.lancer@gmail.com>
Subject: [PATCH v5 17/24] i2c: designware: Remove ->disable() callback
Date: Thu,  7 Dec 2023 16:13:57 +0200
Message-ID: <20231207141653.2785124-18-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
In-Reply-To: <20231207141653.2785124-1-andriy.shevchenko@linux.intel.com>
References: <20231207141653.2785124-1-andriy.shevchenko@linux.intel.com>
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
Tested-by: Serge Semin <fancer.lancer@gmail.com>
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Link: https://lore.kernel.org/r/20231120144641.1660574-18-andriy.shevchenko@linux.intel.com
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


