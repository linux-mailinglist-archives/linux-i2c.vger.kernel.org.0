Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39B2547D508
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Dec 2021 17:20:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241697AbhLVQUi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 Dec 2021 11:20:38 -0500
Received: from mga01.intel.com ([192.55.52.88]:40847 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241647AbhLVQUi (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 22 Dec 2021 11:20:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640190038; x=1671726038;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MXvEvTDY3wXxjdpwc1zjX86H1PjRuybykzxgW93brTo=;
  b=NMULG771sR7YFcw+FgIw5/s4CRNqtCiYBTTX8JeqloIvsK7KHkIeNPb4
   XgluAU7BocsO+Nw1x81et5W7rTD4aa4QYWrGKC6hdL/vOnNORF7+4cGqP
   86ZtJ7Ze9iIHY5qU/s5cEw02ATnSdNZ+EJyGUGVNcCEO9DiFoDpPVfweu
   AOR3ZnPMMHhgdx/VEtoc31Vfuvw4HHJjsp/Rgcsy416hT0IuTB5/QrQ9p
   iQUSR0boLNQkmZVpnYkHPoxCFpzIWy3jog8BpEhnv8+jNbQurPdpuEICO
   E1qO8BFmvqxUUsIOg8UhLk03GFQ4/vJmhAQm4KG/YF68LIj/KO8nGwkTs
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10206"; a="264852528"
X-IronPort-AV: E=Sophos;i="5.88,227,1635231600"; 
   d="scan'208";a="264852528"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2021 08:20:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,227,1635231600"; 
   d="scan'208";a="607457623"
Received: from black.fi.intel.com ([10.237.72.28])
  by FMSMGA003.fm.intel.com with ESMTP; 22 Dec 2021 08:20:35 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 3A95137D; Wed, 22 Dec 2021 18:20:44 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Ajay Gupta <ajayg@nvidia.com>,
        "Shah, Nehal-bakulchandra" <nehal-bakulchandra.shah@amd.com>
Subject: [PATCH v2 5/5] i2c: designware-pci: Switch to use i2c_new_ccgx_ucsi()
Date:   Wed, 22 Dec 2021 18:20:41 +0200
Message-Id: <20211222162041.64625-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211222162041.64625-1-andriy.shevchenko@linux.intel.com>
References: <20211222162041.64625-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Instead of open coded variant switch to use i2c_new_ccgx_ucsi().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: rebased on top of current i2c/for-next

 drivers/i2c/busses/Kconfig                 |  1 +
 drivers/i2c/busses/i2c-designware-pcidrv.c | 30 ++++------------------
 2 files changed, 6 insertions(+), 25 deletions(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 0c9b089d1456..e2e8ae7ed2a7 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -578,6 +578,7 @@ config I2C_DESIGNWARE_PCI
 	tristate "Synopsys DesignWare PCI"
 	depends on PCI
 	select I2C_DESIGNWARE_CORE
+	select I2C_CCGX_UCSI
 	help
 	  If you say yes to this option, support will be included for the
 	  Synopsys DesignWare I2C adapter. Only master mode is supported.
diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
index ef4250f8852b..2782dddfb087 100644
--- a/drivers/i2c/busses/i2c-designware-pcidrv.c
+++ b/drivers/i2c/busses/i2c-designware-pcidrv.c
@@ -24,6 +24,7 @@
 #include <linux/slab.h>
 
 #include "i2c-designware-core.h"
+#include "i2c-ccgx-ucsi.h"
 
 #define DRIVER_NAME "i2c-designware-pci"
 #define AMD_CLK_RATE_HZ	100000
@@ -125,26 +126,6 @@ static int mfld_setup(struct pci_dev *pdev, struct dw_pci_controller *c)
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
@@ -325,11 +306,10 @@ static int i2c_dw_pci_probe(struct pci_dev *pdev,
 	}
 
 	if ((dev->flags & MODEL_MASK) == MODEL_AMD_NAVI_GPU) {
-		r = navi_amd_register_client(dev);
-		if (r) {
-			dev_err(dev->dev, "register client failed with %d\n", r);
-			return r;
-		}
+		dev->slave = i2c_new_ccgx_ucsi(&dev->adapter, dev->irq, NULL);
+		if (IS_ERR(dev->slave))
+			return dev_err_probe(dev->dev, PTR_ERR(dev->slave),
+					     "register UCSI failed\n");
 	}
 
 	pm_runtime_set_autosuspend_delay(&pdev->dev, 1000);
-- 
2.34.1

