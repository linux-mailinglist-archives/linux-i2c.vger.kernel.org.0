Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF11216A994
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Feb 2020 16:15:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727860AbgBXPPf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Feb 2020 10:15:35 -0500
Received: from mga06.intel.com ([134.134.136.31]:59397 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727742AbgBXPPf (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 24 Feb 2020 10:15:35 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Feb 2020 07:15:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,480,1574150400"; 
   d="scan'208";a="435933636"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga005.fm.intel.com with ESMTP; 24 Feb 2020 07:15:32 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 504C1227; Mon, 24 Feb 2020 17:15:32 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Thor Thayer <thor.thayer@linux.intel.com>
Subject: [PATCH v1 04/40] i2c: altera: Use generic definitions for bus frequencies
Date:   Mon, 24 Feb 2020 17:14:54 +0200
Message-Id: <20200224151530.31713-4-andriy.shevchenko@linux.intel.com>
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

Cc: Thor Thayer <thor.thayer@linux.intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-altera.c | 8 ++++----
 include/linux/i2c.h             | 1 +
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-altera.c b/drivers/i2c/busses/i2c-altera.c
index 5255d3755411..1f70bbd6e084 100644
--- a/drivers/i2c/busses/i2c-altera.c
+++ b/drivers/i2c/busses/i2c-altera.c
@@ -142,12 +142,12 @@ static inline void altr_i2c_stop(struct altr_i2c_dev *idev)
 static void altr_i2c_init(struct altr_i2c_dev *idev)
 {
 	u32 divisor = clk_get_rate(idev->i2c_clk) / idev->bus_clk_rate;
-	u32 clk_mhz = clk_get_rate(idev->i2c_clk) / 1000000;
+	u32 clk_mhz = clk_get_rate(idev->i2c_clk) / HZ_PER_MHZ;
 	u32 tmp = (ALTR_I2C_THRESHOLD << ALTR_I2C_CTRL_RXT_SHFT) |
 		  (ALTR_I2C_THRESHOLD << ALTR_I2C_CTRL_TCT_SHFT);
 	u32 t_high, t_low;
 
-	if (idev->bus_clk_rate <= 100000) {
+	if (idev->bus_clk_rate <= I2C_STANDARD_MODE_FREQ) {
 		tmp &= ~ALTR_I2C_CTRL_BSPEED;
 		/* Standard mode SCL 50/50 */
 		t_high = divisor * 1 / 2;
@@ -423,10 +423,10 @@ static int altr_i2c_probe(struct platform_device *pdev)
 				       &idev->bus_clk_rate);
 	if (val) {
 		dev_err(&pdev->dev, "Default to 100kHz\n");
-		idev->bus_clk_rate = 100000;	/* default clock rate */
+		idev->bus_clk_rate = I2C_STANDARD_MODE_FREQ;	/* default clock rate */
 	}
 
-	if (idev->bus_clk_rate > 400000) {
+	if (idev->bus_clk_rate > I2C_FAST_MODE_FREQ) {
 		dev_err(&pdev->dev, "invalid clock-frequency %d\n",
 			idev->bus_clk_rate);
 		return -EINVAL;
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 708ac1262a0c..1b9c483bd9f5 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -40,6 +40,7 @@ typedef int (*i2c_slave_cb_t)(struct i2c_client *client,
 			      enum i2c_slave_event event, u8 *val);
 
 #define HZ_PER_KHZ			1000
+#define HZ_PER_MHZ			1000000
 
 /* I2C Frequency Modes */
 #define I2C_STANDARD_MODE_FREQ		(100 * HZ_PER_KHZ)
-- 
2.25.0

