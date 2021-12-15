Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF5DD475B8A
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Dec 2021 16:13:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243804AbhLOPMU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Dec 2021 10:12:20 -0500
Received: from mga18.intel.com ([134.134.136.126]:62944 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243816AbhLOPMT (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 15 Dec 2021 10:12:19 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10198"; a="226104886"
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; 
   d="scan'208";a="226104886"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2021 07:12:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; 
   d="scan'208";a="518801202"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.88])
  by orsmga008.jf.intel.com with ESMTP; 15 Dec 2021 07:12:17 -0800
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH 6/6] i2c: designware-pci: Convert to use dev_err_probe()
Date:   Wed, 15 Dec 2021 17:12:05 +0200
Message-Id: <20211215151205.584264-6-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211215151205.584264-1-jarkko.nikula@linux.intel.com>
References: <20211215151205.584264-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

It's fine to call dev_err_probe() in ->probe() when error code is known.
Convert the driver to use dev_err_probe().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
Jarkko: In my opinion this was worth to take before cleanups so hand
edited to apply to current code. I split the dev_err_probe() lines
to have device pointer and error code in the first line and printable
string in the next for shorter lines.
While at it, change "invalid" -> "Invalid" (was before Andy's change).
---
 drivers/i2c/busses/i2c-designware-pcidrv.c | 24 +++++++++-------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
index 855ea666029f..6fde58878aa6 100644
--- a/drivers/i2c/busses/i2c-designware-pcidrv.c
+++ b/drivers/i2c/busses/i2c-designware-pcidrv.c
@@ -246,28 +246,24 @@ static int i2c_dw_pci_probe(struct pci_dev *pdev,
 	struct dw_pci_controller *controller;
 	struct dw_scl_sda_cfg *cfg;
 
-	if (id->driver_data >= ARRAY_SIZE(dw_pci_controllers)) {
-		dev_err(&pdev->dev, "%s: invalid driver data %ld\n", __func__,
-			id->driver_data);
-		return -EINVAL;
-	}
+	if (id->driver_data >= ARRAY_SIZE(dw_pci_controllers))
+		return dev_err_probe(&pdev->dev, -EINVAL,
+				     "Invalid driver data %ld\n",
+				     id->driver_data);
 
 	controller = &dw_pci_controllers[id->driver_data];
 
 	r = pcim_enable_device(pdev);
-	if (r) {
-		dev_err(&pdev->dev, "Failed to enable I2C PCI device (%d)\n",
-			r);
-		return r;
-	}
+	if (r)
+		return dev_err_probe(&pdev->dev, r,
+				     "Failed to enable I2C PCI device\n");
 
 	pci_set_master(pdev);
 
 	r = pcim_iomap_regions(pdev, 1 << 0, pci_name(pdev));
-	if (r) {
-		dev_err(&pdev->dev, "I/O memory remapping failed\n");
-		return r;
-	}
+	if (r)
+		return dev_err_probe(&pdev->dev, r,
+				     "I/O memory remapping failed\n");
 
 	dev = devm_kzalloc(&pdev->dev, sizeof(struct dw_i2c_dev), GFP_KERNEL);
 	if (!dev)
-- 
2.34.1

