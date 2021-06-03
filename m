Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8AF539A53D
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Jun 2021 18:04:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229800AbhFCQGD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Jun 2021 12:06:03 -0400
Received: from mga02.intel.com ([134.134.136.20]:57921 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229506AbhFCQGC (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 3 Jun 2021 12:06:02 -0400
IronPort-SDR: Qj2HdCTAqOIocJSR4ih4ixCNubR3Xn+A5aQ38tL32egjzn6NR3nFoD1AQDSQ8AmqLWKYlkql/O
 W0YIDNT68UqQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10004"; a="191185480"
X-IronPort-AV: E=Sophos;i="5.83,246,1616482800"; 
   d="scan'208";a="191185480"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2021 09:04:17 -0700
IronPort-SDR: WlBhSGvApWnSXUgA/aF9FgSiYdLItGd+xvC+yWSzV1TeSCUNXhCZ8qO4CzgF4ofnGhRypSO/YG
 OSAZrdbZYxyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,246,1616482800"; 
   d="scan'208";a="617946568"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 03 Jun 2021 09:04:15 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id D8F091FC; Thu,  3 Jun 2021 19:04:38 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        wsa@kernel.org
Subject: [PATCH resend v1 2/3] i2c: designware: Use DIV_ROUND_CLOSEST() macro
Date:   Thu,  3 Jun 2021 19:04:32 +0300
Message-Id: <20210603160433.35816-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210603160433.35816-1-andriy.shevchenko@linux.intel.com>
References: <20210603160433.35816-1-andriy.shevchenko@linux.intel.com>
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
 drivers/i2c/busses/i2c-designware-common.c  | 8 ++++----
 drivers/i2c/busses/i2c-designware-platdrv.c | 6 +++---
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
index fdc34d9e3702..9df101d1a34f 100644
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
+		return DIV_ROUND_CLOSEST(ic_clk * tSYMBOL, MEGA) - 8 + offset;
 	else
 		/*
 		 * Conditional expression:
@@ -366,8 +367,7 @@ u32 i2c_dw_scl_hcnt(u32 ic_clk, u32 tSYMBOL, u32 tf, int cond, int offset)
 		 * The reason why we need to take into account "tf" here,
 		 * is the same as described in i2c_dw_scl_lcnt().
 		 */
-		return (ic_clk * (tSYMBOL + tf) + 500000) / 1000000
-			- 3 + offset;
+		return DIV_ROUND_CLOSEST(ic_clk * (tSYMBOL + tf), MEGA) - 3 + offset;
 }
 
 u32 i2c_dw_scl_lcnt(u32 ic_clk, u32 tLOW, u32 tf, int offset)
@@ -383,7 +383,7 @@ u32 i2c_dw_scl_lcnt(u32 ic_clk, u32 tLOW, u32 tf, int offset)
 	 * account the fall time of SCL signal (tf).  Default tf value
 	 * should be 0.3 us, for safety.
 	 */
-	return ((ic_clk * (tLOW + tf) + 500000) / 1000000) - 1 + offset;
+	return DIV_ROUND_CLOSEST(ic_clk * (tLOW + tf), MEGA) - 1 + offset;
 }
 
 int i2c_dw_set_sda_hold(struct dw_i2c_dev *dev)
diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 4b37f28ec0c6..099e303d22bb 100644
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
@@ -269,8 +270,7 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 		clk_khz = dev->get_clk_rate_khz(dev);
 
 		if (!dev->sda_hold_time && t->sda_hold_ns)
-			dev->sda_hold_time =
-				div_u64(clk_khz * t->sda_hold_ns + 500000, 1000000);
+			dev->sda_hold_time = DIV_S64_ROUND_CLOSEST(clk_khz * t->sda_hold_ns, MEGA);
 	}
 
 	adap = &dev->adapter;
-- 
2.30.2

