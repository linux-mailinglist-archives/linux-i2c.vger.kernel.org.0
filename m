Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC2006FB8A3
	for <lists+linux-i2c@lfdr.de>; Mon,  8 May 2023 22:53:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233385AbjEHUxg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 May 2023 16:53:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233449AbjEHUxY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 May 2023 16:53:24 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88D726188
        for <linux-i2c@vger.kernel.org>; Mon,  8 May 2023 13:53:23 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rB-0003C0-IE; Mon, 08 May 2023 22:53:17 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rA-0024qt-Jk; Mon, 08 May 2023 22:53:16 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7r9-002YWG-Sa; Mon, 08 May 2023 22:53:15 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Jean-Marie Verdun <verdun@hpe.com>,
        Nick Hawkins <nick.hawkins@hpe.com>,
        Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 24/89] i2c: gxp: Convert to platform remove callback returning void
Date:   Mon,  8 May 2023 22:52:01 +0200
Message-Id: <20230508205306.1474415-25-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1721; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=0KlhdKsHyaEJqOFi4h/zlXug5Rly8uMBAoL2Bet0S8g=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkWWCYx4evMQE9FKKN8/6fIqHUM9sixFuooeZKF KeuTch6J/SJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFlgmAAKCRCPgPtYfRL+ TqgPB/92rtDJwmTaYEdx5z99ue+3vTaV3HzBd1MeD3/cRysOXB7L1H4WQd4dDilINIhKNdb3Kc3 fPLUYAS4TNxr23PZYFvizoiALpi8NcQQjShfISiO49UWd4pHnQ8KMNMEaS6kwxq7E4HEO2/M2Z+ CpjCJu67i9ZGeOBMFgf0/rjOO2Xcat3vGYzNSHit/rikUYoL7BiVt3p9KiLhLPkJ6DMbWpOzgMG +KPiSRUT/2COkIYf9G8GGB8aADehLgtqV8Cn91VQ1K9ZAfqVDGy6Ym4nhSPrazjUzVjwGOPVdQB BI/2Ek89G0sKuD/AUQtHwrQd5AiiYYu1Rkted8ipCJ8Egkhf
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
 drivers/i2c/busses/i2c-gxp.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-gxp.c b/drivers/i2c/busses/i2c-gxp.c
index 8ea3fb5e4c7f..70b0de07ed99 100644
--- a/drivers/i2c/busses/i2c-gxp.c
+++ b/drivers/i2c/busses/i2c-gxp.c
@@ -577,15 +577,13 @@ static int gxp_i2c_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int gxp_i2c_remove(struct platform_device *pdev)
+static void gxp_i2c_remove(struct platform_device *pdev)
 {
 	struct gxp_i2c_drvdata *drvdata = platform_get_drvdata(pdev);
 
 	/* Disable interrupt */
 	regmap_update_bits(i2cg_map, GXP_I2CINTEN, BIT(drvdata->engine), 0);
 	i2c_del_adapter(&drvdata->adapter);
-
-	return 0;
 }
 
 static const struct of_device_id gxp_i2c_of_match[] = {
@@ -596,7 +594,7 @@ MODULE_DEVICE_TABLE(of, gxp_i2c_of_match);
 
 static struct platform_driver gxp_i2c_driver = {
 	.probe	= gxp_i2c_probe,
-	.remove = gxp_i2c_remove,
+	.remove_new = gxp_i2c_remove,
 	.driver = {
 		.name = "gxp-i2c",
 		.of_match_table = gxp_i2c_of_match,
-- 
2.39.2

