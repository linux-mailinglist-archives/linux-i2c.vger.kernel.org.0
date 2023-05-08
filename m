Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B3966FB890
	for <lists+linux-i2c@lfdr.de>; Mon,  8 May 2023 22:53:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232527AbjEHUxY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 May 2023 16:53:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229637AbjEHUxU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 May 2023 16:53:20 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A0AE5FDB
        for <linux-i2c@vger.kernel.org>; Mon,  8 May 2023 13:53:20 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rA-0003A8-V8; Mon, 08 May 2023 22:53:17 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rA-0024qp-8r; Mon, 08 May 2023 22:53:16 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7r9-002YWD-KL; Mon, 08 May 2023 22:53:15 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 23/89] i2c: gpio: Convert to platform remove callback returning void
Date:   Mon,  8 May 2023 22:52:00 +0200
Message-Id: <20230508205306.1474415-24-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1697; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=5gx1kGs0cESEpw/mNF1QYNXMsaYQc2ZOiBT03TQzQo8=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkWWCRunh9YWocDgAZktXQbB7ec9yigM+kJHRcK Glerwgqm8iJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFlgkQAKCRCPgPtYfRL+ To/1B/95ns1XlT1RcNJtX0ABqiHTRopPMxRqhl64EiZWfnW6peODKvQg3zaRrTteo0VWHXnvN9h ybCLQY5Qd3XQ3rm73oTsO0sJ2t3A2LCqD2ysTfBf+LuvKVDLvmAfYkq9eWD2HgPVkrORLRLvX2l di1aoRjIuW3IAUzCwG9DyMACljMuFbnuCpCZ2PGF/NeybkF93EFfabKq/3Aryvsj4Zno/0icXyL sLzyNoZkkAveGgnE9kMpFzxxGYmd/6C4YaMg6qmzxPIPWIS/52TeFn8a2bi1AZFP996MENXs8Fx jnFjMbv2KZkSk807BgasRB3IyDYiYAS1QNQLegW5NaHJsreb
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
 drivers/i2c/busses/i2c-gpio.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-gpio.c b/drivers/i2c/busses/i2c-gpio.c
index 1794c0399f22..e5a5b9e8bf2c 100644
--- a/drivers/i2c/busses/i2c-gpio.c
+++ b/drivers/i2c/busses/i2c-gpio.c
@@ -475,7 +475,7 @@ static int i2c_gpio_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int i2c_gpio_remove(struct platform_device *pdev)
+static void i2c_gpio_remove(struct platform_device *pdev)
 {
 	struct i2c_gpio_private_data *priv;
 	struct i2c_adapter *adap;
@@ -486,8 +486,6 @@ static int i2c_gpio_remove(struct platform_device *pdev)
 	adap = &priv->adap;
 
 	i2c_del_adapter(adap);
-
-	return 0;
 }
 
 static const struct of_device_id i2c_gpio_dt_ids[] = {
@@ -510,7 +508,7 @@ static struct platform_driver i2c_gpio_driver = {
 		.acpi_match_table = i2c_gpio_acpi_match,
 	},
 	.probe		= i2c_gpio_probe,
-	.remove		= i2c_gpio_remove,
+	.remove_new	= i2c_gpio_remove,
 };
 
 static int __init i2c_gpio_init(void)
-- 
2.39.2

