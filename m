Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE4296FB8C4
	for <lists+linux-i2c@lfdr.de>; Mon,  8 May 2023 22:53:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233758AbjEHUxz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 May 2023 16:53:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233828AbjEHUxh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 May 2023 16:53:37 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 204975FCD
        for <linux-i2c@vger.kernel.org>; Mon,  8 May 2023 13:53:32 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rO-0003vw-4A; Mon, 08 May 2023 22:53:30 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rN-0024uG-CR; Mon, 08 May 2023 22:53:29 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rM-002YZ1-NI; Mon, 08 May 2023 22:53:28 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 67/89] i2c: simtec: Convert to platform remove callback returning void
Date:   Mon,  8 May 2023 22:52:44 +0200
Message-Id: <20230508205306.1474415-68-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1719; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=m0BTe0MqWKN1OK2aVqeDINMmaMGJahGbaQ+4EaXVd0Q=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkWWECTYoFPZURr3MsdNL/ix5L0HJLecRuaYZvm ncbnysF92aJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFlhAgAKCRCPgPtYfRL+ TljJB/4pp8A8yvfKdJ7h3JANhebJzfGegCY0UzObTX5FN8ogoT7nDG0GvUgHjEO5T2maDu+aIGB wBlCrS2uL4Mqda0LdAAzwR9fYJNZdC+LOEOngLtC7b3sVeS2VqpgvzCwo7KBbM7NXgZFPKqb9Gd L6ii4bfYdXV1iF9s3u0X+GC1QE8ISTO6dTkK6fBSLrqBfBHB50zjCxY5++Xmb77SeSeM8JbsqXa iC+QXsC4s735xSIxCVl8P/l81VExKwy8rgUjK+eLXHi/gFpCNBWDE/bzWSOhuTCotJcLJ0Oy3QZ 1fngJFOyNXNUBXjyJ7ZXEsPef5oTPeZ6JVJD26qsUXi21ygL
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

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is (mostly) ignored
and this typically results in resource leaks. To improve here there is a
quest to make the remove callback return void. In the first step of this
quest all drivers are converted to .remove_new() which already returns
void.

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/i2c/busses/i2c-simtec.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-simtec.c b/drivers/i2c/busses/i2c-simtec.c
index 87701744752f..18516bc64e04 100644
--- a/drivers/i2c/busses/i2c-simtec.c
+++ b/drivers/i2c/busses/i2c-simtec.c
@@ -126,7 +126,7 @@ static int simtec_i2c_probe(struct platform_device *dev)
 	return ret;
 }
 
-static int simtec_i2c_remove(struct platform_device *dev)
+static void simtec_i2c_remove(struct platform_device *dev)
 {
 	struct simtec_i2c_data *pd = platform_get_drvdata(dev);
 
@@ -135,8 +135,6 @@ static int simtec_i2c_remove(struct platform_device *dev)
 	iounmap(pd->reg);
 	release_mem_region(pd->ioarea->start, resource_size(pd->ioarea));
 	kfree(pd);
-
-	return 0;
 }
 
 /* device driver */
@@ -146,7 +144,7 @@ static struct platform_driver simtec_i2c_driver = {
 		.name		= "simtec-i2c",
 	},
 	.probe		= simtec_i2c_probe,
-	.remove		= simtec_i2c_remove,
+	.remove_new	= simtec_i2c_remove,
 };
 
 module_platform_driver(simtec_i2c_driver);
-- 
2.39.2

