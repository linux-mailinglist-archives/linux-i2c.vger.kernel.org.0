Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F23F6FB8E9
	for <lists+linux-i2c@lfdr.de>; Mon,  8 May 2023 22:54:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233811AbjEHUyU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 May 2023 16:54:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233813AbjEHUyB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 May 2023 16:54:01 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A88547693
        for <linux-i2c@vger.kernel.org>; Mon,  8 May 2023 13:53:46 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rS-00046R-F1; Mon, 08 May 2023 22:53:34 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rR-0024vY-Cf; Mon, 08 May 2023 22:53:33 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rQ-002YZz-ML; Mon, 08 May 2023 22:53:32 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Michal Simek <michal.simek@amd.com>, Wolfram Sang <wsa@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 81/89] i2c: xiic: Convert to platform remove callback returning void
Date:   Mon,  8 May 2023 22:52:58 +0200
Message-Id: <20230508205306.1474415-82-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1841; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=94a4K5zKxD8WSfsduf9U4KzJZaR/t1eF+I+F5YUNORQ=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkWWESCx/Q2G1QFf/dlDQLQwHI9FLA1+r/H9vts yQ0aQKDUTmJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFlhEgAKCRCPgPtYfRL+ Tp9RB/4/lYwLbNRkbuuoQ0Qeb4tNL7jlfQy28DVnrtxH91seEe8lFe73LboR+ksNDsFSM4hvvvj qJWDFJfwMIh5ZzmwZ/C2PoWUz0Vr4jw19SWzwmPfX0LgxQvnimia4IBY2IzLtvrNCFqnfcj5Nhs l3wayBwWrSwWHiGHLhJiHBv38QXRMLbUt1bHjHdMR5IZVqbOAGfSOeFk9ASTkl30zSPED+c7QrM S9htmj6ct9Yty/HpraRqbH+qdtaM/HLL5cwTIrW/LtxYMjj4F8cYkB9Xz8OUAhE8a3I8ImX/dcp 27bj8f3VaW/9L9oWEbyZJhjUBjLIxTAp3PdWg8vvxSzRrAcJ
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
 drivers/i2c/busses/i2c-xiic.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 8a3d9817cb41..61288f8dd067 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -1335,7 +1335,7 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int xiic_i2c_remove(struct platform_device *pdev)
+static void xiic_i2c_remove(struct platform_device *pdev)
 {
 	struct xiic_i2c *i2c = platform_get_drvdata(pdev);
 	int ret;
@@ -1356,8 +1356,6 @@ static int xiic_i2c_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 	pm_runtime_set_suspended(&pdev->dev);
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
-
-	return 0;
 }
 
 static int __maybe_unused xiic_i2c_runtime_suspend(struct device *dev)
@@ -1390,7 +1388,7 @@ static const struct dev_pm_ops xiic_dev_pm_ops = {
 
 static struct platform_driver xiic_i2c_driver = {
 	.probe   = xiic_i2c_probe,
-	.remove  = xiic_i2c_remove,
+	.remove_new = xiic_i2c_remove,
 	.driver  = {
 		.name = DRIVER_NAME,
 		.of_match_table = of_match_ptr(xiic_of_match),
-- 
2.39.2

