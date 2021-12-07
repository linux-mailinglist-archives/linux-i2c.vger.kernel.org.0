Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5F3046C379
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Dec 2021 20:22:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233635AbhLGTZf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Dec 2021 14:25:35 -0500
Received: from mga11.intel.com ([192.55.52.93]:47766 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233257AbhLGTZe (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 7 Dec 2021 14:25:34 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10190"; a="235180032"
X-IronPort-AV: E=Sophos;i="5.87,295,1631602800"; 
   d="scan'208";a="235180032"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2021 11:22:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,295,1631602800"; 
   d="scan'208";a="611799724"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 07 Dec 2021 11:22:01 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id A52E91C5; Tue,  7 Dec 2021 21:22:07 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Ajay Gupta <ajayg@nvidia.com>
Subject: [PATCH v1 03/11] i2c: designware-pci: Use temporary variable for struct device
Date:   Tue,  7 Dec 2021 21:21:51 +0200
Message-Id: <20211207192159.41383-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211207192159.41383-1-andriy.shevchenko@linux.intel.com>
References: <20211207192159.41383-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Use temporary variable for struct device to make code neater.

While at it, rename variable of struct dw_i2c_dev pointer to i_dev.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-pcidrv.c | 99 +++++++++++-----------
 1 file changed, 50 insertions(+), 49 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
index 2952eca87b86..f91b352f448a 100644
--- a/drivers/i2c/busses/i2c-designware-pcidrv.c
+++ b/drivers/i2c/busses/i2c-designware-pcidrv.c
@@ -52,7 +52,7 @@ struct dw_pci_controller {
 	u32 flags;
 	struct dw_scl_sda_cfg *scl_sda_cfg;
 	int (*setup)(struct pci_dev *pdev, struct dw_pci_controller *c);
-	u32 (*get_clk_rate_khz)(struct dw_i2c_dev *dev);
+	u32 (*get_clk_rate_khz)(struct dw_i2c_dev *i_dev);
 };
 
 /* Merrifield HCNT/LCNT/SDA hold time */
@@ -88,23 +88,23 @@ static struct dw_scl_sda_cfg navi_amd_config = {
 	.sda_hold = 0x9,
 };
 
-static u32 mfld_get_clk_rate_khz(struct dw_i2c_dev *dev)
+static u32 mfld_get_clk_rate_khz(struct dw_i2c_dev *i_dev)
 {
 	return 25000;
 }
 
-static u32 navi_amd_get_clk_rate_khz(struct dw_i2c_dev *dev)
+static u32 navi_amd_get_clk_rate_khz(struct dw_i2c_dev *i_dev)
 {
 	return AMD_CLK_RATE_HZ;
 }
 
 static int mfld_setup(struct pci_dev *pdev, struct dw_pci_controller *c)
 {
-	struct dw_i2c_dev *dev = dev_get_drvdata(&pdev->dev);
+	struct dw_i2c_dev *i_dev = dev_get_drvdata(&pdev->dev);
 
 	switch (pdev->device) {
 	case 0x0817:
-		dev->timings.bus_freq_hz = I2C_MAX_STANDARD_MODE_FREQ;
+		i_dev->timings.bus_freq_hz = I2C_MAX_STANDARD_MODE_FREQ;
 		fallthrough;
 	case 0x0818:
 	case 0x0819:
@@ -121,10 +121,10 @@ static int mfld_setup(struct pci_dev *pdev, struct dw_pci_controller *c)
 
 static int navi_amd_setup(struct pci_dev *pdev, struct dw_pci_controller *c)
 {
-	struct dw_i2c_dev *dev = dev_get_drvdata(&pdev->dev);
+	struct dw_i2c_dev *i_dev = dev_get_drvdata(&pdev->dev);
 
-	dev->flags |= MODEL_AMD_NAVI_GPU;
-	dev->timings.bus_freq_hz = I2C_MAX_STANDARD_MODE_FREQ;
+	i_dev->flags |= MODEL_AMD_NAVI_GPU;
+	i_dev->timings.bus_freq_hz = I2C_MAX_STANDARD_MODE_FREQ;
 	return 0;
 }
 
@@ -216,14 +216,15 @@ static UNIVERSAL_DEV_PM_OPS(i2c_dw_pm_ops, i2c_dw_pci_suspend,
 static int i2c_dw_pci_probe(struct pci_dev *pdev,
 			    const struct pci_device_id *id)
 {
-	struct dw_i2c_dev *dev;
+	struct device *dev = &pdev->dev;
 	struct i2c_adapter *adap;
 	int r;
 	struct dw_pci_controller *controller;
 	struct dw_scl_sda_cfg *cfg;
+	struct dw_i2c_dev *i_dev;
 
 	if (id->driver_data >= ARRAY_SIZE(dw_pci_controllers)) {
-		dev_err(&pdev->dev, "%s: invalid driver data %ld\n", __func__,
+		dev_err(dev, "%s: invalid driver data %ld\n", __func__,
 			id->driver_data);
 		return -EINVAL;
 	}
@@ -232,7 +233,7 @@ static int i2c_dw_pci_probe(struct pci_dev *pdev,
 
 	r = pcim_enable_device(pdev);
 	if (r) {
-		dev_err(&pdev->dev, "Failed to enable I2C PCI device (%d)\n",
+		dev_err(dev, "Failed to enable I2C PCI device (%d)\n",
 			r);
 		return r;
 	}
@@ -241,26 +242,26 @@ static int i2c_dw_pci_probe(struct pci_dev *pdev,
 
 	r = pcim_iomap_regions(pdev, 1 << 0, pci_name(pdev));
 	if (r) {
-		dev_err(&pdev->dev, "I/O memory remapping failed\n");
+		dev_err(dev, "I/O memory remapping failed\n");
 		return r;
 	}
 
-	dev = devm_kzalloc(&pdev->dev, sizeof(struct dw_i2c_dev), GFP_KERNEL);
-	if (!dev)
+	i_dev = devm_kzalloc(dev, sizeof(*i_dev), GFP_KERNEL);
+	if (!i_dev)
 		return -ENOMEM;
 
 	r = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_ALL_TYPES);
 	if (r < 0)
 		return r;
 
-	dev->get_clk_rate_khz = controller->get_clk_rate_khz;
-	dev->timings.bus_freq_hz = I2C_MAX_FAST_MODE_FREQ;
-	dev->base = pcim_iomap_table(pdev)[0];
-	dev->dev = &pdev->dev;
-	dev->irq = pci_irq_vector(pdev, 0);
-	dev->flags |= controller->flags;
+	i_dev->get_clk_rate_khz = controller->get_clk_rate_khz;
+	i_dev->timings.bus_freq_hz = I2C_MAX_FAST_MODE_FREQ;
+	i_dev->base = pcim_iomap_table(pdev)[0];
+	i_dev->dev = dev;
+	i_dev->irq = pci_irq_vector(pdev, 0);
+	i_dev->flags |= controller->flags;
 
-	pci_set_drvdata(pdev, dev);
+	pci_set_drvdata(pdev, i_dev);
 
 	if (controller->setup) {
 		r = controller->setup(pdev, controller);
@@ -270,65 +271,65 @@ static int i2c_dw_pci_probe(struct pci_dev *pdev,
 		}
 	}
 
-	i2c_dw_adjust_bus_speed(dev);
+	i2c_dw_adjust_bus_speed(i_dev);
 
-	if (has_acpi_companion(&pdev->dev))
-		i2c_dw_acpi_configure(&pdev->dev);
+	if (has_acpi_companion(dev))
+		i2c_dw_acpi_configure(dev);
 
-	r = i2c_dw_validate_speed(dev);
+	r = i2c_dw_validate_speed(i_dev);
 	if (r) {
 		pci_free_irq_vectors(pdev);
 		return r;
 	}
 
-	i2c_dw_configure(dev);
+	i2c_dw_configure(i_dev);
 
 	if (controller->scl_sda_cfg) {
 		cfg = controller->scl_sda_cfg;
-		dev->ss_hcnt = cfg->ss_hcnt;
-		dev->fs_hcnt = cfg->fs_hcnt;
-		dev->ss_lcnt = cfg->ss_lcnt;
-		dev->fs_lcnt = cfg->fs_lcnt;
-		dev->sda_hold_time = cfg->sda_hold;
+		i_dev->ss_hcnt = cfg->ss_hcnt;
+		i_dev->fs_hcnt = cfg->fs_hcnt;
+		i_dev->ss_lcnt = cfg->ss_lcnt;
+		i_dev->fs_lcnt = cfg->fs_lcnt;
+		i_dev->sda_hold_time = cfg->sda_hold;
 	}
 
-	adap = &dev->adapter;
+	adap = &i_dev->adapter;
 	adap->owner = THIS_MODULE;
 	adap->class = 0;
-	ACPI_COMPANION_SET(&adap->dev, ACPI_COMPANION(&pdev->dev));
+	ACPI_COMPANION_SET(&adap->dev, ACPI_COMPANION(dev));
 	adap->nr = controller->bus_num;
 
-	r = i2c_dw_probe(dev);
+	r = i2c_dw_probe(i_dev);
 	if (r) {
 		pci_free_irq_vectors(pdev);
 		return r;
 	}
 
-	if ((dev->flags & MODEL_MASK) == MODEL_AMD_NAVI_GPU) {
-		dev->slave = i2c_new_ccgx_ucsi(&dev->adapter, dev->irq, NULL);
-		if (IS_ERR(dev->slave))
-			return dev_err_probe(&pdev->dev, PTR_ERR(dev->slave),
-					     "register UCSI failed\n");
+	if ((i_dev->flags & MODEL_MASK) == MODEL_AMD_NAVI_GPU) {
+		i_dev->slave = i2c_new_ccgx_ucsi(&i_dev->adapter, i_dev->irq, NULL);
+		if (IS_ERR(i_dev->slave))
+			return dev_err_probe(dev, PTR_ERR(i_dev->slave), "register UCSI failed\n");
 	}
 
-	pm_runtime_set_autosuspend_delay(&pdev->dev, 1000);
-	pm_runtime_use_autosuspend(&pdev->dev);
-	pm_runtime_put_autosuspend(&pdev->dev);
-	pm_runtime_allow(&pdev->dev);
+	pm_runtime_set_autosuspend_delay(dev, 1000);
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_put_autosuspend(dev);
+	pm_runtime_allow(dev);
 
 	return 0;
 }
 
 static void i2c_dw_pci_remove(struct pci_dev *pdev)
 {
-	struct dw_i2c_dev *dev = pci_get_drvdata(pdev);
+	struct dw_i2c_dev *i_dev = pci_get_drvdata(pdev);
+	struct device *dev = &pdev->dev;
 
-	dev->disable(dev);
-	pm_runtime_forbid(&pdev->dev);
-	pm_runtime_get_noresume(&pdev->dev);
+	i_dev->disable(i_dev);
+	pm_runtime_forbid(dev);
+	pm_runtime_get_noresume(dev);
 
-	i2c_del_adapter(&dev->adapter);
-	devm_free_irq(&pdev->dev, dev->irq, dev);
+	i2c_del_adapter(&i_dev->adapter);
+	devm_free_irq(dev, i_dev->irq, i_dev);
 	pci_free_irq_vectors(pdev);
 }
 
-- 
2.33.0

