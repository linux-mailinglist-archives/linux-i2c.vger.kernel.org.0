Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F5B76FB8E1
	for <lists+linux-i2c@lfdr.de>; Mon,  8 May 2023 22:54:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233842AbjEHUyO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 May 2023 16:54:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233838AbjEHUx4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 May 2023 16:53:56 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E4F4729F
        for <linux-i2c@vger.kernel.org>; Mon,  8 May 2023 13:53:42 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rS-00049A-Uj; Mon, 08 May 2023 22:53:34 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rR-0024vd-PN; Mon, 08 May 2023 22:53:33 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rQ-002Ya3-W5; Mon, 08 May 2023 22:53:33 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     George Cherian <gcherian@marvell.com>,
        Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 82/89] i2c: xlp9xx: Convert to platform remove callback returning void
Date:   Mon,  8 May 2023 22:52:59 +0200
Message-Id: <20230508205306.1474415-83-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1768; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=McCn6zqG7LlDt7B4XIm7OBQAXC0Kq1MhPMBrtoGxTz4=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkWWETY/Yf4KRz30kvv8DD8PbWizyQdVK7XlaXt j6Hoz3X/vyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFlhEwAKCRCPgPtYfRL+ TvedB/wMNArT0fdMLiQMcUNZEpRnajxLj1+vLNqkC2qttK7va5NdYnVe1bNgA2MWMvw3c4LoR+v AhfW0X0qKfO8tbdlLqiRFfJBfAeZpxHIMMLObPs6DIITgsaN7EuAncQhxLnnk1/XfcO3uGrBkwx iFnGyYmgv19CquQePWomXejOycXTk7gK7U2F2Yg7TAgjnM46F6P+fhenyVUmEvcIsQRyjDwiHgt lf6Jm1vmvMND5DclNnWA/u4PnUi3F85NcryRLY/Z+PD4GKpX79WSSrFO2ceXztPVw/i4JdNUXi6 ZvbPapGWu8JCIyjt458L2p4gZ5lYesm+y2hXINkRY1DL2EwA
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
 drivers/i2c/busses/i2c-xlp9xx.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xlp9xx.c b/drivers/i2c/busses/i2c-xlp9xx.c
index 4e3b11c0f732..f59e8c544f36 100644
--- a/drivers/i2c/busses/i2c-xlp9xx.c
+++ b/drivers/i2c/busses/i2c-xlp9xx.c
@@ -559,7 +559,7 @@ static int xlp9xx_i2c_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int xlp9xx_i2c_remove(struct platform_device *pdev)
+static void xlp9xx_i2c_remove(struct platform_device *pdev)
 {
 	struct xlp9xx_i2c_dev *priv;
 
@@ -568,8 +568,6 @@ static int xlp9xx_i2c_remove(struct platform_device *pdev)
 	synchronize_irq(priv->irq);
 	i2c_del_adapter(&priv->adapter);
 	xlp9xx_write_i2c_reg(priv, XLP9XX_I2C_CTRL, 0);
-
-	return 0;
 }
 
 #ifdef CONFIG_ACPI
@@ -583,7 +581,7 @@ MODULE_DEVICE_TABLE(acpi, xlp9xx_i2c_acpi_ids);
 
 static struct platform_driver xlp9xx_i2c_driver = {
 	.probe = xlp9xx_i2c_probe,
-	.remove = xlp9xx_i2c_remove,
+	.remove_new = xlp9xx_i2c_remove,
 	.driver = {
 		.name = "xlp9xx-i2c",
 		.acpi_match_table = ACPI_PTR(xlp9xx_i2c_acpi_ids),
-- 
2.39.2

