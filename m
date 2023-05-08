Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92A6A6FB8CF
	for <lists+linux-i2c@lfdr.de>; Mon,  8 May 2023 22:54:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233712AbjEHUyA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 May 2023 16:54:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233823AbjEHUxo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 May 2023 16:53:44 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D4DE5FDB
        for <linux-i2c@vger.kernel.org>; Mon,  8 May 2023 13:53:35 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rO-0003x0-Fy; Mon, 08 May 2023 22:53:30 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rN-0024uS-PT; Mon, 08 May 2023 22:53:29 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rN-002YZ9-5Y; Mon, 08 May 2023 22:53:29 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
Subject: [PATCH 69/89] i2c: stm32f4: Convert to platform remove callback returning void
Date:   Mon,  8 May 2023 22:52:46 +0200
Message-Id: <20230508205306.1474415-70-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1680; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=KsTLpk5TpUb4Dzq321SNPVYsZvuYiRMfMjIpWov0v2Q=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkWWEE3v+eQu1VzkgUfGB1CwZ/y5MSLOTE+pzhr XLRvYs9cy+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFlhBAAKCRCPgPtYfRL+ ThPBB/sGMqSUrQf3yQqyALramq2L7ZNofD1uKxRC87W7Ncf4NBKdvAYAgZvzqLYi2x+SBin4LTK wCi7hHugSd1o95E2ezgKIuVrECuR5wN06eKj1VF2EQV0O69MFDGPyFE7etcFatBJwBZs3879GLF fqWAZ0GqGg7yaj3qKhXihp1gPckWIAhzvnjlw4Wj4s3dMyf/DQc46kGodRpoxgfZCfX9g/w9zTA 603LUYcVDprqThB56bSlDv10Kd2w5+Y34TxYNIAzfYoyaQrvnEkdhsl8YJWJXnhQ13Sx8XUzF63 0Hobb9qXBtcBUv+snLoNSxs/wQIrCx32zg/hqRpdeIA+xdCX
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
 drivers/i2c/busses/i2c-stm32f4.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-stm32f4.c b/drivers/i2c/busses/i2c-stm32f4.c
index eebce7ecef25..6ad06a5a22b4 100644
--- a/drivers/i2c/busses/i2c-stm32f4.c
+++ b/drivers/i2c/busses/i2c-stm32f4.c
@@ -861,15 +861,13 @@ static int stm32f4_i2c_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int stm32f4_i2c_remove(struct platform_device *pdev)
+static void stm32f4_i2c_remove(struct platform_device *pdev)
 {
 	struct stm32f4_i2c_dev *i2c_dev = platform_get_drvdata(pdev);
 
 	i2c_del_adapter(&i2c_dev->adap);
 
 	clk_unprepare(i2c_dev->clk);
-
-	return 0;
 }
 
 static const struct of_device_id stm32f4_i2c_match[] = {
@@ -884,7 +882,7 @@ static struct platform_driver stm32f4_i2c_driver = {
 		.of_match_table = stm32f4_i2c_match,
 	},
 	.probe = stm32f4_i2c_probe,
-	.remove = stm32f4_i2c_remove,
+	.remove_new = stm32f4_i2c_remove,
 };
 
 module_platform_driver(stm32f4_i2c_driver);
-- 
2.39.2

