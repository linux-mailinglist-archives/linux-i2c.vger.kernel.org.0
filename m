Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 511FF16A9A9
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Feb 2020 16:15:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728010AbgBXPPr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Feb 2020 10:15:47 -0500
Received: from mga09.intel.com ([134.134.136.24]:62982 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727859AbgBXPPq (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 24 Feb 2020 10:15:46 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Feb 2020 07:15:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,480,1574150400"; 
   d="scan'208";a="241028088"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 24 Feb 2020 07:15:38 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 365C1A0F; Mon, 24 Feb 2020 17:15:33 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH v1 27/40] i2c: rk3x: Use generic definitions for bus frequencies
Date:   Mon, 24 Feb 2020 17:15:17 +0200
Message-Id: <20200224151530.31713-27-andriy.shevchenko@linux.intel.com>
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

Cc: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-rk3x.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rk3x.c b/drivers/i2c/busses/i2c-rk3x.c
index 1a33007b03e9..a621f747009b 100644
--- a/drivers/i2c/busses/i2c-rk3x.c
+++ b/drivers/i2c/busses/i2c-rk3x.c
@@ -539,9 +539,9 @@ static irqreturn_t rk3x_i2c_irq(int irqno, void *dev_id)
  */
 static const struct i2c_spec_values *rk3x_i2c_get_spec(unsigned int speed)
 {
-	if (speed <= 100000)
+	if (speed <= I2C_STANDARD_MODE_FREQ)
 		return &standard_mode_spec;
-	else if (speed <= 400000)
+	else if (speed <= I2C_FAST_MODE_FREQ)
 		return &fast_mode_spec;
 	else
 		return &fast_mode_plus_spec;
@@ -578,8 +578,8 @@ static int rk3x_i2c_v0_calc_timings(unsigned long clk_rate,
 	int ret = 0;
 
 	/* Only support standard-mode and fast-mode */
-	if (WARN_ON(t->bus_freq_hz > 400000))
-		t->bus_freq_hz = 400000;
+	if (WARN_ON(t->bus_freq_hz > I2C_FAST_MODE_FREQ))
+		t->bus_freq_hz = I2C_FAST_MODE_FREQ;
 
 	/* prevent scl_rate_khz from becoming 0 */
 	if (WARN_ON(t->bus_freq_hz < 1000))
@@ -758,8 +758,8 @@ static int rk3x_i2c_v1_calc_timings(unsigned long clk_rate,
 	int ret = 0;
 
 	/* Support standard-mode, fast-mode and fast-mode plus */
-	if (WARN_ON(t->bus_freq_hz > 1000000))
-		t->bus_freq_hz = 1000000;
+	if (WARN_ON(t->bus_freq_hz > I2C_FAST_MODE_PLUS_FREQ))
+		t->bus_freq_hz = I2C_FAST_MODE_PLUS_FREQ;
 
 	/* prevent scl_rate_khz from becoming 0 */
 	if (WARN_ON(t->bus_freq_hz < 1000))
-- 
2.25.0

