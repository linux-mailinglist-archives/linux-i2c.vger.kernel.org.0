Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F16E560514A
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Oct 2022 22:28:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229674AbiJSU2X (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 Oct 2022 16:28:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229977AbiJSU2W (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 19 Oct 2022 16:28:22 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72CB61C7D71
        for <linux-i2c@vger.kernel.org>; Wed, 19 Oct 2022 13:28:21 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1olFfl-0006NL-Ai; Wed, 19 Oct 2022 22:28:17 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1olFfk-000C5o-Cx; Wed, 19 Oct 2022 22:28:16 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1olFfj-009A2Q-Mi; Wed, 19 Oct 2022 22:28:15 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Michal Simek <michal.simek@xilinx.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH] i2c: xiic: Make sure to disable clock on .remove()
Date:   Wed, 19 Oct 2022 22:28:08 +0200
Message-Id: <20221019202808.88779-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1320; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=45GzRRjuX/VSl9LLmeognLTfDYmQ86edRtzvlckpPuk=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBjUF3VyZIX2MufSq5wpnebZ7jowbSxcqUaakjRMWTv 1R677biJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY1Bd1QAKCRDB/BR4rcrsCcuDB/ wPMRVWiOXLqWxjil+sR30icwbEaP8wjgktuMmFtXqee9kTnBsl1821V3NYcURPPoC1VizmTx5ph9UA rzi7v0QuJWu1chMA4St5hTFGX/w46jRJCo00tKwaEc+bWZCdxYDTku5Vm5k2yMaq/8z/EB30GfY/Dv /V2ELDi5+/DZR6UJZxaDGNUnNAmFFj6S0MQ5+FjQW6OZaZk27EWYyFTjCQlQgRng3ftakh9a2wmLKV qDeQaLJJlimiRZ0gmayRybU9pzkk97+10gNHafP3M1WzIcCKjwp5VqwKH9hw4hNfTwpMNnP8qHmWiT qHHpf0c5VBYpXJENPcWRSlwRUfZp2A
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

If for whatever reasons pm_runtime_resume_and_get() failed, .remove() is
exited early, the clock isn't freed and runtime PM state isn't reset.

The right thing to do however is to free all resources that don't need
HW access after a problem with runtime PM. Also issue a warning in that
case and return 0 to suppress a less helpful warning by the driver core.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/i2c/busses/i2c-xiic.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index b3fe6b2aa3ca..809d6eadae2d 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -858,11 +858,14 @@ static int xiic_i2c_remove(struct platform_device *pdev)
 	/* remove adapter & data */
 	i2c_del_adapter(&i2c->adap);
 
-	ret = pm_runtime_resume_and_get(i2c->dev);
+	ret = pm_runtime_get_sync(i2c->dev);
+
 	if (ret < 0)
-		return ret;
+		dev_warn(&pdev->dev, "Failed to activate device for removal (%pe)\n",
+			 ERR_PTR(ret));
+	else
+		xiic_deinit(i2c);
 
-	xiic_deinit(i2c);
 	pm_runtime_put_sync(i2c->dev);
 	clk_disable_unprepare(i2c->clk);
 	pm_runtime_disable(&pdev->dev);

base-commit: 9abf2313adc1ca1b6180c508c25f22f9395cc780
-- 
2.37.2

