Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CEBC916A9A3
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Feb 2020 16:15:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728014AbgBXPPr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Feb 2020 10:15:47 -0500
Received: from mga09.intel.com ([134.134.136.24]:62976 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728011AbgBXPPq (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 24 Feb 2020 10:15:46 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Feb 2020 07:15:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,480,1574150400"; 
   d="scan'208";a="384165598"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 24 Feb 2020 07:15:38 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 673D6AD6; Mon, 24 Feb 2020 17:15:33 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>
Subject: [PATCH v1 32/40] i2c: stm32f4: Use generic definitions for bus frequencies
Date:   Mon, 24 Feb 2020 17:15:22 +0200
Message-Id: <20200224151530.31713-32-andriy.shevchenko@linux.intel.com>
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

Cc: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@st.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-stm32f4.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-stm32f4.c b/drivers/i2c/busses/i2c-stm32f4.c
index ba600d77a3f8..0a67b44f2755 100644
--- a/drivers/i2c/busses/i2c-stm32f4.c
+++ b/drivers/i2c/busses/i2c-stm32f4.c
@@ -91,7 +91,6 @@
 #define STM32F4_I2C_MIN_STANDARD_FREQ	2U
 #define STM32F4_I2C_MIN_FAST_FREQ	6U
 #define STM32F4_I2C_MAX_FREQ		46U
-#define HZ_TO_MHZ			1000000
 
 /**
  * struct stm32f4_i2c_msg - client specific data
@@ -154,7 +153,7 @@ static int stm32f4_i2c_set_periph_clk_freq(struct stm32f4_i2c_dev *i2c_dev)
 	u32 cr2 = 0;
 
 	i2c_dev->parent_rate = clk_get_rate(i2c_dev->clk);
-	freq = DIV_ROUND_UP(i2c_dev->parent_rate, HZ_TO_MHZ);
+	freq = DIV_ROUND_UP(i2c_dev->parent_rate, HZ_PER_MHZ);
 
 	if (i2c_dev->speed == STM32_I2C_SPEED_STANDARD) {
 		/*
@@ -190,7 +189,7 @@ static int stm32f4_i2c_set_periph_clk_freq(struct stm32f4_i2c_dev *i2c_dev)
 
 static void stm32f4_i2c_set_rise_time(struct stm32f4_i2c_dev *i2c_dev)
 {
-	u32 freq = DIV_ROUND_UP(i2c_dev->parent_rate, HZ_TO_MHZ);
+	u32 freq = DIV_ROUND_UP(i2c_dev->parent_rate, HZ_PER_MHZ);
 	u32 trise;
 
 	/*
@@ -243,7 +242,7 @@ static void stm32f4_i2c_set_speed_mode(struct stm32f4_i2c_dev *i2c_dev)
 		 * parent rate is not higher than 46 MHz . As a result val
 		 * is at most 8 bits wide and so fits into the CCR bits [11:0].
 		 */
-		val = i2c_dev->parent_rate / (100000 << 1);
+		val = i2c_dev->parent_rate / (I2C_STANDARD_MODE_FREQ << 1);
 	} else {
 		/*
 		 * In fast mode, we compute CCR with duty = 0 as with low
@@ -263,7 +262,7 @@ static void stm32f4_i2c_set_speed_mode(struct stm32f4_i2c_dev *i2c_dev)
 		 * parent rate is not higher than 46 MHz . As a result val
 		 * is at most 6 bits wide and so fits into the CCR bits [11:0].
 		 */
-		val = DIV_ROUND_UP(i2c_dev->parent_rate, 400000 * 3);
+		val = DIV_ROUND_UP(i2c_dev->parent_rate, I2C_FAST_MODE_FREQ * 3);
 
 		/* Select Fast mode */
 		ccr |= STM32F4_I2C_CCR_FS;
@@ -807,7 +806,7 @@ static int stm32f4_i2c_probe(struct platform_device *pdev)
 
 	i2c_dev->speed = STM32_I2C_SPEED_STANDARD;
 	ret = of_property_read_u32(np, "clock-frequency", &clk_rate);
-	if (!ret && clk_rate >= 400000)
+	if (!ret && clk_rate >= I2C_FAST_MODE_FREQ)
 		i2c_dev->speed = STM32_I2C_SPEED_FAST;
 
 	i2c_dev->dev = &pdev->dev;
-- 
2.25.0

