Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 593146FB88A
	for <lists+linux-i2c@lfdr.de>; Mon,  8 May 2023 22:53:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229492AbjEHUxV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 May 2023 16:53:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229961AbjEHUxS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 May 2023 16:53:18 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 132815FC8
        for <linux-i2c@vger.kernel.org>; Mon,  8 May 2023 13:53:17 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7r7-00030p-O5; Mon, 08 May 2023 22:53:13 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7r6-0024pi-G4; Mon, 08 May 2023 22:53:12 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7r5-002YVL-Ku; Mon, 08 May 2023 22:53:11 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Kamal Dasu <kdasu.kdev@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Wolfram Sang <wsa@kernel.org>
Cc:     Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
Subject: [PATCH 10/89] i2c: brcmstb: Convert to platform remove callback returning void
Date:   Mon,  8 May 2023 22:51:47 +0200
Message-Id: <20230508205306.1474415-11-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1594; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=CW7YoHWFzYwKzxm8Ql2tW48F8WxT5isVOm+9atOrvJQ=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkWWBVmLXc1LJiSG4anuS0SqwGdqPU439VNdKih JmaIauavqGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFlgVQAKCRCPgPtYfRL+ TnNECACv1fsNqRj0t4Xl67SKvqw/kvuPyd33x3zUQnLnSsag+Aw7VJGJej3vnbksuivGKxWwUtH OBDg3GGWhOf5RJManaykSoVLhd3x/wUZ3Awvn2US6ufpmf/006Ui++1dIXnHVIng2cdqqXK7XON SFDpU8jDTCF2czyNlYmj7V5PDBby1y5r5cqwHMUj/Zwf2nkCRYyIxYqX5LcPRyzfUHT+t+NmRmj uJ6+olnMezi2XvlmwACY+Wtd52KPsLLOxf6FTU1BbYGDxS/psHeOylysIqJjK7tvlOvtUSx1tDo OSQmteRyvg0HIcSYEjYSVvfrTkzmOCsLgJJYoffOyEGwW751
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
 drivers/i2c/busses/i2c-brcmstb.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-brcmstb.c b/drivers/i2c/busses/i2c-brcmstb.c
index ef942714642a..cf92cbcb8c86 100644
--- a/drivers/i2c/busses/i2c-brcmstb.c
+++ b/drivers/i2c/busses/i2c-brcmstb.c
@@ -690,12 +690,11 @@ static int brcmstb_i2c_probe(struct platform_device *pdev)
 	return rc;
 }
 
-static int brcmstb_i2c_remove(struct platform_device *pdev)
+static void brcmstb_i2c_remove(struct platform_device *pdev)
 {
 	struct brcmstb_i2c_dev *dev = platform_get_drvdata(pdev);
 
 	i2c_del_adapter(&dev->adapter);
-	return 0;
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -736,7 +735,7 @@ static struct platform_driver brcmstb_i2c_driver = {
 		   .pm = &brcmstb_i2c_pm,
 		   },
 	.probe = brcmstb_i2c_probe,
-	.remove = brcmstb_i2c_remove,
+	.remove_new = brcmstb_i2c_remove,
 };
 module_platform_driver(brcmstb_i2c_driver);
 
-- 
2.39.2

