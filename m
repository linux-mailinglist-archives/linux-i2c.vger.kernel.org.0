Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76AEF3482A0
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Mar 2021 21:13:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237906AbhCXUM7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 24 Mar 2021 16:12:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237892AbhCXUMg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 24 Mar 2021 16:12:36 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 482E3C061763
        for <linux-i2c@vger.kernel.org>; Wed, 24 Mar 2021 13:12:36 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1lP9ri-0000nh-Ot; Wed, 24 Mar 2021 21:12:30 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1lP9rg-0001LT-Ke; Wed, 24 Mar 2021 21:12:28 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>
Cc:     linux-i2c@vger.kernel.org,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-clk@vger.kernel.org
Subject: [PATCH] i2c: imx: Simplify using devm_clk_get_prepared()
Date:   Wed, 24 Mar 2021 21:12:23 +0100
Message-Id: <20210324201223.75921-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210301135053.1462168-1-u.kleine-koenig@pengutronix.de>
References: <20210301135053.1462168-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

devm_clk_get_prepared returns the clk already prepared and the
automatically called cleanup cares for unpreparing. So simplify .probe
and .remove accordingly.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
Hello,

this simplification depends on a patch set that introduces
devm_clk_get_prepared() and friends.

The most recent version of this patch set can be found at

	https://lore.kernel.org/r/20210301135053.1462168-1-u.kleine-koenig@pengutronix.de

Unfortunately I didn't get any feedback at all from the clk maintainers
on it, so I try to make other maintainers aware of it in the expectation
that the simplifications are welcome and so lure the clk maintainers to
share their thoughts.

Best regards
Uwe

 drivers/i2c/busses/i2c-imx.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index b80fdc1f0092..c0e18a6caa38 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1405,16 +1405,10 @@ static int i2c_imx_probe(struct platform_device *pdev)
 	ACPI_COMPANION_SET(&i2c_imx->adapter.dev, ACPI_COMPANION(&pdev->dev));
 
 	/* Get I2C clock */
-	i2c_imx->clk = devm_clk_get(&pdev->dev, NULL);
+	i2c_imx->clk = devm_clk_get_prepared(&pdev->dev, NULL);
 	if (IS_ERR(i2c_imx->clk))
 		return dev_err_probe(&pdev->dev, PTR_ERR(i2c_imx->clk),
-				     "can't get I2C clock\n");
-
-	ret = clk_prepare_enable(i2c_imx->clk);
-	if (ret) {
-		dev_err(&pdev->dev, "can't enable I2C clock, ret=%d\n", ret);
-		return ret;
-	}
+				     "can't get prepared I2C clock\n");
 
 	/* Init queue */
 	init_waitqueue_head(&i2c_imx->queue);
@@ -1517,7 +1511,6 @@ static int i2c_imx_remove(struct platform_device *pdev)
 	irq = platform_get_irq(pdev, 0);
 	if (irq >= 0)
 		free_irq(irq, i2c_imx);
-	clk_disable_unprepare(i2c_imx->clk);
 
 	pm_runtime_put_noidle(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
-- 
2.30.2

