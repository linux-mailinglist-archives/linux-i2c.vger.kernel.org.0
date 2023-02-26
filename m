Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 334576A34A4
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Feb 2023 23:27:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229759AbjBZW1W (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 26 Feb 2023 17:27:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229737AbjBZW1U (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 26 Feb 2023 17:27:20 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48C7016AF0
        for <linux-i2c@vger.kernel.org>; Sun, 26 Feb 2023 14:27:16 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pWPTz-0000vN-Su; Sun, 26 Feb 2023 23:27:03 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pWPTx-000Ubv-CF; Sun, 26 Feb 2023 23:27:01 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pWPTw-000YQ3-Bw; Sun, 26 Feb 2023 23:27:00 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org,
        Michael Hennerich <michael.hennerich@analog.com>,
        Peter Rosin <peda@axentia.se>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 8/9] i2c: mux: Convert all drivers to new .probe() callback
Date:   Sun, 26 Feb 2023 23:26:53 +0100
Message-Id: <20230226222654.1741900-9-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230226222654.1741900-1-u.kleine-koenig@pengutronix.de>
References: <20230226222654.1741900-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1995; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=jcUywLQFp8WtlmqcLVBYp45E4YG+FnwWrSDjDBieEic=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBj+9ymaExC7GrV4YWI4fas9uJsKebM3ytL19/1y zQlRoHlIQGJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY/vcpgAKCRDB/BR4rcrs CbldB/0XJH0RfzmRbquiKKMm85T/XUj3VUvyKhEN4y4/ZHTekqEdaVIixBD0Y5wU5NCS57abnbx 0Sh1xi2uf0o0sMsGKcLao+qJF5YjHon8MzWUlPX7b4XXD4mTZg9MAtolZ0mkfFoOmjah7KKFhP3 QRo6j/31m9kFkDtpZGIjdrhboOE5bi2nojkTemEMTLhUa4Ps6q25l4Pf6aR53AxOSS7S4l/ul2p hmqbz60tN9y6P4HDIAHcKxMoCW6NX+y3pZTN4qojo1bR3evVPQIC/vTTRW98Sq6BsmcFM8aDYeb FRhQoXGjwwbG1gGB4XOIk0XiE6EJX2zLIs7IsqZkh9belYuX
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Now that .probe() was changed not to get the id parameter, drivers can
be converted back to that with the eventual goal to drop .probe_new().

Implement that for the i2c mux drivers.

Acked-by: Guenter Roeck <linux@roeck-us.net>
Acked-by: Peter Rosin <peda@axentia.se>
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/i2c/muxes/i2c-mux-ltc4306.c | 2 +-
 drivers/i2c/muxes/i2c-mux-pca9541.c | 2 +-
 drivers/i2c/muxes/i2c-mux-pca954x.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/muxes/i2c-mux-ltc4306.c b/drivers/i2c/muxes/i2c-mux-ltc4306.c
index 70835825083f..5a03031519be 100644
--- a/drivers/i2c/muxes/i2c-mux-ltc4306.c
+++ b/drivers/i2c/muxes/i2c-mux-ltc4306.c
@@ -306,7 +306,7 @@ static struct i2c_driver ltc4306_driver = {
 		.name	= "ltc4306",
 		.of_match_table = of_match_ptr(ltc4306_of_match),
 	},
-	.probe_new	= ltc4306_probe,
+	.probe		= ltc4306_probe,
 	.remove		= ltc4306_remove,
 	.id_table	= ltc4306_id,
 };
diff --git a/drivers/i2c/muxes/i2c-mux-pca9541.c b/drivers/i2c/muxes/i2c-mux-pca9541.c
index 09d1d9e67e31..ce0fb69249a8 100644
--- a/drivers/i2c/muxes/i2c-mux-pca9541.c
+++ b/drivers/i2c/muxes/i2c-mux-pca9541.c
@@ -336,7 +336,7 @@ static struct i2c_driver pca9541_driver = {
 		   .name = "pca9541",
 		   .of_match_table = of_match_ptr(pca9541_of_match),
 		   },
-	.probe_new = pca9541_probe,
+	.probe = pca9541_probe,
 	.remove = pca9541_remove,
 	.id_table = pca9541_id,
 };
diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mux-pca954x.c
index 3639e6d7304c..0ccee2ae5720 100644
--- a/drivers/i2c/muxes/i2c-mux-pca954x.c
+++ b/drivers/i2c/muxes/i2c-mux-pca954x.c
@@ -554,7 +554,7 @@ static struct i2c_driver pca954x_driver = {
 		.pm	= &pca954x_pm,
 		.of_match_table = pca954x_of_match,
 	},
-	.probe_new	= pca954x_probe,
+	.probe		= pca954x_probe,
 	.remove		= pca954x_remove,
 	.id_table	= pca954x_id,
 };
-- 
2.39.1

