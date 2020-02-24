Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20F3016A99F
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Feb 2020 16:15:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728002AbgBXPPl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Feb 2020 10:15:41 -0500
Received: from mga06.intel.com ([134.134.136.31]:59407 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727989AbgBXPPl (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 24 Feb 2020 10:15:41 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Feb 2020 07:15:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,480,1574150400"; 
   d="scan'208";a="231153393"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 24 Feb 2020 07:15:39 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 92475A57; Mon, 24 Feb 2020 17:15:33 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v1 38/40] i2c: uniphier-f: Use generic definitions for bus frequencies
Date:   Mon, 24 Feb 2020 17:15:28 +0200
Message-Id: <20200224151530.31713-38-andriy.shevchenko@linux.intel.com>
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
 drivers/i2c/busses/i2c-uniphier-f.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-uniphier-f.c b/drivers/i2c/busses/i2c-uniphier-f.c
index 4241aac79e7e..47b78ebfb291 100644
--- a/drivers/i2c/busses/i2c-uniphier-f.c
+++ b/drivers/i2c/busses/i2c-uniphier-f.c
@@ -73,8 +73,6 @@
 #define UNIPHIER_FI2C_BYTE_WISE		BIT(3)
 #define UNIPHIER_FI2C_DEFER_STOP_COMP	BIT(4)
 
-#define UNIPHIER_FI2C_DEFAULT_SPEED	100000
-#define UNIPHIER_FI2C_MAX_SPEED		400000
 #define UNIPHIER_FI2C_FIFO_SIZE		8
 
 struct uniphier_fi2c_priv {
@@ -537,9 +535,9 @@ static int uniphier_fi2c_probe(struct platform_device *pdev)
 	}
 
 	if (of_property_read_u32(dev->of_node, "clock-frequency", &bus_speed))
-		bus_speed = UNIPHIER_FI2C_DEFAULT_SPEED;
+		bus_speed = I2C_STANDARD_MODE_FREQ;
 
-	if (!bus_speed || bus_speed > UNIPHIER_FI2C_MAX_SPEED) {
+	if (!bus_speed || bus_speed > I2C_FAST_MODE_FREQ) {
 		dev_err(dev, "invalid clock-frequency %d\n", bus_speed);
 		return -EINVAL;
 	}
-- 
2.25.0

