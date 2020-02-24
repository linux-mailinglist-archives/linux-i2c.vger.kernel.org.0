Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B29716A9AC
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Feb 2020 16:15:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727783AbgBXPPn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Feb 2020 10:15:43 -0500
Received: from mga17.intel.com ([192.55.52.151]:53971 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727998AbgBXPPl (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 24 Feb 2020 10:15:41 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Feb 2020 07:15:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,480,1574150400"; 
   d="scan'208";a="260368588"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga004.fm.intel.com with ESMTP; 24 Feb 2020 07:15:37 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id CAC4D489; Mon, 24 Feb 2020 17:15:32 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH v1 17/40] i2c: imx-lpi2c: Use generic definitions for bus frequencies
Date:   Mon, 24 Feb 2020 17:15:07 +0200
Message-Id: <20200224151530.31713-17-andriy.shevchenko@linux.intel.com>
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

Cc: Dong Aisheng <aisheng.dong@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-imx-lpi2c.c | 16 +++++-----------
 include/linux/i2c.h                |  1 +
 2 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index c92b56485fa6..eb2b0536a59f 100644
--- a/drivers/i2c/busses/i2c-imx-lpi2c.c
+++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
@@ -75,12 +75,6 @@
 #define I2C_CLK_RATIO	2
 #define CHUNK_DATA	256
 
-#define LPI2C_DEFAULT_RATE	100000
-#define STARDARD_MAX_BITRATE	400000
-#define FAST_MAX_BITRATE	1000000
-#define FAST_PLUS_MAX_BITRATE	3400000
-#define HIGHSPEED_MAX_BITRATE	5000000
-
 #define I2C_PM_TIMEOUT		10 /* ms */
 
 enum lpi2c_imx_mode {
@@ -152,13 +146,13 @@ static void lpi2c_imx_set_mode(struct lpi2c_imx_struct *lpi2c_imx)
 	unsigned int bitrate = lpi2c_imx->bitrate;
 	enum lpi2c_imx_mode mode;
 
-	if (bitrate < STARDARD_MAX_BITRATE)
+	if (bitrate < I2C_FAST_MODE_FREQ)
 		mode = STANDARD;
-	else if (bitrate < FAST_MAX_BITRATE)
+	else if (bitrate < I2C_FAST_MODE_PLUS_FREQ)
 		mode = FAST;
-	else if (bitrate < FAST_PLUS_MAX_BITRATE)
+	else if (bitrate < I2C_HIGH_SPEED_MODE_FREQ)
 		mode = FAST_PLUS;
-	else if (bitrate < HIGHSPEED_MAX_BITRATE)
+	else if (bitrate < I2C_ULTRA_SPEED_MODE_FREQ)
 		mode = HS;
 	else
 		mode = ULTRA_FAST;
@@ -578,7 +572,7 @@ static int lpi2c_imx_probe(struct platform_device *pdev)
 	ret = of_property_read_u32(pdev->dev.of_node,
 				   "clock-frequency", &lpi2c_imx->bitrate);
 	if (ret)
-		lpi2c_imx->bitrate = LPI2C_DEFAULT_RATE;
+		lpi2c_imx->bitrate = I2C_STANDARD_MODE_FREQ;
 
 	ret = devm_request_irq(&pdev->dev, irq, lpi2c_imx_isr, 0,
 			       pdev->name, lpi2c_imx);
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index d3022a014227..920f670596cc 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -48,6 +48,7 @@ typedef int (*i2c_slave_cb_t)(struct i2c_client *client,
 #define I2C_FAST_MODE_PLUS_FREQ		(1000 * HZ_PER_KHZ)
 #define I2C_TURBO_MODE_FREQ		(1400 * HZ_PER_KHZ)
 #define I2C_HIGH_SPEED_MODE_FREQ	(3400 * HZ_PER_KHZ)
+#define I2C_ULTRA_SPEED_MODE_FREQ	(5000 * HZ_PER_KHZ)
 
 struct module;
 struct property_entry;
-- 
2.25.0

