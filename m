Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93BD56FB8C2
	for <lists+linux-i2c@lfdr.de>; Mon,  8 May 2023 22:53:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233217AbjEHUxy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 May 2023 16:53:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233092AbjEHUxg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 May 2023 16:53:36 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 175CD7D99
        for <linux-i2c@vger.kernel.org>; Mon,  8 May 2023 13:53:31 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rN-0003vM-LE; Mon, 08 May 2023 22:53:29 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rM-0024u2-Tq; Mon, 08 May 2023 22:53:28 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rL-002YYs-Tx; Mon, 08 May 2023 22:53:27 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Jim Cromie <jim.cromie@gmail.com>, Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 64/89] i2c: scx200_acb: Convert to platform remove callback returning void
Date:   Mon,  8 May 2023 22:52:41 +0200
Message-Id: <20230508205306.1474415-65-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1614; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=QzQ9+MZooMLjtenWD3Llxxu7U3qZCFGbVHTFdbjQ00A=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkWWD+4wmzYI0ySfXtNxLrtGwqOMNyTIb7WBZFH w7OxtOFr0OJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFlg/gAKCRCPgPtYfRL+ TgtmCACbSYbyhOfaijDch/FCaOrPG5XXRshT3oimVJw5qvi3gtPEvjN9L72RlhdG/f2jPwdCWj1 sCZrQPAKb1vtAlusktqo7/ioV1MC+oLYH7CImgQH6LiP/NafAVX59w5CNBOXPqv2WowOOgKUoBC 8OCTRib8VWbWQUVKIRC0Ioih/BDu8VNKfz72e4rXjSyZbYbOzl1tAgj86+LE8legxjt53NSf2Vj ygfnoaab0GNP0WgdVobLoQ50BuqtYuwIHlWaI2B4+mKB1VdGGJ4JFNyYlnel4aXH59a8LQCl1uN GklCw6ypHcYR7qq7AWjlQFD2QmPY2XBS53uus6Chh0ELttVp
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
 drivers/i2c/busses/scx200_acb.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/scx200_acb.c b/drivers/i2c/busses/scx200_acb.c
index 7b42a18bd05c..83c1db610f54 100644
--- a/drivers/i2c/busses/scx200_acb.c
+++ b/drivers/i2c/busses/scx200_acb.c
@@ -523,14 +523,12 @@ static void scx200_cleanup_iface(struct scx200_acb_iface *iface)
 	kfree(iface);
 }
 
-static int scx200_remove(struct platform_device *pdev)
+static void scx200_remove(struct platform_device *pdev)
 {
 	struct scx200_acb_iface *iface;
 
 	iface = platform_get_drvdata(pdev);
 	scx200_cleanup_iface(iface);
-
-	return 0;
 }
 
 static struct platform_driver scx200_pci_driver = {
@@ -538,7 +536,7 @@ static struct platform_driver scx200_pci_driver = {
 		.name = "cs5535-smb",
 	},
 	.probe = scx200_probe,
-	.remove = scx200_remove,
+	.remove_new = scx200_remove,
 };
 
 static const struct pci_device_id scx200_isa[] = {
-- 
2.39.2

