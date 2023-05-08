Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BEA806FB8F0
	for <lists+linux-i2c@lfdr.de>; Mon,  8 May 2023 22:54:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229832AbjEHUyX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 May 2023 16:54:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233333AbjEHUyF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 May 2023 16:54:05 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26A8D5FD8
        for <linux-i2c@vger.kernel.org>; Mon,  8 May 2023 13:53:50 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rS-00044N-08; Mon, 08 May 2023 22:53:34 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rR-0024vT-3W; Mon, 08 May 2023 22:53:33 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rQ-002YZv-Ey; Mon, 08 May 2023 22:53:32 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Andi Shyti <andi.shyti@kernel.org>,
        Wei Chen <harperchen1110@gmail.com>,
        Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 80/89] i2c: xgene-slimpro: Convert to platform remove callback returning void
Date:   Mon,  8 May 2023 22:52:57 +0200
Message-Id: <20230508205306.1474415-81-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1926; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=n9BvrFcpYurdlT9IB2Id6M0wU485XAhlO0LL9VVSLBY=; b=owGbwMvMwMXY3/A7olbonx/jabUkhpTIRMHT/EbqJ67U2ifYGm6buS6i64t75L8k/RMezy4/C TH3Of22k9GYhYGRi0FWTJHFvnFNplWVXGTn2n+XYQaxMoFMYeDiFICJPGth/x/b6Pn8t/wxmyue 99VPftxhLMmz+KNTdcJUhZUrZi345aXKWxfibbTOKn4p41nbS3pPZ9R+5eq+XxNRvdTilkrtnkP csoJJU447hC5vNN/Csm2mzNKa2S5p29WXfg26mxGjy18mtmsRn5oEJ+tS/V1OXE1NzNqXXYSFK2 W1dj+aFejtzptv2f5tx2f5CqaaqR3Rv+ZJHbVVfLTFXdz0jODRcv7sc16Gnys3zxL7nCHByfN+W v4T6YZryqaOJqzTq5odddiCt/9cIV73K8hO2oCjN6llUZ/q/2l8H9TN5K+w+azK2pygIaRg6Mez zNVncoTN0/qbO3ZmzhYsiV0SpaDvpDjz9cad1dNfHq4GAA==
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
 drivers/i2c/busses/i2c-xgene-slimpro.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xgene-slimpro.c b/drivers/i2c/busses/i2c-xgene-slimpro.c
index 3538d36368a9..fbc1ffbd2fa7 100644
--- a/drivers/i2c/busses/i2c-xgene-slimpro.c
+++ b/drivers/i2c/busses/i2c-xgene-slimpro.c
@@ -560,7 +560,7 @@ static int xgene_slimpro_i2c_probe(struct platform_device *pdev)
 	return rc;
 }
 
-static int xgene_slimpro_i2c_remove(struct platform_device *pdev)
+static void xgene_slimpro_i2c_remove(struct platform_device *pdev)
 {
 	struct slimpro_i2c_dev *ctx = platform_get_drvdata(pdev);
 
@@ -570,8 +570,6 @@ static int xgene_slimpro_i2c_remove(struct platform_device *pdev)
 		mbox_free_channel(ctx->mbox_chan);
 	else
 		pcc_mbox_free_channel(ctx->pcc_chan);
-
-	return 0;
 }
 
 static const struct of_device_id xgene_slimpro_i2c_dt_ids[] = {
@@ -591,7 +589,7 @@ MODULE_DEVICE_TABLE(acpi, xgene_slimpro_i2c_acpi_ids);
 
 static struct platform_driver xgene_slimpro_i2c_driver = {
 	.probe	= xgene_slimpro_i2c_probe,
-	.remove	= xgene_slimpro_i2c_remove,
+	.remove_new = xgene_slimpro_i2c_remove,
 	.driver	= {
 		.name	= "xgene-slimpro-i2c",
 		.of_match_table = of_match_ptr(xgene_slimpro_i2c_dt_ids),
-- 
2.39.2

