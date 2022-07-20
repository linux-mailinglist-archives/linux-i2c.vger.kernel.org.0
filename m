Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E16A057B932
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Jul 2022 17:09:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229532AbiGTPJt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 20 Jul 2022 11:09:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229686AbiGTPJt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 20 Jul 2022 11:09:49 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7379D54670
        for <linux-i2c@vger.kernel.org>; Wed, 20 Jul 2022 08:09:48 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1oEBKY-00009P-Oy; Wed, 20 Jul 2022 17:09:42 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1oEBKV-0028SP-2z; Wed, 20 Jul 2022 17:09:39 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1oEBKU-006P3n-EA; Wed, 20 Jul 2022 17:09:38 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Oleksij Rempel <linux@rempel-privat.de>
Cc:     Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH] i2c: imx: Make sure to unregister adapter on remove()
Date:   Wed, 20 Jul 2022 17:09:33 +0200
Message-Id: <20220720150933.239956-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2197; h=from:subject; bh=D53yrOkFjbAEZBhDnqY5wtX50VwFqGjNL3/Eewx49sM=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBi2BqqmZ3HFnOV4ZmJydnCSnIkxijbk3/pXYs133nj LxF2M42JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYtgaqgAKCRDB/BR4rcrsCfecB/ 9PHR7xCiLJujsWtBtPp5ekbEE0iVQm4W44NffjfRN9ynoYnP9aT3sUPSuJcJonp4Ndu5XAJDWYjszv hlFyLSy9nwXpVZPMLU6U0DyKvXvml+tAoQQokzHipyhqLDLACxEWvmhh6gaWp8GiZlAFtR4p5Y6Y09 8KnlRowS4ZXQXZJ3QLPdtVJBJlEM/nUPsj+JrzKfjz/xgnZMuk8Fw4yh7b3MQ8DNgBdzQ8TFzG6YsD 6ZRbdC7+sQrkKRT2spqguY52NBeddTVMxwH/ckD6FdpZ8HecJn0WUiY+Zh9npeWTJFy8lyc190KErO cSUHcadGxISmlpY51zZpiFqtzOcAKD
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

If for whatever reasons pm_runtime_resume_and_get() fails and .remove() is
exited early, the i2c adapter stays around and the irq still calls its
handler, while the driver data and the register mapping go away. So if
later the i2c adapter is accessed or the irq triggers this results in
havoc accessing freed memory and unmapped registers.

So unregister the software resources even if resume failed, and only skip
the hardware access in that case.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/i2c/busses/i2c-imx.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index e9e2db68b9fb..7395560c13d0 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1572,9 +1572,7 @@ static int i2c_imx_remove(struct platform_device *pdev)
 	struct imx_i2c_struct *i2c_imx = platform_get_drvdata(pdev);
 	int irq, ret;
 
-	ret = pm_runtime_resume_and_get(&pdev->dev);
-	if (ret < 0)
-		return ret;
+	ret = pm_runtime_get_sync(&pdev->dev);
 
 	hrtimer_cancel(&i2c_imx->slave_timer);
 
@@ -1585,17 +1583,21 @@ static int i2c_imx_remove(struct platform_device *pdev)
 	if (i2c_imx->dma)
 		i2c_imx_dma_free(i2c_imx);
 
-	/* setup chip registers to defaults */
-	imx_i2c_write_reg(0, i2c_imx, IMX_I2C_IADR);
-	imx_i2c_write_reg(0, i2c_imx, IMX_I2C_IFDR);
-	imx_i2c_write_reg(0, i2c_imx, IMX_I2C_I2CR);
-	imx_i2c_write_reg(0, i2c_imx, IMX_I2C_I2SR);
+	if (ret == 0) {
+		/* setup chip registers to defaults */
+		imx_i2c_write_reg(0, i2c_imx, IMX_I2C_IADR);
+		imx_i2c_write_reg(0, i2c_imx, IMX_I2C_IFDR);
+		imx_i2c_write_reg(0, i2c_imx, IMX_I2C_I2CR);
+		imx_i2c_write_reg(0, i2c_imx, IMX_I2C_I2SR);
+		clk_disable(i2c_imx->clk);
+	}
 
 	clk_notifier_unregister(i2c_imx->clk, &i2c_imx->clk_change_nb);
 	irq = platform_get_irq(pdev, 0);
 	if (irq >= 0)
 		free_irq(irq, i2c_imx);
-	clk_disable_unprepare(i2c_imx->clk);
+
+	clk_unprepare(i2c_imx->clk);
 
 	pm_runtime_put_noidle(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);

base-commit: 6014cfa5bf32cf8c5c58b3cfd5ee0e1542c8a825
-- 
2.36.1

