Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84864630072
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Nov 2022 23:47:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231906AbiKRWrA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Nov 2022 17:47:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231990AbiKRWqc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 18 Nov 2022 17:46:32 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C40DFA316C
        for <linux-i2c@vger.kernel.org>; Fri, 18 Nov 2022 14:46:29 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1owA7m-0007i9-R7; Fri, 18 Nov 2022 23:46:18 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1owA7k-0058Ak-QI; Fri, 18 Nov 2022 23:46:17 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1owA7k-00HaxU-1X; Fri, 18 Nov 2022 23:46:16 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
To:     Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Stefan Mavrodiev <stefan@olimex.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Sam Ravnborg <sam@ravnborg.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 042/606] drm/panel: olimex-lcd-olinuxino: Convert to i2c's .probe_new()
Date:   Fri, 18 Nov 2022 23:36:16 +0100
Message-Id: <20221118224540.619276-43-uwe@kleine-koenig.org>
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
 drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c b/drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c
index 36a46cb7fe1c..aba556c98300 100644
--- a/drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c
+++ b/drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c
@@ -202,8 +202,7 @@ static const struct drm_panel_funcs lcd_olinuxino_funcs = {
 	.get_modes = lcd_olinuxino_get_modes,
 };
 
-static int lcd_olinuxino_probe(struct i2c_client *client,
-			       const struct i2c_device_id *id)
+static int lcd_olinuxino_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
 	struct lcd_olinuxino *lcd;
@@ -309,7 +308,7 @@ static struct i2c_driver lcd_olinuxino_driver = {
 		.name = "lcd_olinuxino",
 		.of_match_table = lcd_olinuxino_of_ids,
 	},
-	.probe = lcd_olinuxino_probe,
+	.probe_new = lcd_olinuxino_probe,
 	.remove = lcd_olinuxino_remove,
 };
 
-- 
2.38.1

