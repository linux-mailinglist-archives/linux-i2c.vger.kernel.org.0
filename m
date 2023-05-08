Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18B8D6FB8CA
	for <lists+linux-i2c@lfdr.de>; Mon,  8 May 2023 22:54:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233256AbjEHUx6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 May 2023 16:53:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233780AbjEHUxn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 May 2023 16:53:43 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEAA87AAC
        for <linux-i2c@vger.kernel.org>; Mon,  8 May 2023 13:53:34 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rM-0003sz-1N; Mon, 08 May 2023 22:53:28 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rL-0024tc-DP; Mon, 08 May 2023 22:53:27 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rK-002YYT-JB; Mon, 08 May 2023 22:53:26 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Wolfram Sang <wsa@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 58/89] i2c: rcar: Convert to platform remove callback returning void
Date:   Mon,  8 May 2023 22:52:35 +0200
Message-Id: <20230508205306.1474415-59-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1720; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=bmgoNNe5zmJCofhHgD9MOCbkcF7dFHRPLnhfSSAKVy8=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkWWD3GhuMyR18bi7L1yxsKdLS8YIra5dbqtdJS 1gks2wax9mJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFlg9wAKCRCPgPtYfRL+ Thp9CACTiaOXibGOPL73UrSvRSeMMWjlUoYjNkGcE0XAeH3ykR8W3/1J+70W402V3BYw0p8+bIs jt+7F9r+c44+uSuNXZPU810uJSU0fltZ3dZqeIGzKuERfyGhxLqrjTW7hVwS9VV8rbJVYK9+Eqz Byc+yTt31qoze7Mg8QHPNzfTFBoja+xl74UPzJl0N4AhzGYr+++DpDzbJCrNW2SuBFnn+56fx9v jcbG+ltOXq6OTZRMo4AC4y9l31t0OdZmxZrh7gzjZFJAaTabBdebW3zz5TGPLBmvOGd40KyRa/a jLKfI5xZVympTDyPCpWNfi4FL6C7FrKAZfho9lgxNBE85CTs
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
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
 drivers/i2c/busses/i2c-rcar.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index cef82b205c26..2d9c37410ebd 100644
--- a/drivers/i2c/busses/i2c-rcar.c
+++ b/drivers/i2c/busses/i2c-rcar.c
@@ -1155,7 +1155,7 @@ static int rcar_i2c_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int rcar_i2c_remove(struct platform_device *pdev)
+static void rcar_i2c_remove(struct platform_device *pdev)
 {
 	struct rcar_i2c_priv *priv = platform_get_drvdata(pdev);
 	struct device *dev = &pdev->dev;
@@ -1167,8 +1167,6 @@ static int rcar_i2c_remove(struct platform_device *pdev)
 	if (priv->flags & ID_P_PM_BLOCKED)
 		pm_runtime_put(dev);
 	pm_runtime_disable(dev);
-
-	return 0;
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -1204,7 +1202,7 @@ static struct platform_driver rcar_i2c_driver = {
 		.pm	= DEV_PM_OPS,
 	},
 	.probe		= rcar_i2c_probe,
-	.remove		= rcar_i2c_remove,
+	.remove_new	= rcar_i2c_remove,
 };
 
 module_platform_driver(rcar_i2c_driver);
-- 
2.39.2

