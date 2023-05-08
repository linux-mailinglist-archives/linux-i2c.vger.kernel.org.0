Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BBE86FB893
	for <lists+linux-i2c@lfdr.de>; Mon,  8 May 2023 22:53:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229637AbjEHUx0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 May 2023 16:53:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232428AbjEHUxW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 May 2023 16:53:22 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C6D459EB
        for <linux-i2c@vger.kernel.org>; Mon,  8 May 2023 13:53:21 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7r7-00030u-Cz; Mon, 08 May 2023 22:53:13 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7r6-0024pm-Nt; Mon, 08 May 2023 22:53:12 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7r5-002YVO-TR; Mon, 08 May 2023 22:53:11 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Michal Simek <michal.simek@amd.com>, Wolfram Sang <wsa@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 11/89] i2c: cadence: Convert to platform remove callback returning void
Date:   Mon,  8 May 2023 22:51:48 +0200
Message-Id: <20230508205306.1474415-12-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1775; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=lKypbG8KCHCKZLdnFyqLylVadlzIG4rqiEJBrMcxZdw=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkWWBWl6s4hykC8IMlipNgVGUqqF6vCTwn9A9sp JvChgTln62JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFlgVgAKCRCPgPtYfRL+ Tl3wCACS3oQ9ciMg6DdGSevvauaGbxDXXpo+lsf/6CD6wQ82sZ8fFaEBtwZaLwVsz3NQA+ID76B 2SZ4HVxxHr1bNvScFrx+ndIyCKL6hRHwbr+CSvO/ixgF0DIQ7Sr8e5PNuVigFpDt3RiaQnVbXb7 S7cddSEGPVqT/0Y6z7mg+BH4MHv8Fw3JNnXVFzxy5XhjwoiJaBiVcO0CoHTQshWqBmJuuNG57mA PkQ61ZuiV6eW524pGiqnjzFkJpExyUO4sQx6cZbpfTEbvdy7EEJngeaqnpEX00dNlGbkbP66Na1 wmXkPUrkoSln1Uv2eInDwwZt9G67BdHseGryMSyv739sORke
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
 drivers/i2c/busses/i2c-cadence.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
index 3a4edf7e75f9..9849f4502570 100644
--- a/drivers/i2c/busses/i2c-cadence.c
+++ b/drivers/i2c/busses/i2c-cadence.c
@@ -1415,7 +1415,7 @@ static int cdns_i2c_probe(struct platform_device *pdev)
  *
  * Return: 0 always
  */
-static int cdns_i2c_remove(struct platform_device *pdev)
+static void cdns_i2c_remove(struct platform_device *pdev)
 {
 	struct cdns_i2c *id = platform_get_drvdata(pdev);
 
@@ -1427,8 +1427,6 @@ static int cdns_i2c_remove(struct platform_device *pdev)
 	clk_notifier_unregister(id->clk, &id->clk_rate_change_nb);
 	reset_control_assert(id->reset);
 	clk_disable_unprepare(id->clk);
-
-	return 0;
 }
 
 static struct platform_driver cdns_i2c_drv = {
@@ -1438,7 +1436,7 @@ static struct platform_driver cdns_i2c_drv = {
 		.pm = &cdns_i2c_dev_pm_ops,
 	},
 	.probe  = cdns_i2c_probe,
-	.remove = cdns_i2c_remove,
+	.remove_new = cdns_i2c_remove,
 };
 
 module_platform_driver(cdns_i2c_drv);
-- 
2.39.2

