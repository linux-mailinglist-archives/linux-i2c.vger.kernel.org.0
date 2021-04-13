Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 865A935E1AE
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Apr 2021 16:37:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230123AbhDMOiN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Apr 2021 10:38:13 -0400
Received: from mga14.intel.com ([192.55.52.115]:8991 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231366AbhDMOiN (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 13 Apr 2021 10:38:13 -0400
IronPort-SDR: 9rIC5yQXZKwWULVhSOsj6KcztkzpTxSQ5F+KJYg+XRA0iBWB42SE2RchO4019lehyHlJ5ViHuY
 bI9iIMPyFe4Q==
X-IronPort-AV: E=McAfee;i="6200,9189,9953"; a="193988378"
X-IronPort-AV: E=Sophos;i="5.82,219,1613462400"; 
   d="scan'208";a="193988378"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2021 07:37:53 -0700
IronPort-SDR: TB/0ZuUUuhOmkR+djZnBpAJKAo3xOa3mKWa/40q1ZpBj+T/uy7RPB0av9okeA9MPtBcy/sdK7Y
 ba2S0rxbYKLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,219,1613462400"; 
   d="scan'208";a="389050297"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 13 Apr 2021 07:37:51 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id A6B4FB7; Tue, 13 Apr 2021 17:38:08 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Chris Packham <chris.packham@alliedtelesis.co.nz>, wsa@kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/4] i2c: mpc: Use devm_clk_get_optional()
Date:   Tue, 13 Apr 2021 17:37:53 +0300
Message-Id: <20210413143756.60138-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The peripheral clock is optional and we may get an -EPROBE_DEFER error code
which would not be propagated correctly, fix this by using
devm_clk_get_optional().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-mpc.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mpc.c b/drivers/i2c/busses/i2c-mpc.c
index 3c8bcdfff7e7..6dc029a31d36 100644
--- a/drivers/i2c/busses/i2c-mpc.c
+++ b/drivers/i2c/busses/i2c-mpc.c
@@ -690,17 +690,18 @@ static int fsl_i2c_probe(struct platform_device *op)
 	 * enable clock for the I2C peripheral (non fatal),
 	 * keep a reference upon successful allocation
 	 */
-	clk = devm_clk_get(&op->dev, NULL);
-	if (!IS_ERR(clk)) {
-		err = clk_prepare_enable(clk);
-		if (err) {
-			dev_err(&op->dev, "failed to enable clock\n");
-			return err;
-		} else {
-			i2c->clk_per = clk;
-		}
+	clk = devm_clk_get_optional(&op->dev, NULL);
+	if (IS_ERR(clk))
+		return PTR_ERR(clk);
+
+	err = clk_prepare_enable(clk);
+	if (err) {
+		dev_err(&op->dev, "failed to enable clock\n");
+		return err;
 	}
 
+	i2c->clk_per = clk;
+
 	if (of_property_read_bool(op->dev.of_node, "fsl,preserve-clocking")) {
 		clock = MPC_I2C_CLOCK_PRESERVE;
 	} else {
@@ -744,8 +745,7 @@ static int fsl_i2c_probe(struct platform_device *op)
 	return 0;
 
  fail_add:
-	if (i2c->clk_per)
-		clk_disable_unprepare(i2c->clk_per);
+	clk_disable_unprepare(i2c->clk_per);
 
 	return result;
 };
@@ -756,8 +756,7 @@ static int fsl_i2c_remove(struct platform_device *op)
 
 	i2c_del_adapter(&i2c->adap);
 
-	if (i2c->clk_per)
-		clk_disable_unprepare(i2c->clk_per);
+	clk_disable_unprepare(i2c->clk_per);
 
 	return 0;
 };
-- 
2.30.2

