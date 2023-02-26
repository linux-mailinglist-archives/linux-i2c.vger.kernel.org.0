Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF0B06A34AB
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Feb 2023 23:27:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229763AbjBZW1e (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 26 Feb 2023 17:27:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229779AbjBZW10 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 26 Feb 2023 17:27:26 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5AF7199D5
        for <linux-i2c@vger.kernel.org>; Sun, 26 Feb 2023 14:27:20 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pWPTz-0000v6-O7; Sun, 26 Feb 2023 23:27:03 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pWPTw-000UbU-3O; Sun, 26 Feb 2023 23:27:00 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pWPTv-000YPp-Dt; Sun, 26 Feb 2023 23:26:59 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, Evgeniy Polyakov <zbr@ioremap.net>,
        Crt Mori <cmo@melexis.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Jean Delvare <jdelvare@suse.de>,
        Javier Martinez Canillas <javierm@redhat.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/9] w1: ds2482: Convert to i2c's .probe_new()
Date:   Sun, 26 Feb 2023 23:26:49 +0100
Message-Id: <20230226222654.1741900-5-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230226222654.1741900-1-u.kleine-koenig@pengutronix.de>
References: <20230226222654.1741900-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1058; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=BzuVYSfwpD9FqWmWpmQJWk/Mwl/NXFiGZ/5Qwvgx0mU=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBj+9yYdtkNQDNgWuRKmbrh+DXfQMjcTk/EPMyGp jfiN54UhIuJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY/vcmAAKCRDB/BR4rcrs CS+nB/9yDXKU44xkfTpIuL+tSEKpsPg7fkuVl5RMKsJYAn34MtwpYVyVOQ89YlNGl2PGUsx62/t q5x16dW3Zoy2evDC0kMuPpmEY/3my1sAqFCUq2CdBWUmpGBq/DgEa4swjvUCIAKIsY3GQI06FVa m29jxO5uhvL9wBSjMjdjf5IEzpy0zQstzBCrRG0iFgcREKL5rClwRiaNryoI2/EEXnMcrqEuOZl lxSNeDggFcR7q1U25b0ocJk4d+/7jhhMlmFGtC98Ut1zX9TpZIJtn0HiFgl+FY4Q/m24ZePDmiT B4KXLOPZ8HQQXRR6ihnkpg5CDvpr636UlE9xCFxGW8NHeiGG
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

Link: https://lore.kernel.org/lkml/20221118224540.619276-596-uwe@kleine-koenig.org
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/w1/masters/ds2482.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/w1/masters/ds2482.c b/drivers/w1/masters/ds2482.c
index 62c44616d8a9..3d8b51316bef 100644
--- a/drivers/w1/masters/ds2482.c
+++ b/drivers/w1/masters/ds2482.c
@@ -442,8 +442,7 @@ static u8 ds2482_w1_set_pullup(void *data, int delay)
 }
 
 
-static int ds2482_probe(struct i2c_client *client,
-			const struct i2c_device_id *id)
+static int ds2482_probe(struct i2c_client *client)
 {
 	struct ds2482_data *data;
 	int err = -ENODEV;
@@ -553,7 +552,7 @@ static struct i2c_driver ds2482_driver = {
 	.driver = {
 		.name	= "ds2482",
 	},
-	.probe		= ds2482_probe,
+	.probe_new	= ds2482_probe,
 	.remove		= ds2482_remove,
 	.id_table	= ds2482_id,
 };
-- 
2.39.1

