Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 20BE66FB8E7
	for <lists+linux-i2c@lfdr.de>; Mon,  8 May 2023 22:54:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233802AbjEHUyS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 May 2023 16:54:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233821AbjEHUyB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 May 2023 16:54:01 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E19717ECC
        for <linux-i2c@vger.kernel.org>; Mon,  8 May 2023 13:53:46 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rJ-0003dV-U3; Mon, 08 May 2023 22:53:25 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rI-0024sm-Cr; Mon, 08 May 2023 22:53:24 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rH-002YXq-On; Mon, 08 May 2023 22:53:23 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Tony Lindgren <tony@atomide.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Vignesh R <vigneshr@ti.com>, Wolfram Sang <wsa@kernel.org>
Cc:     linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 48/89] i2c: omap: Convert to platform remove callback returning void
Date:   Mon,  8 May 2023 22:52:25 +0200
Message-Id: <20230508205306.1474415-49-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1803; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=HT9RsMEk+dsNr8azjJvxQT94dcaTxrVoo5ujJ2/TOKo=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkWWDmjDD2eT+oaDHqou/O9o1h0a5dOuTo8t8k6 bAz3hrO7zeJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFlg5gAKCRCPgPtYfRL+ TgPZCACl1OwDtWQQEQqvSaXSvwkEvMS50nO3XJEkM136MH9Gby9OW6mdu0s7/O4ypTJi5bvuTn5 B840u8OoUzpgtUV45c9aRn0Nn3A9T64Bs643aavD+m8k/+4sbNmed2KnlY1jL4wSjbrWJKomy1z a3/POi/1atC3xgFeXlIIdXjToPjeqOsBk4wAL0hmrMkrGvLfyx1XFmF8gRs335TJa3tcgsu88Bu /nXL0NFppazfHVkiM7+GjYBYnqOhFmlhjltMJOW0iZkBK73/X/FNMcgSYoDqKGswSym+IvNqPLb KbvlWRcX60L7mumNs+Y6g6XeJvu4Nanyf9g3D1ebXQSm3ax0
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
 drivers/i2c/busses/i2c-omap.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-omap.c b/drivers/i2c/busses/i2c-omap.c
index 4199f57a6bf2..58fd6fa3edf1 100644
--- a/drivers/i2c/busses/i2c-omap.c
+++ b/drivers/i2c/busses/i2c-omap.c
@@ -1519,7 +1519,7 @@ omap_i2c_probe(struct platform_device *pdev)
 	return r;
 }
 
-static int omap_i2c_remove(struct platform_device *pdev)
+static void omap_i2c_remove(struct platform_device *pdev)
 {
 	struct omap_i2c_dev	*omap = platform_get_drvdata(pdev);
 	int ret;
@@ -1535,8 +1535,6 @@ static int omap_i2c_remove(struct platform_device *pdev)
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	pm_runtime_put_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
-
-	return 0;
 }
 
 static int __maybe_unused omap_i2c_runtime_suspend(struct device *dev)
@@ -1588,7 +1586,7 @@ static const struct dev_pm_ops omap_i2c_pm_ops = {
 
 static struct platform_driver omap_i2c_driver = {
 	.probe		= omap_i2c_probe,
-	.remove		= omap_i2c_remove,
+	.remove_new	= omap_i2c_remove,
 	.driver		= {
 		.name	= "omap_i2c",
 		.pm	= &omap_i2c_pm_ops,
-- 
2.39.2

