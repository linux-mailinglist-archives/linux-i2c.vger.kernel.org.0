Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D398B6A34A6
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Feb 2023 23:27:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229765AbjBZW1X (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 26 Feb 2023 17:27:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229731AbjBZW1U (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 26 Feb 2023 17:27:20 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAF4213DE7
        for <linux-i2c@vger.kernel.org>; Sun, 26 Feb 2023 14:27:15 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pWPU0-0000vF-TW; Sun, 26 Feb 2023 23:27:04 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pWPTw-000Ubj-Md; Sun, 26 Feb 2023 23:27:00 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pWPTv-000YPw-Ur; Sun, 26 Feb 2023 23:26:59 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, Shunqian Zheng <zhengsq@rock-chips.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH v2 6/9] media: i2c: ov2685: convert to i2c's .probe_new()
Date:   Sun, 26 Feb 2023 23:26:51 +0100
Message-Id: <20230226222654.1741900-7-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230226222654.1741900-1-u.kleine-koenig@pengutronix.de>
References: <20230226222654.1741900-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1257; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=aBqkyIGCTm2IJnMlU0lx7lJGZseSGeJbsq4rjy3NHT0=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBj+9yf+EEOctTufsZ+AVtrS5V/hQ02iCoxI9sHo LwqE3N/1QSJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY/vcnwAKCRDB/BR4rcrs CT8xB/9dDdrDQ4k0V2v9HzhpOFt99r0hvaW1wSgeqZv2Ei6woQkuEu0EtV/O85Q5qZkgwZUfNjn wOz4/J7CVT5g4ueVCLtLRqroKOLid+dl5IQKz3ZSL3mq+pINsATKrDj9z2pwU4glj2cZB4ZWTM7 68Rqxgpl7+RRLhV4BNF9ulFoizHgzxWG/2mL4DyqkufK/HlbC2+JeWyFWSmAVQsp9vma+c8Sa5q i7OBfZUCoipmqUdvfDBag5SGoqlQVj60WXZf4dAButl7TP9BaDiZLZDh7L3Nc+EXTfadJ796kdt bB9cnJPJiKUtH0TyFRb8+HUJdGI57Nz1nWmyWeF4MQGtqdap
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

The probe function doesn't make use of the i2c_device_id * parameter so
it can be trivially converted.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Link: https://lore.kernel.org/lkml/20221121102838.16448-1-u.kleine-koenig@pengutronix.de
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/media/i2c/ov2685.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ov2685.c b/drivers/media/i2c/ov2685.c
index a3b524f15d89..1c80b121e7d6 100644
--- a/drivers/media/i2c/ov2685.c
+++ b/drivers/media/i2c/ov2685.c
@@ -707,8 +707,7 @@ static int ov2685_configure_regulators(struct ov2685 *ov2685)
 				       ov2685->supplies);
 }
 
-static int ov2685_probe(struct i2c_client *client,
-			const struct i2c_device_id *id)
+static int ov2685_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
 	struct ov2685 *ov2685;
@@ -830,7 +829,7 @@ static struct i2c_driver ov2685_i2c_driver = {
 		.pm = &ov2685_pm_ops,
 		.of_match_table = of_match_ptr(ov2685_of_match),
 	},
-	.probe		= &ov2685_probe,
+	.probe_new	= &ov2685_probe,
 	.remove		= &ov2685_remove,
 };
 
-- 
2.39.1

