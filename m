Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E30063010C
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Nov 2022 23:50:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233795AbiKRWuW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Nov 2022 17:50:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232623AbiKRWsb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 18 Nov 2022 17:48:31 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A9FCB94AB
        for <linux-i2c@vger.kernel.org>; Fri, 18 Nov 2022 14:46:50 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1owA7z-0008U2-4a; Fri, 18 Nov 2022 23:46:31 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1owA7v-0058Eb-7s; Fri, 18 Nov 2022 23:46:28 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1owA7u-00Hb0U-9A; Fri, 18 Nov 2022 23:46:26 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
To:     Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 088/606] iio: dac: m62332: Convert to i2c's .probe_new()
Date:   Fri, 18 Nov 2022 23:37:02 +0100
Message-Id: <20221118224540.619276-89-uwe@kleine-koenig.org>
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
 drivers/iio/dac/m62332.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/dac/m62332.c b/drivers/iio/dac/m62332.c
index 5a812f87970c..b692459b0f23 100644
--- a/drivers/iio/dac/m62332.c
+++ b/drivers/iio/dac/m62332.c
@@ -176,8 +176,7 @@ static const struct iio_chan_spec m62332_channels[M62332_CHANNELS] = {
 	M62332_CHANNEL(1)
 };
 
-static int m62332_probe(struct i2c_client *client,
-			const struct i2c_device_id *id)
+static int m62332_probe(struct i2c_client *client)
 {
 	struct m62332_data *data;
 	struct iio_dev *indio_dev;
@@ -239,7 +238,7 @@ static struct i2c_driver m62332_driver = {
 		.name	= "m62332",
 		.pm	= pm_sleep_ptr(&m62332_pm_ops),
 	},
-	.probe		= m62332_probe,
+	.probe_new	= m62332_probe,
 	.remove		= m62332_remove,
 	.id_table	= m62332_id,
 };
-- 
2.38.1

