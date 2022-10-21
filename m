Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 20DD760714A
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Oct 2022 09:39:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229697AbiJUHjx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 Oct 2022 03:39:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229765AbiJUHju (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 21 Oct 2022 03:39:50 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A9421F9E5
        for <linux-i2c@vger.kernel.org>; Fri, 21 Oct 2022 00:39:47 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1olmd7-0006Mw-3z; Fri, 21 Oct 2022 09:39:45 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1olmd3-000TRa-T5; Fri, 21 Oct 2022 09:39:44 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1olmd5-009WBJ-4w; Fri, 21 Oct 2022 09:39:43 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Guenter Roeck <linux@roeck-us.net>, Peter Rosin <peda@axentia.se>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH v1 4/5] i2c: mux: pca9541: Convert to .probe_new()
Date:   Fri, 21 Oct 2022 09:39:34 +0200
Message-Id: <20221021073935.165158-5-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221021073935.165158-1-u.kleine-koenig@pengutronix.de>
References: <20221021073935.165158-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1149; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=bCp6vTLy4fOgzko1zHynMiRUdoC5QcYiSr8cpMUoFFo=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBjUkyrPNWGTHQX2VhAkWISPMJwmYhh7kRaygjTnuRq 4M8BjAGJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY1JMqwAKCRDB/BR4rcrsCYHGB/ 94UDOAoQMA07dSjvysLyGpzDyFxZKC0b4kPHHkSeidgvVt9OB+iftmJnZXE/8vRDHphP27b3sESn7p eYp2fZ8/qttpft/1Q/jZGY92o21eHicY+y0MCiP70/WCMbi8eKX6OzAqeah8Me6EXUh4qoYOTE66yV zFNEwbnmDMIAQr3WhqRez5gJB4Tez2a6X2Yk/rvVDCltljuMQ/g6McRKognvwFoy2zlIPNqluZZsp9 Wxqu++q9X9H6alZRTGUZFBNaKX/wsEoPfeBEGVl5GoA2g6izp09lL2onUL7gmjhf6vxGGD026ZhIUz vvD1l1z4nPX4HwxHoivZu8t5uE6ogp
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
 drivers/i2c/muxes/i2c-mux-pca9541.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/muxes/i2c-mux-pca9541.c b/drivers/i2c/muxes/i2c-mux-pca9541.c
index ea83de78f52d..09d1d9e67e31 100644
--- a/drivers/i2c/muxes/i2c-mux-pca9541.c
+++ b/drivers/i2c/muxes/i2c-mux-pca9541.c
@@ -283,8 +283,7 @@ static int pca9541_release_chan(struct i2c_mux_core *muxc, u32 chan)
 /*
  * I2C init/probing/exit functions
  */
-static int pca9541_probe(struct i2c_client *client,
-			 const struct i2c_device_id *id)
+static int pca9541_probe(struct i2c_client *client)
 {
 	struct i2c_adapter *adap = client->adapter;
 	struct i2c_mux_core *muxc;
@@ -337,7 +336,7 @@ static struct i2c_driver pca9541_driver = {
 		   .name = "pca9541",
 		   .of_match_table = of_match_ptr(pca9541_of_match),
 		   },
-	.probe = pca9541_probe,
+	.probe_new = pca9541_probe,
 	.remove = pca9541_remove,
 	.id_table = pca9541_id,
 };
-- 
2.37.2

