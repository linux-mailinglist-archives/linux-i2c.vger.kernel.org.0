Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 797066FB8C9
	for <lists+linux-i2c@lfdr.de>; Mon,  8 May 2023 22:53:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229457AbjEHUx6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 May 2023 16:53:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233791AbjEHUxn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 May 2023 16:53:43 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D32C729A
        for <linux-i2c@vger.kernel.org>; Mon,  8 May 2023 13:53:34 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rI-0003bP-MK; Mon, 08 May 2023 22:53:24 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rH-0024sU-A9; Mon, 08 May 2023 22:53:23 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rG-002YXb-Jh; Mon, 08 May 2023 22:53:22 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Wolfram Sang <wsa@kernel.org>
Cc:     Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel@pengutronix.de
Subject: [PATCH 44/89] i2c: mxs: Convert to platform remove callback returning void
Date:   Mon,  8 May 2023 22:52:21 +0200
Message-Id: <20230508205306.1474415-45-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1719; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=92YdFV4YYeGj5iHd5BYZlFtHQTnDXh5qocBC9Y2/UNk=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkWWDhhPYDts/ONMfdNR/Oln7WckV1VfXCL2fl8 H15h5XoB4iJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFlg4QAKCRCPgPtYfRL+ TqwVB/0SxEaiCKH2+0h0LDXMfO++xB4CtJYWSiV2XIttQ8WcGLbgQPplQqZO5JB0hTPPU7u9Jeg duOd32F2Hk6jFONdilO5juthWE2mxYKLdv9MP2QSTH4S+Dgi+Mp015O1CiRpTIohk/v0X72AQKY bTMSBlvftoyNEM6iCF96RcMJwGCeGrce6XmitDWHsB1vdt96uKgfG9Ql96LnNdYftZJq0e5yRAP KOiIyHprRL+nFUI+4h2NR+zJqL3V6979np7pVwdzSW3wVNrfPgngIOOEnJIZkvBWzyKKCdAkXpb 7x2mDkWahQ9CWj3hDZEb9nAR3oNDEVXi7ABE5qKE5pIxWujj
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
 drivers/i2c/busses/i2c-mxs.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mxs.c b/drivers/i2c/busses/i2c-mxs.c
index e0f3b3545cfe..1d76f1c4dc06 100644
--- a/drivers/i2c/busses/i2c-mxs.c
+++ b/drivers/i2c/busses/i2c-mxs.c
@@ -864,7 +864,7 @@ static int mxs_i2c_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int mxs_i2c_remove(struct platform_device *pdev)
+static void mxs_i2c_remove(struct platform_device *pdev)
 {
 	struct mxs_i2c_dev *i2c = platform_get_drvdata(pdev);
 
@@ -874,8 +874,6 @@ static int mxs_i2c_remove(struct platform_device *pdev)
 		dma_release_channel(i2c->dmach);
 
 	writel(MXS_I2C_CTRL0_SFTRST, i2c->regs + MXS_I2C_CTRL0_SET);
-
-	return 0;
 }
 
 static struct platform_driver mxs_i2c_driver = {
@@ -884,7 +882,7 @@ static struct platform_driver mxs_i2c_driver = {
 		   .of_match_table = mxs_i2c_dt_ids,
 		   },
 	.probe = mxs_i2c_probe,
-	.remove = mxs_i2c_remove,
+	.remove_new = mxs_i2c_remove,
 };
 
 static int __init mxs_i2c_init(void)
-- 
2.39.2

