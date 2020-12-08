Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79FE82D2C99
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Dec 2020 15:05:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729334AbgLHOF3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Dec 2020 09:05:29 -0500
Received: from mga01.intel.com ([192.55.52.88]:40835 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729688AbgLHOF3 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 8 Dec 2020 09:05:29 -0500
IronPort-SDR: HzdvPxULDn7jFOMcbyWJjOc9cpEOxEbOiASOT/zq3RpkTxUKvscbk2eG0a6IuacrIegDVYRn2W
 s+tC63rv5mAA==
X-IronPort-AV: E=McAfee;i="6000,8403,9828"; a="192177267"
X-IronPort-AV: E=Sophos;i="5.78,402,1599548400"; 
   d="scan'208";a="192177267"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2020 06:03:40 -0800
IronPort-SDR: me/XlmaAOh2M5L16LWP+YgdDdwXCXminb0tpBS/qGhbpt8MkTBBg1CXMPQmWA5wIvW4KDSYzKn
 BcBZAgKsWFXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,402,1599548400"; 
   d="scan'208";a="317808227"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 08 Dec 2020 06:03:39 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 4B3501C8; Tue,  8 Dec 2020 16:03:38 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, Wolfram Sang <wsa@kernel.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 2/3] i2c: designware: Make register offsets all of the same width
Date:   Tue,  8 Dec 2020 16:03:36 +0200
Message-Id: <20201208140337.33236-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201208140337.33236-1-andriy.shevchenko@linux.intel.com>
References: <20201208140337.33236-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

For the sake of consistency add leading 0 to first register offsets
to make them all of the same width.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-core.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index c129074be63c..85307cfa7109 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -41,9 +41,9 @@
 /*
  * Registers offset
  */
-#define DW_IC_CON		0x0
-#define DW_IC_TAR		0x4
-#define DW_IC_SAR		0x8
+#define DW_IC_CON		0x00
+#define DW_IC_TAR		0x04
+#define DW_IC_SAR		0x08
 #define DW_IC_DATA_CMD		0x10
 #define DW_IC_SS_SCL_HCNT	0x14
 #define DW_IC_SS_SCL_LCNT	0x18
-- 
2.29.2

