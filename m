Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 722F11FF367
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Jun 2020 15:42:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730286AbgFRNmt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 18 Jun 2020 09:42:49 -0400
Received: from mga05.intel.com ([192.55.52.43]:60749 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727101AbgFRNmq (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 18 Jun 2020 09:42:46 -0400
IronPort-SDR: Num0Z5cH6q4uD46jMjO5Y2dMXgiftqTNypvbESUvqh6IgpDycFrmHOD8fa3J+4Me+vxL0qwdUR
 LAVW+p3laPZA==
X-IronPort-AV: E=McAfee;i="6000,8403,9655"; a="227270702"
X-IronPort-AV: E=Sophos;i="5.73,526,1583222400"; 
   d="scan'208";a="227270702"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2020 06:42:46 -0700
IronPort-SDR: kmA2KBl+15pR39FnDa8LnmjCVSUxn7S+IvrD8NDEC1BvvBJbDcr7aG8DqL8d0Ohwmqs7TbPj/1
 tn1QAZYMUzPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,526,1583222400"; 
   d="scan'208";a="277625487"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.87])
  by orsmga006.jf.intel.com with ESMTP; 18 Jun 2020 06:42:44 -0700
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
To:     linux-i2c@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.com>, Wolfram Sang <wsa@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH 1/2] i2c: i801: Add support for Intel Emmitsburg PCH
Date:   Thu, 18 Jun 2020 16:42:39 +0300
Message-Id: <20200618134240.4091271-1-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Mika Westerberg <mika.westerberg@linux.intel.com>

Add support for SMBus controller on Intel Emmitsburg PCH. This is the
same IP as used in Cannon Lake and derivatives.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
 Documentation/i2c/busses/i2c-i801.rst | 1 +
 drivers/i2c/busses/Kconfig            | 1 +
 drivers/i2c/busses/i2c-i801.c         | 4 ++++
 3 files changed, 6 insertions(+)

diff --git a/Documentation/i2c/busses/i2c-i801.rst b/Documentation/i2c/busses/i2c-i801.rst
index b83da0e94184..faf32330c335 100644
--- a/Documentation/i2c/busses/i2c-i801.rst
+++ b/Documentation/i2c/busses/i2c-i801.rst
@@ -43,6 +43,7 @@ Supported adapters:
   * Intel Elkhart Lake (PCH)
   * Intel Tiger Lake (PCH)
   * Intel Jasper Lake (SOC)
+  * Intel Emmitsburg (PCH)
 
    Datasheets: Publicly available at the Intel website
 
diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 735bf31a3fdf..085ca9b009ed 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -146,6 +146,7 @@ config I2C_I801
 	    Elkhart Lake (PCH)
 	    Tiger Lake (PCH)
 	    Jasper Lake (SOC)
+	    Emmitsburg (PCH)
 
 	  This driver can also be built as a module.  If so, the module
 	  will be called i2c-i801.
diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index fea644921a76..7797ef1d25d9 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -54,6 +54,7 @@
  * Sunrise Point-H (PCH) 	0xa123  32	hard	yes	yes	yes
  * Sunrise Point-LP (PCH)	0x9d23	32	hard	yes	yes	yes
  * DNV (SOC)			0x19df	32	hard	yes	yes	yes
+ * Emmitsburg (PCH)		0x1bc9	32	hard	yes	yes	yes
  * Broxton (SOC)		0x5ad4	32	hard	yes	yes	yes
  * Lewisburg (PCH)		0xa1a3	32	hard	yes	yes	yes
  * Lewisburg Supersku (PCH)	0xa223	32	hard	yes	yes	yes
@@ -207,6 +208,7 @@
 #define PCI_DEVICE_ID_INTEL_BAYTRAIL_SMBUS		0x0f12
 #define PCI_DEVICE_ID_INTEL_CDF_SMBUS			0x18df
 #define PCI_DEVICE_ID_INTEL_DNV_SMBUS			0x19df
+#define PCI_DEVICE_ID_INTEL_EBG_SMBUS			0x1bc9
 #define PCI_DEVICE_ID_INTEL_COUGARPOINT_SMBUS		0x1c22
 #define PCI_DEVICE_ID_INTEL_PATSBURG_SMBUS		0x1d22
 /* Patsburg also has three 'Integrated Device Function' SMBus controllers */
@@ -1062,6 +1064,7 @@ static const struct pci_device_id i801_ids[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_SUNRISEPOINT_LP_SMBUS) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_CDF_SMBUS) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_DNV_SMBUS) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_EBG_SMBUS) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_BROXTON_SMBUS) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_LEWISBURG_SMBUS) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_LEWISBURG_SSKU_SMBUS) },
@@ -1749,6 +1752,7 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	case PCI_DEVICE_ID_INTEL_ELKHART_LAKE_SMBUS:
 	case PCI_DEVICE_ID_INTEL_TIGERLAKE_LP_SMBUS:
 	case PCI_DEVICE_ID_INTEL_JASPER_LAKE_SMBUS:
+	case PCI_DEVICE_ID_INTEL_EBG_SMBUS:
 		priv->features |= FEATURE_BLOCK_PROC;
 		priv->features |= FEATURE_I2C_BLOCK_READ;
 		priv->features |= FEATURE_IRQ;
-- 
2.27.0

