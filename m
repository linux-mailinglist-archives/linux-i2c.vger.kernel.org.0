Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 213E26A34AA
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Feb 2023 23:27:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229512AbjBZW1Z (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 26 Feb 2023 17:27:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229756AbjBZW1U (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 26 Feb 2023 17:27:20 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A14419687
        for <linux-i2c@vger.kernel.org>; Sun, 26 Feb 2023 14:27:18 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pWPU0-0000v8-AW; Sun, 26 Feb 2023 23:27:04 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pWPTw-000Uba-C8; Sun, 26 Feb 2023 23:27:00 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pWPTv-000YPi-0o; Sun, 26 Feb 2023 23:26:59 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Ajay Gupta <ajayg@nvidia.com>,
        Peter Senna Tschudin <peter.senna@gmail.com>,
        Vladimir Oltean <olteanv@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/9] mtd: maps: pismo: Convert to i2c's .probe_new()
Date:   Sun, 26 Feb 2023 23:26:47 +0100
Message-Id: <20230226222654.1741900-3-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230226222654.1741900-1-u.kleine-koenig@pengutronix.de>
References: <20230226222654.1741900-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1138; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=/0eiJPqFeurijjpkwmurJqwpYiXoK4/V9TBQsEVUx4E=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBj+9yRBq230DjtR0OENDTBnqh3jGbv7HQJOiXLd 6y9xrOx10OJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY/vckQAKCRDB/BR4rcrs CTA9B/44dD9HbqxPEM1quEbcSClDz0+khag7g3WMiBZYqp0NQUhHoEzVubo0MNIW3eQntOL/jEr BUqYwmnu01MOnvQlonYfDZ9KYnGGSk8yeeoofU6PFw0HPe77Lax0squYs1gYyAAkO6x5MWKEdin 5lH5BwfSpcGaBD8JIj+/CkOUgD/9LCdlw7nhaRI+CaAZEUXGQELlHXUUgh7lUll+g5RfvmfNQJ2 OyWSx7t6ao355A1fdCMEB1f01euonq+Xqw3JhVxOA57vUxBj1qHaOACp0rDCN3TOGMITIj8w4vg aRiaTITHPGxGTNG0hBZmjBmtGs+/bL20DV3Bvq6rMUlq5291
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

Acked-by: Richard Weinberger <richard@nod.at>
Link: https://lore.kernel.org/lkml/20221118224540.619276-497-uwe@kleine-koenig.org
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/mtd/maps/pismo.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/maps/pismo.c b/drivers/mtd/maps/pismo.c
index 5fcefcd0baca..3e0fff3f129e 100644
--- a/drivers/mtd/maps/pismo.c
+++ b/drivers/mtd/maps/pismo.c
@@ -206,8 +206,7 @@ static void pismo_remove(struct i2c_client *client)
 	kfree(pismo);
 }
 
-static int pismo_probe(struct i2c_client *client,
-		       const struct i2c_device_id *id)
+static int pismo_probe(struct i2c_client *client)
 {
 	struct pismo_pdata *pdata = client->dev.platform_data;
 	struct pismo_eeprom eeprom;
@@ -260,7 +259,7 @@ static struct i2c_driver pismo_driver = {
 	.driver	= {
 		.name	= "pismo",
 	},
-	.probe		= pismo_probe,
+	.probe_new	= pismo_probe,
 	.remove		= pismo_remove,
 	.id_table	= pismo_id,
 };
-- 
2.39.1

