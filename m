Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1DD696FB8DA
	for <lists+linux-i2c@lfdr.de>; Mon,  8 May 2023 22:54:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233559AbjEHUyH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 May 2023 16:54:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233845AbjEHUxw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 May 2023 16:53:52 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8754E6A7A
        for <linux-i2c@vger.kernel.org>; Mon,  8 May 2023 13:53:39 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rQ-0003zp-6b; Mon, 08 May 2023 22:53:32 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rP-0024ut-DP; Mon, 08 May 2023 22:53:31 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rO-002YZX-NV; Mon, 08 May 2023 22:53:30 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Laxman Dewangan <ldewangan@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Wolfram Sang <wsa@kernel.org>
Cc:     Dmitry Osipenko <digetx@gmail.com>, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 74/89] i2c: tegra: Convert to platform remove callback returning void
Date:   Mon,  8 May 2023 22:52:51 +0200
Message-Id: <20230508205306.1474415-75-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1791; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=5dFdtDxPSfyfuGguJwfFyjoSnal/WyVbr1/iYYRvHJE=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkWWEKbro222TdA0Vaa6dp7WNuvJO9dROS643Yd t8omfvm6ImJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFlhCgAKCRCPgPtYfRL+ TuyXB/9IMBegMT+wpccs19c9Dd7Y9npNPXsWi7yoBKFUzsAvwSSBSk5H6Vs1UQTl2RidctMPB3O XAuZyanUS8Hgxv77PYiVJrRXRA3Wyan0sdHhDA11srgQpPZOV8tFW+dDD1r5dMYwAWtc+khgq61 uTPCd/Y6MXTvIUDv0lO0CdovLbA44ZUMbCuB+ILaRhEQbt4b4j1xvKz+L/+xpztdE7Xg2pLKzvv J123QhZNCrEtOCMoj7aevQ8K7yOOlx1CLVV/PR1otY4aAAfNGuXUV9loVV8n5fTlvfZ+nuo/mvR PunFX4Xf3Upd4kGDc1C5NcRLqProAgvCDF96yj7RkAei2lVe
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
 drivers/i2c/busses/i2c-tegra.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 157066f06a32..a82d264bf73d 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1868,7 +1868,7 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 	return err;
 }
 
-static int tegra_i2c_remove(struct platform_device *pdev)
+static void tegra_i2c_remove(struct platform_device *pdev)
 {
 	struct tegra_i2c_dev *i2c_dev = platform_get_drvdata(pdev);
 
@@ -1877,8 +1877,6 @@ static int tegra_i2c_remove(struct platform_device *pdev)
 
 	tegra_i2c_release_dma(i2c_dev);
 	tegra_i2c_release_clocks(i2c_dev);
-
-	return 0;
 }
 
 static int __maybe_unused tegra_i2c_runtime_resume(struct device *dev)
@@ -1987,7 +1985,7 @@ MODULE_DEVICE_TABLE(acpi, tegra_i2c_acpi_match);
 
 static struct platform_driver tegra_i2c_driver = {
 	.probe = tegra_i2c_probe,
-	.remove = tegra_i2c_remove,
+	.remove_new = tegra_i2c_remove,
 	.driver = {
 		.name = "tegra-i2c",
 		.of_match_table = tegra_i2c_of_match,
-- 
2.39.2

