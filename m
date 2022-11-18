Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 352C16302E1
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Nov 2022 00:21:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234349AbiKRXVR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Nov 2022 18:21:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232198AbiKRXU7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 18 Nov 2022 18:20:59 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DBBA4AF34
        for <linux-i2c@vger.kernel.org>; Fri, 18 Nov 2022 15:11:38 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1owA9F-000461-Pi; Fri, 18 Nov 2022 23:47:49 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1owA9D-0058gX-Lq; Fri, 18 Nov 2022 23:47:48 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1owA9B-0000Kh-Um; Fri, 18 Nov 2022 23:47:45 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
To:     Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Support Opensource <support.opensource@diasemi.com>,
        Lee Jones <lee@kernel.org>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-kernel@vger.kernel.org
Subject: [PATCH 430/606] mfd: da9150-core: Convert to i2c's .probe_new()
Date:   Fri, 18 Nov 2022 23:42:44 +0100
Message-Id: <20221118224540.619276-431-uwe@kleine-koenig.org>
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
 drivers/mfd/da9150-core.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/da9150-core.c b/drivers/mfd/da9150-core.c
index 6ae56e46d24e..d2c954103b2f 100644
--- a/drivers/mfd/da9150-core.c
+++ b/drivers/mfd/da9150-core.c
@@ -392,8 +392,7 @@ static struct mfd_cell da9150_devs[] = {
 	},
 };
 
-static int da9150_probe(struct i2c_client *client,
-			const struct i2c_device_id *id)
+static int da9150_probe(struct i2c_client *client)
 {
 	struct da9150 *da9150;
 	struct da9150_pdata *pdata = dev_get_platdata(&client->dev);
@@ -511,7 +510,7 @@ static struct i2c_driver da9150_driver = {
 		.name	= "da9150",
 		.of_match_table = da9150_of_match,
 	},
-	.probe		= da9150_probe,
+	.probe_new	= da9150_probe,
 	.remove		= da9150_remove,
 	.shutdown	= da9150_shutdown,
 	.id_table	= da9150_i2c_id,
-- 
2.38.1

