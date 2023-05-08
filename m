Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F1F46FB8EA
	for <lists+linux-i2c@lfdr.de>; Mon,  8 May 2023 22:54:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233277AbjEHUyV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 May 2023 16:54:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233828AbjEHUyD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 May 2023 16:54:03 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF36872A0
        for <linux-i2c@vger.kernel.org>; Mon,  8 May 2023 13:53:47 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rQ-00041g-RE; Mon, 08 May 2023 22:53:32 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rQ-0024v8-2N; Mon, 08 May 2023 22:53:32 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rP-002YZe-Ap; Mon, 08 May 2023 22:53:31 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel@pengutronix.de
Subject: [PATCH 76/89] i2c: uniphier: Convert to platform remove callback returning void
Date:   Mon,  8 May 2023 22:52:53 +0200
Message-Id: <20230508205306.1474415-77-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1733; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=Do02+OskPABT0EhegBqoAQRR15iQhMIyu5txr5nXieA=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkWWEMrXEBRgNnvpS+KzwESHwb4PP+Yn8NsbnTz c5Z06yXrRiJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFlhDAAKCRCPgPtYfRL+ TlpdB/9mpF6wqeGmNoCaP7kyn5T4RRsDgOd1AzBq8ark2Q4Zc4O/Qnd1uPZqnYKWEl+hx2twCPs v6AkblSEjj5hwjoJFxj8P5m43a1jvKfVkJ7WNLY7ftFseYnOXwEjb9dhRzOd5JrTLU9w67MzjrQ Efu6rfNFjkwWLAiOx1f0RioZYhsVT2Be9500SejKVYnL/mgBh7Yr/foo8O+eKs7D0PaG0NYtfpw 0p9qq1R95xqDIEU9gha1Yxiw97gqEaxe7a2FtCyheuDajfAEvmalygCmnBh8jrhRVotg8Zxrn5a /mHBccA0VqvsUDpGPXVQJkOr+UlOEu0UQDr1SKd6OGjOCjo7
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
 drivers/i2c/busses/i2c-uniphier.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-uniphier.c b/drivers/i2c/busses/i2c-uniphier.c
index e3ebae381f08..96b1eb7489a3 100644
--- a/drivers/i2c/busses/i2c-uniphier.c
+++ b/drivers/i2c/busses/i2c-uniphier.c
@@ -380,14 +380,12 @@ static int uniphier_i2c_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int uniphier_i2c_remove(struct platform_device *pdev)
+static void uniphier_i2c_remove(struct platform_device *pdev)
 {
 	struct uniphier_i2c_priv *priv = platform_get_drvdata(pdev);
 
 	i2c_del_adapter(&priv->adap);
 	clk_disable_unprepare(priv->clk);
-
-	return 0;
 }
 
 static int __maybe_unused uniphier_i2c_suspend(struct device *dev)
@@ -425,7 +423,7 @@ MODULE_DEVICE_TABLE(of, uniphier_i2c_match);
 
 static struct platform_driver uniphier_i2c_drv = {
 	.probe  = uniphier_i2c_probe,
-	.remove = uniphier_i2c_remove,
+	.remove_new = uniphier_i2c_remove,
 	.driver = {
 		.name  = "uniphier-i2c",
 		.of_match_table = uniphier_i2c_match,
-- 
2.39.2

