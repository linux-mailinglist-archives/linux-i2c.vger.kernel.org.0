Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C793E6A349E
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Feb 2023 23:27:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229728AbjBZW1K (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 26 Feb 2023 17:27:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229723AbjBZW1J (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 26 Feb 2023 17:27:09 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87BD112589
        for <linux-i2c@vger.kernel.org>; Sun, 26 Feb 2023 14:27:08 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pWPTw-0000v5-RD; Sun, 26 Feb 2023 23:27:00 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pWPTv-000UbO-ES; Sun, 26 Feb 2023 23:26:59 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pWPTu-000YPf-PA; Sun, 26 Feb 2023 23:26:58 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/9] misc: ad525x_dpot-i2c: Convert to i2c's .probe_new()
Date:   Sun, 26 Feb 2023 23:26:46 +0100
Message-Id: <20230226222654.1741900-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230226222654.1741900-1-u.kleine-koenig@pengutronix.de>
References: <20230226222654.1741900-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1292; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=mZMy4fIoX9VoX671/ujh3l6dvR2sZ0vFBfJ5QYZaI/k=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBj+9yNWYZ8keqte4NLP53S5uCaMlHf1ql5crSHa pOrSxDbA+KJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY/vcjQAKCRDB/BR4rcrs CRNrB/9xJRsxeCe2WhSDMmQXgiUB1D1+t6w6SNAKPQOGWwb2DN5wszUF6TT9xlpet/QX612sXab FaeqgQCm7d6h6zkNBdRhHePJJsL/WyoG0EQ6N1ImvY29MLm6X55wTonCVdjfBl9VxS8Y4bij+Jv DBMNTB7karGOnjav7IURRMuPARTdTv0X+3BP7IDeDdSUHj3s5+UGRNUe3Z/x/6PxapCEZwCqeFU FFKEFMONORXgK9WYhtBckPa+8JPMbqolL9G5Q3ZiG5qaZP7SRC7c868KVlOKFFpTIzJ+jGV0gUp 7LucODTt6Z7nuooZwbWzH5A2/WBpBSh9Tx1VziSi/W5sH/ji
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

.probe_new() doesn't get the i2c_device_id * parameter, so determine
that explicitly in the probe function.

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Link: https://lore.kernel.org/lkml/20221118224540.619276-483-uwe@kleine-koenig.org
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/misc/ad525x_dpot-i2c.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/misc/ad525x_dpot-i2c.c b/drivers/misc/ad525x_dpot-i2c.c
index 28ffb4377d98..3856d5c04c5f 100644
--- a/drivers/misc/ad525x_dpot-i2c.c
+++ b/drivers/misc/ad525x_dpot-i2c.c
@@ -50,9 +50,9 @@ static const struct ad_dpot_bus_ops bops = {
 	.write_r8d16	= write_r8d16,
 };
 
-static int ad_dpot_i2c_probe(struct i2c_client *client,
-				      const struct i2c_device_id *id)
+static int ad_dpot_i2c_probe(struct i2c_client *client)
 {
+	const struct i2c_device_id *id = i2c_client_get_device_id(client);
 	struct ad_dpot_bus_data bdata = {
 		.client = client,
 		.bops = &bops,
@@ -106,7 +106,7 @@ static struct i2c_driver ad_dpot_i2c_driver = {
 	.driver = {
 		.name	= "ad_dpot",
 	},
-	.probe		= ad_dpot_i2c_probe,
+	.probe_new	= ad_dpot_i2c_probe,
 	.remove		= ad_dpot_i2c_remove,
 	.id_table	= ad_dpot_id,
 };
-- 
2.39.1

