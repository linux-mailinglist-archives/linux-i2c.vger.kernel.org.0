Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F36306FB8A8
	for <lists+linux-i2c@lfdr.de>; Mon,  8 May 2023 22:53:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233353AbjEHUxi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 May 2023 16:53:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233548AbjEHUx0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 May 2023 16:53:26 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 709FC6A7A
        for <linux-i2c@vger.kernel.org>; Mon,  8 May 2023 13:53:24 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7r5-000309-Mr; Mon, 08 May 2023 22:53:11 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7r4-0024pG-Km; Mon, 08 May 2023 22:53:10 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7r3-002YUy-UD; Mon, 08 May 2023 22:53:09 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org,
        "moderated list:ARM/Microchip" <linux-arm-kernel@lists.infradead.org>,
        kernel@pengutronix.de
Subject: [PATCH 04/89] i2c: at91-core: Convert to platform remove callback returning void
Date:   Mon,  8 May 2023 22:51:41 +0200
Message-Id: <20230508205306.1474415-5-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1796; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=iVE+I0GcPC6Dw07CkAt979X3WjTDWh10ep5T8kGACKg=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkWWBE67ibFG9pLzrxQiSqhay2WTaRKuJJyTazH ow8Vfasno6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFlgRAAKCRCPgPtYfRL+ TsifB/4l8SR2UFEI7NY/zPzyf7lYkqC6C2Fq7cFKyQRNTpkqUH40EyOeZVrXLSr0BjcZAqX0RwZ 01G3pryNm0vkH17Qn94miWk1getmWPGNljQcs67kKqH2LgMN/fhOllbobnavCky2rZ/ZJmS+reS 1YLlFpyHaTt/87si4FhoC7NNfKliA0p6/fCxqa/6JqpWwK6mqRz6zU5L0ZOnyVsqUaeiMELI+ig o+oa+0uhGtOYJt8Zy7mXYIjG4VfBEt8jD1HWVH6c9L5RXiOBIL9ZxWvyr/OwmbeLmzY7tZzJSWs YxtZv0iljEzGWB5+tWCOYTWrWoKtR9F7UuI6isGd5c4+ejdY
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
 drivers/i2c/busses/i2c-at91-core.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-at91-core.c b/drivers/i2c/busses/i2c-at91-core.c
index 2df9df585131..05ad3bc3578a 100644
--- a/drivers/i2c/busses/i2c-at91-core.c
+++ b/drivers/i2c/busses/i2c-at91-core.c
@@ -273,7 +273,7 @@ static int at91_twi_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int at91_twi_remove(struct platform_device *pdev)
+static void at91_twi_remove(struct platform_device *pdev)
 {
 	struct at91_twi_dev *dev = platform_get_drvdata(pdev);
 
@@ -282,8 +282,6 @@ static int at91_twi_remove(struct platform_device *pdev)
 
 	pm_runtime_disable(dev->dev);
 	pm_runtime_set_suspended(dev->dev);
-
-	return 0;
 }
 
 static int __maybe_unused at91_twi_runtime_suspend(struct device *dev)
@@ -342,7 +340,7 @@ static const struct dev_pm_ops __maybe_unused at91_twi_pm = {
 
 static struct platform_driver at91_twi_driver = {
 	.probe		= at91_twi_probe,
-	.remove		= at91_twi_remove,
+	.remove_new	= at91_twi_remove,
 	.id_table	= at91_twi_devtypes,
 	.driver		= {
 		.name	= "at91_i2c",
-- 
2.39.2

