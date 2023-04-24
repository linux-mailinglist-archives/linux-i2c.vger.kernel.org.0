Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03EF86ECAC6
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Apr 2023 12:58:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229625AbjDXK6J (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Apr 2023 06:58:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbjDXK6I (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Apr 2023 06:58:08 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E37C41FDE
        for <linux-i2c@vger.kernel.org>; Mon, 24 Apr 2023 03:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682333887; x=1713869887;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aT0yOqNZGQ97sHLsVKTCY0oCbm7VJAjyaLUrp4VtQ1k=;
  b=PZjkAcmBJvu8jrzhegHK9fcLa/8Y3ZRzqfLEg0scqzyqvKG0VJkbnBVG
   lEv9z0W0tVttBzWxaYcHYLV7L4ps/oMSOzVPH0uS1kkTVSAxmFHE+dKWR
   4zygRqUvq3rrxTq7HwpuqFbQukIcJp4QtGiTLmogG7nkAPFXysN8fsAl0
   jKZ5JVvdaJ1oKGSC/G4fO41nhsg7+F8HgQeKTJ08RubDhK2H+qmI6LVgS
   0jbIrOrBhJqvozQ5Y/l6yflLkVj7VEVUEmuTq+E6t1gGXugQLJX6eOsi6
   HNGcMYLS9hDw+R64EIgrZWzaAYJLWBUksRvCujDpqfJqSjIITPxyBcu9P
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10689"; a="326742210"
X-IronPort-AV: E=Sophos;i="5.99,222,1677571200"; 
   d="scan'208";a="326742210"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2023 03:58:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10689"; a="723544048"
X-IronPort-AV: E=Sophos;i="5.99,222,1677571200"; 
   d="scan'208";a="723544048"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.175])
  by orsmga008.jf.intel.com with ESMTP; 24 Apr 2023 03:58:05 -0700
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
To:     linux-i2c@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.com>, Wolfram Sang <wsa@kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH v2 2/2] i2c: i801: Add support for Intel Meteor Lake PCH-S
Date:   Mon, 24 Apr 2023 13:57:57 +0300
Message-Id: <20230424105757.732150-2-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230424105757.732150-1-jarkko.nikula@linux.intel.com>
References: <20230424105757.732150-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
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
Hi Jean. This is essentially the same than v1 with following minor
changes:
v2: "SOC/PCH" -> "SOC and PCH" in documentation and Kconfig. PCI ID
    define according to updated patch 1/2.
---
 Documentation/i2c/busses/i2c-i801.rst | 2 +-
 drivers/i2c/busses/Kconfig            | 2 +-
 drivers/i2c/busses/i2c-i801.c         | 3 +++
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/i2c/busses/i2c-i801.rst b/Documentation/i2c/busses/i2c-i801.rst
index ab9e850e8fe0..e76e68ccf718 100644
--- a/Documentation/i2c/busses/i2c-i801.rst
+++ b/Documentation/i2c/busses/i2c-i801.rst
@@ -46,7 +46,7 @@ Supported adapters:
   * Intel Emmitsburg (PCH)
   * Intel Alder Lake (PCH)
   * Intel Raptor Lake (PCH)
-  * Intel Meteor Lake (SOC)
+  * Intel Meteor Lake (SOC and PCH)
 
    Datasheets: Publicly available at the Intel website
 
diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 87600b4aacb3..3144ef99f040 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -157,7 +157,7 @@ config I2C_I801
 	    Emmitsburg (PCH)
 	    Alder Lake (PCH)
 	    Raptor Lake (PCH)
-	    Meteor Lake (SOC)
+	    Meteor Lake (SOC and PCH)
 
 	  This driver can also be built as a module.  If so, the module
 	  will be called i2c-i801.
diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 86a1054ee9e4..7217263088c3 100644
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
 #define PCI_DEVICE_ID_INTEL_LYNXPOINT_SMBUS		0x8c22
 #define PCI_DEVICE_ID_INTEL_WILDCATPOINT_SMBUS		0x8ca2
 #define PCI_DEVICE_ID_INTEL_WELLSBURG_SMBUS		0x8d22
@@ -1041,6 +1043,7 @@ static const struct pci_device_id i801_ids[] = {
 	{ PCI_DEVICE_DATA(INTEL, RAPTOR_LAKE_S_SMBUS,	FEATURES_ICH5 | FEATURE_TCO_CNL) },
 	{ PCI_DEVICE_DATA(INTEL, METEOR_LAKE_P_SMBUS,	FEATURES_ICH5 | FEATURE_TCO_CNL) },
 	{ PCI_DEVICE_DATA(INTEL, METEOR_LAKE_S_SMBUS,	FEATURES_ICH5 | FEATURE_TCO_CNL) },
+	{ PCI_DEVICE_DATA(INTEL, METEOR_POINT_S_SMBUS,	FEATURES_ICH5 | FEATURE_TCO_CNL) },
 	{ 0, }
 };
 
-- 
2.39.2

