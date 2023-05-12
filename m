Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C65A700732
	for <lists+linux-i2c@lfdr.de>; Fri, 12 May 2023 13:50:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240753AbjELLuQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 12 May 2023 07:50:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240096AbjELLuP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 12 May 2023 07:50:15 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4481411574
        for <linux-i2c@vger.kernel.org>; Fri, 12 May 2023 04:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683892214; x=1715428214;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dOaQDMneb3dgVl9WgWOF0/IYIHbtwrPJraHrNmLpW+A=;
  b=dE7l2GleJZtcGbcJYRtDzjyXkozxrge4LSB0hmrQt9c70oQjEtF+gIEu
   xkkuosi8u1kciwy897O3AaZuyr3jmof5mqwgP+eD7kEFf80lrFFhcu+h4
   2LcA1bOvf87UdU4EnXBKjESiLdzqudR+Zgc10LJgSAp/TWu+SfewUVr/R
   BgpLqJKyEQ+Nn2TTenoMcK4bVWJjbRabdSGKLhxoCCz8hvNPZ8FoSwc8s
   YgMC0vj1sg+Hu0gT3PQHWZWS5Gs6wWmBMSndGAm4ZosU0O21ow0j7yD8x
   aBLMSyuZG+eEZXT2y+wkx+9/vS2XM67qqy7ArGWIziqnAZ/5/h0qVC6Ni
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="414141055"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="414141055"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2023 04:50:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="812062269"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="812062269"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.143])
  by fmsmga002.fm.intel.com with ESMTP; 12 May 2023 04:50:12 -0700
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
To:     linux-i2c@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.com>, Wolfram Sang <wsa@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH v3 3/3] i2c: i801: Add support for Intel Meteor Lake PCH-S
Date:   Fri, 12 May 2023 14:50:01 +0300
Message-Id: <20230512115001.81309-3-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230512115001.81309-1-jarkko.nikula@linux.intel.com>
References: <20230512115001.81309-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add SMBus PCI ID on Intel Meteor Lake PCH-S.

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
v3: Drop the idea to call this as Meteor Point-S in code since it's confusing.
    Intel Meteor Lake-S platform can have the SMBus controller both in
    SoC die and PCH. I decided earlier to call latter as Meteor Point-S since
    it fitted nicely into i801_ids table and I saw it to be used somewhere in
    internal documentation. But it's more historical naming convension for
    PCHs and to be honest internal documentation uses mostly Meteor Lake PCH-S.
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
index bc2576188e0a..943b8e6d026d 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -78,6 +78,7 @@
  * Raptor Lake-S (PCH)		0x7a23	32	hard	yes	yes	yes
  * Meteor Lake-P (SOC)		0x7e22	32	hard	yes	yes	yes
  * Meteor Lake SoC-S (SOC)	0xae22	32	hard	yes	yes	yes
+ * Meteor Lake PCH-S (PCH)	0x7f23	32	hard	yes	yes	yes
  *
  * Features supported by this driver:
  * Software PEC				no
@@ -234,6 +235,7 @@
 #define PCI_DEVICE_ID_INTEL_RAPTOR_LAKE_S_SMBUS		0x7a23
 #define PCI_DEVICE_ID_INTEL_ALDER_LAKE_S_SMBUS		0x7aa3
 #define PCI_DEVICE_ID_INTEL_METEOR_LAKE_P_SMBUS		0x7e22
+#define PCI_DEVICE_ID_INTEL_METEOR_LAKE_PCH_S_SMBUS	0x7f23
 #define PCI_DEVICE_ID_INTEL_LYNXPOINT_SMBUS		0x8c22
 #define PCI_DEVICE_ID_INTEL_WILDCATPOINT_SMBUS		0x8ca2
 #define PCI_DEVICE_ID_INTEL_WELLSBURG_SMBUS		0x8d22
@@ -1041,6 +1043,7 @@ static const struct pci_device_id i801_ids[] = {
 	{ PCI_DEVICE_DATA(INTEL, RAPTOR_LAKE_S_SMBUS,		FEATURES_ICH5 | FEATURE_TCO_CNL) },
 	{ PCI_DEVICE_DATA(INTEL, METEOR_LAKE_P_SMBUS,		FEATURES_ICH5 | FEATURE_TCO_CNL) },
 	{ PCI_DEVICE_DATA(INTEL, METEOR_LAKE_SOC_S_SMBUS,	FEATURES_ICH5 | FEATURE_TCO_CNL) },
+	{ PCI_DEVICE_DATA(INTEL, METEOR_LAKE_PCH_S_SMBUS,	FEATURES_ICH5 | FEATURE_TCO_CNL) },
 	{ 0, }
 };
 
-- 
2.39.2

