Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E1D663045A
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Nov 2022 00:38:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236422AbiKRXie (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Nov 2022 18:38:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236754AbiKRXhu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 18 Nov 2022 18:37:50 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 998436D965
        for <linux-i2c@vger.kernel.org>; Fri, 18 Nov 2022 15:22:24 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1owA8R-0001vh-Em; Fri, 18 Nov 2022 23:46:59 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1owA8O-0058Oy-M4; Fri, 18 Nov 2022 23:46:57 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1owA8O-00005e-NN; Fri, 18 Nov 2022 23:46:56 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
To:     Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Eddie James <eajames@linux.ibm.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 216/606] Input: ibm-panel - Convert to i2c's .probe_new()
Date:   Fri, 18 Nov 2022 23:39:10 +0100
Message-Id: <20221118224540.619276-217-uwe@kleine-koenig.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221118224540.619276-1-uwe@kleine-koenig.org>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

The probe function doesn't make use of the i2c_device_id * parameter so it
can be trivially converted.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/input/misc/ibm-panel.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/input/misc/ibm-panel.c b/drivers/input/misc/ibm-panel.c
index a8fba0054719..3969ffc1bc8d 100644
--- a/drivers/input/misc/ibm-panel.c
+++ b/drivers/input/misc/ibm-panel.c
@@ -119,8 +119,7 @@ static int ibm_panel_i2c_slave_cb(struct i2c_client *client,
 	return 0;
 }
 
-static int ibm_panel_probe(struct i2c_client *client,
-			   const struct i2c_device_id *id)
+static int ibm_panel_probe(struct i2c_client *client)
 {
 	struct ibm_panel *panel;
 	int i;
@@ -190,7 +189,7 @@ static struct i2c_driver ibm_panel_driver = {
 		.name = DEVICE_NAME,
 		.of_match_table = ibm_panel_match,
 	},
-	.probe = ibm_panel_probe,
+	.probe_new = ibm_panel_probe,
 	.remove = ibm_panel_remove,
 };
 module_i2c_driver(ibm_panel_driver);
-- 
2.38.1

