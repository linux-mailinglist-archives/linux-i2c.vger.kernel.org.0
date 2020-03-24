Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44B9F190D8B
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Mar 2020 13:32:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727511AbgCXMcV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 24 Mar 2020 08:32:21 -0400
Received: from mga18.intel.com ([134.134.136.126]:36141 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727480AbgCXMcV (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 24 Mar 2020 08:32:21 -0400
IronPort-SDR: p6WoR7ZJLFLS8cyurFjLhav5UF1tM2Yv/ssiXlnOcjG5I7brxbZklaMBOh0zc1hi/poXlzZgc3
 NDkHKfS2UoPQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2020 05:32:20 -0700
IronPort-SDR: wqEbyGQo2aZQdWLLso+wA4uTQc7gI1082qI02bSfEemnv5ApN/PC7HTCZeJ8mTkBXxaLEKMjiB
 PLRTY7EYWxvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,300,1580803200"; 
   d="scan'208";a="447862616"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 24 Mar 2020 05:32:18 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id BA89A3BA; Tue, 24 Mar 2020 14:32:17 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Alain Volmat <alain.volmat@st.com>
Subject: [PATCH v5 4/6] =?UTF-8?q?i2c:=20stm32f7:=20switch=20to=20I=C2=B2C?= =?UTF-8?q?=20generic=20property=20parsing?=
Date:   Tue, 24 Mar 2020 14:32:14 +0200
Message-Id: <20200324123216.78113-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200324123216.78113-1-andriy.shevchenko@linux.intel.com>
References: <20200324123216.78113-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Switch to the new generic functions: i2c_parse_fw_timings().

While here, replace hard coded values with standard bus frequency definitions.

Cc: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@st.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Alain Volmat <alain.volmat@st.com>
---
v5: picked up tags
 drivers/i2c/busses/i2c-stm32f7.c | 57 +++++++++++++++-----------------
 1 file changed, 26 insertions(+), 31 deletions(-)

diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index 6418f5982894..330ffed011e0 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -344,9 +344,9 @@ struct stm32f7_i2c_dev {
  */
 static struct stm32f7_i2c_spec i2c_specs[] = {
 	[STM32_I2C_SPEED_STANDARD] = {
-		.rate = 100000,
-		.rate_min = 80000,
-		.rate_max = 100000,
+		.rate = I2C_MAX_STANDARD_MODE_FREQ,
+		.rate_min = I2C_MAX_STANDARD_MODE_FREQ * 8 / 10,	/* 80% */
+		.rate_max = I2C_MAX_STANDARD_MODE_FREQ,
 		.fall_max = 300,
 		.rise_max = 1000,
 		.hddat_min = 0,
@@ -356,9 +356,9 @@ static struct stm32f7_i2c_spec i2c_specs[] = {
 		.h_min = 4000,
 	},
 	[STM32_I2C_SPEED_FAST] = {
-		.rate = 400000,
-		.rate_min = 320000,
-		.rate_max = 400000,
+		.rate = I2C_MAX_FAST_MODE_FREQ,
+		.rate_min = I2C_MAX_FAST_MODE_FREQ * 8 / 10,		/* 80% */
+		.rate_max = I2C_MAX_FAST_MODE_FREQ,
 		.fall_max = 300,
 		.rise_max = 300,
 		.hddat_min = 0,
@@ -368,9 +368,9 @@ static struct stm32f7_i2c_spec i2c_specs[] = {
 		.h_min = 600,
 	},
 	[STM32_I2C_SPEED_FAST_PLUS] = {
-		.rate = 1000000,
-		.rate_min = 800000,
-		.rate_max = 1000000,
+		.rate = I2C_MAX_FAST_MODE_PLUS_FREQ,
+		.rate_min = I2C_MAX_FAST_MODE_PLUS_FREQ * 8 / 10,	/* 80% */
+		.rate_max = I2C_MAX_FAST_MODE_PLUS_FREQ,
 		.fall_max = 100,
 		.rise_max = 120,
 		.hddat_min = 0,
@@ -610,8 +610,25 @@ static int stm32f7_i2c_compute_timing(struct stm32f7_i2c_dev *i2c_dev,
 static int stm32f7_i2c_setup_timing(struct stm32f7_i2c_dev *i2c_dev,
 				    struct stm32f7_i2c_setup *setup)
 {
+	struct i2c_timings timings, *t = &timings;
 	int ret = 0;
 
+	t->bus_freq_hz = I2C_MAX_STANDARD_MODE_FREQ;
+	t->scl_rise_ns = i2c_dev->setup.rise_time;
+	t->scl_fall_ns = i2c_dev->setup.fall_time;
+
+	i2c_parse_fw_timings(i2c_dev->dev, t, false);
+
+	if (t->bus_freq_hz >= I2C_MAX_FAST_MODE_PLUS_FREQ)
+		i2c_dev->speed = STM32_I2C_SPEED_FAST_PLUS;
+	else if (t->bus_freq_hz >= I2C_MAX_FAST_MODE_FREQ)
+		i2c_dev->speed = STM32_I2C_SPEED_FAST;
+	else
+		i2c_dev->speed = STM32_I2C_SPEED_STANDARD;
+
+	i2c_dev->setup.rise_time = t->scl_rise_ns;
+	i2c_dev->setup.fall_time = t->scl_fall_ns;
+
 	setup->speed = i2c_dev->speed;
 	setup->speed_freq = i2c_specs[setup->speed].rate;
 	setup->clock_src = clk_get_rate(i2c_dev->clk);
@@ -1914,7 +1931,6 @@ static int stm32f7_i2c_probe(struct platform_device *pdev)
 	struct stm32f7_i2c_dev *i2c_dev;
 	const struct stm32f7_i2c_setup *setup;
 	struct resource *res;
-	u32 clk_rate, rise_time, fall_time;
 	struct i2c_adapter *adap;
 	struct reset_control *rst;
 	dma_addr_t phy_addr;
@@ -1961,17 +1977,6 @@ static int stm32f7_i2c_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	i2c_dev->speed = STM32_I2C_SPEED_STANDARD;
-	ret = device_property_read_u32(&pdev->dev, "clock-frequency",
-				       &clk_rate);
-	if (!ret && clk_rate >= 1000000) {
-		i2c_dev->speed = STM32_I2C_SPEED_FAST_PLUS;
-	} else if (!ret && clk_rate >= 400000) {
-		i2c_dev->speed = STM32_I2C_SPEED_FAST;
-	} else if (!ret && clk_rate >= 100000) {
-		i2c_dev->speed = STM32_I2C_SPEED_STANDARD;
-	}
-
 	rst = devm_reset_control_get(&pdev->dev, NULL);
 	if (IS_ERR(rst)) {
 		dev_err(&pdev->dev, "Error: Missing controller reset\n");
@@ -2011,16 +2016,6 @@ static int stm32f7_i2c_probe(struct platform_device *pdev)
 	}
 	i2c_dev->setup = *setup;
 
-	ret = device_property_read_u32(i2c_dev->dev, "i2c-scl-rising-time-ns",
-				       &rise_time);
-	if (!ret)
-		i2c_dev->setup.rise_time = rise_time;
-
-	ret = device_property_read_u32(i2c_dev->dev, "i2c-scl-falling-time-ns",
-				       &fall_time);
-	if (!ret)
-		i2c_dev->setup.fall_time = fall_time;
-
 	ret = stm32f7_i2c_setup_timing(i2c_dev, &i2c_dev->setup);
 	if (ret)
 		goto clk_free;
-- 
2.25.1

