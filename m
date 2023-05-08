Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 000AF6FB8A0
	for <lists+linux-i2c@lfdr.de>; Mon,  8 May 2023 22:53:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233774AbjEHUxd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 May 2023 16:53:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233434AbjEHUxY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 May 2023 16:53:24 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8466B6A45
        for <linux-i2c@vger.kernel.org>; Mon,  8 May 2023 13:53:23 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rE-0003MQ-2g; Mon, 08 May 2023 22:53:20 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rC-0024rE-Ai; Mon, 08 May 2023 22:53:18 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rB-002YWX-DM; Mon, 08 May 2023 22:53:17 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 28/89] i2c: img-scb: Convert to platform remove callback returning void
Date:   Mon,  8 May 2023 22:52:05 +0200
Message-Id: <20230508205306.1474415-29-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1753; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=Luvlsres80hwngz6BpZxozdmj1HqL0mCBj6Ay0eb/KY=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkWWCmRZzelE0MAkac40vk5HyhM6Qh3HOrAlIE4 siV+AZIJGiJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFlgpgAKCRCPgPtYfRL+ TnVbB/0VIWoEPSNqu5bEu2WdoVTtN4uxE/bzUTD2fa6Zd3SQ6NCwXORJQTGXj5lKjHaU1FmCCj5 zkyG2Y5QH2GPL+H04iq8zLOgpNVs3/dRzH3zs0UpGOEkGz1Soi1Fyg+P25lHN6muVtkREo7GExb RCnqd4zsne8bHGPLZLjBkARkLdiaWu/WtFcQdu5YZMRH6uOrupW/RxkSRIXxoOFi8l3ZrBo7uYe nJkT7yGxn0A3LHaLi2Un3mbWbM4nYmMP7qcFuP3AIGylz3p+Jtj00Z8To2zuzkrOKKpvX+/Fnfg LMcBsuoDaLIYYefMrjK0Qyc8e1lTjUgstSS3x8K6ZmO992HE
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
 drivers/i2c/busses/i2c-img-scb.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-img-scb.c b/drivers/i2c/busses/i2c-img-scb.c
index 8e987945ed45..fea2940dbf2e 100644
--- a/drivers/i2c/busses/i2c-img-scb.c
+++ b/drivers/i2c/busses/i2c-img-scb.c
@@ -1413,7 +1413,7 @@ static int img_i2c_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int img_i2c_remove(struct platform_device *dev)
+static void img_i2c_remove(struct platform_device *dev)
 {
 	struct img_i2c *i2c = platform_get_drvdata(dev);
 
@@ -1421,8 +1421,6 @@ static int img_i2c_remove(struct platform_device *dev)
 	pm_runtime_disable(&dev->dev);
 	if (!pm_runtime_status_suspended(&dev->dev))
 		img_i2c_runtime_suspend(&dev->dev);
-
-	return 0;
 }
 
 static int img_i2c_runtime_suspend(struct device *dev)
@@ -1506,7 +1504,7 @@ static struct platform_driver img_scb_i2c_driver = {
 		.pm		= &img_i2c_pm,
 	},
 	.probe = img_i2c_probe,
-	.remove = img_i2c_remove,
+	.remove_new = img_i2c_remove,
 };
 module_platform_driver(img_scb_i2c_driver);
 
-- 
2.39.2

