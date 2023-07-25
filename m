Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A6F6761BB9
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jul 2023 16:30:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232810AbjGYOaa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Jul 2023 10:30:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232399AbjGYOaZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Jul 2023 10:30:25 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76A7B102;
        Tue, 25 Jul 2023 07:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690295424; x=1721831424;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=j9iN2MJ7X/yKook3QrdIM4dGb8n/i3/x6KJi39OGJkE=;
  b=eAiIbQaNHKnx3ugsLXUAbnyW8urO0nN5WPyn2XlM3NiBVNyxafrt7L10
   dAQgSwL7JzVWiPlDbDKHkOKUzZIpnl4LvTfCbp61Xsq7iNuRqQ0cy+UVT
   quwb56YjPw0ynnOeJAgokm4VmAzfwR/bhKSnnuPqcU8KfhOkc044YFb/b
   uC/Nu04h5Gx2b2L+FRbWA59WaY5Gs/L1FI7yRizyjgMd7VNVQaSuO0jtd
   F+PjI5TWf5VjCE171PB+h+ZnwyRlFEsYbqCttUZRqSJVNyIZhMKEs7JnD
   j70G4GBEMiMaVt0wA3NWf2sK4Axb4qGZABW1JWhdGIrUctebdVDZEIBGG
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="357742878"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; 
   d="scan'208";a="357742878"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2023 07:30:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="869491421"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 25 Jul 2023 07:30:17 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id BACC330D; Tue, 25 Jul 2023 17:30:24 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH v1 4/9] i2c: designware: Propagate firmware node
Date:   Tue, 25 Jul 2023 17:30:18 +0300
Message-Id: <20230725143023.86325-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
In-Reply-To: <20230725143023.86325-1-andriy.shevchenko@linux.intel.com>
References: <20230725143023.86325-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Propagate firmware node by using a specific API call, i.e. device_set_node().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-core.h    | 6 ++++--
 drivers/i2c/busses/i2c-designware-pcidrv.c  | 2 --
 drivers/i2c/busses/i2c-designware-platdrv.c | 2 --
 3 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index 03f4d44ae94c..f0c683ad860f 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -10,11 +10,11 @@
  */
 
 #include <linux/bits.h>
-#include <linux/compiler_types.h>
 #include <linux/completion.h>
-#include <linux/dev_printk.h>
+#include <linux/device.h>
 #include <linux/errno.h>
 #include <linux/i2c.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/types.h>
 
@@ -363,6 +363,8 @@ static inline int i2c_dw_probe_slave(struct dw_i2c_dev *dev) { return -EINVAL; }
 
 static inline int i2c_dw_probe(struct dw_i2c_dev *dev)
 {
+	device_set_node(&dev->adapter.dev, dev_fwnode(dev->dev));
+
 	switch (dev->mode) {
 	case DW_IC_SLAVE:
 		return i2c_dw_probe_slave(dev);
diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
index 7f5a04538c71..a42a47e0032d 100644
--- a/drivers/i2c/busses/i2c-designware-pcidrv.c
+++ b/drivers/i2c/busses/i2c-designware-pcidrv.c
@@ -9,7 +9,6 @@
  * Copyright (C) 2009 Provigent Ltd.
  * Copyright (C) 2011, 2015, 2016 Intel Corporation.
  */
-#include <linux/acpi.h>
 #include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/errno.h>
@@ -325,7 +324,6 @@ static int i2c_dw_pci_probe(struct pci_dev *pdev,
 	adap = &dev->adapter;
 	adap->owner = THIS_MODULE;
 	adap->class = 0;
-	ACPI_COMPANION_SET(&adap->dev, ACPI_COMPANION(&pdev->dev));
 	adap->nr = controller->bus_num;
 
 	r = i2c_dw_probe(dev);
diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index d35a6bbcb6fb..512fb1d8ddfc 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -357,8 +357,6 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 	adap->owner = THIS_MODULE;
 	adap->class = dmi_check_system(dw_i2c_hwmon_class_dmi) ?
 					I2C_CLASS_HWMON : I2C_CLASS_DEPRECATED;
-	ACPI_COMPANION_SET(&adap->dev, ACPI_COMPANION(&pdev->dev));
-	adap->dev.of_node = pdev->dev.of_node;
 	adap->nr = -1;
 
 	if (dev->flags & ACCESS_NO_IRQ_SUSPEND) {
-- 
2.40.0.1.gaa8946217a0b

