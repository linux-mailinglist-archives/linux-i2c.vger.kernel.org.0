Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86BFC39E03C
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Jun 2021 17:23:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230226AbhFGPZZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Jun 2021 11:25:25 -0400
Received: from mga07.intel.com ([134.134.136.100]:8763 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230444AbhFGPZV (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 7 Jun 2021 11:25:21 -0400
IronPort-SDR: comv0sf6oScud/G2Ub6vAv1K/K4DLDQzmpD+c5RtLaGOf/sd+ZI37DBFWXvlA5q8xgEtQvER0c
 PDzxifuitIRQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="268498735"
X-IronPort-AV: E=Sophos;i="5.83,255,1616482800"; 
   d="scan'208";a="268498735"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2021 08:23:29 -0700
IronPort-SDR: mx7ERCpO4WVwXhZ56Y6LgC2y3dMqvbe3QBjs5nvbjQ2ZA8fkcD0Ms4US9ss/4gdY1HttqP06L0
 TAx0FwnTsAoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,255,1616482800"; 
   d="scan'208";a="413062691"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 07 Jun 2021 08:23:25 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id E4530A3; Mon,  7 Jun 2021 18:23:48 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        wsa@kernel.org
Subject: [PATCH v2 2/3] i2c: designware: Use DIV_ROUND_CLOSEST() macro
Date:   Mon,  7 Jun 2021 18:23:43 +0300
Message-Id: <20210607152344.57458-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210607152344.57458-1-andriy.shevchenko@linux.intel.com>
References: <20210607152344.57458-1-andriy.shevchenko@linux.intel.com>
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
v2: to get 10^0 based numbers divide by 10^-6 which is MICRO (Jarkko)
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

