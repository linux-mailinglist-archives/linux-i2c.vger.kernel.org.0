Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1EF3C6FB8D3
	for <lists+linux-i2c@lfdr.de>; Mon,  8 May 2023 22:54:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230226AbjEHUyD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 May 2023 16:54:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233832AbjEHUxp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 May 2023 16:53:45 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82FC37EF1
        for <linux-i2c@vger.kernel.org>; Mon,  8 May 2023 13:53:36 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rM-0003tQ-Ao; Mon, 08 May 2023 22:53:28 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rL-0024ti-Ln; Mon, 08 May 2023 22:53:27 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rK-002YYX-RA; Mon, 08 May 2023 22:53:26 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Chris Brandt <chris.brandt@renesas.com>,
        Wolfram Sang <wsa@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 59/89] i2c: riic: Convert to platform remove callback returning void
Date:   Mon,  8 May 2023 22:52:36 +0200
Message-Id: <20230508205306.1474415-60-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1779; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=DoGZAMK1cJrtoewe6sGBaGPVGXZ1nloGXVVzWJBW1Ug=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkWWD4i6LmLLngDkoINHevSGbGfAKndNdd1SjtK 3pq8bp8IEaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFlg+AAKCRCPgPtYfRL+ TrQOB/9VwNldnGYUQMIbYRjcd7TjG+6o/IF/JfSuPUmTsPxOpBE0M8EH+Ecj1ME5YXfkZ/lLRvz WbPkrP9pwpKfPNaCM4FzFzOGDNUkYMbdvJ74rTauzw9txj2GzbK/S1MC0Dbj1EyC0bbMotcGh3A 7JhMMZ2Bj/5rOjjS3qeCnf75+3rFCyd5Ujg/Cvsv1sjmSOz06nD/arux2firVx5bpnsUhXBvnWc Uu8KsSSZeBGuqbaXOh6IHsEy2Bo7rDxu4ACPlmvxz8aNhlmPhrAg3Z5JVuc5WGqXYAP0VXJrro5 44YO6zeNA1k8vWT9jjZljxZX4RaKDY59AytfVU+qvVG1X1+I
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
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
 drivers/i2c/busses/i2c-riic.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
index 849848ccb080..5f8c0bd508d2 100644
--- a/drivers/i2c/busses/i2c-riic.c
+++ b/drivers/i2c/busses/i2c-riic.c
@@ -477,7 +477,7 @@ static int riic_i2c_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int riic_i2c_remove(struct platform_device *pdev)
+static void riic_i2c_remove(struct platform_device *pdev)
 {
 	struct riic_dev *riic = platform_get_drvdata(pdev);
 
@@ -486,8 +486,6 @@ static int riic_i2c_remove(struct platform_device *pdev)
 	pm_runtime_put(&pdev->dev);
 	i2c_del_adapter(&riic->adapter);
 	pm_runtime_disable(&pdev->dev);
-
-	return 0;
 }
 
 static const struct of_device_id riic_i2c_dt_ids[] = {
@@ -497,7 +495,7 @@ static const struct of_device_id riic_i2c_dt_ids[] = {
 
 static struct platform_driver riic_i2c_driver = {
 	.probe		= riic_i2c_probe,
-	.remove		= riic_i2c_remove,
+	.remove_new	= riic_i2c_remove,
 	.driver		= {
 		.name	= "i2c-riic",
 		.of_match_table = riic_i2c_dt_ids,
-- 
2.39.2

