Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6998A6FB8DF
	for <lists+linux-i2c@lfdr.de>; Mon,  8 May 2023 22:54:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233881AbjEHUyI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 May 2023 16:54:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233850AbjEHUxx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 May 2023 16:53:53 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 896A87AB1
        for <linux-i2c@vger.kernel.org>; Mon,  8 May 2023 13:53:39 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rN-0003va-QK; Mon, 08 May 2023 22:53:29 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rN-0024u7-3K; Mon, 08 May 2023 22:53:29 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rL-002YYk-ID; Mon, 08 May 2023 22:53:27 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Wolfram Sang <wsa@kernel.org>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 62/89] i2c: s3c2410: Convert to platform remove callback returning void
Date:   Mon,  8 May 2023 22:52:39 +0200
Message-Id: <20230508205306.1474415-63-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1758; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=Gw7MoJ9VuAV9qeVw2B1RjMs6wP3+7E0TlyQr5loYb4M=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkWWD8i+Yvmm+ZvrFZTHgSZMYP3DKihBnTPKXWK /WFQc+3et6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFlg/AAKCRCPgPtYfRL+ TsQDCACtHtdGD12ta+0gnzM7SQBoJscwqi8m6lFLIay57O2/RaQTnfYUh2oDnDWaJS0D1NgxURE ogF1PZNdktzUYLuueVCt7xQAeb4XXAhqIh5XnWp3eEI+EhVcUgXaeztiRt1K0PoPqk/LN4GAwyl JsnYcni6TWqGJahlffLlhtr6IjzI/oqo9QPSWUTGlVj1n6LGfwvAiKrrkHnHIy3acQb0O/2/sXC GwKfaTeJALtOXC19bya8UcfzMHnCY2t1Rfhr00mN1cIHRPX78/NwL85211Zhw/ZtXEwdgRASklC 3ciiYpko42clyMgR3Dm70h8ZthAuzPBP/4NlRWGrYYE3AcH4
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
 drivers/i2c/busses/i2c-s3c2410.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
index 45e9df81345a..28f0e5c64f32 100644
--- a/drivers/i2c/busses/i2c-s3c2410.c
+++ b/drivers/i2c/busses/i2c-s3c2410.c
@@ -1114,7 +1114,7 @@ static int s3c24xx_i2c_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int s3c24xx_i2c_remove(struct platform_device *pdev)
+static void s3c24xx_i2c_remove(struct platform_device *pdev)
 {
 	struct s3c24xx_i2c *i2c = platform_get_drvdata(pdev);
 
@@ -1123,8 +1123,6 @@ static int s3c24xx_i2c_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 
 	i2c_del_adapter(&i2c->adap);
-
-	return 0;
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -1172,7 +1170,7 @@ static const struct dev_pm_ops s3c24xx_i2c_dev_pm_ops = {
 
 static struct platform_driver s3c24xx_i2c_driver = {
 	.probe		= s3c24xx_i2c_probe,
-	.remove		= s3c24xx_i2c_remove,
+	.remove_new	= s3c24xx_i2c_remove,
 	.id_table	= s3c24xx_driver_ids,
 	.driver		= {
 		.name	= "s3c-i2c",
-- 
2.39.2

