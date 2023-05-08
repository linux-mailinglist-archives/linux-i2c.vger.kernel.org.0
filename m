Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DEC526FB8D0
	for <lists+linux-i2c@lfdr.de>; Mon,  8 May 2023 22:54:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233792AbjEHUyB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 May 2023 16:54:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233361AbjEHUxp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 May 2023 16:53:45 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58D747EE6
        for <linux-i2c@vger.kernel.org>; Mon,  8 May 2023 13:53:36 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rM-0003u4-HF; Mon, 08 May 2023 22:53:28 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rL-0024tn-QY; Mon, 08 May 2023 22:53:27 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rL-002YYb-3R; Mon, 08 May 2023 22:53:27 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Heiko Stuebner <heiko@sntech.de>, Wolfram Sang <wsa@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-i2c@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 60/89] i2c: rk3x: Convert to platform remove callback returning void
Date:   Mon,  8 May 2023 22:52:37 +0200
Message-Id: <20230508205306.1474415-61-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1732; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=AaGQFomoFiReIuYC1pvhE1kk8xeCgfnRJ003pYzGhgM=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkWWD5Blzh3tdEZ68Ch76V/oeJAIwfm2QSaUoF3 P3jfmJKhR2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFlg+QAKCRCPgPtYfRL+ TjSdB/4v3jPTc2dE7vKKlt4EWSbbgv80S8HhHvYgxRfjJThGDeoyEkYFNDzq2neYS2v6K9AUdHU 7lwc1jnSXwafNhdBALDwOdchW/Whv4zmFlbwdsUNcER0c1hW5dFNGfPrHN8jxYt43LxtSZ0OyH+ Ku9wP3hu6KGUA/ZX66B4g3VoTy7tWbXpTQnRS5Li0tr5oDuBvwb/BZX5ws9bIsX4J5jZwHfV015 r/5Pge2HgVS9ujCCd/jgGUbyxhFqGoEyP/axeYxEKhP8nq7cNaG/RjAMHnputqvJ8f2tGfsQ2js 9Ztin/AJdsZ7uZAzacYiZDDrLCgNY0PHHRKgE1wbdQdVNX7D
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
 drivers/i2c/busses/i2c-rk3x.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rk3x.c b/drivers/i2c/busses/i2c-rk3x.c
index b31cf4f18f85..a044ca0c35a1 100644
--- a/drivers/i2c/busses/i2c-rk3x.c
+++ b/drivers/i2c/busses/i2c-rk3x.c
@@ -1372,7 +1372,7 @@ static int rk3x_i2c_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int rk3x_i2c_remove(struct platform_device *pdev)
+static void rk3x_i2c_remove(struct platform_device *pdev)
 {
 	struct rk3x_i2c *i2c = platform_get_drvdata(pdev);
 
@@ -1381,15 +1381,13 @@ static int rk3x_i2c_remove(struct platform_device *pdev)
 	clk_notifier_unregister(i2c->clk, &i2c->clk_rate_nb);
 	clk_unprepare(i2c->pclk);
 	clk_unprepare(i2c->clk);
-
-	return 0;
 }
 
 static SIMPLE_DEV_PM_OPS(rk3x_i2c_pm_ops, NULL, rk3x_i2c_resume);
 
 static struct platform_driver rk3x_i2c_driver = {
 	.probe   = rk3x_i2c_probe,
-	.remove  = rk3x_i2c_remove,
+	.remove_new = rk3x_i2c_remove,
 	.driver  = {
 		.name  = "rk3x-i2c",
 		.of_match_table = rk3x_i2c_match,
-- 
2.39.2

