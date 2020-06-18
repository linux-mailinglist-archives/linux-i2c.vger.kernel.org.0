Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75E851FF368
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Jun 2020 15:42:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730291AbgFRNmv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 18 Jun 2020 09:42:51 -0400
Received: from mga05.intel.com ([192.55.52.43]:60749 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727101AbgFRNmu (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 18 Jun 2020 09:42:50 -0400
IronPort-SDR: Bxz1ocsMp04RXNakP9w8h6qIf9Udj+txPOg341K5lTU5bZisr2XwSITgK7hTun2CgyeCd5NDzB
 SLoo17krtOTg==
X-IronPort-AV: E=McAfee;i="6000,8403,9655"; a="227270708"
X-IronPort-AV: E=Sophos;i="5.73,526,1583222400"; 
   d="scan'208";a="227270708"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2020 06:42:50 -0700
IronPort-SDR: 7xdOcKWV9CA6GaBabq9fZmBEEKp9bf8Z6zmIxROmEpqLM/KPzEQRUMwuTl5piaDLnHDsNfVbYg
 K9Pgn6mzN/sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,526,1583222400"; 
   d="scan'208";a="277625503"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.87])
  by orsmga006.jf.intel.com with ESMTP; 18 Jun 2020 06:42:48 -0700
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
To:     linux-i2c@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.com>, Wolfram Sang <wsa@kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH 2/2] i2c: i801: Add support for Intel Tiger Lake PCH-H
Date:   Thu, 18 Jun 2020 16:42:40 +0300
Message-Id: <20200618134240.4091271-2-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200618134240.4091271-1-jarkko.nikula@linux.intel.com>
References: <20200618134240.4091271-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add SMBus PCI ID on Intel Tiger Lake PCH-H.

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
 drivers/i2c/busses/i2c-i801.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 7797ef1d25d9..2df2551e9973 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -68,6 +68,7 @@
  * Comet Lake-H (PCH)		0x06a3	32	hard	yes	yes	yes
  * Elkhart Lake (PCH)		0x4b23	32	hard	yes	yes	yes
  * Tiger Lake-LP (PCH)		0xa0a3	32	hard	yes	yes	yes
+ * Tiger Lake-H (PCH)		0x43a3	32	hard	yes	yes	yes
  * Jasper Lake (SOC)		0x4da3	32	hard	yes	yes	yes
  * Comet Lake-V (PCH)		0xa3a3	32	hard	yes	yes	yes
  *
@@ -223,6 +224,7 @@
 #define PCI_DEVICE_ID_INTEL_GEMINILAKE_SMBUS		0x31d4
 #define PCI_DEVICE_ID_INTEL_ICELAKE_LP_SMBUS		0x34a3
 #define PCI_DEVICE_ID_INTEL_5_3400_SERIES_SMBUS		0x3b30
+#define PCI_DEVICE_ID_INTEL_TIGERLAKE_H_SMBUS		0x43a3
 #define PCI_DEVICE_ID_INTEL_ELKHART_LAKE_SMBUS		0x4b23
 #define PCI_DEVICE_ID_INTEL_JASPER_LAKE_SMBUS		0x4da3
 #define PCI_DEVICE_ID_INTEL_BROXTON_SMBUS		0x5ad4
@@ -1077,6 +1079,7 @@ static const struct pci_device_id i801_ids[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_COMETLAKE_V_SMBUS) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_ELKHART_LAKE_SMBUS) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_TIGERLAKE_LP_SMBUS) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_TIGERLAKE_H_SMBUS) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_JASPER_LAKE_SMBUS) },
 	{ 0, }
 };
@@ -1751,6 +1754,7 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	case PCI_DEVICE_ID_INTEL_COMETLAKE_H_SMBUS:
 	case PCI_DEVICE_ID_INTEL_ELKHART_LAKE_SMBUS:
 	case PCI_DEVICE_ID_INTEL_TIGERLAKE_LP_SMBUS:
+	case PCI_DEVICE_ID_INTEL_TIGERLAKE_H_SMBUS:
 	case PCI_DEVICE_ID_INTEL_JASPER_LAKE_SMBUS:
 	case PCI_DEVICE_ID_INTEL_EBG_SMBUS:
 		priv->features |= FEATURE_BLOCK_PROC;
-- 
2.27.0

