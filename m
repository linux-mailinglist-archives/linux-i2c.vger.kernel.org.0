Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93F09103E2A
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Nov 2019 16:19:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729524AbfKTPTg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 20 Nov 2019 10:19:36 -0500
Received: from mga09.intel.com ([134.134.136.24]:22677 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728786AbfKTPTg (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 20 Nov 2019 10:19:36 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 20 Nov 2019 07:19:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,222,1571727600"; 
   d="scan'208";a="200749303"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga008.jf.intel.com with ESMTP; 20 Nov 2019 07:19:34 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 28B3D236; Wed, 20 Nov 2019 17:19:32 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH v2] i2c: i801: Correct Intel Jasper Lake SOC naming
Date:   Wed, 20 Nov 2019 17:19:32 +0200
Message-Id: <20191120151932.40269-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

There is no suffix applied to Intel Jasper Lake SOC. Remove it
from the comments and definitions. Besides that, it's a SOC,
thus replace PCH with SOC where it appropriate.

Fixes: e0c61c04791a ("i2c: i801: Add support for Intel Jasper Lake")
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: PCH -> SOC (Jarkko)
 Documentation/i2c/busses/i2c-i801.rst | 2 +-
 drivers/i2c/busses/Kconfig            | 2 +-
 drivers/i2c/busses/i2c-i801.c         | 8 ++++----
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/i2c/busses/i2c-i801.rst b/Documentation/i2c/busses/i2c-i801.rst
index aa4a0e26e9b9..b83da0e94184 100644
--- a/Documentation/i2c/busses/i2c-i801.rst
+++ b/Documentation/i2c/busses/i2c-i801.rst
@@ -42,7 +42,7 @@ Supported adapters:
   * Intel Comet Lake (PCH)
   * Intel Elkhart Lake (PCH)
   * Intel Tiger Lake (PCH)
-  * Intel Jasper Lake (PCH)
+  * Intel Jasper Lake (SOC)
 
    Datasheets: Publicly available at the Intel website
 
diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 45ca099e7315..71e5ee263dce 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -145,7 +145,7 @@ config I2C_I801
 	    Comet Lake (PCH)
 	    Elkhart Lake (PCH)
 	    Tiger Lake (PCH)
-	    Jasper Lake (PCH)
+	    Jasper Lake (SOC)
 
 	  This driver can also be built as a module.  If so, the module
 	  will be called i2c-i801.
diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index df02040d36d5..f5e69fe56532 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -67,7 +67,7 @@
  * Comet Lake-H (PCH)		0x06a3	32	hard	yes	yes	yes
  * Elkhart Lake (PCH)		0x4b23	32	hard	yes	yes	yes
  * Tiger Lake-LP (PCH)		0xa0a3	32	hard	yes	yes	yes
- * Jasper Lake-N (PCH)		0x4da3	32	hard	yes	yes	yes
+ * Jasper Lake (SOC)		0x4da3	32	hard	yes	yes	yes
  *
  * Features supported by this driver:
  * Software PEC				no
@@ -226,7 +226,7 @@
 #define PCI_DEVICE_ID_INTEL_ICELAKE_LP_SMBUS		0x34a3
 #define PCI_DEVICE_ID_INTEL_5_3400_SERIES_SMBUS		0x3b30
 #define PCI_DEVICE_ID_INTEL_ELKHART_LAKE_SMBUS		0x4b23
-#define PCI_DEVICE_ID_INTEL_JASPER_LAKE_N_SMBUS		0x4da3
+#define PCI_DEVICE_ID_INTEL_JASPER_LAKE_SMBUS		0x4da3
 #define PCI_DEVICE_ID_INTEL_BROXTON_SMBUS		0x5ad4
 #define PCI_DEVICE_ID_INTEL_LYNXPOINT_SMBUS		0x8c22
 #define PCI_DEVICE_ID_INTEL_WILDCATPOINT_SMBUS		0x8ca2
@@ -1076,7 +1076,7 @@ static const struct pci_device_id i801_ids[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_COMETLAKE_H_SMBUS) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_ELKHART_LAKE_SMBUS) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_TIGERLAKE_LP_SMBUS) },
-	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_JASPER_LAKE_N_SMBUS) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_JASPER_LAKE_SMBUS) },
 	{ 0, }
 };
 
@@ -1759,7 +1759,7 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	case PCI_DEVICE_ID_INTEL_COMETLAKE_H_SMBUS:
 	case PCI_DEVICE_ID_INTEL_ELKHART_LAKE_SMBUS:
 	case PCI_DEVICE_ID_INTEL_TIGERLAKE_LP_SMBUS:
-	case PCI_DEVICE_ID_INTEL_JASPER_LAKE_N_SMBUS:
+	case PCI_DEVICE_ID_INTEL_JASPER_LAKE_SMBUS:
 		priv->features |= FEATURE_BLOCK_PROC;
 		priv->features |= FEATURE_I2C_BLOCK_READ;
 		priv->features |= FEATURE_IRQ;
-- 
2.24.0

