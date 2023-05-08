Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 277816FB8D4
	for <lists+linux-i2c@lfdr.de>; Mon,  8 May 2023 22:54:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233832AbjEHUyE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 May 2023 16:54:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233831AbjEHUxp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 May 2023 16:53:45 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 589A07EE4
        for <linux-i2c@vger.kernel.org>; Mon,  8 May 2023 13:53:35 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rR-00042b-79; Mon, 08 May 2023 22:53:33 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rQ-0024vH-FZ; Mon, 08 May 2023 22:53:32 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rP-002YZn-R5; Mon, 08 May 2023 22:53:31 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 78/89] i2c: viperboard: Convert to platform remove callback returning void
Date:   Mon,  8 May 2023 22:52:55 +0200
Message-Id: <20230508205306.1474415-79-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1584; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=N8lAprPeTW/sGBhyDtBln4dYnqFUhqXs3Ov4UIwC+hc=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkWWEOW8b0iedfcqa9N8IgpEPzx+zWdsKB2xlvR anwYc1XOAWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFlhDgAKCRCPgPtYfRL+ TpKKCACh4wgxdlmigfZfz/fsacBAqDkKhQgUurNLNym5Zett3oKVQVBvkgiYIMZPefaD7Fv6QbD aHHs/FH/bA4z+V+aBNV2W519Jby7c9O57CxyhAQK4Or0xjPooCQp5CWh3/Xib4Ij2Lj9nlnIzkt N+bGWe832lGp29dBXMNeX7j8gwZQgGvPYo8OezW6WN2Ah2CbC9kh5b7wZrzumH612pUzILY41et T6sc9eb/H5tZfwXzhNpr13WHdsWPsUwrCC2+ECLLTSKkg1yr3zYX6+mO4IUMEEUp0YYVfxZE+uZ +kiRcrmL6hjBKYnEychAaqT+KINLh6eJYO1NDcF5VjSp/TVq
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
 drivers/i2c/busses/i2c-viperboard.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-viperboard.c b/drivers/i2c/busses/i2c-viperboard.c
index 8b5322c3bce0..9e153b5b0e8e 100644
--- a/drivers/i2c/busses/i2c-viperboard.c
+++ b/drivers/i2c/busses/i2c-viperboard.c
@@ -407,20 +407,18 @@ static int vprbrd_i2c_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int vprbrd_i2c_remove(struct platform_device *pdev)
+static void vprbrd_i2c_remove(struct platform_device *pdev)
 {
 	struct vprbrd_i2c *vb_i2c = platform_get_drvdata(pdev);
 
 	i2c_del_adapter(&vb_i2c->i2c);
-
-	return 0;
 }
 
 static struct platform_driver vprbrd_i2c_driver = {
 	.driver.name	= "viperboard-i2c",
 	.driver.owner	= THIS_MODULE,
 	.probe		= vprbrd_i2c_probe,
-	.remove		= vprbrd_i2c_remove,
+	.remove_new	= vprbrd_i2c_remove,
 };
 
 static int __init vprbrd_i2c_init(void)
-- 
2.39.2

