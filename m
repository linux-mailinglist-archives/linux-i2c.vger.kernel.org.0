Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 221116FB8B6
	for <lists+linux-i2c@lfdr.de>; Mon,  8 May 2023 22:53:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230129AbjEHUxp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 May 2023 16:53:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233726AbjEHUxd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 May 2023 16:53:33 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13A96729B
        for <linux-i2c@vger.kernel.org>; Mon,  8 May 2023 13:53:27 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rG-0003WK-32; Mon, 08 May 2023 22:53:22 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rE-0024rq-QS; Mon, 08 May 2023 22:53:20 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rD-002YX4-TW; Mon, 08 May 2023 22:53:19 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Julia Lawall <Julia.Lawall@inria.fr>,
        Wolfram Sang <wsa@kernel.org>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, kernel@pengutronix.de
Subject: [PATCH 36/89] i2c: meson: Convert to platform remove callback returning void
Date:   Mon,  8 May 2023 22:52:13 +0200
Message-Id: <20230508205306.1474415-37-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1669; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=8zGheaYogX/YE5kaz1sKpvMxHgBauI7XYhda0HCqFZ0=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkWWDOmSwrvvS9XHHVxwppvK8tcbjWr6P6X2z/8 wxptK/usnmJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFlgzgAKCRCPgPtYfRL+ ThpkB/41TZvGeJoA1z1M1+jaZLJi+W/ZehwAidLZQCQ1t7CnDTk0QfY/mlAM6A1ZnLpM4ck/c9Y mu72dpOjCCea0XgZ4Dk0uoOj6rLnkrm3Y6tBLohKF9fipcyPtsWnTglGqsJTrRnNnBaQegIWNJs 9BB2rn78T8POSQHwt01tHbvxM6bE881oEqylJG6hiPZFyR44sSRY2u68EzCqt4N3vJ1LKjQCdUS yKQg940f2l8Kc13ENVBE2l9yECnCLRKO32LN3PMCAkRCano3Wut1lAupo7K9dopA9XDTHdfisrA eQHAkoqa+c1FiVnY9pJc8QINRm/hWo8/POVr7IS3qpL4Ew/A
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

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is (mostly) ignored
and this typically results in resource leaks. To improve here there is a
quest to make the remove callback return void. In the first step of this
quest all drivers are converted to .remove_new() which already returns
void.

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/i2c/busses/i2c-meson.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-meson.c b/drivers/i2c/busses/i2c-meson.c
index 889eff06b78f..16026c895bb6 100644
--- a/drivers/i2c/busses/i2c-meson.c
+++ b/drivers/i2c/busses/i2c-meson.c
@@ -535,14 +535,12 @@ static int meson_i2c_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int meson_i2c_remove(struct platform_device *pdev)
+static void meson_i2c_remove(struct platform_device *pdev)
 {
 	struct meson_i2c *i2c = platform_get_drvdata(pdev);
 
 	i2c_del_adapter(&i2c->adap);
 	clk_disable_unprepare(i2c->clk);
-
-	return 0;
 }
 
 static const struct meson_i2c_data i2c_meson6_data = {
@@ -568,7 +566,7 @@ MODULE_DEVICE_TABLE(of, meson_i2c_match);
 
 static struct platform_driver meson_i2c_driver = {
 	.probe   = meson_i2c_probe,
-	.remove  = meson_i2c_remove,
+	.remove_new = meson_i2c_remove,
 	.driver  = {
 		.name  = "meson-i2c",
 		.of_match_table = meson_i2c_match,
-- 
2.39.2

