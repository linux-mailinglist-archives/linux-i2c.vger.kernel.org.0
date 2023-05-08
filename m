Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D830E6FB8E0
	for <lists+linux-i2c@lfdr.de>; Mon,  8 May 2023 22:54:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233888AbjEHUyL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 May 2023 16:54:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232313AbjEHUxx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 May 2023 16:53:53 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5ED47D97
        for <linux-i2c@vger.kernel.org>; Mon,  8 May 2023 13:53:39 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rO-0003vh-0R; Mon, 08 May 2023 22:53:30 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rN-0024uD-9E; Mon, 08 May 2023 22:53:29 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rM-002YYy-Fk; Mon, 08 May 2023 22:53:28 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Wolfram Sang <wsa@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 66/89] i2c: sh_mobile: Convert to platform remove callback returning void
Date:   Mon,  8 May 2023 22:52:43 +0200
Message-Id: <20230508205306.1474415-67-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1674; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=RZI9X+tkQKRCfbQfnV71UvCRcBWJ+nKwVvCHyBiV+Fw=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkWWEASdARfItUzk/gHKHGwc6q0/L8xYog930lG REgdIX7q++JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFlhAAAKCRCPgPtYfRL+ TimQB/9xWi2XTMBJvq/sTm/+AS4sqmARo8JOzntZehSH3l1X0qVEZ4xZv0UXhPLZ2AbMjfbRlfN A6NZR6Q6vtEApn2pRAzoiDKqIK0r+/qeEYQiXjETtzH7p3WNDp4MenbZghZCF3iL+y5mPK6I/1g n4myRWnB6CXnxw7kYBMx+zHcOGECWg14eyNDOAHENLRgZsjd5i10GaZNmtHFRzZf3nmk8akcgUw e1ttBcLxXt5hYP/eODulsFcy5J1K/9hkQ7druR1PfJMZNV2kf8y/GQAEzNp7107OidjjS1o/VQG 4Q6J6HWym6dHpAsIAToVRRjfZGWiiMjtbLEr/3HYDz7xa50/
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
 drivers/i2c/busses/i2c-sh_mobile.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-sh_mobile.c b/drivers/i2c/busses/i2c-sh_mobile.c
index 29330ee64c9c..21717b943a9e 100644
--- a/drivers/i2c/busses/i2c-sh_mobile.c
+++ b/drivers/i2c/busses/i2c-sh_mobile.c
@@ -956,14 +956,13 @@ static int sh_mobile_i2c_probe(struct platform_device *dev)
 	return 0;
 }
 
-static int sh_mobile_i2c_remove(struct platform_device *dev)
+static void sh_mobile_i2c_remove(struct platform_device *dev)
 {
 	struct sh_mobile_i2c_data *pd = platform_get_drvdata(dev);
 
 	i2c_del_adapter(&pd->adap);
 	sh_mobile_i2c_release_dma(pd);
 	pm_runtime_disable(&dev->dev);
-	return 0;
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -1000,7 +999,7 @@ static struct platform_driver sh_mobile_i2c_driver = {
 		.pm	= DEV_PM_OPS,
 	},
 	.probe		= sh_mobile_i2c_probe,
-	.remove		= sh_mobile_i2c_remove,
+	.remove_new	= sh_mobile_i2c_remove,
 };
 
 static int __init sh_mobile_i2c_adap_init(void)
-- 
2.39.2

