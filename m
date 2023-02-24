Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51A0B6A1BD2
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Feb 2023 13:06:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229934AbjBXMGV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 24 Feb 2023 07:06:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229908AbjBXMGT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 24 Feb 2023 07:06:19 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAADB658C7
        for <linux-i2c@vger.kernel.org>; Fri, 24 Feb 2023 04:06:18 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pVWq5-0000cr-Po; Fri, 24 Feb 2023 13:06:13 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pVWq2-007Azy-Ff; Fri, 24 Feb 2023 13:06:11 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pVWq3-006EZ9-0k; Fri, 24 Feb 2023 13:06:11 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     kernel@pengutronix.de,
        Michael Hennerich <michael.hennerich@analog.com>,
        Peter Rosin <peda@axentia.se>,
        Guenter Roeck <linux@roeck-us.net>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 8/9] i2c: mux: Convert all drivers to new .probe() callback
Date:   Fri, 24 Feb 2023 13:05:59 +0100
Message-Id: <20230224120600.1681685-9-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230224120600.1681685-1-u.kleine-koenig@pengutronix.de>
References: <20230224120600.1681685-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1908; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=HxKNKaD00JoFVk6SwuLkqQlTsGt6ppNbQZJbFgHADZM=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBj+Kge0A/yvIYizp+VRjhKF1BWVxexmJ3/e8od7 5Fk7GMtqJCJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY/ioHgAKCRDB/BR4rcrs CccACACWHBowhYVb19QXDMNU1/SaBt3C/AeioycgWCTrWlkkJ5ZXruliVYX+6b/jwmGg4QZUXxE pssD7dRtb3mudFvdne6kCBnYo8bFmch7MEnaFCsoK6Kr3AdUqX65lUKja9vPsHoISfgRdsBy4sG hl4dm22sq8TClpBlLGoNVqajAwWG3XAenNX4a55IhPoJhLXTO82SN0Bn1OKSfE1P0gemYuvhtq6 pK4j75pA1NBd0saoNKJ8rjJCzw01+EvU4Anl1ZiFdTHqt9IeGTdnSZqhFnkrGTJhSQL+QwKl3Ds RSsdldPGxh/8Aq4Kg38r2TEE2+CgypfEqMiEukk1PdFwfPOq
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

Now that .probe() was changed not to get the id parameter, drivers can
be converted back to that with the eventual goal to drop .probe_new().

Implement that for the i2c mux drivers.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/i2c/muxes/i2c-mux-ltc4306.c | 2 +-
 drivers/i2c/muxes/i2c-mux-pca9541.c | 2 +-
 drivers/i2c/muxes/i2c-mux-pca954x.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/muxes/i2c-mux-ltc4306.c b/drivers/i2c/muxes/i2c-mux-ltc4306.c
index 70835825083f..5a03031519be 100644
--- a/drivers/i2c/muxes/i2c-mux-ltc4306.c
+++ b/drivers/i2c/muxes/i2c-mux-ltc4306.c
@@ -306,7 +306,7 @@ static struct i2c_driver ltc4306_driver = {
 		.name	= "ltc4306",
 		.of_match_table = of_match_ptr(ltc4306_of_match),
 	},
-	.probe_new	= ltc4306_probe,
+	.probe		= ltc4306_probe,
 	.remove		= ltc4306_remove,
 	.id_table	= ltc4306_id,
 };
diff --git a/drivers/i2c/muxes/i2c-mux-pca9541.c b/drivers/i2c/muxes/i2c-mux-pca9541.c
index 09d1d9e67e31..ce0fb69249a8 100644
--- a/drivers/i2c/muxes/i2c-mux-pca9541.c
+++ b/drivers/i2c/muxes/i2c-mux-pca9541.c
@@ -336,7 +336,7 @@ static struct i2c_driver pca9541_driver = {
 		   .name = "pca9541",
 		   .of_match_table = of_match_ptr(pca9541_of_match),
 		   },
-	.probe_new = pca9541_probe,
+	.probe = pca9541_probe,
 	.remove = pca9541_remove,
 	.id_table = pca9541_id,
 };
diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mux-pca954x.c
index 3639e6d7304c..0ccee2ae5720 100644
--- a/drivers/i2c/muxes/i2c-mux-pca954x.c
+++ b/drivers/i2c/muxes/i2c-mux-pca954x.c
@@ -554,7 +554,7 @@ static struct i2c_driver pca954x_driver = {
 		.pm	= &pca954x_pm,
 		.of_match_table = pca954x_of_match,
 	},
-	.probe_new	= pca954x_probe,
+	.probe		= pca954x_probe,
 	.remove		= pca954x_remove,
 	.id_table	= pca954x_id,
 };
-- 
2.39.1

