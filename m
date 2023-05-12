Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B74F700731
	for <lists+linux-i2c@lfdr.de>; Fri, 12 May 2023 13:50:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240555AbjELLuN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 12 May 2023 07:50:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240096AbjELLuM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 12 May 2023 07:50:12 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 987AE10E53
        for <linux-i2c@vger.kernel.org>; Fri, 12 May 2023 04:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683892211; x=1715428211;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7UGKqoB3RXyPlU4JIrJNegPCP297rndsH0PtDhkqxUk=;
  b=Pm3ictWLmo9Tnntek7Tcd5CXTzUSOp7c7MH6m5ZJISfW+6gJEnchrmUk
   3+Tz61lqZKHt349MI9PHyaL+xuvO/xXp9iiqW/EoShVV73uaIbh3ESp4K
   a23CG46QoCpcoU3/SwXNshWwqVrDZBVHv8pshNOP/GIgcAnRZY4qKahoH
   ZSahbo8HvjPp0PYhXDGJFU2Wu26Psf4lOW2975xVmj79HyeXFPl7qDyHM
   eUxeVo0ERkdZx9vY0xdVUQW6q3OYOC4V03xDemHCwsuf/A42xRa7fwxVh
   fYYdtYiaJ44ZP3PdRL0NeQfdxjR4R0P9+8HhIASlhkv6Q4E/22SFtq9/X
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="414141038"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="414141038"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2023 04:50:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="812062247"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="812062247"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.143])
  by fmsmga002.fm.intel.com with ESMTP; 12 May 2023 04:50:10 -0700
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
To:     linux-i2c@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.com>, Wolfram Sang <wsa@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH v3 2/3] i2c: i801: Add support for Intel Meteor Lake SoC-S
Date:   Fri, 12 May 2023 14:50:00 +0300
Message-Id: <20230512115001.81309-2-jarkko.nikula@linux.intel.com>
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

Add SMBus PCI ID on Intel Meteor Lake SoC-S South.

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
v3: Call this explicitly as Meteor Lake SoC-S SMBus controller for
    distinguish from Meteor Lake PCH-S SMBus controller in patch 3/3.
v2: Keep PCI ID define list sorted and define
    PCI_DEVICE_ID_INTEL_METEOR_LAKE_S_SMBUS in correct place.
---
 drivers/i2c/busses/i2c-i801.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 7431e8411e99..bc2576188e0a 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -77,6 +77,7 @@
  * Alder Lake-M (PCH)		0x54a3	32	hard	yes	yes	yes
  * Raptor Lake-S (PCH)		0x7a23	32	hard	yes	yes	yes
  * Meteor Lake-P (SOC)		0x7e22	32	hard	yes	yes	yes
+ * Meteor Lake SoC-S (SOC)	0xae22	32	hard	yes	yes	yes
  *
  * Features supported by this driver:
  * Software PEC				no
@@ -250,6 +251,7 @@
 #define PCI_DEVICE_ID_INTEL_KABYLAKE_PCH_H_SMBUS	0xa2a3
 #define PCI_DEVICE_ID_INTEL_CANNONLAKE_H_SMBUS		0xa323
 #define PCI_DEVICE_ID_INTEL_COMETLAKE_V_SMBUS		0xa3a3
+#define PCI_DEVICE_ID_INTEL_METEOR_LAKE_SOC_S_SMBUS	0xae22
 
 struct i801_mux_config {
 	char *gpio_chip;
@@ -1038,6 +1040,7 @@ static const struct pci_device_id i801_ids[] = {
 	{ PCI_DEVICE_DATA(INTEL, ALDER_LAKE_M_SMBUS,		FEATURES_ICH5 | FEATURE_TCO_CNL) },
 	{ PCI_DEVICE_DATA(INTEL, RAPTOR_LAKE_S_SMBUS,		FEATURES_ICH5 | FEATURE_TCO_CNL) },
 	{ PCI_DEVICE_DATA(INTEL, METEOR_LAKE_P_SMBUS,		FEATURES_ICH5 | FEATURE_TCO_CNL) },
+	{ PCI_DEVICE_DATA(INTEL, METEOR_LAKE_SOC_S_SMBUS,	FEATURES_ICH5 | FEATURE_TCO_CNL) },
 	{ 0, }
 };
 
-- 
2.39.2

