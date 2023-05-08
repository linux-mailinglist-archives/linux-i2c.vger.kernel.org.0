Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A59F86FB88B
	for <lists+linux-i2c@lfdr.de>; Mon,  8 May 2023 22:53:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229961AbjEHUxW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 May 2023 16:53:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229532AbjEHUxS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 May 2023 16:53:18 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E94EC5BAE
        for <linux-i2c@vger.kernel.org>; Mon,  8 May 2023 13:53:16 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7r5-000305-ME; Mon, 08 May 2023 22:53:11 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7r4-0024p4-7G; Mon, 08 May 2023 22:53:10 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7r3-002YUr-CJ; Mon, 08 May 2023 22:53:09 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Elie Morisse <syniurge@gmail.com>,
        Shyam Sundar S K <shyam-sundar.s-k@amd.com>,
        Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 02/89] i2c: amd-mp2-plat: Convert to platform remove callback returning void
Date:   Mon,  8 May 2023 22:51:39 +0200
Message-Id: <20230508205306.1474415-3-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1879; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=fU6sgW9WsE/ZEZTnPfM1rQtl4b0Sk3rDpB+UR+nrs4I=; b=owGbwMvMwMXY3/A7olbonx/jabUkhpTIBKdoX2Ev1kC1agdNiw3OOcY3Je1er7PO0w5u336nS M+rYF0nozELAyMXg6yYIot945pMqyq5yM61/y7DDGJlApnCwMUpABNRm8fBML1JK4/vWtU/09sn 56jFBP4r7BQwqFOT6qtbPGtXb1a03ZSdqfO6OvyMhPdk37MSWBnX/7vY9ar54V7fH3qrkpSXGty 8vvhzy8vTom9UGSNdjkWqBi3bsve1ZvY9s5M85aoLJ+blrIt50mtZre9erqg/b5Zvm+XW6Ys0Q5 zMbu9xr0+bq+S2JuKk+spXc8/80jiz6Pey6xXfH0ps07roVny+QUPcq+PGxl1cyU47L02O2z1nu 2LCY2c3p9ANiw8x/+LwEClZWZbYPjv3wq5ey8Nasn7dMjeXzyhcWtQbLZyYraNuoHn7Wi3rpUeM V4TOWf7Z9MLlrshH5ZYDTt+5spYvbuOcFDZtkk3D0tcfAQ==
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
 drivers/i2c/busses/i2c-amd-mp2-plat.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-amd-mp2-plat.c b/drivers/i2c/busses/i2c-amd-mp2-plat.c
index 423fe0c8a471..112fe2bc5662 100644
--- a/drivers/i2c/busses/i2c-amd-mp2-plat.c
+++ b/drivers/i2c/busses/i2c-amd-mp2-plat.c
@@ -322,7 +322,7 @@ static int i2c_amd_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int i2c_amd_remove(struct platform_device *pdev)
+static void i2c_amd_remove(struct platform_device *pdev)
 {
 	struct amd_i2c_dev *i2c_dev = platform_get_drvdata(pdev);
 	struct amd_i2c_common *i2c_common = &i2c_dev->common;
@@ -336,7 +336,6 @@ static int i2c_amd_remove(struct platform_device *pdev)
 	i2c_unlock_bus(&i2c_dev->adap, I2C_LOCK_ROOT_ADAPTER);
 
 	i2c_del_adapter(&i2c_dev->adap);
-	return 0;
 }
 
 static const struct acpi_device_id i2c_amd_acpi_match[] = {
@@ -347,7 +346,7 @@ MODULE_DEVICE_TABLE(acpi, i2c_amd_acpi_match);
 
 static struct platform_driver i2c_amd_plat_driver = {
 	.probe = i2c_amd_probe,
-	.remove = i2c_amd_remove,
+	.remove_new = i2c_amd_remove,
 	.driver = {
 		.name = "i2c_amd_mp2",
 		.acpi_match_table = ACPI_PTR(i2c_amd_acpi_match),
-- 
2.39.2

