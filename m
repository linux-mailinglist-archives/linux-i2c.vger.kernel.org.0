Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4FB763021E
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Nov 2022 23:56:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234637AbiKRW4B (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Nov 2022 17:56:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234991AbiKRWzV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 18 Nov 2022 17:55:21 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C66E81011
        for <linux-i2c@vger.kernel.org>; Fri, 18 Nov 2022 14:48:28 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1owA99-0003oP-RY; Fri, 18 Nov 2022 23:47:43 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1owA97-0058eF-I3; Fri, 18 Nov 2022 23:47:42 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1owA95-0000In-SW; Fri, 18 Nov 2022 23:47:39 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
To:     Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 399/606] media: vidtv: Convert to i2c's .probe_new()
Date:   Fri, 18 Nov 2022 23:42:13 +0100
Message-Id: <20221118224540.619276-400-uwe@kleine-koenig.org>
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

The probe functions doesn't make use of the i2c_device_id * parameter so it
can be trivially converted.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/media/test-drivers/vidtv/vidtv_demod.c | 5 ++---
 drivers/media/test-drivers/vidtv/vidtv_tuner.c | 5 ++---
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_demod.c b/drivers/media/test-drivers/vidtv/vidtv_demod.c
index d60c6d16beea..b878db798686 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_demod.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_demod.c
@@ -412,8 +412,7 @@ static const struct i2c_device_id vidtv_demod_i2c_id_table[] = {
 };
 MODULE_DEVICE_TABLE(i2c, vidtv_demod_i2c_id_table);
 
-static int vidtv_demod_i2c_probe(struct i2c_client *client,
-				 const struct i2c_device_id *id)
+static int vidtv_demod_i2c_probe(struct i2c_client *client)
 {
 	struct vidtv_tuner_config *config = client->dev.platform_data;
 	struct vidtv_demod_state *state;
@@ -450,7 +449,7 @@ static struct i2c_driver vidtv_demod_i2c_driver = {
 		.name                = "dvb_vidtv_demod",
 		.suppress_bind_attrs = true,
 	},
-	.probe    = vidtv_demod_i2c_probe,
+	.probe_new = vidtv_demod_i2c_probe,
 	.remove   = vidtv_demod_i2c_remove,
 	.id_table = vidtv_demod_i2c_id_table,
 };
diff --git a/drivers/media/test-drivers/vidtv/vidtv_tuner.c b/drivers/media/test-drivers/vidtv/vidtv_tuner.c
index aabc97ed736b..55a4387f3854 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_tuner.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_tuner.c
@@ -390,8 +390,7 @@ static const struct i2c_device_id vidtv_tuner_i2c_id_table[] = {
 };
 MODULE_DEVICE_TABLE(i2c, vidtv_tuner_i2c_id_table);
 
-static int vidtv_tuner_i2c_probe(struct i2c_client *client,
-				 const struct i2c_device_id *id)
+static int vidtv_tuner_i2c_probe(struct i2c_client *client)
 {
 	struct vidtv_tuner_config *config = client->dev.platform_data;
 	struct dvb_frontend *fe           = config->fe;
@@ -426,7 +425,7 @@ static struct i2c_driver vidtv_tuner_i2c_driver = {
 		.name                = "dvb_vidtv_tuner",
 		.suppress_bind_attrs = true,
 	},
-	.probe    = vidtv_tuner_i2c_probe,
+	.probe_new = vidtv_tuner_i2c_probe,
 	.remove   = vidtv_tuner_i2c_remove,
 	.id_table = vidtv_tuner_i2c_id_table,
 };
-- 
2.38.1

