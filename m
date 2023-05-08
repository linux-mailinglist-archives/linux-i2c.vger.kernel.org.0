Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 679EB6FB8B1
	for <lists+linux-i2c@lfdr.de>; Mon,  8 May 2023 22:53:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233750AbjEHUxn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 May 2023 16:53:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233235AbjEHUxc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 May 2023 16:53:32 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4C4D6EB1
        for <linux-i2c@vger.kernel.org>; Mon,  8 May 2023 13:53:27 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rI-0003bD-G7; Mon, 08 May 2023 22:53:24 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rH-0024sQ-7k; Mon, 08 May 2023 22:53:23 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rG-002YXY-8k; Mon, 08 May 2023 22:53:22 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Gregory CLEMENT <gregory.clement@bootlin.com>,
        Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 43/89] i2c: mv64xxx: Convert to platform remove callback returning void
Date:   Mon,  8 May 2023 22:52:20 +0200
Message-Id: <20230508205306.1474415-44-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1779; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=S1JAp2phzx9pbvOyN8fmS+giEPsO3OffwhyRoxeJDyw=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkWWDghCppqNGCtYOoOOBD1rdNPkqa9P6T7EXu3 u6Al7DEFnCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFlg4AAKCRCPgPtYfRL+ TunJB/0SiMAFRQ/cGw8LasVJHXNMh+8ejgNQ6iKV8z68e5aNg9VzPaSsEQXTWj8pHWGT9VIC1dR XPbg8Lu24r6K0W4tPijx0lm6Vt1hGGTZXNvZjEpt7DMk/ylZ7gDxaNWs3kSBeva8FCMQ3QWox7A Pth8YWOs2oXN5tlvCksSL6pSLOAwPhHaeDiGPqMvdKqTWY9iO+L52jcXzAzRneBRcFzlHCvUddi m3i6jvp0B8I7bY+SZOkNrpe8Mparaa3VRWMIa4gAHLCbsaHsY22eZfOr5Af7lzDUrsHSZNCovQf iqasDW8t8b57+wU3P166KEhRNDbwiwCNSOnhTRi9YCGSSU2r
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
 drivers/i2c/busses/i2c-mv64xxx.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mv64xxx.c b/drivers/i2c/busses/i2c-mv64xxx.c
index 047dfef7a657..30fd688e12d9 100644
--- a/drivers/i2c/busses/i2c-mv64xxx.c
+++ b/drivers/i2c/busses/i2c-mv64xxx.c
@@ -1073,7 +1073,7 @@ mv64xxx_i2c_probe(struct platform_device *pd)
 	return rc;
 }
 
-static int
+static void
 mv64xxx_i2c_remove(struct platform_device *pd)
 {
 	struct mv64xxx_i2c_data		*drv_data = platform_get_drvdata(pd);
@@ -1083,8 +1083,6 @@ mv64xxx_i2c_remove(struct platform_device *pd)
 	pm_runtime_disable(&pd->dev);
 	if (!pm_runtime_status_suspended(&pd->dev))
 		mv64xxx_i2c_runtime_suspend(&pd->dev);
-
-	return 0;
 }
 
 static const struct dev_pm_ops mv64xxx_i2c_pm_ops = {
@@ -1096,7 +1094,7 @@ static const struct dev_pm_ops mv64xxx_i2c_pm_ops = {
 
 static struct platform_driver mv64xxx_i2c_driver = {
 	.probe	= mv64xxx_i2c_probe,
-	.remove	= mv64xxx_i2c_remove,
+	.remove_new = mv64xxx_i2c_remove,
 	.driver	= {
 		.name	= MV64XXX_I2C_CTLR_NAME,
 		.pm     = &mv64xxx_i2c_pm_ops,
-- 
2.39.2

