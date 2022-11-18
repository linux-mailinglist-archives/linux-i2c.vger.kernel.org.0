Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1D4D630714
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Nov 2022 01:24:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237889AbiKSAYk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Nov 2022 19:24:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236245AbiKSAYS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 18 Nov 2022 19:24:18 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFB7E6D96C
        for <linux-i2c@vger.kernel.org>; Fri, 18 Nov 2022 15:38:09 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1owA8y-0003Hn-8D; Fri, 18 Nov 2022 23:47:32 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1owA8v-0058aI-M2; Fri, 18 Nov 2022 23:47:30 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1owA8v-0000Fk-MX; Fri, 18 Nov 2022 23:47:29 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
To:     Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Petr Machata <petrm@nvidia.com>,
        =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>,
        Corey Minyard <cminyard@mvista.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 356/606] media: i2c/noon010pc30: Convert to i2c's .probe_new()
Date:   Fri, 18 Nov 2022 23:41:30 +0100
Message-Id: <20221118224540.619276-357-uwe@kleine-koenig.org>
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
 drivers/media/i2c/noon010pc30.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/noon010pc30.c b/drivers/media/i2c/noon010pc30.c
index ecaf5e9057f1..144bef2835f7 100644
--- a/drivers/media/i2c/noon010pc30.c
+++ b/drivers/media/i2c/noon010pc30.c
@@ -702,8 +702,7 @@ static int noon010_detect(struct i2c_client *client, struct noon010_info *info)
 	return ret == NOON010PC30_ID ? 0 : -ENODEV;
 }
 
-static int noon010_probe(struct i2c_client *client,
-			 const struct i2c_device_id *id)
+static int noon010_probe(struct i2c_client *client)
 {
 	struct noon010_info *info;
 	struct v4l2_subdev *sd;
@@ -810,7 +809,7 @@ static struct i2c_driver noon010_i2c_driver = {
 	.driver = {
 		.name = MODULE_NAME
 	},
-	.probe		= noon010_probe,
+	.probe_new	= noon010_probe,
 	.remove		= noon010_remove,
 	.id_table	= noon010_id,
 };
-- 
2.38.1

