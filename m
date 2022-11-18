Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B65F6303F0
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Nov 2022 00:34:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236177AbiKRXeH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Nov 2022 18:34:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236370AbiKRXct (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 18 Nov 2022 18:32:49 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B903463CC4
        for <linux-i2c@vger.kernel.org>; Fri, 18 Nov 2022 15:20:21 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1owA9U-0004kI-F9; Fri, 18 Nov 2022 23:48:04 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1owA9R-0058mk-PI; Fri, 18 Nov 2022 23:48:02 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1owA9R-0000Pr-H2; Fri, 18 Nov 2022 23:48:01 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
To:     Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 509/606] of: unittest: Convert to i2c's .probe_new()
Date:   Fri, 18 Nov 2022 23:44:03 +0100
Message-Id: <20221118224540.619276-510-uwe@kleine-koenig.org>
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
 drivers/of/unittest.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index 1d810c0e18f8..bc0f1e50a4be 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -2508,8 +2508,7 @@ static struct platform_driver unittest_i2c_bus_driver = {
 	},
 };
 
-static int unittest_i2c_dev_probe(struct i2c_client *client,
-		const struct i2c_device_id *id)
+static int unittest_i2c_dev_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
 	struct device_node *np = client->dev.of_node;
@@ -2541,7 +2540,7 @@ static struct i2c_driver unittest_i2c_dev_driver = {
 	.driver = {
 		.name = "unittest-i2c-dev",
 	},
-	.probe = unittest_i2c_dev_probe,
+	.probe_new = unittest_i2c_dev_probe,
 	.remove = unittest_i2c_dev_remove,
 	.id_table = unittest_i2c_dev_id,
 };
@@ -2553,8 +2552,7 @@ static int unittest_i2c_mux_select_chan(struct i2c_mux_core *muxc, u32 chan)
 	return 0;
 }
 
-static int unittest_i2c_mux_probe(struct i2c_client *client,
-		const struct i2c_device_id *id)
+static int unittest_i2c_mux_probe(struct i2c_client *client)
 {
 	int i, nchans;
 	struct device *dev = &client->dev;
@@ -2619,7 +2617,7 @@ static struct i2c_driver unittest_i2c_mux_driver = {
 	.driver = {
 		.name = "unittest-i2c-mux",
 	},
-	.probe = unittest_i2c_mux_probe,
+	.probe_new = unittest_i2c_mux_probe,
 	.remove = unittest_i2c_mux_remove,
 	.id_table = unittest_i2c_mux_id,
 };
-- 
2.38.1

