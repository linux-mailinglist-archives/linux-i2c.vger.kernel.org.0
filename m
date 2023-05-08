Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5BA8D6FB8A6
	for <lists+linux-i2c@lfdr.de>; Mon,  8 May 2023 22:53:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233820AbjEHUxh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 May 2023 16:53:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233490AbjEHUxZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 May 2023 16:53:25 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A41D6A48
        for <linux-i2c@vger.kernel.org>; Mon,  8 May 2023 13:53:23 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rD-0003Kn-PA; Mon, 08 May 2023 22:53:19 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rC-0024rA-0o; Mon, 08 May 2023 22:53:18 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rB-002YWT-6T; Mon, 08 May 2023 22:53:17 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 27/89] i2c: ibm_iic: Convert to platform remove callback returning void
Date:   Mon,  8 May 2023 22:52:04 +0200
Message-Id: <20230508205306.1474415-28-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1687; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=xtCVmTzvb6T1siaMqYxwZUtfqZQ/Ja/cUL0QePzHD6s=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkWWCguizr7j1q0cIdr8HY8eYARffMYoJf7Ab52 RzJxqiFMY+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFlgoAAKCRCPgPtYfRL+ TgmsCAC03kKN4IZEQpMnD2NjUmVQVV6bTOeUtQIjxec5ATdKyKQiPwdolfMFjXb2aAsZX4rH/3V /g3arNfiy/PneZ1HF4UmFsI6PGKn+sE9lJ5K9MHx4lqdH0EFA8KuITp9sPQDLAmUE+l1uGonc1Y 9vMiAQ2x5m0OmiyUo7jNRIT7bW5BIU1TlQFupf8iKc8HmTZjOxWSm5NEx15FCY6UaczkTQLuvhv fKtdYHgmprTxIQc13Ci5SDlfMEiDX70v48suYXlLBaEAsfbn29tx/HwndeVxv8HaCFaKy0q2K53 LabbaODg71Wn5wuExR1d/WLJIAM1WiJ/LE+I7Rc9euG0oRlE
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
 drivers/i2c/busses/i2c-ibm_iic.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-ibm_iic.c b/drivers/i2c/busses/i2c-ibm_iic.c
index eeb80e34f9ad..2d11577ded38 100644
--- a/drivers/i2c/busses/i2c-ibm_iic.c
+++ b/drivers/i2c/busses/i2c-ibm_iic.c
@@ -769,7 +769,7 @@ static int iic_probe(struct platform_device *ofdev)
 /*
  * Cleanup initialized IIC interface
  */
-static int iic_remove(struct platform_device *ofdev)
+static void iic_remove(struct platform_device *ofdev)
 {
 	struct ibm_iic_private *dev = platform_get_drvdata(ofdev);
 
@@ -782,8 +782,6 @@ static int iic_remove(struct platform_device *ofdev)
 
 	iounmap(dev->vaddr);
 	kfree(dev);
-
-	return 0;
 }
 
 static const struct of_device_id ibm_iic_match[] = {
@@ -798,7 +796,7 @@ static struct platform_driver ibm_iic_driver = {
 		.of_match_table = ibm_iic_match,
 	},
 	.probe	= iic_probe,
-	.remove	= iic_remove,
+	.remove_new = iic_remove,
 };
 
 module_platform_driver(ibm_iic_driver);
-- 
2.39.2

