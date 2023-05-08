Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB2006FB8ED
	for <lists+linux-i2c@lfdr.de>; Mon,  8 May 2023 22:54:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233826AbjEHUyW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 May 2023 16:54:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233833AbjEHUyD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 May 2023 16:54:03 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E580176AC
        for <linux-i2c@vger.kernel.org>; Mon,  8 May 2023 13:53:47 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rL-0003qy-Ap; Mon, 08 May 2023 22:53:27 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rK-0024tI-Gw; Mon, 08 May 2023 22:53:26 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rJ-002YYA-9n; Mon, 08 May 2023 22:53:25 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Michael Ellerman <mpe@ellerman.id.au>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Sebastian Reichel <sre@kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Wolfram Sang <wsa@kernel.org>
Cc:     Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        linux-i2c@vger.kernel.org,
        "open list:LINUX FOR POWERPC" <linuxppc-dev@lists.ozlabs.org>,
        kernel@pengutronix.de
Subject: [PATCH 53/89] i2c: powermac: Convert to platform remove callback returning void
Date:   Mon,  8 May 2023 22:52:30 +0200
Message-Id: <20230508205306.1474415-54-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1734; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=1RpHW6CYtYz3SaLSfgcjFcUEkufCdwrM3bNZvPbzXVg=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkWWDx0AXsVGRyMcyPwf9nr7E1ThaOR/BSdIwkd 9zLhc7PAiuJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFlg8QAKCRCPgPtYfRL+ TikjCAChM2gHPP8/cYQIbHrF7+tbfIrsyWvDfP5pbZQHuInX7sJoVUEMr5OPlDYIqKOfKO2gwrw xSH0XQh6Rd7aAIA0zHgQYZs7kXw3XM6BCp68YrTwqqsyddBv5dksNKIcelfGkWIdpgB4SVqSiTz XIH3FZu35s/wGuB9v9ShW/olKqaCu6WwLv0dAT2ushLJUd0pfO7MYuPpuaUqsQelicP+g8i2P2o UeXrCZ7wDkSfRFaM8EYiaSvkeVJThs9+lyqq7hEuiia0fiw8rzzK7djyHF++Os6RrB/FDq2dXkj 0f8brWHmivXn4mHr4klo1OFisyjXpKMxmcB1tEATEJnZ7gYv
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
 drivers/i2c/busses/i2c-powermac.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-powermac.c b/drivers/i2c/busses/i2c-powermac.c
index ec706a3aba26..4996a628fdae 100644
--- a/drivers/i2c/busses/i2c-powermac.c
+++ b/drivers/i2c/busses/i2c-powermac.c
@@ -188,14 +188,12 @@ static const struct i2c_adapter_quirks i2c_powermac_quirks = {
 	.max_num_msgs = 1,
 };
 
-static int i2c_powermac_remove(struct platform_device *dev)
+static void i2c_powermac_remove(struct platform_device *dev)
 {
 	struct i2c_adapter	*adapter = platform_get_drvdata(dev);
 
 	i2c_del_adapter(adapter);
 	memset(adapter, 0, sizeof(*adapter));
-
-	return 0;
 }
 
 static u32 i2c_powermac_get_addr(struct i2c_adapter *adap,
@@ -439,7 +437,7 @@ static int i2c_powermac_probe(struct platform_device *dev)
 
 static struct platform_driver i2c_powermac_driver = {
 	.probe = i2c_powermac_probe,
-	.remove = i2c_powermac_remove,
+	.remove_new = i2c_powermac_remove,
 	.driver = {
 		.name = "i2c-powermac",
 		.bus = &platform_bus_type,
-- 
2.39.2

