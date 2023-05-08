Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10B806FB8F3
	for <lists+linux-i2c@lfdr.de>; Mon,  8 May 2023 22:54:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233752AbjEHUy0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 May 2023 16:54:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233913AbjEHUyN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 May 2023 16:54:13 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23C1F72A6
        for <linux-i2c@vger.kernel.org>; Mon,  8 May 2023 13:53:55 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rV-0004Mr-Uf; Mon, 08 May 2023 22:53:37 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rT-0024w4-OZ; Mon, 08 May 2023 22:53:35 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rS-002YaM-Ix; Mon, 08 May 2023 22:53:34 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Vadim Pasternak <vadimp@nvidia.com>,
        Michael Shych <michaelsh@nvidia.com>,
        Peter Rosin <peda@axentia.se>, Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 87/89] i2c: mux: mlxcpld: Convert to platform remove callback returning void
Date:   Mon,  8 May 2023 22:53:04 +0200
Message-Id: <20230508205306.1474415-88-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1631; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=giO2XrJ4Y8mK2CsSFIahWYMg1GpgpYn8U/aAD3cb1KY=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkWWEZK0NGg11GG96c5LblVM0FzaxY5Oox/ot9/ ilI2RI49AOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFlhGQAKCRCPgPtYfRL+ TjbNCACl0GMeaOs2zd64v7gDXwU9KPQojxNeoBk5QtlYZ3rn+hQXVxKCVH6HXkDPKiuPsyBhm5H D2op9vFI4XwdyVmBTsaDyDOor5A5VPa+ohyTcWClmO2rcgX95QZhz+9VDwLcuAAi+vbbCXz59gg t+/lSa6x44zYaNKoZZD1cHQ5QWouxurNxD9zqoQrCXKSWiV/3+OnhUWNsnen1HQ7A+wehDrpS75 nx1w6i3P4m6ouiqkoynn8N+VIa6ANe1sjuQVC3O1jgj7QXtAP+vtaG2ukzXCW5Ia/6HZMOuhhgz c6y9TKSkluH5Ph18M9gWJqXPBeWi65Hmq5qRdh+NwR44wqJg
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
 drivers/i2c/muxes/i2c-mux-mlxcpld.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/muxes/i2c-mux-mlxcpld.c b/drivers/i2c/muxes/i2c-mux-mlxcpld.c
index 1a879f6a31ef..3dda00f1df78 100644
--- a/drivers/i2c/muxes/i2c-mux-mlxcpld.c
+++ b/drivers/i2c/muxes/i2c-mux-mlxcpld.c
@@ -170,12 +170,11 @@ static int mlxcpld_mux_probe(struct platform_device *pdev)
 	return err;
 }
 
-static int mlxcpld_mux_remove(struct platform_device *pdev)
+static void mlxcpld_mux_remove(struct platform_device *pdev)
 {
 	struct i2c_mux_core *muxc = platform_get_drvdata(pdev);
 
 	i2c_mux_del_adapters(muxc);
-	return 0;
 }
 
 static struct platform_driver mlxcpld_mux_driver = {
@@ -183,7 +182,7 @@ static struct platform_driver mlxcpld_mux_driver = {
 		.name = "i2c-mux-mlxcpld",
 	},
 	.probe = mlxcpld_mux_probe,
-	.remove = mlxcpld_mux_remove,
+	.remove_new = mlxcpld_mux_remove,
 };
 
 module_platform_driver(mlxcpld_mux_driver);
-- 
2.39.2

