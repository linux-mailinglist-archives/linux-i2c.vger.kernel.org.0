Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E5F06FB89B
	for <lists+linux-i2c@lfdr.de>; Mon,  8 May 2023 22:53:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233519AbjEHUxa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 May 2023 16:53:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233120AbjEHUxX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 May 2023 16:53:23 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7C125FCD
        for <linux-i2c@vger.kernel.org>; Mon,  8 May 2023 13:53:21 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7r7-00030o-Od; Mon, 08 May 2023 22:53:13 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7r6-0024pf-BE; Mon, 08 May 2023 22:53:12 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7r5-002YVI-Bf; Mon, 08 May 2023 22:53:11 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Wolfram Sang <wsa@kernel.org>,
        ye xingchen <ye.xingchen@zte.com.cn>
Cc:     Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>, linux-i2c@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
Subject: [PATCH 09/89] i2c: bcm2835: Convert to platform remove callback returning void
Date:   Mon,  8 May 2023 22:51:46 +0200
Message-Id: <20230508205306.1474415-10-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1809; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=3vWyVBf2QUAETPX1HDuZTB2esvzCnsLQIF/yCEbL1fY=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkWWBUEWGeQFnQOlcXYz8GHwtRdKpohFFlE3GqH AGGDh5GN+aJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFlgVAAKCRCPgPtYfRL+ TtPSB/97MphhhAebe0w9v1sf7N/yluf91F3R8Y3Yxai2TgNZbrh1MwWFlVLjtP1XwfhCQu0GYr3 tcdHV8fPdg0PI0pFBOuRWrCNvDJCvJdTyxCqTfe1XIQk9bmXMXuP4UnCzBFf83nuUqU3/biaj5T 24Gq6ABX5s1CwXJbH3AlcyuNTRoDZXZ+QlMQJBwLHhW45SI5h1e7tr8zO/f8dSXXHVGWv1Qqfo5 Yn0pTDjofSQ0yzOyW/ibShTJvQ9k2E770OFJ+XsHzkfguT3yewoyiU/5aoePtDmrj7XJlvKMWd7 2o5gRTxGM8fBhlmV1XRWrr/W5KVR03XTfyNadOG6ROtaABtB
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
 drivers/i2c/busses/i2c-bcm2835.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-bcm2835.c b/drivers/i2c/busses/i2c-bcm2835.c
index 09a077b31bfe..8ce6d3f49551 100644
--- a/drivers/i2c/busses/i2c-bcm2835.c
+++ b/drivers/i2c/busses/i2c-bcm2835.c
@@ -503,7 +503,7 @@ static int bcm2835_i2c_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int bcm2835_i2c_remove(struct platform_device *pdev)
+static void bcm2835_i2c_remove(struct platform_device *pdev)
 {
 	struct bcm2835_i2c_dev *i2c_dev = platform_get_drvdata(pdev);
 
@@ -512,8 +512,6 @@ static int bcm2835_i2c_remove(struct platform_device *pdev)
 
 	free_irq(i2c_dev->irq, i2c_dev);
 	i2c_del_adapter(&i2c_dev->adapter);
-
-	return 0;
 }
 
 static const struct of_device_id bcm2835_i2c_of_match[] = {
@@ -525,7 +523,7 @@ MODULE_DEVICE_TABLE(of, bcm2835_i2c_of_match);
 
 static struct platform_driver bcm2835_i2c_driver = {
 	.probe		= bcm2835_i2c_probe,
-	.remove		= bcm2835_i2c_remove,
+	.remove_new	= bcm2835_i2c_remove,
 	.driver		= {
 		.name	= "i2c-bcm2835",
 		.of_match_table = bcm2835_i2c_of_match,
-- 
2.39.2

