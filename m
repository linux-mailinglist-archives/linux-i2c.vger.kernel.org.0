Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B78063016D
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Nov 2022 23:52:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234268AbiKRWwV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Nov 2022 17:52:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234161AbiKRWvx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 18 Nov 2022 17:51:53 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5897CBB5F7
        for <linux-i2c@vger.kernel.org>; Fri, 18 Nov 2022 14:47:20 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1owA82-0000Ah-1y; Fri, 18 Nov 2022 23:46:34 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1owA7x-0058FQ-5E; Fri, 18 Nov 2022 23:46:30 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1owA7x-00Hb1U-FC; Fri, 18 Nov 2022 23:46:29 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
To:     Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Jean Delvare <jdelvare@suse.de>,
        Corey Minyard <cminyard@mvista.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Peter Senna Tschudin <peter.senna@gmail.com>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 102/606] iio: humidity: hdc2010: Convert to i2c's .probe_new()
Date:   Fri, 18 Nov 2022 23:37:16 +0100
Message-Id: <20221118224540.619276-103-uwe@kleine-koenig.org>
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
 drivers/iio/humidity/hdc2010.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/humidity/hdc2010.c b/drivers/iio/humidity/hdc2010.c
index d6858ccb056e..c8fddd612e06 100644
--- a/drivers/iio/humidity/hdc2010.c
+++ b/drivers/iio/humidity/hdc2010.c
@@ -251,8 +251,7 @@ static const struct iio_info hdc2010_info = {
 	.attrs = &hdc2010_attribute_group,
 };
 
-static int hdc2010_probe(struct i2c_client *client,
-			 const struct i2c_device_id *id)
+static int hdc2010_probe(struct i2c_client *client)
 {
 	struct iio_dev *indio_dev;
 	struct hdc2010_data *data;
@@ -339,7 +338,7 @@ static struct i2c_driver hdc2010_driver = {
 		.name	= "hdc2010",
 		.of_match_table = hdc2010_dt_ids,
 	},
-	.probe = hdc2010_probe,
+	.probe_new = hdc2010_probe,
 	.remove = hdc2010_remove,
 	.id_table = hdc2010_id,
 };
-- 
2.38.1

