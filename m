Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3EB46FB892
	for <lists+linux-i2c@lfdr.de>; Mon,  8 May 2023 22:53:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232643AbjEHUx0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 May 2023 16:53:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230101AbjEHUxW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 May 2023 16:53:22 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14DC65BAA
        for <linux-i2c@vger.kernel.org>; Mon,  8 May 2023 13:53:21 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7r8-00030h-ED; Mon, 08 May 2023 22:53:14 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7r5-0024pR-QS; Mon, 08 May 2023 22:53:11 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7r4-002YVA-NV; Mon, 08 May 2023 22:53:10 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Allison Randal <allison@lohutok.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Wolfram Sang <wsa@kernel.org>
Cc:     Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
Subject: [PATCH 07/89] i2c: bcm-iproc: Convert to platform remove callback returning void
Date:   Mon,  8 May 2023 22:51:44 +0200
Message-Id: <20230508205306.1474415-8-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1796; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=Wy3wxwpAuNH7nBc7blfHuHYEiPWLxCUdIcHQxPMFFE8=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkWWBSQPHv7qucen8RLdBHNbAoY+k8/1IcxWEcr 9HTnpW7xnCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFlgUgAKCRCPgPtYfRL+ TmCeCACUu9ke+Sk3LN/9e2+u3ZJJNdAxsh2zpWSYIMQyoXsunLYywnGyeyjXCgQnjGZDM8jcQr1 oLvW6aQoK1IBGhPEealQAwKGi1vo1nd/WDxV0fTXqGDK+d9ZThNZsumM+cHOYKUgrYz8uZwzlrA xfXuW4FYI3knP+yj/LP7bCgWPkmBqF/wbh5/xCQWaNRhcHxAt8wqJkEnXR9QaNAkCN8IkO+hJuc +300LZBTsnsgRd/snxA8pYa4RJx/6LP5oJt6MzIpphhdpzgN0y6Tt//HEiEk+FZj4tYGxPNsK6q hgcsXzaoat0xkHd9GnpcofLDQipTAfk6MN3Qav5R2RuYUW28
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
 drivers/i2c/busses/i2c-bcm-iproc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-bcm-iproc.c b/drivers/i2c/busses/i2c-bcm-iproc.c
index 85d8a6b04885..2d8342fdc25d 100644
--- a/drivers/i2c/busses/i2c-bcm-iproc.c
+++ b/drivers/i2c/busses/i2c-bcm-iproc.c
@@ -1107,7 +1107,7 @@ static int bcm_iproc_i2c_probe(struct platform_device *pdev)
 	return i2c_add_adapter(adap);
 }
 
-static int bcm_iproc_i2c_remove(struct platform_device *pdev)
+static void bcm_iproc_i2c_remove(struct platform_device *pdev)
 {
 	struct bcm_iproc_i2c_dev *iproc_i2c = platform_get_drvdata(pdev);
 
@@ -1123,8 +1123,6 @@ static int bcm_iproc_i2c_remove(struct platform_device *pdev)
 
 	i2c_del_adapter(&iproc_i2c->adapter);
 	bcm_iproc_i2c_enable_disable(iproc_i2c, false);
-
-	return 0;
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -1260,7 +1258,7 @@ static struct platform_driver bcm_iproc_i2c_driver = {
 		.pm = BCM_IPROC_I2C_PM_OPS,
 	},
 	.probe = bcm_iproc_i2c_probe,
-	.remove = bcm_iproc_i2c_remove,
+	.remove_new = bcm_iproc_i2c_remove,
 };
 module_platform_driver(bcm_iproc_i2c_driver);
 
-- 
2.39.2

