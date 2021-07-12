Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FB523C5E3D
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jul 2021 16:20:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235207AbhGLOWz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 12 Jul 2021 10:22:55 -0400
Received: from mga12.intel.com ([192.55.52.136]:45957 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235178AbhGLOWy (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 12 Jul 2021 10:22:54 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10042"; a="189672816"
X-IronPort-AV: E=Sophos;i="5.84,234,1620716400"; 
   d="scan'208";a="189672816"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2021 07:20:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,234,1620716400"; 
   d="scan'208";a="561758426"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 12 Jul 2021 07:20:03 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 88ED5B7; Mon, 12 Jul 2021 17:20:30 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        wsa@kernel.org
Subject: [PATCH v3 2/3] i2c: designware: Use DIV_ROUND_CLOSEST() macro
Date:   Mon, 12 Jul 2021 17:20:26 +0300
Message-Id: <20210712142027.22900-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210712142027.22900-1-andriy.shevchenko@linux.intel.com>
References: <20210712142027.22900-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Instead of open-coding DIV_ROUND_CLOSEST() and similar use the macros directly.
While at it, replace numbers with predefined SI metric prefixes.

No functional change intended.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v3: no changes
 drivers/i2c/busses/i2c-designware-common.c  | 8 ++++----
 drivers/i2c/busses/i2c-designware-platdrv.c | 5 +++--
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
index fdc34d9e3702..bf2a4920638a 100644
--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -24,6 +24,7 @@
 #include <linux/regmap.h>
 #include <linux/swab.h>
 #include <linux/types.h>
+#include <linux/units.h>
 
 #include "i2c-designware-core.h"
 
@@ -350,7 +351,7 @@ u32 i2c_dw_scl_hcnt(u32 ic_clk, u32 tSYMBOL, u32 tf, int cond, int offset)
 		 *
 		 * If your hardware is free from tHD;STA issue, try this one.
 		 */
-		return (ic_clk * tSYMBOL + 500000) / 1000000 - 8 + offset;
+		return DIV_ROUND_CLOSEST(ic_clk * tSYMBOL, MICRO) - 8 + offset;
 	else
 		/*
 		 * Conditional expression:
@@ -366,8 +367,7 @@ u32 i2c_dw_scl_hcnt(u32 ic_clk, u32 tSYMBOL, u32 tf, int cond, int offset)
 		 * The reason why we need to take into account "tf" here,
 		 * is the same as described in i2c_dw_scl_lcnt().
 		 */
-		return (ic_clk * (tSYMBOL + tf) + 500000) / 1000000
-			- 3 + offset;
+		return DIV_ROUND_CLOSEST(ic_clk * (tSYMBOL + tf), MICRO) - 3 + offset;
 }
 
 u32 i2c_dw_scl_lcnt(u32 ic_clk, u32 tLOW, u32 tf, int offset)
@@ -383,7 +383,7 @@ u32 i2c_dw_scl_lcnt(u32 ic_clk, u32 tLOW, u32 tf, int offset)
 	 * account the fall time of SCL signal (tf).  Default tf value
 	 * should be 0.3 us, for safety.
 	 */
-	return ((ic_clk * (tLOW + tf) + 500000) / 1000000) - 1 + offset;
+	return DIV_ROUND_CLOSEST(ic_clk * (tLOW + tf), MICRO) - 1 + offset;
 }
 
 int i2c_dw_set_sda_hold(struct dw_i2c_dev *dev)
diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 4b37f28ec0c6..21113665ddea 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -31,12 +31,13 @@
 #include <linux/sched.h>
 #include <linux/slab.h>
 #include <linux/suspend.h>
+#include <linux/units.h>
 
 #include "i2c-designware-core.h"
 
 static u32 i2c_dw_get_clk_rate_khz(struct dw_i2c_dev *dev)
 {
-	return clk_get_rate(dev->clk)/1000;
+	return clk_get_rate(dev->clk) / KILO;
 }
 
 #ifdef CONFIG_ACPI
@@ -270,7 +271,7 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 
 		if (!dev->sda_hold_time && t->sda_hold_ns)
 			dev->sda_hold_time =
-				div_u64(clk_khz * t->sda_hold_ns + 500000, 1000000);
+				DIV_S64_ROUND_CLOSEST(clk_khz * t->sda_hold_ns, MICRO);
 	}
 
 	adap = &dev->adapter;
-- 
2.30.2

