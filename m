Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D1AE6302EE
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Nov 2022 00:21:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235466AbiKRXVc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Nov 2022 18:21:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229993AbiKRXVG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 18 Nov 2022 18:21:06 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE7DA4F1BE
        for <linux-i2c@vger.kernel.org>; Fri, 18 Nov 2022 15:12:03 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1owA9P-0004VC-5B; Fri, 18 Nov 2022 23:47:59 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1owA9M-0058ke-Ko; Fri, 18 Nov 2022 23:47:57 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1owA9M-0000OP-TF; Fri, 18 Nov 2022 23:47:56 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
To:     Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-kernel@vger.kernel.org
Subject: [PATCH 486/606] misc: ds1682: Convert to i2c's .probe_new()
Date:   Fri, 18 Nov 2022 23:43:40 +0100
Message-Id: <20221118224540.619276-487-uwe@kleine-koenig.org>
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
 drivers/misc/ds1682.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/misc/ds1682.c b/drivers/misc/ds1682.c
index 0698ddc5f4d5..d517eed32971 100644
--- a/drivers/misc/ds1682.c
+++ b/drivers/misc/ds1682.c
@@ -200,8 +200,7 @@ static const struct bin_attribute ds1682_eeprom_attr = {
 /*
  * Called when a ds1682 device is matched with this driver
  */
-static int ds1682_probe(struct i2c_client *client,
-			const struct i2c_device_id *id)
+static int ds1682_probe(struct i2c_client *client)
 {
 	int rc;
 
@@ -251,7 +250,7 @@ static struct i2c_driver ds1682_driver = {
 		.name = "ds1682",
 		.of_match_table = ds1682_of_match,
 	},
-	.probe = ds1682_probe,
+	.probe_new = ds1682_probe,
 	.remove = ds1682_remove,
 	.id_table = ds1682_id,
 };
-- 
2.38.1

