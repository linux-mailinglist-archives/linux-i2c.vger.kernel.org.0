Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5437A48548D
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jan 2022 15:31:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240849AbiAEOat (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Jan 2022 09:30:49 -0500
Received: from mga14.intel.com ([192.55.52.115]:24288 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240845AbiAEOat (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 5 Jan 2022 09:30:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641393049; x=1672929049;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dRH8ilS94DwdebtNTfOJJdLl0Zq/I3oicrJGE7OIBfc=;
  b=JqnF8ShPrPTSAf9qrpwIr9FnG3OgT4n+qKCnRKMG1I3sIgdgmyPf5YO6
   JzahAOA+H1K+WdDPD3ynJw2/WsMC0efI5kirKqE1V7vTwOaYMCY22LGQq
   Ujodv3jN1Tp1NfcEvH3r7p/PcQWEj062++ipG/p+e3YUXpqg6KtcusZQY
   GI/rrbszeG/vwvuVRhIf9xIspVl9+AZct/l3rCMX9aZpV86UbowydJU13
   szC6Hd+qiOu8ieptD3YnRYwF4DbxHoFIUPOf5Ke6rJ2471uoueJjGN/t5
   1ZqboAyRQDM2l/VRtS8dLj1mC3sQdAq6UJQjw5VBkCnnLbzdJlv2wYakZ
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="242660319"
X-IronPort-AV: E=Sophos;i="5.88,264,1635231600"; 
   d="scan'208";a="242660319"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2022 06:19:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,264,1635231600"; 
   d="scan'208";a="556544892"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 05 Jan 2022 06:19:27 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id B51C649B; Wed,  5 Jan 2022 16:19:37 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Ajay Gupta <ajayg@nvidia.com>,
        "Shah, Nehal-bakulchandra" <nehal-bakulchandra.shah@amd.com>
Subject: [PATCH v3 5/5] i2c: designware-pci: Switch to use i2c_new_ccgx_ucsi()
Date:   Wed,  5 Jan 2022 16:19:35 +0200
Message-Id: <20220105141935.24109-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220105141935.24109-1-andriy.shevchenko@linux.intel.com>
References: <20220105141935.24109-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Instead of open coded variant switch to use i2c_new_ccgx_ucsi().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
v3: added tag (Jarkko)
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

