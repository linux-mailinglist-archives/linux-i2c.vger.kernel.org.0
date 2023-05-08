Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7E996FB8B8
	for <lists+linux-i2c@lfdr.de>; Mon,  8 May 2023 22:53:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233289AbjEHUxr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 May 2023 16:53:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230101AbjEHUxd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 May 2023 16:53:33 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B08DC5FC8
        for <linux-i2c@vger.kernel.org>; Mon,  8 May 2023 13:53:28 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rH-0003ZX-Cs; Mon, 08 May 2023 22:53:23 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rG-0024s9-2o; Mon, 08 May 2023 22:53:22 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rF-002YXK-7E; Mon, 08 May 2023 22:53:21 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 40/89] i2c: mpc: Convert to platform remove callback returning void
Date:   Mon,  8 May 2023 22:52:17 +0200
Message-Id: <20230508205306.1474415-41-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1687; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=5uGkWzyFcrhOhDIu3HVMhH87dJlb++Qqfx1LfCDsock=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkWWDdzWwIWnv9uMLZ+CLHSG14LX5Mui7srNTeV Jt0SzuMyIWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFlg3QAKCRCPgPtYfRL+ TmhYB/9yKbpqr0L4rjl99IMR+3TdN4eNtD33ZzY5i/n73yD7E21H7vIbhczL+XHBk0Awfkxvrb7 z4RzPTHPsWEeXoYWU7qCN8R4/lYK0qG5e//ElLZpEYkBrlH2GE2UqDpLGEV/7++C3cEzfyx2n8f uY1UvMNQ7x79I1EDlWDlur8DjpQLVhEkwTtuEnpTu7gW1dPzS5cjijqPAVXFxxDlfbruLALGbx6 EFB0Mh7aC3GrPGL8bMHbLm29sK7/iZku2na9exQ8uhQpa5Ndsi5TFnyqlDi/FYqQp1STwMLYLY9 GW02dLIsEA0eT5k9adI8wBis7JJIWOAdREwjHlN4tSCbI97E
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
 drivers/i2c/busses/i2c-mpc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mpc.c b/drivers/i2c/busses/i2c-mpc.c
index cfd074ee6d54..a308afb3cca5 100644
--- a/drivers/i2c/busses/i2c-mpc.c
+++ b/drivers/i2c/busses/i2c-mpc.c
@@ -890,15 +890,13 @@ static int fsl_i2c_probe(struct platform_device *op)
 	return result;
 };
 
-static int fsl_i2c_remove(struct platform_device *op)
+static void fsl_i2c_remove(struct platform_device *op)
 {
 	struct mpc_i2c *i2c = platform_get_drvdata(op);
 
 	i2c_del_adapter(&i2c->adap);
 
 	clk_disable_unprepare(i2c->clk_per);
-
-	return 0;
 };
 
 static int __maybe_unused mpc_i2c_suspend(struct device *dev)
@@ -959,7 +957,7 @@ MODULE_DEVICE_TABLE(of, mpc_i2c_of_match);
 /* Structure for a device driver */
 static struct platform_driver mpc_i2c_driver = {
 	.probe		= fsl_i2c_probe,
-	.remove		= fsl_i2c_remove,
+	.remove_new	= fsl_i2c_remove,
 	.driver = {
 		.name = DRV_NAME,
 		.of_match_table = mpc_i2c_of_match,
-- 
2.39.2

