Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 803196A34A8
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Feb 2023 23:27:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229772AbjBZW1Y (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 26 Feb 2023 17:27:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229738AbjBZW1U (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 26 Feb 2023 17:27:20 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6152E1716C
        for <linux-i2c@vger.kernel.org>; Sun, 26 Feb 2023 14:27:16 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pWPU0-0000v9-TX; Sun, 26 Feb 2023 23:27:04 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pWPTw-000Ubf-F9; Sun, 26 Feb 2023 23:27:00 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pWPTv-000YPt-N7; Sun, 26 Feb 2023 23:26:59 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, Shunqian Zheng <zhengsq@rock-chips.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH v2 5/9] media: i2c: ov5695: convert to i2c's .probe_new()
Date:   Sun, 26 Feb 2023 23:26:50 +0100
Message-Id: <20230226222654.1741900-6-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230226222654.1741900-1-u.kleine-koenig@pengutronix.de>
References: <20230226222654.1741900-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1261; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=P9qlg6QBcbggriS7J+1m7zrOxMS2j89d2svSwnDX9a8=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBj+9yb9qyVLGhCTDmI4MWGPl3GHVa1A8vwL+TYH yt/aAeTiMOJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY/vcmwAKCRDB/BR4rcrs CZ6KB/9m76K8RmvWuTkH3BxbfaNA6EyB4Ih+n5yutyJch+tFjH/SHeovzTFfP5wnYW66D4IyW01 AjZ4g2d7U1uBVkFJ8JCkMZb5KusCiNPYqNGEYEdSKgM8CqjsmWG9GlFVOA8B5p1pzEtR2XOZ91H mlwCmNOnGD2FPs44YFzxOGsnV88ZHmDqrBA8mD1XvR5bNQy6wpyk7UdX6EnTWZKXJ9KxxtSTE6f m7lNpjJq1m8artykh+xCPBHDl2ywuV1kPPerc9UVPboJXabgsPCYU4et/0h4mdPcnjr++Zcte3P kdijJmSG6BjGwYZEcVkjENSt5Nz2V4Om0abrGrdQkZN2BeLB
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
Link: https://lore.kernel.org/lkml/20221121102705.16092-1-u.kleine-koenig@pengutronix.de
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/media/i2c/ov5695.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ov5695.c b/drivers/media/i2c/ov5695.c
index 61906fc54e37..b287c28920a6 100644
--- a/drivers/media/i2c/ov5695.c
+++ b/drivers/media/i2c/ov5695.c
@@ -1267,8 +1267,7 @@ static int ov5695_configure_regulators(struct ov5695 *ov5695)
 				       ov5695->supplies);
 }
 
-static int ov5695_probe(struct i2c_client *client,
-			const struct i2c_device_id *id)
+static int ov5695_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
 	struct ov5695 *ov5695;
@@ -1393,7 +1392,7 @@ static struct i2c_driver ov5695_i2c_driver = {
 		.pm = &ov5695_pm_ops,
 		.of_match_table = of_match_ptr(ov5695_of_match),
 	},
-	.probe		= &ov5695_probe,
+	.probe_new	= &ov5695_probe,
 	.remove		= &ov5695_remove,
 };
 
-- 
2.39.1

