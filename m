Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9936E6FB8AD
	for <lists+linux-i2c@lfdr.de>; Mon,  8 May 2023 22:53:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233619AbjEHUxk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 May 2023 16:53:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233718AbjEHUx1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 May 2023 16:53:27 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5961E6A48
        for <linux-i2c@vger.kernel.org>; Mon,  8 May 2023 13:53:26 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7r9-000308-NO; Mon, 08 May 2023 22:53:15 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7r4-0024pC-EM; Mon, 08 May 2023 22:53:10 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7r3-002YUu-K0; Mon, 08 May 2023 22:53:09 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Brendan Higgins <brendan.higgins@linux.dev>,
        Wolfram Sang <wsa@kernel.org>
Cc:     Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>, linux-i2c@vger.kernel.org,
        openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, kernel@pengutronix.de
Subject: [PATCH 03/89] i2c: aspeed: Convert to platform remove callback returning void
Date:   Mon,  8 May 2023 22:51:40 +0200
Message-Id: <20230508205306.1474415-4-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1714; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=9zNsI5stUnuhq0FHylihgdIHvTwSQVOvrt5eEDRxnsI=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkWWBDUvMtm/WjKIGQSlttusSEAyRutYR/7+6F6 jlZk3FRObOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFlgQwAKCRCPgPtYfRL+ ToVqB/wIJjh1M34I9n3/oezujnyyemKFn4RZb2KZy4OIRwmftRZXK2Yhjpb9OaZ/k5qxecJvB8f r2D73urArwe+CdbB1S3SbNbXloErOdQjJrMlLhCE6rPrM1hE+XCN2lB1eBVu23W1f7hHBC+a8hB ZXZmtCHGCCyvuXHkSjELSgac9dpcyQZxoTCbS/ZHdr7ZFkpoqJwbnkrrRyAszA/WUsnQEr1WfVg CpBfiY/7PI+vebi6Bzi8Jkesww4ufpQDkTcTK45uEDgTr5epLjf2lwb6J0Z25jCZ6ZWgRaekqf+ BS1Q0Xc+M037lingsnv6BfzDV43v+5axIqlRsF3gnasQGQLj
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
 drivers/i2c/busses/i2c-aspeed.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
index d3c99c5b3247..2e5acfeb76c8 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -1061,7 +1061,7 @@ static int aspeed_i2c_probe_bus(struct platform_device *pdev)
 	return 0;
 }
 
-static int aspeed_i2c_remove_bus(struct platform_device *pdev)
+static void aspeed_i2c_remove_bus(struct platform_device *pdev)
 {
 	struct aspeed_i2c_bus *bus = platform_get_drvdata(pdev);
 	unsigned long flags;
@@ -1077,13 +1077,11 @@ static int aspeed_i2c_remove_bus(struct platform_device *pdev)
 	reset_control_assert(bus->rst);
 
 	i2c_del_adapter(&bus->adap);
-
-	return 0;
 }
 
 static struct platform_driver aspeed_i2c_bus_driver = {
 	.probe		= aspeed_i2c_probe_bus,
-	.remove		= aspeed_i2c_remove_bus,
+	.remove_new	= aspeed_i2c_remove_bus,
 	.driver		= {
 		.name		= "aspeed-i2c-bus",
 		.of_match_table	= aspeed_i2c_bus_of_table,
-- 
2.39.2

