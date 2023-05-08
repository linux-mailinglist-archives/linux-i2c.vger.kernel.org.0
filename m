Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0D076FB899
	for <lists+linux-i2c@lfdr.de>; Mon,  8 May 2023 22:53:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229986AbjEHUxb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 May 2023 16:53:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233353AbjEHUxY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 May 2023 16:53:24 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A59326598
        for <linux-i2c@vger.kernel.org>; Mon,  8 May 2023 13:53:22 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7r9-00036C-8E; Mon, 08 May 2023 22:53:15 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7r8-0024qJ-JC; Mon, 08 May 2023 22:53:14 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7r7-002YVo-Q5; Mon, 08 May 2023 22:53:13 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Bartosz Golaszewski <brgl@bgdev.pl>, Wolfram Sang <wsa@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 17/89] i2c: davinci: Convert to platform remove callback returning void
Date:   Mon,  8 May 2023 22:51:54 +0200
Message-Id: <20230508205306.1474415-18-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1781; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=HU2G45ZXDhhof9bFt0xdJHBRNfkFb9BKDwjqInhEoYU=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkWWBs/7xjZZb9p6Le4yvFg/2aT2s32p69SdReL ppq0oesVDeJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFlgbAAKCRCPgPtYfRL+ TkC1CACZPJP5mmoYrMw68oXygpioFTnteDfM+jgiC1MzJnX5qsaax0QLnyOMiVEzFpPpCHDkd88 YP1X8USGtX0+raSd67QMqAfCk1HURC6cRlO790SOq8MWxfO+f6VZbzmg1rpOPgEvFWTvt8AAQRF fTIbq994GnbHXxQBeQIL9fsYNteak/R0/VvgqJ+VUkm8iov1ZBHIvKJESz5Bdt7eU1mVuF9aipt N9o0928MRpbBcM31TuOk6ZwJ4L5wQ/37WZBbDcH0Z2OtmigKV/frJum2dziCeb7ZqNKX9x5brWq uPUq2AkeV/2uKIZCJPgWepf72qyf5ky8PrjnIJAgHD4vuqzr
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
 drivers/i2c/busses/i2c-davinci.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-davinci.c b/drivers/i2c/busses/i2c-davinci.c
index 7ba7e6cbcc97..b77f9288c0de 100644
--- a/drivers/i2c/busses/i2c-davinci.c
+++ b/drivers/i2c/busses/i2c-davinci.c
@@ -885,7 +885,7 @@ static int davinci_i2c_probe(struct platform_device *pdev)
 	return r;
 }
 
-static int davinci_i2c_remove(struct platform_device *pdev)
+static void davinci_i2c_remove(struct platform_device *pdev)
 {
 	struct davinci_i2c_dev *dev = platform_get_drvdata(pdev);
 	int ret;
@@ -903,8 +903,6 @@ static int davinci_i2c_remove(struct platform_device *pdev)
 	pm_runtime_dont_use_autosuspend(dev->dev);
 	pm_runtime_put_sync(dev->dev);
 	pm_runtime_disable(dev->dev);
-
-	return 0;
 }
 
 #ifdef CONFIG_PM
@@ -945,7 +943,7 @@ MODULE_ALIAS("platform:i2c_davinci");
 
 static struct platform_driver davinci_i2c_driver = {
 	.probe		= davinci_i2c_probe,
-	.remove		= davinci_i2c_remove,
+	.remove_new	= davinci_i2c_remove,
 	.driver		= {
 		.name	= "i2c_davinci",
 		.pm	= davinci_i2c_pm_ops,
-- 
2.39.2

