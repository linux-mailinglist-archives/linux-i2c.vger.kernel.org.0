Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04C9C55FE3E
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Jun 2022 13:09:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229911AbiF2LJq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Jun 2022 07:09:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229777AbiF2LJp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Jun 2022 07:09:45 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5EFA366AC
        for <linux-i2c@vger.kernel.org>; Wed, 29 Jun 2022 04:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656500983; x=1688036983;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ULCgjRxRN+bzuHcuaJVLnI2lEopSAWzdfPbayREsi6E=;
  b=GKjDyB81n6KsZGH07ra/PFJWuzNdY3Vx9aHPXT9LR1fHvyQtIYDIf1nt
   OpjU82oMHp9bJZsemf+Ywu2VDfiYxGpf65mnecXeFMd8pgzX0COdGtI7s
   DtzU/VOATr41oR3QmGWcIo+xhB/bPy/KDuS1l0wioL+G35gwqQdYUXOJN
   7E/rbwyP6gzmOy0qlTKnhZ51MluFlPIE+Ytow7ckLJKjmZrljiyES9Co2
   s8ue5YZDbFJDtTvIsixP8kHZmDFgyOA+JHMsyLGijCgCNbgrZZQs41R0K
   tHDgWLLfq7msGReQY8JJLWZkuf1aPQjBf+iwJNSv1QKBlVisrQwdVBvZy
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10392"; a="270766338"
X-IronPort-AV: E=Sophos;i="5.92,231,1650956400"; 
   d="scan'208";a="270766338"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2022 04:09:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,231,1650956400"; 
   d="scan'208";a="693534809"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.55])
  by fmsmga002.fm.intel.com with ESMTP; 29 Jun 2022 04:09:41 -0700
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>, Jean Delvare <jdelvare@suse.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH] i2c: i801: Add support for Intel Meteor Lake PCH-P
Date:   Wed, 29 Jun 2022 14:09:18 +0300
Message-Id: <20220629110918.613484-1-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add SMBus PCI ID on Intel Meteor Lake PCH-P.

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
 Documentation/i2c/busses/i2c-i801.rst | 1 +
 drivers/i2c/busses/Kconfig            | 1 +
 drivers/i2c/busses/i2c-i801.c         | 3 +++
 3 files changed, 5 insertions(+)

diff --git a/Documentation/i2c/busses/i2c-i801.rst b/Documentation/i2c/busses/i2c-i801.rst
index cad59170b2ad..615a3a92aa88 100644
--- a/Documentation/i2c/busses/i2c-i801.rst
+++ b/Documentation/i2c/busses/i2c-i801.rst
@@ -46,6 +46,7 @@ Supported adapters:
   * Intel Emmitsburg (PCH)
   * Intel Alder Lake (PCH)
   * Intel Raptor Lake (PCH)
+  * Intel Meteor Lake (PCH)
 
    Datasheets: Publicly available at the Intel website
 
diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index b1d7069dd377..de32231d5cd4 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -156,6 +156,7 @@ config I2C_I801
 	    Emmitsburg (PCH)
 	    Alder Lake (PCH)
 	    Raptor Lake (PCH)
+	    Meteor Lake (PCH)
 
 	  This driver can also be built as a module.  If so, the module
 	  will be called i2c-i801.
diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index ff706349bdfb..88865ae54dcf 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -76,6 +76,7 @@
  * Alder Lake-P (PCH)		0x51a3	32	hard	yes	yes	yes
  * Alder Lake-M (PCH)		0x54a3	32	hard	yes	yes	yes
  * Raptor Lake-S (PCH)		0x7a23	32	hard	yes	yes	yes
+ * Meteor Lake-P (PCH)		0x7e22	32	hard	yes	yes	yes
  *
  * Features supported by this driver:
  * Software PEC				no
@@ -231,6 +232,7 @@
 #define PCI_DEVICE_ID_INTEL_BROXTON_SMBUS		0x5ad4
 #define PCI_DEVICE_ID_INTEL_RAPTOR_LAKE_S_SMBUS		0x7a23
 #define PCI_DEVICE_ID_INTEL_ALDER_LAKE_S_SMBUS		0x7aa3
+#define PCI_DEVICE_ID_INTEL_METEOR_LAKE_P_SMBUS		0x7e22
 #define PCI_DEVICE_ID_INTEL_LYNXPOINT_SMBUS		0x8c22
 #define PCI_DEVICE_ID_INTEL_WILDCATPOINT_SMBUS		0x8ca2
 #define PCI_DEVICE_ID_INTEL_WELLSBURG_SMBUS		0x8d22
@@ -1049,6 +1051,7 @@ static const struct pci_device_id i801_ids[] = {
 	{ PCI_DEVICE_DATA(INTEL, ALDER_LAKE_P_SMBUS,	FEATURES_ICH5 | FEATURE_TCO_CNL) },
 	{ PCI_DEVICE_DATA(INTEL, ALDER_LAKE_M_SMBUS,	FEATURES_ICH5 | FEATURE_TCO_CNL) },
 	{ PCI_DEVICE_DATA(INTEL, RAPTOR_LAKE_S_SMBUS,	FEATURES_ICH5 | FEATURE_TCO_CNL) },
+	{ PCI_DEVICE_DATA(INTEL, METEOR_LAKE_P_SMBUS,	FEATURES_ICH5 | FEATURE_TCO_CNL) },
 	{ 0, }
 };
 
-- 
2.35.1

