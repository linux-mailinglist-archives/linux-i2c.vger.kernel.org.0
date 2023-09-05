Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6AD3F792F2F
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Sep 2023 21:43:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240811AbjIETnS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 Sep 2023 15:43:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241391AbjIETnO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 5 Sep 2023 15:43:14 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52EF6E56
        for <linux-i2c@vger.kernel.org>; Tue,  5 Sep 2023 12:43:02 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qdbwy-0006ME-QV; Tue, 05 Sep 2023 21:43:00 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qdbwy-004GYk-7W; Tue, 05 Sep 2023 21:43:00 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qdbwx-00FcPv-F5; Tue, 05 Sep 2023 21:42:59 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        Lee Jones <lee@kernel.org>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Jean Delvare <jdelvare@suse.de>
Subject: [PATCH 2/2] i2c: Drop legacy callback .probe_new()
Date:   Tue,  5 Sep 2023 21:42:53 +0200
Message-Id: <20230905194253.256054-3-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230905194253.256054-1-u.kleine-koenig@pengutronix.de>
References: <20230905194253.256054-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1587; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=KrORojcxrGwUC29cEA6iBPNhOFJTDZ4DoeNFXpZM6zQ=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBk94S4FpwcZ0FzXUQG+CT4TXr3mnfV9toJbmB1t RIDem4x4nWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZPeEuAAKCRCPgPtYfRL+ Tv3LCACTuYEz5kox/1uQ0sm18Wf0GL7PhME91dnFC5QHV5ffbH3iQmJCoOhePVgPbXRAp1ns2Nj +rT2XUa4Amrb5CnrbjcqhdEdIonjHZk7MVq2bZgpLu+4QlVvjpeNOA7ER9loA+fvw7REYCigknM TPxoaQZyCeUEC71XqM63/HARC21j6nnwYTNG9f5ojK6kdodpm2gdBG+FNUmq2ahjU2pcuCYJvuY QjK2M9y3AYtUENHX0OfjNCqiNUEI0R14SNUx3h8fpAN51aVulteyCI4rg8dod4LEcCgchqxhYrA EqSPFviqoqNwhps5tbeaMNBusvA+UutGBuXnGFpyU3myNYI8
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Now that all drivers are converted to the (new) .probe() callback, the
temporary .probe_new() can go away. \o/

Link: https://lore.kernel.org/linux-i2c/20230626094548.559542-1-u.kleine-koenig@pengutronix.de
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Jean Delvare <jdelvare@suse.de>
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 include/linux/i2c.h | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 3430cc2b05a6..0dae9db27538 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -237,7 +237,6 @@ enum i2c_driver_flags {
  * struct i2c_driver - represent an I2C device driver
  * @class: What kind of i2c device we instantiate (for detect)
  * @probe: Callback for device binding
- * @probe_new: Transitional callback for device binding - do not use
  * @remove: Callback for device unbinding
  * @shutdown: Callback for device shutdown
  * @alert: Alert callback, for example for the SMBus alert protocol
@@ -272,16 +271,8 @@ enum i2c_driver_flags {
 struct i2c_driver {
 	unsigned int class;
 
-	union {
 	/* Standard driver model interfaces */
-		int (*probe)(struct i2c_client *client);
-		/*
-		 * Legacy callback that was part of a conversion of .probe().
-		 * Today it has the same semantic as .probe(). Don't use for new
-		 * code.
-		 */
-		int (*probe_new)(struct i2c_client *client);
-	};
+	int (*probe)(struct i2c_client *client);
 	void (*remove)(struct i2c_client *client);
 
 
-- 
2.40.1

