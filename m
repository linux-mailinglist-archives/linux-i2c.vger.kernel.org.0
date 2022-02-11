Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B4BF14B2896
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Feb 2022 16:00:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237878AbiBKPAS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Feb 2022 10:00:18 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:53232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236812AbiBKPAS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 11 Feb 2022 10:00:18 -0500
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1884B94
        for <linux-i2c@vger.kernel.org>; Fri, 11 Feb 2022 07:00:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644591617; x=1676127617;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=zrte9sz5q3Q5Gy/uXAOpXlIfKmKgRBPwrufqvOK8dRw=;
  b=Y9jCm5YslIQxYYfsOaKatSqXVyPeQzBmO+MiKiOd4U1ZqQR3wegC3AXC
   UQLbhNyrnNnJLym6c5z3SEM/yoaCphOpkPX53q9w9o590ldXoIWtYBBMf
   weLFUVhEkJBO5Vyxfax8iWvhVzo193IfwIe8kDqCXj9kzrdSnE9/lPpyH
   xL2T2XSAI3TcVCO2hbwvBz5Anmj5Idzc/CD6xiRGw6nSpDnMH0zfukCgP
   QigSg+9dvUJNvFk/fs5p5/S2bkZQ3Rnarp8tUvy3mRp0PynqzTnqWPuo5
   zlH3Ox+4SgbwUD0IQAT71JsBTIopugl73Ze1UG1OptFxQOgeUvbVQZiFp
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10254"; a="313026111"
X-IronPort-AV: E=Sophos;i="5.88,361,1635231600"; 
   d="scan'208";a="313026111"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2022 07:00:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,361,1635231600"; 
   d="scan'208";a="679527716"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.152])
  by fmsmga001.fm.intel.com with ESMTP; 11 Feb 2022 07:00:04 -0800
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>, Jean Delvare <jdelvare@suse.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH] i2c: i801: Add support for Intel Raptor Lake PCH-S
Date:   Fri, 11 Feb 2022 17:00:01 +0200
Message-Id: <20220211150001.1004004-1-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add SMBus PCI ID on Intel Raptor Lake PCH-S.

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
 Documentation/i2c/busses/i2c-i801.rst | 1 +
 drivers/i2c/busses/Kconfig            | 1 +
 drivers/i2c/busses/i2c-i801.c         | 3 +++
 3 files changed, 5 insertions(+)

diff --git a/Documentation/i2c/busses/i2c-i801.rst b/Documentation/i2c/busses/i2c-i801.rst
index 42bbdd6e7fd8..cad59170b2ad 100644
--- a/Documentation/i2c/busses/i2c-i801.rst
+++ b/Documentation/i2c/busses/i2c-i801.rst
@@ -45,6 +45,7 @@ Supported adapters:
   * Intel Jasper Lake (SOC)
   * Intel Emmitsburg (PCH)
   * Intel Alder Lake (PCH)
+  * Intel Raptor Lake (PCH)
 
    Datasheets: Publicly available at the Intel website
 
diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 42da31c1ab70..bce0dbb6fd86 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -148,6 +148,7 @@ config I2C_I801
 	    Jasper Lake (SOC)
 	    Emmitsburg (PCH)
 	    Alder Lake (PCH)
+	    Raptor Lake (PCH)
 
 	  This driver can also be built as a module.  If so, the module
 	  will be called i2c-i801.
diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 7428cc6af5cc..36b086ef1378 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -75,6 +75,7 @@
  * Alder Lake-S (PCH)		0x7aa3	32	hard	yes	yes	yes
  * Alder Lake-P (PCH)		0x51a3	32	hard	yes	yes	yes
  * Alder Lake-M (PCH)		0x54a3	32	hard	yes	yes	yes
+ * Raptor Lake-S (PCH)		0x7a23	32	hard	yes	yes	yes
  *
  * Features supported by this driver:
  * Software PEC				no
@@ -228,6 +229,7 @@
 #define PCI_DEVICE_ID_INTEL_ALDER_LAKE_P_SMBUS		0x51a3
 #define PCI_DEVICE_ID_INTEL_ALDER_LAKE_M_SMBUS		0x54a3
 #define PCI_DEVICE_ID_INTEL_BROXTON_SMBUS		0x5ad4
+#define PCI_DEVICE_ID_INTEL_RAPTOR_LAKE_S_SMBUS		0x7a23
 #define PCI_DEVICE_ID_INTEL_ALDER_LAKE_S_SMBUS		0x7aa3
 #define PCI_DEVICE_ID_INTEL_LYNXPOINT_SMBUS		0x8c22
 #define PCI_DEVICE_ID_INTEL_WILDCATPOINT_SMBUS		0x8ca2
@@ -1041,6 +1043,7 @@ static const struct pci_device_id i801_ids[] = {
 	{ PCI_DEVICE_DATA(INTEL, ALDER_LAKE_S_SMBUS,	FEATURES_ICH5 | FEATURE_TCO_CNL) },
 	{ PCI_DEVICE_DATA(INTEL, ALDER_LAKE_P_SMBUS,	FEATURES_ICH5 | FEATURE_TCO_CNL) },
 	{ PCI_DEVICE_DATA(INTEL, ALDER_LAKE_M_SMBUS,	FEATURES_ICH5 | FEATURE_TCO_CNL) },
+	{ PCI_DEVICE_DATA(INTEL, RAPTOR_LAKE_S_SMBUS,	FEATURES_ICH5 | FEATURE_TCO_CNL) },
 	{ 0, }
 };
 
-- 
2.34.1

