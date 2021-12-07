Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9C7946C382
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Dec 2021 20:22:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240952AbhLGTZl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Dec 2021 14:25:41 -0500
Received: from mga09.intel.com ([134.134.136.24]:2078 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240957AbhLGTZk (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 7 Dec 2021 14:25:40 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10190"; a="237474909"
X-IronPort-AV: E=Sophos;i="5.87,295,1631602800"; 
   d="scan'208";a="237474909"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2021 11:22:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,295,1631602800"; 
   d="scan'208";a="600287752"
Received: from black.fi.intel.com ([10.237.72.28])
  by FMSMGA003.fm.intel.com with ESMTP; 07 Dec 2021 11:22:01 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 9B0FB109; Tue,  7 Dec 2021 21:22:07 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Ajay Gupta <ajayg@nvidia.com>
Subject: [PATCH v1 02/11] i2c: designware-pci: Switch to use i2c_new_ccgx_ucsi()
Date:   Tue,  7 Dec 2021 21:21:50 +0200
Message-Id: <20211207192159.41383-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211207192159.41383-1-andriy.shevchenko@linux.intel.com>
References: <20211207192159.41383-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Instead of open coded variant switch to use i2c_new_ccgx_ucsi().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/Kconfig                 |  1 +
 drivers/i2c/busses/i2c-designware-pcidrv.c | 30 ++++------------------
 2 files changed, 6 insertions(+), 25 deletions(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 0fb2caf7498c..451ddec12dba 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -577,6 +577,7 @@ config I2C_DESIGNWARE_PCI
 	tristate "Synopsys DesignWare PCI"
 	depends on PCI
 	select I2C_DESIGNWARE_CORE
+	select I2C_CCGX_UCSI
 	help
 	  If you say yes to this option, support will be included for the
 	  Synopsys DesignWare I2C adapter. Only master mode is supported.
diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
index 0f409a4c2da0..2952eca87b86 100644
--- a/drivers/i2c/busses/i2c-designware-pcidrv.c
+++ b/drivers/i2c/busses/i2c-designware-pcidrv.c
@@ -24,6 +24,7 @@
 #include <linux/slab.h>
 
 #include "i2c-designware-core.h"
+#include "i2c-ccgx-ucsi.h"
 
 #define DRIVER_NAME "i2c-designware-pci"
 #define AMD_CLK_RATE_HZ	100000
@@ -118,26 +119,6 @@ static int mfld_setup(struct pci_dev *pdev, struct dw_pci_controller *c)
 	return -ENODEV;
 }
 
- /*
-  * TODO find a better way how to deduplicate instantiation
-  * of USB PD slave device from nVidia GPU driver.
-  */
-static int navi_amd_register_client(struct dw_i2c_dev *dev)
-{
-	struct i2c_board_info	info;
-
-	memset(&info, 0, sizeof(struct i2c_board_info));
-	strscpy(info.type, "ccgx-ucsi", I2C_NAME_SIZE);
-	info.addr = 0x08;
-	info.irq = dev->irq;
-
-	dev->slave = i2c_new_client_device(&dev->adapter, &info);
-	if (IS_ERR(dev->slave))
-		return PTR_ERR(dev->slave);
-
-	return 0;
-}
-
 static int navi_amd_setup(struct pci_dev *pdev, struct dw_pci_controller *c)
 {
 	struct dw_i2c_dev *dev = dev_get_drvdata(&pdev->dev);
@@ -324,11 +305,10 @@ static int i2c_dw_pci_probe(struct pci_dev *pdev,
 	}
 
 	if ((dev->flags & MODEL_MASK) == MODEL_AMD_NAVI_GPU) {
-		r = navi_amd_register_client(dev);
-		if (r) {
-			dev_err(dev->dev, "register client failed with %d\n", r);
-			return r;
-		}
+		dev->slave = i2c_new_ccgx_ucsi(&dev->adapter, dev->irq, NULL);
+		if (IS_ERR(dev->slave))
+			return dev_err_probe(&pdev->dev, PTR_ERR(dev->slave),
+					     "register UCSI failed\n");
 	}
 
 	pm_runtime_set_autosuspend_delay(&pdev->dev, 1000);
-- 
2.33.0

