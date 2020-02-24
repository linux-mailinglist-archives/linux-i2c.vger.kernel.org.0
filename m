Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4BF7E16A9A5
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Feb 2020 16:15:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728023AbgBXPPr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Feb 2020 10:15:47 -0500
Received: from mga09.intel.com ([134.134.136.24]:62982 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728022AbgBXPPq (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 24 Feb 2020 10:15:46 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Feb 2020 07:15:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,480,1574150400"; 
   d="scan'208";a="384165599"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 24 Feb 2020 07:15:39 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 9E255BBD; Mon, 24 Feb 2020 17:15:33 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v1 39/40] i2c: uniphier: Use generic definitions for bus frequencies
Date:   Mon, 24 Feb 2020 17:15:29 +0200
Message-Id: <20200224151530.31713-39-andriy.shevchenko@linux.intel.com>
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

Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-uniphier.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-uniphier.c b/drivers/i2c/busses/i2c-uniphier.c
index 0270090c0360..782bf452b4a9 100644
--- a/drivers/i2c/busses/i2c-uniphier.c
+++ b/drivers/i2c/busses/i2c-uniphier.c
@@ -35,9 +35,6 @@
 #define UNIPHIER_I2C_NOISE	0x1c	/* noise filter control */
 #define UNIPHIER_I2C_SETUP	0x20	/* setup time control */
 
-#define UNIPHIER_I2C_DEFAULT_SPEED	100000
-#define UNIPHIER_I2C_MAX_SPEED		400000
-
 struct uniphier_i2c_priv {
 	struct completion comp;
 	struct i2c_adapter adap;
@@ -333,9 +330,9 @@ static int uniphier_i2c_probe(struct platform_device *pdev)
 	}
 
 	if (of_property_read_u32(dev->of_node, "clock-frequency", &bus_speed))
-		bus_speed = UNIPHIER_I2C_DEFAULT_SPEED;
+		bus_speed = I2C_STANDARD_MODE_FREQ;
 
-	if (!bus_speed || bus_speed > UNIPHIER_I2C_MAX_SPEED) {
+	if (!bus_speed || bus_speed > I2C_FAST_MODE_FREQ) {
 		dev_err(dev, "invalid clock-frequency %d\n", bus_speed);
 		return -EINVAL;
 	}
-- 
2.25.0

