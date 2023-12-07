Return-Path: <linux-i2c+bounces-669-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BEFBF808A33
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Dec 2023 15:17:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 23D96B21656
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Dec 2023 14:17:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBEF24186A;
	Thu,  7 Dec 2023 14:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y6YPInt6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 380AA10EC;
	Thu,  7 Dec 2023 06:17:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701958643; x=1733494643;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=P02YKb/4uuUGdgRNL5o+5KhiYwRWoXH25/Fpf250iso=;
  b=Y6YPInt6EulXHZArto4kYjKWEyT5Btd7z+dK6IkiUIMJ9FMpDJSxvRPj
   H9Y9O1Oxf+4LbBw95T9EUExMktigdPya+BIxiZ6jOS5/yj0QJgqNsvWvM
   puXeUhTyRgQMOXhU0ZO+BPx32IDexm+CAcoc29TTHPWGx+XHNwttIaj3c
   CclndW3slcN7umdUNCyIfPv7YlpnV+nEaIXYfsgMMDL0tX/BZG7KCipbQ
   6fKtEt0PJbwRm2503XSq+eDE4+fJutqq/Rv1Lg4afEp5fV1iBOW4snb3P
   iTfaE20GmjS3+3ogkkHyNa8tsIQep7UTaozlGSnGtFc58n2oxnm4SDYQF
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="460726213"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="460726213"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 06:17:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="889756106"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="889756106"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 07 Dec 2023 06:17:11 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 7A9215EE; Thu,  7 Dec 2023 16:17:03 +0200 (EET)
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
Subject: [PATCH v5 22/24] i2c: designware: Use temporary variable for struct device
Date: Thu,  7 Dec 2023 16:14:02 +0200
Message-ID: <20231207141653.2785124-23-andriy.shevchenko@linux.intel.com>
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

Use temporary variable for struct device to make code neater.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
Tested-by: Serge Semin <fancer.lancer@gmail.com>
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Link: https://lore.kernel.org/r/20231120144641.1660574-23-andriy.shevchenko@linux.intel.com
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-pcidrv.c  | 24 +++++++-------
 drivers/i2c/busses/i2c-designware-platdrv.c | 35 ++++++++++-----------
 2 files changed, 27 insertions(+), 32 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
