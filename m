Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 138AB607147
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Oct 2022 09:39:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229602AbiJUHjw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 Oct 2022 03:39:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbiJUHjt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 21 Oct 2022 03:39:49 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C6FF2CCB5
        for <linux-i2c@vger.kernel.org>; Fri, 21 Oct 2022 00:39:46 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1olmd6-0006Mi-AG; Fri, 21 Oct 2022 09:39:44 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1olmd3-000TRS-9V; Fri, 21 Oct 2022 09:39:43 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1olmd4-009WBG-Tn; Fri, 21 Oct 2022 09:39:42 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH v1 3/5] i2c: smbus: Convert to .probe_new()
Date:   Fri, 21 Oct 2022 09:39:33 +0200
Message-Id: <20221021073935.165158-4-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221021073935.165158-1-u.kleine-koenig@pengutronix.de>
References: <20221021073935.165158-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1057; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=7a5TTsET6f6PqjDsmSs8UrKAbWVDqlXFZFAMpzXXsx0=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBjUkyo8B0gEWWVemPBnwldLNOVZNFST4HbEJcXtZ8Q AT5BXHOJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY1JMqAAKCRDB/BR4rcrsCY1fB/ 90PovCrh+VqxpWl6D/TfgHfDHGjc2Z+xR80yAepgsOqdq0ewdI4EDs4ZSiWldx4leM3g/gtvtgew7w MVbnlvVPFIWlK1/HFJB485Jd2VSfsoJynBAWqBFCkSydLbtG+p0yl88HXuFA2Ejl389yz7OX4TQRe1 TcvScuM8s9y/PER44AmxDuVGqxWzwH74PR0VriLmZhH4TEWs15g2yyrz9Ep7p1A+Q4nKUrAAQPjxq9 VT5ogyqrRnqW/czZlPuXidOlmqVnmnCeTefFpWvS8Kwcgakprmhxm//QhlqojL58ddHiuiitEnujL4 IRKKnEL4BcvNR3JUZZt0NL5Ke+k9gd
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

The probe function doesn't make use of the i2c_device_id * parameter so it
can be trivially converted.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/i2c/i2c-smbus.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/i2c-smbus.c b/drivers/i2c/i2c-smbus.c
index 07c92c8495a3..f4c74b9135b3 100644
--- a/drivers/i2c/i2c-smbus.c
+++ b/drivers/i2c/i2c-smbus.c
@@ -112,8 +112,7 @@ static void smbalert_work(struct work_struct *work)
 }
 
 /* Setup SMBALERT# infrastructure */
-static int smbalert_probe(struct i2c_client *ara,
-			  const struct i2c_device_id *id)
+static int smbalert_probe(struct i2c_client *ara)
 {
 	struct i2c_smbus_alert_setup *setup = dev_get_platdata(&ara->dev);
 	struct i2c_smbus_alert *alert;
@@ -170,7 +169,7 @@ static struct i2c_driver smbalert_driver = {
 	.driver = {
 		.name	= "smbus_alert",
 	},
-	.probe		= smbalert_probe,
+	.probe_new	= smbalert_probe,
 	.remove		= smbalert_remove,
 	.id_table	= smbalert_ids,
 };
-- 
2.37.2

