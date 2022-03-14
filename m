Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DF1D4D8693
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Mar 2022 15:17:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242230AbiCNOST (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Mar 2022 10:18:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242218AbiCNOSR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Mar 2022 10:18:17 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69E7913D3D
        for <linux-i2c@vger.kernel.org>; Mon, 14 Mar 2022 07:17:08 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1nTlVN-00054l-QO; Mon, 14 Mar 2022 15:17:01 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nTlVO-000f3b-57; Mon, 14 Mar 2022 15:17:00 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nTlVL-0097bO-R5; Mon, 14 Mar 2022 15:16:59 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>
Cc:     linux-clk@vger.kernel.org, kernel@pengutronix.de,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        Wolfram Sang <wsa@kernel.org>,
        Alexandru Ardelean <aardelean@deviqon.com>
Subject: [PATCH v8 14/16] i2c: imx: Simplify using devm_clk_get_enabled()
Date:   Mon, 14 Mar 2022 15:16:41 +0100
Message-Id: <20220314141643.22184-15-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220314141643.22184-1-u.kleine-koenig@pengutronix.de>
References: <20220314141643.22184-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1934; i=uwe@kleine-koenig.org; h=from:subject; bh=cpOMMXrTgDVsYCx6J041u9Sl0/KU1ysc3e28Et5yT2A=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBiL04Y4IYmtIk+6wsiLalltodMqdw1TLc/q+2Nnx0c cq8KWxyJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYi9OGAAKCRDB/BR4rcrsCckbB/ 9ogXsizZb0rBg6Bx/xYUbIdKqpE30LnfXEqv017psaGBUuc/2tt/TSHUsuc5UghUr/EvpLqTZUCRif c8ry4euVhU3+JKjchSi1N1LN3LGJmqjShya3Bdn2HlUK75MXMCPwhhvOGjJ19MVqtljxGg6aXL3M5a qXywvqajbwSr2el+lDH9697DniQpWhCgC4PQJB1FT3nGhRLoT0hbonljjUePM5Yo2jTQkMm+rxLWDm IqKZt1CtXEiqFxzOEjfOIdBp4vJttpnzsNJ26yaRTuj6TQVmyrU9ryGVK+eloJRmlgX3YYJTJnS572 C4SHo3v9PHkzI9KpIEAUMFfdcoQVQD
X-Developer-Key: i=uwe@kleine-koenig.org; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

devm_clk_get_enabled() returns the clk already (prepared and) enabled
and the automatically called cleanup cares for disabling (and
unpreparing). So simplify .probe() and .remove() accordingly.

Acked-by: Oleksij Rempel <o.rempel@pengutronix.de>
Acked-by: Wolfram Sang <wsa@kernel.org>
Reviewed-by: Alexandru Ardelean <aardelean@deviqon.com>
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/i2c/busses/i2c-imx.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 27f969b3dc07..6c346b0bec8b 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1448,16 +1448,10 @@ static int i2c_imx_probe(struct platform_device *pdev)
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
@@ -1530,7 +1524,6 @@ static int i2c_imx_probe(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 	pm_runtime_set_suspended(&pdev->dev);
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
-	clk_disable_unprepare(i2c_imx->clk);
 	return ret;
 }
 
@@ -1562,7 +1555,6 @@ static int i2c_imx_remove(struct platform_device *pdev)
 	irq = platform_get_irq(pdev, 0);
 	if (irq >= 0)
 		free_irq(irq, i2c_imx);
-	clk_disable_unprepare(i2c_imx->clk);
 
 	pm_runtime_put_noidle(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
-- 
2.35.1

