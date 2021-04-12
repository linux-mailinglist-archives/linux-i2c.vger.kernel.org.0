Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38A1135C7D1
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Apr 2021 15:41:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239012AbhDLNlh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 12 Apr 2021 09:41:37 -0400
Received: from mga05.intel.com ([192.55.52.43]:31875 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238881AbhDLNlh (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 12 Apr 2021 09:41:37 -0400
IronPort-SDR: pDJqdX8qTEd9ZSeVm7ZlUMBfolybDEduhTrUbSYDhg+N4eLYFFhHzMI33ywQEeYbxh9Chtos41
 Tk7x7KcLhnEA==
X-IronPort-AV: E=McAfee;i="6200,9189,9952"; a="279493377"
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; 
   d="scan'208";a="279493377"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2021 06:41:19 -0700
IronPort-SDR: eBVxvxVrRurWKdhoOf2gCsIc04+NHjxPllMFMbA0LgnT36+pnlMLcmlhYOUeB+xAnf2EcDCrFl
 mSSYZAaWNSXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; 
   d="scan'208";a="451468589"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.184])
  by fmsmga002.fm.intel.com with ESMTP; 12 Apr 2021 06:41:18 -0700
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>, Jean Delvare <jdelvare@suse.de>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH] i2c: i801: Add support for Intel Alder Lake PCH-M
Date:   Mon, 12 Apr 2021 16:41:12 +0300
Message-Id: <20210412134112.71752-1-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add PCI ID of SMBus controller on Intel Alder Lake PCH-M.

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
 drivers/i2c/busses/i2c-i801.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 526a5e88c791..f074c007e202 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -74,6 +74,7 @@
  * Comet Lake-V (PCH)		0xa3a3	32	hard	yes	yes	yes
  * Alder Lake-S (PCH)		0x7aa3	32	hard	yes	yes	yes
  * Alder Lake-P (PCH)		0x51a3	32	hard	yes	yes	yes
+ * Alder Lake-M (PCH)		0x54a3	32	hard	yes	yes	yes
  *
  * Features supported by this driver:
  * Software PEC				no
@@ -232,6 +233,7 @@
 #define PCI_DEVICE_ID_INTEL_ELKHART_LAKE_SMBUS		0x4b23
 #define PCI_DEVICE_ID_INTEL_JASPER_LAKE_SMBUS		0x4da3
 #define PCI_DEVICE_ID_INTEL_ALDER_LAKE_P_SMBUS		0x51a3
+#define PCI_DEVICE_ID_INTEL_ALDER_LAKE_M_SMBUS		0x54a3
 #define PCI_DEVICE_ID_INTEL_BROXTON_SMBUS		0x5ad4
 #define PCI_DEVICE_ID_INTEL_ALDER_LAKE_S_SMBUS		0x7aa3
 #define PCI_DEVICE_ID_INTEL_LYNXPOINT_SMBUS		0x8c22
@@ -1090,6 +1092,7 @@ static const struct pci_device_id i801_ids[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_JASPER_LAKE_SMBUS) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_ALDER_LAKE_S_SMBUS) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_ALDER_LAKE_P_SMBUS) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_ALDER_LAKE_M_SMBUS) },
 	{ 0, }
 };
 
@@ -1775,6 +1778,7 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	case PCI_DEVICE_ID_INTEL_EBG_SMBUS:
 	case PCI_DEVICE_ID_INTEL_ALDER_LAKE_S_SMBUS:
 	case PCI_DEVICE_ID_INTEL_ALDER_LAKE_P_SMBUS:
+	case PCI_DEVICE_ID_INTEL_ALDER_LAKE_M_SMBUS:
 		priv->features |= FEATURE_BLOCK_PROC;
 		priv->features |= FEATURE_I2C_BLOCK_READ;
 		priv->features |= FEATURE_IRQ;
-- 
2.30.2

