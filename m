Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D58416A998
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Feb 2020 16:15:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727960AbgBXPPj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Feb 2020 10:15:39 -0500
Received: from mga06.intel.com ([134.134.136.31]:59400 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727972AbgBXPPj (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 24 Feb 2020 10:15:39 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Feb 2020 07:15:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,480,1574150400"; 
   d="scan'208";a="231153389"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 24 Feb 2020 07:15:37 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id D4B0352D; Mon, 24 Feb 2020 17:15:32 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH v1 18/40] i2c: imx: Use generic definitions for bus frequencies
Date:   Mon, 24 Feb 2020 17:15:08 +0200
Message-Id: <20200224151530.31713-18-andriy.shevchenko@linux.intel.com>
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

Cc: Oleksij Rempel <linux@rempel-privat.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-imx.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index a3b61336fe55..f5ed0f38904c 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -49,9 +49,6 @@
 /* This will be the driver name the kernel reports */
 #define DRIVER_NAME "imx-i2c"
 
-/* Default value */
-#define IMX_I2C_BIT_RATE	100000	/* 100kHz */
-
 /*
  * Enable DMA if transfer byte size is bigger than this threshold.
  * As the hardware request, it must bigger than 4 bytes.\
@@ -1139,7 +1136,7 @@ static int i2c_imx_probe(struct platform_device *pdev)
 		goto rpm_disable;
 
 	/* Set up clock divider */
-	i2c_imx->bitrate = IMX_I2C_BIT_RATE;
+	i2c_imx->bitrate = I2C_STANDARD_MODE_FREQ;
 	ret = of_property_read_u32(pdev->dev.of_node,
 				   "clock-frequency", &i2c_imx->bitrate);
 	if (ret < 0 && pdata && pdata->bitrate)
-- 
2.25.0

