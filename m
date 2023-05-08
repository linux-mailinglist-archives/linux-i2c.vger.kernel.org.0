Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0CCC6FB8A2
	for <lists+linux-i2c@lfdr.de>; Mon,  8 May 2023 22:53:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233714AbjEHUxf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 May 2023 16:53:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233333AbjEHUxZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 May 2023 16:53:25 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A4B76A49
        for <linux-i2c@vger.kernel.org>; Mon,  8 May 2023 13:53:23 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rE-0003RF-Qm; Mon, 08 May 2023 22:53:20 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rD-0024rR-6l; Mon, 08 May 2023 22:53:19 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rC-002YWi-D0; Mon, 08 May 2023 22:53:18 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 31/89] i2c: iop3xx: Convert to platform remove callback returning void
Date:   Mon,  8 May 2023 22:52:08 +0200
Message-Id: <20230508205306.1474415-32-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1715; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=5I0aVmbR9X8tYHNulG+zXICrXAqPnroe2TDHMP8nTPs=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkWWC5mFc3lfDyuZcgZ4AUi6l0nYr1SzP++kpV5 r7wg+5j9eiJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFlguQAKCRCPgPtYfRL+ ToaoB/9r2+tkXnYXncVY9AlUD7mWjAn2Ywoci7xNodfyHXiT5DVXc72ks2d7CcZGDp071l/fjdF pf1HiYYQOXhfN24rdq3jMafdBLx4m4bPu4/uXj4EmMW6JIrksLfVWJSoVSfYb6kfmlbGHufdn8o dft72UbPSkFuo16OrVSDLXO23AN0Bb8JGvPVBwv4jnwTwPcCoMbek0iApCWe8jdN6QGo0RCGx/v E/ejrVcwQHlGva1/L++TkrBUVMC58dflAoBH90R8o7qJuHeD9ML6wP+5gTEnjs9E9peTHAT/Gag P0i4qLSAPLWGsy2Qa/70ABmbCa4Lh+6mJFb/ZrIpuo1WoXnu
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
 drivers/i2c/busses/i2c-iop3xx.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-iop3xx.c b/drivers/i2c/busses/i2c-iop3xx.c
index 4a6ff54d87fe..f2f7ebeeaecb 100644
--- a/drivers/i2c/busses/i2c-iop3xx.c
+++ b/drivers/i2c/busses/i2c-iop3xx.c
@@ -388,7 +388,7 @@ static const struct i2c_algorithm iop3xx_i2c_algo = {
 	.functionality	= iop3xx_i2c_func,
 };
 
-static int
+static void
 iop3xx_i2c_remove(struct platform_device *pdev)
 {
 	struct i2c_adapter *padapter = platform_get_drvdata(pdev);
@@ -408,8 +408,6 @@ iop3xx_i2c_remove(struct platform_device *pdev)
 	release_mem_region(res->start, IOP3XX_I2C_IO_SIZE);
 	kfree(adapter_data);
 	kfree(padapter);
-
-	return 0;
 }
 
 static int
@@ -529,7 +527,7 @@ MODULE_DEVICE_TABLE(of, i2c_iop3xx_match);
 
 static struct platform_driver iop3xx_i2c_driver = {
 	.probe		= iop3xx_i2c_probe,
-	.remove		= iop3xx_i2c_remove,
+	.remove_new	= iop3xx_i2c_remove,
 	.driver		= {
 		.name	= "IOP3xx-I2C",
 		.of_match_table = i2c_iop3xx_match,
-- 
2.39.2

