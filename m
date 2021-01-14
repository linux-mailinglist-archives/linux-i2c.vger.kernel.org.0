Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6995C2F634F
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Jan 2021 15:40:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728919AbhANOkB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 14 Jan 2021 09:40:01 -0500
Received: from mga04.intel.com ([192.55.52.120]:6291 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728523AbhANOkA (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 14 Jan 2021 09:40:00 -0500
IronPort-SDR: MHpZhNm2V45Y6SkhlUjJldR8paUz6fnDt9BauUZB63CBUX1QBUNjB3J9E7P4bb//iF9GA+vdiD
 ycDLZ5y45kXw==
X-IronPort-AV: E=McAfee;i="6000,8403,9863"; a="175794848"
X-IronPort-AV: E=Sophos;i="5.79,347,1602572400"; 
   d="scan'208";a="175794848"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2021 06:38:14 -0800
IronPort-SDR: fgHQ4xOnPkgoKV+9F/6efulmuQaFDcWfce55AhXBQMCDZrs9NugJjyvQBImQdlPs0+v6l5gxoq
 XtsirzT0Egkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,347,1602572400"; 
   d="scan'208";a="400916862"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.56])
  by fmsmga002.fm.intel.com with ESMTP; 14 Jan 2021 06:38:13 -0800
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>, Jean Delvare <jdelvare@suse.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH] i2c: i801: Add support for Intel Alder Lake PCH-P
Date:   Thu, 14 Jan 2021 16:38:11 +0200
Message-Id: <20210114143811.1820137-1-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add PCI ID of SMBus controller on Intel Alder Lake PCH-P.

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
 drivers/i2c/busses/i2c-i801.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 4435e5fdc75e..b931b629b457 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -73,6 +73,7 @@
  * Jasper Lake (SOC)		0x4da3	32	hard	yes	yes	yes
  * Comet Lake-V (PCH)		0xa3a3	32	hard	yes	yes	yes
  * Alder Lake-S (PCH)		0x7aa3	32	hard	yes	yes	yes
+ * Alder Lake-P (PCH)		0x51a3	32	hard	yes	yes	yes
  *
  * Features supported by this driver:
  * Software PEC				no
@@ -230,6 +231,7 @@
 #define PCI_DEVICE_ID_INTEL_TIGERLAKE_H_SMBUS		0x43a3
 #define PCI_DEVICE_ID_INTEL_ELKHART_LAKE_SMBUS		0x4b23
 #define PCI_DEVICE_ID_INTEL_JASPER_LAKE_SMBUS		0x4da3
+#define PCI_DEVICE_ID_INTEL_ALDER_LAKE_P_SMBUS		0x51a3
 #define PCI_DEVICE_ID_INTEL_BROXTON_SMBUS		0x5ad4
 #define PCI_DEVICE_ID_INTEL_ALDER_LAKE_S_SMBUS		0x7aa3
 #define PCI_DEVICE_ID_INTEL_LYNXPOINT_SMBUS		0x8c22
@@ -1087,6 +1089,7 @@ static const struct pci_device_id i801_ids[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_TIGERLAKE_H_SMBUS) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_JASPER_LAKE_SMBUS) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_ALDER_LAKE_S_SMBUS) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_ALDER_LAKE_P_SMBUS) },
 	{ 0, }
 };
 
@@ -1776,6 +1779,7 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	case PCI_DEVICE_ID_INTEL_JASPER_LAKE_SMBUS:
 	case PCI_DEVICE_ID_INTEL_EBG_SMBUS:
 	case PCI_DEVICE_ID_INTEL_ALDER_LAKE_S_SMBUS:
+	case PCI_DEVICE_ID_INTEL_ALDER_LAKE_P_SMBUS:
 		priv->features |= FEATURE_BLOCK_PROC;
 		priv->features |= FEATURE_I2C_BLOCK_READ;
 		priv->features |= FEATURE_IRQ;
-- 
2.29.2

