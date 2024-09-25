Return-Path: <linux-i2c+bounces-6992-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B081298604D
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Sep 2024 16:19:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3BAE81F26803
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Sep 2024 14:19:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F4DA19F473;
	Wed, 25 Sep 2024 12:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J4g5KDA3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7531A01C6;
	Wed, 25 Sep 2024 12:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727268569; cv=none; b=kY1K5LGpyobmi5JGu9UIheP7u89ozePOft4MxlTqP8IM+enhCb1FmIJkuK3SaOmAOtlEbmuI+dL2XUAPcoKdY/p7pi4gs2npITnM29/XGyn6nK4/zS2vL4ngGpgbjHX4LIggUpb9An4wTy9tHJ7AZI+9N3+BAE+/C+4QMouP7pY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727268569; c=relaxed/simple;
	bh=LFjwnhTyAbIo1KKyGMp8jpEjC4AjTZYnoigdh3c5MUY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nQxaNY2wvwLPH3Je+2JLmVZg92qKsPGtfo8nulJiD3tTKfI9IJtcpx+MfR3Oyf76h/gq+aaVCBQzO+3/wkzu8FWzpNy7kfZR6RGxlNOQJKx9tI/qjoQQLyeK/NUmlIU0gzB2ppytpgZsFEEL7ZkhxWZrqp11wODVN4NhJ14A4pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J4g5KDA3; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727268566; x=1758804566;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LFjwnhTyAbIo1KKyGMp8jpEjC4AjTZYnoigdh3c5MUY=;
  b=J4g5KDA3i1YK8i0cMQj/MAwc7tadK/MxECMlWBa3BAkN1r5UuQ10D3KV
   RzUCHa96h/m3T6tLLb5x1JTZhEYh3M3K20N97yTQASy5iUSk6l4sSZ0ve
   s8ywnQrQX1sLuJmebin1HlW2HI/Oy0SnuXCsb0urFHtL+el03ZpnDcvSL
   FlnPsl1oZdcokK8EuOp6IPGYZktWHjuj4iVnG1Bba4F1OELZge4N3T+gt
   hmEoa/VNi4pB1MaC5K+7A7HRrMMXUlB6lt/xJZlY0P4ATxhj9erjJ6klt
   sobYHkaOy5ssid/o0frOqBdzPSkeE5qSSdnAEJFtn0zyRKTrh85SghEDJ
   A==;
X-CSE-ConnectionGUID: PmcskdtbS9a6CHg7NCN0dQ==
X-CSE-MsgGUID: 9TTHPTytRe21FS151CKbLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="36878373"
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; 
   d="scan'208";a="36878373"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 05:49:21 -0700
X-CSE-ConnectionGUID: UIlv9BReRSizonPprhY3cA==
X-CSE-MsgGUID: jiDsDSyGQu+rzbLAPxRFjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; 
   d="scan'208";a="72577340"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa008.jf.intel.com with ESMTP; 25 Sep 2024 05:49:18 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 9837A192; Wed, 25 Sep 2024 15:49:17 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Narasimhan.V@amd.com,
	Borislav Petkov <bp@alien8.de>,
	Kim Phillips <kim.phillips@amd.com>
Subject: [PATCH v1 1/5] i2c: designware: Use temporary variable for struct device
Date: Wed, 25 Sep 2024 15:44:19 +0300
Message-ID: <20240925124916.976173-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20240925124916.976173-1-andriy.shevchenko@linux.intel.com>
References: <20240925124916.976173-1-andriy.shevchenko@linux.intel.com>
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
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-pcidrv.c  | 29 ++++++-------
 drivers/i2c/busses/i2c-designware-platdrv.c | 48 ++++++++++-----------
 2 files changed, 37 insertions(+), 40 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
index 7b2c5d71a7fc..433cb285d3b2 100644
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
@@ -296,11 +294,12 @@ static int i2c_dw_pci_probe(struct pci_dev *pdev,
 static void i2c_dw_pci_remove(struct pci_dev *pdev)
 {
 	struct dw_i2c_dev *dev = pci_get_drvdata(pdev);
+	struct device *device = &pdev->dev;
 
 	i2c_dw_disable(dev);
 
-	pm_runtime_forbid(&pdev->dev);
-	pm_runtime_get_noresume(&pdev->dev);
+	pm_runtime_forbid(device);
+	pm_runtime_get_noresume(device);
 
 	i2c_del_adapter(&dev->adapter);
 }
diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 2d0c7348e491..a3e86930bf41 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -205,6 +205,7 @@ static void i2c_dw_remove_lock_support(struct dw_i2c_dev *dev)
 
 static int dw_i2c_plat_probe(struct platform_device *pdev)
 {
+	struct device *device = &pdev->dev;
 	struct i2c_adapter *adap;
 	struct dw_i2c_dev *dev;
 	int irq, ret;
@@ -213,15 +214,15 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
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
 		dev->flags = MODEL_WANGXUN_SP | ACCESS_POLLING;
 
-	dev->dev = &pdev->dev;
+	dev->dev = device;
 	dev->irq = irq;
 	platform_set_drvdata(pdev, dev);
 
@@ -229,7 +230,7 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	dev->rst = devm_reset_control_get_optional_exclusive(&pdev->dev, NULL);
+	dev->rst = devm_reset_control_get_optional_exclusive(device, NULL);
 	if (IS_ERR(dev->rst))
 		return PTR_ERR(dev->rst);
 
@@ -246,13 +247,13 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 	i2c_dw_configure(dev);
 
 	/* Optional interface clock */
-	dev->pclk = devm_clk_get_optional(&pdev->dev, "pclk");
+	dev->pclk = devm_clk_get_optional(device, "pclk");
 	if (IS_ERR(dev->pclk)) {
 		ret = PTR_ERR(dev->pclk);
 		goto exit_reset;
 	}
 
-	dev->clk = devm_clk_get_optional(&pdev->dev, NULL);
+	dev->clk = devm_clk_get_optional(device, NULL);
 	if (IS_ERR(dev->clk)) {
 		ret = PTR_ERR(dev->clk);
 		goto exit_reset;
@@ -280,28 +281,24 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
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
 
 	if (dev->shared_with_punit)
-		pm_runtime_get_noresume(&pdev->dev);
+		pm_runtime_get_noresume(device);
 
-	pm_runtime_enable(&pdev->dev);
+	pm_runtime_enable(device);
 
 	ret = i2c_dw_probe(dev);
 	if (ret)
@@ -319,15 +316,16 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 static void dw_i2c_plat_remove(struct platform_device *pdev)
 {
 	struct dw_i2c_dev *dev = platform_get_drvdata(pdev);
+	struct device *device = &pdev->dev;
 
-	pm_runtime_get_sync(&pdev->dev);
+	pm_runtime_get_sync(device);
 
 	i2c_del_adapter(&dev->adapter);
 
 	i2c_dw_disable(dev);
 
-	pm_runtime_dont_use_autosuspend(&pdev->dev);
-	pm_runtime_put_sync(&pdev->dev);
+	pm_runtime_dont_use_autosuspend(device);
+	pm_runtime_put_sync(device);
 	dw_i2c_plat_pm_cleanup(dev);
 
 	i2c_dw_remove_lock_support(dev);
-- 
2.43.0.rc1.1336.g36b5255a03ac


