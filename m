Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1892216A997
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Feb 2020 16:15:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727978AbgBXPPj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Feb 2020 10:15:39 -0500
Received: from mga06.intel.com ([134.134.136.31]:59397 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727962AbgBXPPi (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 24 Feb 2020 10:15:38 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Feb 2020 07:15:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,480,1574150400"; 
   d="scan'208";a="435933650"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga005.fm.intel.com with ESMTP; 24 Feb 2020 07:15:36 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id ADA963E2; Mon, 24 Feb 2020 17:15:32 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v1 14/40] i2c: exynos5: Use generic definitions for bus frequencies
Date:   Mon, 24 Feb 2020 17:15:04 +0200
Message-Id: <20200224151530.31713-14-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200224151530.31713-1-andriy.shevchenko@linux.intel.com>
References: <20200224151530.31713-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Since we have generic definitions for bus frequencies, let's use them.

Cc: Kukjin Kim <kgene@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-exynos5.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/i2c/busses/i2c-exynos5.c b/drivers/i2c/busses/i2c-exynos5.c
index e7514c16b756..82e580615d87 100644
--- a/drivers/i2c/busses/i2c-exynos5.c
+++ b/drivers/i2c/busses/i2c-exynos5.c
@@ -164,13 +164,6 @@
 #define HSI2C_MASTER_ID(x)			((x & 0xff) << 24)
 #define MASTER_ID(x)				((x & 0x7) + 0x08)
 
-/*
- * Controller operating frequency, timing values for operation
- * are calculated against this frequency
- */
-#define HSI2C_HS_TX_CLOCK	1000000
-#define HSI2C_FS_TX_CLOCK	100000
-
 #define EXYNOS5_I2C_TIMEOUT (msecs_to_jiffies(100))
 
 enum i2c_type_exynos {
@@ -264,6 +257,9 @@ static void exynos5_i2c_clr_pend_irq(struct exynos5_i2c *i2c)
  * exynos5_i2c_set_timing: updates the registers with appropriate
  * timing values calculated
  *
+ * Controller operating frequency, timing values for operation
+ * are calculated against either 100kHz or 1MHz frequency.
+ *
  * Returns 0 on success, -EINVAL if the cycle length cannot
  * be calculated.
  */
@@ -281,7 +277,7 @@ static int exynos5_i2c_set_timing(struct exynos5_i2c *i2c, bool hs_timings)
 	unsigned int t_ftl_cycle;
 	unsigned int clkin = clk_get_rate(i2c->clk);
 	unsigned int op_clk = hs_timings ? i2c->op_clock :
-		(i2c->op_clock >= HSI2C_HS_TX_CLOCK) ? HSI2C_FS_TX_CLOCK :
+		(i2c->op_clock >= I2C_FAST_MODE_PLUS_FREQ) ? I2C_STANDARD_MODE_FREQ :
 		i2c->op_clock;
 	int div, clk_cycle, temp;
 
@@ -353,7 +349,7 @@ static int exynos5_hsi2c_clock_setup(struct exynos5_i2c *i2c)
 	/* always set Fast Speed timings */
 	int ret = exynos5_i2c_set_timing(i2c, false);
 
-	if (ret < 0 || i2c->op_clock < HSI2C_HS_TX_CLOCK)
+	if (ret < 0 || i2c->op_clock < I2C_FAST_MODE_PLUS_FREQ)
 		return ret;
 
 	return exynos5_i2c_set_timing(i2c, true);
@@ -376,7 +372,7 @@ static void exynos5_i2c_init(struct exynos5_i2c *i2c)
 					i2c->regs + HSI2C_CTL);
 	writel(HSI2C_TRAILING_COUNT, i2c->regs + HSI2C_TRAILIG_CTL);
 
-	if (i2c->op_clock >= HSI2C_HS_TX_CLOCK) {
+	if (i2c->op_clock >= I2C_FAST_MODE_PLUS_FREQ) {
 		writel(HSI2C_MASTER_ID(MASTER_ID(i2c->adap.nr)),
 					i2c->regs + HSI2C_ADDR);
 		i2c_conf |= HSI2C_HS_MODE;
@@ -748,7 +744,7 @@ static int exynos5_i2c_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	if (of_property_read_u32(np, "clock-frequency", &i2c->op_clock))
-		i2c->op_clock = HSI2C_FS_TX_CLOCK;
+		i2c->op_clock = I2C_STANDARD_MODE_FREQ;
 
 	strlcpy(i2c->adap.name, "exynos5-i2c", sizeof(i2c->adap.name));
 	i2c->adap.owner   = THIS_MODULE;
-- 
2.25.0

