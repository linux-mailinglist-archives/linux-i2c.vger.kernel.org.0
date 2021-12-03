Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E951C467C4F
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Dec 2021 18:13:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352819AbhLCRQt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 3 Dec 2021 12:16:49 -0500
Received: from mga07.intel.com ([134.134.136.100]:4516 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235278AbhLCRQt (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 3 Dec 2021 12:16:49 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10187"; a="300399758"
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800"; 
   d="scan'208";a="300399758"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2021 09:13:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800"; 
   d="scan'208";a="577551858"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga004.fm.intel.com with ESMTP; 03 Dec 2021 09:13:16 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 2EC8A178; Fri,  3 Dec 2021 19:13:21 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v1 1/1] i2c: designware: Add a note about struct dw_scl_sda_cfg usage
Date:   Fri,  3 Dec 2021 19:13:18 +0200
Message-Id: <20211203171318.62503-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add a note about struct dw_scl_sda_cfg usage to discourage people
of using this structure on new platforms. Instead they should try
hard to put the needed information into firmware descriptions.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-pcidrv.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
index 0f409a4c2da0..3ba506c3a9a9 100644
--- a/drivers/i2c/busses/i2c-designware-pcidrv.c
+++ b/drivers/i2c/busses/i2c-designware-pcidrv.c
@@ -38,6 +38,13 @@ enum dw_pci_ctl_id_t {
 	navi_amd,
 };
 
+/*
+ * This is a legacy structure to describe the hardware counters
+ * to configure signal timings on the bus. For Device Tree platforms
+ * one should use the respective properties and for ACPI there is
+ * a set of ACPI methods that provide these counters. No new
+ * platform should use this structure.
+ */
 struct dw_scl_sda_cfg {
 	u32 ss_hcnt;
 	u32 fs_hcnt;
-- 
2.33.0

