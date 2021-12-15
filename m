Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82F4D475B86
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Dec 2021 16:12:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243797AbhLOPMP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Dec 2021 10:12:15 -0500
Received: from mga18.intel.com ([134.134.136.126]:62944 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243810AbhLOPMO (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 15 Dec 2021 10:12:14 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10198"; a="226104865"
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; 
   d="scan'208";a="226104865"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2021 07:12:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; 
   d="scan'208";a="518801178"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.88])
  by orsmga008.jf.intel.com with ESMTP; 15 Dec 2021 07:12:12 -0800
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH 3/6] i2c: designware-pci: Add a note about struct dw_scl_sda_cfg usage
Date:   Wed, 15 Dec 2021 17:12:02 +0200
Message-Id: <20211215151205.584264-3-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211215151205.584264-1-jarkko.nikula@linux.intel.com>
References: <20211215151205.584264-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Add a note about struct dw_scl_sda_cfg usage to discourage people
of using this structure on new platforms. Instead they should try
hard to put the needed information into firmware descriptions.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-pcidrv.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
index 5b45941bcbdd..f49c41ba5647 100644
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
 	u16 ss_hcnt;
 	u16 fs_hcnt;
-- 
2.34.1

