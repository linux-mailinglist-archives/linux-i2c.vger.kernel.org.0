Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A5676FB8BD
	for <lists+linux-i2c@lfdr.de>; Mon,  8 May 2023 22:53:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233759AbjEHUxt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 May 2023 16:53:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233343AbjEHUxf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 May 2023 16:53:35 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 935E176AC
        for <linux-i2c@vger.kernel.org>; Mon,  8 May 2023 13:53:30 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rG-0003XR-Md; Mon, 08 May 2023 22:53:22 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rF-0024rw-7O; Mon, 08 May 2023 22:53:21 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rE-002YX9-9Q; Mon, 08 May 2023 22:53:20 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Conor Dooley <conor.dooley@microchip.com>,
        Daire McNamara <daire.mcnamara@microchip.com>,
        Wolfram Sang <wsa@kernel.org>
Cc:     linux-riscv@lists.infradead.org, linux-i2c@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 37/89] i2c: microchip-corei2c: Convert to platform remove callback returning void
Date:   Mon,  8 May 2023 22:52:14 +0200
Message-Id: <20230508205306.1474415-38-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1788; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=lWdXgJ4CxH9qZP1Xdbaoi7MsOoYjB8b3ajtHyZeUpkc=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkWWDPa+5ut0Ft+T6NAEvZvV6QryBo+d6FsCDfy GFgkaPxUBWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFlgzwAKCRCPgPtYfRL+ TvIXB/49cA24WBxNK9hQRxWDY+sCVvQR+IRhBLHEFsbq7lbOL1604nY4WODvwPONw1tytt6mxT2 Nw0mWdTAG7P2BqyzxOYiV8zPGoVn0FbF/Bk4FnPAfMFNLeuAXLuuq68vbVDP+bhSP3FP/EvsN1G 87x3E4X+n6v4e+XpjYA67I3HffxlL2q5O4iprtw/rbo/4+JQDDHL2MSGIzoGugyl8XDyg218ySc +aik23W7aXh2RTjRL3loi/qKyruNQOFGhnlIf4cCVQEfm6JXwj/v1jYM3pj1nLmDCymUUhKK65z qA/+52o1deeoWpvrisi+rvSITmSiTfDJ+G58/JXg9knyCDMx
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
 drivers/i2c/busses/i2c-microchip-corei2c.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-microchip-corei2c.c b/drivers/i2c/busses/i2c-microchip-corei2c.c
index 4d7e9b25f018..7f58f7eaabb6 100644
--- a/drivers/i2c/busses/i2c-microchip-corei2c.c
+++ b/drivers/i2c/busses/i2c-microchip-corei2c.c
@@ -446,14 +446,12 @@ static int mchp_corei2c_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int mchp_corei2c_remove(struct platform_device *pdev)
+static void mchp_corei2c_remove(struct platform_device *pdev)
 {
 	struct mchp_corei2c_dev *idev = platform_get_drvdata(pdev);
 
 	clk_disable_unprepare(idev->i2c_clk);
 	i2c_del_adapter(&idev->adapter);
-
-	return 0;
 }
 
 static const struct of_device_id mchp_corei2c_of_match[] = {
@@ -465,7 +463,7 @@ MODULE_DEVICE_TABLE(of, mchp_corei2c_of_match);
 
 static struct platform_driver mchp_corei2c_driver = {
 	.probe = mchp_corei2c_probe,
-	.remove = mchp_corei2c_remove,
+	.remove_new = mchp_corei2c_remove,
 	.driver = {
 		.name = "microchip-corei2c",
 		.of_match_table = mchp_corei2c_of_match,
-- 
2.39.2

