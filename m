Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD8686ECAC5
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Apr 2023 12:58:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230185AbjDXK6I (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Apr 2023 06:58:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229625AbjDXK6I (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Apr 2023 06:58:08 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B362A212B
        for <linux-i2c@vger.kernel.org>; Mon, 24 Apr 2023 03:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682333885; x=1713869885;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=gvNUKEjojcPfzuaNJmCTw9X+yxGtu3o05gWMt12YX7Y=;
  b=PiJNKX5aNjOyBsVTcogEOuilLd4IkqE41p1S6Dm2qfb8iaieWYx0ERJ0
   PTzrsv85QPYD+cz7Koqkdh2cWBNpfuUZ6Mcljfu2q0hIdLP4wJ9PhGgPw
   Wg9KU7dIA29LskHiSKPR6QclL52Kr3nMlNfELV3q515AC3aZtEmpuybwC
   DZQNtPykFAcagBBndvWA+dk37dNDi6Jb0CDwFpJeCEKmtjapXrCLEohCD
   I7WogbWUCfYa2XC6XU9ibTsLH5pcvtPogYXM0Nxs+CrT3TksQcjzqhXnW
   5Wfe7B0y9ODVvqkUZjteKRXL4e8MLOROi8gtzZYZBpxcWu1OgZYtKxGtL
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10689"; a="326742200"
X-IronPort-AV: E=Sophos;i="5.99,222,1677571200"; 
   d="scan'208";a="326742200"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2023 03:58:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10689"; a="723544027"
X-IronPort-AV: E=Sophos;i="5.99,222,1677571200"; 
   d="scan'208";a="723544027"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.175])
  by orsmga008.jf.intel.com with ESMTP; 24 Apr 2023 03:58:03 -0700
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
To:     linux-i2c@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.com>, Wolfram Sang <wsa@kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH v2 1/2] i2c: i801: Add support for Intel Meteor Lake-S SoC
Date:   Mon, 24 Apr 2023 13:57:56 +0300
Message-Id: <20230424105757.732150-1-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.39.2
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

Add SMBus PCI ID on Intel Meteor Lake-S SoC South.

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
v2: Keep PCI ID define list sorted and define
    PCI_DEVICE_ID_INTEL_METEOR_LAKE_S_SMBUS in correct place.
---
 drivers/i2c/busses/i2c-i801.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index ac5326747c51..86a1054ee9e4 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -77,6 +77,7 @@
  * Alder Lake-M (PCH)		0x54a3	32	hard	yes	yes	yes
  * Raptor Lake-S (PCH)		0x7a23	32	hard	yes	yes	yes
  * Meteor Lake-P (SOC)		0x7e22	32	hard	yes	yes	yes
+ * Meteor Lake-S (SOC)		0xae22	32	hard	yes	yes	yes
  *
  * Features supported by this driver:
  * Software PEC				no
@@ -250,6 +251,7 @@
 #define PCI_DEVICE_ID_INTEL_KABYLAKE_PCH_H_SMBUS	0xa2a3
 #define PCI_DEVICE_ID_INTEL_CANNONLAKE_H_SMBUS		0xa323
 #define PCI_DEVICE_ID_INTEL_COMETLAKE_V_SMBUS		0xa3a3
+#define PCI_DEVICE_ID_INTEL_METEOR_LAKE_S_SMBUS		0xae22
 
 struct i801_mux_config {
 	char *gpio_chip;
@@ -1038,6 +1040,7 @@ static const struct pci_device_id i801_ids[] = {
 	{ PCI_DEVICE_DATA(INTEL, ALDER_LAKE_M_SMBUS,	FEATURES_ICH5 | FEATURE_TCO_CNL) },
 	{ PCI_DEVICE_DATA(INTEL, RAPTOR_LAKE_S_SMBUS,	FEATURES_ICH5 | FEATURE_TCO_CNL) },
 	{ PCI_DEVICE_DATA(INTEL, METEOR_LAKE_P_SMBUS,	FEATURES_ICH5 | FEATURE_TCO_CNL) },
+	{ PCI_DEVICE_DATA(INTEL, METEOR_LAKE_S_SMBUS,	FEATURES_ICH5 | FEATURE_TCO_CNL) },
 	{ 0, }
 };
 
-- 
2.39.2

