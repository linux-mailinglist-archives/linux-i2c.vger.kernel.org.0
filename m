Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35F0616A9A8
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Feb 2020 16:15:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727958AbgBXPPm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Feb 2020 10:15:42 -0500
Received: from mga18.intel.com ([134.134.136.126]:50815 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727992AbgBXPPl (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 24 Feb 2020 10:15:41 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Feb 2020 07:15:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,480,1574150400"; 
   d="scan'208";a="226007457"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 24 Feb 2020 07:15:39 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 8CECAB67; Mon, 24 Feb 2020 17:15:33 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 37/40] i2c: tegra: Use generic definitions for bus frequencies
Date:   Mon, 24 Feb 2020 17:15:27 +0200
Message-Id: <20200224151530.31713-37-andriy.shevchenko@linux.intel.com>
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

Cc: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Dmitry Osipenko <digetx@gmail.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-tegra.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index cbc2ad49043e..265c56952e84 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -123,10 +123,6 @@
 #define I2C_THIGH_SHIFT				8
 #define I2C_INTERFACE_TIMING_1			0x98
 
-#define I2C_STANDARD_MODE			100000
-#define I2C_FAST_MODE				400000
-#define I2C_FAST_PLUS_MODE			1000000
-
 /* Packet header size in bytes */
 #define I2C_PACKET_HEADER_SIZE			12
 
@@ -737,8 +733,8 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev, bool clk_reinit)
 					I2C_CLK_DIVISOR_STD_FAST_MODE_SHIFT;
 	i2c_writel(i2c_dev, clk_divisor, I2C_CLK_DIVISOR);
 
-	if (i2c_dev->bus_clk_rate > I2C_STANDARD_MODE &&
-	    i2c_dev->bus_clk_rate <= I2C_FAST_PLUS_MODE) {
+	if (i2c_dev->bus_clk_rate > I2C_STANDARD_MODE_FREQ &&
+	    i2c_dev->bus_clk_rate <= I2C_FAST_MODE_PLUS_FREQ) {
 		tlow = i2c_dev->hw->tlow_fast_fastplus_mode;
 		thigh = i2c_dev->hw->thigh_fast_fastplus_mode;
 		tsu_thd = i2c_dev->hw->setup_hold_time_fast_fast_plus_mode;
@@ -1341,7 +1337,7 @@ static void tegra_i2c_parse_dt(struct tegra_i2c_dev *i2c_dev)
 	ret = of_property_read_u32(np, "clock-frequency",
 				   &i2c_dev->bus_clk_rate);
 	if (ret)
-		i2c_dev->bus_clk_rate = 100000; /* default clock rate */
+		i2c_dev->bus_clk_rate = I2C_STANDARD_MODE_FREQ; /* default clock rate */
 
 	multi_mode = of_property_read_bool(np, "multi-master");
 	i2c_dev->is_multimaster_mode = multi_mode;
@@ -1640,12 +1636,12 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 		}
 	}
 
-	if (i2c_dev->bus_clk_rate > I2C_FAST_MODE &&
-	    i2c_dev->bus_clk_rate <= I2C_FAST_PLUS_MODE)
+	if (i2c_dev->bus_clk_rate > I2C_FAST_MODE_FREQ &&
+	    i2c_dev->bus_clk_rate <= I2C_FAST_MODE_PLUS_FREQ)
 		i2c_dev->clk_divisor_non_hs_mode =
 				i2c_dev->hw->clk_divisor_fast_plus_mode;
-	else if (i2c_dev->bus_clk_rate > I2C_STANDARD_MODE &&
-		 i2c_dev->bus_clk_rate <= I2C_FAST_MODE)
+	else if (i2c_dev->bus_clk_rate > I2C_STANDARD_MODE_FREQ &&
+		 i2c_dev->bus_clk_rate <= I2C_FAST_MODE_FREQ)
 		i2c_dev->clk_divisor_non_hs_mode =
 				i2c_dev->hw->clk_divisor_fast_mode;
 	else
-- 
2.25.0

