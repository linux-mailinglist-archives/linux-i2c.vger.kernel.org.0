Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 301F137962B
	for <lists+linux-i2c@lfdr.de>; Mon, 10 May 2021 19:41:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231594AbhEJRnC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 10 May 2021 13:43:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231631AbhEJRnC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 10 May 2021 13:43:02 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3AB2C061574
        for <linux-i2c@vger.kernel.org>; Mon, 10 May 2021 10:41:57 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1lg9uh-0005HN-92; Mon, 10 May 2021 19:41:51 +0200
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1lg9ug-0006af-AM; Mon, 10 May 2021 19:41:50 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>
Cc:     linux-clk@vger.kernel.org,
        Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
        Alexandru Ardelean <aardelean@deviqon.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        kernel@pengutronix.de, Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Wolfram Sang <wsa@kernel.org>,
        Oleksij Rempel <o.rempel@pengutronix.de>
Subject: [PATCH v7 5/6] i2c: imx: Simplify using devm_clk_get_enabled()
Date:   Mon, 10 May 2021 19:41:41 +0200
Message-Id: <20210510174142.986250-6-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210510174142.986250-1-u.kleine-koenig@pengutronix.de>
References: <20210510174142.986250-1-u.kleine-koenig@pengutronix.de>
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

devm_clk_get_enabled() returns the clk already (prepared and) enabled
and the automatically called cleanup cares for disabling (and
unpreparing). So simplify .probe() and .remove() accordingly.

Acked-by: Oleksij Rempel <o.rempel@pengutronix.de>
Acked-by: Wolfram Sang <wsa@kernel.org>
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/i2c/busses/i2c-imx.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index dc5ca71906db..13241401ad88 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1405,16 +1405,10 @@ static int i2c_imx_probe(struct platform_device *pdev)
 	ACPI_COMPANION_SET(&i2c_imx->adapter.dev, ACPI_COMPANION(&pdev->dev));
 
 	/* Get I2C clock */
-	i2c_imx->clk = devm_clk_get(&pdev->dev, NULL);
+	i2c_imx->clk = devm_clk_get_enabled(&pdev->dev, NULL);
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
@@ -1487,7 +1481,6 @@ static int i2c_imx_probe(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 	pm_runtime_set_suspended(&pdev->dev);
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
-	clk_disable_unprepare(i2c_imx->clk);
 	return ret;
 }
 
@@ -1517,7 +1510,6 @@ static int i2c_imx_remove(struct platform_device *pdev)
 	irq = platform_get_irq(pdev, 0);
 	if (irq >= 0)
 		free_irq(irq, i2c_imx);
-	clk_disable_unprepare(i2c_imx->clk);
 
 	pm_runtime_put_noidle(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
-- 
2.30.2

