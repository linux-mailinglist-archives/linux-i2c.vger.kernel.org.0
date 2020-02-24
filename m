Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA8D416A9AA
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Feb 2020 16:15:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727994AbgBXPPn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Feb 2020 10:15:43 -0500
Received: from mga17.intel.com ([192.55.52.151]:53971 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727783AbgBXPPl (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 24 Feb 2020 10:15:41 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Feb 2020 07:15:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,480,1574150400"; 
   d="scan'208";a="260368592"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga004.fm.intel.com with ESMTP; 24 Feb 2020 07:15:38 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 5F9A4AB0; Mon, 24 Feb 2020 17:15:33 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>
Subject: [PATCH v1 31/40] i2c: spdr: Use generic definitions for bus frequencies
Date:   Mon, 24 Feb 2020 17:15:21 +0200
Message-Id: <20200224151530.31713-31-andriy.shevchenko@linux.intel.com>
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

Cc: Orson Zhai <orsonzhai@gmail.com>
Cc: Baolin Wang <baolin.wang7@gmail.com>
Cc: Chunyan Zhang <zhang.lyra@gmail.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-sprd.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-sprd.c b/drivers/i2c/busses/i2c-sprd.c
index b432e7580458..4eb3ad1e5ab5 100644
--- a/drivers/i2c/busses/i2c-sprd.c
+++ b/drivers/i2c/busses/i2c-sprd.c
@@ -337,9 +337,9 @@ static void sprd_i2c_set_clk(struct sprd_i2c *i2c_dev, u32 freq)
 	writel(div1, i2c_dev->base + ADDR_DVD1);
 
 	/* Start hold timing = hold time(us) * source clock */
-	if (freq == 400000)
+	if (freq == I2C_FAST_MODE_FREQ)
 		writel((6 * apb_clk) / 10000000, i2c_dev->base + ADDR_STA0_DVD);
-	else if (freq == 100000)
+	else if (freq == I2C_STANDARD_MODE_FREQ)
 		writel((4 * apb_clk) / 1000000, i2c_dev->base + ADDR_STA0_DVD);
 }
 
@@ -502,7 +502,7 @@ static int sprd_i2c_probe(struct platform_device *pdev)
 	snprintf(i2c_dev->adap.name, sizeof(i2c_dev->adap.name),
 		 "%s", "sprd-i2c");
 
-	i2c_dev->bus_freq = 100000;
+	i2c_dev->bus_freq = I2C_STANDARD_MODE_FREQ;
 	i2c_dev->adap.owner = THIS_MODULE;
 	i2c_dev->dev = dev;
 	i2c_dev->adap.retries = 3;
@@ -516,7 +516,8 @@ static int sprd_i2c_probe(struct platform_device *pdev)
 		i2c_dev->bus_freq = prop;
 
 	/* We only support 100k and 400k now, otherwise will return error. */
-	if (i2c_dev->bus_freq != 100000 && i2c_dev->bus_freq != 400000)
+	if (i2c_dev->bus_freq != I2C_STANDARD_MODE_FREQ &&
+	    i2c_dev->bus_freq != I2C_FAST_MODE_FREQ)
 		return -EINVAL;
 
 	ret = sprd_i2c_clk_init(i2c_dev);
-- 
2.25.0

