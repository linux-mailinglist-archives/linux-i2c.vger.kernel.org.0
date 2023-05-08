Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CC116FB8BB
	for <lists+linux-i2c@lfdr.de>; Mon,  8 May 2023 22:53:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233401AbjEHUxs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 May 2023 16:53:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233759AbjEHUxd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 May 2023 16:53:33 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E82A768F
        for <linux-i2c@vger.kernel.org>; Mon,  8 May 2023 13:53:29 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rG-0003Xa-QU; Mon, 08 May 2023 22:53:22 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rF-0024rz-9P; Mon, 08 May 2023 22:53:21 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rE-002YXC-Gl; Mon, 08 May 2023 22:53:20 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Khalil Blaiech <kblaiech@nvidia.com>,
        Asmaa Mnebhi <asmaa@nvidia.com>, Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 38/89] i2c: mlxbf: Convert to platform remove callback returning void
Date:   Mon,  8 May 2023 22:52:15 +0200
Message-Id: <20230508205306.1474415-39-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1686; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=MuVm6e1T4mAqIKpFoy/dJqvxdlH2NAgR+egPZY4RN20=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkWWDQFOI7637BFl8THG02bswZKn1KnzGCX++6j b4L9oCD4EKJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFlg0AAKCRCPgPtYfRL+ ThWiB/9u7XIdre/DJN36tSMyzlfGkkRfhyIGZJYeXLyr3ljjH6gMkadeAo86NKLFggrzCgolo+V Q4IbRUIUvTeWokyrUGvE+5rxSRIYlSNsTZ2dK0idhRo1G3LyGbCk5YalFmyBzMb9zQbmZuz17fK 7aht9xH3JC4vvMCVe/O/WEoWwC4/JZgYIi/tQAjqn3NpRMWW7/HmljepTmN2lBGLX9SPNvevGRY 53xWbG/wHgQ66kWsnhTPnu/o5wPeqDC7Qo6Gx3Nb5T2ewp9v+RG6Uwws18VCjhlJ2H5b7zMJpcK 0AViWPpH4sJXEz3FDVuhnWNJ98nCw+wFOG36JE40vjQr7Ngw
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
 drivers/i2c/busses/i2c-mlxbf.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mlxbf.c b/drivers/i2c/busses/i2c-mlxbf.c
index 1810d5791b3d..ae66bdd1b737 100644
--- a/drivers/i2c/busses/i2c-mlxbf.c
+++ b/drivers/i2c/busses/i2c-mlxbf.c
@@ -2433,7 +2433,7 @@ static int mlxbf_i2c_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int mlxbf_i2c_remove(struct platform_device *pdev)
+static void mlxbf_i2c_remove(struct platform_device *pdev)
 {
 	struct mlxbf_i2c_priv *priv = platform_get_drvdata(pdev);
 	struct device *dev = &pdev->dev;
@@ -2474,13 +2474,11 @@ static int mlxbf_i2c_remove(struct platform_device *pdev)
 	devm_free_irq(dev, priv->irq, priv);
 
 	i2c_del_adapter(&priv->adap);
-
-	return 0;
 }
 
 static struct platform_driver mlxbf_i2c_driver = {
 	.probe = mlxbf_i2c_probe,
-	.remove = mlxbf_i2c_remove,
+	.remove_new = mlxbf_i2c_remove,
 	.driver = {
 		.name = "i2c-mlxbf",
 		.acpi_match_table = ACPI_PTR(mlxbf_i2c_acpi_ids),
-- 
2.39.2

