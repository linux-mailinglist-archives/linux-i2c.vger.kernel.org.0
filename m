Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5442052F171
	for <lists+linux-i2c@lfdr.de>; Fri, 20 May 2022 19:21:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352126AbiETRVl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 20 May 2022 13:21:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352124AbiETRVg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 20 May 2022 13:21:36 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6343B3917C
        for <linux-i2c@vger.kernel.org>; Fri, 20 May 2022 10:21:33 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1ns6JN-0006KE-25; Fri, 20 May 2022 19:21:13 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1ns6JM-003Wcq-7W; Fri, 20 May 2022 19:21:10 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1ns6JK-00B114-3B; Fri, 20 May 2022 19:21:10 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Tudor Ambarus <tudor.ambarus@microchip.com>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        linux-crypto@vger.kernel.org, kernel@pengutronix.de,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Subject: [PATCH] crypto: atmel-ecc - Remove duplicated error reporting in .remove()
Date:   Fri, 20 May 2022 19:21:00 +0200
Message-Id: <20220520172100.773730-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <7ffd4d35-938a-3e82-b39b-92e76819fa92@microchip.com>
References: <7ffd4d35-938a-3e82-b39b-92e76819fa92@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1834; h=from:subject; bh=gA8wq0ZCl1/fS/XbCP60/5QOOg3haX5yuDKAvNbEKLg=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBih831UtGTMJeJU/pnRA/AxHGP6a1bWuonNka+UeSG LhmyPICJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYofN9QAKCRDB/BR4rcrsCa0XCA CfmVKb2YMsH0Zl7PCCsNGIGjn1yetCEEIOcvzLGt6QAurwKlyzsYUulVuxtYPNAqQKRGk1In7wntKx Vc8Zw8ej+Uisk4/E/nOi7k8OKj31KUzqRN8Yyy0SqiEdp7G4KEv19Xlozmn1VMXNAjPg6/qo6IxLO+ GIKxaWjbo/hvr1/5VeaN2BWrLM2W7JGLQihQW5SJ6PR5bSTQxylR+Dm6Mbd/ofFUQs29ixzFce9nk0 R4XlGsc8cBZxtn7NftKmlmXNbJUK31hHyFMbTslWKrdt9UVWQGqhqa5rcV8kPULFbAhYKBTW5UVB0F ayk0yVrLx8Vge0by5NiGGmEmKDYDjY
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Returning an error value in an i2c remove callback results in an error
message being emitted by the i2c core, but otherwise it doesn't make a
difference. The device goes away anyhow and the devm cleanups are
called.

As atmel_ecc_remove() already emits an error message on failure and the
additional error message by the i2c core doesn't add any useful
information, change the return value to zero to suppress this message.

Also make the error message a bit more drastical because when the device
is still busy on remove, it's likely that it will access freed memory
soon.

This patch is a preparation for making i2c remove callbacks return void.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/crypto/atmel-ecc.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/crypto/atmel-ecc.c b/drivers/crypto/atmel-ecc.c
index 333fbefbbccb..6ba38275de8c 100644
--- a/drivers/crypto/atmel-ecc.c
+++ b/drivers/crypto/atmel-ecc.c
@@ -349,8 +349,16 @@ static int atmel_ecc_remove(struct i2c_client *client)
 
 	/* Return EBUSY if i2c client already allocated. */
 	if (atomic_read(&i2c_priv->tfm_count)) {
-		dev_err(&client->dev, "Device is busy\n");
-		return -EBUSY;
+		/*
+		 * After we return here, the memory backing the device is freed.
+		 * That happens no matter what the return value of this function
+		 * is because in the Linux device model there is no error
+		 * handling for unbinding a driver.
+		 * If there is still some action pending, it probably involves
+		 * accessing the freed memory.
+		 */
+		dev_emerg(&client->dev, "Device is busy, expect memory corruption.\n");
+		return 0;
 	}
 
 	crypto_unregister_kpp(&atmel_ecdh_nist_p256);

base-commit: 3123109284176b1532874591f7c81f3837bbdc17
-- 
2.35.1

