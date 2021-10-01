Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 361D541F2FB
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Oct 2021 19:21:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355122AbhJARXm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 1 Oct 2021 13:23:42 -0400
Received: from mga12.intel.com ([192.55.52.136]:50384 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1355121AbhJARXl (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 1 Oct 2021 13:23:41 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10124"; a="204989883"
X-IronPort-AV: E=Sophos;i="5.85,339,1624345200"; 
   d="scan'208";a="204989883"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2021 10:21:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,339,1624345200"; 
   d="scan'208";a="565162607"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 01 Oct 2021 10:21:54 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 754B8B8; Fri,  1 Oct 2021 20:22:00 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] i2c: i801: Add support for Intel Ice Lake PCH-N
Date:   Fri,  1 Oct 2021 20:21:54 +0300
Message-Id: <20211001172154.15660-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add PCI ID of SMBus controller on Intel Ice Lake PCH-N.

The device can be found on MacBookPro16,2 [1].

[1]: https://linux-hardware.org/?probe=f1c5cf0c43

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-i801.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 7f3ec68397c0..14c359536fca 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -64,6 +64,7 @@
  * Cannon Lake-LP (PCH)		0x9da3	32	hard	yes	yes	yes
  * Cedar Fork (PCH)		0x18df	32	hard	yes	yes	yes
  * Ice Lake-LP (PCH)		0x34a3	32	hard	yes	yes	yes
+ * Ice Lake-N (PCH)		0x38a3	32	hard	yes	yes	yes
  * Comet Lake (PCH)		0x02a3	32	hard	yes	yes	yes
  * Comet Lake-H (PCH)		0x06a3	32	hard	yes	yes	yes
  * Elkhart Lake (PCH)		0x4b23	32	hard	yes	yes	yes
@@ -218,6 +219,7 @@
 #define PCI_DEVICE_ID_INTEL_COLETOCREEK_SMBUS		0x23b0
 #define PCI_DEVICE_ID_INTEL_GEMINILAKE_SMBUS		0x31d4
 #define PCI_DEVICE_ID_INTEL_ICELAKE_LP_SMBUS		0x34a3
+#define PCI_DEVICE_ID_INTEL_ICELAKE_N_SMBUS		0x38a3
 #define PCI_DEVICE_ID_INTEL_5_3400_SERIES_SMBUS		0x3b30
 #define PCI_DEVICE_ID_INTEL_TIGERLAKE_H_SMBUS		0x43a3
 #define PCI_DEVICE_ID_INTEL_ELKHART_LAKE_SMBUS		0x4b23
@@ -1042,6 +1044,7 @@ static const struct pci_device_id i801_ids[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_CANNONLAKE_H_SMBUS) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_CANNONLAKE_LP_SMBUS) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_ICELAKE_LP_SMBUS) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_ICELAKE_N_SMBUS) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_COMETLAKE_SMBUS) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_COMETLAKE_H_SMBUS) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_COMETLAKE_V_SMBUS) },
@@ -1702,6 +1705,7 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	case PCI_DEVICE_ID_INTEL_CANNONLAKE_LP_SMBUS:
 	case PCI_DEVICE_ID_INTEL_CDF_SMBUS:
 	case PCI_DEVICE_ID_INTEL_ICELAKE_LP_SMBUS:
+	case PCI_DEVICE_ID_INTEL_ICELAKE_N_SMBUS:
 	case PCI_DEVICE_ID_INTEL_COMETLAKE_SMBUS:
 	case PCI_DEVICE_ID_INTEL_COMETLAKE_H_SMBUS:
 	case PCI_DEVICE_ID_INTEL_ELKHART_LAKE_SMBUS:
-- 
2.33.0

