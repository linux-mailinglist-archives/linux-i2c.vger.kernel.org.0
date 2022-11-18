Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E0D5E630684
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Nov 2022 01:10:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237655AbiKSAKu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Nov 2022 19:10:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237394AbiKSAJw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 18 Nov 2022 19:09:52 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99A647C69E
        for <linux-i2c@vger.kernel.org>; Fri, 18 Nov 2022 15:33:13 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1owA9a-0004zU-5G; Fri, 18 Nov 2022 23:48:10 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1owA9X-0058oq-GA; Fri, 18 Nov 2022 23:48:08 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1owA9X-0000Rj-Gr; Fri, 18 Nov 2022 23:48:07 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
To:     Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-pwm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 537/606] pwm: pca9685: Convert to i2c's .probe_new()
Date:   Fri, 18 Nov 2022 23:44:31 +0100
Message-Id: <20221118224540.619276-538-uwe@kleine-koenig.org>
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
 drivers/pwm/pwm-pca9685.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/pwm/pwm-pca9685.c b/drivers/pwm/pwm-pca9685.c
index f230c10d28bb..e00152257cbe 100644
--- a/drivers/pwm/pwm-pca9685.c
+++ b/drivers/pwm/pwm-pca9685.c
@@ -513,8 +513,7 @@ static const struct regmap_config pca9685_regmap_i2c_config = {
 	.cache_type = REGCACHE_NONE,
 };
 
-static int pca9685_pwm_probe(struct i2c_client *client,
-				const struct i2c_device_id *id)
+static int pca9685_pwm_probe(struct i2c_client *client)
 {
 	struct pca9685 *pca;
 	unsigned int reg;
@@ -664,7 +663,7 @@ static struct i2c_driver pca9685_i2c_driver = {
 		.of_match_table = of_match_ptr(pca9685_dt_ids),
 		.pm = &pca9685_pwm_pm,
 	},
-	.probe = pca9685_pwm_probe,
+	.probe_new = pca9685_pwm_probe,
 	.remove = pca9685_pwm_remove,
 	.id_table = pca9685_id,
 };
-- 
2.38.1

