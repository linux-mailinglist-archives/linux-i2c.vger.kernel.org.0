Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 388EC6FB8AE
	for <lists+linux-i2c@lfdr.de>; Mon,  8 May 2023 22:53:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233718AbjEHUxk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 May 2023 16:53:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233613AbjEHUx2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 May 2023 16:53:28 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6F7E5FC5
        for <linux-i2c@vger.kernel.org>; Mon,  8 May 2023 13:53:26 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rE-0003Nw-9k; Mon, 08 May 2023 22:53:20 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rC-0024rK-Jx; Mon, 08 May 2023 22:53:18 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rB-002YWe-Vb; Mon, 08 May 2023 22:53:17 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Oleksij Rempel <linux@rempel-privat.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Wolfram Sang <wsa@kernel.org>
Cc:     Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel@pengutronix.de
Subject: [PATCH 30/89] i2c: imx: Convert to platform remove callback returning void
Date:   Mon,  8 May 2023 22:52:07 +0200
Message-Id: <20230508205306.1474415-31-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1765; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=8be9+tt6UEpvuhg5VfGNgaLy7GQrr4GavEofKxeZVYg=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkWWCzYX51KIdsGdURFeBC2vjFW40EXnmTqlXrA eFnra02yLmJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFlgswAKCRCPgPtYfRL+ TsK3B/9pkLI5f2llSTSGIPWk91CfBhGwJUIMtcUA+kVOW57R54m+vf7K9AZFgVQNsRa+NP7nvnH efv7jwe4T+BiOigVxkhJwy8Q4Z34JjKyIDFOrkyso55u4FwFN+GRScKTzzD24cUit/g2ydnS03x DsqQiAvyEACWJaWg79sm17p+Fvb+iHfwxwfqvQ3SlUvEolOM6IM1x6Qfbfc1NqkYqRR9EpApdAf cEhRuSRxYy7mPW2Py94RFC1UwicTFfv4hOUi/0ntNIgtiwvkfUguIeTRw/jQZrF7RqmR7MdApYM Zi/WxSio59GDIOPMN5wpbyTs0Okix4ZqArwT6hWcpZ7I91Fr
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
 drivers/i2c/busses/i2c-imx.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 42189a5f2905..65128a73e8a3 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1561,7 +1561,7 @@ static int i2c_imx_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int i2c_imx_remove(struct platform_device *pdev)
+static void i2c_imx_remove(struct platform_device *pdev)
 {
 	struct imx_i2c_struct *i2c_imx = platform_get_drvdata(pdev);
 	int irq, ret;
@@ -1592,8 +1592,6 @@ static int i2c_imx_remove(struct platform_device *pdev)
 
 	pm_runtime_put_noidle(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
-
-	return 0;
 }
 
 static int __maybe_unused i2c_imx_runtime_suspend(struct device *dev)
@@ -1624,7 +1622,7 @@ static const struct dev_pm_ops i2c_imx_pm_ops = {
 
 static struct platform_driver i2c_imx_driver = {
 	.probe = i2c_imx_probe,
-	.remove = i2c_imx_remove,
+	.remove_new = i2c_imx_remove,
 	.driver = {
 		.name = DRIVER_NAME,
 		.pm = &i2c_imx_pm_ops,
-- 
2.39.2

