Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE04A7E716F
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Nov 2023 19:28:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345035AbjKIS2p (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Nov 2023 13:28:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345017AbjKIS2n (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Nov 2023 13:28:43 -0500
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBC0D3C07;
        Thu,  9 Nov 2023 10:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699554520; x=1731090520;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8APH4P4NEIbrdj9fSHnpfr/pQLSK5n0sPVRfXsOmxK4=;
  b=P6/L9jaj4Nj9MdAXNoXvK+x/jPgOsk13d0UMjOCImgcAP1xS+t9KSRPR
   6kPxmODKmmEhofZ8CZUQ13q4/9pZGLYnPdIwZgpEugRWIiX7sMJNKhrzm
   +OX8LRPyeeJ8IhBa9qVXw0Wg/GhmyYqIiJ3Wp+elZ7aOrNDFuwdTbKlhI
   r/sF2P5146jkrIEiEtNkcX2Cl2pfpy1+qR4glE4qE3NcmvDT+qszqw8L7
   Dlc1qV+vFgD0U2RfwmaMnpfdDSTqaYY9PdGE9TLmSVDjlxVrIkU8s7dAY
   RajJu9WefVJLvca0TTCWY0uYZ3bUxCX+Np4Ht0kUytknmEWk4vqJqoOxl
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="375088697"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; 
   d="scan'208";a="375088697"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 10:28:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="767086846"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; 
   d="scan'208";a="767086846"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 09 Nov 2023 10:28:37 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id B51D97C4; Thu,  9 Nov 2023 20:28:32 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v2 08/12] i2c: designware: Move exports to I2C_DW namespaces
Date:   Thu,  9 Nov 2023 20:19:18 +0200
Message-ID: <20231109182823.3531846-9-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1996.gbec44491f096
In-Reply-To: <20231109182823.3531846-1-andriy.shevchenko@linux.intel.com>
References: <20231109182823.3531846-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Reduce scope of the I²C DesignWare driver exports to I2C_DW namespaces.
This will prevent abuse of the symbols and clean up global namespace.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-common.c  | 2 ++
 drivers/i2c/busses/i2c-designware-master.c  | 3 +++
 drivers/i2c/busses/i2c-designware-pcidrv.c  | 2 ++
 drivers/i2c/busses/i2c-designware-platdrv.c | 2 ++
 drivers/i2c/busses/i2c-designware-slave.c   | 3 +++
 5 files changed, 12 insertions(+)

diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
index 49d9d5f83071..50cf4cbfeff3 100644
--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -28,6 +28,8 @@
 #include <linux/types.h>
 #include <linux/units.h>
 
+#define DEFAULT_SYMBOL_NAMESPACE	I2C_DW_COMMON
+
 #include "i2c-designware-core.h"
 
 static char *abort_sources[] = {
diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index 85dbd0eb5392..0b6576d7f811 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -22,6 +22,8 @@
 #include <linux/regmap.h>
 #include <linux/reset.h>
 
+#define DEFAULT_SYMBOL_NAMESPACE	I2C_DW
+
 #include "i2c-designware-core.h"
 
 #define AMD_TIMEOUT_MIN_US	25
@@ -1079,3 +1081,4 @@ EXPORT_SYMBOL_GPL(i2c_dw_probe_master);
 
 MODULE_DESCRIPTION("Synopsys DesignWare I2C bus master adapter");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(I2C_DW_COMMON);
diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
index 2e6c7bfb5bf7..68c2e1a3a035 100644
--- a/drivers/i2c/busses/i2c-designware-pcidrv.c
+++ b/drivers/i2c/busses/i2c-designware-pcidrv.c
@@ -418,3 +418,5 @@ module_pci_driver(dw_i2c_driver);
 MODULE_AUTHOR("Baruch Siach <baruch@tkos.co.il>");
 MODULE_DESCRIPTION("Synopsys DesignWare PCI I2C bus adapter");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(I2C_DW);
+MODULE_IMPORT_NS(I2C_DW_COMMON);
diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 0b6d6f2b6198..92e9199a5fdb 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -464,3 +464,5 @@ module_exit(dw_i2c_exit_driver);
 MODULE_AUTHOR("Baruch Siach <baruch@tkos.co.il>");
 MODULE_DESCRIPTION("Synopsys DesignWare I2C bus adapter");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(I2C_DW);
+MODULE_IMPORT_NS(I2C_DW_COMMON);
diff --git a/drivers/i2c/busses/i2c-designware-slave.c b/drivers/i2c/busses/i2c-designware-slave.c
index 2e079cf20bb5..70d183fa3bff 100644
--- a/drivers/i2c/busses/i2c-designware-slave.c
+++ b/drivers/i2c/busses/i2c-designware-slave.c
@@ -16,6 +16,8 @@
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 
+#define DEFAULT_SYMBOL_NAMESPACE	I2C_DW
+
 #include "i2c-designware-core.h"
 
 static void i2c_dw_configure_fifo_slave(struct dw_i2c_dev *dev)
@@ -279,3 +281,4 @@ EXPORT_SYMBOL_GPL(i2c_dw_probe_slave);
 MODULE_AUTHOR("Luis Oliveira <lolivei@synopsys.com>");
 MODULE_DESCRIPTION("Synopsys DesignWare I2C bus slave adapter");
 MODULE_LICENSE("GPL v2");
+MODULE_IMPORT_NS(I2C_DW_COMMON);
-- 
2.40.0.1996.gbec44491f096

