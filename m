Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E636592ACE
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Aug 2022 10:06:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241189AbiHOIDJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 15 Aug 2022 04:03:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241105AbiHOICv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 15 Aug 2022 04:02:51 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D62411E3C6
        for <linux-i2c@vger.kernel.org>; Mon, 15 Aug 2022 01:02:50 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1oNV3h-0001xE-4b; Mon, 15 Aug 2022 10:02:49 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1oNV3e-003sP7-0Q; Mon, 15 Aug 2022 10:02:48 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1oNV3f-00BoQr-Ei; Mon, 15 Aug 2022 10:02:47 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        Pavel Machek <pavel@ucw.cz>
Subject: [PATCH v2 3/6] leds: lm3601x: Don't use mutex after it was destroyed
Date:   Mon, 15 Aug 2022 10:02:27 +0200
Message-Id: <20220815080230.37408-4-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220815080230.37408-1-u.kleine-koenig@pengutronix.de>
References: <20220815080230.37408-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=963; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=MrYNIq4ffMvLqyL7sdB2b2LADgcbYl8bJHDTYkm0LAo=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBi+f2FUMjFizSFhPKNdrmqRCondHtgkYWXbckzIGvu 5EOY7iWJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYvn9hQAKCRDB/BR4rcrsCe5IB/ 9F6iw21UWqC/12thr65z7cBX6flfcAWesyg4ugX0VdOb5qYHXBROPwFdFYGYyDtlgpuN4asZbpUWOX h1kE0PoEl1YlyMK/cvajXAjbeYdekJ/rCGfFNN6lJAbdutEZtB3fIYFUIPOjlxV0swopkbbQQRwEs2 skLeFOikI2PugYyAlW7OgX2/1RQf2JOMOdR4HotUyU7wCGlqRdDIlKqBmVXGOHuLbOozn8LSOqNCi6 nDOFToR3GGTHl/Z30ul5AB7ssRHSaxwbwgI8YFTFEoGH5M1/8pCdOeYPyxnE11xJPxPrG/hItQ/1xD ivpHYoEoEpwiuacClbaGGKOoMRlWG9
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The mutex might still be in use until the devm cleanup callback
devm_led_classdev_flash_release() is called. This only happens some time
after lm3601x_remove() completed.

Fixes: e63a744871a3 ("leds: lm3601x: Convert class registration to device managed")
Acked-by: Pavel Machek <pavel@ucw.cz>
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/leds/flash/leds-lm3601x.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/leds/flash/leds-lm3601x.c b/drivers/leds/flash/leds-lm3601x.c
index d0e1d4814042..3d1272748201 100644
--- a/drivers/leds/flash/leds-lm3601x.c
+++ b/drivers/leds/flash/leds-lm3601x.c
@@ -444,8 +444,6 @@ static int lm3601x_remove(struct i2c_client *client)
 {
 	struct lm3601x_led *led = i2c_get_clientdata(client);
 
-	mutex_destroy(&led->lock);
-
 	return regmap_update_bits(led->regmap, LM3601X_ENABLE_REG,
 			   LM3601X_ENABLE_MASK,
 			   LM3601X_MODE_STANDBY);
-- 
2.36.1

