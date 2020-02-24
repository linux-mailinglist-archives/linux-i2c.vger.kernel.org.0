Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A051E16A99E
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Feb 2020 16:15:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727996AbgBXPPl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Feb 2020 10:15:41 -0500
Received: from mga18.intel.com ([134.134.136.126]:50814 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727783AbgBXPPk (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 24 Feb 2020 10:15:40 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Feb 2020 07:15:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,480,1574150400"; 
   d="scan'208";a="226007454"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 24 Feb 2020 07:15:38 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 6EDE9B03; Mon, 24 Feb 2020 17:15:33 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>
Subject: [PATCH v1 33/40] i2c: stm32f7: Use generic definitions for bus frequencies
Date:   Mon, 24 Feb 2020 17:15:23 +0200
Message-Id: <20200224151530.31713-33-andriy.shevchenko@linux.intel.com>
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
 drivers/i2c/busses/i2c-stm32f7.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index 5c3e8ac6ad92..9af5733ed513 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -334,9 +334,9 @@ struct stm32f7_i2c_dev {
  */
 static struct stm32f7_i2c_spec i2c_specs[] = {
 	[STM32_I2C_SPEED_STANDARD] = {
-		.rate = 100000,
-		.rate_min = 80000,
-		.rate_max = 100000,
+		.rate = I2C_STANDARD_MODE_FREQ,
+		.rate_min = I2C_STANDARD_MODE_FREQ * 8 / 10,	/* 80% */
+		.rate_max = I2C_STANDARD_MODE_FREQ,
 		.fall_max = 300,
 		.rise_max = 1000,
 		.hddat_min = 0,
@@ -346,9 +346,9 @@ static struct stm32f7_i2c_spec i2c_specs[] = {
 		.h_min = 4000,
 	},
 	[STM32_I2C_SPEED_FAST] = {
-		.rate = 400000,
-		.rate_min = 320000,
-		.rate_max = 400000,
+		.rate = I2C_FAST_MODE_FREQ,
+		.rate_min = I2C_FAST_MODE_FREQ * 8 / 10,	/* 80% */
+		.rate_max = I2C_FAST_MODE_FREQ,
 		.fall_max = 300,
 		.rise_max = 300,
 		.hddat_min = 0,
@@ -358,9 +358,9 @@ static struct stm32f7_i2c_spec i2c_specs[] = {
 		.h_min = 600,
 	},
 	[STM32_I2C_SPEED_FAST_PLUS] = {
-		.rate = 1000000,
-		.rate_min = 800000,
-		.rate_max = 1000000,
+		.rate = I2C_FAST_MODE_PLUS_FREQ,
+		.rate_min = I2C_FAST_MODE_PLUS_FREQ * 8 / 10,	/* 80% */
+		.rate_max = I2C_FAST_MODE_PLUS_FREQ,
 		.fall_max = 100,
 		.rise_max = 120,
 		.hddat_min = 0,
@@ -1894,14 +1894,14 @@ static int stm32f7_i2c_probe(struct platform_device *pdev)
 	i2c_dev->speed = STM32_I2C_SPEED_STANDARD;
 	ret = device_property_read_u32(&pdev->dev, "clock-frequency",
 				       &clk_rate);
-	if (!ret && clk_rate >= 1000000) {
+	if (!ret && clk_rate >= I2C_FAST_MODE_PLUS_FREQ) {
 		i2c_dev->speed = STM32_I2C_SPEED_FAST_PLUS;
 		ret = stm32f7_i2c_setup_fm_plus_bits(pdev, i2c_dev);
 		if (ret)
 			goto clk_free;
-	} else if (!ret && clk_rate >= 400000) {
+	} else if (!ret && clk_rate >= I2C_FAST_MODE_FREQ) {
 		i2c_dev->speed = STM32_I2C_SPEED_FAST;
-	} else if (!ret && clk_rate >= 100000) {
+	} else if (!ret && clk_rate >= I2C_STANDARD_MODE_FREQ) {
 		i2c_dev->speed = STM32_I2C_SPEED_STANDARD;
 	}
 
-- 
2.25.0

