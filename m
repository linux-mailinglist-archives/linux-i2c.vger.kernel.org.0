Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA8BE6FB89C
	for <lists+linux-i2c@lfdr.de>; Mon,  8 May 2023 22:53:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229539AbjEHUx3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 May 2023 16:53:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232966AbjEHUxX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 May 2023 16:53:23 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5CC05FC5
        for <linux-i2c@vger.kernel.org>; Mon,  8 May 2023 13:53:21 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rA-00039x-Hy; Mon, 08 May 2023 22:53:16 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7r9-0024qg-SX; Mon, 08 May 2023 22:53:15 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7r9-002YW5-3p; Mon, 08 May 2023 22:53:15 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Wolfram Sang <wsa@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 21/89] i2c: emev2: Convert to platform remove callback returning void
Date:   Mon,  8 May 2023 22:51:58 +0200
Message-Id: <20230508205306.1474415-22-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1645; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=FPTyX0G4ESIFjHVwze4rNqY7B7Radbhu85DHGGhmgf0=; b=owGbwMvMwMXY3/A7olbonx/jabUkhpTIhNY7LifsZq13lDTkSUlTriuqOiY385JXw03RP8ejn Sfkck7vZDRmYWDkYpAVU2Sxb1yTaVUlF9m59t9lmEGsTCBTGLg4BWAiRhUcDJvr83ZMtspfGNdf cGfWpStJX5dxnPS6mGxxMVRryRaurnXPRRLF3BOfXbXusJmwu0BaJ1tDXLhJVvf+kz0fS5MjT3z ds29b6O+2H6n3PE/MkIi39/Ca9u7Tznh22TrBpK4XOQdZL738nZTIoGemYTJB+Y6W4zTn59OOLb p5UCLrhZwR8wKJ1He19kdD97O07rT7b/de6tqdSbMfCXGlaX5Kr/wTL35B9oxljqP3w9NOTekcH t+ln1gwvX8iMjOq4Ouv5GL9d5d8DB5OF49+9Ue57m2iBt+RdsciiyQjT39pceYjqlGldnYrb+qs //fKtc3ZVDW7JN/luLdZklWQk5dr13rx9wY5W5Qqp64EAA==
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
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
 drivers/i2c/busses/i2c-emev2.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-emev2.c b/drivers/i2c/busses/i2c-emev2.c
index f2e537b137b2..4ba93cd91c0f 100644
--- a/drivers/i2c/busses/i2c-emev2.c
+++ b/drivers/i2c/busses/i2c-emev2.c
@@ -419,14 +419,12 @@ static int em_i2c_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int em_i2c_remove(struct platform_device *dev)
+static void em_i2c_remove(struct platform_device *dev)
 {
 	struct em_i2c_device *priv = platform_get_drvdata(dev);
 
 	i2c_del_adapter(&priv->adap);
 	clk_disable_unprepare(priv->sclk);
-
-	return 0;
 }
 
 static const struct of_device_id em_i2c_ids[] = {
@@ -436,7 +434,7 @@ static const struct of_device_id em_i2c_ids[] = {
 
 static struct platform_driver em_i2c_driver = {
 	.probe = em_i2c_probe,
-	.remove = em_i2c_remove,
+	.remove_new = em_i2c_remove,
 	.driver = {
 		.name = "em-i2c",
 		.of_match_table = em_i2c_ids,
-- 
2.39.2

