Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C7CA16A99A
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Feb 2020 16:15:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727986AbgBXPPk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Feb 2020 10:15:40 -0500
Received: from mga03.intel.com ([134.134.136.65]:14873 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727974AbgBXPPj (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 24 Feb 2020 10:15:39 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Feb 2020 07:15:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,480,1574150400"; 
   d="scan'208";a="316773096"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 24 Feb 2020 07:15:37 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 1E2B59FC; Mon, 24 Feb 2020 17:15:33 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v1 24/40] i2c: owl: Use generic definitions for bus frequencies
Date:   Mon, 24 Feb 2020 17:15:14 +0200
Message-Id: <20200224151530.31713-24-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200224151530.31713-1-andriy.shevchenko@linux.intel.com>
References: <20200224151530.31713-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Since we have generic definitions for bus frequencies, let's use them.

Cc: "Andreas Färber" <afaerber@suse.de>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-owl.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-owl.c b/drivers/i2c/busses/i2c-owl.c
index b6b5a495118b..f9baeeb1a711 100644
--- a/drivers/i2c/busses/i2c-owl.c
+++ b/drivers/i2c/busses/i2c-owl.c
@@ -87,9 +87,6 @@
 
 #define OWL_I2C_MAX_RETRIES	50
 
-#define OWL_I2C_DEF_SPEED_HZ	100000
-#define OWL_I2C_MAX_SPEED_HZ	400000
-
 struct owl_i2c_dev {
 	struct i2c_adapter	adap;
 	struct i2c_msg		*msg;
@@ -419,11 +416,11 @@ static int owl_i2c_probe(struct platform_device *pdev)
 
 	if (of_property_read_u32(dev->of_node, "clock-frequency",
 				 &i2c_dev->bus_freq))
-		i2c_dev->bus_freq = OWL_I2C_DEF_SPEED_HZ;
+		i2c_dev->bus_freq = I2C_STANDARD_MODE_FREQ;
 
 	/* We support only frequencies of 100k and 400k for now */
-	if (i2c_dev->bus_freq != OWL_I2C_DEF_SPEED_HZ &&
-	    i2c_dev->bus_freq != OWL_I2C_MAX_SPEED_HZ) {
+	if (i2c_dev->bus_freq != I2C_STANDARD_MODE_FREQ &&
+	    i2c_dev->bus_freq != I2C_FAST_MODE_FREQ) {
 		dev_err(dev, "invalid clock-frequency %d\n", i2c_dev->bus_freq);
 		return -EINVAL;
 	}
-- 
2.25.0

