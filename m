Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A07CD16A9AE
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Feb 2020 16:15:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727962AbgBXPPn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Feb 2020 10:15:43 -0500
Received: from mga17.intel.com ([192.55.52.151]:53981 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728003AbgBXPPm (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 24 Feb 2020 10:15:42 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Feb 2020 07:15:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,480,1574150400"; 
   d="scan'208";a="260368596"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga004.fm.intel.com with ESMTP; 24 Feb 2020 07:15:38 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 84C81B5B; Mon, 24 Feb 2020 17:15:33 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Ard Biesheuvel <ardb@kernel.org>
Subject: [PATCH v1 36/40] i2c: synquacer: Use generic definitions for bus frequencies
Date:   Mon, 24 Feb 2020 17:15:26 +0200
Message-Id: <20200224151530.31713-36-andriy.shevchenko@linux.intel.com>
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

Cc: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-synquacer.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-synquacer.c b/drivers/i2c/busses/i2c-synquacer.c
index 86026798b4f7..ccd2ed4fa2f1 100644
--- a/drivers/i2c/busses/i2c-synquacer.c
+++ b/drivers/i2c/busses/i2c-synquacer.c
@@ -67,10 +67,10 @@
 
 /* STANDARD MODE frequency */
 #define SYNQUACER_I2C_CLK_MASTER_STD(rate)			\
-	DIV_ROUND_UP(DIV_ROUND_UP((rate), 100000) - 2, 2)
+	DIV_ROUND_UP(DIV_ROUND_UP((rate), I2C_STANDARD_MODE_FREQ) - 2, 2)
 /* FAST MODE frequency */
 #define SYNQUACER_I2C_CLK_MASTER_FAST(rate)			\
-	DIV_ROUND_UP((DIV_ROUND_UP((rate), 400000) - 2) * 2, 3)
+	DIV_ROUND_UP((DIV_ROUND_UP((rate), I2C_FAST_MODE_FREQ) - 2) * 2, 3)
 
 /* (clkrate <= 18000000) */
 /* calculate the value of CS bits in CCR register on standard mode */
@@ -111,11 +111,11 @@
 					& SYNQUACER_I2C_CSR_CS_MASK)
 
 /* min I2C clock frequency 14M */
-#define SYNQUACER_I2C_MIN_CLK_RATE	(14 * 1000000)
+#define SYNQUACER_I2C_MIN_CLK_RATE	(14 * HZ_PER_MHZ)
 /* max I2C clock frequency 200M */
-#define SYNQUACER_I2C_MAX_CLK_RATE	(200 * 1000000)
+#define SYNQUACER_I2C_MAX_CLK_RATE	(200 * HZ_PER_MHZ)
 /* I2C clock frequency 18M */
-#define SYNQUACER_I2C_CLK_RATE_18M	(18 * 1000000)
+#define SYNQUACER_I2C_CLK_RATE_18M	(18 * HZ_PER_MHZ)
 
 #define SYNQUACER_I2C_SPEED_FM		400	// Fast Mode
 #define SYNQUACER_I2C_SPEED_SM		100	// Standard Mode
@@ -602,7 +602,7 @@ static int synquacer_i2c_probe(struct platform_device *pdev)
 	i2c->adapter.nr = pdev->id;
 	init_completion(&i2c->completion);
 
-	if (bus_speed < 400000)
+	if (bus_speed < I2C_FAST_MODE_FREQ)
 		i2c->speed_khz = SYNQUACER_I2C_SPEED_SM;
 	else
 		i2c->speed_khz = SYNQUACER_I2C_SPEED_FM;
-- 
2.25.0

