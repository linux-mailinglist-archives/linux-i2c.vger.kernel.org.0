Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A4D55BCB3
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Jul 2019 15:16:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727848AbfGANPj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 1 Jul 2019 09:15:39 -0400
Received: from mga12.intel.com ([192.55.52.136]:62740 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726329AbfGANPj (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 1 Jul 2019 09:15:39 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 01 Jul 2019 06:15:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,439,1557212400"; 
   d="scan'208";a="362261322"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.56])
  by fmsmga006.fm.intel.com with ESMTP; 01 Jul 2019 06:15:38 -0700
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
To:     linux-i2c@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.com>, Wolfram Sang <wsa@the-dreams.de>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH 2/2] i2c: i801: Add support for Intel Tiger Lake
Date:   Mon,  1 Jul 2019 16:15:34 +0300
Message-Id: <20190701131534.19537-2-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190701131534.19537-1-jarkko.nikula@linux.intel.com>
References: <20190701131534.19537-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add SMBUS PCI ID for Intel Tiger Lake -LP.

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
 Documentation/i2c/busses/i2c-i801 | 1 +
 drivers/i2c/busses/Kconfig        | 1 +
 drivers/i2c/busses/i2c-i801.c     | 4 ++++
 3 files changed, 6 insertions(+)

diff --git a/Documentation/i2c/busses/i2c-i801 b/Documentation/i2c/busses/i2c-i801
index d247edcb0f99..04b5de80ce4e 100644
--- a/Documentation/i2c/busses/i2c-i801
+++ b/Documentation/i2c/busses/i2c-i801
@@ -38,6 +38,7 @@ Supported adapters:
   * Intel Ice Lake (PCH)
   * Intel Comet Lake (PCH)
   * Intel Elkhart Lake (PCH)
+  * Intel Tiger Lake (PCH)
    Datasheets: Publicly available at the Intel website
 
 On Intel Patsburg and later chipsets, both the normal host SMBus controller
diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 68b677be1fa4..09367fc014c3 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -144,6 +144,7 @@ config I2C_I801
 	    Ice Lake (PCH)
 	    Comet Lake (PCH)
 	    Elkhart Lake (PCH)
+	    Tiger Lake (PCH)
 
 	  This driver can also be built as a module.  If so, the module
 	  will be called i2c-i801.
diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 1ddbfe3bb745..f2956936c3f2 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -65,6 +65,7 @@
  * Ice Lake-LP (PCH)		0x34a3	32	hard	yes	yes	yes
  * Comet Lake (PCH)		0x02a3	32	hard	yes	yes	yes
  * Elkhart Lake (PCH)		0x4b23	32	hard	yes	yes	yes
+ * Tiger Lake-LP (PCH)		0xa0a3	32	hard	yes	yes	yes
  *
  * Features supported by this driver:
  * Software PEC				no
@@ -233,6 +234,7 @@
 #define PCI_DEVICE_ID_INTEL_WILDCATPOINT_LP_SMBUS	0x9ca2
 #define PCI_DEVICE_ID_INTEL_SUNRISEPOINT_LP_SMBUS	0x9d23
 #define PCI_DEVICE_ID_INTEL_CANNONLAKE_LP_SMBUS		0x9da3
+#define PCI_DEVICE_ID_INTEL_TIGERLAKE_LP_SMBUS		0xa0a3
 #define PCI_DEVICE_ID_INTEL_SUNRISEPOINT_H_SMBUS	0xa123
 #define PCI_DEVICE_ID_INTEL_LEWISBURG_SMBUS		0xa1a3
 #define PCI_DEVICE_ID_INTEL_LEWISBURG_SSKU_SMBUS	0xa223
@@ -1067,6 +1069,7 @@ static const struct pci_device_id i801_ids[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_ICELAKE_LP_SMBUS) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_COMETLAKE_SMBUS) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_ELKHART_LAKE_SMBUS) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_TIGERLAKE_LP_SMBUS) },
 	{ 0, }
 };
 
@@ -1702,6 +1705,7 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	case PCI_DEVICE_ID_INTEL_ICELAKE_LP_SMBUS:
 	case PCI_DEVICE_ID_INTEL_COMETLAKE_SMBUS:
 	case PCI_DEVICE_ID_INTEL_ELKHART_LAKE_SMBUS:
+	case PCI_DEVICE_ID_INTEL_TIGERLAKE_LP_SMBUS:
 		priv->features |= FEATURE_BLOCK_PROC;
 		priv->features |= FEATURE_I2C_BLOCK_READ;
 		priv->features |= FEATURE_IRQ;
-- 
2.20.1

