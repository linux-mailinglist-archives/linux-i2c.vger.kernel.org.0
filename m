Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54D7916A9AD
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Feb 2020 16:15:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727980AbgBXPPj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Feb 2020 10:15:39 -0500
Received: from mga17.intel.com ([192.55.52.151]:53971 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727960AbgBXPPi (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 24 Feb 2020 10:15:38 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Feb 2020 07:15:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,480,1574150400"; 
   d="scan'208";a="260368586"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga004.fm.intel.com with ESMTP; 24 Feb 2020 07:15:37 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id E90217F7; Mon, 24 Feb 2020 17:15:32 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v1 20/40] i2c: mt65xx: Use generic definitions for bus frequencies
Date:   Mon, 24 Feb 2020 17:15:10 +0200
Message-Id: <20200224151530.31713-20-andriy.shevchenko@linux.intel.com>
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

Cc: Matthias Brugger <matthias.bgg@gmail.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-mt65xx.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index 2152ec5f535c..2647e7def4f2 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -56,9 +56,6 @@
 #define I2C_DMA_4G_MODE			0x0001
 
 #define I2C_DEFAULT_CLK_DIV		5
-#define I2C_DEFAULT_SPEED		100000	/* hz */
-#define MAX_FS_MODE_SPEED		400000
-#define MAX_HS_MODE_SPEED		3400000
 #define MAX_SAMPLE_CNT_DIV		8
 #define MAX_STEP_CNT_DIV		64
 #define MAX_HS_STEP_CNT_DIV		8
@@ -450,10 +447,10 @@ static int mtk_i2c_calculate_speed(struct mtk_i2c *i2c, unsigned int clk_src,
 	unsigned int best_mul;
 	unsigned int cnt_mul;
 
-	if (target_speed > MAX_HS_MODE_SPEED)
-		target_speed = MAX_HS_MODE_SPEED;
+	if (target_speed > I2C_FAST_MODE_PLUS_FREQ)
+		target_speed = I2C_FAST_MODE_PLUS_FREQ;
 
-	if (target_speed > MAX_FS_MODE_SPEED)
+	if (target_speed > I2C_FAST_MODE_FREQ)
 		max_step_cnt = MAX_HS_STEP_CNT_DIV;
 	else
 		max_step_cnt = MAX_STEP_CNT_DIV;
@@ -514,9 +511,9 @@ static int mtk_i2c_set_speed(struct mtk_i2c *i2c, unsigned int parent_clk)
 	clk_src = parent_clk / i2c->clk_src_div;
 	target_speed = i2c->speed_hz;
 
-	if (target_speed > MAX_FS_MODE_SPEED) {
+	if (target_speed > I2C_FAST_MODE_FREQ) {
 		/* Set master code speed register */
-		ret = mtk_i2c_calculate_speed(i2c, clk_src, MAX_FS_MODE_SPEED,
+		ret = mtk_i2c_calculate_speed(i2c, clk_src, I2C_FAST_MODE_FREQ,
 					      &l_step_cnt, &l_sample_cnt);
 		if (ret < 0)
 			return ret;
@@ -581,7 +578,7 @@ static int mtk_i2c_do_transfer(struct mtk_i2c *i2c, struct i2c_msg *msgs,
 
 	control_reg = mtk_i2c_readw(i2c, OFFSET_CONTROL) &
 			~(I2C_CONTROL_DIR_CHANGE | I2C_CONTROL_RS);
-	if ((i2c->speed_hz > MAX_FS_MODE_SPEED) || (left_num >= 1))
+	if ((i2c->speed_hz > I2C_FAST_MODE_FREQ) || (left_num >= 1))
 		control_reg |= I2C_CONTROL_RS;
 
 	if (i2c->op == I2C_MASTER_WRRD)
@@ -590,7 +587,7 @@ static int mtk_i2c_do_transfer(struct mtk_i2c *i2c, struct i2c_msg *msgs,
 	mtk_i2c_writew(i2c, control_reg, OFFSET_CONTROL);
 
 	/* set start condition */
-	if (i2c->speed_hz <= I2C_DEFAULT_SPEED)
+	if (i2c->speed_hz <= I2C_STANDARD_MODE_FREQ)
 		mtk_i2c_writew(i2c, I2C_ST_START_CON, OFFSET_EXT_CONF);
 	else
 		mtk_i2c_writew(i2c, I2C_FS_START_CON, OFFSET_EXT_CONF);
@@ -798,7 +795,7 @@ static int mtk_i2c_transfer(struct i2c_adapter *adap,
 		}
 	}
 
-	if (i2c->auto_restart && num >= 2 && i2c->speed_hz > MAX_FS_MODE_SPEED)
+	if (i2c->auto_restart && num >= 2 && i2c->speed_hz > I2C_FAST_MODE_FREQ)
 		/* ignore the first restart irq after the master code,
 		 * otherwise the first transfer will be discarded.
 		 */
@@ -893,7 +890,7 @@ static int mtk_i2c_parse_dt(struct device_node *np, struct mtk_i2c *i2c)
 
 	ret = of_property_read_u32(np, "clock-frequency", &i2c->speed_hz);
 	if (ret < 0)
-		i2c->speed_hz = I2C_DEFAULT_SPEED;
+		i2c->speed_hz = I2C_STANDARD_MODE_FREQ;
 
 	ret = of_property_read_u32(np, "clock-div", &i2c->clk_src_div);
 	if (ret < 0)
-- 
2.25.0

