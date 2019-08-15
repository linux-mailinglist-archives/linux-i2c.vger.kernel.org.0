Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8CDF8EE29
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Aug 2019 16:30:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731030AbfHOOaA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 15 Aug 2019 10:30:00 -0400
Received: from mga01.intel.com ([192.55.52.88]:3187 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730452AbfHOO37 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 15 Aug 2019 10:29:59 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 15 Aug 2019 07:29:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,389,1559545200"; 
   d="scan'208";a="194775087"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.55])
  by fmsmga001.fm.intel.com with ESMTP; 15 Aug 2019 07:29:46 -0700
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH 1/2] i2c: designware: pci: Switch over to MSI interrupts
Date:   Thu, 15 Aug 2019 17:29:43 +0300
Message-Id: <20190815142944.18334-1-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.23.0.rc1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Felipe Balbi <felipe.balbi@linux.intel.com>

Some devices support MSI interrupts. Let's at least try to use them in
platforms that provide MSI capability.

Signed-off-by: Felipe Balbi <felipe.balbi@linux.intel.com>
Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-pcidrv.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
index 7d2e6959679c..249ee3ee2a09 100644
--- a/drivers/i2c/busses/i2c-designware-pcidrv.c
+++ b/drivers/i2c/busses/i2c-designware-pcidrv.c
@@ -225,6 +225,8 @@ static int i2c_dw_pci_probe(struct pci_dev *pdev,
 		return r;
 	}
 
+	pci_set_master(pdev);
+
 	r = pcim_iomap_regions(pdev, 1 << 0, pci_name(pdev));
 	if (r) {
 		dev_err(&pdev->dev, "I/O memory remapping failed\n");
@@ -235,18 +237,24 @@ static int i2c_dw_pci_probe(struct pci_dev *pdev,
 	if (!dev)
 		return -ENOMEM;
 
+	r = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_ALL_TYPES);
+	if (r < 0)
+		return r;
+
 	dev->clk = NULL;
 	dev->controller = controller;
 	dev->get_clk_rate_khz = i2c_dw_get_clk_rate_khz;
 	dev->base = pcim_iomap_table(pdev)[0];
 	dev->dev = &pdev->dev;
-	dev->irq = pdev->irq;
+	dev->irq = pci_irq_vector(pdev, 0);
 	dev->flags |= controller->flags;
 
 	if (controller->setup) {
 		r = controller->setup(pdev, controller);
-		if (r)
+		if (r) {
+			pci_free_irq_vectors(pdev);
 			return r;
+		}
 	}
 
 	dev->functionality = controller->functionality |
@@ -274,8 +282,10 @@ static int i2c_dw_pci_probe(struct pci_dev *pdev,
 	adap->nr = controller->bus_num;
 
 	r = i2c_dw_probe(dev);
-	if (r)
+	if (r) {
+		pci_free_irq_vectors(pdev);
 		return r;
+	}
 
 	pm_runtime_set_autosuspend_delay(&pdev->dev, 1000);
 	pm_runtime_use_autosuspend(&pdev->dev);
@@ -294,6 +304,7 @@ static void i2c_dw_pci_remove(struct pci_dev *pdev)
 	pm_runtime_get_noresume(&pdev->dev);
 
 	i2c_del_adapter(&dev->adapter);
+	pci_free_irq_vectors(pdev);
 }
 
 /* work with hotplug and coldplug */
-- 
2.23.0.rc1

