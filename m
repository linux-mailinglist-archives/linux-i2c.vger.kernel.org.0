Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBF156D3771
	for <lists+linux-i2c@lfdr.de>; Sun,  2 Apr 2023 12:55:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230413AbjDBKzl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 2 Apr 2023 06:55:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230415AbjDBKzl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 2 Apr 2023 06:55:41 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 920431BF5B
        for <linux-i2c@vger.kernel.org>; Sun,  2 Apr 2023 03:55:37 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pivMt-0008SR-K8; Sun, 02 Apr 2023 12:55:27 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pivMr-008Qop-Gi; Sun, 02 Apr 2023 12:55:25 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pivMq-009wlK-S2; Sun, 02 Apr 2023 12:55:24 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>, Vignesh R <vigneshr@ti.com>
Cc:     linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org,
        kernel@pengtronix.de, "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-pm@vger.kernel.org
Subject: [PATCH] i2c: omap: Don't do pm_runtime_resume in .remove()
Date:   Sun,  2 Apr 2023 12:55:18 +0200
Message-Id: <20230402105518.2512541-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1710; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=YuO3xNgH6GPTxtI5VYLq6i5csE6lG+Icg93FwUQ/z2U=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkKV8VIYZQ26aaizqS1BwvhCK5/Koz/UEgHsQBZ 3D8nAnNaW2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZClfFQAKCRCPgPtYfRL+ TtWVB/4nKls0puq1UcPdg0iFBHiiJN03d3ido9512BseMSFyy+lTZ6S8cbRf8w6Fq0BDJa3I3BL 7fymnh8VHHP2ZGwar6q6dRQAHATL1vuqR70KWSPtFCLfqF+gcnDAKgwXOSMrScM1w5Lvewr34kn NklZ2CKwMpsfRkWg8nZ7rhaQ7RCi9eHgmGTJfb8rN/R1eIcJoAIQS/XnIiy93CxP7H5eUUyA/0m +epP7yoBuVofi0/zA9kJtDtvEgAdb5JLi76gBQFmtH6/bZFO6l32r0NzxnCWXNXz9Whp7qO5yB5 1I8S+9EG7GZ3mQZyabfGBbTyT5mZb9fC2/oUacadhs3DjNyD
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

One of the first things that the driver's pm_runtime_resume callback
does is to write zero to the OMAP_I2C_CON_REG register.
So there is no need to have the device resumed just to write to the
OMAP_I2C_CON_REG register and the call to pm_runtime_resume_and_get()
can be dropped.

The intended side effect of this commit is to remove an error path of
the function resulting in the remove callback returning a mostly ignored
error code. This prepares changing the prototype of struct
platform_driver's remove callback to return void.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
Hello,

I'm not completely sure that the reasing in the commit log is sound.
There might at least theoretical side effects of the register write
that are different if the device is fully resumed.

Best regards
Uwe

 drivers/i2c/busses/i2c-omap.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-omap.c b/drivers/i2c/busses/i2c-omap.c
index f9ae520aed22..a572f6d994ca 100644
--- a/drivers/i2c/busses/i2c-omap.c
+++ b/drivers/i2c/busses/i2c-omap.c
@@ -1522,16 +1522,12 @@ omap_i2c_probe(struct platform_device *pdev)
 static int omap_i2c_remove(struct platform_device *pdev)
 {
 	struct omap_i2c_dev	*omap = platform_get_drvdata(pdev);
-	int ret;
 
 	i2c_del_adapter(&omap->adapter);
-	ret = pm_runtime_resume_and_get(&pdev->dev);
-	if (ret < 0)
-		return ret;
 
 	omap_i2c_write_reg(omap, OMAP_I2C_CON_REG, 0);
+
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
-	pm_runtime_put_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 	return 0;
 }

base-commit: fe15c26ee26efa11741a7b632e9f23b01aca4cc6
-- 
2.39.2

