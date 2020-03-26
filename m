Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2AF13193C88
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Mar 2020 11:07:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726354AbgCZKHc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 26 Mar 2020 06:07:32 -0400
Received: from sauhun.de ([88.99.104.3]:48446 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726270AbgCZKHc (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 26 Mar 2020 06:07:32 -0400
Received: from localhost (p54B3331F.dip0.t-ipconnect.de [84.179.51.31])
        by pokefinder.org (Postfix) with ESMTPSA id 0028F2C08C2;
        Thu, 26 Mar 2020 11:07:29 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] i2c: rcar: clean up after refactoring i2c_timings
Date:   Thu, 26 Mar 2020 11:07:21 +0100
Message-Id: <20200326100721.1265-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The pointer is not really needed anymore since we have the timings
struct available in the function itself now. Remove the pointer and
access the struct directly.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-rcar.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index 25013641a85d..3b5397aa4ca6 100644
--- a/drivers/i2c/busses/i2c-rcar.c
+++ b/drivers/i2c/busses/i2c-rcar.c
@@ -240,15 +240,15 @@ static int rcar_i2c_clock_calculate(struct rcar_i2c_priv *priv)
 	u32 scgd, cdf, round, ick, sum, scl, cdf_width;
 	unsigned long rate;
 	struct device *dev = rcar_i2c_priv_to_dev(priv);
-	struct i2c_timings i2c_t = {
+	struct i2c_timings t = {
 		.bus_freq_hz		= I2C_MAX_STANDARD_MODE_FREQ,
 		.scl_fall_ns		= 35,
 		.scl_rise_ns		= 200,
 		.scl_int_delay_ns	= 50,
-	}, *t = &i2c_t;
+	};
 
 	/* Fall back to previously used values if not supplied */
-	i2c_parse_fw_timings(dev, &i2c_t, false);
+	i2c_parse_fw_timings(dev, &t, false);
 
 	switch (priv->devtype) {
 	case I2C_RCAR_GEN1:
@@ -294,7 +294,7 @@ static int rcar_i2c_clock_calculate(struct rcar_i2c_priv *priv)
 	 *  = F[sum * ick / 1000000000]
 	 *  = F[(ick / 1000000) * sum / 1000]
 	 */
-	sum = t->scl_fall_ns + t->scl_rise_ns + t->scl_int_delay_ns;
+	sum = t.scl_fall_ns + t.scl_rise_ns + t.scl_int_delay_ns;
 	round = (ick + 500000) / 1000000 * sum;
 	round = (round + 500) / 1000;
 
@@ -312,7 +312,7 @@ static int rcar_i2c_clock_calculate(struct rcar_i2c_priv *priv)
 	 */
 	for (scgd = 0; scgd < 0x40; scgd++) {
 		scl = ick / (20 + (scgd * 8) + round);
-		if (scl <= t->bus_freq_hz)
+		if (scl <= t.bus_freq_hz)
 			goto scgd_find;
 	}
 	dev_err(dev, "it is impossible to calculate best SCL\n");
@@ -320,7 +320,7 @@ static int rcar_i2c_clock_calculate(struct rcar_i2c_priv *priv)
 
 scgd_find:
 	dev_dbg(dev, "clk %d/%d(%lu), round %u, CDF:0x%x, SCGD: 0x%x\n",
-		scl, t->bus_freq_hz, rate, round, cdf, scgd);
+		scl, t.bus_freq_hz, rate, round, cdf, scgd);
 
 	/* keep icccr value */
 	priv->icccr = scgd << cdf_width | cdf;
-- 
2.20.1

