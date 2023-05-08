Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF3336FB8D7
	for <lists+linux-i2c@lfdr.de>; Mon,  8 May 2023 22:54:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233450AbjEHUyN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 May 2023 16:54:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233270AbjEHUxy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 May 2023 16:53:54 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92AAE768C
        for <linux-i2c@vger.kernel.org>; Mon,  8 May 2023 13:53:40 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rL-0003sb-TX; Mon, 08 May 2023 22:53:27 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rL-0024tW-78; Mon, 08 May 2023 22:53:27 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rK-002YYO-BI; Mon, 08 May 2023 22:53:26 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Wolfram Sang <wsa@kernel.org>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 57/89] i2c: qup: Convert to platform remove callback returning void
Date:   Mon,  8 May 2023 22:52:34 +0200
Message-Id: <20230508205306.1474415-58-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1711; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=cMwQaR3102BnJJbTY1nqBGDvoaKHegaeKvyAONHzEFY=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkWWD2dtzOAKKOZtwkHEp5UsFuNUWMlBEhqAHdZ Yh1p+/qgsyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFlg9gAKCRCPgPtYfRL+ Tl3XCACO86SfABlvhrBlwYgc6UPKOz+lLT860hSHMrqn5EroX3m/l+o3ZVGk8DCr4ZmEP6l2G8B 5oDHVcgD7fgRZhTYn+B30itPznji50Yv9MEWTTZ06CGqZJVy1u53wex89EKe9quGxrbDYEns0H/ 05uA/xRPrAf+Z2t7r5e+ALAxtFjEe2aT1lvxLY+mQdNAFkWFv/Cgew/xQD//exXFiLku5k57/8I 4bkpgUZzCxCBDKLiUhcoU6Aa719wmivrMFGofusgFYKdg4WHN9Xh7QSGytWQcx/hr7PfJ/GEDxk bOVXeKFrgySc+RcBd1uaMVkFi9YPBst+1u/id2p+UhHo0+oQ
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
 drivers/i2c/busses/i2c-qup.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qup.c b/drivers/i2c/busses/i2c-qup.c
index 2e153f2f71b6..6eef1dbd00de 100644
--- a/drivers/i2c/busses/i2c-qup.c
+++ b/drivers/i2c/busses/i2c-qup.c
@@ -1904,7 +1904,7 @@ static int qup_i2c_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int qup_i2c_remove(struct platform_device *pdev)
+static void qup_i2c_remove(struct platform_device *pdev)
 {
 	struct qup_i2c_dev *qup = platform_get_drvdata(pdev);
 
@@ -1918,7 +1918,6 @@ static int qup_i2c_remove(struct platform_device *pdev)
 	i2c_del_adapter(&qup->adap);
 	pm_runtime_disable(qup->dev);
 	pm_runtime_set_suspended(qup->dev);
-	return 0;
 }
 
 #ifdef CONFIG_PM
@@ -1978,7 +1977,7 @@ MODULE_DEVICE_TABLE(of, qup_i2c_dt_match);
 
 static struct platform_driver qup_i2c_driver = {
 	.probe  = qup_i2c_probe,
-	.remove = qup_i2c_remove,
+	.remove_new = qup_i2c_remove,
 	.driver = {
 		.name = "i2c_qup",
 		.pm = &qup_i2c_qup_pm_ops,
-- 
2.39.2

