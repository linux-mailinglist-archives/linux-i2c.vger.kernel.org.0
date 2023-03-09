Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A00B6B20C5
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Mar 2023 10:58:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229878AbjCIJ6i (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Mar 2023 04:58:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229767AbjCIJ6h (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Mar 2023 04:58:37 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61EFF55502
        for <linux-i2c@vger.kernel.org>; Thu,  9 Mar 2023 01:58:36 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1paD2a-0001MR-Dp; Thu, 09 Mar 2023 10:58:28 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1paD2Y-002uwQ-A2; Thu, 09 Mar 2023 10:58:26 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1paD2X-003Vrl-Ij; Thu, 09 Mar 2023 10:58:25 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Wolfram Sang <wsa@kernel.org>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>, kernel@pengutronix.de,
        linux-i2c@vger.kernel.org
Subject: [PATCH] i2c: sprd: Delete i2c adapter in .remove's error path
Date:   Thu,  9 Mar 2023 10:58:19 +0100
Message-Id: <20230309095819.2569646-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1331; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=z3NGgQKZo5j0EusAU7NFCCFBebrMgHN1orxKRo5c0Xk=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkCa238KlozJ0rdncnUyasr8Vh2qUvsAuWFOMFL uJyH44iw6WJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZAmttwAKCRDB/BR4rcrs CeUzB/9ykgEJYhTB74fYUvxlYAHBXXl/PNmgeUKCUmU/isKdUQohUVw+NoT72R4koQ72yWVu+6D 4I33ulMdWggG6zebT2jrmV2dri1NmFOjgylPzBZW4aHa3kGiqnWDmqf5Sdz/13zpGMfl0U+ngbT fKV9lvCxNaBxxDkIUsGhISWkmgBoCU+jM49xbobVcde46p614EHEnaG7I6IzfEjvrGi6FH/AZol bmvp8q0wnyovkmR+EasqxM6glt6f4dRdMNGIf+CBwBriNT6KorJo0tkTmWAlecwtmhawxhVOnXu ojAAFLmoFqU/gDg5g3Z2Fo8XB1XvhBPXn8mzFZhGYOq0s+DP
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

If pm runtime resume fails the .remove callback used to exit early. This
resulted in an error message by the driver core but the device gets
removed anyhow. This lets the registered i2c adapter stay around with an
unbound parent device.

So only skip clk disabling if resume failed, but do delete the adapter.

Fixes: 8b9ec0719834 ("i2c: Add Spreadtrum I2C controller driver")
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/i2c/busses/i2c-sprd.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-sprd.c b/drivers/i2c/busses/i2c-sprd.c
index 4fe15cd78907..ffc54fbf814d 100644
--- a/drivers/i2c/busses/i2c-sprd.c
+++ b/drivers/i2c/busses/i2c-sprd.c
@@ -576,12 +576,14 @@ static int sprd_i2c_remove(struct platform_device *pdev)
 	struct sprd_i2c *i2c_dev = platform_get_drvdata(pdev);
 	int ret;
 
-	ret = pm_runtime_resume_and_get(i2c_dev->dev);
+	ret = pm_runtime_get_sync(i2c_dev->dev);
 	if (ret < 0)
-		return ret;
+		dev_err(&pdev->dev, "Failed to resume device (%pe)\n", ERR_PTR(ret));
 
 	i2c_del_adapter(&i2c_dev->adap);
-	clk_disable_unprepare(i2c_dev->clk);
+
+	if (ret >= 0)
+		clk_disable_unprepare(i2c_dev->clk);
 
 	pm_runtime_put_noidle(i2c_dev->dev);
 	pm_runtime_disable(i2c_dev->dev);
-- 
2.39.1

