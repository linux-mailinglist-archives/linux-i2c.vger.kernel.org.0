Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF9266FB8E6
	for <lists+linux-i2c@lfdr.de>; Mon,  8 May 2023 22:54:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233744AbjEHUyS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 May 2023 16:54:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233802AbjEHUyB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 May 2023 16:54:01 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4391383E0
        for <linux-i2c@vger.kernel.org>; Mon,  8 May 2023 13:53:46 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rU-0004Gd-HP; Mon, 08 May 2023 22:53:36 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rS-0024vo-M5; Mon, 08 May 2023 22:53:34 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rR-002YaB-Nh; Mon, 08 May 2023 22:53:33 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Peter Rosin <peda@axentia.se>, Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 84/89] i2c: mux: demux-pinctrl: Convert to platform remove callback returning void
Date:   Mon,  8 May 2023 22:53:01 +0200
Message-Id: <20230508205306.1474415-85-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1892; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=Cf1Agvf9QCjSZ8MzLYcynE1qWhA5gbkX1/K1cTrKmz8=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkWWEVIwPP+GwYe6bOmS1tqeGpI3gf/zKgcuy3B /BkNXe5jgiJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFlhFQAKCRCPgPtYfRL+ TkaFB/99Tm/v20rbee2yOMwo1UHtV0Jg53W4Q0BgobkX37arl0pxY27L8o3tNv/iKD1Hrn5yHUN 7a4ENj3dDGrj3W8VtHWmVYH7xiWphwEafDhUqCUQZz3LB2QucdUh591/nsIHtua4LJKvvjdehAD CmSBG3L3+EGcoDBRWqny5R++r3GX89AvYaMC6ltQQEkJE2SxeIyucmIBoMtBkfPsK9fpyYFdm9Y J7TeAJLIrcXIi2d8XWzyFRyv/3fjaFHMi+037pqfVpNrViU4uoR/P1piCnKuNFoTqHuQ7cZZhP5 5NRSjJ/Fl4DMETkKvH1iolLL/iVEyeexSaqqwEuBqOt6yL4H
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
 drivers/i2c/muxes/i2c-demux-pinctrl.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/muxes/i2c-demux-pinctrl.c b/drivers/i2c/muxes/i2c-demux-pinctrl.c
index f7a7405d4350..a3a122fae71e 100644
--- a/drivers/i2c/muxes/i2c-demux-pinctrl.c
+++ b/drivers/i2c/muxes/i2c-demux-pinctrl.c
@@ -282,7 +282,7 @@ static int i2c_demux_pinctrl_probe(struct platform_device *pdev)
 	return err;
 }
 
-static int i2c_demux_pinctrl_remove(struct platform_device *pdev)
+static void i2c_demux_pinctrl_remove(struct platform_device *pdev)
 {
 	struct i2c_demux_pinctrl_priv *priv = platform_get_drvdata(pdev);
 	int i;
@@ -296,8 +296,6 @@ static int i2c_demux_pinctrl_remove(struct platform_device *pdev)
 		of_node_put(priv->chan[i].parent_np);
 		of_changeset_destroy(&priv->chan[i].chgset);
 	}
-
-	return 0;
 }
 
 static const struct of_device_id i2c_demux_pinctrl_of_match[] = {
@@ -312,7 +310,7 @@ static struct platform_driver i2c_demux_pinctrl_driver = {
 		.of_match_table = i2c_demux_pinctrl_of_match,
 	},
 	.probe	= i2c_demux_pinctrl_probe,
-	.remove	= i2c_demux_pinctrl_remove,
+	.remove_new = i2c_demux_pinctrl_remove,
 };
 module_platform_driver(i2c_demux_pinctrl_driver);
 
-- 
2.39.2

