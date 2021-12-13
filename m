Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E8B1473373
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Dec 2021 19:00:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241621AbhLMSAk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 13 Dec 2021 13:00:40 -0500
Received: from mga01.intel.com ([192.55.52.88]:57909 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238447AbhLMSAj (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 13 Dec 2021 13:00:39 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="262918302"
X-IronPort-AV: E=Sophos;i="5.88,203,1635231600"; 
   d="scan'208";a="262918302"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2021 10:00:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,203,1635231600"; 
   d="scan'208";a="566773390"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 13 Dec 2021 10:00:31 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 2C3185EF; Mon, 13 Dec 2021 20:00:36 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v2 6/6] i2c: designware-pci: Add a note about struct dw_scl_sda_cfg usage
Date:   Mon, 13 Dec 2021 20:00:34 +0200
Message-Id: <20211213180034.30929-6-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211213180034.30929-1-andriy.shevchenko@linux.intel.com>
References: <20211213180034.30929-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add a note about struct dw_scl_sda_cfg usage to discourage people
of using this structure on new platforms. Instead they should try
hard to put the needed information into firmware descriptions.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
v2: added tag (Jarkko)

 drivers/i2c/busses/i2c-designware-pcidrv.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
index bc19d7f59d31..0ae3bbe8ed4e 100644
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
2.33.0

