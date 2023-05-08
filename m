Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30D736FB8D6
	for <lists+linux-i2c@lfdr.de>; Mon,  8 May 2023 22:54:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233678AbjEHUyG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 May 2023 16:54:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233816AbjEHUxv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 May 2023 16:53:51 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA2717EFE
        for <linux-i2c@vger.kernel.org>; Mon,  8 May 2023 13:53:37 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rQ-0003zy-7P; Mon, 08 May 2023 22:53:32 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rP-0024uv-Ef; Mon, 08 May 2023 22:53:31 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw7rO-002YZU-FS; Mon, 08 May 2023 22:53:30 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 73/89] i2c: tegra-bpmp: Convert to platform remove callback returning void
Date:   Mon,  8 May 2023 22:52:50 +0200
Message-Id: <20230508205306.1474415-74-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1717; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=SLXlGEU1aD/4Xi0+zycENOzM2SgYqOnUNRZtgzmKSyU=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkWWEJyjbKujiKD7LyAT56k9EOqJYY3a0Q8MnD2 ZScry1Xo/OJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFlhCQAKCRCPgPtYfRL+ TleyCACBDdvgHDQid1DcZkdurL5gy6JecJQE0rZAzC/gNlW0/GZMWFjwiEW+yt+hQOb+5ZwYW7x ZvwKLVfGjBl+T8wmMfTvgXB4CoOseWWyw0AMwPI0crdA8qcGVgLHTdZJtl/OHi0q4nBPD99bYRA vfZermi2c0AHMIYzDFiRo+kBFVhyigX0s4oZhDozum67XBKk3gVJtRW9R4H6ptzzS/Gr7AY0sr1 5sHuMSoT7jtOzWMWaciaaWoeOV2RwsCPjtpY9Tv8NhuxK++9eqBCEL2e0EeG1z9GKfJ2EED6uU6 zx8RZgz/eEI6oA1U6URhJgU3k0Fl/zdf1t+bHBPqTJ8iSHAM
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
 drivers/i2c/busses/i2c-tegra-bpmp.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra-bpmp.c b/drivers/i2c/busses/i2c-tegra-bpmp.c
index 95139985b2d5..bc3f94561746 100644
--- a/drivers/i2c/busses/i2c-tegra-bpmp.c
+++ b/drivers/i2c/busses/i2c-tegra-bpmp.c
@@ -316,13 +316,11 @@ static int tegra_bpmp_i2c_probe(struct platform_device *pdev)
 	return i2c_add_adapter(&i2c->adapter);
 }
 
-static int tegra_bpmp_i2c_remove(struct platform_device *pdev)
+static void tegra_bpmp_i2c_remove(struct platform_device *pdev)
 {
 	struct tegra_bpmp_i2c *i2c = platform_get_drvdata(pdev);
 
 	i2c_del_adapter(&i2c->adapter);
-
-	return 0;
 }
 
 static const struct of_device_id tegra_bpmp_i2c_of_match[] = {
@@ -337,7 +335,7 @@ static struct platform_driver tegra_bpmp_i2c_driver = {
 		.of_match_table = tegra_bpmp_i2c_of_match,
 	},
 	.probe = tegra_bpmp_i2c_probe,
-	.remove = tegra_bpmp_i2c_remove,
+	.remove_new = tegra_bpmp_i2c_remove,
 };
 module_platform_driver(tegra_bpmp_i2c_driver);
 
-- 
2.39.2

