Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F26F6FB8B0
	for <lists+linux-i2c@lfdr.de>; Mon,  8 May 2023 22:53:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233637AbjEHUxm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 May 2023 16:53:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233445AbjEHUx3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 May 2023 16:53:29 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 070AD5FCD
        for <linux-i2c@vger.kernel.org>; Mon,  8 May 2023 13:53:27 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rF-0003U0-K8; Mon, 08 May 2023 22:53:21 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rE-0024rb-0u; Mon, 08 May 2023 22:53:20 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rD-002YWr-1g; Mon, 08 May 2023 22:53:19 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Paul Cercueil <paul@crapouillou.net>, Wolfram Sang <wsa@kernel.org>
Cc:     linux-mips@vger.kernel.org, linux-i2c@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 33/89] i2c: jz4780: Convert to platform remove callback returning void
Date:   Mon,  8 May 2023 22:52:10 +0200
Message-Id: <20230508205306.1474415-34-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1562; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=HeR9bjg9i4PeuVkJS6mKJavJIthqb+vT2054zWfAdLQ=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkWWDF2HdeyB3FO7wpAHZEJQGjLzw7ccYgPBu+I 8dHv+0jIAqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFlgxQAKCRCPgPtYfRL+ TrnNB/40vW3Aeid36otu2jNLmRHbgFoSX9IQRqM7jC7zI6fEfKYa1P6va3lmpd/XrXAv2kLCst+ PTVKOKb508IVU2kbchbPBBDdrnWTlTfxfsWafVDDSCnb3bwuYJyHB0sB9VtxOmjqHI+YMD5dIDu P5SSGPTyW+c436GaTYoSvFecBkZ5+rqPvs5phW7j/cgthlVsvG+4OP+D7aDXPvlKt/ORhbH3+5I yPHIX3jfGDFK0cDjFyrU8COO5IdQhuKbjZrpit02D8/l6Ec9f87ugWo1W0QoSvWMBZiiiCMFiDw 4QwpB+1pOqw4gBPu1BsL2U/6xnRkgxKY6KaIxcpvkIEAufOE
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
 drivers/i2c/busses/i2c-jz4780.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-jz4780.c b/drivers/i2c/busses/i2c-jz4780.c
index baa7319eee53..0dfe60399521 100644
--- a/drivers/i2c/busses/i2c-jz4780.c
+++ b/drivers/i2c/busses/i2c-jz4780.c
@@ -845,18 +845,17 @@ static int jz4780_i2c_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int jz4780_i2c_remove(struct platform_device *pdev)
+static void jz4780_i2c_remove(struct platform_device *pdev)
 {
 	struct jz4780_i2c *i2c = platform_get_drvdata(pdev);
 
 	clk_disable_unprepare(i2c->clk);
 	i2c_del_adapter(&i2c->adap);
-	return 0;
 }
 
 static struct platform_driver jz4780_i2c_driver = {
 	.probe		= jz4780_i2c_probe,
-	.remove		= jz4780_i2c_remove,
+	.remove_new	= jz4780_i2c_remove,
 	.driver		= {
 		.name	= "jz4780-i2c",
 		.of_match_table = jz4780_i2c_of_matches,
-- 
2.39.2

