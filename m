Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A07DE473371
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Dec 2021 19:00:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241455AbhLMSAi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 13 Dec 2021 13:00:38 -0500
Received: from mga02.intel.com ([134.134.136.20]:21961 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238569AbhLMSAe (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 13 Dec 2021 13:00:34 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="226067531"
X-IronPort-AV: E=Sophos;i="5.88,203,1635231600"; 
   d="scan'208";a="226067531"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2021 10:00:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,203,1635231600"; 
   d="scan'208";a="681722609"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 13 Dec 2021 10:00:29 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id E14D5144; Mon, 13 Dec 2021 20:00:35 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v2 1/6] i2c: designware-pci: Use temporary variable for struct device
Date:   Mon, 13 Dec 2021 20:00:29 +0200
Message-Id: <20211213180034.30929-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Use temporary variable for struct device to make code neater.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: dropped dev --> i_dev renaming (Jarkko)
 drivers/i2c/busses/i2c-designware-pcidrv.c | 52 +++++++++++-----------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
index 0f409a4c2da0..5f76010f7dfd 100644
--- a/drivers/i2c/busses/i2c-designware-pcidrv.c
+++ b/drivers/i2c/busses/i2c-designware-pcidrv.c
@@ -207,23 +207,23 @@ static struct dw_pci_controller dw_pci_controllers[] = {
 };
 
 #ifdef CONFIG_PM
-static int i2c_dw_pci_suspend(struct device *dev)
+static int i2c_dw_pci_suspend(struct device *d)
 {
-	struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
+	struct dw_i2c_dev *dev = dev_get_drvdata(d);
 
-	i_dev->suspended = true;
-	i_dev->disable(i_dev);
+	dev->suspended = true;
+	dev->disable(dev);
 
 	return 0;
 }
 
-static int i2c_dw_pci_resume(struct device *dev)
+static int i2c_dw_pci_resume(struct device *d)
 {
-	struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
+	struct dw_i2c_dev *dev = dev_get_drvdata(d);
 	int ret;
 
-	ret = i_dev->init(i_dev);
-	i_dev->suspended = false;
+	ret = dev->init(dev);
+	dev->suspended = false;
 
 	return ret;
 }
@@ -235,6 +235,7 @@ static UNIVERSAL_DEV_PM_OPS(i2c_dw_pm_ops, i2c_dw_pci_suspend,
 static int i2c_dw_pci_probe(struct pci_dev *pdev,
 			    const struct pci_device_id *id)
 {
+	struct device *d = &pdev->dev;
 	struct dw_i2c_dev *dev;
 	struct i2c_adapter *adap;
 	int r;
@@ -242,8 +243,7 @@ static int i2c_dw_pci_probe(struct pci_dev *pdev,
 	struct dw_scl_sda_cfg *cfg;
 
 	if (id->driver_data >= ARRAY_SIZE(dw_pci_controllers)) {
-		dev_err(&pdev->dev, "%s: invalid driver data %ld\n", __func__,
-			id->driver_data);
+		dev_err(d, "%s: invalid driver data %ld\n", __func__, id->driver_data);
 		return -EINVAL;
 	}
 
@@ -251,8 +251,7 @@ static int i2c_dw_pci_probe(struct pci_dev *pdev,
 
 	r = pcim_enable_device(pdev);
 	if (r) {
-		dev_err(&pdev->dev, "Failed to enable I2C PCI device (%d)\n",
-			r);
+		dev_err(d, "Failed to enable I2C PCI device (%d)\n", r);
 		return r;
 	}
 
@@ -260,11 +259,11 @@ static int i2c_dw_pci_probe(struct pci_dev *pdev,
 
 	r = pcim_iomap_regions(pdev, 1 << 0, pci_name(pdev));
 	if (r) {
-		dev_err(&pdev->dev, "I/O memory remapping failed\n");
+		dev_err(d, "I/O memory remapping failed\n");
 		return r;
 	}
 
-	dev = devm_kzalloc(&pdev->dev, sizeof(struct dw_i2c_dev), GFP_KERNEL);
+	dev = devm_kzalloc(d, sizeof(*dev), GFP_KERNEL);
 	if (!dev)
 		return -ENOMEM;
 
@@ -275,7 +274,7 @@ static int i2c_dw_pci_probe(struct pci_dev *pdev,
 	dev->get_clk_rate_khz = controller->get_clk_rate_khz;
 	dev->timings.bus_freq_hz = I2C_MAX_FAST_MODE_FREQ;
 	dev->base = pcim_iomap_table(pdev)[0];
-	dev->dev = &pdev->dev;
+	dev->dev = d;
 	dev->irq = pci_irq_vector(pdev, 0);
 	dev->flags |= controller->flags;
 
@@ -291,8 +290,8 @@ static int i2c_dw_pci_probe(struct pci_dev *pdev,
 
 	i2c_dw_adjust_bus_speed(dev);
 
-	if (has_acpi_companion(&pdev->dev))
-		i2c_dw_acpi_configure(&pdev->dev);
+	if (has_acpi_companion(d))
+		i2c_dw_acpi_configure(d);
 
 	r = i2c_dw_validate_speed(dev);
 	if (r) {
@@ -314,7 +313,7 @@ static int i2c_dw_pci_probe(struct pci_dev *pdev,
 	adap = &dev->adapter;
 	adap->owner = THIS_MODULE;
 	adap->class = 0;
-	ACPI_COMPANION_SET(&adap->dev, ACPI_COMPANION(&pdev->dev));
+	ACPI_COMPANION_SET(&adap->dev, ACPI_COMPANION(d));
 	adap->nr = controller->bus_num;
 
 	r = i2c_dw_probe(dev);
@@ -326,15 +325,15 @@ static int i2c_dw_pci_probe(struct pci_dev *pdev,
 	if ((dev->flags & MODEL_MASK) == MODEL_AMD_NAVI_GPU) {
 		r = navi_amd_register_client(dev);
 		if (r) {
-			dev_err(dev->dev, "register client failed with %d\n", r);
+			dev_err(d, "register client failed with %d\n", r);
 			return r;
 		}
 	}
 
-	pm_runtime_set_autosuspend_delay(&pdev->dev, 1000);
-	pm_runtime_use_autosuspend(&pdev->dev);
-	pm_runtime_put_autosuspend(&pdev->dev);
-	pm_runtime_allow(&pdev->dev);
+	pm_runtime_set_autosuspend_delay(d, 1000);
+	pm_runtime_use_autosuspend(d);
+	pm_runtime_put_autosuspend(d);
+	pm_runtime_allow(d);
 
 	return 0;
 }
@@ -342,13 +341,14 @@ static int i2c_dw_pci_probe(struct pci_dev *pdev,
 static void i2c_dw_pci_remove(struct pci_dev *pdev)
 {
 	struct dw_i2c_dev *dev = pci_get_drvdata(pdev);
+	struct device *d = &pdev->dev;
 
 	dev->disable(dev);
-	pm_runtime_forbid(&pdev->dev);
-	pm_runtime_get_noresume(&pdev->dev);
+	pm_runtime_forbid(d);
+	pm_runtime_get_noresume(d);
 
 	i2c_del_adapter(&dev->adapter);
-	devm_free_irq(&pdev->dev, dev->irq, dev);
+	devm_free_irq(d, dev->irq, dev);
 	pci_free_irq_vectors(pdev);
 }
 
-- 
2.33.0

