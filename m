Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5C906FB8C6
	for <lists+linux-i2c@lfdr.de>; Mon,  8 May 2023 22:53:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233613AbjEHUx5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 May 2023 16:53:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233333AbjEHUxj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 May 2023 16:53:39 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDAE06A4D
        for <linux-i2c@vger.kernel.org>; Mon,  8 May 2023 13:53:33 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rN-0003vI-ME; Mon, 08 May 2023 22:53:29 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rM-0024tz-Oo; Mon, 08 May 2023 22:53:28 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rL-002YYn-OE; Mon, 08 May 2023 22:53:27 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 63/89] i2c: scmi: Convert to platform remove callback returning void
Date:   Mon,  8 May 2023 22:52:40 +0200
Message-Id: <20230508205306.1474415-64-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1558; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=ga1FoybnSSytZ32rt1l+hzfgzqsJcUx2mDnQOWNTJPU=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkWWD9sUD5b1X28+CN2TXmPmaIgroq5r4xVIUqE H/PqRYEcyuJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFlg/QAKCRCPgPtYfRL+ TrIaB/99Qbkyj856ibyVJNeremvYXtg5dtIso9MavydZTuAOL61gErIDqsarDHp9YuyH3uFkV/x UxJrnXC5emN6q2q+kfRd7ERW6tyERJqc74+cn4iRUGzDx5hHXLaOaBuURb1CHE9oMGrptaKZfwh KF/r5BJsdLfYR3lYFIb0XVuY1hznp2Lwln++f+NSSjQHyFWRvsqXauWh7a4/DVgb6oC32T4YMya UfMyNctRx2hU6OjuK+XTSFNUt1Mpp7qeyZ3mFdi7H8AA45kHx0qjZb4vIiOuy9EwdjPJgeU1rSP SH30vtA3YxpjDLOhSapUWxm3gH28zN9ATa3SByL5kxq6ovJy
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
 drivers/i2c/busses/i2c-scmi.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-scmi.c b/drivers/i2c/busses/i2c-scmi.c
index 0239e134b90f..104570292241 100644
--- a/drivers/i2c/busses/i2c-scmi.c
+++ b/drivers/i2c/busses/i2c-scmi.c
@@ -404,19 +404,17 @@ static int smbus_cmi_probe(struct platform_device *device)
 	return ret;
 }
 
-static int smbus_cmi_remove(struct platform_device *device)
+static void smbus_cmi_remove(struct platform_device *device)
 {
 	struct acpi_smbus_cmi *smbus_cmi = platform_get_drvdata(device);
 
 	i2c_del_adapter(&smbus_cmi->adapter);
 	kfree(smbus_cmi);
-
-	return 0;
 }
 
 static struct platform_driver smbus_cmi_driver = {
 	.probe = smbus_cmi_probe,
-	.remove = smbus_cmi_remove,
+	.remove_new = smbus_cmi_remove,
 	.driver = {
 		.name   = "smbus_cmi",
 		.acpi_match_table = acpi_smbus_cmi_ids,
-- 
2.39.2

