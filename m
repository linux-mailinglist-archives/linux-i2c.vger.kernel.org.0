Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C4F26A1BCD
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Feb 2023 13:06:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229736AbjBXMGR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 24 Feb 2023 07:06:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229701AbjBXMGQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 24 Feb 2023 07:06:16 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81BFC65330
        for <linux-i2c@vger.kernel.org>; Fri, 24 Feb 2023 04:06:14 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pVWq4-0000eR-TY; Fri, 24 Feb 2023 13:06:12 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pVWq3-007B05-2n; Fri, 24 Feb 2023 13:06:12 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pVWq3-006EZD-7M; Fri, 24 Feb 2023 13:06:11 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     kernel@pengutronix.de, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 9/9] i2c: Convert drivers to new .probe() callback
Date:   Fri, 24 Feb 2023 13:06:00 +0100
Message-Id: <20230224120600.1681685-10-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230224120600.1681685-1-u.kleine-koenig@pengutronix.de>
References: <20230224120600.1681685-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2320; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=8cexTMV14qFlDVuIXD7jYIZgWUBN5i6f1Hvt7C9j40g=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBj+KgiKyLe6sNlsuZiFmGT83SWbvpE+de+Dztv1 qKkLYWIl5eJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY/ioIgAKCRDB/BR4rcrs CR6qB/94FBVBPf+3KRfvfUbSDM6suyp+EVRroDASxcnN0Z774uBmKRE/pZgYshSSaswCHhKbjMB j1A1xI2hIyKYKptGGUKF7rtcG12KbqTz1GwxWO393ybbdyPsJ8wX4EAlkLIfXbduT3KdJCeO1po pA2EHsbqQmADgwlYC8VwwySVUZ7kwy/8T209s99QyefUW09oiHqi17RXy1hppm/m4FGD/lrZ0Gc /pJ2t1/J2Sdcol6vhr6yiX7vMwp3GZB0N6gSOk7wuS+oS/P8gRWu+0c5HRuQ9FIGlKzDlP2VNKj cQOE7dzelvl5omBeJM3kagwYiDvXrrM9X1cu6lSh5nj974fi
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Now that .probe() was changed not to get the id parameter, drivers can
be converted back to that with the eventual goal to drop .probe_new().

Implement that for the i2c drivers that are part of the i2c core.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/i2c/i2c-core-base.c      | 2 +-
 drivers/i2c/i2c-slave-eeprom.c   | 2 +-
 drivers/i2c/i2c-slave-testunit.c | 2 +-
 drivers/i2c/i2c-smbus.c          | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 1fbe16221085..1e38bdaf6ec1 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -1018,7 +1018,7 @@ static int dummy_probe(struct i2c_client *client)
 
 static struct i2c_driver dummy_driver = {
 	.driver.name	= "dummy",
-	.probe_new	= dummy_probe,
+	.probe		= dummy_probe,
 	.id_table	= dummy_id,
 };
 
diff --git a/drivers/i2c/i2c-slave-eeprom.c b/drivers/i2c/i2c-slave-eeprom.c
index 5f25f23c4ff8..5946c0d0aef9 100644
--- a/drivers/i2c/i2c-slave-eeprom.c
+++ b/drivers/i2c/i2c-slave-eeprom.c
@@ -207,7 +207,7 @@ static struct i2c_driver i2c_slave_eeprom_driver = {
 	.driver = {
 		.name = "i2c-slave-eeprom",
 	},
-	.probe_new = i2c_slave_eeprom_probe,
+	.probe = i2c_slave_eeprom_probe,
 	.remove = i2c_slave_eeprom_remove,
 	.id_table = i2c_slave_eeprom_id,
 };
diff --git a/drivers/i2c/i2c-slave-testunit.c b/drivers/i2c/i2c-slave-testunit.c
index 75ee7ebdb614..a49642bbae4b 100644
--- a/drivers/i2c/i2c-slave-testunit.c
+++ b/drivers/i2c/i2c-slave-testunit.c
@@ -171,7 +171,7 @@ static struct i2c_driver i2c_slave_testunit_driver = {
 	.driver = {
 		.name = "i2c-slave-testunit",
 	},
-	.probe_new = i2c_slave_testunit_probe,
+	.probe = i2c_slave_testunit_probe,
 	.remove = i2c_slave_testunit_remove,
 	.id_table = i2c_slave_testunit_id,
 };
diff --git a/drivers/i2c/i2c-smbus.c b/drivers/i2c/i2c-smbus.c
index cd19546d31fc..138c3f5e0093 100644
--- a/drivers/i2c/i2c-smbus.c
+++ b/drivers/i2c/i2c-smbus.c
@@ -169,7 +169,7 @@ static struct i2c_driver smbalert_driver = {
 	.driver = {
 		.name	= "smbus_alert",
 	},
-	.probe_new	= smbalert_probe,
+	.probe		= smbalert_probe,
 	.remove		= smbalert_remove,
 	.id_table	= smbalert_ids,
 };
-- 
2.39.1

