Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A791E6FB8A7
	for <lists+linux-i2c@lfdr.de>; Mon,  8 May 2023 22:53:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233827AbjEHUxh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 May 2023 16:53:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233530AbjEHUx0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 May 2023 16:53:26 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7053B6A77
        for <linux-i2c@vger.kernel.org>; Mon,  8 May 2023 13:53:24 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rF-0003Rc-2d; Mon, 08 May 2023 22:53:21 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rD-0024rV-9j; Mon, 08 May 2023 22:53:19 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rC-002YWn-Lj; Mon, 08 May 2023 22:53:18 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Jean Delvare <jdelvare@suse.com>, Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 32/89] i2c: isch: Convert to platform remove callback returning void
Date:   Mon,  8 May 2023 22:52:09 +0200
Message-Id: <20230508205306.1474415-33-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1570; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=ucFH7lDWiSHONU9onZHxf/dKLtUpNSOmh8sre/Zl6uU=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkWWC/m6XJVP2VvBmQkRql097Z8csUAUKxEpRPb TLTbSGdfySJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFlgvwAKCRCPgPtYfRL+ Tv4HB/96nZNDUQtgOs68ghPgTGUYqxg+GxHGnRs/tqQ139LEKwBPiqgemLn5xVy6kJEVjxvJUbL 3lJ18ZCSkuBIcT64nw37P8bubsFT+H90tGDkb4bynbQ46uybFjBWEEbex3GnegRZQVlQHUfQi9S +FrEl9WqwaqkMUNqcpafYyNvwD/JW+aU2G4qENcg15kND+FFjv5Lqz6f1bq3uSVWX1XhlQLKdLl iTzCsnLgsrCPQyA6n+t1Tq20mifobZtJm3Nr6jvNU29qpRNlWoRwd5Xh0DHTwLgmYZS6UakuoCv FwAJHZ4TquwLcpKizGpUI8ieQRwn7w37BIOJoU34jrSGAbdj
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
 drivers/i2c/busses/i2c-isch.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-isch.c b/drivers/i2c/busses/i2c-isch.c
index 2dc7ada06ac5..1dc1ceaa4443 100644
--- a/drivers/i2c/busses/i2c-isch.c
+++ b/drivers/i2c/busses/i2c-isch.c
@@ -286,14 +286,12 @@ static int smbus_sch_probe(struct platform_device *dev)
 	return retval;
 }
 
-static int smbus_sch_remove(struct platform_device *pdev)
+static void smbus_sch_remove(struct platform_device *pdev)
 {
 	if (sch_smba) {
 		i2c_del_adapter(&sch_adapter);
 		sch_smba = 0;
 	}
-
-	return 0;
 }
 
 static struct platform_driver smbus_sch_driver = {
@@ -301,7 +299,7 @@ static struct platform_driver smbus_sch_driver = {
 		.name = "isch_smbus",
 	},
 	.probe		= smbus_sch_probe,
-	.remove		= smbus_sch_remove,
+	.remove_new	= smbus_sch_remove,
 };
 
 module_platform_driver(smbus_sch_driver);
-- 
2.39.2

