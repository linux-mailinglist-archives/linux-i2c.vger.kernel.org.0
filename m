Return-Path: <linux-i2c+bounces-323-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 539D57F160D
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Nov 2023 15:47:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 089C2282478
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Nov 2023 14:47:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A11461CFA4;
	Mon, 20 Nov 2023 14:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ebtP7/ue"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A6E2D58;
	Mon, 20 Nov 2023 06:46:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700491618; x=1732027618;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OFonFVDQoahtw8qY4zQOdjieniDowfyGSiS8sMAPXkM=;
  b=ebtP7/uez8l2fBMqHKgyczkv459uVKvSDfi19aEz+vvB2XCRpSOPbwzA
   0QLNjkocEDvyLxu3gFBD8I+aQvpllpAW+cFpho1t/JMBUnG2bgPwJY/d6
   zj4Irgm7jvRWsciWXLSiSYtmAzmvP0NpuiU05izDN+V9iLdmALBI+8Wmw
   K3k1EvBCXoLYB8rS/RRJSAW8YlfN+wdnWkszwVr+wAVqh6JG56aXHDjFn
   DPyjdNX6dPxkEK8c9XYX+bIia7XJgz4wb9mutR23rXbH2qNIJkR7DUPBZ
   zVUvsqS4aWHF0CdYcrPDBLY6p4W2slflIrG7xZ9kG1ZFDWxRK5tBrS1GA
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="382017076"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; 
   d="scan'208";a="382017076"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 06:46:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="832291655"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; 
   d="scan'208";a="832291655"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 20 Nov 2023 06:46:54 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 3D4A464E; Mon, 20 Nov 2023 16:46:45 +0200 (EET)
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
Subject: [PATCH v4 22/24] i2c: designware: Use temporary variable for struct device
Date: Mon, 20 Nov 2023 16:42:04 +0200
Message-ID: <20231120144641.1660574-23-andriy.shevchenko@linux.intel.com>
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

Use temporary variable for struct device to make code neater.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
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


