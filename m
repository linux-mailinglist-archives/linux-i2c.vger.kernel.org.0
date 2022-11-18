Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 526E0630601
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Nov 2022 01:04:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230398AbiKSAD6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Nov 2022 19:03:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237528AbiKSACY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 18 Nov 2022 19:02:24 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DB97E5B11
        for <linux-i2c@vger.kernel.org>; Fri, 18 Nov 2022 15:30:12 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1owA9d-00057N-4V; Fri, 18 Nov 2022 23:48:13 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1owA9a-0058py-EG; Fri, 18 Nov 2022 23:48:11 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1owA9a-0000SZ-3H; Fri, 18 Nov 2022 23:48:10 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
To:     Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-kernel@vger.kernel.org
Subject: [PATCH 550/606] regulator: max8952: Convert to i2c's .probe_new()
Date:   Fri, 18 Nov 2022 23:44:44 +0100
Message-Id: <20221118224540.619276-551-uwe@kleine-koenig.org>
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

The probe function doesn't make use of the i2c_device_id * parameter so it
can be trivially converted.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/regulator/max8952.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/regulator/max8952.c b/drivers/regulator/max8952.c
index ccd5da63cdf2..360a33ecc093 100644
--- a/drivers/regulator/max8952.c
+++ b/drivers/regulator/max8952.c
@@ -171,8 +171,7 @@ static struct max8952_platform_data *max8952_parse_dt(struct device *dev)
 }
 #endif
 
-static int max8952_pmic_probe(struct i2c_client *client,
-		const struct i2c_device_id *i2c_id)
+static int max8952_pmic_probe(struct i2c_client *client)
 {
 	struct i2c_adapter *adapter = client->adapter;
 	struct max8952_platform_data *pdata = dev_get_platdata(&client->dev);
@@ -314,7 +313,7 @@ static const struct i2c_device_id max8952_ids[] = {
 MODULE_DEVICE_TABLE(i2c, max8952_ids);
 
 static struct i2c_driver max8952_pmic_driver = {
-	.probe		= max8952_pmic_probe,
+	.probe_new	= max8952_pmic_probe,
 	.driver		= {
 		.name	= "max8952",
 		.of_match_table = of_match_ptr(max8952_dt_match),
-- 
2.38.1

