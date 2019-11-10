Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8BEFCF6625
	for <lists+linux-i2c@lfdr.de>; Sun, 10 Nov 2019 04:12:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728309AbfKJCnZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 9 Nov 2019 21:43:25 -0500
Received: from mail.kernel.org ([198.145.29.99]:41372 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728286AbfKJCnY (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 9 Nov 2019 21:43:24 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3BE15214E0;
        Sun, 10 Nov 2019 02:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573353803;
        bh=nQTEW2sPLQXF4S3Lvl9L5CzIUmUDreOj4jlhRJhdpGw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=kcBEOtl7Fit125725A+ZL76V0Qnc7fI48HQJorNakWupPVzWTTiQPafayaqcfMw/w
         a9JkLodVeR+I/ohlkaVCpqoptdbQDLefRvPGK7mRJos7dCylA8T9p1mQ13H/SIzeK5
         vuGeYGVL7EeuLkggdV86w8Otl4cb+mrp38VxegMg=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Brendan Higgins <brendanhiggins@google.com>,
        Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Sasha Levin <sashal@kernel.org>, linux-i2c@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 101/191] i2c: aspeed: fix invalid clock parameters for very large divisors
Date:   Sat,  9 Nov 2019 21:38:43 -0500
Message-Id: <20191110024013.29782-101-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191110024013.29782-1-sashal@kernel.org>
References: <20191110024013.29782-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Brendan Higgins <brendanhiggins@google.com>

[ Upstream commit 17ccba67109cd0631f206cf49e17986218b47854 ]

The function that computes clock parameters from divisors did not
respect the maximum size of the bitfields that the parameters were
written to. This fixes the bug.

This bug can be reproduced with (and this fix verified with) the test
at: https://kunit-review.googlesource.com/c/linux/+/1035/

Discovered-by-KUnit: https://kunit-review.googlesource.com/c/linux/+/1035/
Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
Reviewed-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Signed-off-by: Wolfram Sang <wsa@the-dreams.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/i2c/busses/i2c-aspeed.c | 65 +++++++++++++++++++++++----------
 1 file changed, 45 insertions(+), 20 deletions(-)

diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
index a19fbff168617..d9401b5191069 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -137,7 +137,8 @@ struct aspeed_i2c_bus {
 	/* Synchronizes I/O mem access to base. */
 	spinlock_t			lock;
 	struct completion		cmd_complete;
-	u32				(*get_clk_reg_val)(u32 divisor);
+	u32				(*get_clk_reg_val)(struct device *dev,
+							   u32 divisor);
 	unsigned long			parent_clk_frequency;
 	u32				bus_frequency;
 	/* Transaction state. */
@@ -686,16 +687,27 @@ static const struct i2c_algorithm aspeed_i2c_algo = {
 #endif /* CONFIG_I2C_SLAVE */
 };
 
-static u32 aspeed_i2c_get_clk_reg_val(u32 clk_high_low_max, u32 divisor)
+static u32 aspeed_i2c_get_clk_reg_val(struct device *dev,
+				      u32 clk_high_low_mask,
+				      u32 divisor)
 {
-	u32 base_clk, clk_high, clk_low, tmp;
+	u32 base_clk_divisor, clk_high_low_max, clk_high, clk_low, tmp;
+
+	/*
+	 * SCL_high and SCL_low represent a value 1 greater than what is stored
+	 * since a zero divider is meaningless. Thus, the max value each can
+	 * store is every bit set + 1. Since SCL_high and SCL_low are added
+	 * together (see below), the max value of both is the max value of one
+	 * them times two.
+	 */
+	clk_high_low_max = (clk_high_low_mask + 1) * 2;
 
 	/*
 	 * The actual clock frequency of SCL is:
 	 *	SCL_freq = APB_freq / (base_freq * (SCL_high + SCL_low))
 	 *		 = APB_freq / divisor
 	 * where base_freq is a programmable clock divider; its value is
-	 *	base_freq = 1 << base_clk
+	 *	base_freq = 1 << base_clk_divisor
 	 * SCL_high is the number of base_freq clock cycles that SCL stays high
 	 * and SCL_low is the number of base_freq clock cycles that SCL stays
 	 * low for a period of SCL.
@@ -705,47 +717,59 @@ static u32 aspeed_i2c_get_clk_reg_val(u32 clk_high_low_max, u32 divisor)
 	 *	SCL_low	 = clk_low + 1
 	 * Thus,
 	 *	SCL_freq = APB_freq /
-	 *		((1 << base_clk) * (clk_high + 1 + clk_low + 1))
+	 *		((1 << base_clk_divisor) * (clk_high + 1 + clk_low + 1))
 	 * The documentation recommends clk_high >= clk_high_max / 2 and
 	 * clk_low >= clk_low_max / 2 - 1 when possible; this last constraint
 	 * gives us the following solution:
 	 */
-	base_clk = divisor > clk_high_low_max ?
+	base_clk_divisor = divisor > clk_high_low_max ?
 			ilog2((divisor - 1) / clk_high_low_max) + 1 : 0;
-	tmp = (divisor + (1 << base_clk) - 1) >> base_clk;
-	clk_low = tmp / 2;
-	clk_high = tmp - clk_low;
 
-	if (clk_high)
-		clk_high--;
+	if (base_clk_divisor > ASPEED_I2CD_TIME_BASE_DIVISOR_MASK) {
+		base_clk_divisor = ASPEED_I2CD_TIME_BASE_DIVISOR_MASK;
+		clk_low = clk_high_low_mask;
+		clk_high = clk_high_low_mask;
+		dev_err(dev,
+			"clamping clock divider: divider requested, %u, is greater than largest possible divider, %u.\n",
+			divisor, (1 << base_clk_divisor) * clk_high_low_max);
+	} else {
+		tmp = (divisor + (1 << base_clk_divisor) - 1)
+				>> base_clk_divisor;
+		clk_low = tmp / 2;
+		clk_high = tmp - clk_low;
+
+		if (clk_high)
+			clk_high--;
 
-	if (clk_low)
-		clk_low--;
+		if (clk_low)
+			clk_low--;
+	}
 
 
 	return ((clk_high << ASPEED_I2CD_TIME_SCL_HIGH_SHIFT)
 		& ASPEED_I2CD_TIME_SCL_HIGH_MASK)
 			| ((clk_low << ASPEED_I2CD_TIME_SCL_LOW_SHIFT)
 			   & ASPEED_I2CD_TIME_SCL_LOW_MASK)
-			| (base_clk & ASPEED_I2CD_TIME_BASE_DIVISOR_MASK);
+			| (base_clk_divisor
+			   & ASPEED_I2CD_TIME_BASE_DIVISOR_MASK);
 }
 
-static u32 aspeed_i2c_24xx_get_clk_reg_val(u32 divisor)
+static u32 aspeed_i2c_24xx_get_clk_reg_val(struct device *dev, u32 divisor)
 {
 	/*
 	 * clk_high and clk_low are each 3 bits wide, so each can hold a max
 	 * value of 8 giving a clk_high_low_max of 16.
 	 */
-	return aspeed_i2c_get_clk_reg_val(16, divisor);
+	return aspeed_i2c_get_clk_reg_val(dev, GENMASK(2, 0), divisor);
 }
 
-static u32 aspeed_i2c_25xx_get_clk_reg_val(u32 divisor)
+static u32 aspeed_i2c_25xx_get_clk_reg_val(struct device *dev, u32 divisor)
 {
 	/*
 	 * clk_high and clk_low are each 4 bits wide, so each can hold a max
 	 * value of 16 giving a clk_high_low_max of 32.
 	 */
-	return aspeed_i2c_get_clk_reg_val(32, divisor);
+	return aspeed_i2c_get_clk_reg_val(dev, GENMASK(3, 0), divisor);
 }
 
 /* precondition: bus.lock has been acquired. */
@@ -758,7 +782,7 @@ static int aspeed_i2c_init_clk(struct aspeed_i2c_bus *bus)
 	clk_reg_val &= (ASPEED_I2CD_TIME_TBUF_MASK |
 			ASPEED_I2CD_TIME_THDSTA_MASK |
 			ASPEED_I2CD_TIME_TACST_MASK);
-	clk_reg_val |= bus->get_clk_reg_val(divisor);
+	clk_reg_val |= bus->get_clk_reg_val(bus->dev, divisor);
 	writel(clk_reg_val, bus->base + ASPEED_I2C_AC_TIMING_REG1);
 	writel(ASPEED_NO_TIMEOUT_CTRL, bus->base + ASPEED_I2C_AC_TIMING_REG2);
 
@@ -874,7 +898,8 @@ static int aspeed_i2c_probe_bus(struct platform_device *pdev)
 	if (!match)
 		bus->get_clk_reg_val = aspeed_i2c_24xx_get_clk_reg_val;
 	else
-		bus->get_clk_reg_val = (u32 (*)(u32))match->data;
+		bus->get_clk_reg_val = (u32 (*)(struct device *, u32))
+				match->data;
 
 	/* Initialize the I2C adapter */
 	spin_lock_init(&bus->lock);
-- 
2.20.1

