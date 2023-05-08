Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28B116FB8E4
	for <lists+linux-i2c@lfdr.de>; Mon,  8 May 2023 22:54:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233452AbjEHUyQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 May 2023 16:54:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233780AbjEHUyA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 May 2023 16:54:00 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC9C97AAE
        for <linux-i2c@vger.kernel.org>; Mon,  8 May 2023 13:53:45 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rU-0004HI-9t; Mon, 08 May 2023 22:53:36 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rS-0024vr-Om; Mon, 08 May 2023 22:53:34 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rR-002YaF-Tz; Mon, 08 May 2023 22:53:33 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Peter Korsgaard <peter.korsgaard@barco.com>,
        Peter Rosin <peda@axentia.se>, Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 85/89] i2c: mux: gpio: Convert to platform remove callback returning void
Date:   Mon,  8 May 2023 22:53:02 +0200
Message-Id: <20230508205306.1474415-86-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1719; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=uMWN2S8FXYR2hFwmtODejyj4ZHVPXPq5XB3yP4sG8+A=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkWWEWVsZ0F6qPqlqe7Gv6Q672mQGleDe55WQdz 3B/rffj66iJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFlhFgAKCRCPgPtYfRL+ TrvbB/4/um1x313D7SiRoEipB6T07suoABYGDOXNE2lU8BV/iSWr24PUxDycVsM0/cjv6XlXPbw +yB56zjZ7EzX1HaEFFp16c7VnC/TRfTgeerQbfNSBNh7zxIBsIoFV61evXndKwklEscQKTRkD0X 64Oc93qcuAiTMA4lwXDAUQDooLCYU9ZAQuKgt83R3/p7Ess2zvCFT5DjfaKZrKVYPae5jgS9sxJ qMyGKDjCw+hjVoSpnb+3pWS9/wmNXziwCYrq3gaQlDFsstvYVxjIAcKv2IUKs0xOSBFabaxvFUB 6tvpCvrbZZCkDTxwSxXyCK2F1skxx0QlzbqsntivmbzzA9Yv
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
 drivers/i2c/muxes/i2c-mux-gpio.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/muxes/i2c-mux-gpio.c b/drivers/i2c/muxes/i2c-mux-gpio.c
index 73a23e117ebe..5d5cbe0130cd 100644
--- a/drivers/i2c/muxes/i2c-mux-gpio.c
+++ b/drivers/i2c/muxes/i2c-mux-gpio.c
@@ -225,14 +225,12 @@ static int i2c_mux_gpio_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int i2c_mux_gpio_remove(struct platform_device *pdev)
+static void i2c_mux_gpio_remove(struct platform_device *pdev)
 {
 	struct i2c_mux_core *muxc = platform_get_drvdata(pdev);
 
 	i2c_mux_del_adapters(muxc);
 	i2c_put_adapter(muxc->parent);
-
-	return 0;
 }
 
 static const struct of_device_id i2c_mux_gpio_of_match[] = {
@@ -243,7 +241,7 @@ MODULE_DEVICE_TABLE(of, i2c_mux_gpio_of_match);
 
 static struct platform_driver i2c_mux_gpio_driver = {
 	.probe	= i2c_mux_gpio_probe,
-	.remove	= i2c_mux_gpio_remove,
+	.remove_new = i2c_mux_gpio_remove,
 	.driver	= {
 		.name	= "i2c-mux-gpio",
 		.of_match_table = i2c_mux_gpio_of_match,
-- 
2.39.2

