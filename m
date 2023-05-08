Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08B326FB8C1
	for <lists+linux-i2c@lfdr.de>; Mon,  8 May 2023 22:53:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233830AbjEHUxw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 May 2023 16:53:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233817AbjEHUxg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 May 2023 16:53:36 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1636A7AA5
        for <linux-i2c@vger.kernel.org>; Mon,  8 May 2023 13:53:31 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rI-0003aW-7g; Mon, 08 May 2023 22:53:24 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rG-0024sK-QE; Mon, 08 May 2023 22:53:22 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rF-002YXT-TJ; Mon, 08 May 2023 22:53:21 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Stefan Roese <sr@denx.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Wolfram Sang <wsa@kernel.org>
Cc:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH 42/89] i2c: mt7621: Convert to platform remove callback returning void
Date:   Mon,  8 May 2023 22:52:19 +0200
Message-Id: <20230508205306.1474415-43-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1535; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=gvYy2p6OUjMymR++g3HVoaQyQU8hbOhhzCgPl70p1U8=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkWWDfl6zi/7ksMMTwFf5VHBH2HmaJwvsi++ZiO SFbI+Ce/XGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFlg3wAKCRCPgPtYfRL+ Tiy4B/4kZMCqIsT3THa7yRQttfJD2wSfKOi/0Ycs0zrKvEKH3R7ZUAMjCYF2p+G19F3aZvC7Odo KZyBhfpEirpKbClhQ3HtD5y5qD9u7U58Qb7LYfxHNkss5BEDHRVMwBeHiSZsDA78ezs8v3NnOdZ TgpPrGoVJSSYKPxSNsMABiYkSN8uRxY8zML4TaqZLEyBtQ30HHSFIsZ2cBQf91/zQISsjEGhqJn Kkai/+SfgH5ZjlDsBYHA08472CbiO9v6kHFQk5lELYpJrn1+DET1fW4DlJPmJSMYXUu+GNnCnLO zt6EnyYjN89qY4BYuG07RlxsMvKhy5Ko7m8z/kMub2m7UqtQ
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
 drivers/i2c/busses/i2c-mt7621.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mt7621.c b/drivers/i2c/busses/i2c-mt7621.c
index 20eda5738ac4..f9c294e2bd3c 100644
--- a/drivers/i2c/busses/i2c-mt7621.c
+++ b/drivers/i2c/busses/i2c-mt7621.c
@@ -332,19 +332,17 @@ static int mtk_i2c_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int mtk_i2c_remove(struct platform_device *pdev)
+static void mtk_i2c_remove(struct platform_device *pdev)
 {
 	struct mtk_i2c *i2c = platform_get_drvdata(pdev);
 
 	clk_disable_unprepare(i2c->clk);
 	i2c_del_adapter(&i2c->adap);
-
-	return 0;
 }
 
 static struct platform_driver mtk_i2c_driver = {
 	.probe		= mtk_i2c_probe,
-	.remove		= mtk_i2c_remove,
+	.remove_new	= mtk_i2c_remove,
 	.driver		= {
 		.name	= "i2c-mt7621",
 		.of_match_table = i2c_mtk_dt_ids,
-- 
2.39.2

