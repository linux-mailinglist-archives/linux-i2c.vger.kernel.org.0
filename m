Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3AA5B6FB8D2
	for <lists+linux-i2c@lfdr.de>; Mon,  8 May 2023 22:54:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233155AbjEHUyC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 May 2023 16:54:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230226AbjEHUxp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 May 2023 16:53:45 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26ECB6A48
        for <linux-i2c@vger.kernel.org>; Mon,  8 May 2023 13:53:35 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rL-0003qT-71; Mon, 08 May 2023 22:53:27 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rK-0024tD-E5; Mon, 08 May 2023 22:53:26 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rJ-002YYH-Ou; Mon, 08 May 2023 22:53:25 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <rfoss@kernel.org>, Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 55/89] i2c: qcom-cci: Convert to platform remove callback returning void
Date:   Mon,  8 May 2023 22:52:32 +0200
Message-Id: <20230508205306.1474415-56-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1738; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=9mqOpKIJTDH+bclVnU/BahqDcFuq8GynCor3tvL6Vks=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkWWDzvp6FkEmLJ7PU/R70HNJyENy2SFqU24E26 L7/bPaPmWSJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFlg8wAKCRCPgPtYfRL+ Tg3GCAC4s4xmHiCPaEDTwamBxL6YzAurq5yr7DFUT+OCsrTzkWU92j1b4vYfo3ra3yR5hNpxFZg vMCgbUIzByQef9ZFXWwIcQlNDd/HZ/d6+eqWzVd9874WRzKY5L0A4SwTmmrFuLAO0UzAurzvxIk 8Ood6naT22K2YIufo72OxtipW4CRXaMrzoiKASG59Nhr55Va1eI31R8Iy76VJcDy9+fK1t7fGXI 0XNsvPBvuaGx46ILVaeDB02nEU8RVtHS0fQTxx2j3wODZAuwMqapxwjF1NBMipzBjOP1ufS3TAl /df3eka8zAgltlE59xMZdIW6MM+rYuX91JiIEcoB+wQGo/dv
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
 drivers/i2c/busses/i2c-qcom-cci.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index 01358472680c..58860014e068 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -675,7 +675,7 @@ static int cci_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int cci_remove(struct platform_device *pdev)
+static void cci_remove(struct platform_device *pdev)
 {
 	struct cci *cci = platform_get_drvdata(pdev);
 	int i;
@@ -691,8 +691,6 @@ static int cci_remove(struct platform_device *pdev)
 	disable_irq(cci->irq);
 	pm_runtime_disable(&pdev->dev);
 	pm_runtime_set_suspended(&pdev->dev);
-
-	return 0;
 }
 
 static const struct cci_data cci_v1_data = {
@@ -829,7 +827,7 @@ MODULE_DEVICE_TABLE(of, cci_dt_match);
 
 static struct platform_driver qcom_cci_driver = {
 	.probe  = cci_probe,
-	.remove = cci_remove,
+	.remove_new = cci_remove,
 	.driver = {
 		.name = "i2c-qcom-cci",
 		.of_match_table = cci_dt_match,
-- 
2.39.2

