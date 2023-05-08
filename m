Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63A806FB8F1
	for <lists+linux-i2c@lfdr.de>; Mon,  8 May 2023 22:54:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233333AbjEHUyY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 May 2023 16:54:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233343AbjEHUyF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 May 2023 16:54:05 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B76A26EB2
        for <linux-i2c@vger.kernel.org>; Mon,  8 May 2023 13:53:49 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rV-0004NU-Ra; Mon, 08 May 2023 22:53:37 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rT-0024w8-Rb; Mon, 08 May 2023 22:53:35 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rT-002YaV-55; Mon, 08 May 2023 22:53:35 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Peter Rosin <peda@axentia.se>, Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 89/89] i2c: mux: reg: Convert to platform remove callback returning void
Date:   Mon,  8 May 2023 22:53:06 +0200
Message-Id: <20230508205306.1474415-90-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1717; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=IZ7ptc34RIWKFJr/psOyN7PuXa5eoBu8q5CNdC/lMP8=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkWWEbjNyVfSR1yb2/jZN15jMUUXqUrlBpII8gD tnQ8VIwY/eJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFlhGwAKCRCPgPtYfRL+ TigVB/0fLHC1XGlQ3NQoFmfpysE3iMNaaP7QRJE1Vb4UPP+iODPNZPqriepyQ77vcWuVGB8njxs qgiGKrNieThJy5C12aRBxIxztNMRKUYtPDsrOGC+T+NbDLTUt/rbi/h16DydU2PxdM1S6WlHfvG W28q9f3nWVRDNd61iINyhd1rJ9bsTvDeX0L1rdLRwy1NWcXFYmFqLuB3Uq/r8iDqpYm+3/UrWk1 fO5msZ5mFta5LySTX6jrdFTnjIO2RGY08Wun0phA91q9SlCl4kmHafINa+wvEDUmw57FkOzKiFp G9qic3HNIIySHDWeXc9v52Ie7XRXdYUWGr8rUoHI7HeYyQwo
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
 drivers/i2c/muxes/i2c-mux-reg.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/muxes/i2c-mux-reg.c b/drivers/i2c/muxes/i2c-mux-reg.c
index 30a6de1694e0..9efc1ed01577 100644
--- a/drivers/i2c/muxes/i2c-mux-reg.c
+++ b/drivers/i2c/muxes/i2c-mux-reg.c
@@ -233,14 +233,12 @@ static int i2c_mux_reg_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int i2c_mux_reg_remove(struct platform_device *pdev)
+static void i2c_mux_reg_remove(struct platform_device *pdev)
 {
 	struct i2c_mux_core *muxc = platform_get_drvdata(pdev);
 
 	i2c_mux_del_adapters(muxc);
 	i2c_put_adapter(muxc->parent);
-
-	return 0;
 }
 
 static const struct of_device_id i2c_mux_reg_of_match[] = {
@@ -251,7 +249,7 @@ MODULE_DEVICE_TABLE(of, i2c_mux_reg_of_match);
 
 static struct platform_driver i2c_mux_reg_driver = {
 	.probe	= i2c_mux_reg_probe,
-	.remove	= i2c_mux_reg_remove,
+	.remove_new = i2c_mux_reg_remove,
 	.driver	= {
 		.name	= "i2c-mux-reg",
 		.of_match_table = of_match_ptr(i2c_mux_reg_of_match),
-- 
2.39.2

