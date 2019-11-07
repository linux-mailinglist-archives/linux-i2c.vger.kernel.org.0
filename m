Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80D78F2CE4
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Nov 2019 11:55:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728183AbfKGKzd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 7 Nov 2019 05:55:33 -0500
Received: from mga03.intel.com ([134.134.136.65]:64776 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727528AbfKGKzd (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 7 Nov 2019 05:55:33 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 07 Nov 2019 02:55:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,278,1569308400"; 
   d="scan'208";a="353764483"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 07 Nov 2019 02:55:31 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 42B3AFC; Thu,  7 Nov 2019 12:55:29 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH v1] i2c: i801: Correct Intel Jasper Lake PCH naming
Date:   Thu,  7 Nov 2019 12:55:29 +0200
Message-Id: <20191107105529.22825-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.24.0.rc1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

There is no suffix applied to Intel Jasper Lake PCH. Remove it from
the comments and definitions.

Fixes: e0c61c04791a ("i2c: i801: Add support for Intel Jasper Lake")
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-i801.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index df02040d36d5..2de184bbd21f 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -67,7 +67,7 @@
  * Comet Lake-H (PCH)		0x06a3	32	hard	yes	yes	yes
  * Elkhart Lake (PCH)		0x4b23	32	hard	yes	yes	yes
  * Tiger Lake-LP (PCH)		0xa0a3	32	hard	yes	yes	yes
- * Jasper Lake-N (PCH)		0x4da3	32	hard	yes	yes	yes
+ * Jasper Lake (PCH)		0x4da3	32	hard	yes	yes	yes
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
2.24.0.rc1