index 211d8279b05e..1408fd22d398 100644
--- a/drivers/i2c/busses/i2c-designware-pcidrv.c
+++ b/drivers/i2c/busses/i2c-designware-pcidrv.c
@@ -207,6 +207,7 @@ static const struct software_node dgpu_node = {
 static int i2c_dw_pci_probe(struct pci_dev *pdev,
 			    const struct pci_device_id *id)
 {
+	struct device *device = &pdev->dev;
 	struct dw_i2c_dev *dev;
 	struct i2c_adapter *adap;
 	int r;
@@ -214,25 +215,22 @@ static int i2c_dw_pci_probe(struct pci_dev *pdev,
 	struct dw_scl_sda_cfg *cfg;
 
 	if (id->driver_data >= ARRAY_SIZE(dw_pci_controllers))
-		return dev_err_probe(&pdev->dev, -EINVAL,
-				     "Invalid driver data %ld\n",
+		return dev_err_probe(device, -EINVAL, "Invalid driver data %ld\n",
 				     id->driver_data);
 
 	controller = &dw_pci_controllers[id->driver_data];
 
 	r = pcim_enable_device(pdev);
 	if (r)
-		return dev_err_probe(&pdev->dev, r,
-				     "Failed to enable I2C PCI device\n");
+		return dev_err_probe(device, r, "Failed to enable I2C PCI device\n");
 
 	pci_set_master(pdev);
 
 	r = pcim_iomap_regions(pdev, 1 << 0, pci_name(pdev));
 	if (r)
-		return dev_err_probe(&pdev->dev, r,
-				     "I/O memory remapping failed\n");
+		return dev_err_probe(device, r, "I/O memory remapping failed\n");
 
-	dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
+	dev = devm_kzalloc(device, sizeof(*dev), GFP_KERNEL);
 	if (!dev)
 		return -ENOMEM;
 
@@ -242,7 +240,7 @@ static int i2c_dw_pci_probe(struct pci_dev *pdev,
 
 	dev->get_clk_rate_khz = controller->get_clk_rate_khz;
 	dev->base = pcim_iomap_table(pdev)[0];
-	dev->dev = &pdev->dev;
+	dev->dev = device;
 	dev->irq = pci_irq_vector(pdev, 0);
 	dev->flags |= controller->flags;
 
@@ -281,14 +279,14 @@ static int i2c_dw_pci_probe(struct pci_dev *pdev,
 	if ((dev->flags & MODEL_MASK) == MODEL_AMD_NAVI_GPU) {
 		dev->slave = i2c_new_ccgx_ucsi(&dev->adapter, dev->irq, &dgpu_node);
 		if (IS_ERR(dev->slave))
-			return dev_err_probe(dev->dev, PTR_ERR(dev->slave),
+			return dev_err_probe(device, PTR_ERR(dev->slave),
 					     "register UCSI failed\n");
 	}
 
-	pm_runtime_set_autosuspend_delay(&pdev->dev, 1000);
-	pm_runtime_use_autosuspend(&pdev->dev);
-	pm_runtime_put_autosuspend(&pdev->dev);
-	pm_runtime_allow(&pdev->dev);
+	pm_runtime_set_autosuspend_delay(device, 1000);
+	pm_runtime_use_autosuspend(device);
+	pm_runtime_put_autosuspend(device);
+	pm_runtime_allow(device);
 
 	return 0;
 }
diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 1b76f721bf81..02dc1d1001f2 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -237,6 +237,7 @@ static int dw_i2c_plat_get_reset(struct dw_i2c_dev *dev)
 
 static int dw_i2c_plat_probe(struct platform_device *pdev)
 {
+	struct device *device = &pdev->dev;
 	struct i2c_adapter *adap;
 	struct dw_i2c_dev *dev;
 	int irq, ret;
@@ -245,15 +246,15 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 
-	dev = devm_kzalloc(&pdev->dev, sizeof(struct dw_i2c_dev), GFP_KERNEL);
+	dev = devm_kzalloc(device, sizeof(*dev), GFP_KERNEL);
 	if (!dev)
 		return -ENOMEM;
 
-	dev->flags = (uintptr_t)device_get_match_data(&pdev->dev);
-	if (device_property_present(&pdev->dev, "wx,i2c-snps-model"))
+	dev->flags = (uintptr_t)device_get_match_data(device);
+	if (device_property_present(device, "wx,i2c-snps-model"))
 		dev->flags = MODEL_WANGXUN_SP;
 
-	dev->dev = &pdev->dev;
+	dev->dev = device;
 	dev->irq = irq;
 	platform_set_drvdata(pdev, dev);
 
@@ -276,11 +277,11 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 	i2c_dw_configure(dev);
 
 	/* Optional interface clock */
-	dev->pclk = devm_clk_get_optional(&pdev->dev, "pclk");
+	dev->pclk = devm_clk_get_optional(device, "pclk");
 	if (IS_ERR(dev->pclk))
 		return PTR_ERR(dev->pclk);
 
-	dev->clk = devm_clk_get_optional(&pdev->dev, NULL);
+	dev->clk = devm_clk_get_optional(device, NULL);
 	if (IS_ERR(dev->clk))
 		return PTR_ERR(dev->clk);
 
@@ -306,23 +307,19 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 					I2C_CLASS_HWMON : I2C_CLASS_DEPRECATED;
 	adap->nr = -1;
 
-	if (dev->flags & ACCESS_NO_IRQ_SUSPEND) {
-		dev_pm_set_driver_flags(&pdev->dev,
-					DPM_FLAG_SMART_PREPARE);
-	} else {
-		dev_pm_set_driver_flags(&pdev->dev,
-					DPM_FLAG_SMART_PREPARE |
-					DPM_FLAG_SMART_SUSPEND);
-	}
+	if (dev->flags & ACCESS_NO_IRQ_SUSPEND)
+		dev_pm_set_driver_flags(device, DPM_FLAG_SMART_PREPARE);
+	else
+		dev_pm_set_driver_flags(device, DPM_FLAG_SMART_PREPARE | DPM_FLAG_SMART_SUSPEND);
 
-	device_enable_async_suspend(&pdev->dev);
+	device_enable_async_suspend(device);
 
 	/* The code below assumes runtime PM to be disabled. */
-	WARN_ON(pm_runtime_enabled(&pdev->dev));
+	WARN_ON(pm_runtime_enabled(device));
 
-	pm_runtime_set_autosuspend_delay(&pdev->dev, 1000);
-	pm_runtime_use_autosuspend(&pdev->dev);
-	pm_runtime_set_active(&pdev->dev);
+	pm_runtime_set_autosuspend_delay(device, 1000);
+	pm_runtime_use_autosuspend(device);
+	pm_runtime_set_active(device);
 
 	ret = dw_i2c_plat_pm_setup(dev);
 	if (ret)
-- 
2.43.0.rc1.1.gbec44491f096


