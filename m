Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB0EC6FB888
	for <lists+linux-i2c@lfdr.de>; Mon,  8 May 2023 22:53:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232525AbjEHUxU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 May 2023 16:53:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229637AbjEHUxR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 May 2023 16:53:17 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0F7C59EB
        for <linux-i2c@vger.kernel.org>; Mon,  8 May 2023 13:53:15 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7r7-00030m-0m; Mon, 08 May 2023 22:53:13 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7r6-0024pZ-70; Mon, 08 May 2023 22:53:12 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7r4-002YV6-Fu; Mon, 08 May 2023 22:53:10 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Krzysztof Adamski <krzysztof.adamski@nokia.com>,
        Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 06/89] i2c: axxia: Convert to platform remove callback returning void
Date:   Mon,  8 May 2023 22:51:43 +0200
Message-Id: <20230508205306.1474415-7-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1673; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=2YVZpyNvupdR7XF6cn+y15IKkTV3GVE3r4hoD6Yxy5c=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkWWBLGpSxyCqlWwmtzQrvk2GPihQsHM1wBRKq3 NTvRnV5MwGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFlgSwAKCRCPgPtYfRL+ ThnbB/4rkl/T4IR20o6U7kUdopZQ5+c9D6fP+KZwsGHuqtnS56LuvHdIUXJu7U8yrxohOd3Q2Xa M4ELM272/x8rnMTkAUj686t/OShBZtOoP9e/2m153uVcUEkkLrCHiZ83Z67wEUPv7hjG+vKwz4v 5yVNmL5MQItio+HP5GWKKOiOI7bRI8jagbbz+PtqCHmE/59zBTT00+anDmneOJkv13H8exIhkoH 5OMz23l5Luq2Gqe38Egsu2XAqAKZQb/UgZYA81cV4v8vOdlya6BJSARJZ/lDOLLmGIWgcA2KBek XqxnEWfoTSqIH7AjvXC/Cq43sGpezKbwkGj879M5DKN9KcK4
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
 drivers/i2c/busses/i2c-axxia.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-axxia.c b/drivers/i2c/busses/i2c-axxia.c
index c1c74ce08407..d7f1e98777ac 100644
--- a/drivers/i2c/busses/i2c-axxia.c
+++ b/drivers/i2c/busses/i2c-axxia.c
@@ -804,14 +804,12 @@ static int axxia_i2c_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int axxia_i2c_remove(struct platform_device *pdev)
+static void axxia_i2c_remove(struct platform_device *pdev)
 {
 	struct axxia_i2c_dev *idev = platform_get_drvdata(pdev);
 
 	clk_disable_unprepare(idev->i2c_clk);
 	i2c_del_adapter(&idev->adapter);
-
-	return 0;
 }
 
 /* Match table for of_platform binding */
@@ -824,7 +822,7 @@ MODULE_DEVICE_TABLE(of, axxia_i2c_of_match);
 
 static struct platform_driver axxia_i2c_driver = {
 	.probe = axxia_i2c_probe,
-	.remove = axxia_i2c_remove,
+	.remove_new = axxia_i2c_remove,
 	.driver = {
 		.name = "axxia-i2c",
 		.of_match_table = axxia_i2c_of_match,
-- 
2.39.2

