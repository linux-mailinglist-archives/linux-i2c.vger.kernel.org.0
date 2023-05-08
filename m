Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02D9E6FB89D
	for <lists+linux-i2c@lfdr.de>; Mon,  8 May 2023 22:53:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233120AbjEHUxc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 May 2023 16:53:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233361AbjEHUxY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 May 2023 16:53:24 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5902A6187
        for <linux-i2c@vger.kernel.org>; Mon,  8 May 2023 13:53:22 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rC-0003HN-Ua; Mon, 08 May 2023 22:53:18 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rB-0024r2-CL; Mon, 08 May 2023 22:53:17 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rA-002YWP-Ji; Mon, 08 May 2023 22:53:16 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 26/89] i2c: hix5hd2: Convert to platform remove callback returning void
Date:   Mon,  8 May 2023 22:52:03 +0200
Message-Id: <20230508205306.1474415-27-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1781; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=KqNihOYeAeSA/u0t6mOLL9ofhs9TT6nbqPbF9NQVq+Y=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkWWCf59DFyxYoYl3LKv+/JT30iDGQNiXCcz3WJ MCCvwHBulOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFlgnwAKCRCPgPtYfRL+ Tlh6B/9HuvGJZz7XFVhXB5xvzjU+DDnNAvjt36WcMzjT1StoELMrnU8663sxJwIuOk/4F79tLPj h3Gdu6W9mjeDUsM19i7OFWCEXPWkkYXw18oW9YShMPXXy6LQi9DdLwsGidjk9nfZM+f3yVTv/Ab Xrpw8NiBzKHP4D9Glm+6Xy+ofJmrExM8sDOaOYgPOy1eaN20t+x2QpYEQtCx+2aWU497so3IcvM b0497zjYy4qEeOhuqL4kI7FbETOMEp9i8ONOhVKrcOQRClDf2HIKEWwwcAtOXkBHqbtaiLsH/td mtvkvF9ez3FoDOlmyKsHzumkmQ6lFgSclW7JMJwfWwktNLmk
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is (mostly) ignored
and this typically results in resource leaks. To improve here there is a
quest to make the remove callback return void. In the first step of this
quest all drivers are converted to .remove_new() which already returns
void.

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/i2c/busses/i2c-hix5hd2.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-hix5hd2.c b/drivers/i2c/busses/i2c-hix5hd2.c
index 0e34cbaca22d..64feaa9dca61 100644
--- a/drivers/i2c/busses/i2c-hix5hd2.c
+++ b/drivers/i2c/busses/i2c-hix5hd2.c
@@ -464,7 +464,7 @@ static int hix5hd2_i2c_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int hix5hd2_i2c_remove(struct platform_device *pdev)
+static void hix5hd2_i2c_remove(struct platform_device *pdev)
 {
 	struct hix5hd2_i2c_priv *priv = platform_get_drvdata(pdev);
 
@@ -472,8 +472,6 @@ static int hix5hd2_i2c_remove(struct platform_device *pdev)
 	pm_runtime_disable(priv->dev);
 	pm_runtime_set_suspended(priv->dev);
 	clk_disable_unprepare(priv->clk);
-
-	return 0;
 }
 
 #ifdef CONFIG_PM
@@ -511,7 +509,7 @@ MODULE_DEVICE_TABLE(of, hix5hd2_i2c_match);
 
 static struct platform_driver hix5hd2_i2c_driver = {
 	.probe		= hix5hd2_i2c_probe,
-	.remove		= hix5hd2_i2c_remove,
+	.remove_new	= hix5hd2_i2c_remove,
 	.driver		= {
 		.name	= "hix5hd2-i2c",
 		.pm	= &hix5hd2_i2c_pm_ops,
-- 
2.39.2

