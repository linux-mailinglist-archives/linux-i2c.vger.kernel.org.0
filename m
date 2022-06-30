Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 201B656136B
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Jun 2022 09:42:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232963AbiF3HmW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 30 Jun 2022 03:42:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233081AbiF3HmV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 30 Jun 2022 03:42:21 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20C323B28F
        for <linux-i2c@vger.kernel.org>; Thu, 30 Jun 2022 00:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656574940; x=1688110940;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=TD6Y67lS6VH/UtsCL2w1SYgIpw2BefgogtLPpksqpIQ=;
  b=KFnppb7b/zYPnsNqqq/V1+kHhzJxKCbstC0NIQLcXbcJVjCVg7ikJQ57
   1mAmqK2pUzxEKPCKUBIf7AARIdjXDsm/VLJ0kP+Bdzdm3cdcoDOSOLJvz
   6oQwXRB1p2/2/iXmTXU6S0FTUOi6nogL6NfN3Bc7wz9sMoDtC/2S7I2g6
   FGhQofIGR13UGoA5chwSv1AT+hLRprQtFLpDGXGrA079lxIxhHoGYkCiu
   Ti56f3h0PhTNrro7URbll4d6CEVBu/eoVwrhRdted+vPLDqo6NvqbZytO
   /mGt5ZuOLsJNIuRy5dmJc7Pi/kI0TabohLDmxlcXI1SnPmQnsEAsno1yb
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10393"; a="262072255"
X-IronPort-AV: E=Sophos;i="5.92,233,1650956400"; 
   d="scan'208";a="262072255"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2022 00:41:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,233,1650956400"; 
   d="scan'208";a="768031309"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.55])
  by orsmga005.jf.intel.com with ESMTP; 30 Jun 2022 00:41:57 -0700
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>, Jean Delvare <jdelvare@suse.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH v2] i2c: i801: Add support for Intel Meteor Lake-P
Date:   Thu, 30 Jun 2022 10:41:54 +0300
Message-Id: <20220630074154.692578-1-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add SMBus PCI ID on Intel Meteor Lake-P.

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
v2. Meteor Lake-P doesn't have a PCH die but integrates the
functionality into a SoC. Change commit log and patch diff accordingly.
Thanks to Andy Shevchenko for noticing this in an another patch.
---
 Documentation/i2c/busses/i2c-i801.rst | 1 +
 drivers/i2c/busses/Kconfig            | 1 +
 drivers/i2c/busses/i2c-i801.c         | 3 +++
 3 files changed, 5 insertions(+)

diff --git a/Documentation/i2c/busses/i2c-i801.rst b/Documentation/i2c/busses/i2c-i801.rst
index cad59170b2ad..ab9e850e8fe0 100644
--- a/Documentation/i2c/busses/i2c-i801.rst
+++ b/Documentation/i2c/busses/i2c-i801.rst
@@ -46,6 +46,7 @@ Supported adapters:
   * Intel Emmitsburg (PCH)
   * Intel Alder Lake (PCH)
   * Intel Raptor Lake (PCH)
+  * Intel Meteor Lake (SOC)
 
    Datasheets: Publicly available at the Intel website
 
diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index b1d7069dd377..3f6d03073079 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -156,6 +156,7 @@ config I2C_I801
 	    Emmitsburg (PCH)
 	    Alder Lake (PCH)
 	    Raptor Lake (PCH)
+	    Meteor Lake (SOC)
 
 	  This driver can also be built as a module.  If so, the module
 	  will be called i2c-i801.
diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index ff706349bdfb..9e5b87e107ba 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -76,6 +76,7 @@
  * Alder Lake-P (PCH)		0x51a3	32	hard	yes	yes	yes
  * Alder Lake-M (PCH)		0x54a3	32	hard	yes	yes	yes
  * Raptor Lake-S (PCH)		0x7a23	32	hard	yes	yes	yes
+ * Meteor Lake-P (SOC)		0x7e22	32	hard	yes	yes	yes
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

