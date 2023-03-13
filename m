Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 551196B80D5
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Mar 2023 19:36:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231145AbjCMSgi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 13 Mar 2023 14:36:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230341AbjCMSgV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 13 Mar 2023 14:36:21 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34C545A90F
        for <linux-i2c@vger.kernel.org>; Mon, 13 Mar 2023 11:35:19 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pbmzc-0002bb-VG; Mon, 13 Mar 2023 19:33:57 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pbmza-003uNV-KW; Mon, 13 Mar 2023 19:33:54 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pbmzZ-004cQx-UM; Mon, 13 Mar 2023 19:33:53 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Oleksij Rempel <linux@rempel-privat.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>
Cc:     Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH] i2c: imx: Simplify using devm_clk_get_enabled()
Date:   Mon, 13 Mar 2023 19:33:49 +0100
Message-Id: <20230313183349.2774002-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2091; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=iuWxsMV5rOClvmBAV4ga7wcYG62x6f4yTucQFtkyAQc=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkD2yJQ0764DgHGejeJm32Z5cPkxvdHum/cINGm K5ttbe0aPaJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZA9siQAKCRDB/BR4rcrs CbBrCACQ3IwA7sunR7Nn7sua8Y+ccqyZBAmslXcmGvU3s03gQIAI9KBS7GSdBGg4J5NPlue8fjf REvRCd9c7iyxbciYikN2vHaXk8RatFGKpFffFsG+Zxr+VHHarQLj940s8GTD0EVDmUl3P4RvVUG KqNYectmZpxm66890XQvg/6wa9h7eUrdZ0ryhiHQ3lsLcBa8ZgzlISXORfgnXSJv+EqNJMdQpiQ 4gGkN/7uUOJRPNHzDXf/XSpMkMazLfWGAgymaVSao46Gk9cgXO1f6W1gA57N75G+0FUIApDwK73 fdE2wIyRw0kz/o50dfdXv4vlZ3tdWUFU5cwspW00uWjvPL7K
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

devm_clk_get_enabled() returns the clk already (prepared and) enabled
and the automatically called cleanup cares for disabling (and
unpreparing). So simplify .probe() and .remove() accordingly.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/i2c/busses/i2c-imx.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index cf5bacf3a488..42189a5f2905 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1482,17 +1482,11 @@ static int i2c_imx_probe(struct platform_device *pdev)
 	ACPI_COMPANION_SET(&i2c_imx->adapter.dev, ACPI_COMPANION(&pdev->dev));
 
 	/* Get I2C clock */
-	i2c_imx->clk = devm_clk_get(&pdev->dev, NULL);
+	i2c_imx->clk = devm_clk_get_enabled(&pdev->dev, NULL);
 	if (IS_ERR(i2c_imx->clk))
 		return dev_err_probe(&pdev->dev, PTR_ERR(i2c_imx->clk),
 				     "can't get I2C clock\n");
 
-	ret = clk_prepare_enable(i2c_imx->clk);
-	if (ret) {
-		dev_err(&pdev->dev, "can't enable I2C clock, ret=%d\n", ret);
-		return ret;
-	}
-
 	/* Init queue */
 	init_waitqueue_head(&i2c_imx->queue);
 
@@ -1564,7 +1558,6 @@ static int i2c_imx_probe(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 	pm_runtime_set_suspended(&pdev->dev);
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
-	clk_disable_unprepare(i2c_imx->clk);
 	return ret;
 }
 
@@ -1590,7 +1583,6 @@ static int i2c_imx_remove(struct platform_device *pdev)
 		imx_i2c_write_reg(0, i2c_imx, IMX_I2C_IFDR);
 		imx_i2c_write_reg(0, i2c_imx, IMX_I2C_I2CR);
 		imx_i2c_write_reg(0, i2c_imx, IMX_I2C_I2SR);
-		clk_disable(i2c_imx->clk);
 	}
 
 	clk_notifier_unregister(i2c_imx->clk, &i2c_imx->clk_change_nb);
@@ -1598,8 +1590,6 @@ static int i2c_imx_remove(struct platform_device *pdev)
 	if (irq >= 0)
 		free_irq(irq, i2c_imx);
 
-	clk_unprepare(i2c_imx->clk);
-
 	pm_runtime_put_noidle(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 

base-commit: eeac8ede17557680855031c6f305ece2378af326
-- 
2.39.1

