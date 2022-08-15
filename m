Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F265592AC6
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Aug 2022 10:06:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241105AbiHOIDJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 15 Aug 2022 04:03:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241377AbiHOICx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 15 Aug 2022 04:02:53 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A73C1AD95
        for <linux-i2c@vger.kernel.org>; Mon, 15 Aug 2022 01:02:52 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1oNV3h-0001xB-4b; Mon, 15 Aug 2022 10:02:49 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1oNV3d-003sP3-NT; Mon, 15 Aug 2022 10:02:48 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1oNV3f-00BoQo-A0; Mon, 15 Aug 2022 10:02:47 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org
Subject: [PATCH v2 2/6] leds: lm3697: Remove duplicated error reporting in .remove()
Date:   Mon, 15 Aug 2022 10:02:26 +0200
Message-Id: <20220815080230.37408-3-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220815080230.37408-1-u.kleine-koenig@pengutronix.de>
References: <20220815080230.37408-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1273; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=49m5Mlz/xntnovFLTKtruR/PsCk3+nd04qGYhuWz6fU=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBi+f2A86TlETl9BfwwQeug3nbHFGqn+0QXz3cpjTqs 926TS7aJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYvn9gAAKCRDB/BR4rcrsCbLsB/ 9ZXK1Nv+IeqRtr4AvSiqHBuNFiaR3LUMDUeaGDIjLJuD25BeiCBmna4IXr97f9+UAXPCatIKJoKpyz pAraBqbTtuBx5z28m/xXTJuy7kcNymXpmT07I4dlhg9u4dvuSWgJXZuEOUAWk0N+thTsgmWGwW1tT0 0mk0KIlXuH+tF0kWGnedzvYTPKoI6R7AsFiqG4GDTLJG6yMCIRWjhlKpfQD4Rw060G95SJIXQkVrC7 SbzMn/G5KqIW6NwQHUhdKT7cII2a024K2Y7gnFNAlneDG6qHpg1sKaS/cQN3N5+o+PmyLijd39ss29 v55OPKmKy3U9H0XQ3t0y3jOQKlVDSC
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

Returning an error value from an i2c remove callback results in an error
message being emitted by the i2c core, but otherwise it doesn't make a
difference. The device goes away anyhow and the devm cleanups are
called.

As lm3697_remove() already emits an error message on failure and the
additional error message by the i2c core doesn't add any useful
information, don't pass the error value up the stack. Instead continue
to clean up and return 0.

This patch is a preparation for making i2c remove callbacks return void.

Acked-by: Pavel Machek <pavel@ucw.cz>
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/leds/leds-lm3697.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/leds/leds-lm3697.c b/drivers/leds/leds-lm3697.c
index a8c9322558cc..3ecf90fbc06c 100644
--- a/drivers/leds/leds-lm3697.c
+++ b/drivers/leds/leds-lm3697.c
@@ -345,10 +345,8 @@ static int lm3697_remove(struct i2c_client *client)
 
 	ret = regmap_update_bits(led->regmap, LM3697_CTRL_ENABLE,
 				 LM3697_CTRL_A_B_EN, 0);
-	if (ret) {
+	if (ret)
 		dev_err(dev, "Failed to disable the device\n");
-		return ret;
-	}
 
 	if (led->enable_gpio)
 		gpiod_direction_output(led->enable_gpio, 0);
-- 
2.36.1

