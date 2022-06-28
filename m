Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 307EE55E7A0
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Jun 2022 18:33:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347329AbiF1OD2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 Jun 2022 10:03:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347334AbiF1OD1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 28 Jun 2022 10:03:27 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F12E22E09A
        for <linux-i2c@vger.kernel.org>; Tue, 28 Jun 2022 07:03:23 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1o6BoH-0008Ko-3A; Tue, 28 Jun 2022 16:03:21 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1o6BoC-003DTA-RZ; Tue, 28 Jun 2022 16:03:20 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1o6BoE-001gzK-Q5; Tue, 28 Jun 2022 16:03:18 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Pavel Machek <pavel@ucw.cz>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-leds@vger.kernel.org, kernel@pengutronix.de,
        linux-i2c@vger.kernel.org
Subject: [PATCH 4/6] leds: lm3601x: Improve error reporting for problems during .remove()
Date:   Tue, 28 Jun 2022 16:03:10 +0200
Message-Id: <20220628140313.74984-5-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220628140313.74984-1-u.kleine-koenig@pengutronix.de>
References: <20220628140313.74984-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1541; h=from:subject; bh=KYZrnMIsHWPEQ0VMi38pLX+3N1MFh5aofr4bwRSMKj8=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBiuwoQedus2oXqZ4lI1Y7ykicmNsI6/10UBQjPhQof kzxCC1qJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYrsKEAAKCRDB/BR4rcrsCbcaB/ 45l952SnWhWwVGYrGXrGIq2ENWvFSEXwsGGIXxflWkNC6ZcUKnh+l9powkiWgrSTHVCA0TNemxsKzE V4lQyZYwo/Chp+nZxT46S/7NSOO22lgTfVI+ssVDQdXZkKuRn0XwJV1FXahhhzSlAzv4yK3/juoGy0 9zU6mve+I2dD4pr5qavC2P9dDMNWoJN1l/4oBzm17p5dC7j20LC7JN70RaNnqut5RSHNcpVF5J3IBJ eeAJWCQf15BilBfwAiya8f04SDeYfmk6yybww2ermpHzsQPYceTZdUZYOrXArjF63q89uzMVa96M18 /F7pA2Ak8HF7TBvjhkhHo+xCUF9WV+
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

Returning an error value in an i2c remove callback results in a generic
error message being emitted by the i2c core, but otherwise it doesn't
make a difference. The device goes away anyhow and the devm cleanups are
called.

So instead of triggering the generic i2c error message, emit a more
helpful message if a problem occurs and return 0 to suppress the generic
message.

This patch is a preparation for making i2c remove callbacks return void.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
Forwarded: id:20220513102516.271920-1-u.kleine-koenig@pengutronix.de
---
 drivers/leds/flash/leds-lm3601x.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/flash/leds-lm3601x.c b/drivers/leds/flash/leds-lm3601x.c
index 3d1272748201..37e1d6e68687 100644
--- a/drivers/leds/flash/leds-lm3601x.c
+++ b/drivers/leds/flash/leds-lm3601x.c
@@ -443,10 +443,15 @@ static int lm3601x_probe(struct i2c_client *client)
 static int lm3601x_remove(struct i2c_client *client)
 {
 	struct lm3601x_led *led = i2c_get_clientdata(client);
+	int ret;
 
-	return regmap_update_bits(led->regmap, LM3601X_ENABLE_REG,
-			   LM3601X_ENABLE_MASK,
-			   LM3601X_MODE_STANDBY);
+	ret = regmap_update_bits(led->regmap, LM3601X_ENABLE_REG,
+				 LM3601X_ENABLE_MASK, LM3601X_MODE_STANDBY);
+	if (ret)
+		dev_warn(&client->dev,
+			 "Failed to put into standby (%pe)\n", ERR_PTR(ret));
+
+	return 0;
 }
 
 static const struct i2c_device_id lm3601x_id[] = {
-- 
2.36.1

