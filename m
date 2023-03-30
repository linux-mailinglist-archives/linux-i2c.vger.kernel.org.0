Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 426066D0237
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Mar 2023 12:56:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229820AbjC3K4I (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 30 Mar 2023 06:56:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230123AbjC3K4H (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 30 Mar 2023 06:56:07 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7449E9743
        for <linux-i2c@vger.kernel.org>; Thu, 30 Mar 2023 03:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680173735; x=1711709735;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mrKzmh3Ho684tEceN04B4eLDMGn2BPXCnSRG03/Z9Ek=;
  b=OIqHOYITeKIvXVgAUq2CeeVBp78fBbrtGEtNlOB3sy8eYN+w+66nu/TU
   +1dm+CJ1c8Jt1qznUQ3rcFe7CTKjZtV43DaBZRECK8Oej9L0U6LiTnTmT
   EQjPaeHU8MZwYpizNo/fDIKr/DHOfaju1bzHIsz2k4Ytqzwx5hTpMg630
   MF8hNKEszArRIegndPSGjYN9ibQBMO0YXU3mUv0PSVVloCLeVqUl+8hIu
   x+Q3swfMzhkyjy5K+cVonaXLvL/3kPctMKQyH3BbBJw5cU+knGrmHQ+EM
   CyqllX0JDP6CQ2prI5mpe+AcSJVTpv9RQmjD4Rr4+KlgOMjaQe58qiulQ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="329628960"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; 
   d="scan'208";a="329628960"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 03:55:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="753953688"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; 
   d="scan'208";a="753953688"
Received: from unknown (HELO mylly.fi.intel.com.) ([10.237.72.51])
  by fmsmga004.fm.intel.com with ESMTP; 30 Mar 2023 03:55:16 -0700
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
To:     linux-i2c@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.com>, Wolfram Sang <wsa@kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH 2/2] i2c: i801: Add support for Intel Meteor Lake PCH-S
Date:   Thu, 30 Mar 2023 13:55:02 +0300
Message-Id: <20230330105502.4100351-2-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230330105502.4100351-1-jarkko.nikula@linux.intel.com>
References: <20230330105502.4100351-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add SMBus PCI ID on Intel Meteor Lake PCH-S. Also called as Meteor
Point-S which is used in the code to distinguish from Meteor Lake-S SoC
but call both as Meteor Lake in documentation and Kconfig.

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
 Documentation/i2c/busses/i2c-i801.rst | 2 +-
 drivers/i2c/busses/Kconfig            | 2 +-
 drivers/i2c/busses/i2c-i801.c         | 3 +++
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/i2c/busses/i2c-i801.rst b/Documentation/i2c/busses/i2c-i801.rst
index ab9e850e8fe0..e62a62323f36 100644
--- a/Documentation/i2c/busses/i2c-i801.rst
+++ b/Documentation/i2c/busses/i2c-i801.rst
@@ -46,7 +46,7 @@ Supported adapters:
   * Intel Emmitsburg (PCH)
   * Intel Alder Lake (PCH)
   * Intel Raptor Lake (PCH)
-  * Intel Meteor Lake (SOC)
+  * Intel Meteor Lake (SOC/PCH)
 
    Datasheets: Publicly available at the Intel website
 
diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 9fa4a7bb5c8b..93bb71bdf64d 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -157,7 +157,7 @@ config I2C_I801
 	    Emmitsburg (PCH)
 	    Alder Lake (PCH)
 	    Raptor Lake (PCH)
-	    Meteor Lake (SOC)
+	    Meteor Lake (SOC/PCH)
 
 	  This driver can also be built as a module.  If so, the module
 	  will be called i2c-i801.
diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 8172e2767b25..dca605d8cdc2 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -78,6 +78,7 @@
  * Raptor Lake-S (PCH)		0x7a23	32	hard	yes	yes	yes
  * Meteor Lake-P (SOC)		0x7e22	32	hard	yes	yes	yes
  * Meteor Lake-S (SOC)		0xae22	32	hard	yes	yes	yes
+ * Meteor Point-S (PCH)		0x7f23	32	hard	yes	yes	yes
  *
  * Features supported by this driver:
  * Software PEC				no
@@ -234,6 +235,7 @@
 #define PCI_DEVICE_ID_INTEL_RAPTOR_LAKE_S_SMBUS		0x7a23
 #define PCI_DEVICE_ID_INTEL_ALDER_LAKE_S_SMBUS		0x7aa3
 #define PCI_DEVICE_ID_INTEL_METEOR_LAKE_P_SMBUS		0x7e22
+#define PCI_DEVICE_ID_INTEL_METEOR_POINT_S_SMBUS	0x7f23
 #define PCI_DEVICE_ID_INTEL_METEOR_LAKE_S_SMBUS		0xae22
 #define PCI_DEVICE_ID_INTEL_LYNXPOINT_SMBUS		0x8c22
 #define PCI_DEVICE_ID_INTEL_WILDCATPOINT_SMBUS		0x8ca2
@@ -1041,6 +1043,7 @@ static const struct pci_device_id i801_ids[] = {
 	{ PCI_DEVICE_DATA(INTEL, RAPTOR_LAKE_S_SMBUS,	FEATURES_ICH5 | FEATURE_TCO_CNL) },
 	{ PCI_DEVICE_DATA(INTEL, METEOR_LAKE_P_SMBUS,	FEATURES_ICH5 | FEATURE_TCO_CNL) },
 	{ PCI_DEVICE_DATA(INTEL, METEOR_LAKE_S_SMBUS,	FEATURES_ICH5 | FEATURE_TCO_CNL) },
+	{ PCI_DEVICE_DATA(INTEL, METEOR_POINT_S_SMBUS,	FEATURES_ICH5 | FEATURE_TCO_CNL) },
 	{ 0, }
 };
 
-- 
2.39.2

