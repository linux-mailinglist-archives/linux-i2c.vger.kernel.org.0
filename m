Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 312066FB8BA
	for <lists+linux-i2c@lfdr.de>; Mon,  8 May 2023 22:53:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230101AbjEHUxs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 May 2023 16:53:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233752AbjEHUxd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 May 2023 16:53:33 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A2706EA2
        for <linux-i2c@vger.kernel.org>; Mon,  8 May 2023 13:53:28 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rL-0003qK-6j; Mon, 08 May 2023 22:53:27 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rK-0024tC-De; Mon, 08 May 2023 22:53:26 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rI-002YY3-Lf; Mon, 08 May 2023 22:53:24 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 51/89] i2c: pca-platform: Convert to platform remove callback returning void
Date:   Mon,  8 May 2023 22:52:28 +0200
Message-Id: <20230508205306.1474415-52-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1673; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=elUW5Q1yl7RXWNXESoh+9sbSUl3BGtz9n1PqqcsN8O0=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkWWDui+21rh/igzeXPX4d56uzF4BOnlC+f/mv6 Q0rkaRHN8yJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFlg7gAKCRCPgPtYfRL+ TrODB/4vCnRSrjR4cE4y62nJWk0Z0mDLzgwePyBVJ6Cz8634VOFoFNbS1gUkCDATwBusT/55Wey O+1C8OrB7q/DxbbieApqursLYcV4DHmIcy9lxzIrXzTI3BI/Tyfm8rJO08LDfbkXWBO1VZigKTJ iyxRk5NcSlBsTL1Rj72S7uJrEuyBlOffl4xHw1vbNm++BcG5oba4osvO2WY/P/6m9/VnZYXAmSR cRLAOAr2EAigr3RCAR062JtHO0O77z2h++gRwftqbyHX0ECGPSpoSrtF6Z8tJmEO4HikIgZL39/ cgjAonk5dCX+XqtaazePyCg5CGUdHvJlH2iujV4AW3e0ld8Q
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
 drivers/i2c/busses/i2c-pca-platform.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pca-platform.c b/drivers/i2c/busses/i2c-pca-platform.c
index 86d4f75ef8d3..d2a9e7b61c1a 100644
--- a/drivers/i2c/busses/i2c-pca-platform.c
+++ b/drivers/i2c/busses/i2c-pca-platform.c
@@ -221,13 +221,11 @@ static int i2c_pca_pf_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int i2c_pca_pf_remove(struct platform_device *pdev)
+static void i2c_pca_pf_remove(struct platform_device *pdev)
 {
 	struct i2c_pca_pf_data *i2c = platform_get_drvdata(pdev);
 
 	i2c_del_adapter(&i2c->adap);
-
-	return 0;
 }
 
 #ifdef CONFIG_OF
@@ -241,7 +239,7 @@ MODULE_DEVICE_TABLE(of, i2c_pca_of_match_table);
 
 static struct platform_driver i2c_pca_pf_driver = {
 	.probe = i2c_pca_pf_probe,
-	.remove = i2c_pca_pf_remove,
+	.remove_new = i2c_pca_pf_remove,
 	.driver = {
 		.name = "i2c-pca-platform",
 		.of_match_table = of_match_ptr(i2c_pca_of_match_table),
-- 
2.39.2

