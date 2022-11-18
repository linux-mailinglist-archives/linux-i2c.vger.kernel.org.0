Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E70C16305D0
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Nov 2022 00:59:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232958AbiKRX6y (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Nov 2022 18:58:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237383AbiKRX5i (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 18 Nov 2022 18:57:38 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2C83C68A6
        for <linux-i2c@vger.kernel.org>; Fri, 18 Nov 2022 15:29:07 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1owA9d-00059V-Oq; Fri, 18 Nov 2022 23:48:13 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1owA9b-0058qG-5V; Fri, 18 Nov 2022 23:48:12 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1owA9a-0000Sj-Nd; Fri, 18 Nov 2022 23:48:10 +0100
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
Subject: [PATCH 553/606] regulator: pfuze100-regulator: Convert to i2c's .probe_new()
Date:   Fri, 18 Nov 2022 23:44:47 +0100
Message-Id: <20221118224540.619276-554-uwe@kleine-koenig.org>
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
 drivers/regulator/pfuze100-regulator.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/regulator/pfuze100-regulator.c b/drivers/regulator/pfuze100-regulator.c
index d899d6e98fb8..9ab604289b5c 100644
--- a/drivers/regulator/pfuze100-regulator.c
+++ b/drivers/regulator/pfuze100-regulator.c
@@ -683,9 +683,9 @@ static const struct regmap_config pfuze_regmap_config = {
 	.cache_type = REGCACHE_RBTREE,
 };
 
-static int pfuze100_regulator_probe(struct i2c_client *client,
-				    const struct i2c_device_id *id)
+static int pfuze100_regulator_probe(struct i2c_client *client)
 {
+	const struct i2c_device_id *id = i2c_client_get_device_id(client);
 	struct pfuze_chip *pfuze_chip;
 	struct regulator_config config = { };
 	int i, ret;
@@ -847,7 +847,7 @@ static struct i2c_driver pfuze_driver = {
 		.name = "pfuze100-regulator",
 		.of_match_table = pfuze_dt_ids,
 	},
-	.probe = pfuze100_regulator_probe,
+	.probe_new = pfuze100_regulator_probe,
 };
 module_i2c_driver(pfuze_driver);
 
-- 
2.38.1

