Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0BE0116A9B8
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Feb 2020 16:15:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727755AbgBXPPw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Feb 2020 10:15:52 -0500
Received: from mga14.intel.com ([192.55.52.115]:17577 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727941AbgBXPPh (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 24 Feb 2020 10:15:37 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Feb 2020 07:15:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,480,1574150400"; 
   d="scan'208";a="349935750"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 24 Feb 2020 07:15:33 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 34542111; Mon, 24 Feb 2020 17:15:31 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v1 01/40] i2c: qup: Move bus frequency definitions to i2c.h
Date:   Mon, 24 Feb 2020 17:14:51 +0200
Message-Id: <20200224151530.31713-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Move bus frequency definitions to i2c.h for wider use.

Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-qup.c | 9 ++-------
 include/linux/i2c.h          | 7 +++++++
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qup.c b/drivers/i2c/busses/i2c-qup.c
index 2d7dabe12723..b9d48ace9ff2 100644
--- a/drivers/i2c/busses/i2c-qup.c
+++ b/drivers/i2c/busses/i2c-qup.c
@@ -136,13 +136,8 @@
  */
 #define TOUT_MIN			2
 
-/* I2C Frequency Modes */
-#define I2C_STANDARD_FREQ		100000
-#define I2C_FAST_MODE_FREQ		400000
-#define I2C_FAST_MODE_PLUS_FREQ		1000000
-
 /* Default values. Use these if FW query fails */
-#define DEFAULT_CLK_FREQ I2C_STANDARD_FREQ
+#define DEFAULT_CLK_FREQ I2C_STANDARD_MODE_FREQ
 #define DEFAULT_SRC_CLK 20000000
 
 /*
@@ -1861,7 +1856,7 @@ static int qup_i2c_probe(struct platform_device *pdev)
 	qup->in_fifo_sz = qup->in_blk_sz * (2 << size);
 
 	hs_div = 3;
-	if (clk_freq <= I2C_STANDARD_FREQ) {
+	if (clk_freq <= I2C_STANDARD_MODE_FREQ) {
 		fs_div = ((src_clk_freq / clk_freq) / 2) - 3;
 		qup->clk_ctl = (hs_div << 8) | (fs_div & 0xff);
 	} else {
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index f834687989f7..708ac1262a0c 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -39,6 +39,13 @@ enum i2c_slave_event;
 typedef int (*i2c_slave_cb_t)(struct i2c_client *client,
 			      enum i2c_slave_event event, u8 *val);
 
+#define HZ_PER_KHZ			1000
+
+/* I2C Frequency Modes */
+#define I2C_STANDARD_MODE_FREQ		(100 * HZ_PER_KHZ)
+#define I2C_FAST_MODE_FREQ		(400 * HZ_PER_KHZ)
+#define I2C_FAST_MODE_PLUS_FREQ		(1000 * HZ_PER_KHZ)
+
 struct module;
 struct property_entry;
 
-- 
2.25.0

