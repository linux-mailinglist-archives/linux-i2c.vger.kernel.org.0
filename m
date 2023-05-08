Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63F836FB898
	for <lists+linux-i2c@lfdr.de>; Mon,  8 May 2023 22:53:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229538AbjEHUxb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 May 2023 16:53:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233235AbjEHUxX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 May 2023 16:53:23 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D67CA5FC8
        for <linux-i2c@vger.kernel.org>; Mon,  8 May 2023 13:53:21 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7r7-00030A-NA; Mon, 08 May 2023 22:53:13 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7r5-0024pL-61; Mon, 08 May 2023 22:53:11 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7r4-002YV1-6W; Mon, 08 May 2023 22:53:10 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        ye xingchen <ye.xingchen@zte.com.cn>,
        Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 05/89] i2c: au1550: Convert to platform remove callback returning void
Date:   Mon,  8 May 2023 22:51:42 +0200
Message-Id: <20230508205306.1474415-6-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1596; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=v+xBO6N7mxWWICOcHkVWfEIMdWo5MEwR34FfofFpMqY=; b=owGbwMvMwMXY3/A7olbonx/jabUkhpTIBK8+/cOc9350lzBemHdaNuVGwpQlS89+lX+4SVA71 uQ20/KoTkZjFgZGLgZZMUUW+8Y1mVZVcpGda/9dhhnEygQyhYGLUwAmUmfAwdD1teQlt97Zbb0f +eYk8ljxBfwwTfoSuT47Kkxo77n72uFq/96dk61f8CBsOfeJ++9WRRyfaF2x9O2Rnhn1XGwRqpq qbOvj7f6+Cy64a8OrK7VP/ZyWi+vTx5/Lo96+ZGkOe1s6f7GVe2JKpLq91tI1MdMbS94INXO1C5 4uPKVXtEjNo/dVT8F3m6DKlFBdtwDTnTocZc9yM69bu37x9j+29bSYHVdwz80q/vNbFxa0bzOds PyWq9fJOxLvbKK2fWgouu+jo6Fb6aa/Up991m4LOVmfpTGZOoViLxfppe+6nvpNRMH61tTZl7YE Cxy1YjQLXtz99KF32MENwouEymKmbbe4IpRUo5rYGLkeAA==
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
 drivers/i2c/busses/i2c-au1550.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-au1550.c b/drivers/i2c/busses/i2c-au1550.c
index 7b42d35b1294..e66c12ecf270 100644
--- a/drivers/i2c/busses/i2c-au1550.c
+++ b/drivers/i2c/busses/i2c-au1550.c
@@ -334,13 +334,12 @@ i2c_au1550_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int i2c_au1550_remove(struct platform_device *pdev)
+static void i2c_au1550_remove(struct platform_device *pdev)
 {
 	struct i2c_au1550_data *priv = platform_get_drvdata(pdev);
 
 	i2c_del_adapter(&priv->adap);
 	i2c_au1550_disable(priv);
-	return 0;
 }
 
 #ifdef CONFIG_PM
@@ -379,7 +378,7 @@ static struct platform_driver au1xpsc_smbus_driver = {
 		.pm	= AU1XPSC_SMBUS_PMOPS,
 	},
 	.probe		= i2c_au1550_probe,
-	.remove		= i2c_au1550_remove,
+	.remove_new	= i2c_au1550_remove,
 };
 
 module_platform_driver(au1xpsc_smbus_driver);
-- 
2.39.2

