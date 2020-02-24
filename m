Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB43116A9A6
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Feb 2020 16:15:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727992AbgBXPPm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Feb 2020 10:15:42 -0500
Received: from mga05.intel.com ([192.55.52.43]:55902 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727994AbgBXPPl (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 24 Feb 2020 10:15:41 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Feb 2020 07:15:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,480,1574150400"; 
   d="scan'208";a="409902753"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 24 Feb 2020 07:15:39 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 7D3A1B50; Mon, 24 Feb 2020 17:15:33 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Patrice Chotard <patrice.chotard@st.com>
Subject: [PATCH v1 35/40] i2c: st: Use generic definitions for bus frequencies
Date:   Mon, 24 Feb 2020 17:15:25 +0200
Message-Id: <20200224151530.31713-35-andriy.shevchenko@linux.intel.com>
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

Cc: Patrice Chotard <patrice.chotard@st.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-st.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-st.c b/drivers/i2c/busses/i2c-st.c
index 54e1fc8a495e..441fc2245f25 100644
--- a/drivers/i2c/busses/i2c-st.c
+++ b/drivers/i2c/busses/i2c-st.c
@@ -213,7 +213,7 @@ static inline void st_i2c_clr_bits(void __iomem *reg, u32 mask)
  */
 static struct st_i2c_timings i2c_timings[] = {
 	[I2C_MODE_STANDARD] = {
-		.rate			= 100000,
+		.rate			= I2C_STANDARD_MODE_FREQ,
 		.rep_start_hold		= 4400,
 		.rep_start_setup	= 5170,
 		.start_hold		= 4400,
@@ -222,7 +222,7 @@ static struct st_i2c_timings i2c_timings[] = {
 		.bus_free_time		= 5170,
 	},
 	[I2C_MODE_FAST] = {
-		.rate			= 400000,
+		.rate			= I2C_FAST_MODE_FREQ,
 		.rep_start_hold		= 660,
 		.rep_start_setup	= 660,
 		.start_hold		= 660,
@@ -835,7 +835,7 @@ static int st_i2c_probe(struct platform_device *pdev)
 
 	i2c_dev->mode = I2C_MODE_STANDARD;
 	ret = of_property_read_u32(np, "clock-frequency", &clk_rate);
-	if ((!ret) && (clk_rate == 400000))
+	if (!ret && (clk_rate == I2C_FAST_MODE_FREQ))
 		i2c_dev->mode = I2C_MODE_FAST;
 
 	i2c_dev->dev = &pdev->dev;
-- 
2.25.0

