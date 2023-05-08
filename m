Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC30D6FB8AB
	for <lists+linux-i2c@lfdr.de>; Mon,  8 May 2023 22:53:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233798AbjEHUxj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 May 2023 16:53:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233588AbjEHUx0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 May 2023 16:53:26 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB8CC6598
        for <linux-i2c@vger.kernel.org>; Mon,  8 May 2023 13:53:24 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rB-00039y-BC; Mon, 08 May 2023 22:53:17 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7r9-0024qf-S3; Mon, 08 May 2023 22:53:15 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7r9-002YW9-Aa; Mon, 08 May 2023 22:53:15 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Wolfram Sang <wsa@kernel.org>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 22/89] i2c: exynos5: Convert to platform remove callback returning void
Date:   Mon,  8 May 2023 22:51:59 +0200
Message-Id: <20230508205306.1474415-23-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1750; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=ztLx+AlbW65d/ywo/DVEwKQHtnLEd1zXY5A1G+qBlLg=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkWWCLH4Eq3PEB0oyAr8szNjYm7Co8RJgmcWws1 3HwWMb4fwGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFlgiwAKCRCPgPtYfRL+ TiK2B/42C5AFB4cyjBFpnqYu7S/o5UNGLIAy/clAgFJotE4Ws47XeQsoGrxJ1H3ul0K4PNMv8ZN bSnyN4rtnqn2spXdkw2Z6vdTMlYq15tdHeSESPW6OEJrrth+eaN0F5M2RCf+ZGMZEX9ftyj5v2M Ur8HoMZd+D6m9mDQaK/TqTZu+9d5G68fVPsTDKy59HUUNrYxyH/RuZDjtuze3QaU4iZTxgB8aPi oTMiwR0twuN4uWVwF7dJw7ujyLyU3ig5p+oLsS8mTr6ukMPxpmwhUCBRrTE6h5UZ6rs8SRm7PsN rG7svWV01BYotOaFJvVM2eDP4bYAgUM5JZdoVtdPJiwyDwcj
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
 drivers/i2c/busses/i2c-exynos5.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-exynos5.c b/drivers/i2c/busses/i2c-exynos5.c
index 4a6260d04db2..f378cd479e55 100644
--- a/drivers/i2c/busses/i2c-exynos5.c
+++ b/drivers/i2c/busses/i2c-exynos5.c
@@ -882,7 +882,7 @@ static int exynos5_i2c_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int exynos5_i2c_remove(struct platform_device *pdev)
+static void exynos5_i2c_remove(struct platform_device *pdev)
 {
 	struct exynos5_i2c *i2c = platform_get_drvdata(pdev);
 
@@ -890,8 +890,6 @@ static int exynos5_i2c_remove(struct platform_device *pdev)
 
 	clk_unprepare(i2c->clk);
 	clk_unprepare(i2c->pclk);
-
-	return 0;
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -945,7 +943,7 @@ static const struct dev_pm_ops exynos5_i2c_dev_pm_ops = {
 
 static struct platform_driver exynos5_i2c_driver = {
 	.probe		= exynos5_i2c_probe,
-	.remove		= exynos5_i2c_remove,
+	.remove_new	= exynos5_i2c_remove,
 	.driver		= {
 		.name	= "exynos5-hsi2c",
 		.pm	= &exynos5_i2c_dev_pm_ops,
-- 
2.39.2

