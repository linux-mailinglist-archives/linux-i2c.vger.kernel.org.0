Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C5F1E6301A3
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Nov 2022 23:53:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234130AbiKRWxP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Nov 2022 17:53:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233941AbiKRWwj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 18 Nov 2022 17:52:39 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F840BCDE1
        for <linux-i2c@vger.kernel.org>; Fri, 18 Nov 2022 14:47:39 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1owA8Q-0001tt-S6; Fri, 18 Nov 2022 23:46:58 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1owA8O-0058Om-1e; Fri, 18 Nov 2022 23:46:56 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1owA8O-00005X-4s; Fri, 18 Nov 2022 23:46:56 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
To:     Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 214/606] Input: drv2665 - Convert to i2c's .probe_new()
Date:   Fri, 18 Nov 2022 23:39:08 +0100
Message-Id: <20221118224540.619276-215-uwe@kleine-koenig.org>
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
 drivers/input/misc/drv2665.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/input/misc/drv2665.c b/drivers/input/misc/drv2665.c
index 21913e8085d7..c2a2ff980c06 100644
--- a/drivers/input/misc/drv2665.c
+++ b/drivers/input/misc/drv2665.c
@@ -156,8 +156,7 @@ static const struct regmap_config drv2665_regmap_config = {
 	.cache_type = REGCACHE_NONE,
 };
 
-static int drv2665_probe(struct i2c_client *client,
-			 const struct i2c_device_id *id)
+static int drv2665_probe(struct i2c_client *client)
 {
 	struct drv2665_data *haptics;
 	int error;
@@ -298,7 +297,7 @@ MODULE_DEVICE_TABLE(of, drv2665_of_match);
 #endif
 
 static struct i2c_driver drv2665_driver = {
-	.probe		= drv2665_probe,
+	.probe_new	= drv2665_probe,
 	.driver		= {
 		.name	= "drv2665-haptics",
 		.of_match_table = of_match_ptr(drv2665_of_match),
-- 
2.38.1

