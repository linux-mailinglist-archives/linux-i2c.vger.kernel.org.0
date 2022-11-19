Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB04D630539
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Nov 2022 00:52:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233526AbiKRXwi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Nov 2022 18:52:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236961AbiKRXvr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 18 Nov 2022 18:51:47 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62125BAE8B
        for <linux-i2c@vger.kernel.org>; Fri, 18 Nov 2022 15:27:15 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1owA8I-0001HR-7A; Fri, 18 Nov 2022 23:46:50 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1owA8E-0058Lm-9s; Fri, 18 Nov 2022 23:46:47 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1owA8E-00Hb6Q-JQ; Fri, 18 Nov 2022 23:46:46 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
To:     Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>,
        Jeremy Kerr <jk@codeconstruct.com.au>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 178/606] iio: pressure: zpa2326_i2c: Convert to i2c's .probe_new()
Date:   Fri, 18 Nov 2022 23:38:32 +0100
Message-Id: <20221118224540.619276-179-uwe@kleine-koenig.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221118224540.619276-1-uwe@kleine-koenig.org>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

.probe_new() doesn't get the i2c_device_id * parameter, so determine
that explicitly in the probe function.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/iio/pressure/zpa2326_i2c.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/pressure/zpa2326_i2c.c b/drivers/iio/pressure/zpa2326_i2c.c
index f26dd8cbb387..ade465014be1 100644
--- a/drivers/iio/pressure/zpa2326_i2c.c
+++ b/drivers/iio/pressure/zpa2326_i2c.c
@@ -38,9 +38,9 @@ static unsigned int zpa2326_i2c_hwid(const struct i2c_client *client)
 		(ZPA2326_SA0(client->addr) << ZPA2326_DEVICE_ID_SA0_SHIFT));
 }
 
-static int zpa2326_probe_i2c(struct i2c_client          *client,
-			     const struct i2c_device_id *i2c_id)
+static int zpa2326_probe_i2c(struct i2c_client          *client)
 {
+	const struct i2c_device_id *i2c_id = i2c_client_get_device_id(client);
 	struct regmap *regmap;
 
 	regmap = devm_regmap_init_i2c(client, &zpa2326_regmap_i2c_config);
@@ -76,7 +76,7 @@ static struct i2c_driver zpa2326_i2c_driver = {
 		.of_match_table = zpa2326_i2c_matches,
 		.pm             = ZPA2326_PM_OPS,
 	},
-	.probe    = zpa2326_probe_i2c,
+	.probe_new = zpa2326_probe_i2c,
 	.remove   = zpa2326_remove_i2c,
 	.id_table = zpa2326_i2c_ids,
 };
-- 
2.38.1

