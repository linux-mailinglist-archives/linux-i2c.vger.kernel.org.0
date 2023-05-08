Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 104696FB8AF
	for <lists+linux-i2c@lfdr.de>; Mon,  8 May 2023 22:53:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229486AbjEHUxl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 May 2023 16:53:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233401AbjEHUx3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 May 2023 16:53:29 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6774A6A67
        for <linux-i2c@vger.kernel.org>; Mon,  8 May 2023 13:53:27 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rG-0003VH-6F; Mon, 08 May 2023 22:53:22 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rE-0024rl-Fs; Mon, 08 May 2023 22:53:20 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rD-002YWz-Fu; Mon, 08 May 2023 22:53:19 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Vladimir Zapolskiy <vz@mleia.com>, Wolfram Sang <wsa@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 35/89] i2c: lpc2k: Convert to platform remove callback returning void
Date:   Mon,  8 May 2023 22:52:12 +0200
Message-Id: <20230508205306.1474415-36-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1620; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=JZf0vyL1lu1gqSZJWQP5Hx/RC+xxgV1FcNqB1ytmrAQ=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkWWDNmC4xZrGlFETgDOfndgb6nDkRdnVl+3Pxq lQdq+c3GaqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFlgzQAKCRCPgPtYfRL+ ToQdB/0aipAA31hJN04mJsZQ/Rp8QNVMW7rakZ2I7UoXeiISYN0LIo3yxydZBHYTOE2MHm7mcg+ rGs9BAs0hdYAMbILS9Z0TVjRGNUuqLIRl/RqoG4vskZsAIlVq0AGZbnWc1xEYf/aLkIUqKMJ2l9 wkg8s3BcL/9iRrVVir04FXyFzEb8dBuys6yw/fOBWjyV3QQO4XR17SjFQe4IjspPgKxPSFyht/v Hnf6Jb0J5goKalk9sSNDTW6p1ZJ8UfVi7QkutWg6+q8g5qQ6DWGSkmsOXUb3vXGKK5Zey8tgD3m /456Mm4GBVHh+M8grVNdPnns4bfhIBpnZHYg+wuKuNGVzgsg
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
 drivers/i2c/busses/i2c-lpc2k.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-lpc2k.c b/drivers/i2c/busses/i2c-lpc2k.c
index 8fff6fbb7065..469fe907723e 100644
--- a/drivers/i2c/busses/i2c-lpc2k.c
+++ b/drivers/i2c/busses/i2c-lpc2k.c
@@ -435,14 +435,12 @@ static int i2c_lpc2k_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int i2c_lpc2k_remove(struct platform_device *dev)
+static void i2c_lpc2k_remove(struct platform_device *dev)
 {
 	struct lpc2k_i2c *i2c = platform_get_drvdata(dev);
 
 	i2c_del_adapter(&i2c->adap);
 	clk_disable_unprepare(i2c->clk);
-
-	return 0;
 }
 
 #ifdef CONFIG_PM
@@ -483,7 +481,7 @@ MODULE_DEVICE_TABLE(of, lpc2k_i2c_match);
 
 static struct platform_driver i2c_lpc2k_driver = {
 	.probe	= i2c_lpc2k_probe,
-	.remove	= i2c_lpc2k_remove,
+	.remove_new = i2c_lpc2k_remove,
 	.driver	= {
 		.name		= "lpc2k-i2c",
 		.pm		= I2C_LPC2K_DEV_PM_OPS,
-- 
2.39.2

