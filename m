Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8FAE6FB8BF
	for <lists+linux-i2c@lfdr.de>; Mon,  8 May 2023 22:53:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233796AbjEHUxv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 May 2023 16:53:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233449AbjEHUxg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 May 2023 16:53:36 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C28D7683
        for <linux-i2c@vger.kernel.org>; Mon,  8 May 2023 13:53:31 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rK-0003l5-Ku; Mon, 08 May 2023 22:53:26 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rJ-0024t3-Mn; Mon, 08 May 2023 22:53:25 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rJ-002YY6-04; Mon, 08 May 2023 22:53:25 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Vladimir Zapolskiy <vz@mleia.com>, Wolfram Sang <wsa@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 52/89] i2c: pnx: Convert to platform remove callback returning void
Date:   Mon,  8 May 2023 22:52:29 +0200
Message-Id: <20230508205306.1474415-53-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1584; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=bOFIRB95Aq/fAjrnUIDWcU5k8a1OvfJhfaDEDc5Z6o8=; b=owEBbAGT/pANAwAKAY+A+1h9Ev5OAcsmYgBkWWDw9NF9P96EQY+bcp+07eIvq/hfNzlr8LNmP 8IKdezHQw2JATIEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFlg8AAKCRCPgPtYfRL+ TjRbB/iyLpli2/mkMb5/xX47rRw4iNcAM5k5RJoBM73qsER3oK9jJo6/b2fA8va5gvZdL+HUbXe qJ9rmcwT8EIQnbqKdDhCap0OCjpec0+IseejYSG+a+mxsu2QIAGGl/KVoDLGD5hC+sMngwEIA4G wOlOJUYALOd59J5lqJYfQYvUvJgKWbwfIF5AobCV2JvptrdimU7atDlCW+k1sZRFq2e30Epmg2b YsLrF6eVCEJMl2sKrctEbzyD81suwuADJEV+X+NFvKjE5r0R4t1A2OgCbfRugj/NFDNKnWBwBPN wWzSBI/f6YK2AYlpRnUxJoCY8d+IJ7BO5cOyUa0Muom9Vow=
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
 drivers/i2c/busses/i2c-pnx.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pnx.c b/drivers/i2c/busses/i2c-pnx.c
index 50f21cdbe90d..82400057f810 100644
--- a/drivers/i2c/busses/i2c-pnx.c
+++ b/drivers/i2c/busses/i2c-pnx.c
@@ -743,14 +743,12 @@ static int i2c_pnx_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int i2c_pnx_remove(struct platform_device *pdev)
+static void i2c_pnx_remove(struct platform_device *pdev)
 {
 	struct i2c_pnx_algo_data *alg_data = platform_get_drvdata(pdev);
 
 	i2c_del_adapter(&alg_data->adapter);
 	clk_disable_unprepare(alg_data->clk);
-
-	return 0;
 }
 
 #ifdef CONFIG_OF
@@ -768,7 +766,7 @@ static struct platform_driver i2c_pnx_driver = {
 		.pm = PNX_I2C_PM,
 	},
 	.probe = i2c_pnx_probe,
-	.remove = i2c_pnx_remove,
+	.remove_new = i2c_pnx_remove,
 };
 
 static int __init i2c_adap_pnx_init(void)
-- 
2.39.2

