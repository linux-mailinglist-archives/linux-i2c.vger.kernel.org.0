Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69DD546C389
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Dec 2021 20:22:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234746AbhLGTZx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Dec 2021 14:25:53 -0500
Received: from mga09.intel.com ([134.134.136.24]:2083 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234089AbhLGTZk (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 7 Dec 2021 14:25:40 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10190"; a="237474912"
X-IronPort-AV: E=Sophos;i="5.87,295,1631602800"; 
   d="scan'208";a="237474912"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2021 11:22:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,295,1631602800"; 
   d="scan'208";a="600287768"
Received: from black.fi.intel.com ([10.237.72.28])
  by FMSMGA003.fm.intel.com with ESMTP; 07 Dec 2021 11:22:04 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id E8AD1325; Tue,  7 Dec 2021 21:22:07 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Ajay Gupta <ajayg@nvidia.com>
Subject: [PATCH v1 08/11] i2c: designware-pci: Add a note about struct dw_scl_sda_cfg usage
Date:   Tue,  7 Dec 2021 21:21:56 +0200
Message-Id: <20211207192159.41383-8-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211207192159.41383-1-andriy.shevchenko@linux.intel.com>
References: <20211207192159.41383-1-andriy.shevchenko@linux.intel.com>
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
index 87bdf7acb612..c1b57895e8ab 100644
--- a/drivers/i2c/busses/i2c-designware-pcidrv.c
+++ b/drivers/i2c/busses/i2c-designware-pcidrv.c
@@ -39,6 +39,13 @@ enum dw_pci_ctl_id_t {
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
2.33.0

