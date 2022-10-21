Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 080C4607184
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Oct 2022 09:56:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229731AbiJUH4I (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 Oct 2022 03:56:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229729AbiJUH4G (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 21 Oct 2022 03:56:06 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3022198443
        for <linux-i2c@vger.kernel.org>; Fri, 21 Oct 2022 00:56:05 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1olmsu-0000CN-0E; Fri, 21 Oct 2022 09:56:04 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1olmsr-000TTW-0e; Fri, 21 Oct 2022 09:56:03 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1olmss-009WDY-KA; Fri, 21 Oct 2022 09:56:02 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-pwm@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: [PATCH] pwm: pca9685: Convert to .probe_new()
Date:   Fri, 21 Oct 2022 09:55:51 +0200
Message-Id: <20221021075551.168897-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1139; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=Xk1N0WK9qWt0LwnjhpXwrz4Y6dF05EHtbWaHG1PwhxI=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBjUlCE1qhna2aB0I0Icb1AJ2sKSG+OaCF1EqAm7y5p qEN5Q9WJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY1JQhAAKCRDB/BR4rcrsCSN0CA CdoSYjaeYgY6fbSjgTpmoe7Sk4LAfLKNuya5BZxhbUaZBANOlNZvQOS0G/nqblh7KxuGjZSK1KKVNS zRN+6hfBUkHK2SZOdf5WxYwK08joY7WDg0ZZTOFU94MWJqITLJla0rvIjH3vWp53HFqZnvAJY4Q/hF 8p0OM2TCuuub/Y901+8r0dpZfrX7bCU/Iu1ULgULOifqAQlHY8wwkQZvt+Kt7fvaiuCrooQPzk2GgX GmJ3VB0jiMDusO92XA/90ddO/q36AD1V2lFUsS3hGD7GsRNCFWBeQKmQOA+KtpOUrGhE1JLf58Wt9T u6ESV217VzYxTZv3Z26ngK5sCeFoVC
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The probe function doesn't make use of the id parameter, so the driver
can be converted trivially to .probe_new().

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/pwm/pwm-pca9685.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/pwm/pwm-pca9685.c b/drivers/pwm/pwm-pca9685.c
index f230c10d28bb..e00152257cbe 100644
--- a/drivers/pwm/pwm-pca9685.c
+++ b/drivers/pwm/pwm-pca9685.c
@@ -513,8 +513,7 @@ static const struct regmap_config pca9685_regmap_i2c_config = {
 	.cache_type = REGCACHE_NONE,
 };
 
-static int pca9685_pwm_probe(struct i2c_client *client,
-				const struct i2c_device_id *id)
+static int pca9685_pwm_probe(struct i2c_client *client)
 {
 	struct pca9685 *pca;
 	unsigned int reg;
@@ -664,7 +663,7 @@ static struct i2c_driver pca9685_i2c_driver = {
 		.of_match_table = of_match_ptr(pca9685_dt_ids),
 		.pm = &pca9685_pwm_pm,
 	},
-	.probe = pca9685_pwm_probe,
+	.probe_new = pca9685_pwm_probe,
 	.remove = pca9685_pwm_remove,
 	.id_table = pca9685_id,
 };

base-commit: 9abf2313adc1ca1b6180c508c25f22f9395cc780
-- 
2.37.2

