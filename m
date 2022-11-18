Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F17AF63033A
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Nov 2022 00:26:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235598AbiKRXZ6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Nov 2022 18:25:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235600AbiKRXYL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 18 Nov 2022 18:24:11 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 248845803E
        for <linux-i2c@vger.kernel.org>; Fri, 18 Nov 2022 15:14:15 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1owA8Y-0002IK-KY; Fri, 18 Nov 2022 23:47:06 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1owA8W-0058Rf-8q; Fri, 18 Nov 2022 23:47:05 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1owA8W-00007r-4e; Fri, 18 Nov 2022 23:47:04 +0100
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
Subject: [PATCH 249/606] Input: mcs5000_ts - Convert to i2c's .probe_new()
Date:   Fri, 18 Nov 2022 23:39:43 +0100
Message-Id: <20221118224540.619276-250-uwe@kleine-koenig.org>
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
 drivers/input/touchscreen/mcs5000_ts.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/input/touchscreen/mcs5000_ts.c b/drivers/input/touchscreen/mcs5000_ts.c
index 5376d8f740ab..ea9517cad695 100644
--- a/drivers/input/touchscreen/mcs5000_ts.c
+++ b/drivers/input/touchscreen/mcs5000_ts.c
@@ -180,8 +180,7 @@ static void mcs5000_ts_phys_init(struct mcs5000_ts_data *data,
 			OP_MODE_ACTIVE | REPORT_RATE_80);
 }
 
-static int mcs5000_ts_probe(struct i2c_client *client,
-			    const struct i2c_device_id *id)
+static int mcs5000_ts_probe(struct i2c_client *client)
 {
 	const struct mcs_platform_data *pdata;
 	struct mcs5000_ts_data *data;
@@ -272,7 +271,7 @@ static const struct i2c_device_id mcs5000_ts_id[] = {
 MODULE_DEVICE_TABLE(i2c, mcs5000_ts_id);
 
 static struct i2c_driver mcs5000_ts_driver = {
-	.probe		= mcs5000_ts_probe,
+	.probe_new	= mcs5000_ts_probe,
 	.driver = {
 		.name = "mcs5000_ts",
 		.pm   = &mcs5000_ts_pm,
-- 
2.38.1

