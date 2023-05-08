Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43A7F6FB8AC
	for <lists+linux-i2c@lfdr.de>; Mon,  8 May 2023 22:53:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233588AbjEHUxj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 May 2023 16:53:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233619AbjEHUx1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 May 2023 16:53:27 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 913A05FEF
        for <linux-i2c@vger.kernel.org>; Mon,  8 May 2023 13:53:25 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rF-0003U1-RF; Mon, 08 May 2023 22:53:21 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rE-0024rc-17; Mon, 08 May 2023 22:53:20 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rD-002YWu-8S; Mon, 08 May 2023 22:53:19 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Wolfram Sang <wsa@kernel.org>,
        Chris Pringle <chris.pringle@phabrix.com>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 34/89] i2c: kempld: Convert to platform remove callback returning void
Date:   Mon,  8 May 2023 22:52:11 +0200
Message-Id: <20230508205306.1474415-35-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1742; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=gwhHVqeo+2jOEYfzaQobcvsEVDA2uTuD5q2wKSzWE64=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkWWDH8sDjhPa2q37UUD+xI95s/fECG0AFK68ua YUp03tBYBuJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFlgxwAKCRCPgPtYfRL+ TjMuB/9byUo5Ej13Qu5x73dPQLyp8xHpkPh5Mz0NYuMUTGEuEJigYxXt7MPnFpYrh7OSoWPFKtt 7HGKsVhjRmIAeWtoKeuj/+tzXQH7tlbDp/F1ZdpvF6f8O20+cuS+CdpfUr8XPk+1IcfjP+ryQpC Jho6CyPISpgZAZS11vo8LXPvIHarTE7zyfjsIrZKAcrO7dxKruYqBg3tZ6VBtC7QMevjLkLP9s1 tA3dlcLK2v2N43NncXNTWlFUMbHi+Mz1r3mFxJkHfAIZkLl3l4dg6H5HF5rZXFfKXJBDuTy1qr9 6sWIassy4JWXEDK+4TTdbPMelLBAVZBSc6wzXZZG4a6UUD6i
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
 drivers/i2c/busses/i2c-kempld.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-kempld.c b/drivers/i2c/busses/i2c-kempld.c
index cf857cf22507..281058e3ea46 100644
--- a/drivers/i2c/busses/i2c-kempld.c
+++ b/drivers/i2c/busses/i2c-kempld.c
@@ -329,7 +329,7 @@ static int kempld_i2c_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int kempld_i2c_remove(struct platform_device *pdev)
+static void kempld_i2c_remove(struct platform_device *pdev)
 {
 	struct kempld_i2c_data *i2c = platform_get_drvdata(pdev);
 	struct kempld_device_data *pld = i2c->pld;
@@ -348,8 +348,6 @@ static int kempld_i2c_remove(struct platform_device *pdev)
 	kempld_release_mutex(pld);
 
 	i2c_del_adapter(&i2c->adap);
-
-	return 0;
 }
 
 #ifdef CONFIG_PM
@@ -389,7 +387,7 @@ static struct platform_driver kempld_i2c_driver = {
 		.name = "kempld-i2c",
 	},
 	.probe		= kempld_i2c_probe,
-	.remove		= kempld_i2c_remove,
+	.remove_new	= kempld_i2c_remove,
 	.suspend	= kempld_i2c_suspend,
 	.resume		= kempld_i2c_resume,
 };
-- 
2.39.2

