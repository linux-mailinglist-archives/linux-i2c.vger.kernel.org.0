Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC6BB5B56E6
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Sep 2022 10:59:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229819AbiILI7y (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 12 Sep 2022 04:59:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229849AbiILI7w (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 12 Sep 2022 04:59:52 -0400
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E98C6140;
        Mon, 12 Sep 2022 01:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1662973189;
  x=1694509189;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=DKN6hL6vPsfgdb7gkkoqchU9wqq/XNLFTrAad6WRetQ=;
  b=UXyF4t/PRC70Yfz6wCNuYq3H0wY0tjKQXX6xFuKzTsvPjQ+GuINUor/N
   uPAe+wuRjYHaSi7GMKLvRp7wtbWwawpRjhba9HhIDyH021yrUu45n9tNU
   FklVGhNlKdYDXdy+bWZDs102hU0BGzhSWp0afxE7UV/0j3yVFlkcZkNRT
   ANXHXOnvuJHvAGhrEIw6skVaExwqPP4Vkq1OK5drvDzlVYzBGIkZDy6JO
   deAlotsi4FpLKBW0pig5lyj+ts4FbWCR2bqI9a60OldNUrwiNIK87GA/k
   VmdMzt1fFLS3d0cM+IaG8QC/jCg+b3AxqCFU5f+h0e/uo9O5CtBrQDmCY
   Q==;
From:   Camel Guo <camel.guo@axis.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC:     Camel Guo <camel.guo@axis.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        <linux-i2c@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@axis.com>
Subject: [PATCH] i2c: exynos5: Calculate t_scl_l, t_scl_h according to i2c spec
Date:   Mon, 12 Sep 2022 10:59:43 +0200
Message-ID: <20220912085943.1098651-1-camel.guo@axis.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Previously the duty cycle was divided equally into h_scl_l, t_scl_h.
This makes the low period of the SCL clock in Fast Mode is only 1.25us
which is way lower than the minimal value (1.3) specified in i2c
specification. In order to make sure t_scl_l, t_scl_h always fullfill
i2c specification, this commit calculates t_scl_l using this formula:

t_scl_l = clk_cycle *
    ((t_low_min + (scl_clock - t_low_min - t_high_min) / 2) / scl_clock)

where:
t_low_min is the minimal value of low period of the SCL clock in us;
t_high_min is the minimal value of high period of the SCL clock in us;
scl_clock is converted from SCL clock frequency into us.

Signed-off-by: Camel Guo <camel.guo@axis.com>
---
 drivers/i2c/busses/i2c-exynos5.c | 34 +++++++++++++++++++++++++++++---
 1 file changed, 31 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-exynos5.c b/drivers/i2c/busses/i2c-exynos5.c
index 4a6260d04db2..72bc8adea8d5 100644
--- a/drivers/i2c/busses/i2c-exynos5.c
+++ b/drivers/i2c/busses/i2c-exynos5.c
@@ -267,7 +267,7 @@ static void exynos5_i2c_clr_pend_irq(struct exynos5_i2c *i2c)
  * exynos5_i2c_set_timing: updates the registers with appropriate
  * timing values calculated
  *
- * Timing values for operation are calculated against either 100kHz
+ * Timing values for operation are calculated against 100kHz, 400kHz
  * or 1MHz controller operating frequency.
  *
  * Returns 0 on success, -EINVAL if the cycle length cannot
@@ -330,6 +330,23 @@ static int exynos5_i2c_set_timing(struct exynos5_i2c *i2c, bool hs_timings)
 	 *
 	 * Constraints: 4 <= temp, 0 <= CLK_DIV < 256, 2 <= clk_cycle <= 510
 	 *
+	 * To split SCL clock into low, high periods appropriately, one
+	 * proportion factor for each I2C mode is used, which is calculated
+	 * using this formula.
+	 * ```
+	 * ((t_low_min + (scl_clock - t_low_min - t_high_min) / 2) / scl_clock)
+	 * ```
+	 * where:
+	 * t_low_min is the minimal value of low period of the SCL clock in us;
+	 * t_high_min is the minimal value of high period of the SCL clock in us;
+	 * scl_clock is converted from SCL clock frequency into us.
+	 *
+	 * Below are the proportion factors for these I2C modes:
+	 *                t_low_min, t_high_min, scl_clock, proportion
+	 * Standard Mode:     4.7us,      4.0us,      10us,      0.535
+	 * Fast Mode:         1.3us,      0.6us,     2.5us,       0.64
+	 * Fast-Plus Mode:    0.5us,     0.26us,       1us,       0.62
+	 *
 	 */
 	t_ftl_cycle = (readl(i2c->regs + HSI2C_CONF) >> 16) & 0x7;
 	temp = clkin / op_clk - 8 - t_ftl_cycle;
@@ -343,8 +360,19 @@ static int exynos5_i2c_set_timing(struct exynos5_i2c *i2c, bool hs_timings)
 		return -EINVAL;
 	}
 
-	t_scl_l = clk_cycle / 2;
-	t_scl_h = clk_cycle / 2;
+	/*
+	 * Scale clk_cycle to get t_scl_l using the proption factors for individual I2C modes.
+	 */
+	if (op_clk <= I2C_MAX_STANDARD_MODE_FREQ)
+		t_scl_l = clk_cycle * 535 / 1000;
+	else if (op_clk <= I2C_MAX_FAST_MODE_FREQ)
+		t_scl_l = clk_cycle * 64 / 100;
+	else
+		t_scl_l = clk_cycle * 62 / 100;
+
+	if (t_scl_l > 0xFF)
+		t_scl_l = 0xFF;
+	t_scl_h = clk_cycle - t_scl_l;
 	t_start_su = t_scl_l;
 	t_start_hd = t_scl_l;
 	t_stop_su = t_scl_l;

base-commit: ce888220d5c7a805e0e155302a318d5d23e62950
-- 
2.30.2

