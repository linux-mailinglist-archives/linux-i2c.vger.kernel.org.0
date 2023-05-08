Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A09256FB88E
	for <lists+linux-i2c@lfdr.de>; Mon,  8 May 2023 22:53:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233106AbjEHUxX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 May 2023 16:53:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232167AbjEHUxS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 May 2023 16:53:18 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4ED8F5FCD
        for <linux-i2c@vger.kernel.org>; Mon,  8 May 2023 13:53:17 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7r7-000315-O7; Mon, 08 May 2023 22:53:13 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7r7-0024pq-23; Mon, 08 May 2023 22:53:13 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7r6-002YVT-Ay; Mon, 08 May 2023 22:53:12 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 12/89] i2c: cbus-gpio: Convert to platform remove callback returning void
Date:   Mon,  8 May 2023 22:51:49 +0200
Message-Id: <20230508205306.1474415-13-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1683; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=rmjwuyp3E1zsfvUzbn5DI38YBL5pKAvmpoR40Aw6ndU=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkWWBcdZD7YI70srjMUx3RxQBmSGzIKjvC+uuNo lNeO/vi1u+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFlgXAAKCRCPgPtYfRL+ Tj/gB/oDNv3six3i5UrUzLK/LqXDSjoovjFm4at292TYmBpMQUCYj2HXmWl2LC6PEd4h8u1FP3O PJKutyh/QJlHErkDXNE7chVqcQJcQ3S2+il0v4s2sejfcHeysAz6CTiEPIWfQwPoqonz+wC/1yC avXgHMdu98su3x6dRBvYUg9D7t6sK30LTyNc9sU6K1lUrNqfT9CCBwNmwW+RjptuHjRVvviwP46 CJDFia5sj5uK2/fj/64EWVPV500tzrqKMUWG9KlK1nFibQiRae7jkmt/XofX7yhts5M6PQgSxch Ns7siAuuVkdFKK9GVCc0E9cEagsT3AbJ55NPe+gV7644K0ck
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
 drivers/i2c/busses/i2c-cbus-gpio.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-cbus-gpio.c b/drivers/i2c/busses/i2c-cbus-gpio.c
index d97c61eec95c..fdc1758a3275 100644
--- a/drivers/i2c/busses/i2c-cbus-gpio.c
+++ b/drivers/i2c/busses/i2c-cbus-gpio.c
@@ -200,13 +200,11 @@ static const struct i2c_algorithm cbus_i2c_algo = {
 	.functionality		= cbus_i2c_func,
 };
 
-static int cbus_i2c_remove(struct platform_device *pdev)
+static void cbus_i2c_remove(struct platform_device *pdev)
 {
 	struct i2c_adapter *adapter = platform_get_drvdata(pdev);
 
 	i2c_del_adapter(adapter);
-
-	return 0;
 }
 
 static int cbus_i2c_probe(struct platform_device *pdev)
@@ -266,7 +264,7 @@ MODULE_DEVICE_TABLE(of, i2c_cbus_dt_ids);
 
 static struct platform_driver cbus_i2c_driver = {
 	.probe	= cbus_i2c_probe,
-	.remove	= cbus_i2c_remove,
+	.remove_new = cbus_i2c_remove,
 	.driver	= {
 		.name	= "i2c-cbus-gpio",
 		.of_match_table = of_match_ptr(i2c_cbus_dt_ids),
-- 
2.39.2

