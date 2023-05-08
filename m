Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C77D86FB8DC
	for <lists+linux-i2c@lfdr.de>; Mon,  8 May 2023 22:54:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233355AbjEHUyG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 May 2023 16:54:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233818AbjEHUxv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 May 2023 16:53:51 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 866987ECF
        for <linux-i2c@vger.kernel.org>; Mon,  8 May 2023 13:53:38 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rO-0003wo-D3; Mon, 08 May 2023 22:53:30 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rN-0024uO-NW; Mon, 08 May 2023 22:53:29 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rM-002YZ5-U5; Mon, 08 May 2023 22:53:28 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Patrice Chotard <patrice.chotard@foss.st.com>,
        Wolfram Sang <wsa@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 68/89] i2c: st: Convert to platform remove callback returning void
Date:   Mon,  8 May 2023 22:52:45 +0200
Message-Id: <20230508205306.1474415-69-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1563; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=OJ8Zi3RG1Q2mLrIVp7pIUbuV4DDVIaszJGq+pWuHMzU=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkWWED4Kpk9WMRIyCcC0SMGZ55wxB2Yy5i/wHnh qifv4TDTjKJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFlhAwAKCRCPgPtYfRL+ TiI0B/9X3hHn+KyxA3n9hw5X7kCdcq+fpES5se0OkTOfHKNCnmOSJVqp30cVWMOrEj6nhiiG8Hh rdeNx++rB0fDUjHm4U0InShjr3jRamgaJz8rNK0AEtKeyYkiTd9V8QZDwIafyx1NxyNDqh4feUf +1worV6nT9THD2RnvqOOaIMracC5JBhT1H41p+VV9DZAHlqbtJwhG0YFNCCyjWGgzQMrXf4BnjU dR95DQJKLyoWM2L5X7Sy3u1g05sybCQ5uO1rBB8fiebQKdPOSDFNPjPc3zlrmQdVdQzs1aSrYUZ n09DNdtA7TJEvOAdBcXf96+UI0wEFJVyrjd+EtbSFIhjGntn
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
 drivers/i2c/busses/i2c-st.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-st.c b/drivers/i2c/busses/i2c-st.c
index f823913b75a6..25c3521cae0e 100644
--- a/drivers/i2c/busses/i2c-st.c
+++ b/drivers/i2c/busses/i2c-st.c
@@ -876,13 +876,11 @@ static int st_i2c_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int st_i2c_remove(struct platform_device *pdev)
+static void st_i2c_remove(struct platform_device *pdev)
 {
 	struct st_i2c_dev *i2c_dev = platform_get_drvdata(pdev);
 
 	i2c_del_adapter(&i2c_dev->adap);
-
-	return 0;
 }
 
 static const struct of_device_id st_i2c_match[] = {
@@ -899,7 +897,7 @@ static struct platform_driver st_i2c_driver = {
 		.pm = pm_sleep_ptr(&st_i2c_pm),
 	},
 	.probe = st_i2c_probe,
-	.remove = st_i2c_remove,
+	.remove_new = st_i2c_remove,
 };
 
 module_platform_driver(st_i2c_driver);
-- 
2.39.2

