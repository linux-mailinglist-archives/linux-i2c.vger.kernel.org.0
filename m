Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA3FC534FCA
	for <lists+linux-i2c@lfdr.de>; Thu, 26 May 2022 15:12:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237966AbiEZNM2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 26 May 2022 09:12:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230010AbiEZNM0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 26 May 2022 09:12:26 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 145B6D6825
        for <linux-i2c@vger.kernel.org>; Thu, 26 May 2022 06:12:24 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1nuDHq-0003wu-FR; Thu, 26 May 2022 15:12:22 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nuDHq-004gV4-Vy; Thu, 26 May 2022 15:12:21 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nuDHo-00CFzW-T1; Thu, 26 May 2022 15:12:20 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH] i2c: dummy: Drop no-op remove function
Date:   Thu, 26 May 2022 15:12:13 +0200
Message-Id: <20220526131213.1591909-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=872; h=from:subject; bh=StQ2EOIhTbR9dAkeEx3hcctKNvhl7Y6Di8b00CuUESU=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBij3ypd9bGv2r2o29wYpPgV4drx+VINxamBGUlGwWg awW9cEuJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYo98qQAKCRDB/BR4rcrsCaaZB/ 0ZnoDtRMcEnfHgfqF4p55BpfpCjX+gr+V3XC2/h8pxbXrNLOd+i493Qij9Zctu4gyE6sJbOlRwT8Pk PcI60oXD943hG06hK7/Iz/rewzBWFWp1V4hz5QLCjLwoca5h7K8ldZnLm4cjj5lI581cEbkmCq3g8m K0eB7t3tvCurupimioUyePz8VktDuhIQWMEHjrFAj38lNaQeKVgY1trbKdHa/FDs1u10wo/ES/xlc2 FBN5al9lBnihzoQDARL2grodD4rMmiRXRWI/I8PLN8eZPNy2vJVE7XR5FzL6XGrvW0vKFFvYbe/P33 m4CQgvaTWorG/NCmxxdvM/Uyo49Fqo
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

A remove callback that just returns 0 is equivalent to no callback at all
as can be seen in i2c_device_remove(). So simplify accordingly.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/i2c/i2c-core-base.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index d43db2c3876e..8ae47e0bbd67 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -1023,15 +1023,9 @@ static int dummy_probe(struct i2c_client *client,
 	return 0;
 }
 
-static int dummy_remove(struct i2c_client *client)
-{
-	return 0;
-}
-
 static struct i2c_driver dummy_driver = {
 	.driver.name	= "dummy",
 	.probe		= dummy_probe,
-	.remove		= dummy_remove,
 	.id_table	= dummy_id,
 };
 

base-commit: 4b0986a3613c92f4ec1bdc7f60ec66fea135991f
-- 
2.36.1

