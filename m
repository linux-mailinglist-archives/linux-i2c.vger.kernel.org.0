Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F9436301ED
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Nov 2022 23:55:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235021AbiKRWy7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Nov 2022 17:54:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234820AbiKRWyK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 18 Nov 2022 17:54:10 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54395BEB5B
        for <linux-i2c@vger.kernel.org>; Fri, 18 Nov 2022 14:48:05 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1owA8k-0002j0-BZ; Fri, 18 Nov 2022 23:47:18 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1owA8h-0058VN-6C; Fri, 18 Nov 2022 23:47:16 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1owA8g-0000Aq-Tx; Fri, 18 Nov 2022 23:47:14 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
To:     Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Adrien Grassein <adrien.grassein@gmail.com>,
        Jeremy Kerr <jk@codeconstruct.com.au>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 295/606] macintosh: windfarm_lm87_sensor: Convert to i2c's .probe_new()
Date:   Fri, 18 Nov 2022 23:40:29 +0100
Message-Id: <20221118224540.619276-296-uwe@kleine-koenig.org>
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
 drivers/macintosh/windfarm_lm87_sensor.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/macintosh/windfarm_lm87_sensor.c b/drivers/macintosh/windfarm_lm87_sensor.c
index 40d25463346e..f37a32c2070c 100644
--- a/drivers/macintosh/windfarm_lm87_sensor.c
+++ b/drivers/macintosh/windfarm_lm87_sensor.c
@@ -95,8 +95,7 @@ static const struct wf_sensor_ops wf_lm87_ops = {
 	.owner		= THIS_MODULE,
 };
 
-static int wf_lm87_probe(struct i2c_client *client,
-			 const struct i2c_device_id *id)
+static int wf_lm87_probe(struct i2c_client *client)
 {	
 	struct wf_lm87_sensor *lm;
 	const char *name = NULL, *loc;
@@ -173,7 +172,7 @@ static struct i2c_driver wf_lm87_driver = {
 		.name	= "wf_lm87",
 		.of_match_table = wf_lm87_of_id,
 	},
-	.probe		= wf_lm87_probe,
+	.probe_new	= wf_lm87_probe,
 	.remove		= wf_lm87_remove,
 	.id_table	= wf_lm87_id,
 };
-- 
2.38.1

