Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B4296FB8B5
	for <lists+linux-i2c@lfdr.de>; Mon,  8 May 2023 22:53:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233434AbjEHUxo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 May 2023 16:53:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233361AbjEHUxc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 May 2023 16:53:32 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 254C85BB5
        for <linux-i2c@vger.kernel.org>; Mon,  8 May 2023 13:53:28 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rG-0003Xy-U7; Mon, 08 May 2023 22:53:22 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rF-0024s2-E0; Mon, 08 May 2023 22:53:21 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rE-002YXG-PF; Mon, 08 May 2023 22:53:20 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Vadim Pasternak <vadimp@nvidia.com>,
        Michael Shych <michaelsh@nvidia.com>,
        Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 39/89] i2c: mlxcpld: Convert to platform remove callback returning void
Date:   Mon,  8 May 2023 22:52:16 +0200
Message-Id: <20230508205306.1474415-40-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1552; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=B7hailbmtCqldmrTXSSOilpW9h1f2QMiPxHHAayQS68=; b=owGbwMvMwMXY3/A7olbonx/jabUkhpTIhGsmuv5SdfEbJD70hm4P7Xh0Y+6Jf9wJC9+1fVN/s lHvTohTJ6MxCwMjF4OsmCKLfeOaTKsqucjOtf8uwwxiZQKZwsDFKQATkdzJwTDNnEdi9WNlLa2Z jAL+x3Vs321xerxUX+z36mdeNd/u9kuzCt2Ttyu7dnqSXGtrfKlzR1OjZGVfzcaeilWp/UwhbRd d7zZOMl0kufHs/qaS/xd2hs4VYpBMat10dYJBYc77WKVWwfbWy3tUdIV3cq7ldiss6xT76yv8oG v1C5uOQzsXlThH71LJD+BxOjmJ7+/qkJdMiX3avY91Vlyu85xwJ/HYM8m/GVtmfNQptvL3PD194 zObJwbfapeXr9krfW/pOs3L7l5zw62uZPyqVEw6Flo05YXYf8/oxzdi1NqORSde8HqlOa9rfefL 2JK93R426QeM843fdigx5N6PMXc4OrFbfu3HsM1vCoVMAA==
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
 drivers/i2c/busses/i2c-mlxcpld.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mlxcpld.c b/drivers/i2c/busses/i2c-mlxcpld.c
index 081f51ef0551..c42fd4b329e4 100644
--- a/drivers/i2c/busses/i2c-mlxcpld.c
+++ b/drivers/i2c/busses/i2c-mlxcpld.c
@@ -571,19 +571,17 @@ static int mlxcpld_i2c_probe(struct platform_device *pdev)
 	return err;
 }
 
-static int mlxcpld_i2c_remove(struct platform_device *pdev)
+static void mlxcpld_i2c_remove(struct platform_device *pdev)
 {
 	struct mlxcpld_i2c_priv *priv = platform_get_drvdata(pdev);
 
 	i2c_del_adapter(&priv->adap);
 	mutex_destroy(&priv->lock);
-
-	return 0;
 }
 
 static struct platform_driver mlxcpld_i2c_driver = {
 	.probe		= mlxcpld_i2c_probe,
-	.remove		= mlxcpld_i2c_remove,
+	.remove_new	= mlxcpld_i2c_remove,
 	.driver = {
 		.name = MLXCPLD_I2C_DEVICE_NAME,
 	},
-- 
2.39.2

